/* A Bison parser, made by GNU Bison 2.1.  */

/* Skeleton parser for Yacc-like parsing with Bison,
   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005 Free Software Foundation, Inc.

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
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Bison version.  */
#define YYBISON_VERSION "2.1"

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
/* Tokens.  */
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
    STRING *s = string_unescape_cstring(interp, lib + 1, '"', NULL);
    Parrot_load_lib(interp, s, NULL);
    Parrot_register_HLL(interp, NULL, s);
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

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined (YYSTYPE) && ! defined (YYSTYPE_IS_DECLARED)
#line 395 "compilers/imcc/imcc.y"
typedef union YYSTYPE {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} YYSTYPE;
/* Line 196 of yacc.c.  */
#line 721 "compilers/imcc/imcparser.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 219 of yacc.c.  */
#line 733 "compilers/imcc/imcparser.c"

#if ! defined (YYSIZE_T) && defined (__SIZE_TYPE__)
# define YYSIZE_T __SIZE_TYPE__
#endif
#if ! defined (YYSIZE_T) && defined (size_t)
# define YYSIZE_T size_t
#endif
#if ! defined (YYSIZE_T) && (defined (__STDC__) || defined (__cplusplus))
# include <stddef.h> /* INFRINGES ON USER NAME SPACE */
# define YYSIZE_T size_t
#endif
#if ! defined (YYSIZE_T)
# define YYSIZE_T unsigned int
#endif

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

#if ! defined (yyoverflow) || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if defined (__STDC__) || defined (__cplusplus)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     define YYINCLUDED_STDLIB_H
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning. */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2005 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM ((YYSIZE_T) -1)
#  endif
#  ifdef __cplusplus
extern "C" {
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if (! defined (malloc) && ! defined (YYINCLUDED_STDLIB_H) \
	&& (defined (__STDC__) || defined (__cplusplus)))
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if (! defined (free) && ! defined (YYINCLUDED_STDLIB_H) \
	&& (defined (__STDC__) || defined (__cplusplus)))
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifdef __cplusplus
}
#  endif
# endif
#endif /* ! defined (yyoverflow) || YYERROR_VERBOSE */


#if (! defined (yyoverflow) \
     && (! defined (__cplusplus) \
	 || (defined (YYSTYPE_IS_TRIVIAL) && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  short int yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short int) + sizeof (YYSTYPE))			\
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined (__GNUC__) && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
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
   typedef short int yysigned_char;
#endif

/* YYFINAL -- State number of the termination state. */
#define YYFINAL  44
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   738

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  134
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  119
/* YYNRULES -- Number of rules. */
#define YYNRULES  339
/* YYNRULES -- Number of states. */
#define YYNSTATES  589

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   372

#define YYTRANSLATE(YYX)						\
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
static const unsigned short int yyprhs[] =
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
    1070,  1073,  1075,  1079,  1080,  1085,  1087,  1091,  1094,  1097,
    1099,  1101,  1103,  1105,  1107,  1109,  1111,  1113,  1115,  1117
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     135,     0,    -1,   136,    -1,   137,    -1,   136,   137,    -1,
     156,    -1,   142,    -1,   141,    -1,   158,    -1,   172,    -1,
     153,    -1,   106,     4,    -1,   138,    -1,     4,    -1,     6,
     139,     4,    -1,   140,     4,    -1,    95,   108,     4,    -1,
       7,   109,    -1,     8,   108,    72,   108,    -1,     9,   109,
      72,   109,    -1,    61,   214,   104,    -1,    61,   214,   104,
     119,   251,    -1,    -1,    29,   143,   214,   104,   119,   251,
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
     251,    -1,   144,    -1,    -1,    32,   213,   214,   104,   119,
     251,    -1,    65,   224,    -1,    10,   240,    -1,   112,   235,
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
      62,   252,    -1,    62,   252,   119,   242,    -1,    21,   234,
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
      -1,   250,    -1,    -1,   236,    -1,   236,    72,   237,    -1,
     237,    -1,   241,    -1,   234,   120,   243,   121,    -1,   120,
     245,   121,    -1,   239,    -1,   108,    -1,   111,    -1,   104,
      -1,   112,    -1,   104,    -1,   112,    -1,   240,    -1,   242,
      -1,   234,    -1,   251,    -1,    -1,   244,   247,    -1,    -1,
     246,   247,    -1,   249,    -1,   247,   133,   249,    -1,    -1,
     247,    72,   248,   249,    -1,   242,    -1,   242,    74,   242,
      -1,    74,   242,    -1,   242,    74,    -1,   100,    -1,   101,
      -1,   102,    -1,   103,    -1,   105,    -1,   109,    -1,   110,
      -1,   108,    -1,   111,    -1,   102,    -1,   108,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   484,   484,   488,   489,   493,   494,   495,   496,   497,
     498,   499,   500,   501,   504,   505,   506,   509,   517,   526,
     535,   541,   550,   550,   555,   555,   559,   560,   564,   565,
     569,   570,   571,   572,   573,   574,   575,   578,   578,   583,
     582,   593,   595,   600,   604,   608,   608,   618,   620,   624,
     640,   641,   646,   650,   653,   645,   659,   660,   661,   670,
     670,   674,   679,   689,   690,   694,   697,   700,   706,   707,
     708,   712,   713,   714,   715,   716,   726,   736,   739,   741,
     745,   747,   751,   745,   758,   757,   789,   790,   794,   795,
     800,   801,   805,   806,   810,   811,   812,   813,   814,   815,
     816,   817,   818,   822,   827,   829,   834,   836,   838,   842,
     850,   851,   855,   860,   861,   865,   866,   866,   879,   880,
     884,   885,   886,   887,   888,   889,   894,   895,   899,   900,
     905,   904,   909,   915,   916,   919,   925,   930,   929,   937,
     936,   946,   947,   953,   955,   961,   967,   968,   980,   984,
     986,   987,   988,   992,   993,   997,   998,  1002,  1008,  1013,
    1020,  1029,  1037,  1047,  1048,  1049,  1050,  1051,  1051,  1066,
    1070,  1070,  1072,  1073,  1073,  1075,  1079,  1080,  1083,  1085,
    1086,  1087,  1088,  1092,  1093,  1094,  1095,  1096,  1097,  1101,
    1112,  1113,  1114,  1115,  1116,  1117,  1118,  1119,  1120,  1121,
    1122,  1123,  1124,  1125,  1126,  1127,  1128,  1129,  1130,  1132,
    1134,  1136,  1138,  1140,  1142,  1144,  1146,  1148,  1150,  1152,
    1154,  1156,  1158,  1160,  1162,  1164,  1166,  1169,  1171,  1175,
    1177,  1179,  1182,  1189,  1188,  1197,  1198,  1199,  1200,  1204,
    1204,  1210,  1212,  1214,  1216,  1218,  1220,  1222,  1224,  1226,
    1228,  1230,  1232,  1234,  1239,  1246,  1247,  1248,  1249,  1254,
    1255,  1256,  1259,  1260,  1265,  1264,  1274,  1275,  1281,  1287,
    1289,  1293,  1297,  1298,  1302,  1303,  1304,  1307,  1311,  1317,
    1319,  1325,  1326,  1330,  1332,  1334,  1336,  1338,  1340,  1342,
    1344,  1349,  1350,  1351,  1352,  1353,  1354,  1358,  1359,  1363,
    1364,  1368,  1369,  1373,  1374,  1381,  1388,  1389,  1390,  1394,
    1395,  1399,  1400,  1404,  1405,  1409,  1410,  1413,  1413,  1417,
    1417,  1422,  1423,  1425,  1425,  1430,  1435,  1438,  1439,  1443,
    1444,  1445,  1446,  1447,  1451,  1452,  1453,  1454,  1458,  1459
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
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
  "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", "'&'", "'|'", "';'", "$accept",
  "program", "compilation_units", "compilation_unit", "pragma", "pragma_1",
  "hll_def", "global", "constdef", "@1", "pmc_const", "@2", "any_string",
  "pasmcode", "pasmline", "pasm_inst", "@3", "@4", "pasm_args", "emit",
  "@5", "opt_pasmcode", "class_namespace", "maybe_ns", "sub", "@6", "@7",
  "@8", "sub_params", "sub_param", "@9", "sub_param_type_def", "opt_comma",
  "multi", "outer", "multi_types", "multi_type", "sub_body", "pcc_sub",
  "@10", "@11", "@12", "pcc_sub_call", "@13", "opt_label", "opt_invocant",
  "sub_proto", "sub_proto_list", "proto", "pcc_call", "pcc_args",
  "pcc_arg", "pcc_results", "pcc_result", "@14", "paramtype_list",
  "paramtype", "begin_ret_or_yield", "end_ret_or_yield", "pcc_ret", "@15",
  "pcc_returns", "pcc_return", "pcc_return_many", "@16", "@17",
  "var_returns", "statements", "helper_clear_state", "statement", "labels",
  "_labels", "label", "instruction", "id_list", "id_list_id",
  "labeled_inst", "@18", "@19", "@20", "type", "classname", "assignment",
  "@21", "get_results", "@22", "op_assign", "func_assign", "the_sub",
  "ptr", "sub_call", "@23", "arglist", "arg", "argtype_list", "argtype",
  "result", "targetlist", "if_statement", "relop", "target", "vars",
  "_vars", "_var_or_i", "sub_label_op_c", "sub_label_op", "label_op",
  "var_or_i", "var", "keylist", "@24", "keylist_force", "@25", "_keylist",
  "@26", "key", "reg", "const", "string", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const unsigned short int yytoknum[] =
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
     239,   240,   240,   241,   241,   242,   242,   244,   243,   246,
     245,   247,   247,   248,   247,   249,   249,   249,   249,   250,
     250,   250,   250,   250,   251,   251,   251,   251,   252,   252
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
       1,     1,     1,     1,     1,     1,     1,     0,     2,     0,
       2,     1,     3,     0,     4,     1,     3,     2,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
       0,    13,     0,     0,     0,    51,    52,    22,     0,    80,
       0,    45,     0,     0,     2,     3,    12,     0,     7,     6,
      10,     5,     8,     9,     0,     0,     0,     0,   317,     0,
       0,     0,   183,   184,   185,   186,   187,   189,     0,   188,
       0,     0,   153,    11,     1,     4,    15,    17,    14,     0,
       0,     0,     0,    49,   309,   307,   308,   310,    53,   306,
       0,    20,    81,    16,    24,   157,     0,    33,    32,    36,
      35,   153,    28,     0,    34,    37,   154,   156,    18,    19,
      50,     0,   329,   330,   331,   332,   333,   336,   334,   335,
     337,   297,   315,   325,   318,   321,   298,   316,    90,     0,
       0,    90,     0,    31,    29,    46,     0,     0,    39,     0,
       0,   155,   327,   328,   323,     0,    95,    94,    96,    97,
      99,    98,     0,   100,     0,   101,   102,     0,    63,    92,
       0,    21,     0,     0,    41,     0,    90,    30,   299,   326,
       0,   322,     0,    68,    54,    64,     0,    23,    82,   311,
     312,   313,     0,   314,     0,     0,   319,    38,   315,    44,
     300,   302,   303,   324,     0,     0,    71,    72,    74,    73,
      75,    76,   317,     0,    70,    56,    93,    56,     0,    42,
      40,     0,     0,   317,     0,    67,    66,     0,     0,    65,
      57,   148,   148,    26,    27,    25,   305,   320,     0,   301,
      77,    69,    59,     0,   152,   151,     0,     0,   148,   153,
     146,     0,   304,     0,   150,    58,    55,   147,   182,   149,
      83,    60,     0,     0,     0,     0,     0,     0,     0,     0,
     167,     0,   170,   173,     0,     0,     0,   239,     0,   126,
     127,   255,   256,   257,   299,   233,   172,   180,     0,   181,
     132,     0,   163,   235,   236,   237,   264,   179,   164,   258,
     118,     0,   176,     0,     0,     0,     0,   178,     0,   165,
     166,     0,     0,     0,     0,   338,   339,     0,   137,   175,
     258,   139,     0,    84,   177,   282,   130,   158,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   263,   262,     0,   317,     0,    61,     0,     0,
       0,   291,   292,   293,   294,   295,   296,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   141,
     141,   282,   110,     0,   280,     0,   118,   133,   266,   241,
     242,   243,   244,   247,   248,   249,   250,   246,   245,   251,
     252,   253,   238,     0,     0,     0,   336,   337,   299,     0,
       0,     0,   232,   315,   190,     0,   260,   261,   259,   120,
     121,   122,   123,   125,   119,   118,     0,   287,   289,     0,
       0,   288,   290,     0,   229,   162,   168,   159,   169,     0,
       0,   228,   336,     0,   142,   272,     0,     0,    88,     0,
       0,     0,   277,     0,   336,     0,   268,   317,   221,   222,
     227,   226,   254,   191,   192,   193,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   317,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    62,   285,     0,   286,     0,     0,   317,   161,
       0,     0,     0,     0,     0,   138,   271,   140,   240,     0,
       0,     0,     0,   281,     0,   278,     0,   134,     0,   128,
     129,   131,     0,     0,     0,   265,     0,     0,   317,     0,
     317,   199,   208,   209,   213,   202,   203,   204,   207,   205,
     206,   197,   210,   211,   212,   201,     0,   195,   216,   194,
     196,   198,   200,   214,   215,     0,     0,   283,   284,   230,
       0,   160,   171,   174,   143,   336,   144,   274,   275,   273,
     112,     0,     0,     0,     0,    86,   111,     0,     0,   272,
     135,   270,   336,   267,   223,   219,     0,   224,     0,   217,
     218,   124,   231,     0,     0,    89,     0,     0,     0,     0,
     113,     0,   279,   266,   136,     0,   220,   225,   145,     0,
     104,     0,   105,   107,     0,   106,     0,     0,    87,     0,
     269,   276,     0,     0,     0,   116,     0,    85,     0,   234,
     103,   109,   108,     0,   118,   114,     0,   115,   117
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    13,    14,    15,    16,    25,    17,    18,    19,    31,
      70,   102,   195,    71,    72,   109,   110,   136,   157,    20,
      42,    73,    21,    29,    22,    30,    98,   175,   191,   206,
     213,   221,   146,   125,   126,   173,   174,   207,    23,    40,
     101,   177,   247,   332,   550,   461,   127,   128,   129,   525,
     398,   462,   567,   578,   583,   307,   374,   248,   471,   249,
     337,   403,   472,   250,   329,   330,   393,   208,   209,   210,
      75,    76,    77,   219,   386,   387,   251,   271,   273,   274,
      38,    39,   252,   285,   253,   282,   254,   255,   256,   306,
     257,   288,   405,   394,   456,   519,   334,   335,   258,   318,
      92,   159,   160,   161,    58,    59,   151,   162,   395,    51,
      52,   181,   182,    94,   140,    95,    96,    97,   277
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -445
static const short int yypact[] =
{
      65,  -445,    32,   -88,   -56,   -57,  -445,  -445,   117,  -445,
      23,  -445,    73,   121,    65,  -445,  -445,   150,  -445,  -445,
    -445,  -445,  -445,  -445,    29,   157,    92,   101,  -445,   172,
      97,   117,  -445,  -445,  -445,  -445,  -445,  -445,    79,  -445,
      91,   193,    13,  -445,  -445,  -445,  -445,  -445,  -445,    95,
      98,   102,   335,  -445,  -445,  -445,  -445,  -445,  -445,  -445,
     113,   103,  -445,  -445,  -445,  -445,   221,  -445,  -445,  -445,
    -445,    35,  -445,   132,  -445,    19,   136,  -445,  -445,  -445,
    -445,   311,  -445,  -445,  -445,  -445,  -445,  -445,  -445,  -445,
    -445,  -445,  -445,   160,   -55,  -445,  -445,  -445,   275,   116,
      77,   275,   154,  -445,  -445,  -445,   311,   133,  -445,   256,
     152,  -445,  -445,   311,  -445,   335,  -445,  -445,  -445,  -445,
    -445,  -445,   145,  -445,   146,  -445,  -445,   265,     7,  -445,
      77,  -445,   268,   513,  -445,   202,   275,  -445,   391,  -445,
     335,  -445,   -50,    96,  -445,  -445,   275,  -445,  -445,  -445,
    -445,  -445,   156,  -445,   171,   185,  -445,  -445,   168,  -445,
     219,  -445,  -445,  -445,   167,   173,  -445,  -445,  -445,  -445,
    -445,  -445,  -445,   -48,  -445,   294,  -445,   294,   -46,  -445,
    -445,   196,   335,  -445,   391,  -445,  -445,   203,    96,  -445,
    -445,     3,     3,  -445,  -445,  -445,  -445,   -55,   204,  -445,
    -445,  -445,  -445,   301,  -445,  -445,   302,   259,   151,   136,
    -445,   266,  -445,   117,  -445,  -445,  -445,  -445,   458,  -445,
    -445,  -445,    25,   -53,   184,   247,   311,   625,   236,   241,
    -445,   243,   250,  -445,    49,   351,   248,  -445,   382,  -445,
    -445,  -445,  -445,  -445,   391,  -445,  -445,  -445,   392,  -445,
    -445,   393,  -445,  -445,  -445,  -445,  -445,  -445,  -445,   511,
    -445,   379,  -445,   311,   134,   311,   155,  -445,   328,  -445,
    -445,   117,   329,   117,   117,  -445,  -445,   284,  -445,  -445,
      -2,  -445,   282,  -445,  -445,   233,  -445,  -445,   283,   311,
     311,   311,   311,   311,   311,   311,   311,   311,   311,   311,
     311,   311,  -445,  -445,   218,  -445,   602,     9,   303,   396,
     -53,  -445,  -445,  -445,  -445,  -445,  -445,   -53,   311,   400,
     -53,   -53,   311,   311,   313,   625,   314,   321,   311,   532,
     532,   233,  -445,   406,  -445,   -43,  -445,  -445,   560,  -445,
    -445,  -445,  -445,  -445,  -445,  -445,  -445,  -445,  -445,  -445,
    -445,  -445,  -445,   499,    49,   323,   307,   308,   391,   311,
     311,   311,  -445,    37,   527,   310,  -445,  -445,  -445,  -445,
    -445,  -445,   317,  -445,  -445,  -445,   -53,  -445,  -445,   423,
     -53,  -445,  -445,   431,   -54,   346,   377,  -445,  -445,   338,
     339,  -445,   441,   -42,  -445,  -445,   -38,   -32,     1,   625,
     427,   344,     9,    42,   445,   -22,  -445,  -445,   -24,   -20,
    -445,  -445,  -445,  -445,  -445,  -445,   311,   311,   311,   311,
     311,   311,   311,   311,   311,   311,   311,   311,   311,   311,
     311,  -445,   311,   311,   311,   311,   311,   311,   311,   311,
     347,   359,     9,  -445,   -53,  -445,   -53,   311,  -445,  -445,
     313,    77,    77,   311,   574,  -445,   159,  -445,  -445,   311,
     311,   153,   465,  -445,   454,  -445,   199,  -445,   311,  -445,
    -445,  -445,   471,   311,   588,  -445,   355,   311,  -445,   311,
    -445,  -445,  -445,  -445,  -445,  -445,  -445,  -445,  -445,  -445,
    -445,  -445,  -445,  -445,  -445,  -445,   361,  -445,  -445,  -445,
    -445,  -445,  -445,  -445,  -445,   311,   360,  -445,  -445,  -445,
     363,  -445,  -445,  -445,  -445,   468,  -445,  -445,   367,  -445,
    -445,   493,   311,   311,   616,   136,  -445,   625,   383,  -445,
    -445,  -445,   486,  -445,  -445,  -445,   386,  -445,   387,  -445,
    -445,  -445,  -445,   311,   401,  -445,    11,   508,    12,    41,
    -445,   509,  -445,   560,   159,   311,  -445,  -445,  -445,   394,
    -445,   311,  -445,  -445,   311,  -445,   311,   108,  -445,   -12,
    -445,  -445,   510,   514,   518,  -445,   625,  -445,   522,  -445,
    -445,  -445,  -445,   117,  -445,  -445,   313,     9,  -445
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -445,  -445,  -445,   501,    -4,  -445,  -445,  -445,  -445,  -445,
     316,  -445,  -445,  -445,   460,  -445,  -445,  -445,   178,  -445,
    -445,  -445,    81,  -445,  -445,  -445,  -445,  -445,   364,  -445,
    -445,  -445,  -445,  -445,  -445,  -445,   350,   372,  -445,  -445,
    -445,  -445,  -445,  -445,  -445,  -445,   -64,  -445,   397,  -445,
    -445,  -445,  -445,  -445,  -445,  -326,  -445,  -445,  -445,  -445,
    -445,  -445,  -445,  -445,  -445,  -445,   212,  -445,  -445,   357,
     358,  -445,   -75,  -445,  -445,  -444,  -445,  -445,  -445,  -445,
     -31,   220,  -445,  -445,  -445,  -445,  -445,  -445,   106,  -445,
    -222,  -445,    24,  -334,    47,  -445,   179,   257,  -445,   312,
    -129,   345,  -445,   407,  -445,   286,  -218,   457,   -45,  -169,
    -445,  -445,  -445,   411,  -445,   -84,  -445,   -98,   240
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -259
static const short int yytable[] =
{
      60,   111,   131,   187,   406,   262,   511,    93,   202,   158,
     402,   -91,   459,   279,   198,   560,   563,   114,   447,     2,
      26,     3,     4,   -43,   188,   369,   370,   371,   372,   400,
     454,   141,   147,   106,   454,     5,   112,   132,    69,    24,
     400,     2,    64,     3,     4,   565,   467,   107,   477,   442,
     474,   149,   479,    27,   164,   158,   163,     5,   165,   150,
     474,   134,   193,    28,    64,   194,   448,    69,   139,     1,
      93,     2,   155,     3,     4,   189,   -78,    43,   115,   145,
     401,   455,   362,   561,   564,   457,   460,     5,   153,   259,
       6,   458,   377,   153,     7,    93,   478,   108,   268,   378,
     480,   475,   381,   382,   -91,   373,   280,   468,    10,   203,
      65,   579,   -47,   566,   302,   158,   303,   204,   205,    66,
     516,    44,   469,    74,   470,   520,     8,    67,    68,   260,
      10,    41,    65,   261,   -48,   575,   365,    93,    47,   153,
     533,    66,   588,     9,   310,   166,   167,   168,   169,    67,
      68,   275,    74,   302,    46,   303,   336,   276,   443,  -258,
      10,    48,   445,    11,    49,   320,    32,    33,    34,    35,
      36,    12,   576,    50,   517,   363,    53,   367,   518,   264,
     266,   267,   222,    61,   577,    87,    88,    89,    90,   311,
     312,   313,   314,   315,   316,    62,   388,    63,   263,   153,
     170,    54,   336,    78,   171,    55,   317,    79,    56,    57,
     311,   312,   313,   314,   315,   316,   172,    99,   309,   406,
     319,    37,   100,    80,   -79,   103,   507,   321,   508,   158,
     522,   105,   352,    65,   113,   130,   523,   524,   476,   353,
     324,   135,   326,   327,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   350,   351,   203,   587,   364,
     137,   265,   496,   133,   138,   204,   205,   142,   143,   144,
     463,   336,   148,   379,   154,   178,   179,   383,   384,   510,
     354,   355,   180,   391,    82,    83,    84,    85,   183,    86,
     185,   184,    87,    88,    89,    90,   186,    91,   190,    82,
      83,    84,    85,   241,    86,   214,   215,   242,   409,   536,
     243,   538,    91,   153,   413,   414,   415,   196,    82,    83,
      84,    85,   241,    86,   200,   212,   356,    88,    89,   357,
     358,    91,   216,    82,    83,    84,    85,   280,    86,   220,
     269,   333,   359,   360,   361,   270,    91,    82,    83,    84,
      85,   272,    86,   512,   513,    87,    88,    89,    90,   -24,
      91,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     281,   481,   482,   483,   484,   485,   486,   487,   488,   489,
     490,   491,   492,   493,   494,   495,   283,   497,   498,   499,
     500,   501,   502,   503,   504,   549,   286,   287,   552,   308,
     323,   325,   509,   328,   331,   338,   376,   375,   514,    81,
     380,    82,    83,    84,    85,   521,    86,   385,   389,    87,
      88,    89,    90,   529,    91,   390,   399,   411,   531,  -256,
    -257,   440,   535,   444,   537,    82,    83,    84,    85,   441,
      86,   446,   449,    87,    88,    89,    90,   584,    91,   450,
     551,    82,    83,    84,    85,   241,    86,   451,   452,   242,
     540,   453,   243,   466,    91,   473,   505,   506,   223,   526,
     224,   225,   226,   278,   527,   530,   534,   546,   547,   227,
     228,   229,   539,   541,   542,   230,   231,   232,   543,   544,
     233,    82,    83,    84,    85,   149,    86,   545,   558,    87,
      88,    89,    90,   150,    91,   553,   555,   556,   557,   559,
     570,   156,   562,   568,   580,    45,   572,   571,   581,   573,
     234,   574,   582,   235,   236,   237,   585,    82,    83,    84,
      85,   104,    86,   238,   246,   464,   412,   239,   201,   240,
      91,   192,   396,   176,   289,   290,   291,   292,   293,   294,
     295,   296,   586,   297,   298,   299,   300,   301,    82,    83,
      84,    85,   241,    86,   211,   217,   242,   218,   416,   243,
     244,    91,   528,   408,   417,   418,   554,   569,   322,   465,
     245,   419,   420,   421,   422,   423,   424,   425,   397,   284,
     152,   199,   368,   197,   410,   426,   427,   428,   429,    82,
      83,    84,    85,    37,    86,     0,     0,    87,    88,    89,
      90,     0,    91,    82,    83,    84,    85,   149,    86,   407,
       0,    87,    88,    89,    90,   150,    91,   302,     0,   303,
     304,   305,    82,    83,    84,    85,     0,    86,     0,     0,
     392,    88,    89,    90,   430,    91,     0,   431,     0,     0,
       0,     0,   432,   433,   434,   435,   436,   437,   438,   439,
      82,    83,    84,    85,     0,    86,     0,     0,   404,    88,
      89,    90,     0,    91,    82,    83,    84,    85,     0,    86,
       0,     0,   515,    88,    89,    90,     0,    91,    82,    83,
      84,    85,     0,    86,     0,     0,   532,    88,    89,    90,
       0,    91,    82,    83,    84,    85,    54,    86,     0,     0,
     366,     0,     0,     0,    57,    91,    82,    83,    84,    85,
       0,    86,     0,     0,   548,    82,    83,    84,    85,    91,
      86,     0,     0,     0,     0,     0,     0,     0,    91
};

static const short int yycheck[] =
{
      31,    76,   100,   172,   338,   223,   450,    52,     5,   138,
     336,     4,    11,   235,   183,     4,     4,    72,    72,     6,
     108,     8,     9,     4,    72,    16,    17,    18,    19,    72,
      72,   115,   130,    14,    72,    22,    81,   101,    42,     7,
      72,     6,    29,     8,     9,     4,     4,    28,    72,   375,
      72,   104,    72,   109,   104,   184,   140,    22,   108,   112,
      72,   106,   108,   120,    29,   111,   120,    71,   113,     4,
     115,     6,   136,     8,     9,   123,    73,     4,   133,    72,
     123,   123,   304,    72,    72,   123,    85,    22,   133,   218,
      25,   123,   310,   138,    29,   140,   120,    78,   227,   317,
     120,   123,   320,   321,    97,    96,   235,    65,    95,   106,
      97,   123,    99,    72,   116,   244,   118,   114,   115,   106,
     454,     0,    80,    42,    82,   459,    61,   114,   115,   104,
      95,   108,    97,   108,    99,    27,   305,   182,   109,   184,
     474,   106,   586,    78,    10,    49,    50,    51,    52,   114,
     115,   102,    71,   116,     4,   118,   285,   108,   376,   122,
      95,     4,   380,    98,    72,    10,    49,    50,    51,    52,
      53,   106,    64,    72,    15,   304,     4,   306,    19,   224,
     225,   226,   213,   104,    76,   108,   109,   110,   111,    55,
      56,    57,    58,    59,    60,   104,   325,     4,    14,   244,
     104,   104,   331,   108,   108,   108,    72,   109,   111,   112,
      55,    56,    57,    58,    59,    60,   120,   104,   263,   553,
     265,   104,   119,   121,    73,     4,   444,    72,   446,   358,
      77,    99,    14,    97,    74,   119,    83,    84,   407,    21,
     271,   108,   273,   274,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   106,   584,   304,
       4,    14,   431,   109,   112,   114,   115,   122,   122,     4,
     399,   400,     4,   318,    72,   119,   105,   322,   323,   448,
      62,    63,    97,   328,   100,   101,   102,   103,   120,   105,
     123,    72,   108,   109,   110,   111,   123,   113,     4,   100,
     101,   102,   103,   104,   105,     4,     4,   108,   353,   478,
     111,   480,   113,   358,   359,   360,   361,   121,   100,   101,
     102,   103,   104,   105,   121,   121,   108,   109,   110,   111,
     112,   113,    73,   100,   101,   102,   103,   466,   105,    73,
     104,   108,   124,   125,   126,   104,   113,   100,   101,   102,
     103,   108,   105,   451,   452,   108,   109,   110,   111,   109,
     113,    86,    87,    88,    89,    90,    91,    92,    93,    94,
     122,   416,   417,   418,   419,   420,   421,   422,   423,   424,
     425,   426,   427,   428,   429,   430,     4,   432,   433,   434,
     435,   436,   437,   438,   439,   524,     4,     4,   527,    20,
      72,    72,   447,   119,   122,   122,    10,   104,   453,    74,
      10,   100,   101,   102,   103,   460,   105,   104,   104,   108,
     109,   110,   111,   468,   113,   104,    20,   104,   473,   122,
     122,   121,   477,    10,   479,   100,   101,   102,   103,   122,
     105,    10,    96,   108,   109,   110,   111,   576,   113,    72,
     525,   100,   101,   102,   103,   104,   105,   119,   119,   108,
     505,    20,   111,   119,   113,    20,   119,   108,    10,     4,
      12,    13,    14,   122,    20,     4,   121,   522,   523,    21,
      22,    23,   121,   123,   121,    27,    28,    29,    20,   122,
      32,   100,   101,   102,   103,   104,   105,     4,   543,   108,
     109,   110,   111,   112,   113,   122,    20,   121,   121,   108,
     555,   120,     4,     4,     4,    14,   561,   123,     4,   564,
      62,   566,     4,    65,    66,    67,     4,   100,   101,   102,
     103,    71,   105,    75,   218,   108,   358,    79,   188,    81,
     113,   177,   330,   146,    33,    34,    35,    36,    37,    38,
      39,    40,   583,    42,    43,    44,    45,    46,   100,   101,
     102,   103,   104,   105,   192,   208,   108,   209,    41,   111,
     112,   113,   466,   353,    47,    48,   529,   553,   266,   400,
     122,    54,    55,    56,    57,    58,    59,    60,   331,   244,
     133,   184,   306,   182,   354,    68,    69,    70,    71,   100,
     101,   102,   103,   104,   105,    -1,    -1,   108,   109,   110,
     111,    -1,   113,   100,   101,   102,   103,   104,   105,   120,
      -1,   108,   109,   110,   111,   112,   113,   116,    -1,   118,
     119,   120,   100,   101,   102,   103,    -1,   105,    -1,    -1,
     108,   109,   110,   111,   117,   113,    -1,   120,    -1,    -1,
      -1,    -1,   125,   126,   127,   128,   129,   130,   131,   132,
     100,   101,   102,   103,    -1,   105,    -1,    -1,   108,   109,
     110,   111,    -1,   113,   100,   101,   102,   103,    -1,   105,
      -1,    -1,   108,   109,   110,   111,    -1,   113,   100,   101,
     102,   103,    -1,   105,    -1,    -1,   108,   109,   110,   111,
      -1,   113,   100,   101,   102,   103,   104,   105,    -1,    -1,
     108,    -1,    -1,    -1,   112,   113,   100,   101,   102,   103,
      -1,   105,    -1,    -1,   108,   100,   101,   102,   103,   113,
     105,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113
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
     111,   113,   234,   242,   247,   249,   250,   251,   160,   104,
     119,   174,   145,     4,   148,    99,    14,    28,    78,   149,
     150,   206,   242,    74,    72,   133,    86,    87,    88,    89,
      90,    91,    92,    93,    94,   167,   168,   180,   181,   182,
     119,   251,   180,   109,   242,   108,   151,     4,   112,   242,
     248,   249,   122,   122,     4,    72,   166,   251,     4,   104,
     112,   240,   241,   242,    72,   180,   120,   152,   234,   235,
     236,   237,   241,   249,   104,   108,    49,    50,    51,    52,
     104,   108,   120,   169,   170,   161,   182,   175,   119,   105,
      97,   245,   246,   120,    72,   123,   123,   243,    72,   123,
       4,   162,   162,   108,   111,   146,   121,   247,   243,   237,
     121,   170,     5,   106,   114,   115,   163,   171,   201,   202,
     203,   171,   121,   164,     4,     4,    73,   203,   204,   207,
      73,   165,   214,    10,    12,    13,    14,    21,    22,    23,
      27,    28,    29,    32,    62,    65,    66,    67,    75,    79,
      81,   104,   108,   111,   112,   122,   144,   176,   191,   193,
     197,   210,   216,   218,   220,   221,   222,   224,   232,   234,
     104,   108,   240,    14,   242,    14,   242,   242,   234,   104,
     104,   211,   108,   212,   213,   102,   108,   252,   122,   224,
     234,   122,   219,     4,   235,   217,     4,     4,   225,    33,
      34,    35,    36,    37,    38,    39,    40,    42,    43,    44,
      45,    46,   116,   118,   119,   120,   223,   189,    20,   242,
      10,    55,    56,    57,    58,    59,    60,    72,   233,   242,
      10,    72,   233,    72,   214,    72,   214,   214,   119,   198,
     199,   122,   177,   108,   230,   231,   234,   194,   122,   242,
     242,   242,   242,   242,   242,   242,   242,   242,   242,   242,
     242,   242,    14,    21,    62,    63,   108,   111,   112,   124,
     125,   126,   224,   234,   242,   243,   108,   234,   239,    16,
      17,    18,    19,    96,   190,   104,    10,   240,   240,   242,
      10,   240,   240,   242,   242,   104,   208,   209,   234,   104,
     104,   242,   108,   200,   227,   242,   200,   231,   184,    20,
      72,   123,   189,   195,   108,   226,   227,   120,   215,   242,
     252,   104,   152,   242,   242,   242,    41,    47,    48,    54,
      55,    56,    57,    58,    59,    60,    68,    69,    70,    71,
     117,   120,   125,   126,   127,   128,   129,   130,   131,   132,
     121,   122,   189,   240,    10,   240,    10,    72,   120,    96,
      72,   119,   119,    20,    72,   123,   228,   123,   123,    11,
      85,   179,   185,   234,   108,   230,   119,     4,    65,    80,
      82,   192,   196,    20,    72,   123,   243,    72,   120,    72,
     120,   242,   242,   242,   242,   242,   242,   242,   242,   242,
     242,   242,   242,   242,   242,   242,   243,   242,   242,   242,
     242,   242,   242,   242,   242,   119,   108,   240,   240,   242,
     243,   209,   251,   251,   242,   108,   227,    15,    19,   229,
     227,   242,    77,    83,    84,   183,     4,    20,   222,   242,
       4,   242,   108,   227,   121,   242,   243,   242,   243,   121,
     242,   123,   121,    20,   122,     4,   242,   242,   108,   234,
     178,   206,   234,   122,   228,    20,   121,   121,   242,   108,
       4,    72,     4,     4,    72,     4,    72,   186,     4,   226,
     242,   123,   242,   242,   242,    27,    64,    76,   187,   123,
       4,     4,     4,   188,   234,     4,   214,   189,   209
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


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
    {								\
      yyerror (yyscanner, interp, YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (0)


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (N)								\
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (0)
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
              (Loc).first_line, (Loc).first_column,	\
              (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (&yylval, YYLEX_PARAM)
#else
# define YYLEX yylex (&yylval, yyscanner, interp)
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

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)		\
do {								\
  if (yydebug)							\
    {								\
      YYFPRINTF (stderr, "%s ", Title);				\
      yysymprint (stderr,					\
                  Type, Value);	\
      YYFPRINTF (stderr, "\n");					\
    }								\
} while (0)

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yy_stack_print (short int *bottom, short int *top)
#else
static void
yy_stack_print (bottom, top)
    short int *bottom;
    short int *top;
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
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu), ",
             yyrule - 1, yylno);
  /* Print the symbols being reduced, and their result.  */
  for (yyi = yyprhs[yyrule]; 0 <= yyrhs[yyi]; yyi++)
    YYFPRINTF (stderr, "%s ", yytname[yyrhs[yyi]]);
  YYFPRINTF (stderr, "-> %s\n", yytname[yyr1[yyrule]]);
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
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
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
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

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
  const char *yys = yystr;

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
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      size_t yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

#endif /* YYERROR_VERBOSE */



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
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);


# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
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
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvaluep;

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

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
int yyparse (void *yyscanner, Interp *interp);
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
yyparse (void *yyscanner, Interp *interp)
#else
int
yyparse (yyscanner, interp)
    void *yyscanner;
    Interp *interp;
#endif
#endif
{
  /* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;

  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  short int yyssa[YYINITDEPTH];
  short int *yyss = yyssa;
  short int *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



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
	short int *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	short int *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
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
/* Read a look-ahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to look-ahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
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
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
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

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

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
#line 484 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 5:
#line 493 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 6:
#line 494 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 7:
#line 495 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 8:
#line 496 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 497 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 498 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 499 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 12:
#line 500 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 13:
#line 501 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 14:
#line 504 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 15:
#line 505 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 16:
#line 506 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; do_loadlib(interp, (yyvsp[-1].s)); }
    break;

  case 17:
#line 510 "compilers/imcc/imcc.y"
    { if ((yyvsp[0].s))
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 18:
#line 518 "compilers/imcc/imcc.y"
    {
            STRING *hll_name, *hll_lib;
            hll_name = string_unescape_cstring(interp, (yyvsp[-2].s) + 1, '"', NULL);
            hll_lib =  string_unescape_cstring(interp, (yyvsp[0].s) + 1, '"', NULL);
            CONTEXT(((Interp*)interp)->ctx)->current_HLL = 
                Parrot_register_HLL(interp, hll_name, hll_lib);
            (yyval.t) = 0;
         }
    break;

  case 19:
#line 527 "compilers/imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                CONTEXT(((Interp*)interp)->ctx)->current_HLL, atoi((yyvsp[-2].s)), atoi((yyvsp[0].s)));
             (yyval.t) = 0;
         }
    break;

  case 20:
#line 536 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 21:
#line 542 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 22:
#line 550 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 23:
#line 551 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1);is_def=0; }
    break;

  case 24:
#line 555 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 25:
#line 556 "compilers/imcc/imcc.y"
    { (yyval.i) = mk_pmc_const(interp, cur_unit, (yyvsp[-3].s), (yyvsp[-2].sr), (yyvsp[0].s));is_def=0; }
    break;

  case 30:
#line 569 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 31:
#line 570 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 32:
#line 571 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 33:
#line 572 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 34:
#line 573 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 37:
#line 578 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 38:
#line 580 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, cur_unit, (yyvsp[-1].s),0,regs,nargs,keyvec,1);
                     free((yyvsp[-1].s)); }
    break;

  case 39:
#line 583 "compilers/imcc/imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                    }
    break;

  case 40:
#line 588 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, (yyvsp[0].s)));
                     cur_call->pcc_sub->pragma = (yyvsp[-1].t);
                   }
    break;

  case 41:
#line 594 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[0].sr)); }
    break;

  case 42:
#line 596 "compilers/imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, (yyvsp[0].s));
                       set_lexical(interp, r, (yyvsp[-2].s)); (yyval.i) = 0;
                   }
    break;

  case 43:
#line 600 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 45:
#line 608 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 46:
#line 610 "compilers/imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     (yyval.i)=0; }
    break;

  case 49:
#line 625 "compilers/imcc/imcc.y"
    {
                    int re_open = 0;
                    (yyval.i) = 0;
                    if (IMCC_INFO(interp)->state->pasm_file && cur_namespace) {
                        imc_close_unit(interp, cur_unit);
                        re_open = 1;
                    }
                    IMCC_INFO(interp)->cur_namespace = (yyvsp[-1].sr);
                    cur_namespace = (yyvsp[-1].sr);
                    if (re_open)
                        cur_unit = imc_open_unit(interp, IMC_PASM);
                }
    break;

  case 50:
#line 640 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[-1].sr); }
    break;

  case 51:
#line 641 "compilers/imcc/imcc.y"
    { (yyval.sr) = NULL; }
    break;

  case 52:
#line 646 "compilers/imcc/imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 53:
#line 650 "compilers/imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, (yyvsp[0].sr));
        }
    break;

  case 54:
#line 653 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = (yyvsp[-1].t); }
    break;

  case 55:
#line 655 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; }
    break;

  case 56:
#line 659 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 57:
#line 660 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 58:
#line 661 "compilers/imcc/imcc.y"
    { 
         if (adv_named_id) {
             add_pcc_named_param(interp,cur_call,adv_named_id,(yyvsp[-1].sr));
             adv_named_id = NULL;
         } else add_pcc_param(cur_call, (yyvsp[-1].sr));
   }
    break;

  case 59:
#line 670 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 60:
#line 670 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[0].sr); is_def=0; }
    break;

  case 61:
#line 674 "compilers/imcc/imcc.y"
    { if ((yyvsp[0].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[-1].s), (yyvsp[-2].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[-1].s), (yyvsp[-2].t));
                                         (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 62:
#line 679 "compilers/imcc/imcc.y"
    { 
                                         if ((yyvsp[0].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[-1].s), (yyvsp[-4].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[-1].s), (yyvsp[-4].t));
                                         (yyval.sr)->type |= (yyvsp[0].t);
                                         adv_named_set(interp,(yyvsp[-3].s));}
    break;

  case 63:
#line 689 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  }
    break;

  case 65:
#line 694 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 66:
#line 698 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; cur_unit->outer =
                     mk_sub_address_fromc(interp, (yyvsp[-1].s)); }
    break;

  case 67:
#line 701 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; cur_unit->outer =
                     mk_const(interp, (yyvsp[-1].s), 'S'); }
    break;

  case 68:
#line 706 "compilers/imcc/imcc.y"
    { add_pcc_multi(cur_call, NULL); }
    break;

  case 69:
#line 707 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; add_pcc_multi(cur_call, (yyvsp[0].sr)); }
    break;

  case 70:
#line 708 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  add_pcc_multi(cur_call, (yyvsp[0].sr));}
    break;

  case 71:
#line 712 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 72:
#line 713 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 73:
#line 714 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 74:
#line 715 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 75:
#line 716 "compilers/imcc/imcc.y"
    {
                          SymReg *r;
                          if (strcmp((yyvsp[0].s), "_"))
                              r = mk_const(interp, (yyvsp[0].s), 'S');
                          else {
                              free((yyvsp[0].s)),
                              r = mk_const(interp, str_dup("PMC"), 'S');
                           }
                           (yyval.sr) = r;
                      }
    break;

  case 76:
#line 726 "compilers/imcc/imcc.y"
    {
                          SymReg *r;
                          if (strcmp((yyvsp[0].s), "_"))
                              r = mk_const(interp, (yyvsp[0].s), 'S');
                          else {
                              free((yyvsp[0].s)),
                              r = mk_const(interp, str_dup("PMC"), 'S');
                           }
                           (yyval.sr) = r;
                      }
    break;

  case 77:
#line 736 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[-1].sr); }
    break;

  case 80:
#line 745 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 81:
#line 747 "compilers/imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, (yyvsp[0].s)));

         }
    break;

  case 82:
#line 751 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = (yyvsp[-1].t); }
    break;

  case 83:
#line 753 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; }
    break;

  case 84:
#line 758 "compilers/imcc/imcc.y"
    {
            char name[128];
            SymReg * r, *r1;
            Instruction *i;

            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
            (yyval.sr) = r = mk_pcc_sub(interp, str_dup(name), 0);
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
#line 785 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; }
    break;

  case 86:
#line 789 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 87:
#line 790 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 88:
#line 794 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; }
    break;

  case 89:
#line 796 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->object = (yyvsp[-1].sr); }
    break;

  case 90:
#line 800 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 92:
#line 805 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[0].t); }
    break;

  case 93:
#line 806 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[-2].t) | (yyvsp[0].t); }
    break;

  case 94:
#line 810 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_LOAD; }
    break;

  case 95:
#line 811 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_MAIN; }
    break;

  case 96:
#line 812 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_IMMEDIATE; }
    break;

  case 97:
#line 813 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_POSTCOMP; }
    break;

  case 98:
#line 814 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_ANON; }
    break;

  case 99:
#line 815 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_METHOD; }
    break;

  case 100:
#line 816 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_NEED_LEX; }
    break;

  case 103:
#line 823 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, (yyvsp[-3].sr));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         }
    break;

  case 104:
#line 828 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-1].sr)); }
    break;

  case 105:
#line 830 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, (yyvsp[-1].sr));
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 106:
#line 835 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-1].sr)); }
    break;

  case 107:
#line 837 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, (yyvsp[-1].s),'S')); }
    break;

  case 108:
#line 839 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-3].sr));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         }
    break;

  case 109:
#line 843 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, (yyvsp[-3].s),'S'));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         }
    break;

  case 110:
#line 850 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 111:
#line 851 "compilers/imcc/imcc.y"
    {  add_pcc_arg(cur_call, (yyvsp[-1].sr)); }
    break;

  case 112:
#line 855 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 113:
#line 860 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 114:
#line 861 "compilers/imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_result(cur_call, (yyvsp[-1].sr)); }
    break;

  case 115:
#line 865 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 116:
#line 866 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 117:
#line 867 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[0].idlist);
         if (l->unique_reg)
                 mk_ident_ur(interp, l->id, (yyvsp[-1].t));
             else
                 mk_ident(interp, l->id, (yyvsp[-1].t));
         is_def=0;
         (yyval.sr)=0;
     }
    break;

  case 118:
#line 879 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 119:
#line 880 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); }
    break;

  case 120:
#line 884 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_FLAT;   }
    break;

  case 121:
#line 885 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPTIONAL; }
    break;

  case 122:
#line 886 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPT_FLAG; }
    break;

  case 123:
#line 887 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_NAMED; }
    break;

  case 124:
#line 888 "compilers/imcc/imcc.y"
    {  adv_named_set(interp,(yyvsp[-1].s)); (yyval.t) = 0; }
    break;

  case 125:
#line 889 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_UNIQUE_REG; }
    break;

  case 126:
#line 894 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 127:
#line 895 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; }
    break;

  case 130:
#line 905 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, (yyvsp[-1].t)); }
    break;

  case 131:
#line 908 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 132:
#line 909 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.i) = 0;  }
    break;

  case 133:
#line 915 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 134:
#line 916 "compilers/imcc/imcc.y"
    {
       if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); 
   }
    break;

  case 135:
#line 919 "compilers/imcc/imcc.y"
    {
       if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); 
   }
    break;

  case 136:
#line 925 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 137:
#line 930 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 138:
#line 935 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 139:
#line 937 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 140:
#line 942 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 141:
#line 946 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 142:
#line 947 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id, (yyvsp[0].sr));
          adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr)); }
    break;

  case 143:
#line 953 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[-2].s),(yyvsp[0].sr));}
    break;

  case 144:
#line 955 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id,(yyvsp[0].sr));
           adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr));    }
    break;

  case 145:
#line 961 "compilers/imcc/imcc.y"
    {  
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[-2].s),(yyvsp[0].sr));}
    break;

  case 148:
#line 980 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 149:
#line 985 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[0].i); }
    break;

  case 150:
#line 986 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 151:
#line 987 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 152:
#line 988 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 153:
#line 992 "compilers/imcc/imcc.y"
    {  (yyval.i) = NULL; }
    break;

  case 157:
#line 1002 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iLABEL(cur_unit, mk_local_label(interp, (yyvsp[0].s)));
                   }
    break;

  case 158:
#line 1009 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[-1].i); }
    break;

  case 159:
#line 1014 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[0].idlist);
         l->next = NULL;
         (yyval.idlist) = l;
     }
    break;

  case 160:
#line 1021 "compilers/imcc/imcc.y"
    {  
         IdList* l = (yyvsp[0].idlist);
         l->next = (yyvsp[-2].idlist);
         (yyval.idlist) = l;
     }
    break;

  case 161:
#line 1030 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = (yyvsp[-1].s);
         l->unique_reg = 1;
         (yyval.idlist) = l;
     }
    break;

  case 162:
#line 1038 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = (yyvsp[0].s);
         l->unique_reg = 0;
         (yyval.idlist) = l;
     }
    break;

  case 165:
#line 1049 "compilers/imcc/imcc.y"
    { push_namespace((yyvsp[0].s)); }
    break;

  case 166:
#line 1050 "compilers/imcc/imcc.y"
    { pop_namespace((yyvsp[0].s)); }
    break;

  case 167:
#line 1051 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 168:
#line 1052 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[0].idlist);
         while(l) {
             IdList* l1;
             if (l->unique_reg)
                 mk_ident_ur(interp, l->id, (yyvsp[-1].t));
             else
                 mk_ident(interp, l->id, (yyvsp[-1].t));
             l1 = l;
             l = l->next;
             free(l1);
         }
         is_def=0; (yyval.i)=0;
     }
    break;

  case 169:
#line 1067 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, (yyvsp[0].sr), (yyvsp[-2].s)); (yyval.i) = 0;
                    }
    break;

  case 170:
#line 1070 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 171:
#line 1071 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 0);is_def=0; }
    break;

  case 173:
#line 1073 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 174:
#line 1074 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1);is_def=0; }
    break;

  case 175:
#line 1075 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 176:
#line 1079 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "branch",1, (yyvsp[0].sr)); }
    break;

  case 177:
#line 1081 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, cur_unit, (yyvsp[-1].s), 0, regs, nargs, keyvec, 1);
                                          free((yyvsp[-1].s)); }
    break;

  case 178:
#line 1084 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[0].sr)); }
    break;

  case 179:
#line 1085 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; cur_call = NULL; }
    break;

  case 180:
#line 1086 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 182:
#line 1088 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 183:
#line 1092 "compilers/imcc/imcc.y"
    { (yyval.t) = 'I'; }
    break;

  case 184:
#line 1093 "compilers/imcc/imcc.y"
    { (yyval.t) = 'N'; }
    break;

  case 185:
#line 1094 "compilers/imcc/imcc.y"
    { (yyval.t) = 'S'; }
    break;

  case 186:
#line 1095 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 187:
#line 1096 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 188:
#line 1097 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; free((yyvsp[0].s)); }
    break;

  case 189:
#line 1102 "compilers/imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, (yyvsp[0].s), 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", (yyvsp[0].s));
            }
         }
    break;

  case 190:
#line 1112 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "set", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 191:
#line 1113 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "not", 2, (yyvsp[-3].sr), (yyvsp[0].sr));}
    break;

  case 192:
#line 1114 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "neg", 2, (yyvsp[-3].sr), (yyvsp[0].sr));}
    break;

  case 193:
#line 1115 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bnot", 2, (yyvsp[-3].sr), (yyvsp[0].sr));}
    break;

  case 194:
#line 1116 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "add", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 195:
#line 1117 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "sub", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 196:
#line 1118 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mul", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 197:
#line 1119 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "pow", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 198:
#line 1120 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "div", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 199:
#line 1121 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "fdiv", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 200:
#line 1122 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mod", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 201:
#line 1123 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "concat", 3, (yyvsp[-4].sr),(yyvsp[-2].sr),(yyvsp[0].sr)); }
    break;

  case 202:
#line 1124 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "iseq", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 203:
#line 1125 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isne", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 204:
#line 1126 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isgt", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 205:
#line 1127 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "islt", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 206:
#line 1128 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isle", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 207:
#line 1129 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isge", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 208:
#line 1131 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shl", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 209:
#line 1133 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 210:
#line 1135 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "lsr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 211:
#line 1137 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "and", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 212:
#line 1139 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "or", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 213:
#line 1141 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "xor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 214:
#line 1143 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "band", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 215:
#line 1145 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 216:
#line 1147 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bxor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 217:
#line 1149 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); }
    break;

  case 218:
#line 1151 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[0].sr)); }
    break;

  case 219:
#line 1153 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-2].s), (yyvsp[0].sr), 1); }
    break;

  case 220:
#line 1155 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-6].sr), (yyvsp[-3].s), (yyvsp[-1].sr), 1); }
    break;

  case 221:
#line 1157 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-3].sr), (yyvsp[0].s), NULL, 1); }
    break;

  case 222:
#line 1159 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[-3].sr), (yyvsp[0].sr)); }
    break;

  case 223:
#line 1161 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[-5].sr), (yyvsp[-1].sr)); }
    break;

  case 224:
#line 1163 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 225:
#line 1165 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-6].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); }
    break;

  case 226:
#line 1167 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "set_addr",
                            2, (yyvsp[-3].sr), mk_label_address(interp, (yyvsp[0].s))); }
    break;

  case 227:
#line 1170 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "find_global",2,(yyvsp[-3].sr),(yyvsp[0].sr));}
    break;

  case 228:
#line 1172 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "store_global",2, (yyvsp[-2].sr),(yyvsp[0].sr)); }
    break;

  case 229:
#line 1176 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 230:
#line 1178 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 231:
#line 1180 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); }
    break;

  case 232:
#line 1183 "compilers/imcc/imcc.y"
    {
            add_pcc_result((yyvsp[0].i)->r[0], (yyvsp[-2].sr));
            cur_call = NULL;
            (yyval.i) = 0;
         }
    break;

  case 233:
#line 1189 "compilers/imcc/imcc.y"
    {
            (yyval.i) = IMCC_create_itcall_label(interp);
         }
    break;

  case 234:
#line 1193 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[-3].sr));
           cur_call = NULL;
         }
    break;

  case 238:
#line 1201 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[-2].sr)); }
    break;

  case 239:
#line 1204 "compilers/imcc/imcc.y"
    { (yyval.i) = IMCC_create_itcall_label(interp);
                           (yyval.i)->type &= ~ITCALL; (yyval.i)->type |= ITRESULT; }
    break;

  case 240:
#line 1206 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 241:
#line 1211 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "add", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 242:
#line 1213 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "sub", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 243:
#line 1215 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mul", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 244:
#line 1217 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "div", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 245:
#line 1219 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mod", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 246:
#line 1221 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "fdiv", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 247:
#line 1223 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "concat", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 248:
#line 1225 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "band", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 249:
#line 1227 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 250:
#line 1229 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bxor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 251:
#line 1231 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 252:
#line 1233 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shl", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 253:
#line 1235 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "lsr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 254:
#line 1240 "compilers/imcc/imcc.y"
    { (yyval.i) = func_ins(interp, cur_unit, (yyvsp[-3].sr), (yyvsp[-1].s),
                                   regs,nargs,keyvec,1);
                     free((yyvsp[-1].s));
                   }
    break;

  case 255:
#line 1246 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); }
    break;

  case 256:
#line 1247 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); }
    break;

  case 257:
#line 1248 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[0].s)); }
    break;

  case 258:
#line 1249 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[0].sr);
                       if ((yyvsp[0].sr)->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 259:
#line 1254 "compilers/imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 260:
#line 1255 "compilers/imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); }
    break;

  case 261:
#line 1256 "compilers/imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 262:
#line 1259 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 263:
#line 1260 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 264:
#line 1265 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[0].sr));
        }
    break;

  case 265:
#line 1270 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[-3].i); }
    break;

  case 266:
#line 1274 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 267:
#line 1275 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call, adv_named_id, (yyvsp[0].sr));
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, (yyvsp[0].sr)); 
   }
    break;

  case 268:
#line 1281 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call,adv_named_id,(yyvsp[0].sr));
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, (yyvsp[0].sr));
   }
    break;

  case 269:
#line 1287 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0;
                                     add_pcc_named_arg(interp,cur_call,(yyvsp[-2].s),(yyvsp[0].sr));}
    break;

  case 270:
#line 1289 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_named_arg(interp,cur_call,(yyvsp[-2].s),(yyvsp[0].sr));}
    break;

  case 271:
#line 1293 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 272:
#line 1297 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 273:
#line 1298 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); }
    break;

  case 274:
#line 1302 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT; }
    break;

  case 275:
#line 1303 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_NAMED; }
    break;

  case 276:
#line 1304 "compilers/imcc/imcc.y"
    { adv_named_set(interp,(yyvsp[-1].s)); (yyval.t) = 0; }
    break;

  case 277:
#line 1307 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 278:
#line 1311 "compilers/imcc/imcc.y"
    { 
         (yyval.sr) = 0;
         if (adv_named_id) {
             add_pcc_named_result(interp,cur_call,adv_named_id,(yyvsp[0].sr));
             adv_named_id = NULL;
         } else add_pcc_result(cur_call, (yyvsp[0].sr)); }
    break;

  case 279:
#line 1317 "compilers/imcc/imcc.y"
    { 
        add_pcc_named_result(interp,cur_call,(yyvsp[-2].s),(yyvsp[0].sr)); }
    break;

  case 280:
#line 1319 "compilers/imcc/imcc.y"
    { 
       (yyval.sr) = 0;
       if (adv_named_id) {
           add_pcc_named_result(interp,cur_call,adv_named_id,(yyvsp[0].sr));
           adv_named_id = NULL;
       } else add_pcc_result(cur_call, (yyvsp[0].sr)); }
    break;

  case 281:
#line 1325 "compilers/imcc/imcc.y"
    { add_pcc_named_result(interp,cur_call,(yyvsp[-2].s),(yyvsp[0].sr)); }
    break;

  case 282:
#line 1326 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 283:
#line 1331 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, (yyvsp[-3].s), 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 284:
#line 1333 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, inv_op((yyvsp[-3].s)), 3, (yyvsp[-4].sr),(yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 285:
#line 1335 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 286:
#line 1337 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 287:
#line 1339 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 288:
#line 1341 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless",2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 289:
#line 1343 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 290:
#line 1345 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 291:
#line 1349 "compilers/imcc/imcc.y"
    {  (yyval.s) = "eq"; }
    break;

  case 292:
#line 1350 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ne"; }
    break;

  case 293:
#line 1351 "compilers/imcc/imcc.y"
    {  (yyval.s) = "gt"; }
    break;

  case 294:
#line 1352 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ge"; }
    break;

  case 295:
#line 1353 "compilers/imcc/imcc.y"
    {  (yyval.s) = "lt"; }
    break;

  case 296:
#line 1354 "compilers/imcc/imcc.y"
    {  (yyval.s) = "le"; }
    break;

  case 299:
#line 1363 "compilers/imcc/imcc.y"
    {  (yyval.sr) = NULL; }
    break;

  case 300:
#line 1364 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 301:
#line 1368 "compilers/imcc/imcc.y"
    { (yyval.sr) = regs[0]; }
    break;

  case 303:
#line 1373 "compilers/imcc/imcc.y"
    {  regs[nargs++] = (yyvsp[0].sr); }
    break;

  case 304:
#line 1375 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = (yyvsp[-3].sr);
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = (yyvsp[-1].sr);
                      (yyval.sr) = (yyvsp[-3].sr);
                   }
    break;

  case 305:
#line 1382 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = (yyvsp[-1].sr);
                      (yyval.sr) = (yyvsp[-1].sr);
                   }
    break;

  case 307:
#line 1389 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); }
    break;

  case 308:
#line 1390 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[0].s)); }
    break;

  case 309:
#line 1394 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); }
    break;

  case 310:
#line 1395 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); }
    break;

  case 311:
#line 1399 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); }
    break;

  case 312:
#line 1400 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); }
    break;

  case 317:
#line 1413 "compilers/imcc/imcc.y"
    {  nkeys = 0; in_slice = 0; }
    break;

  case 318:
#line 1414 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp, nkeys, keys, 0); }
    break;

  case 319:
#line 1417 "compilers/imcc/imcc.y"
    {  nkeys = 0; in_slice = 0; }
    break;

  case 320:
#line 1418 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp, nkeys, keys, 1); }
    break;

  case 321:
#line 1422 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[0].sr); }
    break;

  case 322:
#line 1424 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[0].sr); (yyval.sr) =  keys[0]; }
    break;

  case 323:
#line 1425 "compilers/imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 324:
#line 1426 "compilers/imcc/imcc.y"
    { keys[nkeys++] = (yyvsp[0].sr); (yyval.sr) =  keys[0]; }
    break;

  case 325:
#line 1430 "compilers/imcc/imcc.y"
    { if (in_slice) {
                         (yyvsp[0].sr)->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     (yyval.sr) = (yyvsp[0].sr);
                   }
    break;

  case 326:
#line 1436 "compilers/imcc/imcc.y"
    { (yyvsp[-2].sr)->type |= VT_START_SLICE;  (yyvsp[0].sr)->type |= VT_END_SLICE;
                     keys[nkeys++] = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 327:
#line 1438 "compilers/imcc/imcc.y"
    { (yyvsp[0].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 328:
#line 1439 "compilers/imcc/imcc.y"
    { (yyvsp[-1].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[-1].sr); }
    break;

  case 329:
#line 1443 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'I'); }
    break;

  case 330:
#line 1444 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'N'); }
    break;

  case 331:
#line 1445 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); }
    break;

  case 332:
#line 1446 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'P'); }
    break;

  case 333:
#line 1447 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_pasm_reg(interp, (yyvsp[0].s)); }
    break;

  case 334:
#line 1451 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'I'); }
    break;

  case 335:
#line 1452 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'N'); }
    break;

  case 336:
#line 1453 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); }
    break;

  case 337:
#line 1454 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'U'); }
    break;

  case 338:
#line 1458 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); }
    break;

  case 339:
#line 1459 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); }
    break;


      default: break;
    }

/* Line 1126 of yacc.c.  */
#line 4105 "compilers/imcc/imcparser.c"

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
	  int yytype = YYTRANSLATE (yychar);
	  YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
	  YYSIZE_T yysize = yysize0;
	  YYSIZE_T yysize1;
	  int yysize_overflow = 0;
	  char *yymsg = 0;
#	  define YYERROR_VERBOSE_ARGS_MAXIMUM 5
	  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
	  int yyx;

#if 0
	  /* This is so xgettext sees the translatable formats that are
	     constructed on the fly.  */
	  YY_("syntax error, unexpected %s");
	  YY_("syntax error, unexpected %s, expecting %s");
	  YY_("syntax error, unexpected %s, expecting %s or %s");
	  YY_("syntax error, unexpected %s, expecting %s or %s or %s");
	  YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
#endif
	  char *yyfmt;
	  char const *yyf;
	  static char const yyunexpected[] = "syntax error, unexpected %s";
	  static char const yyexpecting[] = ", expecting %s";
	  static char const yyor[] = " or %s";
	  char yyformat[sizeof yyunexpected
			+ sizeof yyexpecting - 1
			+ ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
			   * (sizeof yyor - 1))];
	  char const *yyprefix = yyexpecting;

	  /* Start YYX at -YYN if negative to avoid negative indexes in
	     YYCHECK.  */
	  int yyxbegin = yyn < 0 ? -yyn : 0;

	  /* Stay within bounds of both yycheck and yytname.  */
	  int yychecklim = YYLAST - yyn;
	  int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
	  int yycount = 1;

	  yyarg[0] = yytname[yytype];
	  yyfmt = yystpcpy (yyformat, yyunexpected);

	  for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	      {
		if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
		  {
		    yycount = 1;
		    yysize = yysize0;
		    yyformat[sizeof yyunexpected - 1] = '\0';
		    break;
		  }
		yyarg[yycount++] = yytname[yyx];
		yysize1 = yysize + yytnamerr (0, yytname[yyx]);
		yysize_overflow |= yysize1 < yysize;
		yysize = yysize1;
		yyfmt = yystpcpy (yyfmt, yyprefix);
		yyprefix = yyor;
	      }

	  yyf = YY_(yyformat);
	  yysize1 = yysize + yystrlen (yyf);
	  yysize_overflow |= yysize1 < yysize;
	  yysize = yysize1;

	  if (!yysize_overflow && yysize <= YYSTACK_ALLOC_MAXIMUM)
	    yymsg = (char *) YYSTACK_ALLOC (yysize);
	  if (yymsg)
	    {
	      /* Avoid sprintf, as that infringes on the user's name space.
		 Don't have undefined behavior even if the translation
		 produced a string with the wrong number of "%s"s.  */
	      char *yyp = yymsg;
	      int yyi = 0;
	      while ((*yyp = *yyf))
		{
		  if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		    {
		      yyp += yytnamerr (yyp, yyarg[yyi++]);
		      yyf += 2;
		    }
		  else
		    {
		      yyp++;
		      yyf++;
		    }
		}
	      yyerror (yyscanner, interp, yymsg);
	      YYSTACK_FREE (yymsg);
	    }
	  else
	    {
	      yyerror (yyscanner, interp, YY_("syntax error"));
	      goto yyexhaustedlab;
	    }
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror (yyscanner, interp, YY_("syntax error"));
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
        {
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
        }
      else
	{
	  yydestruct ("Error: discarding", yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (0)
     goto yyerrorlab;

yyvsp -= yylen;
  yyssp -= yylen;
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
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


      yydestruct ("Error: popping", yystos[yystate], yyvsp);
      YYPOPSTACK;
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token. */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

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
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (yyscanner, interp, YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK;
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  return yyresult;
}


#line 1464 "compilers/imcc/imcc.y"



int yyerror(void *yyscanner, Interp *interp, char * s)
{
    UNUSED(yyscanner);
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

