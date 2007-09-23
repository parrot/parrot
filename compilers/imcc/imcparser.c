/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

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

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

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
     LOG_XOR = 307,
     RELOP_EQ = 308,
     RELOP_NE = 309,
     RELOP_GT = 310,
     RELOP_GTE = 311,
     RELOP_LT = 312,
     RELOP_LTE = 313,
     GLOBAL = 314,
     GLOBALOP = 315,
     ADDR = 316,
     RESULT = 317,
     RETURN = 318,
     YIELDT = 319,
     GET_RESULTS = 320,
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
     MAIN = 339,
     LOAD = 340,
     INIT = 341,
     IMMEDIATE = 342,
     POSTCOMP = 343,
     METHOD = 344,
     ANON = 345,
     OUTER = 346,
     NEED_LEX = 347,
     MULTI = 348,
     VTABLE_METHOD = 349,
     LOADLIB = 350,
     UNIQUE_REG = 351,
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
     CONCAT = 372
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
#define LOG_XOR 307
#define RELOP_EQ 308
#define RELOP_NE 309
#define RELOP_GT 310
#define RELOP_GTE 311
#define RELOP_LT 312
#define RELOP_LTE 313
#define GLOBAL 314
#define GLOBALOP 315
#define ADDR 316
#define RESULT 317
#define RETURN 318
#define YIELDT 319
#define GET_RESULTS 320
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
#define MAIN 339
#define LOAD 340
#define INIT 341
#define IMMEDIATE 342
#define POSTCOMP 343
#define METHOD 344
#define ANON 345
#define OUTER 346
#define NEED_LEX 347
#define MULTI 348
#define VTABLE_METHOD 349
#define LOADLIB 350
#define UNIQUE_REG 351
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




/* Copy the first part of user declarations.  */
#line 1 "compilers/imcc/imcc.y"

/*
 * imcc.y
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 * Copyright (C) 2002-2007, The Perl Foundation.
 *
 * Grammar for the parser.
 *
 * $Id$
 *
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#define _PARSER
#define PARSER_MAIN
#include "imc.h"
#include "parrot/dynext.h"
#include "pbc.h"
#include "parser.h"
#include "optimizer.h"

/* HEADERIZER HFILE: compilers/imcc/imc.h */

/* HEADERIZER BEGIN: static */

#ifndef YYENABLE_NLS
#  define YYENABLE_NLS 0
#endif

#ifndef YYLTYPE_IS_TRIVIAL
#  define YYLTYPE_IS_TRIVIAL 0
#endif

static void add_pcc_named_arg( PARROT_INTERP,
    NOTNULL(SymReg *cur_call),
    const char     *name,
    SymReg         *value )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void add_pcc_named_param( PARROT_INTERP,
    SymReg     *cur_call,
    const char *name,
    SymReg     *value )
        __attribute__nonnull__(1);

static void add_pcc_named_result( PARROT_INTERP,
    SymReg     *cur_call,
    const char *name,
    SymReg     *value )
        __attribute__nonnull__(1);

static void add_pcc_named_return( PARROT_INTERP,
    SymReg     *cur_call,
    const char *name,
    SymReg     *value )
        __attribute__nonnull__(1);

static void begin_return_or_yield( PARROT_INTERP, int yield )
        __attribute__nonnull__(1);

static void clear_state( PARROT_INTERP )
        __attribute__nonnull__(1);

static void do_loadlib( PARROT_INTERP, NOTNULL(const char *lib) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static Instruction* func_ins(
    PARROT_INTERP,
    IMC_Unit   *unit,
    SymReg     *lhs,
    const char *op,
    NOTNULL(SymReg **r),
    int n,
    int keyv,
    int emit )
        __attribute__nonnull__(5);

static Instruction * iINDEXFETCH( PARROT_INTERP,
    IMC_Unit *unit,
    SymReg *r0,
    SymReg *r1,
    SymReg *r2 )
        __attribute__nonnull__(1);

static Instruction * iINDEXSET( PARROT_INTERP,
    IMC_Unit *unit,
    SymReg *r0,
    SymReg *r1,
    SymReg *r2 )
        __attribute__nonnull__(1);

static Instruction * iLABEL( PARROT_INTERP, IMC_Unit *unit, SymReg *r0 )
        __attribute__nonnull__(1);

static const char * inv_op( const char *op );
static Instruction * iSUBROUTINE( PARROT_INTERP,
    IMC_Unit *unit,
    NOTNULL(SymReg *r) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static Instruction * MK_I( PARROT_INTERP,
    IMC_Unit *unit,
    NOTNULL(const char *fmt),
    int n,
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
static Instruction* mk_pmc_const( PARROT_INTERP,
    IMC_Unit *unit,
    NOTNULL(const char *type),
    NOTNULL(SymReg *left),
    NOTNULL(char *constant))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5);

static SymReg * mk_sub_address_fromc( PARROT_INTERP, char *name )
        __attribute__nonnull__(1);

static SymReg * mk_sub_address_u( PARROT_INTERP, char *name )
        __attribute__nonnull__(1);

static void set_lexical( PARROT_INTERP, NOTNULL(SymReg *r), char *name )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: static */


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
 * MK_I: build and emitb instruction by INS
 *
 * fmt may contain:
 *   op %s, %s # comment
 * or just
 *   op
 *
 *
 *  NOTE: Most usage of this function is with
 *        IMCC_INFO(interp)->cur_unit, but there are some
 *        exceptions. Thus, we can't easily factorize that piece of
 *        code.
 */
static Instruction *
MK_I(PARROT_INTERP, IMC_Unit *unit, NOTNULL(const char *fmt), int n, ...)
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
        fmt = NULL;
    else
        fmt = ++q;
#ifdef OPDEBUG
    fprintf(stderr, "op '%s' format '%s' (%d)\n", opname, fmt?:"",n);
#endif
    va_start(ap, n);
    i = 0;
    for (i = 0; i < n; ++i) {
        r[i] = va_arg(ap, SymReg *);
    }
    va_end(ap);
    return INS(interp, unit, opname, fmt, r, n,
               IMCC_INFO(interp)->keyvec, 1);
}

PARROT_WARN_UNUSED_RESULT
static Instruction*
mk_pmc_const(PARROT_INTERP, IMC_Unit *unit, NOTNULL(const char *type),
             NOTNULL(SymReg *left), NOTNULL(char *constant))
{
    const   int type_enum = atoi(type);
    SymReg *rhs;
    SymReg *r[2];
    char   *name;
    int     ascii;

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
        const size_t len  = strlen(constant);
        name              = (char *)mem_sys_allocate(len);
        constant[len - 1] = '\0';

        strcpy(name, constant + 1);
        free(constant);
    }
    else {
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

PARROT_WARN_UNUSED_RESULT
static Instruction*
func_ins(PARROT_INTERP, IMC_Unit *unit, SymReg *lhs, const char *op,
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

static void
clear_state(PARROT_INTERP)
{
    IMCC_INFO(interp) -> nargs = 0;
    IMCC_INFO(interp) -> keyvec = 0;
}

Instruction *
INS_LABEL(PARROT_INTERP, IMC_Unit *unit, SymReg *r0, int emit)
{

    Instruction * const ins = _mk_instruction("","%s:", 1, &r0, 0);
    ins->type               = ITLABEL;
    r0->first_ins           = ins;

    if (emit)
        emitb(interp, unit, ins);

    return ins;
}

static Instruction * iLABEL(PARROT_INTERP, IMC_Unit *unit, SymReg *r0) {
    Instruction * const i = INS_LABEL(interp, unit, r0, 1);
    i->line               = IMCC_INFO(interp)->line;

    clear_state(interp);
    return i;
}

static Instruction *
iSUBROUTINE(PARROT_INTERP, IMC_Unit *unit, NOTNULL(SymReg *r)) {
    Instruction * const i =iLABEL(interp, unit, r);

    r->type    = (r->type & VT_ENCODED) ? VT_PCC_SUB|VT_ENCODED : VT_PCC_SUB;
    r->pcc_sub = (pcc_sub_t*)calloc(1, sizeof(struct pcc_sub_t));

    IMCC_INFO(interp)->cur_call = r;
    i->line                     = IMCC_INFO(interp)->line;

    add_namespace(interp, unit);
    return i;
}

/*
 * substr or X = P[key]
 */
static Instruction *
iINDEXFETCH(PARROT_INTERP, IMC_Unit *unit, SymReg *r0, SymReg *r1, SymReg *r2)
{
    if (r0->set == 'S' && r1->set == 'S' && r2->set == 'I') {
        SymReg * const r3 = mk_const(interp, str_dup("1"), 'I');
        return MK_I(interp, unit, "substr %s, %s, %s, 1", 4, r0, r1, r2, r3);
    }

    IMCC_INFO(interp) -> keyvec |= KEY_BIT(2);
    return MK_I(interp, unit, "set %s, %s[%s]", 3, r0,r1,r2);
}

/*
 * substr or P[key] = X
 */

static Instruction *
iINDEXSET(PARROT_INTERP, IMC_Unit * unit,
          SymReg * r0, SymReg * r1, SymReg * r2)
{
    if (r0->set == 'S' && r1->set == 'I' && r2->set == 'S') {
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

static const char *
inv_op(const char *op) {
    int n;
    return get_neg_op(op, &n);
}

Instruction *
IMCC_create_itcall_label(PARROT_INTERP)
{
    char name[128];
    SymReg * r;
    Instruction *i;

    sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, IMCC_INFO(interp)->cnr++);
    r = mk_pcc_sub(interp, str_dup(name), 0);
    i = iLABEL(interp, IMCC_INFO(interp)->cur_unit, r);
    IMCC_INFO(interp)->cur_call = r;
    i->type = ITCALL | ITPCCSUB;
    return i;
}


static SymReg *
mk_sub_address_fromc(PARROT_INTERP, char * name)
{
    /* name is a quoted sub name */
    SymReg *r;

    name[strlen(name) - 1] = '\0';
    r = mk_sub_address(interp, str_dup(name + 1));
    mem_sys_free(name);
    return r;
}

static SymReg *
mk_sub_address_u(PARROT_INTERP, char * name)
{
    SymReg * const r = mk_sub_address(interp, name);
    r->type         |= VT_ENCODED;

    return r;
}

void
IMCC_itcall_sub(PARROT_INTERP, SymReg *sub)
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
begin_return_or_yield(PARROT_INTERP, int yield)
{
    Instruction *i;
    Instruction * const ins = IMCC_INFO(interp)->cur_unit->instructions;
    char                name[128];

    if (!ins || !ins->r[0] || !(ins->r[0]->type & VT_PCC_SUB))
        IMCC_fataly(interp, E_SyntaxError,
                    "yield or return directive outside pcc subroutine\n");
    if (yield)
       ins->r[0]->pcc_sub->calls_a_sub = 1 | ITPCCYIELD;
    sprintf(name, yield ? "%cpcc_sub_yield_%d" : "%cpcc_sub_ret_%d",
            IMCC_INTERNAL_CHAR, IMCC_INFO(interp)->cnr++);
    interp->imc_info->sr_return = mk_pcc_sub(interp, str_dup(name), 0);
    i = iLABEL(interp, IMCC_INFO(interp)->cur_unit, interp->imc_info->sr_return);
    i->type = yield ? ITPCCSUB | ITLABEL | ITPCCYIELD : ITPCCSUB | ITLABEL ;
    interp->imc_info->asm_state = yield ? AsmInYield : AsmInReturn;
}

static void
set_lexical(PARROT_INTERP, NOTNULL(SymReg *r), char *name)
{
    SymReg *n = mk_const(interp, name, 'S');

    r->usage |= U_LEXICAL;

    if (n == r->reg)
        IMCC_fataly(interp, E_SyntaxError,
            "register %s already declared as lexical %s", r->name, n->name);

    /* chain all names in r->reg */
    n->reg = r->reg;
    r->reg = n;
}

static void
add_pcc_named_arg(PARROT_INTERP, NOTNULL(SymReg *cur_call), const char *name,
                  SymReg *value)
{
    SymReg *r = mk_const(interp, name, 'S');
    r->type  |= VT_NAMED;

    add_pcc_arg(cur_call, r);
    add_pcc_arg(cur_call, value);
}

static void
add_pcc_named_result(PARROT_INTERP, SymReg *cur_call, const char *name,
                     SymReg *value)
{
    SymReg * const r = mk_const(interp, name, 'S');
    r->type         |= VT_NAMED;

    add_pcc_result(cur_call, r);
    add_pcc_result(cur_call, value);
}

static void
add_pcc_named_param(PARROT_INTERP, SymReg *cur_call, const char *name,
                    SymReg *value)
{
    SymReg * const r = mk_const(interp, name, 'S');
    r->type         |= VT_NAMED;

    add_pcc_param(cur_call, r);
    add_pcc_param(cur_call, value);
}

static void
add_pcc_named_return(PARROT_INTERP, SymReg *cur_call, const char *name,
                     SymReg *value)
{
    SymReg * const r = mk_const(interp, name, 'S');
    r->type         |= VT_NAMED;

    add_pcc_return(cur_call, r);
    add_pcc_return(cur_call, value);
}

static void
adv_named_set(PARROT_INTERP, char *name) {
    if (IMCC_INFO(interp)->adv_named_id) {
        IMCC_fataly(interp, E_SyntaxError,
                    "Named parameter with more than one name.\n");
    }
    IMCC_INFO(interp)->adv_named_id = name;
}

static void
do_loadlib(PARROT_INTERP, NOTNULL(const char *lib))
{
    PMC *ignored;
    STRING * const s = string_unescape_cstring(interp, lib + 1, '"', NULL);
    ignored = Parrot_load_lib(interp, s, NULL);
    UNUSED(ignored);
    Parrot_register_HLL_lib(interp, s);
}

/* HEADERIZER STOP */



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

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 516 "compilers/imcc/imcc.y"
{
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
}
/* Line 187 of yacc.c.  */
#line 853 "compilers/imcc/imcparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 866 "compilers/imcc/imcparser.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

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

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
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
      while (YYID (0))
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
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  31
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   743

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  134
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  120
/* YYNRULES -- Number of rules.  */
#define YYNRULES  337
/* YYNRULES -- Number of states.  */
#define YYNSTATES  543

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   372

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   124,     2,     2,     2,   130,   131,     2,
     122,   123,   128,   127,     2,   126,     2,   129,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   133,
       2,   119,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   120,     2,   121,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   132,     2,   125,     2,     2,     2,
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
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      21,    23,    25,    29,    32,    36,    39,    44,    49,    50,
      57,    58,    65,    67,    69,    71,    74,    78,    81,    83,
      85,    87,    89,    91,    92,    96,    97,   102,   105,   110,
     111,   113,   114,   119,   120,   122,   126,   130,   131,   132,
     133,   134,   145,   146,   148,   152,   153,   157,   161,   167,
     168,   170,   175,   180,   185,   187,   192,   193,   197,   199,
     201,   203,   205,   207,   209,   211,   215,   216,   218,   219,
     229,   230,   233,   234,   238,   239,   241,   243,   247,   249,
     251,   253,   255,   257,   259,   261,   263,   265,   267,   269,
     275,   279,   283,   287,   291,   297,   303,   304,   308,   311,
     312,   316,   320,   321,   326,   327,   330,   332,   334,   336,
     338,   343,   345,   346,   352,   354,   355,   361,   362,   365,
     369,   373,   374,   380,   382,   384,   385,   387,   391,   395,
     401,   403,   406,   407,   410,   413,   415,   417,   418,   420,
     423,   425,   427,   431,   434,   436,   440,   443,   445,   447,
     449,   452,   455,   456,   461,   466,   467,   474,   476,   477,
     484,   487,   490,   493,   496,   498,   500,   502,   504,   505,
     507,   509,   511,   513,   515,   517,   521,   526,   532,   539,
     546,   553,   561,   566,   571,   578,   585,   593,   598,   603,
     608,   613,   620,   628,   632,   633,   643,   645,   647,   649,
     653,   655,   657,   659,   661,   663,   665,   667,   669,   671,
     673,   675,   677,   679,   681,   683,   685,   687,   689,   691,
     693,   695,   697,   699,   701,   703,   705,   706,   712,   716,
     718,   720,   722,   724,   726,   728,   730,   732,   734,   736,
     738,   740,   742,   747,   749,   751,   753,   755,   759,   763,
     767,   768,   774,   775,   779,   781,   787,   791,   794,   795,
     798,   800,   802,   807,   810,   814,   820,   822,   826,   827,
     829,   831,   838,   844,   849,   854,   861,   867,   869,   871,
     873,   875,   877,   879,   881,   883,   885,   887,   888,   890,
     894,   896,   898,   903,   907,   909,   911,   913,   915,   917,
     919,   921,   923,   925,   927,   929,   930,   933,   934,   937,
     939,   943,   944,   949,   951,   955,   958,   961,   963,   965,
     967,   969,   971,   973,   975,   977,   979,   981
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     135,     0,    -1,   136,    -1,   137,    -1,   136,   137,    -1,
     155,    -1,   141,    -1,   157,    -1,   152,    -1,   107,     4,
      -1,   138,    -1,     4,    -1,     6,   139,     4,    -1,   140,
       4,    -1,    96,   109,     4,    -1,     7,   110,    -1,     8,
     109,    71,   109,    -1,     9,   110,    71,   110,    -1,    -1,
      29,   142,   210,   105,   119,   252,    -1,    -1,    29,   144,
     110,   242,   119,   145,    -1,   109,    -1,   112,    -1,   147,
      -1,   146,   147,    -1,   200,   148,     4,    -1,   107,     4,
      -1,   116,    -1,   115,    -1,   155,    -1,   143,    -1,   138,
      -1,    -1,   149,   113,   151,    -1,    -1,    77,   150,   176,
      98,    -1,    14,   243,    -1,    28,   109,    71,   106,    -1,
      -1,   236,    -1,    -1,    99,   153,   154,   100,    -1,    -1,
     146,    -1,    22,   156,     4,    -1,   120,   244,   121,    -1,
      -1,    -1,    -1,    -1,    25,   158,   239,   159,   176,     4,
     160,   161,   171,    72,    -1,    -1,     4,    -1,   161,   162,
       4,    -1,    -1,     5,   163,   164,    -1,   210,   105,   185,
      -1,   210,   109,    20,   105,   185,    -1,    -1,    71,    -1,
      94,   122,   169,   123,    -1,    92,   122,   109,   123,    -1,
      92,   122,   105,   123,    -1,    95,    -1,    95,   122,   109,
     123,    -1,    -1,   169,    71,   170,    -1,   170,    -1,    49,
      -1,    50,    -1,    52,    -1,    51,    -1,   105,    -1,   109,
      -1,   120,   244,   121,    -1,    -1,   197,    -1,    -1,    74,
       4,   173,   180,   175,   179,   174,   182,    75,    -1,    -1,
     202,     4,    -1,    -1,    84,   243,     4,    -1,    -1,   177,
      -1,   178,    -1,   177,   165,   178,    -1,    86,    -1,    87,
      -1,    85,    -1,    88,    -1,    89,    -1,    91,    -1,    90,
      -1,    93,    -1,   166,    -1,   167,    -1,   168,    -1,    76,
     243,    71,   243,     4,    -1,    76,   243,     4,    -1,    82,
     243,     4,    -1,    83,   235,     4,    -1,    83,   109,     4,
      -1,    83,   235,    71,   243,     4,    -1,    83,   109,    71,
     243,     4,    -1,    -1,   180,   181,     4,    -1,    11,   225,
      -1,    -1,   182,   183,     4,    -1,    63,   235,   185,    -1,
      -1,    27,   184,   210,   205,    -1,    -1,   185,   186,    -1,
      16,    -1,    17,    -1,    18,    -1,    19,    -1,    19,   122,
     109,   123,    -1,    97,    -1,    -1,    78,     4,   188,   191,
      79,    -1,   193,    -1,    -1,    80,     4,   190,   191,    81,
      -1,    -1,   191,     4,    -1,   191,   192,     4,    -1,    64,
     243,   226,    -1,    -1,   195,   122,   194,   196,   123,    -1,
      64,    -1,    65,    -1,    -1,   225,    -1,   109,    20,   243,
      -1,   196,    71,   225,    -1,   196,    71,   109,    20,   243,
      -1,   199,    -1,   197,   199,    -1,    -1,   198,   203,    -1,
     107,     4,    -1,   116,    -1,   115,    -1,    -1,   201,    -1,
     201,   202,    -1,   202,    -1,    98,    -1,   200,   206,     4,
      -1,     1,     4,    -1,   205,    -1,   204,    71,   205,    -1,
     105,    97,    -1,   105,    -1,   212,    -1,   230,    -1,    22,
     105,    -1,    23,   105,    -1,    -1,    27,   207,   210,   204,
      -1,    28,   109,    71,   235,    -1,    -1,    29,   208,   210,
     105,   119,   252,    -1,   143,    -1,    -1,    32,   209,   210,
     105,   119,   252,    -1,    64,   222,    -1,    10,   241,    -1,
     113,   236,    -1,    14,   243,    -1,   222,    -1,   172,    -1,
     187,    -1,   189,    -1,    -1,    49,    -1,    50,    -1,    51,
      -1,    52,    -1,   211,    -1,   105,    -1,   235,   119,   243,
      -1,   235,   119,   214,   243,    -1,   235,   119,   243,   215,
     243,    -1,   235,   119,   243,   120,   244,   121,    -1,   235,
     120,   244,   121,   119,   243,    -1,   235,   119,    21,   211,
      71,   243,    -1,   235,   119,    21,   211,   120,   244,   121,
      -1,   235,   119,    21,   211,    -1,   235,   119,    21,   243,
      -1,   235,   119,    21,   120,   244,   121,    -1,   235,   119,
      21,   243,    71,   243,    -1,   235,   119,    21,   243,   120,
     244,   121,    -1,   235,   119,    62,   105,    -1,   235,   119,
      61,   253,    -1,    61,   253,   119,   243,    -1,    21,   235,
      71,   243,    -1,    21,   235,    71,   243,    71,   243,    -1,
      21,   235,    71,   243,   120,   244,   121,    -1,   235,   119,
     222,    -1,    -1,   122,   213,   229,   123,   119,   221,   122,
     224,   123,    -1,   216,    -1,   218,    -1,   220,    -1,   235,
     119,    14,    -1,   124,    -1,   125,    -1,   126,    -1,   126,
      -1,   127,    -1,   128,    -1,   129,    -1,   130,    -1,    41,
      -1,    67,    -1,   118,    -1,    54,    -1,    55,    -1,    56,
      -1,    57,    -1,    58,    -1,    59,    -1,    47,    -1,    48,
      -1,    68,    -1,    69,    -1,    70,    -1,    53,    -1,   131,
      -1,   132,    -1,   125,    -1,    -1,    66,   217,   122,   229,
     123,    -1,   235,   219,   243,    -1,    33,    -1,    34,    -1,
      35,    -1,    36,    -1,    43,    -1,    42,    -1,    37,    -1,
      38,    -1,    39,    -1,    40,    -1,    44,    -1,    45,    -1,
      46,    -1,   235,   119,   113,   151,    -1,   105,    -1,   109,
      -1,   112,    -1,   235,    -1,   235,   117,   240,    -1,   235,
     117,   109,    -1,   235,   117,   235,    -1,    -1,   221,   223,
     122,   224,   123,    -1,    -1,   224,    71,   225,    -1,   225,
      -1,   224,    71,   109,    20,   243,    -1,   109,    20,   243,
      -1,   243,   226,    -1,    -1,   226,   227,    -1,    15,    -1,
      19,    -1,    19,   122,   109,   123,    -1,   235,   185,    -1,
     229,    71,   228,    -1,   229,    71,   109,    20,   235,    -1,
     228,    -1,   109,    20,   235,    -1,    -1,   232,    -1,   231,
      -1,    13,   243,   234,   243,    10,   241,    -1,    13,    14,
     243,    10,   241,    -1,    13,   243,   233,   241,    -1,    12,
     243,   233,   241,    -1,    12,   243,   234,   243,    10,   241,
      -1,    12,    14,   243,    10,   241,    -1,    71,    -1,    10,
      -1,    54,    -1,    55,    -1,    56,    -1,    57,    -1,    58,
      -1,    59,    -1,   114,    -1,   251,    -1,    -1,   237,    -1,
     237,    71,   238,    -1,   238,    -1,   242,    -1,   235,   120,
     244,   121,    -1,   120,   246,   121,    -1,   240,    -1,   109,
      -1,   112,    -1,   105,    -1,   113,    -1,   105,    -1,   113,
      -1,   241,    -1,   243,    -1,   235,    -1,   252,    -1,    -1,
     245,   248,    -1,    -1,   247,   248,    -1,   250,    -1,   248,
     133,   250,    -1,    -1,   248,    71,   249,   250,    -1,   243,
      -1,   243,    73,   243,    -1,    73,   243,    -1,   243,    73,
      -1,   101,    -1,   102,    -1,   103,    -1,   104,    -1,   106,
      -1,   110,    -1,   111,    -1,   109,    -1,   112,    -1,   103,
      -1,   109,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   608,   608,   612,   613,   617,   618,   619,   622,   625,
     626,   627,   630,   631,   632,   635,   643,   656,   665,   665,
     670,   670,   674,   675,   679,   680,   684,   685,   686,   687,
     688,   689,   690,   693,   693,   700,   699,   710,   712,   717,
     721,   725,   725,   735,   737,   741,   756,   757,   762,   766,
     769,   761,   775,   776,   777,   788,   788,   792,   797,   807,
     808,   812,   815,   818,   823,   827,   834,   835,   836,   840,
     841,   842,   843,   844,   854,   864,   867,   869,   874,   873,
     906,   907,   911,   912,   917,   918,   922,   923,   927,   928,
     929,   930,   931,   932,   933,   934,   935,   936,   937,   941,
     946,   948,   953,   955,   957,   961,   969,   970,   974,   979,
     980,   984,   985,   985,  1000,  1001,  1005,  1006,  1007,  1008,
    1009,  1010,  1016,  1015,  1020,  1026,  1025,  1033,  1034,  1037,
    1043,  1048,  1047,  1057,  1058,  1062,  1063,  1070,  1072,  1079,
    1085,  1086,  1098,  1102,  1104,  1105,  1106,  1110,  1111,  1115,
    1116,  1120,  1128,  1130,  1139,  1146,  1155,  1163,  1173,  1174,
    1175,  1176,  1177,  1177,  1194,  1198,  1198,  1200,  1201,  1201,
    1203,  1207,  1208,  1214,  1216,  1217,  1218,  1219,  1220,  1224,
    1225,  1226,  1227,  1228,  1232,  1243,  1245,  1247,  1249,  1251,
    1253,  1255,  1257,  1259,  1261,  1263,  1265,  1267,  1270,  1272,
    1276,  1278,  1280,  1283,  1290,  1289,  1298,  1299,  1300,  1301,
    1306,  1307,  1308,  1312,  1313,  1314,  1315,  1316,  1317,  1318,
    1319,  1320,  1321,  1322,  1323,  1324,  1325,  1326,  1327,  1328,
    1329,  1330,  1331,  1332,  1333,  1334,  1338,  1338,  1346,  1351,
    1352,  1353,  1354,  1355,  1356,  1357,  1358,  1359,  1360,  1361,
    1362,  1363,  1368,  1377,  1378,  1379,  1380,  1385,  1386,  1387,
    1393,  1392,  1402,  1403,  1410,  1417,  1419,  1423,  1427,  1428,
    1432,  1433,  1434,  1437,  1441,  1448,  1450,  1457,  1458,  1462,
    1463,  1467,  1469,  1471,  1476,  1478,  1480,  1485,  1486,  1490,
    1491,  1492,  1493,  1494,  1495,  1499,  1500,  1504,  1505,  1509,
    1510,  1514,  1515,  1522,  1529,  1530,  1531,  1535,  1536,  1540,
    1541,  1545,  1546,  1550,  1551,  1554,  1554,  1561,  1561,  1569,
    1570,  1573,  1573,  1579,  1584,  1589,  1590,  1594,  1595,  1596,
    1597,  1598,  1602,  1603,  1604,  1605,  1609,  1610
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
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
  "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT",
  "RELOP_LTE", "GLOBAL", "GLOBALOP", "ADDR", "RESULT", "RETURN", "YIELDT",
  "GET_RESULTS", "POW", "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA",
  "ESUB", "DOTDOT", "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB",
  "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD", "PCC_END_YIELD",
  "NCI_CALL", "METH_CALL", "INVOCANT", "MAIN", "LOAD", "INIT", "IMMEDIATE",
  "POSTCOMP", "METHOD", "ANON", "OUTER", "NEED_LEX", "MULTI",
  "VTABLE_METHOD", "LOADLIB", "UNIQUE_REG", "LABEL", "EMIT", "EOM", "IREG",
  "NREG", "SREG", "PREG", "IDENTIFIER", "REG", "MACRO", "ENDM", "STRINGC",
  "INTC", "FLOATC", "USTRINGC", "PARROT_OP", "VAR", "LINECOMMENT",
  "FILECOMMENT", "DOT", "CONCAT", "'='", "'['", "']'", "'('", "')'", "'!'",
  "'~'", "'-'", "'+'", "'*'", "'/'", "'%'", "'&'", "'|'", "';'", "$accept",
  "program", "compilation_units", "compilation_unit", "pragma", "pragma_1",
  "hll_def", "constdef", "@1", "pmc_const", "@2", "any_string", "pasmcode",
  "pasmline", "pasm_inst", "@3", "@4", "pasm_args", "emit", "@5",
  "opt_pasmcode", "class_namespace", "maybe_ns", "sub", "@6", "@7", "@8",
  "sub_params", "sub_param", "@9", "sub_param_type_def", "opt_comma",
  "multi", "outer", "vtable", "multi_types", "multi_type", "sub_body",
  "pcc_sub_call", "@10", "opt_label", "opt_invocant", "sub_proto",
  "sub_proto_list", "proto", "pcc_call", "pcc_args", "pcc_arg",
  "pcc_results", "pcc_result", "@11", "paramtype_list", "paramtype",
  "pcc_ret", "@12", "pcc_yield", "@13", "pcc_returns", "pcc_return",
  "pcc_return_many", "@14", "return_or_yield", "var_returns", "statements",
  "helper_clear_state", "statement", "labels", "_labels", "label",
  "instruction", "id_list", "id_list_id", "labeled_inst", "@15", "@16",
  "@17", "type", "classname", "assignment", "@18", "un_op", "bin_op",
  "get_results", "@19", "op_assign", "assign_op", "func_assign", "the_sub",
  "sub_call", "@20", "arglist", "arg", "argtype_list", "argtype", "result",
  "targetlist", "conditional_statement", "unless_statement",
  "if_statement", "comma_or_goto", "relop", "target", "vars", "_vars",
  "_var_or_i", "sub_label_op_c", "sub_label_op", "label_op", "var_or_i",
  "var", "keylist", "@21", "keylist_force", "@22", "_keylist", "@23",
  "key", "reg", "const", "string", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
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
      91,    93,    40,    41,    33,   126,    45,    43,    42,    47,
      37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   134,   135,   136,   136,   137,   137,   137,   137,   137,
     137,   137,   138,   138,   138,   139,   140,   140,   142,   141,
     144,   143,   145,   145,   146,   146,   147,   147,   147,   147,
     147,   147,   147,   149,   148,   150,   148,   148,   148,   148,
     151,   153,   152,   154,   154,   155,   156,   156,   158,   159,
     160,   157,   161,   161,   161,   163,   162,   164,   164,   165,
     165,   166,   167,   167,   168,   168,   169,   169,   169,   170,
     170,   170,   170,   170,   170,   170,   171,   171,   173,   172,
     174,   174,   175,   175,   176,   176,   177,   177,   178,   178,
     178,   178,   178,   178,   178,   178,   178,   178,   178,   179,
     179,   179,   179,   179,   179,   179,   180,   180,   181,   182,
     182,   183,   184,   183,   185,   185,   186,   186,   186,   186,
     186,   186,   188,   187,   187,   190,   189,   191,   191,   191,
     192,   194,   193,   195,   195,   196,   196,   196,   196,   196,
     197,   197,   198,   199,   199,   199,   199,   200,   200,   201,
     201,   202,   203,   203,   204,   204,   205,   205,   206,   206,
     206,   206,   207,   206,   206,   208,   206,   206,   209,   206,
     206,   206,   206,   206,   206,   206,   206,   206,   206,   210,
     210,   210,   210,   210,   211,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   213,   212,   212,   212,   212,   212,
     214,   214,   214,   215,   215,   215,   215,   215,   215,   215,
     215,   215,   215,   215,   215,   215,   215,   215,   215,   215,
     215,   215,   215,   215,   215,   215,   217,   216,   218,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,   219,   220,   221,   221,   221,   221,   221,   221,   221,
     223,   222,   224,   224,   224,   224,   224,   225,   226,   226,
     227,   227,   227,   228,   229,   229,   229,   229,   229,   230,
     230,   231,   231,   231,   232,   232,   232,   233,   233,   234,
     234,   234,   234,   234,   234,   235,   235,   236,   236,   237,
     237,   238,   238,   238,   239,   239,   239,   240,   240,   241,
     241,   242,   242,   243,   243,   245,   244,   247,   246,   248,
     248,   249,   248,   250,   250,   250,   250,   251,   251,   251,
     251,   251,   252,   252,   252,   252,   253,   253
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     2,
       1,     1,     3,     2,     3,     2,     4,     4,     0,     6,
       0,     6,     1,     1,     1,     2,     3,     2,     1,     1,
       1,     1,     1,     0,     3,     0,     4,     2,     4,     0,
       1,     0,     4,     0,     1,     3,     3,     0,     0,     0,
       0,    10,     0,     1,     3,     0,     3,     3,     5,     0,
       1,     4,     4,     4,     1,     4,     0,     3,     1,     1,
       1,     1,     1,     1,     1,     3,     0,     1,     0,     9,
       0,     2,     0,     3,     0,     1,     1,     3,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     5,
       3,     3,     3,     3,     5,     5,     0,     3,     2,     0,
       3,     3,     0,     4,     0,     2,     1,     1,     1,     1,
       4,     1,     0,     5,     1,     0,     5,     0,     2,     3,
       3,     0,     5,     1,     1,     0,     1,     3,     3,     5,
       1,     2,     0,     2,     2,     1,     1,     0,     1,     2,
       1,     1,     3,     2,     1,     3,     2,     1,     1,     1,
       2,     2,     0,     4,     4,     0,     6,     1,     0,     6,
       2,     2,     2,     2,     1,     1,     1,     1,     0,     1,
       1,     1,     1,     1,     1,     3,     4,     5,     6,     6,
       6,     7,     4,     4,     6,     6,     7,     4,     4,     4,
       4,     6,     7,     3,     0,     9,     1,     1,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     0,     5,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     4,     1,     1,     1,     1,     3,     3,     3,
       0,     5,     0,     3,     1,     5,     3,     2,     0,     2,
       1,     1,     4,     2,     3,     5,     1,     3,     0,     1,
       1,     6,     5,     4,     4,     6,     5,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     0,     1,     3,
       1,     1,     4,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     0,     2,     0,     2,     1,
       3,     0,     4,     1,     3,     2,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    11,     0,     0,     0,    47,    48,    18,     0,    41,
       0,     0,     2,     3,    10,     0,     6,     8,     5,     7,
       0,     0,     0,     0,   315,     0,     0,     0,     0,   147,
       9,     1,     4,    13,    15,    12,     0,     0,     0,     0,
      45,   307,   305,   306,   308,    49,   304,   179,   180,   181,
     182,   184,     0,   183,    14,    20,   151,     0,    29,    28,
      32,    31,   147,    24,     0,    30,    33,   148,   150,    16,
      17,    46,     0,   327,   328,   329,   330,   331,   334,   332,
     333,   335,   295,   313,   323,   316,   319,   296,   314,    84,
       0,     0,    27,    25,    42,     0,     0,    35,     0,     0,
     149,   325,   326,   321,     0,    90,    88,    89,    91,    92,
      94,    93,     0,    95,     0,    64,    96,    97,    98,     0,
      59,    86,     0,     0,    37,     0,    84,    26,   297,   324,
       0,   320,     0,    66,     0,    50,    60,     0,    19,   309,
     310,   311,     0,   312,     0,     0,   317,    34,   313,    40,
     298,   300,   301,   322,     0,     0,    69,    70,    72,    71,
      73,    74,   315,     0,    68,     0,    52,    87,     0,    38,
      36,     0,     0,   315,     0,    63,    62,     0,     0,    61,
      65,    53,   142,    22,    23,    21,   303,   318,     0,   299,
      75,    67,    55,     0,   146,   145,     0,     0,   142,     0,
     140,   302,     0,   144,    54,    51,   141,     0,   178,   143,
      56,     0,   153,     0,     0,     0,     0,     0,     0,     0,
     162,     0,   165,   168,     0,   133,   134,   236,     0,     0,
       0,   253,   254,   255,   297,   204,   167,   175,   176,   177,
     124,     0,     0,   158,   206,   207,   208,   260,   174,   159,
     280,   279,   256,   114,     0,   171,     0,     0,     0,     0,
     173,     0,   160,   161,     0,     0,     0,     0,   336,   337,
       0,   170,   256,     0,    78,   122,   125,   172,   278,   131,
     152,     0,   239,   240,   241,   242,   245,   246,   247,   248,
     244,   243,   249,   250,   251,     0,     0,   315,     0,    57,
       0,     0,   288,   289,   290,   291,   292,   293,   294,   287,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   278,   106,   127,   127,     0,   276,     0,   114,   135,
     262,   258,   259,   257,   209,     0,     0,     0,   334,   335,
     297,   210,   211,   212,     0,   203,   313,   185,     0,   238,
     116,   117,   118,   119,   121,   115,   114,     0,   284,     0,
       0,   283,     0,   200,   157,   163,   154,   164,     0,     0,
     199,     0,    82,     0,     0,     0,     0,     0,   273,   334,
       0,   136,   268,   334,     0,   264,   315,   192,   193,   198,
     197,   252,   186,   218,   227,   228,   232,   221,   222,   223,
     224,   225,   226,   219,   229,   230,   231,   220,   315,   235,
     213,   214,   215,   216,   217,   233,   234,     0,     0,     0,
      58,   286,     0,   282,     0,     0,   315,   156,     0,     0,
       0,   237,     0,     0,     0,     0,   128,     0,   123,     0,
     126,   277,     0,   274,     0,     0,     0,   132,   267,     0,
       0,   261,     0,     0,   315,     0,   315,     0,   187,     0,
       0,   285,   281,   201,     0,   155,   166,   169,   108,     0,
       0,     0,     0,    80,   107,   268,   129,     0,     0,   137,
     334,   138,   270,   271,   269,   266,   334,   263,   194,   190,
       0,   195,     0,   188,   189,   120,   202,    83,     0,     0,
       0,     0,   109,     0,   130,   275,   262,     0,     0,     0,
     191,   196,   100,     0,   101,   103,     0,   102,     0,     0,
      81,     0,   139,     0,   265,     0,     0,     0,   112,     0,
      79,     0,   205,   272,    99,   105,   104,     0,   114,   110,
       0,   111,   113
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    11,    12,    13,    14,    21,    15,    16,    27,    61,
      91,   185,    62,    63,    98,    99,   126,   147,    17,    29,
      64,    18,    25,    19,    26,    89,   166,   182,   196,   202,
     210,   137,   116,   117,   118,   163,   164,   197,   237,   322,
     502,   434,   119,   120,   121,   473,   372,   435,   519,   531,
     537,   299,   355,   238,   323,   239,   324,   373,   439,   240,
     329,   241,   380,   198,   199,   200,    66,    67,    68,   209,
     365,   366,   242,   264,   266,   267,    52,    53,   243,   278,
     344,   417,   244,   273,   245,   298,   246,   247,   248,   281,
     384,   385,   448,   484,   326,   327,   249,   250,   251,   310,
     311,    83,   149,   150,   151,    45,    46,   141,   152,   382,
      38,    39,   171,   172,    85,   130,    86,    87,    88,   270
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -420
static const yytype_int16 yypact[] =
{
      12,  -420,    55,   -90,   -34,   -42,  -420,  -420,     8,  -420,
     112,   118,    12,  -420,  -420,   135,  -420,  -420,  -420,  -420,
      32,   146,    86,    87,  -420,   164,    96,    -4,   165,   158,
    -420,  -420,  -420,  -420,  -420,  -420,    63,    64,    57,   440,
    -420,  -420,  -420,  -420,  -420,  -420,  -420,  -420,  -420,  -420,
    -420,  -420,    83,  -420,  -420,  -420,  -420,   185,  -420,  -420,
    -420,  -420,   319,  -420,    91,  -420,    10,    95,  -420,  -420,
    -420,  -420,   525,  -420,  -420,  -420,  -420,  -420,  -420,  -420,
    -420,  -420,  -420,  -420,   127,   -60,  -420,  -420,  -420,   648,
      84,    92,  -420,  -420,  -420,   525,   101,  -420,   200,    93,
    -420,  -420,   525,  -420,   440,  -420,  -420,  -420,  -420,  -420,
    -420,  -420,    90,  -420,   105,   107,  -420,  -420,  -420,   236,
       6,  -420,    74,   511,  -420,   170,   648,  -420,   454,  -420,
     440,  -420,    22,    20,   134,  -420,  -420,   648,  -420,  -420,
    -420,  -420,   125,  -420,   142,   151,  -420,  -420,   140,  -420,
     182,  -420,  -420,  -420,   138,   139,  -420,  -420,  -420,  -420,
    -420,  -420,  -420,   -28,  -420,   141,   259,  -420,   -55,  -420,
    -420,   145,   440,  -420,   454,  -420,  -420,   147,    20,  -420,
    -420,  -420,     7,  -420,  -420,  -420,  -420,   -60,   148,  -420,
    -420,  -420,  -420,   263,  -420,  -420,   267,   211,    66,   133,
    -420,  -420,    -4,  -420,  -420,  -420,  -420,   280,   347,  -420,
    -420,    39,  -420,   -63,   176,   212,   525,   252,   184,   186,
    -420,   183,   187,  -420,   -50,   595,  -420,  -420,   289,   290,
     291,  -420,  -420,  -420,   454,  -420,  -420,  -420,  -420,  -420,
    -420,   177,   298,  -420,  -420,  -420,  -420,  -420,  -420,  -420,
    -420,  -420,   491,  -420,   283,  -420,   525,   326,   525,   326,
    -420,   233,  -420,  -420,    -4,   235,    -4,    -4,  -420,  -420,
     188,  -420,   191,   195,  -420,  -420,  -420,  -420,   229,  -420,
    -420,   198,  -420,  -420,  -420,  -420,  -420,  -420,  -420,  -420,
    -420,  -420,  -420,  -420,  -420,   119,   379,  -420,   525,     9,
     204,   300,  -420,  -420,  -420,  -420,  -420,  -420,  -420,  -420,
     -63,   525,   324,   -63,   525,   525,   224,   252,   234,   237,
     525,   229,  -420,  -420,  -420,   320,  -420,   -20,  -420,   539,
     553,  -420,  -420,  -420,  -420,   485,   -50,   239,   223,   227,
     454,  -420,  -420,  -420,   525,  -420,   -82,   453,   225,  -420,
    -420,  -420,  -420,   228,  -420,  -420,  -420,   -63,  -420,   341,
     -63,  -420,   352,   -32,   266,   293,  -420,  -420,   246,   248,
    -420,   -16,     2,    11,    18,   252,   609,   253,     9,   351,
     -11,  -420,  -420,   353,   -10,  -420,  -420,   -27,    59,  -420,
    -420,  -420,  -420,  -420,  -420,  -420,  -420,  -420,  -420,  -420,
    -420,  -420,  -420,  -420,  -420,  -420,  -420,  -420,  -420,  -420,
    -420,  -420,  -420,  -420,  -420,  -420,  -420,   525,   258,   278,
       9,  -420,   -63,  -420,   -63,   525,  -420,  -420,   224,    74,
      74,  -420,   525,   525,    -2,   384,  -420,   525,  -420,   385,
    -420,  -420,   370,  -420,   595,   525,   567,  -420,   117,   525,
     581,  -420,   270,   525,  -420,   525,  -420,   271,  -420,   525,
     272,  -420,  -420,  -420,   275,  -420,  -420,  -420,  -420,   395,
     525,   525,   618,    95,  -420,  -420,  -420,   252,   279,  -420,
     382,  -420,  -420,   281,  -420,  -420,   389,  -420,  -420,  -420,
     284,  -420,   297,  -420,  -420,  -420,  -420,  -420,    25,   418,
      26,    27,  -420,   419,   117,  -420,   553,   525,   315,   525,
    -420,  -420,  -420,   525,  -420,  -420,   525,  -420,   525,    88,
    -420,    -3,  -420,   305,  -420,   425,   426,   429,  -420,   252,
    -420,   432,  -420,  -420,  -420,  -420,  -420,    -4,  -420,  -420,
     224,     9,  -420
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -420,  -420,  -420,   427,    23,  -420,  -420,  -420,  -420,   230,
    -420,  -420,  -420,   375,  -420,  -420,  -420,   102,  -420,  -420,
    -420,    97,  -420,  -420,  -420,  -420,  -420,  -420,  -420,  -420,
    -420,  -420,  -420,  -420,  -420,  -420,   265,  -420,  -420,  -420,
    -420,  -420,   318,  -420,   308,  -420,  -420,  -420,  -420,  -420,
    -420,  -320,  -420,  -420,  -420,  -420,  -420,   122,  -420,  -420,
    -420,  -420,  -420,  -420,  -420,   249,   255,  -420,   -66,  -420,
    -420,  -419,  -420,  -420,  -420,  -420,  -200,   120,  -420,  -420,
    -420,  -420,  -420,  -420,  -420,  -420,  -420,    13,  -202,  -420,
     -48,  -322,   -13,  -420,    89,   143,  -420,  -420,  -420,   207,
     208,  -125,   238,  -420,   299,  -420,   168,  -208,   348,   -39,
    -156,  -420,  -420,  -420,   303,  -420,   -72,  -420,  -118,   150
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -257
static const yytype_int16 yytable[] =
{
      84,   100,   211,   148,   138,   255,   177,   381,   378,   465,
     -85,   103,   192,   432,   -39,   436,     1,   188,     2,    22,
       3,     4,   436,   271,    95,   350,   351,   352,   353,   512,
     515,   517,   131,   101,     5,   295,   420,     6,    96,   425,
    -256,     7,   139,   178,   453,    47,    48,    49,    50,   148,
     140,   376,    60,   268,   183,   376,   124,   184,   153,   269,
     446,   450,    20,   129,   316,    84,   318,   319,   450,   156,
     157,   158,   159,   104,   470,   437,    23,   136,    24,   -76,
     471,   472,   437,   252,   143,    60,   433,    97,   426,   143,
     438,    84,   261,   454,   345,   179,   513,   516,   518,   440,
     272,    51,   358,   377,   -85,   361,   354,   431,     8,   148,
     468,     9,   447,   451,   193,   528,    30,    28,    31,    10,
     532,   542,   194,   195,   481,   160,    65,   154,   487,   161,
     455,   155,   482,    84,   207,   143,   483,  -147,   -77,    33,
     162,   348,    34,  -147,   253,  -147,  -147,  -147,   254,   421,
      35,   529,   423,   328,  -147,  -147,  -147,    36,    37,    65,
    -147,  -147,  -147,   530,     2,  -147,     3,     4,    40,    54,
     332,   346,    69,   193,    70,   257,   259,   260,    71,   456,
       5,   194,   195,    78,    79,    80,    81,    55,    90,    92,
     256,    94,   367,    56,  -147,   143,   328,  -147,  -147,  -147,
     102,    41,   123,   122,   127,    42,   128,  -147,    43,    44,
     125,  -147,   132,  -147,   461,   148,   462,   301,   541,   312,
      73,    74,    75,    76,    41,    77,   258,   133,   331,   134,
     452,    56,    44,    82,  -147,  -147,  -147,  -147,  -147,  -147,
     135,   144,  -147,   165,   168,  -147,  -147,  -147,   169,   170,
     441,   328,   457,   174,     8,  -147,    56,   347,   -43,   349,
     173,   175,   176,   181,   180,    57,   186,   203,   190,   201,
     464,   204,   359,    58,    59,   362,   363,    73,    74,    75,
      76,   370,    77,   205,   212,    78,    79,    80,    81,   262,
      82,   263,   265,   274,   275,   276,   388,   -20,   490,   279,
     492,   143,   280,   300,   315,   392,   317,   320,   295,   356,
     357,   466,   467,    73,    74,    75,    76,   321,    77,   272,
     330,    78,    79,    80,    81,     2,    82,     3,     4,   364,
      73,    74,    75,    76,   360,    77,   302,   540,   325,   368,
     375,     5,   369,    82,   390,  -254,   418,   501,    55,  -255,
     419,   422,   505,    73,    74,    75,    76,   213,    77,   214,
     215,   216,   424,   427,   428,   429,    82,   430,   217,   218,
     219,   445,   444,   449,   220,   221,   222,   459,   458,   223,
     303,   304,   305,   306,   307,   308,   463,   460,   474,   476,
     477,   488,   493,   334,   469,   495,   496,   309,   475,   497,
     335,   506,   507,   508,   538,   510,   479,   503,   224,   509,
     485,   225,   226,   227,   489,     8,   491,    56,   511,   -44,
     494,   228,   514,   520,   523,   229,    57,   230,   533,   534,
     535,   498,   499,   536,    58,    59,   539,    93,   236,    32,
     336,   337,   391,   191,   145,   167,   374,   206,    73,    74,
      75,    76,   231,    77,   208,   387,   232,   478,   521,   233,
     234,    82,   504,   333,   371,   443,   313,   314,   522,   235,
     524,   142,   277,   189,   525,   187,     0,   526,     0,   527,
      73,    74,    75,    76,   231,    77,   389,     0,   338,    79,
      80,   339,   340,    82,   393,     0,     0,     0,     0,     0,
     394,   395,     0,   341,   342,   343,   396,   397,   398,   399,
     400,   401,   402,    72,     0,     0,     0,     0,     0,     0,
     403,   404,   405,   406,   282,   283,   284,   285,   286,   287,
     288,   289,     0,   290,   291,   292,   293,   294,     0,     0,
       0,    73,    74,    75,    76,     0,    77,     0,     0,    78,
      79,    80,    81,     0,    82,    73,    74,    75,    76,   139,
      77,     0,     0,    78,    79,    80,    81,   140,    82,     0,
       0,   407,     0,   408,   146,     0,     0,     0,   409,   410,
     411,   412,   413,   414,   415,   416,    73,    74,    75,    76,
      51,    77,     0,     0,    78,    79,    80,    81,     0,    82,
       0,     0,     0,     0,     0,   386,     0,     0,   295,     0,
     296,   297,    73,    74,    75,    76,   139,    77,     0,     0,
      78,    79,    80,    81,   140,    82,    73,    74,    75,    76,
       0,    77,     0,     0,    78,    79,    80,    81,     0,    82,
      73,    74,    75,    76,     0,    77,     0,     0,   379,    79,
      80,    81,     0,    82,    73,    74,    75,    76,     0,    77,
       0,     0,   383,    79,    80,    81,     0,    82,    73,    74,
      75,    76,     0,    77,     0,     0,   480,    79,    80,    81,
       0,    82,    73,    74,    75,    76,     0,    77,     0,     0,
     486,    79,    80,    81,     0,    82,    73,    74,    75,    76,
     231,    77,     0,     0,   232,     0,     0,   233,     0,    82,
      73,    74,    75,    76,     0,    77,     0,     0,   442,    73,
      74,    75,    76,    82,    77,     0,     0,   500,     0,     0,
       0,     0,    82,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115
};

static const yytype_int16 yycheck[] =
{
      39,    67,   202,   128,   122,   213,   162,   329,   328,   428,
       4,    71,     5,    11,     4,     4,     4,   173,     6,   109,
       8,     9,     4,   225,    14,    16,    17,    18,    19,     4,
       4,     4,   104,    72,    22,   117,   356,    25,    28,    71,
     122,    29,   105,    71,    71,    49,    50,    51,    52,   174,
     113,    71,    29,   103,   109,    71,    95,   112,   130,   109,
      71,    71,     7,   102,   264,   104,   266,   267,    71,    49,
      50,    51,    52,   133,    76,    64,   110,    71,   120,    72,
      82,    83,    64,   208,   123,    62,    84,    77,   120,   128,
      79,   130,   217,   120,   296,   123,    71,    71,    71,    81,
     225,   105,   310,   123,    98,   313,    97,   123,    96,   234,
     432,    99,   123,   123,   107,    27,     4,   109,     0,   107,
     123,   540,   115,   116,   446,   105,    29,   105,   450,   109,
      71,   109,    15,   172,     1,   174,    19,     4,    72,     4,
     120,   297,   110,    10,   105,    12,    13,    14,   109,   357,
       4,    63,   360,   278,    21,    22,    23,    71,    71,    62,
      27,    28,    29,    75,     6,    32,     8,     9,     4,     4,
     295,   296,   109,   107,   110,   214,   215,   216,   121,   120,
      22,   115,   116,   109,   110,   111,   112,    29,   105,     4,
      14,   100,   317,    98,    61,   234,   321,    64,    65,    66,
      73,   105,   110,   119,     4,   109,   113,    74,   112,   113,
     109,    78,   122,    80,   422,   340,   424,   256,   538,   258,
     101,   102,   103,   104,   105,   106,    14,   122,   109,   122,
     386,    98,   113,   114,   101,   102,   103,   104,   105,   106,
       4,    71,   109,   109,   119,   112,   113,   114,   106,    98,
     375,   376,   408,    71,    96,   122,    98,   296,   100,   298,
     120,   123,   123,     4,   123,   107,   121,     4,   121,   121,
     426,     4,   311,   115,   116,   314,   315,   101,   102,   103,
     104,   320,   106,    72,     4,   109,   110,   111,   112,   105,
     114,   105,   109,     4,     4,     4,   335,   110,   454,   122,
     456,   340,     4,    20,    71,   344,    71,   119,   117,   105,
      10,   429,   430,   101,   102,   103,   104,   122,   106,   444,
     122,   109,   110,   111,   112,     6,   114,     8,     9,   105,
     101,   102,   103,   104,    10,   106,    10,   537,   109,   105,
      20,    22,   105,   114,   105,   122,   121,   472,    29,   122,
     122,    10,   477,   101,   102,   103,   104,    10,   106,    12,
      13,    14,    10,    97,    71,   119,   114,   119,    21,    22,
      23,    20,   119,    20,    27,    28,    29,   119,   417,    32,
      54,    55,    56,    57,    58,    59,   425,   109,     4,     4,
      20,   121,   121,    14,   433,   123,   121,    71,   437,     4,
      21,   122,    20,   122,   529,   121,   445,   473,    61,    20,
     449,    64,    65,    66,   453,    96,   455,    98,   121,   100,
     459,    74,     4,     4,   109,    78,   107,    80,   123,     4,
       4,   470,   471,     4,   115,   116,     4,    62,   208,    12,
      61,    62,   340,   178,   126,   137,   324,   198,   101,   102,
     103,   104,   105,   106,   199,   335,   109,   444,   506,   112,
     113,   114,   475,   295,   321,   376,   259,   259,   507,   122,
     509,   123,   234,   174,   513,   172,    -1,   516,    -1,   518,
     101,   102,   103,   104,   105,   106,   336,    -1,   109,   110,
     111,   112,   113,   114,    41,    -1,    -1,    -1,    -1,    -1,
      47,    48,    -1,   124,   125,   126,    53,    54,    55,    56,
      57,    58,    59,    73,    -1,    -1,    -1,    -1,    -1,    -1,
      67,    68,    69,    70,    33,    34,    35,    36,    37,    38,
      39,    40,    -1,    42,    43,    44,    45,    46,    -1,    -1,
      -1,   101,   102,   103,   104,    -1,   106,    -1,    -1,   109,
     110,   111,   112,    -1,   114,   101,   102,   103,   104,   105,
     106,    -1,    -1,   109,   110,   111,   112,   113,   114,    -1,
      -1,   118,    -1,   120,   120,    -1,    -1,    -1,   125,   126,
     127,   128,   129,   130,   131,   132,   101,   102,   103,   104,
     105,   106,    -1,    -1,   109,   110,   111,   112,    -1,   114,
      -1,    -1,    -1,    -1,    -1,   120,    -1,    -1,   117,    -1,
     119,   120,   101,   102,   103,   104,   105,   106,    -1,    -1,
     109,   110,   111,   112,   113,   114,   101,   102,   103,   104,
      -1,   106,    -1,    -1,   109,   110,   111,   112,    -1,   114,
     101,   102,   103,   104,    -1,   106,    -1,    -1,   109,   110,
     111,   112,    -1,   114,   101,   102,   103,   104,    -1,   106,
      -1,    -1,   109,   110,   111,   112,    -1,   114,   101,   102,
     103,   104,    -1,   106,    -1,    -1,   109,   110,   111,   112,
      -1,   114,   101,   102,   103,   104,    -1,   106,    -1,    -1,
     109,   110,   111,   112,    -1,   114,   101,   102,   103,   104,
     105,   106,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,
     101,   102,   103,   104,    -1,   106,    -1,    -1,   109,   101,
     102,   103,   104,   114,   106,    -1,    -1,   109,    -1,    -1,
      -1,    -1,   114,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    95
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,     6,     8,     9,    22,    25,    29,    96,    99,
     107,   135,   136,   137,   138,   140,   141,   152,   155,   157,
       7,   139,   109,   110,   120,   156,   158,   142,   109,   153,
       4,     0,   137,     4,   110,     4,    71,    71,   244,   245,
       4,   105,   109,   112,   113,   239,   240,    49,    50,    51,
      52,   105,   210,   211,     4,    29,    98,   107,   115,   116,
     138,   143,   146,   147,   154,   155,   200,   201,   202,   109,
     110,   121,    73,   101,   102,   103,   104,   106,   109,   110,
     111,   112,   114,   235,   243,   248,   250,   251,   252,   159,
     105,   144,     4,   147,   100,    14,    28,    77,   148,   149,
     202,   243,    73,    71,   133,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,   166,   167,   168,   176,
     177,   178,   119,   110,   243,   109,   150,     4,   113,   243,
     249,   250,   122,   122,   122,     4,    71,   165,   252,   105,
     113,   241,   242,   243,    71,   176,   120,   151,   235,   236,
     237,   238,   242,   250,   105,   109,    49,    50,    51,    52,
     105,   109,   120,   169,   170,   109,   160,   178,   119,   106,
      98,   246,   247,   120,    71,   123,   123,   244,    71,   123,
     123,     4,   161,   109,   112,   145,   121,   248,   244,   238,
     121,   170,     5,   107,   115,   116,   162,   171,   197,   198,
     199,   121,   163,     4,     4,    72,   199,     1,   200,   203,
     164,   210,     4,    10,    12,    13,    14,    21,    22,    23,
      27,    28,    29,    32,    61,    64,    65,    66,    74,    78,
      80,   105,   109,   112,   113,   122,   143,   172,   187,   189,
     193,   195,   206,   212,   216,   218,   220,   221,   222,   230,
     231,   232,   235,   105,   109,   241,    14,   243,    14,   243,
     243,   235,   105,   105,   207,   109,   208,   209,   103,   109,
     253,   222,   235,   217,     4,     4,     4,   236,   213,   122,
       4,   223,    33,    34,    35,    36,    37,    38,    39,    40,
      42,    43,    44,    45,    46,   117,   119,   120,   219,   185,
      20,   243,    10,    54,    55,    56,    57,    58,    59,    71,
     233,   234,   243,   233,   234,    71,   210,    71,   210,   210,
     119,   122,   173,   188,   190,   109,   228,   229,   235,   194,
     122,   109,   235,   240,    14,    21,    61,    62,   109,   112,
     113,   124,   125,   126,   214,   222,   235,   243,   244,   243,
      16,    17,    18,    19,    97,   186,   105,    10,   241,   243,
      10,   241,   243,   243,   105,   204,   205,   235,   105,   105,
     243,   229,   180,   191,   191,    20,    71,   123,   185,   109,
     196,   225,   243,   109,   224,   225,   120,   211,   243,   253,
     105,   151,   243,    41,    47,    48,    53,    54,    55,    56,
      57,    58,    59,    67,    68,    69,    70,   118,   120,   125,
     126,   127,   128,   129,   130,   131,   132,   215,   121,   122,
     185,   241,    10,   241,    10,    71,   120,    97,    71,   119,
     119,   123,    11,    84,   175,   181,     4,    64,    79,   192,
      81,   235,   109,   228,   119,    20,    71,   123,   226,    20,
      71,   123,   244,    71,   120,    71,   120,   244,   243,   119,
     109,   241,   241,   243,   244,   205,   252,   252,   225,   243,
      76,    82,    83,   179,     4,   243,     4,    20,   221,   243,
     109,   225,    15,    19,   227,   243,   109,   225,   121,   243,
     244,   243,   244,   121,   243,   123,   121,     4,   243,   243,
     109,   235,   174,   202,   226,   235,   122,    20,   122,    20,
     121,   121,     4,    71,     4,     4,    71,     4,    71,   182,
       4,   224,   243,   109,   243,   243,   243,   243,    27,    63,
      75,   183,   123,   123,     4,     4,     4,   184,   235,     4,
     210,   185,   205
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
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (yyscanner, interp, YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
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
    while (YYID (0))
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
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value, yyscanner, interp); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, void *yyscanner, Parrot_Interp interp)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, yyscanner, interp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    void *yyscanner;
    Parrot_Interp interp;
#endif
{
  if (!yyvaluep)
    return;
  YYUSE (yyscanner);
  YYUSE (interp);
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, void *yyscanner, Parrot_Interp interp)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, yyscanner, interp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    void *yyscanner;
    Parrot_Interp interp;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep, yyscanner, interp);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule, void *yyscanner, Parrot_Interp interp)
#else
static void
yy_reduce_print (yyvsp, yyrule, yyscanner, interp)
    YYSTYPE *yyvsp;
    int yyrule;
    void *yyscanner;
    Parrot_Interp interp;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       , yyscanner, interp);
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule, yyscanner, interp); \
} while (YYID (0))

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
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
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
      YYSIZE_T yyn = 0;
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

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
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
      int yychecklim = YYLAST - yyn + 1;
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
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
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
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, void *yyscanner, Parrot_Interp interp)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, yyscanner, interp)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    void *yyscanner;
    Parrot_Interp interp;
#endif
{
  YYUSE (yyvaluep);
  YYUSE (yyscanner);
  YYUSE (interp);

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
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void *yyscanner, Parrot_Interp interp);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */






/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *yyscanner, Parrot_Interp interp)
#else
int
yyparse (yyscanner, interp)
    void *yyscanner;
    Parrot_Interp interp;
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
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

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
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


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
	yytype_int16 *yyss1 = yyss;
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

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

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

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

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
#line 608 "compilers/imcc/imcc.y"
    { if (yynerrs) YYABORT; (yyval.i) = 0; ;}
    break;

  case 5:
#line 617 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 6:
#line 618 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 7:
#line 619 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i);
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                     IMCC_INFO(interp)->cur_unit = 0; ;}
    break;

  case 8:
#line 622 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i);
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                     IMCC_INFO(interp)->cur_unit = 0; ;}
    break;

  case 9:
#line 625 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 10:
#line 626 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 11:
#line 627 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 12:
#line 630 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 13:
#line 631 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 14:
#line 632 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; do_loadlib(interp, (yyvsp[(2) - (3)].s)); ;}
    break;

  case 15:
#line 636 "compilers/imcc/imcc.y"
    { if ((yyvsp[(2) - (2)].s))
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    ;}
    break;

  case 16:
#line 644 "compilers/imcc/imcc.y"
    {
            STRING *hll_name = string_unescape_cstring(interp, (yyvsp[(2) - (4)].s) + 1, '"', NULL);
            STRING *hll_lib  = string_unescape_cstring(interp, (yyvsp[(4) - (4)].s) + 1, '"', NULL);
            PMC    *ignored;
            CONTEXT(((Interp*)interp)->ctx)->current_HLL =
                Parrot_register_HLL(interp, hll_name);
            ignored = Parrot_load_lib(interp, hll_lib, NULL);
            UNUSED(ignored);
            Parrot_register_HLL_lib(interp, hll_lib);
            IMCC_INFO(interp)->cur_namespace = NULL;
            (yyval.t) = 0;
         ;}
    break;

  case 17:
#line 657 "compilers/imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                CONTEXT(((Interp*)interp)->ctx)->current_HLL, atoi((yyvsp[(2) - (4)].s)), atoi((yyvsp[(4) - (4)].s)));
             (yyval.t) = 0;
         ;}
    break;

  case 18:
#line 665 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 19:
#line 666 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1); is_def=0; ;}
    break;

  case 20:
#line 670 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 21:
#line 671 "compilers/imcc/imcc.y"
    { (yyval.i) = mk_pmc_const(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].s)); is_def=0; ;}
    break;

  case 26:
#line 684 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 27:
#line 685 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 28:
#line 686 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 29:
#line 687 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 30:
#line 688 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 33:
#line 693 "compilers/imcc/imcc.y"
    { clear_state(interp); ;}
    break;

  case 34:
#line 695 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit,
                              (yyvsp[(2) - (3)].s), 0, IMCC_INFO(interp)->regs,
                              IMCC_INFO(interp)->nargs, IMCC_INFO(interp) -> keyvec, 1);
                     free((yyvsp[(2) - (3)].s)); ;}
    break;

  case 35:
#line 700 "compilers/imcc/imcc.y"
    {
                    imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                    IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM);
                    ;}
    break;

  case 36:
#line 705 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit,
                                mk_sub_label(interp, (yyvsp[(4) - (4)].s)));
                     IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(3) - (4)].t);
                   ;}
    break;

  case 37:
#line 711 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(2) - (2)].sr)); ;}
    break;

  case 38:
#line 713 "compilers/imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, (yyvsp[(4) - (4)].s));
                       set_lexical(interp, r, (yyvsp[(2) - (4)].s)); (yyval.i) = 0;
                   ;}
    break;

  case 39:
#line 717 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;;}
    break;

  case 41:
#line 725 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM); ;}
    break;

  case 42:
#line 727 "compilers/imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     (yyval.i)=0; ;}
    break;

  case 45:
#line 742 "compilers/imcc/imcc.y"
    {
                    int re_open = 0;
                    (yyval.i) = 0;
                    if (IMCC_INFO(interp)->state->pasm_file && IMCC_INFO(interp)->cur_namespace) {
                        imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                        re_open = 1;
                    }
                    IMCC_INFO(interp)->cur_namespace = (yyvsp[(2) - (3)].sr);
                    if (re_open)
                        IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM);
                ;}
    break;

  case 46:
#line 756 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); ;}
    break;

  case 47:
#line 757 "compilers/imcc/imcc.y"
    { (yyval.sr) = NULL; ;}
    break;

  case 48:
#line 762 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        ;}
    break;

  case 49:
#line 766 "compilers/imcc/imcc.y"
    {
          iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (3)].sr));
        ;}
    break;

  case 50:
#line 769 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(5) - (6)].t); ;}
    break;

  case 51:
#line 771 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 52:
#line 775 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 53:
#line 776 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 54:
#line 777 "compilers/imcc/imcc.y"
    {
       if (IMCC_INFO(interp)->adv_named_id) {
             add_pcc_named_param(interp,IMCC_INFO(interp)->cur_call,
                                 IMCC_INFO(interp)->adv_named_id,(yyvsp[(2) - (3)].sr));
             IMCC_INFO(interp)->adv_named_id = NULL;
         }
         else add_pcc_param(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
   ;}
    break;

  case 55:
#line 788 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 56:
#line 788 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(3) - (3)].sr); is_def=0; ;}
    break;

  case 57:
#line 792 "compilers/imcc/imcc.y"
    { if ((yyvsp[(3) - (3)].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
                                         (yyval.sr)->type |= (yyvsp[(3) - (3)].t); ;}
    break;

  case 58:
#line 797 "compilers/imcc/imcc.y"
    {
                                         if ((yyvsp[(5) - (5)].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[(4) - (5)].s), (yyvsp[(1) - (5)].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[(4) - (5)].s), (yyvsp[(1) - (5)].t));
                                         (yyval.sr)->type |= (yyvsp[(5) - (5)].t);
                                         adv_named_set(interp,(yyvsp[(2) - (5)].s));;}
    break;

  case 59:
#line 807 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  ;}
    break;

  case 61:
#line 812 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 62:
#line 816 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; IMCC_INFO(interp)->cur_unit->outer =
                     mk_sub_address_fromc(interp, (yyvsp[(3) - (4)].s)); ;}
    break;

  case 63:
#line 819 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; IMCC_INFO(interp)->cur_unit->outer =
                     mk_const(interp, (yyvsp[(3) - (4)].s), 'S'); ;}
    break;

  case 64:
#line 824 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;
                       IMCC_INFO(interp)->cur_unit->vtable_name = NULL;
                       IMCC_INFO(interp)->cur_unit->is_vtable_method = 1; ;}
    break;

  case 65:
#line 828 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;
                       IMCC_INFO(interp)->cur_unit->vtable_name = strdup((yyvsp[(3) - (4)].s));
                       IMCC_INFO(interp)->cur_unit->is_vtable_method = 1; ;}
    break;

  case 66:
#line 834 "compilers/imcc/imcc.y"
    { add_pcc_multi(IMCC_INFO(interp)->cur_call, NULL); ;}
    break;

  case 67:
#line 835 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr)); ;}
    break;

  case 68:
#line 836 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr));;}
    break;

  case 69:
#line 840 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("INTVAL"), 'S'); ;}
    break;

  case 70:
#line 841 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("FLOATVAL"), 'S'); ;}
    break;

  case 71:
#line 842 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("PMC"), 'S'); ;}
    break;

  case 72:
#line 843 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("STRING"), 'S'); ;}
    break;

  case 73:
#line 844 "compilers/imcc/imcc.y"
    {
                          SymReg *r;
                          if (strcmp((yyvsp[(1) - (1)].s), "_"))
                              r = mk_const(interp, (yyvsp[(1) - (1)].s), 'S');
                          else {
                              free((yyvsp[(1) - (1)].s)),
                              r = mk_const(interp, str_dup("PMC"), 'S');
                           }
                           (yyval.sr) = r;
                      ;}
    break;

  case 74:
#line 854 "compilers/imcc/imcc.y"
    {
                          SymReg *r;
                          if (strcmp((yyvsp[(1) - (1)].s), "_"))
                              r = mk_const(interp, (yyvsp[(1) - (1)].s), 'S');
                          else {
                              free((yyvsp[(1) - (1)].s)),
                              r = mk_const(interp, str_dup("PMC"), 'S');
                           }
                           (yyval.sr) = r;
                      ;}
    break;

  case 75:
#line 864 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); ;}
    break;

  case 78:
#line 874 "compilers/imcc/imcc.y"
    {
            char name[128];
            SymReg *r, *r1;
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

  case 79:
#line 902 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 80:
#line 906 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->label = 0; ;}
    break;

  case 81:
#line 907 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->label = 1; ;}
    break;

  case 82:
#line 911 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; ;}
    break;

  case 83:
#line 913 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->object = (yyvsp[(2) - (3)].sr); ;}
    break;

  case 84:
#line 917 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 86:
#line 922 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (1)].t); ;}
    break;

  case 87:
#line 923 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (3)].t) | (yyvsp[(3) - (3)].t); ;}
    break;

  case 88:
#line 927 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_LOAD; ;}
    break;

  case 89:
#line 928 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_INIT; ;}
    break;

  case 90:
#line 929 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_MAIN; ;}
    break;

  case 91:
#line 930 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_IMMEDIATE; ;}
    break;

  case 92:
#line 931 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_POSTCOMP; ;}
    break;

  case 93:
#line 932 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_ANON; ;}
    break;

  case 94:
#line 933 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_METHOD; ;}
    break;

  case 95:
#line 934 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_NEED_LEX; ;}
    break;

  case 99:
#line 942 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (5)].sr));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         ;}
    break;

  case 100:
#line 947 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); ;}
    break;

  case 101:
#line 949 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
            IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isNCI;
         ;}
    break;

  case 102:
#line 954 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); ;}
    break;

  case 103:
#line 956 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[(2) - (3)].s),'S')); ;}
    break;

  case 104:
#line 958 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (5)].sr));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         ;}
    break;

  case 105:
#line 962 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[(2) - (5)].s),'S'));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         ;}
    break;

  case 106:
#line 969 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 107:
#line 970 "compilers/imcc/imcc.y"
    {  add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); ;}
    break;

  case 108:
#line 974 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (2)].sr); ;}
    break;

  case 109:
#line 979 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 110:
#line 980 "compilers/imcc/imcc.y"
    {  if ((yyvsp[(2) - (3)].sr)) add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); ;}
    break;

  case 111:
#line 984 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); ;}
    break;

  case 112:
#line 985 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 113:
#line 986 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[(4) - (4)].idlist);
         SymReg *ignored;
         if (l->unique_reg)
                 ignored = mk_ident_ur(interp, l->id, (yyvsp[(3) - (4)].t));
             else
                 ignored = mk_ident(interp, l->id, (yyvsp[(3) - (4)].t));
         UNUSED(ignored);
         is_def=0;
         (yyval.sr)=0;
     ;}
    break;

  case 114:
#line 1000 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; ;}
    break;

  case 115:
#line 1001 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); ;}
    break;

  case 116:
#line 1005 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_FLAT;   ;}
    break;

  case 117:
#line 1006 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPTIONAL; ;}
    break;

  case 118:
#line 1007 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPT_FLAG; ;}
    break;

  case 119:
#line 1008 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_NAMED; ;}
    break;

  case 120:
#line 1009 "compilers/imcc/imcc.y"
    {  adv_named_set(interp,(yyvsp[(3) - (4)].s)); (yyval.t) = 0; ;}
    break;

  case 121:
#line 1010 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_UNIQUE_REG; ;}
    break;

  case 122:
#line 1016 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, 0); ;}
    break;

  case 123:
#line 1019 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; ;}
    break;

  case 124:
#line 1020 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.i) = 0;  ;}
    break;

  case 125:
#line 1026 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, 1); ;}
    break;

  case 126:
#line 1029 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->asm_state = AsmDefault; ;}
    break;

  case 127:
#line 1033 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 128:
#line 1034 "compilers/imcc/imcc.y"
    {
       if ((yyvsp[(1) - (2)].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (2)].sr));
   ;}
    break;

  case 129:
#line 1037 "compilers/imcc/imcc.y"
    {
       if ((yyvsp[(2) - (3)].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(2) - (3)].sr));
   ;}
    break;

  case 130:
#line 1043 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); ;}
    break;

  case 131:
#line 1048 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, (yyvsp[(1) - (2)].t));
        ;}
    break;

  case 132:
#line 1053 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  ;}
    break;

  case 133:
#line 1057 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 134:
#line 1058 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; ;}
    break;

  case 135:
#line 1062 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 136:
#line 1063 "compilers/imcc/imcc.y"
    {
      if (IMCC_INFO(interp)->adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               IMCC_INFO(interp)->adv_named_id, (yyvsp[(1) - (1)].sr));
          IMCC_INFO(interp)->adv_named_id = NULL;
      }
      else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (1)].sr)); ;}
    break;

  case 137:
#line 1070 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[(1) - (3)].s),(yyvsp[(3) - (3)].sr));;}
    break;

  case 138:
#line 1072 "compilers/imcc/imcc.y"
    {
      if (IMCC_INFO(interp)->adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               IMCC_INFO(interp)->adv_named_id,(yyvsp[(3) - (3)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
      }
      else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(3) - (3)].sr));    ;}
    break;

  case 139:
#line 1079 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[(3) - (5)].s),(yyvsp[(5) - (5)].sr));;}
    break;

  case 142:
#line 1098 "compilers/imcc/imcc.y"
    { clear_state(interp); ;}
    break;

  case 143:
#line 1103 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[(2) - (2)].i); ;}
    break;

  case 144:
#line 1104 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 145:
#line 1105 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 146:
#line 1106 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 147:
#line 1110 "compilers/imcc/imcc.y"
    {  (yyval.i) = NULL; ;}
    break;

  case 151:
#line 1120 "compilers/imcc/imcc.y"
    {
         (yyval.i) = iLABEL(interp, IMCC_INFO(interp)->cur_unit, mk_local_label(interp, (yyvsp[(1) - (1)].s)));
                   ;}
    break;

  case 152:
#line 1129 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(2) - (3)].i); ;}
    break;

  case 153:
#line 1131 "compilers/imcc/imcc.y"
    { if (yynerrs >= PARROT_MAX_RECOVER_ERRORS) {
                           IMCC_warning(interp, "Too many errors. Correct some first.\n");
                           YYABORT;
                       }
                       yyerrok; ;}
    break;

  case 154:
#line 1140 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[(1) - (1)].idlist);
         l->next = NULL;
         (yyval.idlist) = l;
     ;}
    break;

  case 155:
#line 1147 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[(3) - (3)].idlist);
         l->next = (yyvsp[(1) - (3)].idlist);
         (yyval.idlist) = l;
     ;}
    break;

  case 156:
#line 1156 "compilers/imcc/imcc.y"
    {
         IdList* l = (IdList*)malloc(sizeof(IdList));
         l->id = (yyvsp[(1) - (2)].s);
         l->unique_reg = 1;
         (yyval.idlist) = l;
     ;}
    break;

  case 157:
#line 1164 "compilers/imcc/imcc.y"
    {
         IdList* l = (IdList*)malloc(sizeof(IdList));
         l->id = (yyvsp[(1) - (1)].s);
         l->unique_reg = 0;
         (yyval.idlist) = l;
     ;}
    break;

  case 160:
#line 1175 "compilers/imcc/imcc.y"
    { push_namespace((yyvsp[(2) - (2)].s)); ;}
    break;

  case 161:
#line 1176 "compilers/imcc/imcc.y"
    { pop_namespace((yyvsp[(2) - (2)].s)); ;}
    break;

  case 162:
#line 1177 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 163:
#line 1178 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[(4) - (4)].idlist);
         while (l) {
             IdList* l1;
             SymReg *ignored;
             if (l->unique_reg)
                 ignored = mk_ident_ur(interp, l->id, (yyvsp[(3) - (4)].t));
             else
                 ignored = mk_ident(interp, l->id, (yyvsp[(3) - (4)].t));
             UNUSED(ignored);
             l1 = l;
             l = l->next;
             free(l1);
         }
         is_def=0; (yyval.i)=0;
     ;}
    break;

  case 164:
#line 1195 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, (yyvsp[(4) - (4)].sr), (yyvsp[(2) - (4)].s)); (yyval.i) = 0;
                    ;}
    break;

  case 165:
#line 1198 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 166:
#line 1199 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 0);is_def=0; ;}
    break;

  case 168:
#line 1201 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 169:
#line 1202 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1);is_def=0; ;}
    break;

  case 170:
#line 1203 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;
                           IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isTAIL_CALL;
                           IMCC_INFO(interp)->cur_call = NULL;
                        ;}
    break;

  case 171:
#line 1207 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "branch",1, (yyvsp[(2) - (2)].sr)); ;}
    break;

  case 172:
#line 1209 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (2)].s), 0,
                              IMCC_INFO(interp) -> regs,
                              IMCC_INFO(interp) -> nargs,
                              IMCC_INFO(interp) -> keyvec, 1);
                       free((yyvsp[(1) - (2)].s)); ;}
    break;

  case 173:
#line 1215 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(2) - (2)].sr)); ;}
    break;

  case 174:
#line 1216 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 175:
#line 1217 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 178:
#line 1220 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;;}
    break;

  case 179:
#line 1224 "compilers/imcc/imcc.y"
    { (yyval.t) = 'I'; ;}
    break;

  case 180:
#line 1225 "compilers/imcc/imcc.y"
    { (yyval.t) = 'N'; ;}
    break;

  case 181:
#line 1226 "compilers/imcc/imcc.y"
    { (yyval.t) = 'S'; ;}
    break;

  case 182:
#line 1227 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; ;}
    break;

  case 183:
#line 1228 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 184:
#line 1233 "compilers/imcc/imcc.y"
    {
             if (( IMCC_INFO(interp)->cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, (yyvsp[(1) - (1)].s), 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", (yyvsp[(1) - (1)].s));
            }
         ;}
    break;

  case 185:
#line 1244 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr));  ;}
    break;

  case 186:
#line 1246 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (4)].s), 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));  ;}
    break;

  case 187:
#line 1248 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(4) - (5)].s), 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  ;}
    break;

  case 188:
#line 1250 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(5) - (6)].sr)); ;}
    break;

  case 189:
#line 1252 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 190:
#line 1254 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].s), (yyvsp[(6) - (6)].sr), 1); ;}
    break;

  case 191:
#line 1256 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].s), (yyvsp[(6) - (7)].sr), 1); ;}
    break;

  case 192:
#line 1258 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].s), NULL, 1); ;}
    break;

  case 193:
#line 1260 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 194:
#line 1262 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (6)].sr), (yyvsp[(5) - (6)].sr)); ;}
    break;

  case 195:
#line 1264 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 196:
#line 1266 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); ;}
    break;

  case 197:
#line 1268 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set_addr",
                        2, (yyvsp[(1) - (4)].sr), mk_label_address(interp, (yyvsp[(4) - (4)].s))); ;}
    break;

  case 198:
#line 1271 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "find_global",2,(yyvsp[(1) - (4)].sr),(yyvsp[(4) - (4)].sr));;}
    break;

  case 199:
#line 1273 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "store_global",2, (yyvsp[(2) - (4)].sr),(yyvsp[(4) - (4)].sr)); ;}
    break;

  case 200:
#line 1277 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 201:
#line 1279 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 202:
#line 1281 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); ;}
    break;

  case 203:
#line 1284 "compilers/imcc/imcc.y"
    {
            add_pcc_result((yyvsp[(3) - (3)].i)->r[0], (yyvsp[(1) - (3)].sr));
            IMCC_INFO(interp)->cur_call = NULL;
            (yyval.i) = 0;
         ;}
    break;

  case 204:
#line 1290 "compilers/imcc/imcc.y"
    {
            (yyval.i) = IMCC_create_itcall_label(interp);
         ;}
    break;

  case 205:
#line 1294 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[(6) - (9)].sr));
           IMCC_INFO(interp)->cur_call = NULL;
         ;}
    break;

  case 209:
#line 1302 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(1) - (3)].sr)); ;}
    break;

  case 210:
#line 1306 "compilers/imcc/imcc.y"
    { (yyval.s) = "not"; ;}
    break;

  case 211:
#line 1307 "compilers/imcc/imcc.y"
    { (yyval.s) = "bnot"; ;}
    break;

  case 212:
#line 1308 "compilers/imcc/imcc.y"
    { (yyval.s) = "neg"; ;}
    break;

  case 213:
#line 1312 "compilers/imcc/imcc.y"
    { (yyval.s) = "sub"; ;}
    break;

  case 214:
#line 1313 "compilers/imcc/imcc.y"
    { (yyval.s) = "add"; ;}
    break;

  case 215:
#line 1314 "compilers/imcc/imcc.y"
    { (yyval.s) = "mul"; ;}
    break;

  case 216:
#line 1315 "compilers/imcc/imcc.y"
    { (yyval.s) = "div"; ;}
    break;

  case 217:
#line 1316 "compilers/imcc/imcc.y"
    { (yyval.s) = "mod"; ;}
    break;

  case 218:
#line 1317 "compilers/imcc/imcc.y"
    { (yyval.s) = "fdiv"; ;}
    break;

  case 219:
#line 1318 "compilers/imcc/imcc.y"
    { (yyval.s) = "pow"; ;}
    break;

  case 220:
#line 1319 "compilers/imcc/imcc.y"
    { (yyval.s) = "concat"; ;}
    break;

  case 221:
#line 1320 "compilers/imcc/imcc.y"
    {  (yyval.s) = "iseq"; ;}
    break;

  case 222:
#line 1321 "compilers/imcc/imcc.y"
    {  (yyval.s) = "isne"; ;}
    break;

  case 223:
#line 1322 "compilers/imcc/imcc.y"
    {  (yyval.s) = "isgt"; ;}
    break;

  case 224:
#line 1323 "compilers/imcc/imcc.y"
    {  (yyval.s) = "isge"; ;}
    break;

  case 225:
#line 1324 "compilers/imcc/imcc.y"
    {  (yyval.s) = "islt"; ;}
    break;

  case 226:
#line 1325 "compilers/imcc/imcc.y"
    {  (yyval.s) = "isle"; ;}
    break;

  case 227:
#line 1326 "compilers/imcc/imcc.y"
    { (yyval.s) = "shl"; ;}
    break;

  case 228:
#line 1327 "compilers/imcc/imcc.y"
    { (yyval.s) = "shr"; ;}
    break;

  case 229:
#line 1328 "compilers/imcc/imcc.y"
    { (yyval.s) = "lsr"; ;}
    break;

  case 230:
#line 1329 "compilers/imcc/imcc.y"
    { (yyval.s) = "and"; ;}
    break;

  case 231:
#line 1330 "compilers/imcc/imcc.y"
    { (yyval.s) = "xor"; ;}
    break;

  case 232:
#line 1331 "compilers/imcc/imcc.y"
    { (yyval.s) = "xor"; ;}
    break;

  case 233:
#line 1332 "compilers/imcc/imcc.y"
    { (yyval.s) = "band"; ;}
    break;

  case 234:
#line 1333 "compilers/imcc/imcc.y"
    { (yyval.s) = "bor"; ;}
    break;

  case 235:
#line 1334 "compilers/imcc/imcc.y"
    { (yyval.s) = "bxor"; ;}
    break;

  case 236:
#line 1338 "compilers/imcc/imcc.y"
    { (yyval.i) = IMCC_create_itcall_label(interp);
                           (yyval.i)->type &= ~ITCALL; (yyval.i)->type |= ITRESULT; ;}
    break;

  case 237:
#line 1340 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 238:
#line 1347 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(2) - (3)].s), 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); ;}
    break;

  case 239:
#line 1351 "compilers/imcc/imcc.y"
    { (yyval.s) = "add"; ;}
    break;

  case 240:
#line 1352 "compilers/imcc/imcc.y"
    { (yyval.s) = "sub"; ;}
    break;

  case 241:
#line 1353 "compilers/imcc/imcc.y"
    { (yyval.s) = "mul"; ;}
    break;

  case 242:
#line 1354 "compilers/imcc/imcc.y"
    { (yyval.s) = "div"; ;}
    break;

  case 243:
#line 1355 "compilers/imcc/imcc.y"
    { (yyval.s) = "mod"; ;}
    break;

  case 244:
#line 1356 "compilers/imcc/imcc.y"
    { (yyval.s) = "fdiv"; ;}
    break;

  case 245:
#line 1357 "compilers/imcc/imcc.y"
    { (yyval.s) = "concat"; ;}
    break;

  case 246:
#line 1358 "compilers/imcc/imcc.y"
    { (yyval.s) = "band"; ;}
    break;

  case 247:
#line 1359 "compilers/imcc/imcc.y"
    { (yyval.s) = "bor"; ;}
    break;

  case 248:
#line 1360 "compilers/imcc/imcc.y"
    { (yyval.s) = "bxor"; ;}
    break;

  case 249:
#line 1361 "compilers/imcc/imcc.y"
    { (yyval.s) = "shr"; ;}
    break;

  case 250:
#line 1362 "compilers/imcc/imcc.y"
    { (yyval.s) = "shl"; ;}
    break;

  case 251:
#line 1363 "compilers/imcc/imcc.y"
    { (yyval.s) = "lsr"; ;}
    break;

  case 252:
#line 1369 "compilers/imcc/imcc.y"
    { (yyval.i) = func_ins(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(3) - (4)].s),
                                   IMCC_INFO(interp) -> regs,
                                   IMCC_INFO(interp) -> nargs,
                                   IMCC_INFO(interp) -> keyvec, 1);
                     free((yyvsp[(3) - (4)].s));
                   ;}
    break;

  case 253:
#line 1377 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 254:
#line 1378 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 255:
#line 1379 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 256:
#line 1380 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (1)].sr);
                       if ((yyvsp[(1) - (1)].sr)->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     ;}
    break;

  case 257:
#line 1385 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); ;}
    break;

  case 258:
#line 1386 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = mk_const(interp, (yyvsp[(3) - (3)].s), 'S'); ;}
    break;

  case 259:
#line 1387 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); ;}
    break;

  case 260:
#line 1393 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[(1) - (1)].sr));
        ;}
    break;

  case 261:
#line 1398 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[(2) - (5)].i); ;}
    break;

  case 262:
#line 1402 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 263:
#line 1403 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0;
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, IMCC_INFO(interp)->adv_named_id, (yyvsp[(3) - (3)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       }
       else add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr));
   ;}
    break;

  case 264:
#line 1410 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0;
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call,IMCC_INFO(interp)->adv_named_id,(yyvsp[(1) - (1)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       }
       else add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr));
   ;}
    break;

  case 265:
#line 1417 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0;
                                     add_pcc_named_arg(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(3) - (5)].s),(yyvsp[(5) - (5)].sr));;}
    break;

  case 266:
#line 1419 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_named_arg(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(1) - (3)].s),(yyvsp[(3) - (3)].sr));;}
    break;

  case 267:
#line 1423 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); ;}
    break;

  case 268:
#line 1427 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; ;}
    break;

  case 269:
#line 1428 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); ;}
    break;

  case 270:
#line 1432 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT; ;}
    break;

  case 271:
#line 1433 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_NAMED; ;}
    break;

  case 272:
#line 1434 "compilers/imcc/imcc.y"
    { adv_named_set(interp,(yyvsp[(3) - (4)].s)); (yyval.t) = 0; ;}
    break;

  case 273:
#line 1437 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); ;}
    break;

  case 274:
#line 1441 "compilers/imcc/imcc.y"
    {
         (yyval.sr) = 0;
         if (IMCC_INFO(interp)->adv_named_id) {
             add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,IMCC_INFO(interp)->adv_named_id,(yyvsp[(3) - (3)].sr));
             IMCC_INFO(interp)->adv_named_id = NULL;
         }
         else add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr)); ;}
    break;

  case 275:
#line 1448 "compilers/imcc/imcc.y"
    {
        add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(3) - (5)].s),(yyvsp[(5) - (5)].sr)); ;}
    break;

  case 276:
#line 1450 "compilers/imcc/imcc.y"
    {
       (yyval.sr) = 0;
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,IMCC_INFO(interp)->adv_named_id,(yyvsp[(1) - (1)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       }
       else add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr)); ;}
    break;

  case 277:
#line 1457 "compilers/imcc/imcc.y"
    { add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(1) - (3)].s),(yyvsp[(3) - (3)].sr)); ;}
    break;

  case 278:
#line 1458 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 279:
#line 1462 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 280:
#line 1463 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 281:
#line 1468 "compilers/imcc/imcc.y"
    { (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, inv_op((yyvsp[(3) - (6)].s)), 3, (yyvsp[(2) - (6)].sr),(yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 282:
#line 1470 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); ;}
    break;

  case 283:
#line 1472 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless",2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 284:
#line 1477 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 285:
#line 1479 "compilers/imcc/imcc.y"
    { (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 286:
#line 1481 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); ;}
    break;

  case 287:
#line 1485 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 288:
#line 1486 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 289:
#line 1490 "compilers/imcc/imcc.y"
    {  (yyval.s) = "eq"; ;}
    break;

  case 290:
#line 1491 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ne"; ;}
    break;

  case 291:
#line 1492 "compilers/imcc/imcc.y"
    {  (yyval.s) = "gt"; ;}
    break;

  case 292:
#line 1493 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ge"; ;}
    break;

  case 293:
#line 1494 "compilers/imcc/imcc.y"
    {  (yyval.s) = "lt"; ;}
    break;

  case 294:
#line 1495 "compilers/imcc/imcc.y"
    {  (yyval.s) = "le"; ;}
    break;

  case 297:
#line 1504 "compilers/imcc/imcc.y"
    {  (yyval.sr) = NULL; ;}
    break;

  case 298:
#line 1505 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(1) - (1)].sr); ;}
    break;

  case 299:
#line 1509 "compilers/imcc/imcc.y"
    { (yyval.sr) = IMCC_INFO(interp)->regs[0]; ;}
    break;

  case 301:
#line 1514 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(1) - (1)].sr); ;}
    break;

  case 302:
#line 1516 "compilers/imcc/imcc.y"
    {
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(1) - (4)].sr);
                      IMCC_INFO(interp) -> keyvec |= KEY_BIT(IMCC_INFO(interp)->nargs);
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(3) - (4)].sr);
                      (yyval.sr) = (yyvsp[(1) - (4)].sr);
                   ;}
    break;

  case 303:
#line 1523 "compilers/imcc/imcc.y"
    {
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(2) - (3)].sr);
                      (yyval.sr) = (yyvsp[(2) - (3)].sr);
                   ;}
    break;

  case 305:
#line 1530 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 306:
#line 1531 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 307:
#line 1535 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 308:
#line 1536 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 309:
#line 1540 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 310:
#line 1541 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 315:
#line 1554 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->nkeys = 0;
                      IMCC_INFO(interp)->in_slice = 0; ;}
    break;

  case 316:
#line 1556 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp,
                                     IMCC_INFO(interp)->nkeys,
                                     IMCC_INFO(interp)->keys, 0); ;}
    break;

  case 317:
#line 1561 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->nkeys = 0;
                      IMCC_INFO(interp)->in_slice = 0; ;}
    break;

  case 318:
#line 1563 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp,
                                     IMCC_INFO(interp)->nkeys,
                                     IMCC_INFO(interp)->keys, 1); ;}
    break;

  case 319:
#line 1569 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(1) - (1)].sr); ;}
    break;

  case 320:
#line 1571 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(3) - (3)].sr);
                      (yyval.sr) = IMCC_INFO(interp)->keys[0]; ;}
    break;

  case 321:
#line 1573 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->in_slice = 1; ;}
    break;

  case 322:
#line 1574 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(4) - (4)].sr);
                       (yyval.sr) = IMCC_INFO(interp)->keys[0]; ;}
    break;

  case 323:
#line 1579 "compilers/imcc/imcc.y"
    { if (IMCC_INFO(interp)->in_slice) {
                         (yyvsp[(1) - (1)].sr)->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     (yyval.sr) = (yyvsp[(1) - (1)].sr);
                   ;}
    break;

  case 324:
#line 1585 "compilers/imcc/imcc.y"
    { (yyvsp[(1) - (3)].sr)->type |= VT_START_SLICE;
                     (yyvsp[(3) - (3)].sr)->type |= VT_END_SLICE;
                     IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(1) - (3)].sr);
                     (yyval.sr) = (yyvsp[(3) - (3)].sr); ;}
    break;

  case 325:
#line 1589 "compilers/imcc/imcc.y"
    { (yyvsp[(2) - (2)].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[(2) - (2)].sr); ;}
    break;

  case 326:
#line 1590 "compilers/imcc/imcc.y"
    { (yyvsp[(1) - (2)].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[(1) - (2)].sr); ;}
    break;

  case 327:
#line 1594 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'I'); ;}
    break;

  case 328:
#line 1595 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'N'); ;}
    break;

  case 329:
#line 1596 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); ;}
    break;

  case 330:
#line 1597 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'P'); ;}
    break;

  case 331:
#line 1598 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_pasm_reg(interp, (yyvsp[(1) - (1)].s));    ;}
    break;

  case 332:
#line 1602 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'I'); ;}
    break;

  case 333:
#line 1603 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'N'); ;}
    break;

  case 334:
#line 1604 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S'); ;}
    break;

  case 335:
#line 1605 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'U'); ;}
    break;

  case 336:
#line 1609 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); ;}
    break;

  case 337:
#line 1610 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S');  ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4455 "compilers/imcc/imcparser.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
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
#if ! YYERROR_VERBOSE
      yyerror (yyscanner, interp, YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yyscanner, interp, yymsg);
	  }
	else
	  {
	    yyerror (yyscanner, interp, YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
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
	  yydestruct ("Error: discarding",
		      yytoken, &yylval, yyscanner, interp);
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
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
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


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp, yyscanner, interp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
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
		 yytoken, &yylval, yyscanner, interp);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp, yyscanner, interp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 1615 "compilers/imcc/imcc.y"


/* I need this prototype somewhere... */
char *yyget_text (yyscan_t yyscanner );

/* I do not like this function, but, atm, it is the only way I can
 * make the code in yyerror work without segfault on some specific
 * cases.
 */
/* int yyholds_char(yyscan_t yyscanner ); */

int yyerror(void *yyscanner, PARROT_INTERP, char * s)
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
    }
    else {
        IMCC_warning(interp, "error:imcc:%s", s);
        IMCC_print_inc(interp);
    }

    return 0;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

