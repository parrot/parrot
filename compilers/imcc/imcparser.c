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
     ADV_MAYBE_FLAT = 275,
     NEW = 276,
     NAMESPACE = 277,
     ENDNAMESPACE = 278,
     DOT_METHOD = 279,
     SUB = 280,
     SYM = 281,
     LOCAL = 282,
     LEXICAL = 283,
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
     YIELDT = 321,
     GET_RESULTS = 322,
     POW = 323,
     SHIFT_RIGHT_U = 324,
     LOG_AND = 325,
     LOG_OR = 326,
     COMMA = 327,
     ESUB = 328,
     DOTDOT = 329,
     PCC_BEGIN = 330,
     PCC_END = 331,
     PCC_CALL = 332,
     PCC_SUB = 333,
     PCC_BEGIN_RETURN = 334,
     PCC_END_RETURN = 335,
     PCC_BEGIN_YIELD = 336,
     PCC_END_YIELD = 337,
     NCI_CALL = 338,
     METH_CALL = 339,
     INVOCANT = 340,
     MAIN = 341,
     LOAD = 342,
     IMMEDIATE = 343,
     POSTCOMP = 344,
     METHOD = 345,
     ANON = 346,
     OUTER = 347,
     NEED_LEX = 348,
     MULTI = 349,
     VTABLE_METHOD = 350,
     LOADLIB = 351,
     UNIQUE_REG = 352,
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
#define ADV_MAYBE_FLAT 275
#define NEW 276
#define NAMESPACE 277
#define ENDNAMESPACE 278
#define DOT_METHOD 279
#define SUB 280
#define SYM 281
#define LOCAL 282
#define LEXICAL 283
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
#define YIELDT 321
#define GET_RESULTS 322
#define POW 323
#define SHIFT_RIGHT_U 324
#define LOG_AND 325
#define LOG_OR 326
#define COMMA 327
#define ESUB 328
#define DOTDOT 329
#define PCC_BEGIN 330
#define PCC_END 331
#define PCC_CALL 332
#define PCC_SUB 333
#define PCC_BEGIN_RETURN 334
#define PCC_END_RETURN 335
#define PCC_BEGIN_YIELD 336
#define PCC_END_YIELD 337
#define NCI_CALL 338
#define METH_CALL 339
#define INVOCANT 340
#define MAIN 341
#define LOAD 342
#define IMMEDIATE 343
#define POSTCOMP 344
#define METHOD 345
#define ANON 346
#define OUTER 347
#define NEED_LEX 348
#define MULTI 349
#define VTABLE_METHOD 350
#define LOADLIB 351
#define UNIQUE_REG 352
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
 * we use a pure parser with the interpreter as a parameter this still
 * doesn't make the parser reentrant, there are too many globals
 * around.
 */

/*
 * Choosing instructions for Parrot is pretty easy since many are
 * polymorphic.
 */


/*
 * Some convenient vars
 */
/* FIXME: Remove this global variable... */
/* SymReg *cur_namespace;  ugly hack for mk_address */

/*
 * MK_I: build and emitb instruction by INS
 *
 * fmt may contain:
 *   op %s, %s # comment
 * or just
 *   op
 *
 *
 *  NOTE: Most usage of this function is with
 *        IMCC_INFO(interpreter)->cur_unit, but there are some
 *        exceptions. Thus, we can't easily factorize that piece of
 *        code.
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
    return INS(interpreter, unit, opname, fmt, r, n, 
               IMCC_INFO(interpreter)->keyvec, 1);
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
    } else {
        name = constant;
    }
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

static void clear_state(Interp *interp)
{
    IMCC_INFO(interp) -> nargs = 0;
    IMCC_INFO(interp) -> keyvec = 0;
}

Instruction * INS_LABEL(Interp * interp, IMC_Unit * unit, SymReg * r0, int emit)
{

    Instruction *ins;

    ins = _mk_instruction("","%s:", 1, &r0, 0);
    ins->type = ITLABEL;
    r0->first_ins = ins;
    if (emit)
        emitb(interp, unit, ins);
    return ins;
}

static Instruction * iLABEL(Interp *interp, IMC_Unit * unit, SymReg * r0) {
    Instruction *i = INS_LABEL(interp, unit, r0, 1);
    i->line = IMCC_INFO(interp)->line;
    clear_state(interp);
    return i;
}

static Instruction * iSUBROUTINE(Interp *interp, IMC_Unit * unit, SymReg * r) {
    Instruction *i;
    i =  iLABEL(interp, unit, r);
    r->type = (r->type & VT_ENCODED) ? VT_PCC_SUB|VT_ENCODED : VT_PCC_SUB;
    r->pcc_sub = calloc(1, sizeof(struct pcc_sub_t));
    IMCC_INFO(interp)->cur_call = r;
    i->line = IMCC_INFO(interp)->line;
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
    IMCC_INFO(interp) -> keyvec |= KEY_BIT(2);
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
        IMCC_INFO(interp) -> keyvec |= KEY_BIT(1);
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

    sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, IMCC_INFO(interpreter)->cnr++);
    r = mk_pcc_sub(interpreter, str_dup(name), 0);
    i = iLABEL(interpreter, IMCC_INFO(interpreter)->cur_unit, r);
    IMCC_INFO(interpreter)->cur_call = r;
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
    IMCC_INFO(interp)->cur_call->pcc_sub->sub = sub;
    if (IMCC_INFO(interp)->cur_obj) {
        if (IMCC_INFO(interp)->cur_obj->set != 'P')
            IMCC_fataly(interp, E_SyntaxError, "object isn't a PMC");
        IMCC_INFO(interp)->cur_call->pcc_sub->object = IMCC_INFO(interp)->cur_obj;
        IMCC_INFO(interp)->cur_obj = NULL;
    }
    if (IMCC_INFO(interp)->cur_call->pcc_sub->sub->pmc_type == enum_class_NCI)
        IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isNCI;
    if (IMCC_INFO(interp)->cur_unit->type == IMC_PCCSUB)
        IMCC_INFO(interp)->cur_unit->instructions->r[0]->pcc_sub->calls_a_sub |= 1;
}

static void
begin_return_or_yield(Interp *interp, int yield)
{
    Instruction *i, *ins;
    char name[128];
    ins = IMCC_INFO(interp)->cur_unit->instructions;
    if(!ins || !ins->r[0] || !(ins->r[0]->type & VT_PCC_SUB))
        IMCC_fataly(interp, E_SyntaxError,
                    "yield or return directive outside pcc subroutine\n");
    if(yield)
       ins->r[0]->pcc_sub->calls_a_sub = 1 | ITPCCYIELD;
    sprintf(name, yield ? "%cpcc_sub_yield_%d" : "%cpcc_sub_ret_%d", 
            IMCC_INTERNAL_CHAR, IMCC_INFO(interp)->cnr++);
    interp->imc_info->sr_return = mk_pcc_sub(interp, str_dup(name), 0);
    i = iLABEL(interp, IMCC_INFO(interp)->cur_unit, interp->imc_info->sr_return);
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
    if (IMCC_INFO(interp)->adv_named_id) {
        IMCC_fataly(interp, E_SyntaxError,
                    "Named parameter with more than one name.\n");
    }
    IMCC_INFO(interp)->adv_named_id = name;
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
#line 384 "compilers/imcc/imcc.y"
typedef union YYSTYPE {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} YYSTYPE;
/* Line 196 of yacc.c.  */
#line 714 "compilers/imcc/imcparser.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 219 of yacc.c.  */
#line 726 "compilers/imcc/imcparser.c"

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
#define YYLAST   819

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  136
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  120
/* YYNRULES -- Number of rules. */
#define YYNRULES  344
/* YYNRULES -- Number of states. */
#define YYNSTATES  597

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   374

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

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
static const unsigned short int yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    25,    27,    29,    33,    36,    40,    43,    48,
      53,    57,    63,    64,    71,    72,    79,    81,    83,    85,
      88,    92,    95,    97,    99,   101,   103,   105,   106,   110,
     111,   116,   119,   124,   125,   127,   128,   133,   134,   136,
     140,   144,   145,   146,   147,   148,   159,   160,   162,   166,
     167,   171,   175,   181,   182,   184,   189,   194,   199,   201,
     206,   207,   211,   213,   215,   217,   219,   221,   223,   225,
     229,   230,   232,   233,   234,   235,   246,   247,   257,   258,
     261,   262,   266,   267,   269,   271,   275,   277,   279,   281,
     283,   285,   287,   289,   291,   293,   295,   301,   305,   309,
     313,   317,   323,   329,   330,   334,   337,   338,   342,   346,
     347,   352,   353,   356,   358,   360,   362,   364,   369,   371,
     373,   375,   377,   379,   380,   386,   388,   389,   392,   396,
     400,   401,   407,   408,   414,   415,   417,   421,   425,   431,
     433,   436,   437,   440,   443,   445,   447,   448,   450,   453,
     455,   457,   461,   464,   466,   470,   473,   475,   477,   479,
     482,   485,   486,   491,   496,   497,   504,   506,   507,   514,
     517,   520,   523,   526,   528,   530,   532,   533,   535,   537,
     539,   541,   543,   545,   547,   551,   556,   561,   566,   572,
     578,   584,   590,   596,   602,   608,   614,   620,   626,   632,
     638,   644,   650,   656,   662,   668,   674,   680,   686,   692,
     698,   704,   711,   718,   725,   733,   738,   743,   750,   757,
     765,   770,   775,   780,   785,   792,   800,   804,   805,   815,
     817,   819,   821,   825,   826,   832,   836,   840,   844,   848,
     852,   856,   860,   864,   868,   872,   876,   880,   884,   889,
     891,   893,   895,   897,   901,   905,   909,   911,   913,   914,
     920,   921,   925,   927,   933,   937,   940,   941,   944,   946,
     948,   950,   955,   958,   962,   968,   970,   974,   975,   982,
     989,   995,  1001,  1006,  1011,  1016,  1021,  1023,  1025,  1027,
    1029,  1031,  1033,  1035,  1037,  1038,  1040,  1044,  1046,  1048,
    1053,  1057,  1059,  1061,  1063,  1065,  1067,  1069,  1071,  1073,
    1075,  1077,  1079,  1080,  1083,  1084,  1087,  1089,  1093,  1094,
    1099,  1101,  1105,  1108,  1111,  1113,  1115,  1117,  1119,  1121,
    1123,  1125,  1127,  1129,  1131
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     137,     0,    -1,   138,    -1,   139,    -1,   138,   139,    -1,
     158,    -1,   144,    -1,   143,    -1,   160,    -1,   175,    -1,
     155,    -1,   108,     4,    -1,   140,    -1,     4,    -1,     6,
     141,     4,    -1,   142,     4,    -1,    97,   110,     4,    -1,
       7,   111,    -1,     8,   110,    73,   110,    -1,     9,   111,
      73,   111,    -1,    62,   217,   106,    -1,    62,   217,   106,
     121,   254,    -1,    -1,    30,   145,   217,   106,   121,   254,
      -1,    -1,    30,   147,   111,   244,   121,   148,    -1,   110,
      -1,   113,    -1,   150,    -1,   149,   150,    -1,   207,   151,
       4,    -1,   108,     4,    -1,   117,    -1,   116,    -1,   158,
      -1,   146,    -1,   140,    -1,    -1,   152,   114,   154,    -1,
      -1,    79,   153,   183,    99,    -1,    14,   245,    -1,    29,
     110,    73,   107,    -1,    -1,   238,    -1,    -1,   100,   156,
     157,   101,    -1,    -1,   149,    -1,    23,   159,     4,    -1,
     122,   246,   123,    -1,    -1,    -1,    -1,    -1,    26,   161,
     241,   162,   183,     4,   163,   164,   174,    74,    -1,    -1,
       4,    -1,   164,   165,     4,    -1,    -1,     5,   166,   167,
      -1,   217,   106,   192,    -1,   217,   110,    20,   106,   192,
      -1,    -1,    73,    -1,    95,   124,   172,   125,    -1,    93,
     124,   110,   125,    -1,    93,   124,   106,   125,    -1,    96,
      -1,    96,   124,   110,   125,    -1,    -1,   172,    73,   173,
      -1,   173,    -1,    50,    -1,    51,    -1,    53,    -1,    52,
      -1,   106,    -1,   110,    -1,   122,   246,   123,    -1,    -1,
     204,    -1,    -1,    -1,    -1,    79,   176,   106,   177,   183,
       4,   178,   164,   174,    74,    -1,    -1,    76,     4,   180,
     187,   182,   186,   181,   189,    77,    -1,    -1,   209,     4,
      -1,    -1,    86,   245,     4,    -1,    -1,   184,    -1,   185,
      -1,   184,   168,   185,    -1,    88,    -1,    87,    -1,    89,
      -1,    90,    -1,    92,    -1,    91,    -1,    94,    -1,   169,
      -1,   170,    -1,   171,    -1,    78,   245,    73,   245,     4,
      -1,    78,   245,     4,    -1,    84,   245,     4,    -1,    85,
     237,     4,    -1,    85,   110,     4,    -1,    85,   237,    73,
     245,     4,    -1,    85,   110,    73,   245,     4,    -1,    -1,
     187,   188,     4,    -1,    11,   230,    -1,    -1,   189,   190,
       4,    -1,    65,   237,   192,    -1,    -1,    28,   191,   217,
     212,    -1,    -1,   192,   193,    -1,    16,    -1,    17,    -1,
      18,    -1,    19,    -1,    19,   124,   110,   125,    -1,    98,
      -1,    80,    -1,    82,    -1,    81,    -1,    83,    -1,    -1,
     194,     4,   197,   198,   195,    -1,   200,    -1,    -1,   198,
       4,    -1,   198,   199,     4,    -1,    66,   245,   231,    -1,
      -1,    66,   124,   201,   203,   125,    -1,    -1,    67,   124,
     202,   203,   125,    -1,    -1,   230,    -1,   110,    20,   245,
      -1,   203,    73,   230,    -1,   203,    73,   110,    20,   245,
      -1,   206,    -1,   204,   206,    -1,    -1,   205,   210,    -1,
     108,     4,    -1,   117,    -1,   116,    -1,    -1,   208,    -1,
     208,   209,    -1,   209,    -1,    99,    -1,   207,   213,     4,
      -1,     1,     4,    -1,   212,    -1,   211,    73,   212,    -1,
     106,    98,    -1,   106,    -1,   219,    -1,   235,    -1,    23,
     106,    -1,    24,   106,    -1,    -1,    28,   214,   217,   211,
      -1,    29,   110,    73,   237,    -1,    -1,    30,   215,   217,
     106,   121,   254,    -1,   146,    -1,    -1,    33,   216,   217,
     106,   121,   254,    -1,    66,   227,    -1,    10,   243,    -1,
     114,   238,    -1,    14,   245,    -1,   227,    -1,   179,    -1,
     196,    -1,    -1,    50,    -1,    51,    -1,    52,    -1,    53,
      -1,    54,    -1,   218,    -1,   106,    -1,   237,   121,   245,
      -1,   237,   121,   126,   245,    -1,   237,   121,   127,   245,
      -1,   237,   121,   128,   245,    -1,   237,   121,   245,   129,
     245,    -1,   237,   121,   245,   127,   245,    -1,   237,   121,
     245,   130,   245,    -1,   237,   121,   245,    69,   245,    -1,
     237,   121,   245,   131,   245,    -1,   237,   121,   245,    42,
     245,    -1,   237,   121,   245,   132,   245,    -1,   237,   121,
     245,   119,   245,    -1,   237,   121,   245,    56,   245,    -1,
     237,   121,   245,    57,   245,    -1,   237,   121,   245,    58,
     245,    -1,   237,   121,   245,    60,   245,    -1,   237,   121,
     245,    61,   245,    -1,   237,   121,   245,    59,   245,    -1,
     237,   121,   245,    48,   245,    -1,   237,   121,   245,    49,
     245,    -1,   237,   121,   245,    70,   245,    -1,   237,   121,
     245,    71,   245,    -1,   237,   121,   245,    72,   245,    -1,
     237,   121,   245,    55,   245,    -1,   237,   121,   245,   133,
     245,    -1,   237,   121,   245,   134,   245,    -1,   237,   121,
     245,   128,   245,    -1,   237,   121,   245,   122,   246,   123,
      -1,   237,   122,   246,   123,   121,   245,    -1,   237,   121,
      22,   218,    73,   245,    -1,   237,   121,    22,   218,   122,
     246,   123,    -1,   237,   121,    22,   218,    -1,   237,   121,
      22,   245,    -1,   237,   121,    22,   122,   246,   123,    -1,
     237,   121,    22,   245,    73,   245,    -1,   237,   121,    22,
     245,   122,   246,   123,    -1,   237,   121,    64,   106,    -1,
     237,   121,    63,   255,    -1,    63,   255,   121,   245,    -1,
      22,   237,    73,   245,    -1,    22,   237,    73,   245,    73,
     245,    -1,    22,   237,    73,   245,   122,   246,   123,    -1,
     237,   121,   227,    -1,    -1,   124,   220,   234,   125,   121,
     225,   124,   229,   125,    -1,   221,    -1,   223,    -1,   224,
      -1,   237,   121,    14,    -1,    -1,    68,   222,   124,   234,
     125,    -1,   237,    34,   245,    -1,   237,    35,   245,    -1,
     237,    36,   245,    -1,   237,    37,   245,    -1,   237,    44,
     245,    -1,   237,    43,   245,    -1,   237,    38,   245,    -1,
     237,    39,   245,    -1,   237,    40,   245,    -1,   237,    41,
     245,    -1,   237,    45,   245,    -1,   237,    46,   245,    -1,
     237,    47,   245,    -1,   237,   121,   114,   154,    -1,   106,
      -1,   110,    -1,   113,    -1,   237,    -1,   237,   226,   242,
      -1,   237,   226,   110,    -1,   237,   226,   237,    -1,   120,
      -1,   118,    -1,    -1,   225,   228,   124,   229,   125,    -1,
      -1,   229,    73,   230,    -1,   230,    -1,   229,    73,   110,
      20,   245,    -1,   110,    20,   245,    -1,   245,   231,    -1,
      -1,   231,   232,    -1,    15,    -1,    21,    -1,    19,    -1,
      19,   124,   110,   125,    -1,   237,   192,    -1,   234,    73,
     233,    -1,   234,    73,   110,    20,   237,    -1,   233,    -1,
     110,    20,   237,    -1,    -1,    12,   245,   236,   245,    10,
     243,    -1,    13,   245,   236,   245,    10,   243,    -1,    12,
      14,   245,    10,   243,    -1,    13,    14,   245,    10,   243,
      -1,    12,   245,    10,   243,    -1,    13,   245,    10,   243,
      -1,    12,   245,    73,   243,    -1,    13,   245,    73,   243,
      -1,    56,    -1,    57,    -1,    58,    -1,    59,    -1,    60,
      -1,    61,    -1,   115,    -1,   253,    -1,    -1,   239,    -1,
     239,    73,   240,    -1,   240,    -1,   244,    -1,   237,   122,
     246,   123,    -1,   122,   248,   123,    -1,   242,    -1,   110,
      -1,   113,    -1,   106,    -1,   114,    -1,   106,    -1,   114,
      -1,   243,    -1,   245,    -1,   237,    -1,   254,    -1,    -1,
     247,   250,    -1,    -1,   249,   250,    -1,   252,    -1,   250,
     135,   252,    -1,    -1,   250,    73,   251,   252,    -1,   245,
      -1,   245,    75,   245,    -1,    75,   245,    -1,   245,    75,
      -1,   102,    -1,   103,    -1,   104,    -1,   105,    -1,   107,
      -1,   111,    -1,   112,    -1,   110,    -1,   113,    -1,   104,
      -1,   110,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   476,   476,   480,   481,   485,   486,   487,   488,   491,
     494,   497,   498,   499,   502,   503,   504,   507,   515,   524,
     533,   539,   548,   548,   553,   553,   557,   558,   562,   563,
     567,   568,   569,   570,   571,   572,   573,   576,   576,   583,
     582,   593,   595,   600,   604,   608,   608,   618,   620,   624,
     639,   640,   645,   649,   652,   644,   658,   659,   660,   670,
     670,   674,   679,   689,   690,   694,   697,   700,   705,   709,
     716,   717,   718,   722,   723,   724,   725,   726,   736,   746,
     749,   751,   755,   756,   757,   755,   764,   763,   796,   797,
     801,   802,   807,   808,   812,   813,   817,   818,   819,   820,
     821,   822,   823,   824,   825,   826,   830,   835,   837,   842,
     844,   846,   850,   858,   859,   863,   868,   869,   873,   874,
     874,   887,   888,   892,   893,   894,   895,   896,   897,   902,
     903,   907,   908,   913,   912,   917,   923,   924,   927,   933,
     938,   937,   945,   944,   954,   955,   961,   963,   969,   975,
     976,   988,   992,   994,   995,   996,  1000,  1001,  1005,  1006,
    1010,  1018,  1020,  1029,  1036,  1045,  1053,  1063,  1064,  1065,
    1066,  1067,  1067,  1082,  1086,  1086,  1088,  1089,  1089,  1091,
    1095,  1096,  1102,  1104,  1105,  1106,  1107,  1111,  1112,  1113,
    1114,  1115,  1116,  1120,  1131,  1133,  1135,  1137,  1139,  1141,
    1143,  1145,  1147,  1149,  1151,  1153,  1155,  1157,  1159,  1161,
    1163,  1165,  1167,  1169,  1171,  1173,  1175,  1177,  1179,  1181,
    1183,  1185,  1187,  1189,  1191,  1193,  1195,  1197,  1199,  1201,
    1203,  1206,  1208,  1212,  1214,  1216,  1219,  1226,  1225,  1234,
    1235,  1236,  1237,  1241,  1241,  1247,  1249,  1251,  1253,  1255,
    1257,  1259,  1261,  1263,  1265,  1267,  1269,  1271,  1276,  1285,
    1286,  1287,  1288,  1293,  1294,  1295,  1298,  1299,  1304,  1303,
    1313,  1314,  1320,  1326,  1328,  1332,  1336,  1337,  1341,  1342,
    1343,  1344,  1347,  1351,  1357,  1359,  1365,  1366,  1370,  1372,
    1374,  1376,  1378,  1380,  1382,  1384,  1389,  1390,  1391,  1392,
    1393,  1394,  1398,  1399,  1403,  1404,  1408,  1409,  1413,  1414,
    1421,  1428,  1429,  1430,  1434,  1435,  1439,  1440,  1444,  1445,
    1449,  1450,  1453,  1453,  1460,  1460,  1468,  1469,  1472,  1472,
    1478,  1483,  1488,  1489,  1493,  1494,  1495,  1496,  1497,  1501,
    1502,  1503,  1504,  1508,  1509
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
  "ADV_ARROW", "ADV_MAYBE_FLAT", "NEW", "NAMESPACE", "ENDNAMESPACE",
  "DOT_METHOD", "SUB", "SYM", "LOCAL", "LEXICAL", "CONST", "INC", "DEC",
  "GLOBAL_CONST", "PLUS_ASSIGN", "MINUS_ASSIGN", "MUL_ASSIGN",
  "DIV_ASSIGN", "CONCAT_ASSIGN", "BAND_ASSIGN", "BOR_ASSIGN",
  "BXOR_ASSIGN", "FDIV", "FDIV_ASSIGN", "MOD_ASSIGN", "SHR_ASSIGN",
  "SHL_ASSIGN", "SHR_U_ASSIGN", "SHIFT_LEFT", "SHIFT_RIGHT", "INTV",
  "FLOATV", "STRINGV", "PMCV", "OBJECTV", "LOG_XOR", "RELOP_EQ",
  "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", "RELOP_LTE", "GLOBAL",
  "GLOBALOP", "ADDR", "RESULT", "RETURN", "YIELDT", "GET_RESULTS", "POW",
  "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", "DOTDOT",
  "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB", "PCC_BEGIN_RETURN",
  "PCC_END_RETURN", "PCC_BEGIN_YIELD", "PCC_END_YIELD", "NCI_CALL",
  "METH_CALL", "INVOCANT", "MAIN", "LOAD", "IMMEDIATE", "POSTCOMP",
  "METHOD", "ANON", "OUTER", "NEED_LEX", "MULTI", "VTABLE_METHOD",
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
  "multi", "outer", "vtable", "multi_types", "multi_type", "sub_body",
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
     364,   365,   366,   367,   368,   369,   370,   371,   372,   373,
     374,    61,    91,    93,    40,    41,    33,    45,   126,    43,
      42,    47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   136,   137,   138,   138,   139,   139,   139,   139,   139,
     139,   139,   139,   139,   140,   140,   140,   141,   142,   142,
     143,   143,   145,   144,   147,   146,   148,   148,   149,   149,
     150,   150,   150,   150,   150,   150,   150,   152,   151,   153,
     151,   151,   151,   151,   154,   156,   155,   157,   157,   158,
     159,   159,   161,   162,   163,   160,   164,   164,   164,   166,
     165,   167,   167,   168,   168,   169,   170,   170,   171,   171,
     172,   172,   172,   173,   173,   173,   173,   173,   173,   173,
     174,   174,   176,   177,   178,   175,   180,   179,   181,   181,
     182,   182,   183,   183,   184,   184,   185,   185,   185,   185,
     185,   185,   185,   185,   185,   185,   186,   186,   186,   186,
     186,   186,   186,   187,   187,   188,   189,   189,   190,   191,
     190,   192,   192,   193,   193,   193,   193,   193,   193,   194,
     194,   195,   195,   197,   196,   196,   198,   198,   198,   199,
     201,   200,   202,   200,   203,   203,   203,   203,   203,   204,
     204,   205,   206,   206,   206,   206,   207,   207,   208,   208,
     209,   210,   210,   211,   211,   212,   212,   213,   213,   213,
     213,   214,   213,   213,   215,   213,   213,   216,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   217,   217,   217,
     217,   217,   217,   218,   219,   219,   219,   219,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   220,   219,   219,
     219,   219,   219,   222,   221,   223,   223,   223,   223,   223,
     223,   223,   223,   223,   223,   223,   223,   223,   224,   225,
     225,   225,   225,   225,   225,   225,   226,   226,   228,   227,
     229,   229,   229,   229,   229,   230,   231,   231,   232,   232,
     232,   232,   233,   234,   234,   234,   234,   234,   235,   235,
     235,   235,   235,   235,   235,   235,   236,   236,   236,   236,
     236,   236,   237,   237,   238,   238,   239,   239,   240,   240,
     240,   241,   241,   241,   242,   242,   243,   243,   244,   244,
     245,   245,   247,   246,   249,   248,   250,   250,   251,   250,
     252,   252,   252,   252,   253,   253,   253,   253,   253,   254,
     254,   254,   254,   255,   255
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
       3,     3,     5,     0,     1,     4,     4,     4,     1,     4,
       0,     3,     1,     1,     1,     1,     1,     1,     1,     3,
       0,     1,     0,     0,     0,    10,     0,     9,     0,     2,
       0,     3,     0,     1,     1,     3,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     5,     3,     3,     3,
       3,     5,     5,     0,     3,     2,     0,     3,     3,     0,
       4,     0,     2,     1,     1,     1,     1,     4,     1,     1,
       1,     1,     1,     0,     5,     1,     0,     2,     3,     3,
       0,     5,     0,     5,     0,     1,     3,     3,     5,     1,
       2,     0,     2,     2,     1,     1,     0,     1,     2,     1,
       1,     3,     2,     1,     3,     2,     1,     1,     1,     2,
       2,     0,     4,     4,     0,     6,     1,     0,     6,     2,
       2,     2,     2,     1,     1,     1,     0,     1,     1,     1,
       1,     1,     1,     1,     3,     4,     4,     4,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     6,     6,     6,     7,     4,     4,     6,     6,     7,
       4,     4,     4,     4,     6,     7,     3,     0,     9,     1,
       1,     1,     3,     0,     5,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     4,     1,
       1,     1,     1,     3,     3,     3,     1,     1,     0,     5,
       0,     3,     1,     5,     3,     2,     0,     2,     1,     1,
       1,     4,     2,     3,     5,     1,     3,     0,     6,     6,
       5,     5,     4,     4,     4,     4,     1,     1,     1,     1,
       1,     1,     1,     1,     0,     1,     3,     1,     1,     4,
       3,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     0,     2,     0,     2,     1,     3,     0,     4,
       1,     3,     2,     2,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
       0,    13,     0,     0,     0,    51,    52,    22,     0,    82,
       0,    45,     0,     0,     2,     3,    12,     0,     7,     6,
      10,     5,     8,     9,     0,     0,     0,     0,   322,     0,
       0,     0,   187,   188,   189,   190,   191,   193,     0,   192,
       0,     0,   156,    11,     1,     4,    15,    17,    14,     0,
       0,     0,     0,    49,   314,   312,   313,   315,    53,   311,
       0,    20,    83,    16,    24,   160,     0,    33,    32,    36,
      35,   156,    28,     0,    34,    37,   157,   159,    18,    19,
      50,     0,   334,   335,   336,   337,   338,   341,   339,   340,
     342,   302,   320,   330,   323,   326,   303,   321,    92,     0,
       0,    92,     0,    31,    29,    46,     0,     0,    39,     0,
       0,   158,   332,   333,   328,     0,    97,    96,    98,    99,
     101,   100,     0,   102,     0,    68,   103,   104,   105,     0,
      63,    94,     0,    21,     0,     0,    41,     0,    92,    30,
     304,   331,     0,   327,     0,    70,     0,    54,    64,     0,
      23,    84,   316,   317,   318,     0,   319,     0,     0,   324,
      38,   320,    44,   305,   307,   308,   329,     0,     0,    73,
      74,    76,    75,    77,    78,   322,     0,    72,     0,    56,
      95,    56,     0,    42,    40,     0,     0,   322,     0,    67,
      66,     0,     0,    65,    69,    57,   151,   151,    26,    27,
      25,   310,   325,     0,   306,    79,    71,    59,     0,   155,
     154,     0,     0,   151,     0,   149,     0,   309,     0,   153,
      58,    55,   150,     0,   186,   152,    85,    60,     0,   162,
       0,     0,     0,     0,     0,     0,     0,   171,     0,   174,
     177,     0,     0,     0,   243,     0,   129,   130,   259,   260,
     261,   304,   237,   176,   184,     0,   185,   135,     0,   167,
     239,   240,   241,   268,   183,   168,   262,   121,     0,   180,
       0,     0,     0,     0,   182,     0,   169,   170,     0,     0,
       0,     0,   343,   344,     0,   140,   179,   262,   142,     0,
      86,   181,   287,   133,   161,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   267,
     266,     0,   322,     0,    61,     0,     0,     0,   296,   297,
     298,   299,   300,   301,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   144,   144,   287,   113,
       0,   285,     0,   121,   136,   270,   245,   246,   247,   248,
     251,   252,   253,   254,   250,   249,   255,   256,   257,   242,
       0,     0,     0,   341,   342,   304,     0,     0,     0,   236,
     320,   194,     0,   264,   265,   263,   123,   124,   125,   126,
     128,   122,   121,     0,   292,   294,     0,     0,   293,   295,
       0,   233,   166,   172,   163,   173,     0,     0,   232,   341,
       0,   145,   276,     0,     0,    90,     0,     0,     0,   282,
       0,   341,     0,   272,   322,   225,   226,   231,   230,   258,
     195,   196,   197,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   322,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    62,
     290,     0,   291,     0,     0,   322,   165,     0,     0,     0,
       0,     0,   141,   275,   143,   244,     0,     0,     0,     0,
     286,     0,   283,     0,   137,     0,   131,   132,   134,     0,
       0,     0,   269,     0,     0,   322,     0,   322,   203,   212,
     213,   217,   206,   207,   208,   211,   209,   210,   201,   214,
     215,   216,   205,     0,   199,   220,   198,   200,   202,   204,
     218,   219,     0,     0,   288,   289,   234,     0,   164,   175,
     178,   146,   341,   147,   278,   280,   279,   277,   115,     0,
       0,     0,     0,    88,   114,     0,     0,   276,   138,   274,
     341,   271,   227,   223,     0,   228,     0,   221,   222,   127,
     235,     0,     0,    91,     0,     0,     0,     0,   116,     0,
     284,   270,   139,     0,   224,   229,   148,     0,   107,     0,
     108,   110,     0,   109,     0,     0,    89,     0,   273,   281,
       0,     0,     0,   119,     0,    87,     0,   238,   106,   112,
     111,     0,   121,   117,     0,   118,   120
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    13,    14,    15,    16,    25,    17,    18,    19,    31,
      70,   102,   200,    71,    72,   109,   110,   138,   160,    20,
      42,    73,    21,    29,    22,    30,    98,   179,   196,   211,
     218,   227,   149,   126,   127,   128,   176,   177,   212,    23,
      40,   101,   181,   254,   339,   558,   468,   129,   130,   131,
     533,   405,   469,   575,   586,   591,   314,   381,   255,   478,
     256,   344,   410,   479,   257,   336,   337,   400,   213,   214,
     215,    75,    76,    77,   225,   393,   394,   258,   278,   280,
     281,    38,    39,   259,   292,   260,   289,   261,   262,   263,
     313,   264,   295,   412,   401,   463,   527,   341,   342,   265,
     325,    92,   162,   163,   164,    58,    59,   154,   165,   402,
      51,    52,   185,   186,    94,   142,    95,    96,    97,   284
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -451
static const short int yypact[] =
{
     173,  -451,    26,   -87,   -69,   -57,  -451,  -451,   376,  -451,
     -54,  -451,    70,    78,   173,  -451,  -451,   100,  -451,  -451,
    -451,  -451,  -451,  -451,     1,   121,    63,    73,  -451,   149,
      88,   376,  -451,  -451,  -451,  -451,  -451,  -451,    69,  -451,
      72,   158,    16,  -451,  -451,  -451,  -451,  -451,  -451,    59,
      75,    61,   350,  -451,  -451,  -451,  -451,  -451,  -451,  -451,
      86,   102,  -451,  -451,  -451,  -451,   189,  -451,  -451,  -451,
    -451,    21,  -451,   106,  -451,     7,   110,  -451,  -451,  -451,
    -451,   452,  -451,  -451,  -451,  -451,  -451,  -451,  -451,  -451,
    -451,  -451,  -451,   151,   -53,  -451,  -451,  -451,   723,   103,
     164,   723,   120,  -451,  -451,  -451,   452,   122,  -451,   229,
     125,  -451,  -451,   452,  -451,   350,  -451,  -451,  -451,  -451,
    -451,  -451,   117,  -451,   119,   124,  -451,  -451,  -451,   241,
       2,  -451,   164,  -451,   247,   554,  -451,   196,   723,  -451,
     596,  -451,   350,  -451,    25,   299,   161,  -451,  -451,   723,
    -451,  -451,  -451,  -451,  -451,   159,  -451,   165,   185,  -451,
    -451,   163,  -451,   221,  -451,  -451,  -451,   170,   175,  -451,
    -451,  -451,  -451,  -451,  -451,  -451,   -56,  -451,   177,   305,
    -451,   305,   -52,  -451,  -451,   187,   350,  -451,   596,  -451,
    -451,   191,   299,  -451,  -451,  -451,    11,    11,  -451,  -451,
    -451,  -451,   -53,   195,  -451,  -451,  -451,  -451,   308,  -451,
    -451,   315,   246,    89,   467,  -451,   256,  -451,   376,  -451,
    -451,  -451,  -451,   317,   573,  -451,  -451,  -451,    85,  -451,
     -66,   186,   224,   452,   371,   226,   227,  -451,   228,   230,
    -451,   -67,   399,   216,  -451,   338,  -451,  -451,  -451,  -451,
    -451,   596,  -451,  -451,  -451,   339,  -451,  -451,   340,  -451,
    -451,  -451,  -451,  -451,  -451,  -451,   328,  -451,   326,  -451,
     452,   155,   452,   297,  -451,   274,  -451,  -451,   376,   275,
     376,   376,  -451,  -451,   238,  -451,  -451,   -47,  -451,   252,
    -451,  -451,   115,  -451,  -451,   253,   452,   452,   452,   452,
     452,   452,   452,   452,   452,   452,   452,   452,   452,  -451,
    -451,    45,  -451,   680,    36,   272,   369,   -66,  -451,  -451,
    -451,  -451,  -451,  -451,   -66,   452,   385,   -66,   -66,   452,
     452,   300,   371,   302,   304,   452,   624,   624,   115,  -451,
     392,  -451,   -45,  -451,  -451,   638,  -451,  -451,  -451,  -451,
    -451,  -451,  -451,  -451,  -451,  -451,  -451,  -451,  -451,  -451,
     610,   -67,   307,   290,   291,   596,   452,   452,   452,  -451,
      56,   562,   293,  -451,  -451,  -451,  -451,  -451,  -451,   294,
    -451,  -451,  -451,   -66,  -451,  -451,   409,   -66,  -451,  -451,
     410,   -28,   324,   358,  -451,  -451,   312,   313,  -451,   403,
     -41,  -451,  -451,   -38,   -32,     3,   371,   201,   314,    36,
       0,   416,   -23,  -451,  -451,   -24,    17,  -451,  -451,  -451,
    -451,  -451,  -451,   452,   452,   452,   452,   452,   452,   452,
     452,   452,   452,   452,   452,   452,   452,   452,  -451,   452,
     452,   452,   452,   452,   452,   452,   452,   318,   330,    36,
    -451,   -66,  -451,   -66,   452,  -451,  -451,   300,   164,   164,
     452,   652,  -451,   225,  -451,  -451,   452,   452,    83,   434,
    -451,   422,  -451,   435,  -451,   452,  -451,  -451,  -451,   440,
     452,   666,  -451,   322,   452,  -451,   452,  -451,  -451,  -451,
    -451,  -451,  -451,  -451,  -451,  -451,  -451,  -451,  -451,  -451,
    -451,  -451,  -451,   336,  -451,  -451,  -451,  -451,  -451,  -451,
    -451,  -451,   452,   341,  -451,  -451,  -451,   344,  -451,  -451,
    -451,  -451,   427,  -451,  -451,   327,  -451,  -451,  -451,   460,
     452,   452,   694,   110,  -451,   371,   346,  -451,  -451,  -451,
     463,  -451,  -451,  -451,   349,  -451,   361,  -451,  -451,  -451,
    -451,   452,   375,  -451,     4,   488,     6,    15,  -451,   489,
    -451,   638,   225,   452,  -451,  -451,  -451,   373,  -451,   452,
    -451,  -451,   452,  -451,   452,    77,  -451,    -9,  -451,  -451,
     490,   495,   503,  -451,   371,  -451,   506,  -451,  -451,  -451,
    -451,   376,  -451,  -451,   300,    36,  -451
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -451,  -451,  -451,   497,     5,  -451,  -451,  -451,  -451,  -451,
     289,  -451,  -451,  -451,   444,  -451,  -451,  -451,   152,  -451,
    -451,  -451,    20,  -451,  -451,  -451,  -451,  -451,   335,  -451,
    -451,  -451,  -451,  -451,  -451,  -451,  -451,   329,   321,  -451,
    -451,  -451,  -451,  -451,  -451,  -451,  -451,   -70,  -451,   370,
    -451,  -451,  -451,  -451,  -451,  -451,  -325,  -451,  -451,  -451,
    -451,  -451,  -451,  -451,  -451,  -451,  -451,   188,  -451,  -451,
     309,   310,  -451,   -75,  -451,  -451,  -450,  -451,  -451,  -451,
    -451,   -31,   167,  -451,  -451,  -451,  -451,  -451,  -451,    55,
    -451,  -216,  -451,   -29,  -340,    -1,  -451,   137,   208,  -451,
     278,  -128,   301,  -451,   365,  -451,   245,  -217,   426,   -43,
    -172,  -451,  -451,  -451,   382,  -451,   -12,  -451,   -98,   214
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -263
static const short int yytable[] =
{
      60,   111,   133,   191,   474,   413,   -93,   518,   568,    93,
     571,   -43,   161,   269,   466,   203,   207,   192,   409,   573,
     114,   106,     2,    26,     3,     4,   286,     2,   407,     3,
       4,   134,   461,    24,   150,   461,   107,   282,   112,     5,
     152,   407,    27,   283,     5,   454,    64,    69,   153,   484,
     481,    64,   376,   377,   378,   379,    41,   449,   198,   359,
     161,   199,    74,   136,   481,    28,   475,   360,   158,   193,
     141,   309,    93,   310,    43,   148,    69,   569,    44,   572,
     408,   476,   115,   477,   462,   -80,   108,   464,   574,   467,
     486,    74,   156,   465,   455,   369,   266,   156,   485,    93,
     384,   -93,   482,   143,    46,   583,   275,   385,   361,   362,
     388,   389,    47,    10,   287,    65,   587,   -47,    10,   208,
      65,   523,   -48,   161,    66,    48,   528,   209,   210,    66,
     166,   167,    67,    68,   380,   168,    49,    67,    68,   487,
     372,   541,   584,    93,   596,   156,    50,    82,    83,    84,
      85,   248,    86,    53,   585,   363,    88,    89,   364,   365,
      91,   530,    63,   -81,   343,   317,   450,   531,   532,    78,
     452,   366,   367,   368,   309,    61,   310,     1,    62,     2,
    -262,     3,     4,   370,    80,   374,    79,   228,   271,   273,
     274,   267,    99,   103,    54,   268,     5,   208,    55,     6,
     270,    56,    57,     7,   395,   209,   210,   105,   156,    65,
     343,   318,   319,   320,   321,   322,   323,    82,    83,    84,
      85,   413,    86,   100,   132,   340,   113,   316,   324,   326,
      91,   135,   137,   139,   514,     8,   515,   161,   272,   140,
     524,   144,   483,   145,   525,   147,   526,   331,   146,   333,
     334,   151,     9,   346,   347,   348,   349,   350,   351,   352,
     353,   354,   355,   356,   357,   358,   503,   595,   371,   157,
      10,   178,   183,    11,    87,    88,    89,    90,   470,   343,
     182,    12,   386,   517,   184,   187,   390,   391,    82,    83,
      84,    85,   398,    86,   188,   189,    87,    88,    89,    90,
     190,    91,   194,    82,    83,    84,    85,   327,    86,   195,
     201,   471,   219,   544,   205,   546,    91,   416,   217,   220,
     221,   229,   156,   420,   421,   422,    82,    83,    84,    85,
     226,    86,   276,   277,    87,    88,    89,    90,   279,    91,
     288,   -24,   290,   293,   294,   287,   315,   330,   332,   169,
     170,   171,   172,   318,   319,   320,   321,   322,   323,   335,
     519,   520,   296,   297,   298,   299,   300,   301,   302,   303,
     328,   304,   305,   306,   307,   308,   338,   345,   382,   383,
     488,   489,   490,   491,   492,   493,   494,   495,   496,   497,
     498,   499,   500,   501,   502,   387,   504,   505,   506,   507,
     508,   509,   510,   511,   557,   173,   392,   560,   396,   174,
     397,   516,   406,   418,  -260,  -261,   447,   521,   448,   451,
     453,   175,   456,   460,   529,    81,    32,    33,    34,    35,
      36,   457,   537,   458,   459,   473,   480,   539,   534,   512,
     513,   543,   535,   545,   538,   542,   309,   551,   310,   311,
     312,   552,    82,    83,    84,    85,   592,    86,   559,   547,
      87,    88,    89,    90,   553,    91,   549,   550,   223,   548,
     561,  -156,   564,    82,    83,    84,    85,  -156,    86,  -156,
    -156,  -156,    37,   563,   565,   567,    91,   554,   555,  -156,
    -156,  -156,   570,   576,   588,  -156,  -156,  -156,   579,   589,
    -156,    82,    83,    84,    85,   248,    86,   590,   566,   249,
     593,    45,   250,   253,    91,   104,   197,   419,   216,   180,
     578,   206,   222,   285,   224,   403,   580,   415,   536,   581,
    -156,   582,   577,  -156,  -156,  -156,   562,    82,    83,    84,
      85,   248,    86,  -156,   472,   249,   404,  -156,   250,  -156,
      91,   329,   291,   204,    82,    83,    84,    85,   375,    86,
     594,   155,    87,    88,    89,    90,    65,    91,   202,  -156,
    -156,  -156,  -156,  -156,  -156,   417,     0,  -156,     0,     0,
    -156,  -156,  -156,   230,     0,   231,   232,   233,     0,     0,
       0,  -156,     0,     0,     0,   234,   235,   236,     0,     0,
       0,   237,   238,   239,   423,     0,   240,     0,     0,     0,
     424,   425,     0,     0,     0,     0,     0,   426,   427,   428,
     429,   430,   431,   432,     0,     0,     0,     0,     0,     0,
       0,   433,   434,   435,   436,     0,   241,     0,     0,   242,
     243,   244,     0,     0,     0,     0,     0,     0,     0,   245,
       0,     0,     0,   246,     0,   247,    82,    83,    84,    85,
     152,    86,     0,     0,    87,    88,    89,    90,   153,    91,
       0,     0,     0,     0,     0,    82,    83,    84,    85,   248,
      86,   437,     0,   249,   438,     0,   250,   251,    91,   439,
     440,   441,   442,   443,   444,   445,   446,   252,    82,    83,
      84,    85,   152,    86,     0,     0,    87,    88,    89,    90,
     153,    91,    82,    83,    84,    85,    37,    86,   159,     0,
      87,    88,    89,    90,     0,    91,    82,    83,    84,    85,
       0,    86,   414,     0,   399,    88,    89,    90,     0,    91,
      82,    83,    84,    85,     0,    86,     0,     0,   411,    88,
      89,    90,     0,    91,    82,    83,    84,    85,     0,    86,
       0,     0,   522,    88,    89,    90,     0,    91,    82,    83,
      84,    85,     0,    86,     0,     0,   540,    88,    89,    90,
       0,    91,    82,    83,    84,    85,    54,    86,     0,     0,
     373,     0,     0,     0,    57,    91,    82,    83,    84,    85,
       0,    86,     0,     0,   556,     0,     0,     0,     0,    91,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125
};

static const short int yycheck[] =
{
      31,    76,   100,   175,     4,   345,     4,   457,     4,    52,
       4,     4,   140,   230,    11,   187,     5,    73,   343,     4,
      73,    14,     6,   110,     8,     9,   242,     6,    73,     8,
       9,   101,    73,     7,   132,    73,    29,   104,    81,    23,
     106,    73,   111,   110,    23,    73,    30,    42,   114,    73,
      73,    30,    16,    17,    18,    19,   110,   382,   110,    14,
     188,   113,    42,   106,    73,   122,    66,    22,   138,   125,
     113,   118,   115,   120,     4,    73,    71,    73,     0,    73,
     125,    81,   135,    83,   125,    74,    79,   125,    73,    86,
      73,    71,   135,   125,   122,   311,   224,   140,   122,   142,
     317,    99,   125,   115,     4,    28,   234,   324,    63,    64,
     327,   328,   111,    97,   242,    99,   125,   101,    97,   108,
      99,   461,   101,   251,   108,     4,   466,   116,   117,   108,
     142,   106,   116,   117,    98,   110,    73,   116,   117,   122,
     312,   481,    65,   186,   594,   188,    73,   102,   103,   104,
     105,   106,   107,     4,    77,   110,   111,   112,   113,   114,
     115,    78,     4,    74,   292,    10,   383,    84,    85,   110,
     387,   126,   127,   128,   118,   106,   120,     4,   106,     6,
     124,     8,     9,   311,   123,   313,   111,   218,   231,   232,
     233,   106,   106,     4,   106,   110,    23,   108,   110,    26,
      14,   113,   114,    30,   332,   116,   117,   101,   251,    99,
     338,    56,    57,    58,    59,    60,    61,   102,   103,   104,
     105,   561,   107,   121,   121,   110,    75,   270,    73,   272,
     115,   111,   110,     4,   451,    62,   453,   365,    14,   114,
      15,   124,   414,   124,    19,     4,    21,   278,   124,   280,
     281,     4,    79,   296,   297,   298,   299,   300,   301,   302,
     303,   304,   305,   306,   307,   308,   438,   592,   311,    73,
      97,   110,   107,   100,   110,   111,   112,   113,   406,   407,
     121,   108,   325,   455,    99,   122,   329,   330,   102,   103,
     104,   105,   335,   107,    73,   125,   110,   111,   112,   113,
     125,   115,   125,   102,   103,   104,   105,    10,   107,     4,
     123,   110,     4,   485,   123,   487,   115,   360,   123,     4,
      74,     4,   365,   366,   367,   368,   102,   103,   104,   105,
      74,   107,   106,   106,   110,   111,   112,   113,   110,   115,
     124,   111,     4,     4,     4,   473,    20,    73,    73,    50,
      51,    52,    53,    56,    57,    58,    59,    60,    61,   121,
     458,   459,    34,    35,    36,    37,    38,    39,    40,    41,
      73,    43,    44,    45,    46,    47,   124,   124,   106,    10,
     423,   424,   425,   426,   427,   428,   429,   430,   431,   432,
     433,   434,   435,   436,   437,    10,   439,   440,   441,   442,
     443,   444,   445,   446,   532,   106,   106,   535,   106,   110,
     106,   454,    20,   106,   124,   124,   123,   460,   124,    10,
      10,   122,    98,    20,   467,    75,    50,    51,    52,    53,
      54,    73,   475,   121,   121,   121,    20,   480,     4,   121,
     110,   484,    20,   486,     4,   123,   118,    20,   120,   121,
     122,   124,   102,   103,   104,   105,   584,   107,   533,   123,
     110,   111,   112,   113,     4,   115,   125,   123,     1,   512,
     124,     4,   123,   102,   103,   104,   105,    10,   107,    12,
      13,    14,   106,    20,   123,   110,   115,   530,   531,    22,
      23,    24,     4,     4,     4,    28,    29,    30,   125,     4,
      33,   102,   103,   104,   105,   106,   107,     4,   551,   110,
       4,    14,   113,   224,   115,    71,   181,   365,   197,   149,
     563,   192,   213,   124,   214,   337,   569,   360,   473,   572,
      63,   574,   561,    66,    67,    68,   537,   102,   103,   104,
     105,   106,   107,    76,   407,   110,   338,    80,   113,    82,
     115,   273,   251,   188,   102,   103,   104,   105,   313,   107,
     591,   135,   110,   111,   112,   113,    99,   115,   186,   102,
     103,   104,   105,   106,   107,   361,    -1,   110,    -1,    -1,
     113,   114,   115,    10,    -1,    12,    13,    14,    -1,    -1,
      -1,   124,    -1,    -1,    -1,    22,    23,    24,    -1,    -1,
      -1,    28,    29,    30,    42,    -1,    33,    -1,    -1,    -1,
      48,    49,    -1,    -1,    -1,    -1,    -1,    55,    56,    57,
      58,    59,    60,    61,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    69,    70,    71,    72,    -1,    63,    -1,    -1,    66,
      67,    68,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      -1,    -1,    -1,    80,    -1,    82,   102,   103,   104,   105,
     106,   107,    -1,    -1,   110,   111,   112,   113,   114,   115,
      -1,    -1,    -1,    -1,    -1,   102,   103,   104,   105,   106,
     107,   119,    -1,   110,   122,    -1,   113,   114,   115,   127,
     128,   129,   130,   131,   132,   133,   134,   124,   102,   103,
     104,   105,   106,   107,    -1,    -1,   110,   111,   112,   113,
     114,   115,   102,   103,   104,   105,   106,   107,   122,    -1,
     110,   111,   112,   113,    -1,   115,   102,   103,   104,   105,
      -1,   107,   122,    -1,   110,   111,   112,   113,    -1,   115,
     102,   103,   104,   105,    -1,   107,    -1,    -1,   110,   111,
     112,   113,    -1,   115,   102,   103,   104,   105,    -1,   107,
      -1,    -1,   110,   111,   112,   113,    -1,   115,   102,   103,
     104,   105,    -1,   107,    -1,    -1,   110,   111,   112,   113,
      -1,   115,   102,   103,   104,   105,   106,   107,    -1,    -1,
     110,    -1,    -1,    -1,   114,   115,   102,   103,   104,   105,
      -1,   107,    -1,    -1,   110,    -1,    -1,    -1,    -1,   115,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,     9,    23,    26,    30,    62,    79,
      97,   100,   108,   137,   138,   139,   140,   142,   143,   144,
     155,   158,   160,   175,     7,   141,   110,   111,   122,   159,
     161,   145,    50,    51,    52,    53,    54,   106,   217,   218,
     176,   110,   156,     4,     0,   139,     4,   111,     4,    73,
      73,   246,   247,     4,   106,   110,   113,   114,   241,   242,
     217,   106,   106,     4,    30,    99,   108,   116,   117,   140,
     146,   149,   150,   157,   158,   207,   208,   209,   110,   111,
     123,    75,   102,   103,   104,   105,   107,   110,   111,   112,
     113,   115,   237,   245,   250,   252,   253,   254,   162,   106,
     121,   177,   147,     4,   150,   101,    14,    29,    79,   151,
     152,   209,   245,    75,    73,   135,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,   169,   170,   171,   183,
     184,   185,   121,   254,   183,   111,   245,   110,   153,     4,
     114,   245,   251,   252,   124,   124,   124,     4,    73,   168,
     254,     4,   106,   114,   243,   244,   245,    73,   183,   122,
     154,   237,   238,   239,   240,   244,   252,   106,   110,    50,
      51,    52,    53,   106,   110,   122,   172,   173,   110,   163,
     185,   178,   121,   107,    99,   248,   249,   122,    73,   125,
     125,   246,    73,   125,   125,     4,   164,   164,   110,   113,
     148,   123,   250,   246,   240,   123,   173,     5,   108,   116,
     117,   165,   174,   204,   205,   206,   174,   123,   166,     4,
       4,    74,   206,     1,   207,   210,    74,   167,   217,     4,
      10,    12,    13,    14,    22,    23,    24,    28,    29,    30,
      33,    63,    66,    67,    68,    76,    80,    82,   106,   110,
     113,   114,   124,   146,   179,   194,   196,   200,   213,   219,
     221,   223,   224,   225,   227,   235,   237,   106,   110,   243,
      14,   245,    14,   245,   245,   237,   106,   106,   214,   110,
     215,   216,   104,   110,   255,   124,   227,   237,   124,   222,
       4,   238,   220,     4,     4,   228,    34,    35,    36,    37,
      38,    39,    40,    41,    43,    44,    45,    46,    47,   118,
     120,   121,   122,   226,   192,    20,   245,    10,    56,    57,
      58,    59,    60,    61,    73,   236,   245,    10,    73,   236,
      73,   217,    73,   217,   217,   121,   201,   202,   124,   180,
     110,   233,   234,   237,   197,   124,   245,   245,   245,   245,
     245,   245,   245,   245,   245,   245,   245,   245,   245,    14,
      22,    63,    64,   110,   113,   114,   126,   127,   128,   227,
     237,   245,   246,   110,   237,   242,    16,    17,    18,    19,
      98,   193,   106,    10,   243,   243,   245,    10,   243,   243,
     245,   245,   106,   211,   212,   237,   106,   106,   245,   110,
     203,   230,   245,   203,   234,   187,    20,    73,   125,   192,
     198,   110,   229,   230,   122,   218,   245,   255,   106,   154,
     245,   245,   245,    42,    48,    49,    55,    56,    57,    58,
      59,    60,    61,    69,    70,    71,    72,   119,   122,   127,
     128,   129,   130,   131,   132,   133,   134,   123,   124,   192,
     243,    10,   243,    10,    73,   122,    98,    73,   121,   121,
      20,    73,   125,   231,   125,   125,    11,    86,   182,   188,
     237,   110,   233,   121,     4,    66,    81,    83,   195,   199,
      20,    73,   125,   246,    73,   122,    73,   122,   245,   245,
     245,   245,   245,   245,   245,   245,   245,   245,   245,   245,
     245,   245,   245,   246,   245,   245,   245,   245,   245,   245,
     245,   245,   121,   110,   243,   243,   245,   246,   212,   254,
     254,   245,   110,   230,    15,    19,    21,   232,   230,   245,
      78,    84,    85,   186,     4,    20,   225,   245,     4,   245,
     110,   230,   123,   245,   246,   245,   246,   123,   245,   125,
     123,    20,   124,     4,   245,   245,   110,   237,   181,   209,
     237,   124,   231,    20,   123,   123,   245,   110,     4,    73,
       4,     4,    73,     4,    73,   189,     4,   229,   245,   125,
     245,   245,   245,    28,    65,    77,   190,   125,     4,     4,
       4,   191,   237,     4,   217,   192,   212
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
#line 476 "compilers/imcc/imcc.y"
    { if (yynerrs) YYABORT; (yyval.i) = 0; ;}
    break;

  case 5:
#line 485 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); ;}
    break;

  case 6:
#line 486 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); ;}
    break;

  case 7:
#line 487 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); ;}
    break;

  case 8:
#line 488 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); 
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit); 
                     IMCC_INFO(interp)->cur_unit = 0; ;}
    break;

  case 9:
#line 491 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i);
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                     IMCC_INFO(interp)->cur_unit = 0; ;}
    break;

  case 10:
#line 494 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i);
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                     IMCC_INFO(interp)->cur_unit = 0; ;}
    break;

  case 11:
#line 497 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 12:
#line 498 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 13:
#line 499 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 14:
#line 502 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 15:
#line 503 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 16:
#line 504 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; do_loadlib(interp, (yyvsp[-1].s)); ;}
    break;

  case 17:
#line 508 "compilers/imcc/imcc.y"
    { if ((yyvsp[0].s))
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    ;}
    break;

  case 18:
#line 516 "compilers/imcc/imcc.y"
    {
            STRING *hll_name, *hll_lib;
            hll_name = string_unescape_cstring(interp, (yyvsp[-2].s) + 1, '"', NULL);
            hll_lib =  string_unescape_cstring(interp, (yyvsp[0].s) + 1, '"', NULL);
            CONTEXT(((Interp*)interp)->ctx)->current_HLL = 
                Parrot_register_HLL(interp, hll_name, hll_lib);
            (yyval.t) = 0;
         ;}
    break;

  case 19:
#line 525 "compilers/imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                CONTEXT(((Interp*)interp)->ctx)->current_HLL, atoi((yyvsp[-2].s)), atoi((yyvsp[0].s)));
             (yyval.t) = 0;
         ;}
    break;

  case 20:
#line 534 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         ;}
    break;

  case 21:
#line 540 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         ;}
    break;

  case 22:
#line 548 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 23:
#line 549 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1); is_def=0; ;}
    break;

  case 24:
#line 553 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 25:
#line 554 "compilers/imcc/imcc.y"
    { (yyval.i) = mk_pmc_const(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-3].s), (yyvsp[-2].sr), (yyvsp[0].s)); is_def=0; ;}
    break;

  case 30:
#line 567 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 31:
#line 568 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 32:
#line 569 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 33:
#line 570 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 34:
#line 571 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); ;}
    break;

  case 37:
#line 576 "compilers/imcc/imcc.y"
    { clear_state(interp); ;}
    break;

  case 38:
#line 578 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit, 
                              (yyvsp[-1].s), 0, IMCC_INFO(interp)->regs, 
                              IMCC_INFO(interp)->nargs, IMCC_INFO(interp) -> keyvec, 1);
                     free((yyvsp[-1].s)); ;}
    break;

  case 39:
#line 583 "compilers/imcc/imcc.y"
    {
                    imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                    IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM);
                    ;}
    break;

  case 40:
#line 588 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit,
                                mk_sub_label(interp, (yyvsp[0].s)));
                     IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[-1].t);
                   ;}
    break;

  case 41:
#line 594 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[0].sr)); ;}
    break;

  case 42:
#line 596 "compilers/imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, (yyvsp[0].s));
                       set_lexical(interp, r, (yyvsp[-2].s)); (yyval.i) = 0;
                   ;}
    break;

  case 43:
#line 600 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;;}
    break;

  case 45:
#line 608 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM); ;}
    break;

  case 46:
#line 610 "compilers/imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     (yyval.i)=0; ;}
    break;

  case 49:
#line 625 "compilers/imcc/imcc.y"
    {
                    int re_open = 0;
                    (yyval.i) = 0;
                    if (IMCC_INFO(interp)->state->pasm_file && IMCC_INFO(interp)->cur_namespace) {
                        imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                        re_open = 1;
                    }
                    IMCC_INFO(interp)->cur_namespace = (yyvsp[-1].sr);
                    if (re_open)
                        IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM);
                ;}
    break;

  case 50:
#line 639 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[-1].sr); ;}
    break;

  case 51:
#line 640 "compilers/imcc/imcc.y"
    { (yyval.sr) = NULL; ;}
    break;

  case 52:
#line 645 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        ;}
    break;

  case 53:
#line 649 "compilers/imcc/imcc.y"
    {
          iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[0].sr));
        ;}
    break;

  case 54:
#line 652 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[-1].t); ;}
    break;

  case 55:
#line 654 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 56:
#line 658 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 57:
#line 659 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 58:
#line 660 "compilers/imcc/imcc.y"
    { 
       if (IMCC_INFO(interp)->adv_named_id) {
             add_pcc_named_param(interp,IMCC_INFO(interp)->cur_call,
                                 IMCC_INFO(interp)->adv_named_id,(yyvsp[-1].sr));
             IMCC_INFO(interp)->adv_named_id = NULL;
         } else add_pcc_param(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr));
   ;}
    break;

  case 59:
#line 670 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 60:
#line 670 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[0].sr); is_def=0; ;}
    break;

  case 61:
#line 674 "compilers/imcc/imcc.y"
    { if ((yyvsp[0].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[-1].s), (yyvsp[-2].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[-1].s), (yyvsp[-2].t));
                                         (yyval.sr)->type |= (yyvsp[0].t); ;}
    break;

  case 62:
#line 679 "compilers/imcc/imcc.y"
    { 
                                         if ((yyvsp[0].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[-1].s), (yyvsp[-4].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[-1].s), (yyvsp[-4].t));
                                         (yyval.sr)->type |= (yyvsp[0].t);
                                         adv_named_set(interp,(yyvsp[-3].s));;}
    break;

  case 63:
#line 689 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  ;}
    break;

  case 65:
#line 694 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 66:
#line 698 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; IMCC_INFO(interp)->cur_unit->outer =
                     mk_sub_address_fromc(interp, (yyvsp[-1].s)); ;}
    break;

  case 67:
#line 701 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; IMCC_INFO(interp)->cur_unit->outer =
                     mk_const(interp, (yyvsp[-1].s), 'S'); ;}
    break;

  case 68:
#line 706 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; 
                       IMCC_INFO(interp)->cur_unit->vtable_name = NULL;
                       IMCC_INFO(interp)->cur_unit->is_vtable_method = 1; ;}
    break;

  case 69:
#line 710 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; 
                       IMCC_INFO(interp)->cur_unit->vtable_name = strdup((yyvsp[-1].s));
                       IMCC_INFO(interp)->cur_unit->is_vtable_method = 1; ;}
    break;

  case 70:
#line 716 "compilers/imcc/imcc.y"
    { add_pcc_multi(IMCC_INFO(interp)->cur_call, NULL); ;}
    break;

  case 71:
#line 717 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[0].sr)); ;}
    break;

  case 72:
#line 718 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[0].sr));;}
    break;

  case 73:
#line 722 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("INTVAL"), 'S'); ;}
    break;

  case 74:
#line 723 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("FLOATVAL"), 'S'); ;}
    break;

  case 75:
#line 724 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("PMC"), 'S'); ;}
    break;

  case 76:
#line 725 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("STRING"), 'S'); ;}
    break;

  case 77:
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
                      ;}
    break;

  case 78:
#line 736 "compilers/imcc/imcc.y"
    {
                          SymReg *r;
                          if (strcmp((yyvsp[0].s), "_"))
                              r = mk_const(interp, (yyvsp[0].s), 'S');
                          else {
                              free((yyvsp[0].s)),
                              r = mk_const(interp, str_dup("PMC"), 'S');
                           }
                           (yyval.sr) = r;
                      ;}
    break;

  case 79:
#line 746 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[-1].sr); ;}
    break;

  case 82:
#line 755 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PCCSUB); ;}
    break;

  case 83:
#line 756 "compilers/imcc/imcc.y"
    { iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit, mk_sub_label(interp, (yyvsp[0].s))); ;}
    break;

  case 84:
#line 757 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[-1].t); ;}
    break;

  case 85:
#line 759 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 86:
#line 764 "compilers/imcc/imcc.y"
    {
            char name[128];
            SymReg * r, *r1;
            Instruction *i;

            sprintf(name, "%cpcc_sub_call_%d", 
                    IMCC_INTERNAL_CHAR, IMCC_INFO(interp)->cnr++);
            (yyval.sr) = r = mk_pcc_sub(interp, str_dup(name), 0);
            /* this mid rule action has the semantic value of the
             * sub SymReg.
             * This is used below to append args & results
             */
            i = iLABEL(interp, IMCC_INFO(interp)->cur_unit, r);
            IMCC_INFO(interp)->cur_call = r;
            i->type = ITPCCSUB;
            /*
             * if we are inside a pcc_sub mark the sub as doing a
             * sub call; the sub is in r[0] of the first ins
             */
            r1 = IMCC_INFO(interp)->cur_unit->instructions->r[0];
            if (r1 && r1->pcc_sub)
                r1->pcc_sub->calls_a_sub |= 1;
         ;}
    break;

  case 87:
#line 792 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 88:
#line 796 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->label = 0; ;}
    break;

  case 89:
#line 797 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->label = 1; ;}
    break;

  case 90:
#line 801 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; ;}
    break;

  case 91:
#line 803 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->object = (yyvsp[-1].sr); ;}
    break;

  case 92:
#line 807 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 94:
#line 812 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[0].t); ;}
    break;

  case 95:
#line 813 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[-2].t) | (yyvsp[0].t); ;}
    break;

  case 96:
#line 817 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_LOAD; ;}
    break;

  case 97:
#line 818 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_MAIN; ;}
    break;

  case 98:
#line 819 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_IMMEDIATE; ;}
    break;

  case 99:
#line 820 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_POSTCOMP; ;}
    break;

  case 100:
#line 821 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_ANON; ;}
    break;

  case 101:
#line 822 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_METHOD; ;}
    break;

  case 102:
#line 823 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_NEED_LEX; ;}
    break;

  case 106:
#line 831 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[-3].sr));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr));
         ;}
    break;

  case 107:
#line 836 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr)); ;}
    break;

  case 108:
#line 838 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr));
            IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isNCI;
         ;}
    break;

  case 109:
#line 843 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr)); ;}
    break;

  case 110:
#line 845 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[-1].s),'S')); ;}
    break;

  case 111:
#line 847 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[-3].sr));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr));
         ;}
    break;

  case 112:
#line 851 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[-3].s),'S'));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr));
         ;}
    break;

  case 113:
#line 858 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 114:
#line 859 "compilers/imcc/imcc.y"
    {  add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr)); ;}
    break;

  case 115:
#line 863 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 116:
#line 868 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 117:
#line 869 "compilers/imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr)); ;}
    break;

  case 118:
#line 873 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); ;}
    break;

  case 119:
#line 874 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 120:
#line 875 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[0].idlist);
         if (l->unique_reg)
                 mk_ident_ur(interp, l->id, (yyvsp[-1].t));
             else
                 mk_ident(interp, l->id, (yyvsp[-1].t));
         is_def=0;
         (yyval.sr)=0;
     ;}
    break;

  case 121:
#line 887 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; ;}
    break;

  case 122:
#line 888 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); ;}
    break;

  case 123:
#line 892 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_FLAT;   ;}
    break;

  case 124:
#line 893 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPTIONAL; ;}
    break;

  case 125:
#line 894 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPT_FLAG; ;}
    break;

  case 126:
#line 895 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_NAMED; ;}
    break;

  case 127:
#line 896 "compilers/imcc/imcc.y"
    {  adv_named_set(interp,(yyvsp[-1].s)); (yyval.t) = 0; ;}
    break;

  case 128:
#line 897 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_UNIQUE_REG; ;}
    break;

  case 129:
#line 902 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 130:
#line 903 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; ;}
    break;

  case 133:
#line 913 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, (yyvsp[-1].t)); ;}
    break;

  case 134:
#line 916 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; ;}
    break;

  case 135:
#line 917 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.i) = 0;  ;}
    break;

  case 136:
#line 923 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 137:
#line 924 "compilers/imcc/imcc.y"
    {
       if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); 
   ;}
    break;

  case 138:
#line 927 "compilers/imcc/imcc.y"
    {
       if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); 
   ;}
    break;

  case 139:
#line 933 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); ;}
    break;

  case 140:
#line 938 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        ;}
    break;

  case 141:
#line 943 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  ;}
    break;

  case 142:
#line 945 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        ;}
    break;

  case 143:
#line 950 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  ;}
    break;

  case 144:
#line 954 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 145:
#line 955 "compilers/imcc/imcc.y"
    {  
      if (IMCC_INFO(interp)->adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               IMCC_INFO(interp)->adv_named_id, (yyvsp[0].sr));
          IMCC_INFO(interp)->adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr)); ;}
    break;

  case 146:
#line 961 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[-2].s),(yyvsp[0].sr));;}
    break;

  case 147:
#line 963 "compilers/imcc/imcc.y"
    {  
      if (IMCC_INFO(interp)->adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               IMCC_INFO(interp)->adv_named_id,(yyvsp[0].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr));    ;}
    break;

  case 148:
#line 969 "compilers/imcc/imcc.y"
    {  
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[-2].s),(yyvsp[0].sr));;}
    break;

  case 151:
#line 988 "compilers/imcc/imcc.y"
    { clear_state(interp); ;}
    break;

  case 152:
#line 993 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[0].i); ;}
    break;

  case 153:
#line 994 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 154:
#line 995 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 155:
#line 996 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 156:
#line 1000 "compilers/imcc/imcc.y"
    {  (yyval.i) = NULL; ;}
    break;

  case 160:
#line 1010 "compilers/imcc/imcc.y"
    {
         (yyval.i) = iLABEL(interp, IMCC_INFO(interp)->cur_unit, mk_local_label(interp, (yyvsp[0].s)));
                   ;}
    break;

  case 161:
#line 1019 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[-1].i); ;}
    break;

  case 162:
#line 1021 "compilers/imcc/imcc.y"
    { if (yynerrs >= PARROT_MAX_RECOVER_ERRORS) {
                           IMCC_warning(interp, "Too many errors. Correct some first.\n");
                           YYABORT;
                       }
                       yyerrok; ;}
    break;

  case 163:
#line 1030 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[0].idlist);
         l->next = NULL;
         (yyval.idlist) = l;
     ;}
    break;

  case 164:
#line 1037 "compilers/imcc/imcc.y"
    {  
         IdList* l = (yyvsp[0].idlist);
         l->next = (yyvsp[-2].idlist);
         (yyval.idlist) = l;
     ;}
    break;

  case 165:
#line 1046 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = (yyvsp[-1].s);
         l->unique_reg = 1;
         (yyval.idlist) = l;
     ;}
    break;

  case 166:
#line 1054 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = (yyvsp[0].s);
         l->unique_reg = 0;
         (yyval.idlist) = l;
     ;}
    break;

  case 169:
#line 1065 "compilers/imcc/imcc.y"
    { push_namespace((yyvsp[0].s)); ;}
    break;

  case 170:
#line 1066 "compilers/imcc/imcc.y"
    { pop_namespace((yyvsp[0].s)); ;}
    break;

  case 171:
#line 1067 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 172:
#line 1068 "compilers/imcc/imcc.y"
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
     ;}
    break;

  case 173:
#line 1083 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, (yyvsp[0].sr), (yyvsp[-2].s)); (yyval.i) = 0;
                    ;}
    break;

  case 174:
#line 1086 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 175:
#line 1087 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 0);is_def=0; ;}
    break;

  case 177:
#line 1089 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 178:
#line 1090 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1);is_def=0; ;}
    break;

  case 179:
#line 1091 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;
                           IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isTAIL_CALL;
                           IMCC_INFO(interp)->cur_call = NULL;
                        ;}
    break;

  case 180:
#line 1095 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "branch",1, (yyvsp[0].sr)); ;}
    break;

  case 181:
#line 1097 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-1].s), 0, 
                              IMCC_INFO(interp) -> regs,
                              IMCC_INFO(interp) -> nargs, 
                              IMCC_INFO(interp) -> keyvec, 1);
                       free((yyvsp[-1].s)); ;}
    break;

  case 182:
#line 1103 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[0].sr)); ;}
    break;

  case 183:
#line 1104 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 184:
#line 1105 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 186:
#line 1107 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;;}
    break;

  case 187:
#line 1111 "compilers/imcc/imcc.y"
    { (yyval.t) = 'I'; ;}
    break;

  case 188:
#line 1112 "compilers/imcc/imcc.y"
    { (yyval.t) = 'N'; ;}
    break;

  case 189:
#line 1113 "compilers/imcc/imcc.y"
    { (yyval.t) = 'S'; ;}
    break;

  case 190:
#line 1114 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; ;}
    break;

  case 191:
#line 1115 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; ;}
    break;

  case 192:
#line 1116 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; free((yyvsp[0].s)); ;}
    break;

  case 193:
#line 1121 "compilers/imcc/imcc.y"
    {
             if (( IMCC_INFO(interp)->cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, (yyvsp[0].s), 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", (yyvsp[0].s));
            }
         ;}
    break;

  case 194:
#line 1132 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set", 2, (yyvsp[-2].sr), (yyvsp[0].sr));      ;}
    break;

  case 195:
#line 1134 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "not", 2, (yyvsp[-3].sr), (yyvsp[0].sr));      ;}
    break;

  case 196:
#line 1136 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "neg", 2, (yyvsp[-3].sr), (yyvsp[0].sr));      ;}
    break;

  case 197:
#line 1138 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bnot", 2, (yyvsp[-3].sr), (yyvsp[0].sr));     ;}
    break;

  case 198:
#line 1140 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "add", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  ;}
    break;

  case 199:
#line 1142 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "sub", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  ;}
    break;

  case 200:
#line 1144 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mul", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  ;}
    break;

  case 201:
#line 1146 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "pow", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  ;}
    break;

  case 202:
#line 1148 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "div", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  ;}
    break;

  case 203:
#line 1150 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "fdiv", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 204:
#line 1152 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mod", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  ;}
    break;

  case 205:
#line 1154 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "concat", 3, (yyvsp[-4].sr),(yyvsp[-2].sr),(yyvsp[0].sr)); ;}
    break;

  case 206:
#line 1156 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "iseq", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 207:
#line 1158 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isne", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 208:
#line 1160 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isgt", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 209:
#line 1162 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "islt", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 210:
#line 1164 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isle", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 211:
#line 1166 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isge", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 212:
#line 1168 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shl", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  ;}
    break;

  case 213:
#line 1170 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  ;}
    break;

  case 214:
#line 1172 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "lsr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  ;}
    break;

  case 215:
#line 1174 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "and", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  ;}
    break;

  case 216:
#line 1176 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "or", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));   ;}
    break;

  case 217:
#line 1178 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "xor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  ;}
    break;

  case 218:
#line 1180 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "band", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 219:
#line 1182 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  ;}
    break;

  case 220:
#line 1184 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bxor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 221:
#line 1186 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); ;}
    break;

  case 222:
#line 1188 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[0].sr)); ;}
    break;

  case 223:
#line 1190 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-5].sr), (yyvsp[-2].s), (yyvsp[0].sr), 1); ;}
    break;

  case 224:
#line 1192 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-6].sr), (yyvsp[-3].s), (yyvsp[-1].sr), 1); ;}
    break;

  case 225:
#line 1194 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-3].sr), (yyvsp[0].s), NULL, 1); ;}
    break;

  case 226:
#line 1196 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[-3].sr), (yyvsp[0].sr)); ;}
    break;

  case 227:
#line 1198 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[-5].sr), (yyvsp[-1].sr)); ;}
    break;

  case 228:
#line 1200 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 229:
#line 1202 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[-6].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); ;}
    break;

  case 230:
#line 1204 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set_addr",
                        2, (yyvsp[-3].sr), mk_label_address(interp, (yyvsp[0].s))); ;}
    break;

  case 231:
#line 1207 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "find_global",2,(yyvsp[-3].sr),(yyvsp[0].sr));;}
    break;

  case 232:
#line 1209 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "store_global",2, (yyvsp[-2].sr),(yyvsp[0].sr)); ;}
    break;

  case 233:
#line 1213 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 234:
#line 1215 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 235:
#line 1217 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); ;}
    break;

  case 236:
#line 1220 "compilers/imcc/imcc.y"
    {
            add_pcc_result((yyvsp[0].i)->r[0], (yyvsp[-2].sr));
            IMCC_INFO(interp)->cur_call = NULL;
            (yyval.i) = 0;
         ;}
    break;

  case 237:
#line 1226 "compilers/imcc/imcc.y"
    {
            (yyval.i) = IMCC_create_itcall_label(interp);
         ;}
    break;

  case 238:
#line 1230 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[-3].sr));
           IMCC_INFO(interp)->cur_call = NULL;
         ;}
    break;

  case 242:
#line 1238 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[-2].sr)); ;}
    break;

  case 243:
#line 1241 "compilers/imcc/imcc.y"
    { (yyval.i) = IMCC_create_itcall_label(interp);
                           (yyval.i)->type &= ~ITCALL; (yyval.i)->type |= ITRESULT; ;}
    break;

  case 244:
#line 1243 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 245:
#line 1248 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "add", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 246:
#line 1250 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "sub", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 247:
#line 1252 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mul", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 248:
#line 1254 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "div", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 249:
#line 1256 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mod", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 250:
#line 1258 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "fdiv", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 251:
#line 1260 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "concat", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 252:
#line 1262 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "band", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 253:
#line 1264 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 254:
#line 1266 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bxor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 255:
#line 1268 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 256:
#line 1270 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shl", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 257:
#line 1272 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "lsr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 258:
#line 1277 "compilers/imcc/imcc.y"
    { (yyval.i) = func_ins(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-3].sr), (yyvsp[-1].s),
                                   IMCC_INFO(interp) -> regs,
                                   IMCC_INFO(interp) -> nargs,
                                   IMCC_INFO(interp) -> keyvec, 1);
                     free((yyvsp[-1].s));
                   ;}
    break;

  case 259:
#line 1285 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); ;}
    break;

  case 260:
#line 1286 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); ;}
    break;

  case 261:
#line 1287 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[0].s)); ;}
    break;

  case 262:
#line 1288 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[0].sr);
                       if ((yyvsp[0].sr)->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     ;}
    break;

  case 263:
#line 1293 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 264:
#line 1294 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[-2].sr); (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); ;}
    break;

  case 265:
#line 1295 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 266:
#line 1298 "compilers/imcc/imcc.y"
    { (yyval.t)=0; ;}
    break;

  case 267:
#line 1299 "compilers/imcc/imcc.y"
    { (yyval.t)=0; ;}
    break;

  case 268:
#line 1304 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[0].sr));
        ;}
    break;

  case 269:
#line 1309 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[-3].i); ;}
    break;

  case 270:
#line 1313 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 271:
#line 1314 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; 
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, IMCC_INFO(interp)->adv_named_id, (yyvsp[0].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       } else add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[0].sr)); 
   ;}
    break;

  case 272:
#line 1320 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; 
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call,IMCC_INFO(interp)->adv_named_id,(yyvsp[0].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       } else add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[0].sr));
   ;}
    break;

  case 273:
#line 1326 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0;
                                     add_pcc_named_arg(interp,IMCC_INFO(interp)->cur_call,(yyvsp[-2].s),(yyvsp[0].sr));;}
    break;

  case 274:
#line 1328 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_named_arg(interp,IMCC_INFO(interp)->cur_call,(yyvsp[-2].s),(yyvsp[0].sr));;}
    break;

  case 275:
#line 1332 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); ;}
    break;

  case 276:
#line 1336 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; ;}
    break;

  case 277:
#line 1337 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); ;}
    break;

  case 278:
#line 1341 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT; ;}
    break;

  case 279:
#line 1342 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_MAYBE_FLAT; ;}
    break;

  case 280:
#line 1343 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_NAMED; ;}
    break;

  case 281:
#line 1344 "compilers/imcc/imcc.y"
    { adv_named_set(interp,(yyvsp[-1].s)); (yyval.t) = 0; ;}
    break;

  case 282:
#line 1347 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); ;}
    break;

  case 283:
#line 1351 "compilers/imcc/imcc.y"
    { 
         (yyval.sr) = 0;
         if (IMCC_INFO(interp)->adv_named_id) {
             add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,IMCC_INFO(interp)->adv_named_id,(yyvsp[0].sr));
             IMCC_INFO(interp)->adv_named_id = NULL;
         } else add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[0].sr)); ;}
    break;

  case 284:
#line 1357 "compilers/imcc/imcc.y"
    { 
        add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,(yyvsp[-2].s),(yyvsp[0].sr)); ;}
    break;

  case 285:
#line 1359 "compilers/imcc/imcc.y"
    { 
       (yyval.sr) = 0;
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,IMCC_INFO(interp)->adv_named_id,(yyvsp[0].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       } else add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[0].sr)); ;}
    break;

  case 286:
#line 1365 "compilers/imcc/imcc.y"
    { add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,(yyvsp[-2].s),(yyvsp[0].sr)); ;}
    break;

  case 287:
#line 1366 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 288:
#line 1371 "compilers/imcc/imcc.y"
    { (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-3].s), 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 289:
#line 1373 "compilers/imcc/imcc.y"
    { (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, inv_op((yyvsp[-3].s)), 3, (yyvsp[-4].sr),(yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 290:
#line 1375 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 291:
#line 1377 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 292:
#line 1379 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 293:
#line 1381 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless",2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 294:
#line 1383 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 295:
#line 1385 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 296:
#line 1389 "compilers/imcc/imcc.y"
    {  (yyval.s) = "eq"; ;}
    break;

  case 297:
#line 1390 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ne"; ;}
    break;

  case 298:
#line 1391 "compilers/imcc/imcc.y"
    {  (yyval.s) = "gt"; ;}
    break;

  case 299:
#line 1392 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ge"; ;}
    break;

  case 300:
#line 1393 "compilers/imcc/imcc.y"
    {  (yyval.s) = "lt"; ;}
    break;

  case 301:
#line 1394 "compilers/imcc/imcc.y"
    {  (yyval.s) = "le"; ;}
    break;

  case 304:
#line 1403 "compilers/imcc/imcc.y"
    {  (yyval.sr) = NULL; ;}
    break;

  case 305:
#line 1404 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 306:
#line 1408 "compilers/imcc/imcc.y"
    { (yyval.sr) = IMCC_INFO(interp)->regs[0]; ;}
    break;

  case 308:
#line 1413 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->regs[IMCC_INFO(interp)->nargs++] = (yyvsp[0].sr); ;}
    break;

  case 309:
#line 1415 "compilers/imcc/imcc.y"
    {
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[-3].sr);
                      IMCC_INFO(interp) -> keyvec |= KEY_BIT(IMCC_INFO(interp)->nargs);
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[-1].sr);
                      (yyval.sr) = (yyvsp[-3].sr);
                   ;}
    break;

  case 310:
#line 1422 "compilers/imcc/imcc.y"
    {
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[-1].sr);
                      (yyval.sr) = (yyvsp[-1].sr);
                   ;}
    break;

  case 312:
#line 1429 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); ;}
    break;

  case 313:
#line 1430 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[0].s)); ;}
    break;

  case 314:
#line 1434 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); ;}
    break;

  case 315:
#line 1435 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); ;}
    break;

  case 316:
#line 1439 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); ;}
    break;

  case 317:
#line 1440 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); ;}
    break;

  case 322:
#line 1453 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->nkeys = 0;
                      IMCC_INFO(interp)->in_slice = 0; ;}
    break;

  case 323:
#line 1455 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp, 
                                     IMCC_INFO(interp)->nkeys, 
                                     IMCC_INFO(interp)->keys, 0); ;}
    break;

  case 324:
#line 1460 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->nkeys = 0;
                      IMCC_INFO(interp)->in_slice = 0; ;}
    break;

  case 325:
#line 1462 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp,
                                     IMCC_INFO(interp)->nkeys, 
                                     IMCC_INFO(interp)->keys, 1); ;}
    break;

  case 326:
#line 1468 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[0].sr); ;}
    break;

  case 327:
#line 1470 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[0].sr);
                      (yyval.sr) = IMCC_INFO(interp)->keys[0]; ;}
    break;

  case 328:
#line 1472 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->in_slice = 1; ;}
    break;

  case 329:
#line 1473 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[0].sr);
                       (yyval.sr) = IMCC_INFO(interp)->keys[0]; ;}
    break;

  case 330:
#line 1478 "compilers/imcc/imcc.y"
    { if (IMCC_INFO(interp)->in_slice) {
                         (yyvsp[0].sr)->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     (yyval.sr) = (yyvsp[0].sr);
                   ;}
    break;

  case 331:
#line 1484 "compilers/imcc/imcc.y"
    { (yyvsp[-2].sr)->type |= VT_START_SLICE;
                     (yyvsp[0].sr)->type |= VT_END_SLICE;
                     IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[-2].sr); 
                     (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 332:
#line 1488 "compilers/imcc/imcc.y"
    { (yyvsp[0].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 333:
#line 1489 "compilers/imcc/imcc.y"
    { (yyvsp[-1].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[-1].sr); ;}
    break;

  case 334:
#line 1493 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'I'); ;}
    break;

  case 335:
#line 1494 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'N'); ;}
    break;

  case 336:
#line 1495 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); ;}
    break;

  case 337:
#line 1496 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'P'); ;}
    break;

  case 338:
#line 1497 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_pasm_reg(interp, (yyvsp[0].s));    ;}
    break;

  case 339:
#line 1501 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'I'); ;}
    break;

  case 340:
#line 1502 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'N'); ;}
    break;

  case 341:
#line 1503 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); ;}
    break;

  case 342:
#line 1504 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'U'); ;}
    break;

  case 343:
#line 1508 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); ;}
    break;

  case 344:
#line 1509 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S');  ;}
    break;


      default: break;
    }

/* Line 1126 of yacc.c.  */
#line 4173 "compilers/imcc/imcparser.c"

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


#line 1514 "compilers/imcc/imcc.y"


/* I need this prototype somewhere... */
char *yyget_text (yyscan_t yyscanner );

/* I do not like this function, but, atm, it is the only way I can
 * make the code in yyerror work without segfault on some specific
 * cases.
 */
/* int yyholds_char(yyscan_t yyscanner ); */

int yyerror(void *yyscanner, Interp *interp, char * s)
{
    /* If the error occurr in the end of the buffer (I mean, the last
     * token was already read), yyget_text will return a pointer
     * outside the bison buffer, and thus, not "accessible" by
     * us. This means it may segfault. */
    char *chr = yyget_text((yyscan_t)yyscanner);

    /* IMCC_fataly(interp, E_SyntaxError, s); */
    /* --- This was called before, not sure if I should call some
           similar function that does not die like this one. */


    /* Basically, if current token is a newline, it mean the error was
     * before the newline, and thus, line is the line *after* the
     * error.  
     */
    if (!at_eof(yyscanner) && *chr == '\n') {
        IMCC_INFO(interp)->line--;
        IMCC_warning(interp, "error:imcc:%s", s);
        IMCC_print_inc(interp);
        IMCC_INFO(interp)->line++;
    } else {
        IMCC_warning(interp, "error:imcc:%s", s);
        IMCC_print_inc(interp);
    }

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

