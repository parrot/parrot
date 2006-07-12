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
     LOADLIB = 349,
     UNIQUE_REG = 350,
     LABEL = 351,
     EMIT = 352,
     EOM = 353,
     IREG = 354,
     NREG = 355,
     SREG = 356,
     PREG = 357,
     IDENTIFIER = 358,
     REG = 359,
     MACRO = 360,
     ENDM = 361,
     STRINGC = 362,
     INTC = 363,
     FLOATC = 364,
     USTRINGC = 365,
     PARROT_OP = 366,
     VAR = 367,
     LINECOMMENT = 368,
     FILECOMMENT = 369,
     DOT = 370,
     CONCAT = 371,
     POINTY = 372
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
#define LOADLIB 349
#define UNIQUE_REG 350
#define LABEL 351
#define EMIT 352
#define EOM 353
#define IREG 354
#define NREG 355
#define SREG 356
#define PREG 357
#define IDENTIFIER 358
#define REG 359
#define MACRO 360
#define ENDM 361
#define STRINGC 362
#define INTC 363
#define FLOATC 364
#define USTRINGC 365
#define PARROT_OP 366
#define VAR 367
#define LINECOMMENT 368
#define FILECOMMENT 369
#define DOT 370
#define CONCAT 371
#define POINTY 372




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
#include "parrot/dynext.h"
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
    i->line = line;
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

static void 
do_loadlib(Interp *interp, char *lib) 
{
    STRING *s = string_from_cstring(interp, lib + 1, strlen(lib) - 2);
    Parrot_load_lib(interp, s, NULL);
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
#line 396 "compilers/imcc/imcc.y"
typedef union YYSTYPE {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} YYSTYPE;
/* Line 191 of yacc.c.  */
#line 712 "compilers/imcc/imcparser.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 214 of yacc.c.  */
#line 724 "compilers/imcc/imcparser.c"

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
#define YYFINAL  44
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   764

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  134
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  117
/* YYNRULES -- Number of rules. */
#define YYNRULES  337
/* YYNRULES -- Number of states. */
#define YYNSTATES  587

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   372

#define YYTRANSLATE(YYX) 						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   124,     2,     2,     2,   130,   131,     2,
     122,   123,   128,   127,     2,   125,     2,   129,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   133,
       2,   119,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   120,     2,   121,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   132,     2,   126,     2,     2,     2,
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
     116,   117,   118
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    25,    27,    29,    33,    36,    40,    43,    48,
      53,    57,    63,    64,    71,    72,    79,    81,    83,    85,
      88,    92,    95,    97,    99,   101,   103,   105,   106,   110,
     111,   116,   119,   124,   125,   127,   128,   133,   134,   136,
     140,   144,   145,   146,   147,   148,   159,   160,   162,   166,
     167,   171,   175,   181,   182,   184,   189,   194,   199,   200,
     204,   206,   208,   210,   212,   214,   216,   218,   222,   223,
     225,   226,   227,   228,   239,   240,   250,   251,   254,   255,
     259,   260,   262,   264,   268,   270,   272,   274,   276,   278,
     280,   282,   284,   286,   292,   296,   300,   304,   308,   314,
     320,   321,   325,   328,   329,   333,   337,   338,   343,   344,
     347,   349,   351,   353,   355,   360,   362,   364,   366,   368,
     370,   371,   377,   379,   380,   383,   387,   391,   392,   398,
     399,   405,   406,   408,   412,   416,   422,   424,   427,   428,
     431,   434,   436,   438,   439,   441,   444,   446,   448,   452,
     454,   458,   461,   463,   465,   467,   470,   473,   474,   479,
     484,   485,   492,   494,   495,   502,   505,   508,   511,   514,
     516,   518,   520,   521,   523,   525,   527,   529,   531,   533,
     535,   539,   544,   549,   554,   560,   566,   572,   578,   584,
     590,   596,   602,   608,   614,   620,   626,   632,   638,   644,
     650,   656,   662,   668,   674,   680,   686,   692,   699,   706,
     713,   721,   726,   731,   738,   745,   753,   758,   763,   768,
     773,   780,   788,   792,   793,   803,   805,   807,   809,   813,
     814,   820,   824,   828,   832,   836,   840,   844,   848,   852,
     856,   860,   864,   868,   872,   877,   879,   881,   883,   885,
     889,   893,   897,   899,   901,   902,   908,   909,   913,   915,
     921,   925,   928,   929,   932,   934,   936,   941,   944,   948,
     954,   956,   960,   961,   968,   975,   981,   987,   992,   997,
    1002,  1007,  1009,  1011,  1013,  1015,  1017,  1019,  1021,  1023,
    1024,  1026,  1030,  1032,  1034,  1039,  1043,  1045,  1047,  1049,
    1051,  1053,  1055,  1057,  1059,  1061,  1063,  1065,  1066,  1069,
    1071,  1075,  1076,  1081,  1083,  1087,  1090,  1093,  1095,  1097,
    1099,  1101,  1103,  1105,  1107,  1109,  1111,  1113
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     135,     0,    -1,   136,    -1,   137,    -1,   136,   137,    -1,
     156,    -1,   142,    -1,   141,    -1,   158,    -1,   172,    -1,
     153,    -1,   106,     4,    -1,   138,    -1,     4,    -1,     6,
     139,     4,    -1,   140,     4,    -1,    95,   108,     4,    -1,
       7,   109,    -1,     8,   108,    72,   108,    -1,     9,   109,
      72,   109,    -1,    61,   214,   104,    -1,    61,   214,   104,
     119,   249,    -1,    -1,    29,   143,   214,   104,   119,   249,
      -1,    -1,    29,   145,   109,   241,   119,   146,    -1,   108,
      -1,   111,    -1,   148,    -1,   147,   148,    -1,   204,   149,
       4,    -1,   106,     4,    -1,   115,    -1,   114,    -1,   156,
      -1,   144,    -1,   138,    -1,    -1,   150,   112,   152,    -1,
      -1,    78,   151,   180,    97,    -1,    14,   242,    -1,    28,
     108,    72,   105,    -1,    -1,   235,    -1,    -1,    98,   154,
     155,    99,    -1,    -1,   147,    -1,    22,   157,     4,    -1,
     120,   243,   121,    -1,    -1,    -1,    -1,    -1,    25,   159,
     238,   160,   180,     4,   161,   162,   171,    73,    -1,    -1,
       4,    -1,   162,   163,     4,    -1,    -1,     5,   164,   165,
      -1,   214,   104,   189,    -1,   214,   108,    20,   104,   189,
      -1,    -1,    72,    -1,    94,   122,   169,   123,    -1,    92,
     122,   108,   123,    -1,    92,   122,   104,   123,    -1,    -1,
     169,    72,   170,    -1,   170,    -1,    49,    -1,    50,    -1,
      52,    -1,    51,    -1,   104,    -1,   108,    -1,   120,   243,
     121,    -1,    -1,   201,    -1,    -1,    -1,    -1,    78,   173,
     104,   174,   180,     4,   175,   162,   171,    73,    -1,    -1,
      75,     4,   177,   184,   179,   183,   178,   186,    76,    -1,
      -1,   206,     4,    -1,    -1,    85,   242,     4,    -1,    -1,
     181,    -1,   182,    -1,   181,   166,   182,    -1,    87,    -1,
      86,    -1,    88,    -1,    89,    -1,    91,    -1,    90,    -1,
      93,    -1,   167,    -1,   168,    -1,    77,   242,    72,   242,
       4,    -1,    77,   242,     4,    -1,    83,   242,     4,    -1,
      84,   234,     4,    -1,    84,   108,     4,    -1,    84,   234,
      72,   242,     4,    -1,    84,   108,    72,   242,     4,    -1,
      -1,   184,   185,     4,    -1,    11,   227,    -1,    -1,   186,
     187,     4,    -1,    64,   234,   189,    -1,    -1,    27,   188,
     214,   209,    -1,    -1,   189,   190,    -1,    16,    -1,    17,
      -1,    18,    -1,    19,    -1,    19,   122,   108,   123,    -1,
      96,    -1,    79,    -1,    81,    -1,    80,    -1,    82,    -1,
      -1,   191,     4,   194,   195,   192,    -1,   197,    -1,    -1,
     195,     4,    -1,   195,   196,     4,    -1,    65,   242,   228,
      -1,    -1,    65,   122,   198,   200,   123,    -1,    -1,    66,
     122,   199,   200,   123,    -1,    -1,   227,    -1,   108,    20,
     242,    -1,   200,    72,   227,    -1,   200,    72,   108,    20,
     242,    -1,   203,    -1,   201,   203,    -1,    -1,   202,   207,
      -1,   106,     4,    -1,   115,    -1,   114,    -1,    -1,   205,
      -1,   205,   206,    -1,   206,    -1,    97,    -1,   204,   210,
       4,    -1,   209,    -1,   208,    72,   209,    -1,   104,    96,
      -1,   104,    -1,   216,    -1,   232,    -1,    22,   104,    -1,
      23,   104,    -1,    -1,    27,   211,   214,   208,    -1,    28,
     108,    72,   234,    -1,    -1,    29,   212,   214,   104,   119,
     249,    -1,   144,    -1,    -1,    32,   213,   214,   104,   119,
     249,    -1,    65,   224,    -1,    10,   240,    -1,   112,   235,
      -1,    14,   242,    -1,   224,    -1,   176,    -1,   193,    -1,
      -1,    49,    -1,    50,    -1,    51,    -1,    52,    -1,    53,
      -1,   215,    -1,   104,    -1,   234,   119,   242,    -1,   234,
     119,   124,   242,    -1,   234,   119,   125,   242,    -1,   234,
     119,   126,   242,    -1,   234,   119,   242,   127,   242,    -1,
     234,   119,   242,   125,   242,    -1,   234,   119,   242,   128,
     242,    -1,   234,   119,   242,    68,   242,    -1,   234,   119,
     242,   129,   242,    -1,   234,   119,   242,    41,   242,    -1,
     234,   119,   242,   130,   242,    -1,   234,   119,   242,   117,
     242,    -1,   234,   119,   242,    55,   242,    -1,   234,   119,
     242,    56,   242,    -1,   234,   119,   242,    57,   242,    -1,
     234,   119,   242,    59,   242,    -1,   234,   119,   242,    60,
     242,    -1,   234,   119,   242,    58,   242,    -1,   234,   119,
     242,    47,   242,    -1,   234,   119,   242,    48,   242,    -1,
     234,   119,   242,    69,   242,    -1,   234,   119,   242,    70,
     242,    -1,   234,   119,   242,    71,   242,    -1,   234,   119,
     242,    54,   242,    -1,   234,   119,   242,   131,   242,    -1,
     234,   119,   242,   132,   242,    -1,   234,   119,   242,   126,
     242,    -1,   234,   119,   242,   120,   243,   121,    -1,   234,
     120,   243,   121,   119,   242,    -1,   234,   119,    21,   215,
      72,   242,    -1,   234,   119,    21,   215,   120,   243,   121,
      -1,   234,   119,    21,   215,    -1,   234,   119,    21,   242,
      -1,   234,   119,    21,   120,   243,   121,    -1,   234,   119,
      21,   242,    72,   242,    -1,   234,   119,    21,   242,   120,
     243,   121,    -1,   234,   119,    63,   104,    -1,   234,   119,
      62,   250,    -1,    62,   250,   119,   242,    -1,    21,   234,
      72,   242,    -1,    21,   234,    72,   242,    72,   242,    -1,
      21,   234,    72,   242,   120,   243,   121,    -1,   234,   119,
     224,    -1,    -1,   122,   217,   231,   123,   119,   222,   122,
     226,   123,    -1,   218,    -1,   220,    -1,   221,    -1,   234,
     119,    14,    -1,    -1,    67,   219,   122,   231,   123,    -1,
     234,    33,   242,    -1,   234,    34,   242,    -1,   234,    35,
     242,    -1,   234,    36,   242,    -1,   234,    43,   242,    -1,
     234,    42,   242,    -1,   234,    37,   242,    -1,   234,    38,
     242,    -1,   234,    39,   242,    -1,   234,    40,   242,    -1,
     234,    44,   242,    -1,   234,    45,   242,    -1,   234,    46,
     242,    -1,   234,   119,   112,   152,    -1,   104,    -1,   108,
      -1,   111,    -1,   234,    -1,   234,   223,   239,    -1,   234,
     223,   108,    -1,   234,   223,   234,    -1,   118,    -1,   116,
      -1,    -1,   222,   225,   122,   226,   123,    -1,    -1,   226,
      72,   227,    -1,   227,    -1,   226,    72,   108,    20,   242,
      -1,   108,    20,   242,    -1,   242,   228,    -1,    -1,   228,
     229,    -1,    15,    -1,    19,    -1,    19,   122,   108,   123,
      -1,   234,   189,    -1,   231,    72,   230,    -1,   231,    72,
     108,    20,   234,    -1,   230,    -1,   108,    20,   234,    -1,
      -1,    12,   242,   233,   242,    10,   240,    -1,    13,   242,
     233,   242,    10,   240,    -1,    12,    14,   242,    10,   240,
      -1,    13,    14,   242,    10,   240,    -1,    12,   242,    10,
     240,    -1,    13,   242,    10,   240,    -1,    12,   242,    72,
     240,    -1,    13,   242,    72,   240,    -1,    55,    -1,    56,
      -1,    57,    -1,    58,    -1,    59,    -1,    60,    -1,   113,
      -1,   248,    -1,    -1,   236,    -1,   236,    72,   237,    -1,
     237,    -1,   241,    -1,   234,   120,   243,   121,    -1,   120,
     243,   121,    -1,   239,    -1,   108,    -1,   111,    -1,   104,
      -1,   112,    -1,   104,    -1,   112,    -1,   240,    -1,   242,
      -1,   234,    -1,   249,    -1,    -1,   244,   245,    -1,   247,
      -1,   245,   133,   247,    -1,    -1,   245,    72,   246,   247,
      -1,   242,    -1,   242,    74,   242,    -1,    74,   242,    -1,
     242,    74,    -1,   100,    -1,   101,    -1,   102,    -1,   103,
      -1,   105,    -1,   109,    -1,   110,    -1,   108,    -1,   111,
      -1,   102,    -1,   108,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   479,   479,   483,   484,   488,   489,   490,   491,   492,
     493,   494,   495,   496,   499,   500,   501,   504,   512,   521,
     530,   536,   545,   545,   550,   550,   554,   555,   559,   560,
     564,   565,   566,   567,   568,   569,   570,   573,   573,   578,
     577,   588,   590,   595,   599,   603,   603,   613,   615,   619,
     635,   636,   641,   645,   648,   640,   654,   655,   656,   665,
     665,   669,   674,   684,   685,   689,   692,   695,   701,   702,
     703,   707,   708,   709,   710,   711,   721,   731,   734,   736,
     740,   742,   746,   740,   753,   752,   784,   785,   789,   790,
     795,   796,   800,   801,   805,   806,   807,   808,   809,   810,
     811,   812,   813,   817,   822,   824,   829,   831,   833,   837,
     845,   846,   850,   855,   856,   860,   861,   861,   874,   875,
     879,   880,   881,   882,   883,   884,   889,   890,   894,   895,
     900,   899,   904,   910,   911,   914,   920,   925,   924,   932,
     931,   941,   942,   948,   950,   956,   962,   963,   975,   979,
     981,   982,   983,   987,   988,   992,   993,   997,  1003,  1008,
    1015,  1024,  1032,  1042,  1043,  1044,  1045,  1046,  1046,  1061,
    1065,  1065,  1067,  1068,  1068,  1070,  1074,  1075,  1078,  1080,
    1081,  1082,  1083,  1087,  1088,  1089,  1090,  1091,  1092,  1096,
    1107,  1108,  1109,  1110,  1111,  1112,  1113,  1114,  1115,  1116,
    1117,  1118,  1119,  1120,  1121,  1122,  1123,  1124,  1125,  1127,
    1129,  1131,  1133,  1135,  1137,  1139,  1141,  1143,  1145,  1147,
    1149,  1151,  1153,  1155,  1157,  1159,  1161,  1164,  1166,  1170,
    1172,  1174,  1177,  1184,  1183,  1192,  1193,  1194,  1195,  1199,
    1199,  1205,  1207,  1209,  1211,  1213,  1215,  1217,  1219,  1221,
    1223,  1225,  1227,  1229,  1234,  1241,  1242,  1243,  1244,  1249,
    1250,  1251,  1254,  1255,  1260,  1259,  1269,  1270,  1276,  1282,
    1284,  1288,  1292,  1293,  1297,  1298,  1299,  1302,  1306,  1312,
    1314,  1320,  1321,  1325,  1327,  1329,  1331,  1333,  1335,  1337,
    1339,  1344,  1345,  1346,  1347,  1348,  1349,  1353,  1354,  1358,
    1359,  1363,  1364,  1368,  1369,  1375,  1382,  1383,  1384,  1388,
    1389,  1393,  1394,  1398,  1399,  1403,  1404,  1407,  1407,  1412,
    1413,  1415,  1415,  1420,  1425,  1428,  1429,  1433,  1434,  1435,
    1436,  1437,  1441,  1442,  1443,  1444,  1448,  1449
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
  "LOADLIB", "UNIQUE_REG", "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", 
  "PREG", "IDENTIFIER", "REG", "MACRO", "ENDM", "STRINGC", "INTC", 
  "FLOATC", "USTRINGC", "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", 
  "DOT", "CONCAT", "POINTY", "'='", "'['", "']'", "'('", "')'", "'!'", 
  "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", "'&'", "'|'", "';'", 
  "$accept", "program", "compilation_units", "compilation_unit", "pragma", 
  "pragma_1", "hll_def", "global", "constdef", "@1", "pmc_const", "@2", 
  "any_string", "pasmcode", "pasmline", "pasm_inst", "@3", "@4", 
  "pasm_args", "emit", "@5", "opt_pasmcode", "class_namespace", 
  "maybe_keylist", "sub", "@6", "@7", "@8", "sub_params", "sub_param", 
  "@9", "sub_param_type_def", "opt_comma", "multi", "outer", 
  "multi_types", "multi_type", "sub_body", "pcc_sub", "@10", "@11", "@12", 
  "pcc_sub_call", "@13", "opt_label", "opt_invocant", "sub_proto", 
  "sub_proto_list", "proto", "pcc_call", "pcc_args", "pcc_arg", 
  "pcc_results", "pcc_result", "@14", "paramtype_list", "paramtype", 
  "begin_ret_or_yield", "end_ret_or_yield", "pcc_ret", "@15", 
  "pcc_returns", "pcc_return", "pcc_return_many", "@16", "@17", 
  "var_returns", "statements", "helper_clear_state", "statement", 
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
     364,   365,   366,   367,   368,   369,   370,   371,   372,    61,
      91,    93,    40,    41,    33,    45,   126,    43,    42,    47,
      37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   134,   135,   136,   136,   137,   137,   137,   137,   137,
     137,   137,   137,   137,   138,   138,   138,   139,   140,   140,
     141,   141,   143,   142,   145,   144,   146,   146,   147,   147,
     148,   148,   148,   148,   148,   148,   148,   150,   149,   151,
     149,   149,   149,   149,   152,   154,   153,   155,   155,   156,
     157,   157,   159,   160,   161,   158,   162,   162,   162,   164,
     163,   165,   165,   166,   166,   167,   168,   168,   169,   169,
     169,   170,   170,   170,   170,   170,   170,   170,   171,   171,
     173,   174,   175,   172,   177,   176,   178,   178,   179,   179,
     180,   180,   181,   181,   182,   182,   182,   182,   182,   182,
     182,   182,   182,   183,   183,   183,   183,   183,   183,   183,
     184,   184,   185,   186,   186,   187,   188,   187,   189,   189,
     190,   190,   190,   190,   190,   190,   191,   191,   192,   192,
     194,   193,   193,   195,   195,   195,   196,   198,   197,   199,
     197,   200,   200,   200,   200,   200,   201,   201,   202,   203,
     203,   203,   203,   204,   204,   205,   205,   206,   207,   208,
     208,   209,   209,   210,   210,   210,   210,   211,   210,   210,
     212,   210,   210,   213,   210,   210,   210,   210,   210,   210,
     210,   210,   210,   214,   214,   214,   214,   214,   214,   215,
     216,   216,   216,   216,   216,   216,   216,   216,   216,   216,
     216,   216,   216,   216,   216,   216,   216,   216,   216,   216,
     216,   216,   216,   216,   216,   216,   216,   216,   216,   216,
     216,   216,   216,   216,   216,   216,   216,   216,   216,   216,
     216,   216,   216,   217,   216,   216,   216,   216,   216,   219,
     218,   220,   220,   220,   220,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   221,   222,   222,   222,   222,   222,
     222,   222,   223,   223,   225,   224,   226,   226,   226,   226,
     226,   227,   228,   228,   229,   229,   229,   230,   231,   231,
     231,   231,   231,   232,   232,   232,   232,   232,   232,   232,
     232,   233,   233,   233,   233,   233,   233,   234,   234,   235,
     235,   236,   236,   237,   237,   237,   238,   238,   238,   239,
     239,   240,   240,   241,   241,   242,   242,   244,   243,   245,
     245,   246,   245,   247,   247,   247,   247,   248,   248,   248,
     248,   248,   249,   249,   249,   249,   250,   250
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     3,     2,     3,     2,     4,     4,
       3,     5,     0,     6,     0,     6,     1,     1,     1,     2,
       3,     2,     1,     1,     1,     1,     1,     0,     3,     0,
       4,     2,     4,     0,     1,     0,     4,     0,     1,     3,
       3,     0,     0,     0,     0,    10,     0,     1,     3,     0,
       3,     3,     5,     0,     1,     4,     4,     4,     0,     3,
       1,     1,     1,     1,     1,     1,     1,     3,     0,     1,
       0,     0,     0,    10,     0,     9,     0,     2,     0,     3,
       0,     1,     1,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     5,     3,     3,     3,     3,     5,     5,
       0,     3,     2,     0,     3,     3,     0,     4,     0,     2,
       1,     1,     1,     1,     4,     1,     1,     1,     1,     1,
       0,     5,     1,     0,     2,     3,     3,     0,     5,     0,
       5,     0,     1,     3,     3,     5,     1,     2,     0,     2,
       2,     1,     1,     0,     1,     2,     1,     1,     3,     1,
       3,     2,     1,     1,     1,     2,     2,     0,     4,     4,
       0,     6,     1,     0,     6,     2,     2,     2,     2,     1,
       1,     1,     0,     1,     1,     1,     1,     1,     1,     1,
       3,     4,     4,     4,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     6,     6,     6,
       7,     4,     4,     6,     6,     7,     4,     4,     4,     4,
       6,     7,     3,     0,     9,     1,     1,     1,     3,     0,
       5,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     4,     1,     1,     1,     1,     3,
       3,     3,     1,     1,     0,     5,     0,     3,     1,     5,
       3,     2,     0,     2,     1,     1,     4,     2,     3,     5,
       1,     3,     0,     6,     6,     5,     5,     4,     4,     4,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     0,
       1,     3,     1,     1,     4,     3,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     0,     2,     1,
       3,     0,     4,     1,     3,     2,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,     0,    51,    52,    22,     0,    80,
       0,    45,     0,     0,     2,     3,    12,     0,     7,     6,
      10,     5,     8,     9,     0,     0,     0,     0,   317,     0,
       0,     0,   183,   184,   185,   186,   187,   189,     0,   188,
       0,     0,   153,    11,     1,     4,    15,    17,    14,     0,
       0,     0,     0,    49,   309,   307,   308,   310,    53,   306,
       0,    20,    81,    16,    24,   157,     0,    33,    32,    36,
      35,   153,    28,     0,    34,    37,   154,   156,    18,    19,
      50,     0,   327,   328,   329,   330,   331,   334,   332,   333,
     335,   297,   315,   323,   318,   319,   298,   316,    90,     0,
       0,    90,     0,    31,    29,    46,     0,     0,    39,     0,
       0,   155,   325,   326,   321,     0,    95,    94,    96,    97,
      99,    98,     0,   100,     0,   101,   102,     0,    63,    92,
       0,    21,     0,     0,    41,     0,    90,    30,   299,   324,
       0,   320,     0,    68,    54,    64,     0,    23,    82,   311,
     312,   313,     0,   314,     0,     0,   317,    38,   315,    44,
     300,   302,   303,   322,     0,     0,    71,    72,    74,    73,
      75,    76,   317,     0,    70,    56,    93,    56,     0,    42,
      40,     0,   317,     0,    67,    66,     0,     0,    65,    57,
     148,   148,    26,    27,    25,   305,     0,   301,    77,    69,
      59,     0,   152,   151,     0,     0,   148,   153,   146,     0,
     304,     0,   150,    58,    55,   147,   182,   149,    83,    60,
       0,     0,     0,     0,     0,     0,     0,     0,   167,     0,
     170,   173,     0,     0,     0,   239,     0,   126,   127,   255,
     256,   257,   299,   233,   172,   180,     0,   181,   132,     0,
     163,   235,   236,   237,   264,   179,   164,   258,   118,     0,
     176,     0,     0,     0,     0,   178,     0,   165,   166,     0,
       0,     0,     0,   336,   337,     0,   137,   175,   258,   139,
       0,    84,   177,   282,   130,   158,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     263,   262,     0,   317,     0,    61,     0,     0,     0,   291,
     292,   293,   294,   295,   296,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   141,   141,   282,
     110,     0,   280,     0,   118,   133,   266,   241,   242,   243,
     244,   247,   248,   249,   250,   246,   245,   251,   252,   253,
     238,     0,     0,     0,   334,   335,   299,     0,     0,     0,
     232,   315,   190,     0,   260,   261,   259,   120,   121,   122,
     123,   125,   119,   118,     0,   287,   289,     0,     0,   288,
     290,     0,   229,   162,   168,   159,   169,     0,     0,   228,
     334,     0,   142,   272,     0,     0,    88,     0,     0,     0,
     277,     0,   334,     0,   268,   317,   221,   222,   227,   226,
     254,   191,   192,   193,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   317,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      62,   285,     0,   286,     0,     0,   317,   161,     0,     0,
       0,     0,     0,   138,   271,   140,   240,     0,     0,     0,
       0,   281,     0,   278,     0,   134,     0,   128,   129,   131,
       0,     0,     0,   265,     0,     0,   317,     0,   317,   199,
     208,   209,   213,   202,   203,   204,   207,   205,   206,   197,
     210,   211,   212,   201,     0,   195,   216,   194,   196,   198,
     200,   214,   215,     0,     0,   283,   284,   230,     0,   160,
     171,   174,   143,   334,   144,   274,   275,   273,   112,     0,
       0,     0,     0,    86,   111,     0,     0,   272,   135,   270,
     334,   267,   223,   219,     0,   224,     0,   217,   218,   124,
     231,     0,     0,    89,     0,     0,     0,     0,   113,     0,
     279,   266,   136,     0,   220,   225,   145,     0,   104,     0,
     105,   107,     0,   106,     0,     0,    87,     0,   269,   276,
       0,     0,     0,   116,     0,    85,     0,   234,   103,   109,
     108,     0,   118,   114,     0,   115,   117
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    13,    14,    15,    16,    25,    17,    18,    19,    31,
      70,   102,   194,    71,    72,   109,   110,   136,   157,    20,
      42,    73,    21,    29,    22,    30,    98,   175,   190,   204,
     211,   219,   146,   125,   126,   173,   174,   205,    23,    40,
     101,   177,   245,   330,   548,   459,   127,   128,   129,   523,
     396,   460,   565,   576,   581,   305,   372,   246,   469,   247,
     335,   401,   470,   248,   327,   328,   391,   206,   207,   208,
      75,    76,    77,   217,   384,   385,   249,   269,   271,   272,
      38,    39,   250,   283,   251,   280,   252,   253,   254,   304,
     255,   286,   403,   392,   454,   517,   332,   333,   256,   316,
      92,   159,   160,   161,    58,    59,   151,   162,   393,    51,
      52,    94,   140,    95,    96,    97,   275
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -444
static const short yypact[] =
{
     338,  -444,    49,   -22,   -20,     4,  -444,  -444,    31,  -444,
      23,  -444,   117,   142,   338,  -444,  -444,   144,  -444,  -444,
    -444,  -444,  -444,  -444,    41,   151,    81,    93,  -444,   163,
     154,    31,  -444,  -444,  -444,  -444,  -444,  -444,    64,  -444,
      72,   184,    13,  -444,  -444,  -444,  -444,  -444,  -444,    83,
      80,    71,   351,  -444,  -444,  -444,  -444,  -444,  -444,  -444,
      89,    79,  -444,  -444,  -444,  -444,   206,  -444,  -444,  -444,
    -444,    37,  -444,   112,  -444,    20,   106,  -444,  -444,  -444,
    -444,   572,  -444,  -444,  -444,  -444,  -444,  -444,  -444,  -444,
    -444,  -444,  -444,   146,   -54,  -444,  -444,  -444,   670,   102,
     199,   670,   114,  -444,  -444,  -444,   572,   120,  -444,   221,
     123,  -444,  -444,   572,  -444,   351,  -444,  -444,  -444,  -444,
    -444,  -444,   108,  -444,   115,  -444,  -444,   235,     6,  -444,
     199,  -444,   255,   558,  -444,   189,   670,  -444,   497,  -444,
     351,  -444,    18,   182,  -444,  -444,   670,  -444,  -444,  -444,
    -444,  -444,   148,  -444,   165,   175,  -444,  -444,   153,  -444,
     202,  -444,  -444,  -444,   156,   157,  -444,  -444,  -444,  -444,
    -444,  -444,  -444,   -52,  -444,   278,  -444,   278,   -58,  -444,
    -444,   166,  -444,   497,  -444,  -444,   176,   182,  -444,  -444,
       1,     1,  -444,  -444,  -444,  -444,   177,  -444,  -444,  -444,
    -444,   284,  -444,  -444,   296,   232,   149,   106,  -444,   248,
    -444,    31,  -444,  -444,  -444,  -444,   456,  -444,  -444,  -444,
      25,   -60,    61,   104,   572,    44,   218,   225,  -444,   222,
     223,  -444,   -35,   389,   212,  -444,   332,  -444,  -444,  -444,
    -444,  -444,   497,  -444,  -444,  -444,   333,  -444,  -444,   334,
    -444,  -444,  -444,  -444,  -444,  -444,  -444,   509,  -444,   323,
    -444,   572,   127,   572,   352,  -444,   273,  -444,  -444,    31,
     276,    31,    31,  -444,  -444,   230,  -444,  -444,   -77,  -444,
     228,  -444,  -444,   425,  -444,  -444,   237,   572,   572,   572,
     572,   572,   572,   572,   572,   572,   572,   572,   572,   572,
    -444,  -444,   215,  -444,   191,    -4,   261,   358,   -60,  -444,
    -444,  -444,  -444,  -444,  -444,   -60,   572,   374,   -60,   -60,
     572,   572,   290,    44,   291,   293,   572,   586,   586,   425,
    -444,   378,  -444,   -46,  -444,  -444,   600,  -444,  -444,  -444,
    -444,  -444,  -444,  -444,  -444,  -444,  -444,  -444,  -444,  -444,
    -444,   511,   -35,   297,   280,   281,   497,   572,   572,   572,
    -444,   167,   525,   283,  -444,  -444,  -444,  -444,  -444,  -444,
     292,  -444,  -444,  -444,   -60,  -444,  -444,   395,   -60,  -444,
    -444,   405,   -55,   321,   346,  -444,  -444,   300,   301,  -444,
     402,   -21,  -444,  -444,    -9,     0,    14,    44,   533,   304,
      -4,    29,   407,    58,  -444,  -444,   -44,   -15,  -444,  -444,
    -444,  -444,  -444,  -444,   572,   572,   572,   572,   572,   572,
     572,   572,   572,   572,   572,   572,   572,   572,   572,  -444,
     572,   572,   572,   572,   572,   572,   572,   572,   309,   326,
      -4,  -444,   -60,  -444,   -60,   572,  -444,  -444,   290,   199,
     199,   572,   614,  -444,    43,  -444,  -444,   572,   572,   118,
     427,  -444,   409,  -444,   253,  -444,   572,  -444,  -444,  -444,
     431,   572,   628,  -444,   316,   572,  -444,   572,  -444,  -444,
    -444,  -444,  -444,  -444,  -444,  -444,  -444,  -444,  -444,  -444,
    -444,  -444,  -444,  -444,   317,  -444,  -444,  -444,  -444,  -444,
    -444,  -444,  -444,   572,   318,  -444,  -444,  -444,   319,  -444,
    -444,  -444,  -444,   419,  -444,  -444,   320,  -444,  -444,   439,
     572,   572,   642,   106,  -444,    44,   324,  -444,  -444,  -444,
     429,  -444,  -444,  -444,   329,  -444,   336,  -444,  -444,  -444,
    -444,   572,   339,  -444,    19,   451,    34,    45,  -444,   459,
    -444,   600,    43,   572,  -444,  -444,  -444,   342,  -444,   572,
    -444,  -444,   572,  -444,   572,   132,  -444,    67,  -444,  -444,
     463,   467,   468,  -444,    44,  -444,   469,  -444,  -444,  -444,
    -444,    31,  -444,  -444,   290,    -4,  -444
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -444,  -444,  -444,   460,   -11,  -444,  -444,  -444,  -444,  -444,
     264,  -444,  -444,  -444,   410,  -444,  -444,  -444,   126,  -444,
    -444,  -444,    -2,  -444,  -444,  -444,  -444,  -444,   310,  -444,
    -444,  -444,  -444,  -444,  -444,  -444,   299,   307,  -444,  -444,
    -444,  -444,  -444,  -444,  -444,  -444,   -72,  -444,   349,  -444,
    -444,  -444,  -444,  -444,  -444,  -326,  -444,  -444,  -444,  -444,
    -444,  -444,  -444,  -444,  -444,  -444,   171,  -444,  -444,   295,
     298,  -444,   -75,  -444,  -444,  -443,  -444,  -444,  -444,  -444,
     -31,   152,  -444,  -444,  -444,  -444,  -444,  -444,    40,  -444,
    -217,  -444,   -42,  -332,   -17,  -444,   109,   183,  -444,   242,
    -129,   271,  -444,   337,  -444,   211,  -218,   383,   -45,  -145,
    -444,  -444,  -444,   -85,  -444,   -98,   172
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -259
static const short yytable[] =
{
      60,   111,   131,   260,   404,   509,   200,    93,   400,   158,
     -91,   181,   367,   368,   369,   370,   277,   445,   114,     2,
     187,     3,     4,   558,   -43,   457,   398,   186,   475,   132,
     141,    69,   147,   465,   106,     5,   112,   196,   561,   300,
      74,   301,    64,     2,   149,     3,     4,   440,   107,   563,
     192,   452,   150,   193,   158,   163,    24,   477,   515,     5,
      69,   134,   516,   452,   155,   446,    64,   273,   139,    74,
      93,   188,   398,   274,   -78,   261,   476,   399,   145,   115,
      32,    33,    34,    35,    36,   360,    26,   257,   153,    27,
     375,   559,   371,   153,   466,    93,   266,   376,   108,   458,
     379,   380,   453,   -91,   278,   478,   562,   201,    10,   467,
      65,   468,   -47,   158,   455,   202,   203,   564,   263,    66,
     514,    43,   164,   456,    28,   518,   165,    67,    68,   258,
     472,    41,    10,   259,    65,    37,   -48,   308,   153,   472,
     531,   586,    44,    66,    82,    83,    84,    85,    46,    86,
      47,    67,    68,    49,   334,    48,   441,    91,   363,   573,
     443,    82,    83,    84,    85,    50,    86,    53,    61,    87,
      88,    89,    90,   361,    91,   365,    62,   262,   264,   265,
     220,   473,   309,   310,   311,   312,   313,   314,    63,    79,
     577,    78,    80,    99,   386,   520,   574,   153,   100,   315,
     334,   521,   522,    65,    82,    83,    84,    85,   575,    86,
     103,   105,    87,    88,    89,    90,   307,    91,   317,   404,
     113,   130,   -79,   133,   505,   137,   506,   158,   135,   350,
     142,   166,   167,   168,   169,   138,   351,   143,   322,   144,
     324,   325,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   201,   585,   362,    54,   148,
     474,   154,    55,   202,   203,    56,    57,   178,   461,   334,
     179,   377,   180,   182,   183,   381,   382,   352,   353,   184,
     185,   389,   189,   300,   494,   301,   170,   195,   212,  -258,
     171,    82,    83,    84,    85,    54,    86,   198,   210,   364,
     213,   508,   172,    57,    91,   214,   407,    87,    88,    89,
      90,   153,   411,   412,   413,    82,    83,    84,    85,   239,
      86,   218,   267,   354,    88,    89,   355,   356,    91,   268,
     270,   534,   -24,   536,   279,   278,   281,   284,   285,   357,
     358,   359,     1,   306,     2,   321,     3,     4,   323,   326,
     329,   510,   511,    82,    83,    84,    85,   239,    86,   336,
       5,   240,   318,     6,   241,   373,    91,     7,   374,   479,
     480,   481,   482,   483,   484,   485,   486,   487,   488,   489,
     490,   491,   492,   493,   378,   495,   496,   497,   498,   499,
     500,   501,   502,   547,   383,   387,   550,   388,   397,     8,
     507,   409,  -256,  -257,   438,   442,   512,   309,   310,   311,
     312,   313,   314,   519,   439,   444,     9,   447,   448,   449,
     450,   527,   451,   464,   319,    81,   529,   471,   503,   525,
     533,   524,   535,    10,   504,   528,    11,   532,   537,   541,
     540,   539,   542,   543,    12,   582,   551,   557,   549,   553,
     554,    82,    83,    84,    85,   560,    86,   555,   538,    87,
      88,    89,    90,   566,    91,   569,   221,   578,   222,   223,
     224,   579,   580,   583,    45,   544,   545,   225,   226,   227,
     244,   104,   410,   228,   229,   230,   199,   191,   231,    82,
      83,    84,    85,   239,    86,   176,   556,   240,   209,   394,
     241,   215,    91,   406,   526,   216,   320,   463,   568,   567,
     552,   276,   395,   282,   570,   366,   152,   571,   232,   572,
     197,   233,   234,   235,   408,    82,    83,    84,    85,     0,
      86,   236,     0,   331,     0,   237,     0,   238,    91,     0,
       0,     0,   287,   288,   289,   290,   291,   292,   293,   294,
     584,   295,   296,   297,   298,   299,    82,    83,    84,    85,
     239,    86,     0,     0,   240,     0,   414,   241,   242,    91,
       0,     0,   415,   416,     0,     0,     0,     0,   243,   417,
     418,   419,   420,   421,   422,   423,     0,     0,     0,     0,
       0,     0,     0,   424,   425,   426,   427,    82,    83,    84,
      85,   149,    86,     0,     0,    87,    88,    89,    90,   150,
      91,    82,    83,    84,    85,    37,    86,   156,     0,    87,
      88,    89,    90,     0,    91,   300,     0,   301,   302,   303,
       0,   405,     0,    82,    83,    84,    85,     0,    86,     0,
       0,   462,   428,     0,     0,   429,    91,     0,     0,     0,
     430,   431,   432,   433,   434,   435,   436,   437,    82,    83,
      84,    85,   149,    86,     0,     0,    87,    88,    89,    90,
     150,    91,    82,    83,    84,    85,     0,    86,     0,     0,
      87,    88,    89,    90,     0,    91,    82,    83,    84,    85,
       0,    86,     0,     0,   390,    88,    89,    90,     0,    91,
      82,    83,    84,    85,     0,    86,     0,     0,   402,    88,
      89,    90,     0,    91,    82,    83,    84,    85,     0,    86,
       0,     0,   513,    88,    89,    90,     0,    91,    82,    83,
      84,    85,     0,    86,     0,     0,   530,    88,    89,    90,
       0,    91,    82,    83,    84,    85,     0,    86,     0,     0,
     546,     0,     0,     0,     0,    91,   116,   117,   118,   119,
     120,   121,   122,   123,   124
};

static const short yycheck[] =
{
      31,    76,   100,   221,   336,   448,     5,    52,   334,   138,
       4,   156,    16,    17,    18,    19,   233,    72,    72,     6,
      72,     8,     9,     4,     4,    11,    72,   172,    72,   101,
     115,    42,   130,     4,    14,    22,    81,   182,     4,   116,
      42,   118,    29,     6,   104,     8,     9,   373,    28,     4,
     108,    72,   112,   111,   183,   140,     7,    72,    15,    22,
      71,   106,    19,    72,   136,   120,    29,   102,   113,    71,
     115,   123,    72,   108,    73,    14,   120,   123,    72,   133,
      49,    50,    51,    52,    53,   302,   108,   216,   133,   109,
     308,    72,    96,   138,    65,   140,   225,   315,    78,    85,
     318,   319,   123,    97,   233,   120,    72,   106,    95,    80,
      97,    82,    99,   242,   123,   114,   115,    72,    14,   106,
     452,     4,   104,   123,   120,   457,   108,   114,   115,   104,
      72,   108,    95,   108,    97,   104,    99,    10,   183,    72,
     472,   584,     0,   106,   100,   101,   102,   103,     4,   105,
     109,   114,   115,    72,   283,     4,   374,   113,   303,    27,
     378,   100,   101,   102,   103,    72,   105,     4,   104,   108,
     109,   110,   111,   302,   113,   304,   104,   222,   223,   224,
     211,   123,    55,    56,    57,    58,    59,    60,     4,   109,
     123,   108,   121,   104,   323,    77,    64,   242,   119,    72,
     329,    83,    84,    97,   100,   101,   102,   103,    76,   105,
       4,    99,   108,   109,   110,   111,   261,   113,   263,   551,
      74,   119,    73,   109,   442,     4,   444,   356,   108,    14,
     122,    49,    50,    51,    52,   112,    21,   122,   269,     4,
     271,   272,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   106,   582,   302,   104,     4,
     405,    72,   108,   114,   115,   111,   112,   119,   397,   398,
     105,   316,    97,   120,    72,   320,   321,    62,    63,   123,
     123,   326,     4,   116,   429,   118,   104,   121,     4,   122,
     108,   100,   101,   102,   103,   104,   105,   121,   121,   108,
       4,   446,   120,   112,   113,    73,   351,   108,   109,   110,
     111,   356,   357,   358,   359,   100,   101,   102,   103,   104,
     105,    73,   104,   108,   109,   110,   111,   112,   113,   104,
     108,   476,   109,   478,   122,   464,     4,     4,     4,   124,
     125,   126,     4,    20,     6,    72,     8,     9,    72,   119,
     122,   449,   450,   100,   101,   102,   103,   104,   105,   122,
      22,   108,    10,    25,   111,   104,   113,    29,    10,   414,
     415,   416,   417,   418,   419,   420,   421,   422,   423,   424,
     425,   426,   427,   428,    10,   430,   431,   432,   433,   434,
     435,   436,   437,   522,   104,   104,   525,   104,    20,    61,
     445,   104,   122,   122,   121,    10,   451,    55,    56,    57,
      58,    59,    60,   458,   122,    10,    78,    96,    72,   119,
     119,   466,    20,   119,    72,    74,   471,    20,   119,    20,
     475,     4,   477,    95,   108,     4,    98,   121,   121,    20,
     121,   123,   122,     4,   106,   574,   122,   108,   523,    20,
     121,   100,   101,   102,   103,     4,   105,   121,   503,   108,
     109,   110,   111,     4,   113,   123,    10,     4,    12,    13,
      14,     4,     4,     4,    14,   520,   521,    21,    22,    23,
     216,    71,   356,    27,    28,    29,   187,   177,    32,   100,
     101,   102,   103,   104,   105,   146,   541,   108,   191,   328,
     111,   206,   113,   351,   464,   207,   264,   398,   553,   551,
     527,   122,   329,   242,   559,   304,   133,   562,    62,   564,
     183,    65,    66,    67,   352,   100,   101,   102,   103,    -1,
     105,    75,    -1,   108,    -1,    79,    -1,    81,   113,    -1,
      -1,    -1,    33,    34,    35,    36,    37,    38,    39,    40,
     581,    42,    43,    44,    45,    46,   100,   101,   102,   103,
     104,   105,    -1,    -1,   108,    -1,    41,   111,   112,   113,
      -1,    -1,    47,    48,    -1,    -1,    -1,    -1,   122,    54,
      55,    56,    57,    58,    59,    60,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    69,    70,    71,   100,   101,   102,
     103,   104,   105,    -1,    -1,   108,   109,   110,   111,   112,
     113,   100,   101,   102,   103,   104,   105,   120,    -1,   108,
     109,   110,   111,    -1,   113,   116,    -1,   118,   119,   120,
      -1,   120,    -1,   100,   101,   102,   103,    -1,   105,    -1,
      -1,   108,   117,    -1,    -1,   120,   113,    -1,    -1,    -1,
     125,   126,   127,   128,   129,   130,   131,   132,   100,   101,
     102,   103,   104,   105,    -1,    -1,   108,   109,   110,   111,
     112,   113,   100,   101,   102,   103,    -1,   105,    -1,    -1,
     108,   109,   110,   111,    -1,   113,   100,   101,   102,   103,
      -1,   105,    -1,    -1,   108,   109,   110,   111,    -1,   113,
     100,   101,   102,   103,    -1,   105,    -1,    -1,   108,   109,
     110,   111,    -1,   113,   100,   101,   102,   103,    -1,   105,
      -1,    -1,   108,   109,   110,   111,    -1,   113,   100,   101,
     102,   103,    -1,   105,    -1,    -1,   108,   109,   110,   111,
      -1,   113,   100,   101,   102,   103,    -1,   105,    -1,    -1,
     108,    -1,    -1,    -1,    -1,   113,    86,    87,    88,    89,
      90,    91,    92,    93,    94
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,     9,    22,    25,    29,    61,    78,
      95,    98,   106,   135,   136,   137,   138,   140,   141,   142,
     153,   156,   158,   172,     7,   139,   108,   109,   120,   157,
     159,   143,    49,    50,    51,    52,    53,   104,   214,   215,
     173,   108,   154,     4,     0,   137,     4,   109,     4,    72,
      72,   243,   244,     4,   104,   108,   111,   112,   238,   239,
     214,   104,   104,     4,    29,    97,   106,   114,   115,   138,
     144,   147,   148,   155,   156,   204,   205,   206,   108,   109,
     121,    74,   100,   101,   102,   103,   105,   108,   109,   110,
     111,   113,   234,   242,   245,   247,   248,   249,   160,   104,
     119,   174,   145,     4,   148,    99,    14,    28,    78,   149,
     150,   206,   242,    74,    72,   133,    86,    87,    88,    89,
      90,    91,    92,    93,    94,   167,   168,   180,   181,   182,
     119,   249,   180,   109,   242,   108,   151,     4,   112,   242,
     246,   247,   122,   122,     4,    72,   166,   249,     4,   104,
     112,   240,   241,   242,    72,   180,   120,   152,   234,   235,
     236,   237,   241,   247,   104,   108,    49,    50,    51,    52,
     104,   108,   120,   169,   170,   161,   182,   175,   119,   105,
      97,   243,   120,    72,   123,   123,   243,    72,   123,     4,
     162,   162,   108,   111,   146,   121,   243,   237,   121,   170,
       5,   106,   114,   115,   163,   171,   201,   202,   203,   171,
     121,   164,     4,     4,    73,   203,   204,   207,    73,   165,
     214,    10,    12,    13,    14,    21,    22,    23,    27,    28,
      29,    32,    62,    65,    66,    67,    75,    79,    81,   104,
     108,   111,   112,   122,   144,   176,   191,   193,   197,   210,
     216,   218,   220,   221,   222,   224,   232,   234,   104,   108,
     240,    14,   242,    14,   242,   242,   234,   104,   104,   211,
     108,   212,   213,   102,   108,   250,   122,   224,   234,   122,
     219,     4,   235,   217,     4,     4,   225,    33,    34,    35,
      36,    37,    38,    39,    40,    42,    43,    44,    45,    46,
     116,   118,   119,   120,   223,   189,    20,   242,    10,    55,
      56,    57,    58,    59,    60,    72,   233,   242,    10,    72,
     233,    72,   214,    72,   214,   214,   119,   198,   199,   122,
     177,   108,   230,   231,   234,   194,   122,   242,   242,   242,
     242,   242,   242,   242,   242,   242,   242,   242,   242,   242,
      14,    21,    62,    63,   108,   111,   112,   124,   125,   126,
     224,   234,   242,   243,   108,   234,   239,    16,    17,    18,
      19,    96,   190,   104,    10,   240,   240,   242,    10,   240,
     240,   242,   242,   104,   208,   209,   234,   104,   104,   242,
     108,   200,   227,   242,   200,   231,   184,    20,    72,   123,
     189,   195,   108,   226,   227,   120,   215,   242,   250,   104,
     152,   242,   242,   242,    41,    47,    48,    54,    55,    56,
      57,    58,    59,    60,    68,    69,    70,    71,   117,   120,
     125,   126,   127,   128,   129,   130,   131,   132,   121,   122,
     189,   240,    10,   240,    10,    72,   120,    96,    72,   119,
     119,    20,    72,   123,   228,   123,   123,    11,    85,   179,
     185,   234,   108,   230,   119,     4,    65,    80,    82,   192,
     196,    20,    72,   123,   243,    72,   120,    72,   120,   242,
     242,   242,   242,   242,   242,   242,   242,   242,   242,   242,
     242,   242,   242,   242,   243,   242,   242,   242,   242,   242,
     242,   242,   242,   119,   108,   240,   240,   242,   243,   209,
     249,   249,   242,   108,   227,    15,    19,   229,   227,   242,
      77,    83,    84,   183,     4,    20,   222,   242,     4,   242,
     108,   227,   121,   242,   243,   242,   243,   121,   242,   123,
     121,    20,   122,     4,   242,   242,   108,   234,   178,   206,
     234,   122,   228,    20,   121,   121,   242,   108,     4,    72,
       4,     4,    72,     4,    72,   186,     4,   226,   242,   123,
     242,   242,   242,    27,    64,    76,   187,   123,     4,     4,
       4,   188,   234,     4,   214,   189,   209
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
#line 479 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 488 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 6:
#line 489 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 490 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 491 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 492 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 493 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 494 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 12:
#line 495 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 496 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 499 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 500 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 501 "compilers/imcc/imcc.y"
    { yyval.i = 0; do_loadlib(interp, yyvsp[-1].s); }
    break;

  case 17:
#line 505 "compilers/imcc/imcc.y"
    { if (yyvsp[0].s)
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 18:
#line 513 "compilers/imcc/imcc.y"
    {
            STRING *hll_name, *hll_lib;
            hll_name = string_unescape_cstring(interp, yyvsp[-2].s + 1, '"', NULL);
            hll_lib =  string_unescape_cstring(interp, yyvsp[0].s + 1, '"', NULL);
            CONTEXT(((Interp*)interp)->ctx)->current_HLL = 
                Parrot_register_HLL(interp, hll_name, hll_lib);
            yyval.t = 0;
         }
    break;

  case 19:
#line 522 "compilers/imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                CONTEXT(((Interp*)interp)->ctx)->current_HLL, atoi(yyvsp[-2].s), atoi(yyvsp[0].s));
             yyval.t = 0;
         }
    break;

  case 20:
#line 531 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 21:
#line 537 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 22:
#line 545 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 23:
#line 546 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 24:
#line 550 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 25:
#line 551 "compilers/imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 30:
#line 564 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 31:
#line 565 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 32:
#line 566 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 33:
#line 567 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 34:
#line 568 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 37:
#line 573 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 38:
#line 575 "compilers/imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 39:
#line 578 "compilers/imcc/imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                    }
    break;

  case 40:
#line 583 "compilers/imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, yyvsp[0].s));
                     cur_call->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 41:
#line 589 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 42:
#line 591 "compilers/imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, yyvsp[0].s);
                       set_lexical(interp, r, yyvsp[-2].s); yyval.i = 0;
                   }
    break;

  case 43:
#line 595 "compilers/imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 45:
#line 603 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 46:
#line 605 "compilers/imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 49:
#line 620 "compilers/imcc/imcc.y"
    {
                    int re_open = 0;
                    yyval.i = 0;
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

  case 50:
#line 635 "compilers/imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; }
    break;

  case 51:
#line 636 "compilers/imcc/imcc.y"
    { yyval.sr = NULL; }
    break;

  case 52:
#line 641 "compilers/imcc/imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 53:
#line 645 "compilers/imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, yyvsp[0].sr);
        }
    break;

  case 54:
#line 648 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 55:
#line 650 "compilers/imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 56:
#line 654 "compilers/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 57:
#line 655 "compilers/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 58:
#line 656 "compilers/imcc/imcc.y"
    { 
         if (adv_named_id) {
             add_pcc_named_param(interp,cur_call,adv_named_id,yyvsp[-1].sr);
             adv_named_id = NULL;
         } else add_pcc_param(cur_call, yyvsp[-1].sr);
   }
    break;

  case 59:
#line 665 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 60:
#line 665 "compilers/imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; is_def=0; }
    break;

  case 61:
#line 669 "compilers/imcc/imcc.y"
    { if (yyvsp[0].t & VT_UNIQUE_REG)
                                             yyval.sr = mk_ident_ur(interp, yyvsp[-1].s, yyvsp[-2].t);
                                         else
                                             yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-2].t);
                                         yyval.sr->type |= yyvsp[0].t; }
    break;

  case 62:
#line 674 "compilers/imcc/imcc.y"
    { 
                                         if (yyvsp[0].t & VT_UNIQUE_REG)
                                             yyval.sr = mk_ident_ur(interp, yyvsp[-1].s, yyvsp[-4].t);
                                         else
                                             yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-4].t);
                                         yyval.sr->type |= yyvsp[0].t;
                                         adv_named_set(interp,yyvsp[-3].s);}
    break;

  case 63:
#line 684 "compilers/imcc/imcc.y"
    { yyval.t = 0;  }
    break;

  case 65:
#line 689 "compilers/imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 66:
#line 693 "compilers/imcc/imcc.y"
    { yyval.t = 0; cur_unit->outer =
                     mk_sub_address_fromc(interp, yyvsp[-1].s); }
    break;

  case 67:
#line 696 "compilers/imcc/imcc.y"
    { yyval.t = 0; cur_unit->outer =
                     mk_const(interp, yyvsp[-1].s, 'S'); }
    break;

  case 68:
#line 701 "compilers/imcc/imcc.y"
    { add_pcc_multi(cur_call, NULL); }
    break;

  case 69:
#line 702 "compilers/imcc/imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); }
    break;

  case 70:
#line 703 "compilers/imcc/imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);}
    break;

  case 71:
#line 707 "compilers/imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 72:
#line 708 "compilers/imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 73:
#line 709 "compilers/imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 74:
#line 710 "compilers/imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 75:
#line 711 "compilers/imcc/imcc.y"
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

  case 76:
#line 721 "compilers/imcc/imcc.y"
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

  case 77:
#line 731 "compilers/imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; }
    break;

  case 80:
#line 740 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 81:
#line 742 "compilers/imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, yyvsp[0].s));

         }
    break;

  case 82:
#line 746 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 83:
#line 748 "compilers/imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 84:
#line 753 "compilers/imcc/imcc.y"
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

  case 85:
#line 780 "compilers/imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 86:
#line 784 "compilers/imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 87:
#line 785 "compilers/imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 88:
#line 789 "compilers/imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 89:
#line 791 "compilers/imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 90:
#line 795 "compilers/imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 92:
#line 800 "compilers/imcc/imcc.y"
    { yyval.t = yyvsp[0].t; }
    break;

  case 93:
#line 801 "compilers/imcc/imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; }
    break;

  case 94:
#line 805 "compilers/imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 95:
#line 806 "compilers/imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 96:
#line 807 "compilers/imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 97:
#line 808 "compilers/imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 98:
#line 809 "compilers/imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 99:
#line 810 "compilers/imcc/imcc.y"
    {  yyval.t = P_METHOD; }
    break;

  case 100:
#line 811 "compilers/imcc/imcc.y"
    {  yyval.t = P_NEED_LEX; }
    break;

  case 103:
#line 818 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 104:
#line 823 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 105:
#line 825 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-1].sr);
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 106:
#line 830 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 107:
#line 832 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 108:
#line 834 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 109:
#line 838 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 110:
#line 845 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 111:
#line 846 "compilers/imcc/imcc.y"
    {  add_pcc_arg(cur_call, yyvsp[-1].sr); }
    break;

  case 112:
#line 850 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 113:
#line 855 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 114:
#line 856 "compilers/imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(cur_call, yyvsp[-1].sr); }
    break;

  case 115:
#line 860 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 116:
#line 861 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 117:
#line 862 "compilers/imcc/imcc.y"
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

  case 118:
#line 874 "compilers/imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 119:
#line 875 "compilers/imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 120:
#line 879 "compilers/imcc/imcc.y"
    {  yyval.t = VT_FLAT;   }
    break;

  case 121:
#line 880 "compilers/imcc/imcc.y"
    {  yyval.t = VT_OPTIONAL; }
    break;

  case 122:
#line 881 "compilers/imcc/imcc.y"
    {  yyval.t = VT_OPT_FLAG; }
    break;

  case 123:
#line 882 "compilers/imcc/imcc.y"
    {  yyval.t = VT_NAMED; }
    break;

  case 124:
#line 883 "compilers/imcc/imcc.y"
    {  adv_named_set(interp,yyvsp[-1].s); yyval.t = 0; }
    break;

  case 125:
#line 884 "compilers/imcc/imcc.y"
    {  yyval.t = VT_UNIQUE_REG; }
    break;

  case 126:
#line 889 "compilers/imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 127:
#line 890 "compilers/imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 130:
#line 900 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 131:
#line 903 "compilers/imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 132:
#line 904 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 133:
#line 910 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 134:
#line 911 "compilers/imcc/imcc.y"
    {
       if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); 
   }
    break;

  case 135:
#line 914 "compilers/imcc/imcc.y"
    {
       if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); 
   }
    break;

  case 136:
#line 920 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 137:
#line 925 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 138:
#line 930 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 139:
#line 932 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 140:
#line 937 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 141:
#line 941 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 142:
#line 942 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id, yyvsp[0].sr);
          adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr); }
    break;

  case 143:
#line 948 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 144:
#line 950 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id,yyvsp[0].sr);
           adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 145:
#line 956 "compilers/imcc/imcc.y"
    {  
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 148:
#line 975 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 149:
#line 980 "compilers/imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 150:
#line 981 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 151:
#line 982 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 152:
#line 983 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 153:
#line 987 "compilers/imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 157:
#line 997 "compilers/imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 158:
#line 1004 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 159:
#line 1009 "compilers/imcc/imcc.y"
    {
         IdList* l = yyvsp[0].idlist;
         l->next = NULL;
         yyval.idlist = l;
     }
    break;

  case 160:
#line 1016 "compilers/imcc/imcc.y"
    {  
         IdList* l = yyvsp[0].idlist;
         l->next = yyvsp[-2].idlist;
         yyval.idlist = l;
     }
    break;

  case 161:
#line 1025 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = yyvsp[-1].s;
         l->unique_reg = 1;
         yyval.idlist = l;
     }
    break;

  case 162:
#line 1033 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = yyvsp[0].s;
         l->unique_reg = 0;
         yyval.idlist = l;
     }
    break;

  case 165:
#line 1044 "compilers/imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 166:
#line 1045 "compilers/imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 167:
#line 1046 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 168:
#line 1047 "compilers/imcc/imcc.y"
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

  case 169:
#line 1062 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, yyvsp[0].sr, yyvsp[-2].s); yyval.i = 0;
                    }
    break;

  case 170:
#line 1065 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 171:
#line 1066 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 173:
#line 1068 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 174:
#line 1069 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 175:
#line 1070 "compilers/imcc/imcc.y"
    { yyval.i = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 176:
#line 1074 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 177:
#line 1076 "compilers/imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 178:
#line 1079 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 179:
#line 1080 "compilers/imcc/imcc.y"
    {  yyval.i = 0; cur_call = NULL; }
    break;

  case 180:
#line 1081 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 182:
#line 1083 "compilers/imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 183:
#line 1087 "compilers/imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 184:
#line 1088 "compilers/imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 185:
#line 1089 "compilers/imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 186:
#line 1090 "compilers/imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 187:
#line 1091 "compilers/imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 188:
#line 1092 "compilers/imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 189:
#line 1097 "compilers/imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 190:
#line 1107 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 191:
#line 1108 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 192:
#line 1109 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 193:
#line 1110 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 194:
#line 1111 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 195:
#line 1112 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 196:
#line 1113 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 197:
#line 1114 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 198:
#line 1115 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 199:
#line 1116 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 1117 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 201:
#line 1118 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 202:
#line 1119 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "iseq", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 1120 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isne", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 1121 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isgt", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 1122 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "islt", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 1123 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isle", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 1124 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isge", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 208:
#line 1126 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 1128 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 210:
#line 1130 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 211:
#line 1132 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 1134 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 213:
#line 1136 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 214:
#line 1138 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 215:
#line 1140 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 216:
#line 1142 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 1144 "compilers/imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 218:
#line 1146 "compilers/imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1148 "compilers/imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 220:
#line 1150 "compilers/imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 221:
#line 1152 "compilers/imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 222:
#line 1154 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 223:
#line 1156 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-5].sr, yyvsp[-1].sr); }
    break;

  case 224:
#line 1158 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 1160 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 226:
#line 1162 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 227:
#line 1165 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 228:
#line 1167 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 229:
#line 1171 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 230:
#line 1173 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 231:
#line 1175 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 232:
#line 1178 "compilers/imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            cur_call = NULL;
            yyval.i = 0;
         }
    break;

  case 233:
#line 1184 "compilers/imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 234:
#line 1188 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           cur_call = NULL;
         }
    break;

  case 238:
#line 1196 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[-2].sr); }
    break;

  case 239:
#line 1199 "compilers/imcc/imcc.y"
    { yyval.i = IMCC_create_itcall_label(interp);
                           yyval.i->type &= ~ITCALL; yyval.i->type |= ITRESULT; }
    break;

  case 240:
#line 1201 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 241:
#line 1206 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 242:
#line 1208 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 243:
#line 1210 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 244:
#line 1212 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 245:
#line 1214 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 246:
#line 1216 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 247:
#line 1218 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 248:
#line 1220 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 249:
#line 1222 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 250:
#line 1224 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 251:
#line 1226 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 252:
#line 1228 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 253:
#line 1230 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 254:
#line 1235 "compilers/imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 255:
#line 1241 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 256:
#line 1242 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 257:
#line 1243 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address_u(interp, yyvsp[0].s); }
    break;

  case 258:
#line 1244 "compilers/imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 259:
#line 1249 "compilers/imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 260:
#line 1250 "compilers/imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 261:
#line 1251 "compilers/imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 262:
#line 1254 "compilers/imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 263:
#line 1255 "compilers/imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 264:
#line 1260 "compilers/imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 265:
#line 1265 "compilers/imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 266:
#line 1269 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 267:
#line 1270 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call, adv_named_id, yyvsp[0].sr);
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, yyvsp[0].sr); 
   }
    break;

  case 268:
#line 1276 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call,adv_named_id,yyvsp[0].sr);
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, yyvsp[0].sr);
   }
    break;

  case 269:
#line 1282 "compilers/imcc/imcc.y"
    { yyval.sr = 0;
                                     add_pcc_named_arg(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 270:
#line 1284 "compilers/imcc/imcc.y"
    { yyval.sr = 0; add_pcc_named_arg(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 271:
#line 1288 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 272:
#line 1292 "compilers/imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 273:
#line 1293 "compilers/imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 274:
#line 1297 "compilers/imcc/imcc.y"
    { yyval.t = VT_FLAT; }
    break;

  case 275:
#line 1298 "compilers/imcc/imcc.y"
    { yyval.t = VT_NAMED; }
    break;

  case 276:
#line 1299 "compilers/imcc/imcc.y"
    { adv_named_set(interp,yyvsp[-1].s); yyval.t = 0; }
    break;

  case 277:
#line 1302 "compilers/imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 278:
#line 1306 "compilers/imcc/imcc.y"
    { 
         yyval.sr = 0;
         if (adv_named_id) {
             add_pcc_named_result(interp,cur_call,adv_named_id,yyvsp[0].sr);
             adv_named_id = NULL;
         } else add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 279:
#line 1312 "compilers/imcc/imcc.y"
    { 
        add_pcc_named_result(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr); }
    break;

  case 280:
#line 1314 "compilers/imcc/imcc.y"
    { 
       yyval.sr = 0;
       if (adv_named_id) {
           add_pcc_named_result(interp,cur_call,adv_named_id,yyvsp[0].sr);
           adv_named_id = NULL;
       } else add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 281:
#line 1320 "compilers/imcc/imcc.y"
    { add_pcc_named_result(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr); }
    break;

  case 282:
#line 1321 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 283:
#line 1326 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 284:
#line 1328 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 285:
#line 1330 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 286:
#line 1332 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 287:
#line 1334 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 288:
#line 1336 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 289:
#line 1338 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 290:
#line 1340 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 291:
#line 1344 "compilers/imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 292:
#line 1345 "compilers/imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 293:
#line 1346 "compilers/imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 294:
#line 1347 "compilers/imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 295:
#line 1348 "compilers/imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 296:
#line 1349 "compilers/imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 299:
#line 1358 "compilers/imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 300:
#line 1359 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 301:
#line 1363 "compilers/imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 303:
#line 1368 "compilers/imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 304:
#line 1370 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 305:
#line 1376 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-1].sr;
                      yyval.sr = yyvsp[-1].sr;
                   }
    break;

  case 307:
#line 1383 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 308:
#line 1384 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address_u(interp, yyvsp[0].s); }
    break;

  case 309:
#line 1388 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 310:
#line 1389 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 311:
#line 1393 "compilers/imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 312:
#line 1394 "compilers/imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 317:
#line 1407 "compilers/imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 318:
#line 1408 "compilers/imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 319:
#line 1412 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 320:
#line 1414 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 321:
#line 1415 "compilers/imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 322:
#line 1416 "compilers/imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 323:
#line 1420 "compilers/imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 324:
#line 1426 "compilers/imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 325:
#line 1428 "compilers/imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 326:
#line 1429 "compilers/imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 327:
#line 1433 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 328:
#line 1434 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 329:
#line 1435 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 330:
#line 1436 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 331:
#line 1437 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 332:
#line 1441 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 333:
#line 1442 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 334:
#line 1443 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 335:
#line 1444 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 336:
#line 1448 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 337:
#line 1449 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 991 of yacc.c.  */
#line 3978 "compilers/imcc/imcparser.c"

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


#line 1454 "compilers/imcc/imcc.y"



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

