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
     ADV_INVOCANT = 276,
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
     INIT = 342,
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
     CONCAT = 373
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
#define ADV_INVOCANT 276
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
#define INIT 342
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

#ifndef YYENABLE_NLS
#  define YYENABLE_NLS 0
#endif

#ifndef YYLTYPE_IS_TRIVIAL
#  define YYLTYPE_IS_TRIVIAL 0
#endif

/*
Copyright (C) 2001-2008, The Perl Foundation.
$Id$

=head1 NAME

compilers/mcc/imcparser.c - XXX What does this do?
src/string.c - Parrot Strings

=head1 DESCRIPTION

XXX Fill this in

=head1 FUNCTIONS

=over 4

=cut

*/

/* HEADERIZER HFILE: compilers/imcc/imc.h */

/* HEADERIZER BEGIN: static */

static void add_pcc_named_arg(PARROT_INTERP,
    ARGMOD(SymReg *cur_call),
    ARGIN(const char *name),
    ARGMOD(SymReg *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*cur_call)
        FUNC_MODIFIES(*value);

static void add_pcc_named_param(PARROT_INTERP,
    ARGMOD(SymReg *cur_call),
    ARGIN(const char *name),
    ARGMOD(SymReg *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*cur_call)
        FUNC_MODIFIES(*value);

static void add_pcc_named_result(PARROT_INTERP,
    ARGMOD(SymReg *cur_call),
    ARGIN(const char *name),
    ARGMOD(SymReg *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*cur_call)
        FUNC_MODIFIES(*value);

static void add_pcc_named_return(PARROT_INTERP,
    ARGMOD(SymReg *cur_call),
    ARGIN(const char *name),
    ARGMOD(SymReg *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*cur_call)
        FUNC_MODIFIES(*value);

static void begin_return_or_yield(PARROT_INTERP, int yield)
        __attribute__nonnull__(1);

static void clear_state(PARROT_INTERP)
        __attribute__nonnull__(1);

static void do_loadlib(PARROT_INTERP, ARGIN(const char *lib))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static Instruction* func_ins(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(SymReg *lhs),
    ARGIN(const char *op),
    ARGMOD(SymReg **r),
    int n,
    int keyv,
    int emit)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*r);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static Instruction * iINDEXFETCH(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(const SymReg *r0),
    ARGIN(const SymReg *r1),
    ARGIN(const SymReg *r2))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static Instruction * iINDEXSET(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(const SymReg *r0),
    ARGIN(const SymReg *r1),
    ARGIN(const SymReg *r2))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const char * inv_op(ARGIN(const char *op))
        __attribute__nonnull__(1);

PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
static Instruction * MK_I(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(const char *fmt),
    int n,
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static Instruction* mk_pmc_const(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(const char *type),
    ARGMOD(SymReg *left),
    ARGMOD(char *constant))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*left)
        FUNC_MODIFIES(*constant);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static SymReg * mk_sub_address_fromc(PARROT_INTERP, ARGIN(char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static SymReg * mk_sub_address_u(PARROT_INTERP, ARGIN(char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void set_lexical(PARROT_INTERP,
    ARGMOD(SymReg *r),
    ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*r);

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

=item C<static Instruction * MK_I>

build and emitb instruction by INS

fmt may contain:

  op %s, %s # comment

or just

  op


NOTE: Most usage of this function is with C<< IMCC_INFO(interp)->cur_unit >>,
but there are some exceptions. Thus, we can't easily factorize that
piece of code.

=cut

 */

PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
static Instruction *
MK_I(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(const char *fmt), int n, ...)
{
    char opname[64];
    char *p;
    const char *q;
    va_list ap;
    SymReg *r[IMCC_MAX_FIX_REGS];
    int i;

    for (p = opname, q = fmt; *q && *q != ' ';)
        *p++ = *q++;
    *p = 0;
    if (!*q)
        fmt = NULL;
    else
        fmt = ++q;
#ifdef OPDEBUG
    fprintf(stderr, "op '%s' format '%s' (%d)\n", opname, fmt?:"", n);
#endif
    va_start(ap, n);
    i = 0;
    for (i = 0; i < n; ++i) {
        r[i] = va_arg(ap, SymReg *);
    }
    va_end(ap);
    return INS(interp, unit, opname, fmt, r, n, IMCC_INFO(interp)->keyvec, 1);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static Instruction*
mk_pmc_const(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(const char *type),
        ARGMOD(SymReg *left), ARGMOD(char *constant))
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
    ascii = (*constant == '\'' || *constant == '"');
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

            rhs->usage    = U_FIXUP;
            break;
        default:
            rhs = mk_const(interp, name, 'P');
            break;
    }

    r[1]          = rhs;
    rhs->pmc_type = type_enum;

    return INS(interp, unit, "set_p_pc", "", r, 2, 0, 1);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static Instruction*
func_ins(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(SymReg *lhs), ARGIN(const char *op),
        ARGMOD(SymReg **r), int n, int keyv, int emit)
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

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Instruction *
INS_LABEL(PARROT_INTERP, ARGMOD_NULLOK(IMC_Unit *unit), ARGIN(SymReg *r0), int emit)
{

    Instruction * const ins = _mk_instruction("", "%s:", 1, &r0, 0);
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

PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
static Instruction *
iSUBROUTINE(PARROT_INTERP, IMC_Unit *unit, NOTNULL(SymReg *r)) {
    Instruction * const i =iLABEL(interp, unit, r);

    r->type    = (r->type & VT_ENCODED) ? VT_PCC_SUB|VT_ENCODED : VT_PCC_SUB;
    r->pcc_sub = (pcc_sub_t*)calloc(1, sizeof (struct pcc_sub_t));

    IMCC_INFO(interp)->cur_call = r;
    i->line                     = IMCC_INFO(interp)->line;

    add_namespace(interp, unit);
    return i;
}

/*
 * substr or X = P[key]
 */

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static Instruction *
iINDEXFETCH(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(const SymReg *r0),
        ARGIN(const SymReg *r1), ARGIN(const SymReg *r2))
{
    if (r0->set == 'S' && r1->set == 'S' && r2->set == 'I') {
        SymReg * const r3 = mk_const(interp, str_dup("1"), 'I');
        return MK_I(interp, unit, "substr %s, %s, %s, 1", 4, r0, r1, r2, r3);
    }

    IMCC_INFO(interp) -> keyvec |= KEY_BIT(2);
    return MK_I(interp, unit, "set %s, %s[%s]", 3, r0, r1, r2);
}

/*
 * substr or P[key] = X
 */

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static Instruction *
iINDEXSET(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(const SymReg *r0),
            ARGIN(const SymReg *r1), ARGIN(const SymReg *r2))
{
    if (r0->set == 'S' && r1->set == 'I' && r2->set == 'S') {
        SymReg * const r3 = mk_const(interp, str_dup("1"), 'I');
        MK_I(interp, unit, "substr %s, %s, %s, %s", 4, r0, r1, r3, r2);
    }
    else if (r0->set == 'P') {
        IMCC_INFO(interp) -> keyvec |= KEY_BIT(1);
        MK_I(interp, unit, "set %s[%s], %s", 3, r0, r1, r2);
    }
    else {
        IMCC_fataly(interp, E_SyntaxError,
            "unsupported indexed set op\n");
    }
    return NULL;
}


PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const char *
inv_op(ARGIN(const char *op)) {
    int n;
    return get_neg_op(op, &n);
}


PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
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


PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static SymReg *
mk_sub_address_fromc(PARROT_INTERP, ARGIN(char *name))
{
    /* name is a quoted sub name */
    SymReg *r;

    name[strlen(name) - 1] = '\0';
    r = mk_sub_address(interp, str_dup(name + 1));
    mem_sys_free(name);
    return r;
}


PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static SymReg *
mk_sub_address_u(PARROT_INTERP, ARGIN(char *name))
{
    SymReg * const r = mk_sub_address(interp, name);
    r->type         |= VT_ENCODED;

    return r;
}

void
IMCC_itcall_sub(PARROT_INTERP, ARGIN(SymReg *sub))
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
set_lexical(PARROT_INTERP, ARGMOD(SymReg *r), ARGIN(const char *name))
{
    SymReg * const n = mk_const(interp, name, 'S');

    r->usage |= U_LEXICAL;

    if (n == r->reg)
        IMCC_fataly(interp, E_SyntaxError,
            "register %s already declared as lexical %s", r->name, n->name);

    /* chain all names in r->reg */
    n->reg = r->reg;
    r->reg = n;
}

static void
add_pcc_named_arg(PARROT_INTERP, ARGMOD(SymReg *cur_call), ARGIN(const char *name),
        ARGMOD(SymReg *value))
{
    SymReg * const r = mk_const(interp, name, 'S');
    r->type  |= VT_NAMED;

    add_pcc_arg(cur_call, r);
    add_pcc_arg(cur_call, value);
}

static void
add_pcc_named_result(PARROT_INTERP, ARGMOD(SymReg *cur_call), ARGIN(const char *name),
        ARGMOD(SymReg *value))
{
    SymReg * const r = mk_const(interp, name, 'S');
    r->type         |= VT_NAMED;

    add_pcc_result(cur_call, r);
    add_pcc_result(cur_call, value);
}

static void
add_pcc_named_param(PARROT_INTERP, ARGMOD(SymReg *cur_call), ARGIN(const char *name),
        ARGMOD(SymReg *value))
{
    SymReg * const r = mk_const(interp, name, 'S');
    r->type         |= VT_NAMED;

    add_pcc_param(cur_call, r);
    add_pcc_param(cur_call, value);
}

static void
add_pcc_named_return(PARROT_INTERP, ARGMOD(SymReg *cur_call), ARGIN(const char *name),
        ARGMOD(SymReg *value))
{
    SymReg * const r = mk_const(interp, name, 'S');
    r->type         |= VT_NAMED;

    add_pcc_return(cur_call, r);
    add_pcc_return(cur_call, value);
}

static void
adv_named_set(PARROT_INTERP, ARGIN(char *name)) {
    if (IMCC_INFO(interp)->adv_named_id) {
        IMCC_fataly(interp, E_SyntaxError,
                    "Named parameter with more than one name.\n");
    }
    IMCC_INFO(interp)->adv_named_id = name;
}

static void
do_loadlib(PARROT_INTERP, ARGIN(const char *lib))
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
#line 521 "compilers/imcc/imcc.y"
{
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
}
/* Line 187 of yacc.c.  */
#line 860 "compilers/imcc/imcparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 873 "compilers/imcc/imcparser.c"

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
#define YYLAST   683

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  135
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  120
/* YYNRULES -- Number of rules.  */
#define YYNRULES  336
/* YYNRULES -- Number of states.  */
#define YYNSTATES  542

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   373

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   125,     2,     2,     2,   131,   132,     2,
     123,   124,   129,   128,     2,   127,     2,   130,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   134,
       2,   120,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   121,     2,   122,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   133,     2,   126,     2,     2,     2,
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
     116,   117,   118,   119
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
     172,   177,   182,   184,   189,   190,   194,   196,   198,   200,
     202,   204,   206,   208,   212,   213,   215,   216,   226,   227,
     230,   231,   235,   236,   238,   240,   243,   245,   247,   249,
     251,   253,   255,   257,   259,   261,   263,   265,   271,   275,
     279,   283,   287,   293,   299,   300,   304,   307,   308,   312,
     316,   317,   322,   323,   326,   328,   330,   332,   334,   339,
     341,   342,   348,   350,   351,   357,   358,   361,   365,   369,
     370,   376,   378,   380,   381,   383,   387,   391,   397,   399,
     402,   403,   406,   409,   411,   413,   414,   416,   419,   421,
     423,   427,   430,   432,   436,   439,   440,   442,   444,   446,
     449,   452,   453,   458,   463,   464,   471,   473,   474,   481,
     484,   487,   490,   493,   495,   497,   499,   501,   502,   504,
     506,   508,   510,   512,   514,   518,   523,   529,   536,   543,
     550,   558,   563,   568,   575,   582,   590,   595,   600,   605,
     610,   617,   625,   629,   630,   640,   642,   644,   646,   650,
     652,   654,   656,   658,   660,   662,   664,   666,   668,   670,
     672,   674,   676,   678,   680,   682,   684,   686,   688,   690,
     692,   694,   696,   698,   700,   702,   703,   709,   713,   715,
     717,   719,   721,   723,   725,   727,   729,   731,   733,   735,
     737,   739,   744,   746,   748,   750,   752,   756,   760,   764,
     765,   771,   772,   776,   778,   784,   788,   791,   792,   795,
     797,   799,   804,   807,   811,   817,   819,   823,   824,   826,
     828,   835,   841,   846,   851,   858,   864,   866,   868,   870,
     872,   874,   876,   878,   880,   882,   884,   885,   887,   891,
     893,   895,   900,   904,   906,   908,   910,   912,   914,   916,
     918,   920,   922,   924,   926,   927,   930,   931,   934,   936,
     940,   941,   946,   948,   952,   955,   958,   960,   962,   964,
     966,   968,   970,   972,   974,   976,   978
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     136,     0,    -1,   137,    -1,   138,    -1,   137,   138,    -1,
     156,    -1,   142,    -1,   158,    -1,   153,    -1,   108,     4,
      -1,   139,    -1,     4,    -1,     6,   140,     4,    -1,   141,
       4,    -1,    97,   110,     4,    -1,     7,   111,    -1,     8,
     110,    72,   110,    -1,     9,   110,    72,   110,    -1,    -1,
      30,   143,   211,   106,   120,   253,    -1,    -1,    30,   145,
     111,   243,   120,   146,    -1,   110,    -1,   113,    -1,   148,
      -1,   147,   148,    -1,   200,   149,     4,    -1,   108,     4,
      -1,   117,    -1,   116,    -1,   156,    -1,   144,    -1,   139,
      -1,    -1,   150,   114,   152,    -1,    -1,    78,   151,   176,
      99,    -1,    14,   244,    -1,    29,   110,    72,   107,    -1,
      -1,   237,    -1,    -1,   100,   154,   155,   101,    -1,    -1,
     147,    -1,    23,   157,     4,    -1,   121,   245,   122,    -1,
      -1,    -1,    -1,    -1,    26,   159,   240,   160,   176,     4,
     161,   162,   171,    73,    -1,    -1,     4,    -1,   162,   163,
       4,    -1,    -1,     5,   164,   165,    -1,   211,   106,   185,
      -1,   211,   110,    20,   106,   185,    -1,    95,   123,   169,
     124,    -1,    93,   123,   110,   124,    -1,    93,   123,   106,
     124,    -1,    96,    -1,    96,   123,   110,   124,    -1,    -1,
     169,    72,   170,    -1,   170,    -1,    50,    -1,    51,    -1,
      53,    -1,    52,    -1,   106,    -1,   110,    -1,   121,   245,
     122,    -1,    -1,   197,    -1,    -1,    75,     4,   173,   180,
     175,   179,   174,   182,    76,    -1,    -1,   202,     4,    -1,
      -1,    85,   244,     4,    -1,    -1,   177,    -1,   178,    -1,
     177,   178,    -1,    87,    -1,    88,    -1,    86,    -1,    89,
      -1,    90,    -1,    92,    -1,    91,    -1,    94,    -1,   166,
      -1,   167,    -1,   168,    -1,    77,   244,    72,   244,     4,
      -1,    77,   244,     4,    -1,    83,   244,     4,    -1,    84,
     236,     4,    -1,    84,   110,     4,    -1,    84,   236,    72,
     244,     4,    -1,    84,   110,    72,   244,     4,    -1,    -1,
     180,   181,     4,    -1,    11,   226,    -1,    -1,   182,   183,
       4,    -1,    64,   236,   185,    -1,    -1,    28,   184,   211,
     205,    -1,    -1,   185,   186,    -1,    16,    -1,    17,    -1,
      18,    -1,    19,    -1,    19,   123,   110,   124,    -1,    98,
      -1,    -1,    79,     4,   188,   191,    80,    -1,   193,    -1,
      -1,    81,     4,   190,   191,    82,    -1,    -1,   191,     4,
      -1,   191,   192,     4,    -1,    65,   244,   227,    -1,    -1,
     195,   123,   194,   196,   124,    -1,    65,    -1,    66,    -1,
      -1,   226,    -1,   110,    20,   244,    -1,   196,    72,   226,
      -1,   196,    72,   110,    20,   244,    -1,   199,    -1,   197,
     199,    -1,    -1,   198,   203,    -1,   108,     4,    -1,   117,
      -1,   116,    -1,    -1,   201,    -1,   201,   202,    -1,   202,
      -1,    99,    -1,   200,   207,     4,    -1,     1,     4,    -1,
     205,    -1,   204,    72,   205,    -1,   106,   206,    -1,    -1,
      98,    -1,   213,    -1,   231,    -1,    23,   106,    -1,    24,
     106,    -1,    -1,    28,   208,   211,   204,    -1,    29,   110,
      72,   236,    -1,    -1,    30,   209,   211,   106,   120,   253,
      -1,   144,    -1,    -1,    33,   210,   211,   106,   120,   253,
      -1,    65,   223,    -1,    10,   242,    -1,   114,   237,    -1,
      14,   244,    -1,   223,    -1,   172,    -1,   187,    -1,   189,
      -1,    -1,    50,    -1,    51,    -1,    52,    -1,    53,    -1,
     212,    -1,   106,    -1,   236,   120,   244,    -1,   236,   120,
     215,   244,    -1,   236,   120,   244,   216,   244,    -1,   236,
     120,   244,   121,   245,   122,    -1,   236,   121,   245,   122,
     120,   244,    -1,   236,   120,    21,   212,    72,   244,    -1,
     236,   120,    21,   212,   121,   245,   122,    -1,   236,   120,
      21,   212,    -1,   236,   120,    21,   244,    -1,   236,   120,
      21,   121,   245,   122,    -1,   236,   120,    21,   244,    72,
     244,    -1,   236,   120,    21,   244,   121,   245,   122,    -1,
     236,   120,    63,   106,    -1,   236,   120,    62,   254,    -1,
      62,   254,   120,   244,    -1,    21,   236,    72,   244,    -1,
      21,   236,    72,   244,    72,   244,    -1,    21,   236,    72,
     244,   121,   245,   122,    -1,   236,   120,   223,    -1,    -1,
     123,   214,   230,   124,   120,   222,   123,   225,   124,    -1,
     217,    -1,   219,    -1,   221,    -1,   236,   120,    14,    -1,
     125,    -1,   126,    -1,   127,    -1,   127,    -1,   128,    -1,
     129,    -1,   130,    -1,   131,    -1,    42,    -1,    68,    -1,
     119,    -1,    55,    -1,    56,    -1,    57,    -1,    58,    -1,
      59,    -1,    60,    -1,    48,    -1,    49,    -1,    69,    -1,
      70,    -1,    71,    -1,    54,    -1,   132,    -1,   133,    -1,
     126,    -1,    -1,    67,   218,   123,   230,   124,    -1,   236,
     220,   244,    -1,    34,    -1,    35,    -1,    36,    -1,    37,
      -1,    44,    -1,    43,    -1,    38,    -1,    39,    -1,    40,
      -1,    41,    -1,    45,    -1,    46,    -1,    47,    -1,   236,
     120,   114,   152,    -1,   106,    -1,   110,    -1,   113,    -1,
     236,    -1,   236,   118,   241,    -1,   236,   118,   110,    -1,
     236,   118,   236,    -1,    -1,   222,   224,   123,   225,   124,
      -1,    -1,   225,    72,   226,    -1,   226,    -1,   225,    72,
     110,    20,   244,    -1,   110,    20,   244,    -1,   244,   227,
      -1,    -1,   227,   228,    -1,    15,    -1,    19,    -1,    19,
     123,   110,   124,    -1,   236,   185,    -1,   230,    72,   229,
      -1,   230,    72,   110,    20,   236,    -1,   229,    -1,   110,
      20,   236,    -1,    -1,   233,    -1,   232,    -1,    13,   244,
     235,   244,    10,   242,    -1,    13,    14,   244,    10,   242,
      -1,    13,   244,   234,   242,    -1,    12,   244,   234,   242,
      -1,    12,   244,   235,   244,    10,   242,    -1,    12,    14,
     244,    10,   242,    -1,    72,    -1,    10,    -1,    55,    -1,
      56,    -1,    57,    -1,    58,    -1,    59,    -1,    60,    -1,
     115,    -1,   252,    -1,    -1,   238,    -1,   238,    72,   239,
      -1,   239,    -1,   243,    -1,   236,   121,   245,   122,    -1,
     121,   247,   122,    -1,   241,    -1,   110,    -1,   113,    -1,
     106,    -1,   114,    -1,   106,    -1,   114,    -1,   242,    -1,
     244,    -1,   236,    -1,   253,    -1,    -1,   246,   249,    -1,
      -1,   248,   249,    -1,   251,    -1,   249,   134,   251,    -1,
      -1,   249,    72,   250,   251,    -1,   244,    -1,   244,    74,
     244,    -1,    74,   244,    -1,   244,    74,    -1,   102,    -1,
     103,    -1,   104,    -1,   105,    -1,   107,    -1,   111,    -1,
     112,    -1,   110,    -1,   113,    -1,   104,    -1,   110,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   613,   613,   617,   618,   622,   623,   624,   627,   630,
     631,   632,   635,   636,   637,   640,   648,   661,   681,   681,
     691,   691,   695,   696,   700,   701,   705,   706,   707,   708,
     709,   710,   711,   714,   714,   721,   720,   731,   733,   738,
     742,   746,   746,   756,   758,   762,   777,   778,   783,   787,
     790,   782,   796,   797,   798,   809,   809,   813,   818,   829,
     832,   835,   840,   844,   851,   852,   853,   857,   858,   859,
     860,   861,   871,   881,   884,   886,   891,   890,   923,   924,
     928,   929,   934,   935,   939,   940,   944,   945,   946,   947,
     948,   949,   950,   951,   952,   953,   954,   958,   963,   965,
     970,   972,   974,   978,   986,   987,   991,   996,   997,  1001,
    1002,  1002,  1017,  1018,  1022,  1023,  1024,  1025,  1026,  1027,
    1033,  1032,  1037,  1043,  1042,  1050,  1051,  1054,  1060,  1065,
    1064,  1074,  1075,  1079,  1080,  1087,  1089,  1096,  1102,  1103,
    1115,  1119,  1121,  1122,  1123,  1127,  1128,  1132,  1133,  1137,
    1145,  1147,  1156,  1163,  1172,  1182,  1183,  1188,  1189,  1190,
    1191,  1192,  1192,  1209,  1213,  1213,  1221,  1222,  1222,  1229,
    1233,  1234,  1240,  1242,  1243,  1244,  1245,  1246,  1250,  1251,
    1252,  1253,  1254,  1258,  1269,  1271,  1273,  1275,  1277,  1279,
    1281,  1283,  1285,  1287,  1289,  1291,  1293,  1296,  1298,  1302,
    1304,  1306,  1309,  1316,  1315,  1324,  1325,  1326,  1327,  1332,
    1333,  1334,  1338,  1339,  1340,  1341,  1342,  1343,  1344,  1345,
    1346,  1347,  1348,  1349,  1350,  1351,  1352,  1353,  1354,  1355,
    1356,  1357,  1358,  1359,  1360,  1364,  1364,  1372,  1377,  1378,
    1379,  1380,  1381,  1382,  1383,  1384,  1385,  1386,  1387,  1388,
    1389,  1394,  1403,  1404,  1405,  1406,  1411,  1412,  1413,  1419,
    1418,  1428,  1429,  1436,  1443,  1445,  1449,  1453,  1454,  1458,
    1459,  1460,  1463,  1467,  1474,  1476,  1483,  1484,  1488,  1489,
    1493,  1495,  1497,  1502,  1504,  1506,  1511,  1512,  1516,  1517,
    1518,  1519,  1520,  1521,  1525,  1526,  1530,  1531,  1535,  1536,
    1540,  1541,  1548,  1555,  1556,  1557,  1561,  1562,  1566,  1567,
    1571,  1572,  1576,  1577,  1580,  1580,  1587,  1587,  1595,  1596,
    1599,  1599,  1605,  1610,  1615,  1616,  1620,  1621,  1622,  1623,
    1624,  1628,  1629,  1630,  1631,  1635,  1636
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
  "ADV_ARROW", "NEW", "ADV_INVOCANT", "NAMESPACE", "ENDNAMESPACE",
  "DOT_METHOD", "SUB", "SYM", "LOCAL", "LEXICAL", "CONST", "INC", "DEC",
  "GLOBAL_CONST", "PLUS_ASSIGN", "MINUS_ASSIGN", "MUL_ASSIGN",
  "DIV_ASSIGN", "CONCAT_ASSIGN", "BAND_ASSIGN", "BOR_ASSIGN",
  "BXOR_ASSIGN", "FDIV", "FDIV_ASSIGN", "MOD_ASSIGN", "SHR_ASSIGN",
  "SHL_ASSIGN", "SHR_U_ASSIGN", "SHIFT_LEFT", "SHIFT_RIGHT", "INTV",
  "FLOATV", "STRINGV", "PMCV", "LOG_XOR", "RELOP_EQ", "RELOP_NE",
  "RELOP_GT", "RELOP_GTE", "RELOP_LT", "RELOP_LTE", "GLOBAL", "GLOBALOP",
  "ADDR", "RESULT", "RETURN", "YIELDT", "GET_RESULTS", "POW",
  "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", "DOTDOT",
  "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB", "PCC_BEGIN_RETURN",
  "PCC_END_RETURN", "PCC_BEGIN_YIELD", "PCC_END_YIELD", "NCI_CALL",
  "METH_CALL", "INVOCANT", "MAIN", "LOAD", "INIT", "IMMEDIATE", "POSTCOMP",
  "METHOD", "ANON", "OUTER", "NEED_LEX", "MULTI", "VTABLE_METHOD",
  "LOADLIB", "UNIQUE_REG", "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG",
  "PREG", "IDENTIFIER", "REG", "MACRO", "ENDM", "STRINGC", "INTC",
  "FLOATC", "USTRINGC", "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT",
  "DOT", "CONCAT", "'='", "'['", "']'", "'('", "')'", "'!'", "'~'", "'-'",
  "'+'", "'*'", "'/'", "'%'", "'&'", "'|'", "';'", "$accept", "program",
  "compilation_units", "compilation_unit", "pragma", "pragma_1", "hll_def",
  "constdef", "@1", "pmc_const", "@2", "any_string", "pasmcode",
  "pasmline", "pasm_inst", "@3", "@4", "pasm_args", "emit", "@5",
  "opt_pasmcode", "class_namespace", "maybe_ns", "sub", "@6", "@7", "@8",
  "sub_params", "sub_param", "@9", "sub_param_type_def", "multi", "outer",
  "vtable", "multi_types", "multi_type", "sub_body", "pcc_sub_call", "@10",
  "opt_label", "opt_invocant", "sub_proto", "sub_proto_list", "proto",
  "pcc_call", "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@11",
  "paramtype_list", "paramtype", "pcc_ret", "@12", "pcc_yield", "@13",
  "pcc_returns", "pcc_return", "pcc_return_many", "@14", "return_or_yield",
  "var_returns", "statements", "helper_clear_state", "statement", "labels",
  "_labels", "label", "instruction", "id_list", "id_list_id",
  "opt_unique_reg", "labeled_inst", "@15", "@16", "@17", "type",
  "classname", "assignment", "@18", "un_op", "bin_op", "get_results",
  "@19", "op_assign", "assign_op", "func_assign", "the_sub", "sub_call",
  "@20", "arglist", "arg", "argtype_list", "argtype", "result",
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
     364,   365,   366,   367,   368,   369,   370,   371,   372,   373,
      61,    91,    93,    40,    41,    33,   126,    45,    43,    42,
      47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   135,   136,   137,   137,   138,   138,   138,   138,   138,
     138,   138,   139,   139,   139,   140,   141,   141,   143,   142,
     145,   144,   146,   146,   147,   147,   148,   148,   148,   148,
     148,   148,   148,   150,   149,   151,   149,   149,   149,   149,
     152,   154,   153,   155,   155,   156,   157,   157,   159,   160,
     161,   158,   162,   162,   162,   164,   163,   165,   165,   166,
     167,   167,   168,   168,   169,   169,   169,   170,   170,   170,
     170,   170,   170,   170,   171,   171,   173,   172,   174,   174,
     175,   175,   176,   176,   177,   177,   178,   178,   178,   178,
     178,   178,   178,   178,   178,   178,   178,   179,   179,   179,
     179,   179,   179,   179,   180,   180,   181,   182,   182,   183,
     184,   183,   185,   185,   186,   186,   186,   186,   186,   186,
     188,   187,   187,   190,   189,   191,   191,   191,   192,   194,
     193,   195,   195,   196,   196,   196,   196,   196,   197,   197,
     198,   199,   199,   199,   199,   200,   200,   201,   201,   202,
     203,   203,   204,   204,   205,   206,   206,   207,   207,   207,
     207,   208,   207,   207,   209,   207,   207,   210,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   211,   211,
     211,   211,   211,   212,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   214,   213,   213,   213,   213,   213,   215,
     215,   215,   216,   216,   216,   216,   216,   216,   216,   216,
     216,   216,   216,   216,   216,   216,   216,   216,   216,   216,
     216,   216,   216,   216,   216,   218,   217,   219,   220,   220,
     220,   220,   220,   220,   220,   220,   220,   220,   220,   220,
     220,   221,   222,   222,   222,   222,   222,   222,   222,   224,
     223,   225,   225,   225,   225,   225,   226,   227,   227,   228,
     228,   228,   229,   230,   230,   230,   230,   230,   231,   231,
     232,   232,   232,   233,   233,   233,   234,   234,   235,   235,
     235,   235,   235,   235,   236,   236,   237,   237,   238,   238,
     239,   239,   239,   240,   240,   240,   241,   241,   242,   242,
     243,   243,   244,   244,   246,   245,   248,   247,   249,   249,
     250,   249,   251,   251,   251,   251,   252,   252,   252,   252,
     252,   253,   253,   253,   253,   254,   254
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     2,
       1,     1,     3,     2,     3,     2,     4,     4,     0,     6,
       0,     6,     1,     1,     1,     2,     3,     2,     1,     1,
       1,     1,     1,     0,     3,     0,     4,     2,     4,     0,
       1,     0,     4,     0,     1,     3,     3,     0,     0,     0,
       0,    10,     0,     1,     3,     0,     3,     3,     5,     4,
       4,     4,     1,     4,     0,     3,     1,     1,     1,     1,
       1,     1,     1,     3,     0,     1,     0,     9,     0,     2,
       0,     3,     0,     1,     1,     2,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     5,     3,     3,
       3,     3,     5,     5,     0,     3,     2,     0,     3,     3,
       0,     4,     0,     2,     1,     1,     1,     1,     4,     1,
       0,     5,     1,     0,     5,     0,     2,     3,     3,     0,
       5,     1,     1,     0,     1,     3,     3,     5,     1,     2,
       0,     2,     2,     1,     1,     0,     1,     2,     1,     1,
       3,     2,     1,     3,     2,     0,     1,     1,     1,     2,
       2,     0,     4,     4,     0,     6,     1,     0,     6,     2,
       2,     2,     2,     1,     1,     1,     1,     0,     1,     1,
       1,     1,     1,     1,     3,     4,     5,     6,     6,     6,
       7,     4,     4,     6,     6,     7,     4,     4,     4,     4,
       6,     7,     3,     0,     9,     1,     1,     1,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     0,     5,     3,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     4,     1,     1,     1,     1,     3,     3,     3,     0,
       5,     0,     3,     1,     5,     3,     2,     0,     2,     1,
       1,     4,     2,     3,     5,     1,     3,     0,     1,     1,
       6,     5,     4,     4,     6,     5,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     0,     1,     3,     1,
       1,     4,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     0,     2,     0,     2,     1,     3,
       0,     4,     1,     3,     2,     2,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    11,     0,     0,     0,    47,    48,    18,     0,    41,
       0,     0,     2,     3,    10,     0,     6,     8,     5,     7,
       0,     0,     0,     0,   314,     0,     0,     0,     0,   145,
       9,     1,     4,    13,    15,    12,     0,     0,     0,     0,
      45,   306,   304,   305,   307,    49,   303,   178,   179,   180,
     181,   183,     0,   182,    14,    20,   149,     0,    29,    28,
      32,    31,   145,    24,     0,    30,    33,   146,   148,    16,
      17,    46,     0,   326,   327,   328,   329,   330,   333,   331,
     332,   334,   294,   312,   322,   315,   318,   295,   313,    82,
       0,     0,    27,    25,    42,     0,     0,    35,     0,     0,
     147,   324,   325,   320,     0,    88,    86,    87,    89,    90,
      92,    91,     0,    93,     0,    62,    94,    95,    96,     0,
      83,    84,     0,     0,    37,     0,    82,    26,   296,   323,
       0,   319,     0,    64,     0,    50,    85,    19,   308,   309,
     310,     0,   311,     0,     0,   316,    34,   312,    40,   297,
     299,   300,   321,     0,     0,    67,    68,    70,    69,    71,
      72,   314,     0,    66,     0,    52,     0,    38,    36,     0,
       0,   314,     0,    61,    60,     0,     0,    59,    63,    53,
     140,    22,    23,    21,   302,   317,     0,   298,    73,    65,
      55,     0,   144,   143,     0,     0,   140,     0,   138,   301,
       0,   142,    54,    51,   139,     0,   177,   141,    56,     0,
     151,     0,     0,     0,     0,     0,     0,     0,   161,     0,
     164,   167,     0,   131,   132,   235,     0,     0,     0,   252,
     253,   254,   296,   203,   166,   174,   175,   176,   122,     0,
       0,   157,   205,   206,   207,   259,   173,   158,   279,   278,
     255,   112,     0,   170,     0,     0,     0,     0,   172,     0,
     159,   160,     0,     0,     0,     0,   335,   336,     0,   169,
     255,     0,    76,   120,   123,   171,   277,   129,   150,     0,
     238,   239,   240,   241,   244,   245,   246,   247,   243,   242,
     248,   249,   250,     0,     0,   314,     0,    57,     0,     0,
     287,   288,   289,   290,   291,   292,   293,   286,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   277,
     104,   125,   125,     0,   275,     0,   112,   133,   261,   257,
     258,   256,   208,     0,     0,     0,   333,   334,   296,   209,
     210,   211,     0,   202,   312,   184,     0,   237,   114,   115,
     116,   117,   119,   113,   112,     0,   283,     0,     0,   282,
       0,   199,   155,   162,   152,   163,     0,     0,   198,     0,
      80,     0,     0,     0,     0,     0,   272,   333,     0,   134,
     267,   333,     0,   263,   314,   191,   192,   197,   196,   251,
     185,   217,   226,   227,   231,   220,   221,   222,   223,   224,
     225,   218,   228,   229,   230,   219,   314,   234,   212,   213,
     214,   215,   216,   232,   233,     0,     0,     0,    58,   285,
       0,   281,     0,     0,   314,   156,   154,     0,     0,     0,
     236,     0,     0,     0,     0,   126,     0,   121,     0,   124,
     276,     0,   273,     0,     0,     0,   130,   266,     0,     0,
     260,     0,     0,   314,     0,   314,     0,   186,     0,     0,
     284,   280,   200,     0,   153,   165,   168,   106,     0,     0,
       0,     0,    78,   105,   267,   127,     0,     0,   135,   333,
     136,   269,   270,   268,   265,   333,   262,   193,   189,     0,
     194,     0,   187,   188,   118,   201,    81,     0,     0,     0,
       0,   107,     0,   128,   274,   261,     0,     0,     0,   190,
     195,    98,     0,    99,   101,     0,   100,     0,     0,    79,
       0,   137,     0,   264,     0,     0,     0,   110,     0,    77,
       0,   204,   271,    97,   103,   102,     0,   112,   108,     0,
     109,   111
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    11,    12,    13,    14,    21,    15,    16,    27,    61,
      91,   183,    62,    63,    98,    99,   126,   146,    17,    29,
      64,    18,    25,    19,    26,    89,   165,   180,   194,   200,
     208,   116,   117,   118,   162,   163,   195,   235,   320,   501,
     433,   119,   120,   121,   472,   370,   434,   518,   530,   536,
     297,   353,   236,   321,   237,   322,   371,   438,   238,   327,
     239,   378,   196,   197,   198,    66,    67,    68,   207,   363,
     364,   426,   240,   262,   264,   265,    52,    53,   241,   276,
     342,   415,   242,   271,   243,   296,   244,   245,   246,   279,
     382,   383,   447,   483,   324,   325,   247,   248,   249,   308,
     309,    83,   148,   149,   150,    45,    46,   140,   151,   380,
      38,    39,   169,   170,    85,   130,    86,    87,    88,   268
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -419
static const yytype_int16 yypact[] =
{
     326,  -419,    33,   -86,   -60,   -70,  -419,  -419,   -58,  -419,
      57,    95,   326,  -419,  -419,   121,  -419,  -419,  -419,  -419,
      28,   157,    39,    91,  -419,   168,   122,   136,   192,    63,
    -419,  -419,  -419,  -419,  -419,  -419,    92,   100,    89,   276,
    -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,
    -419,  -419,   120,  -419,  -419,  -419,  -419,   223,  -419,  -419,
    -419,  -419,   189,  -419,   153,  -419,    44,   179,  -419,  -419,
    -419,  -419,   425,  -419,  -419,  -419,  -419,  -419,  -419,  -419,
    -419,  -419,  -419,  -419,   182,   -57,  -419,  -419,  -419,   172,
     160,   170,  -419,  -419,  -419,   425,   173,  -419,   278,   178,
    -419,  -419,   425,  -419,   276,  -419,  -419,  -419,  -419,  -419,
    -419,  -419,   161,  -419,   164,   181,  -419,  -419,  -419,   289,
     172,  -419,   134,   484,  -419,   229,   172,  -419,   410,  -419,
     276,  -419,     3,   131,   185,  -419,  -419,  -419,  -419,  -419,
    -419,   176,  -419,   195,   208,  -419,  -419,   187,  -419,   237,
    -419,  -419,  -419,   197,   198,  -419,  -419,  -419,  -419,  -419,
    -419,  -419,   -62,  -419,   212,   315,   140,  -419,  -419,   215,
     276,  -419,   410,  -419,  -419,   222,   131,  -419,  -419,  -419,
      27,  -419,  -419,  -419,  -419,   -57,   233,  -419,  -419,  -419,
    -419,   353,  -419,  -419,   354,   290,    84,    13,  -419,  -419,
     136,  -419,  -419,  -419,  -419,   361,   210,  -419,  -419,    31,
    -419,   -46,    43,   257,   425,   224,   260,   265,  -419,   263,
     264,  -419,    81,   554,  -419,  -419,   370,   373,   378,  -419,
    -419,  -419,   410,  -419,  -419,  -419,  -419,  -419,  -419,   262,
     386,  -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,
     464,  -419,   372,  -419,   425,   149,   425,   149,  -419,   322,
    -419,  -419,   136,   336,   136,   136,  -419,  -419,   291,  -419,
     280,   287,  -419,  -419,  -419,  -419,   238,  -419,  -419,   293,
    -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,
    -419,  -419,  -419,   347,   333,  -419,   425,    12,   308,   407,
    -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,   -46,   425,
     408,   -46,   425,   425,   314,   224,   316,   318,   425,   238,
    -419,  -419,  -419,   401,  -419,   -54,  -419,   498,   512,  -419,
    -419,  -419,  -419,   458,    81,   319,   304,   305,   410,  -419,
    -419,  -419,   425,  -419,   107,   426,   307,  -419,  -419,  -419,
    -419,   309,  -419,  -419,  -419,   -46,  -419,   423,   -46,  -419,
     431,   -18,   344,   383,  -419,  -419,   343,   345,  -419,   -50,
       0,    49,    17,   224,   297,   346,    12,   436,   -28,  -419,
    -419,   444,   -27,  -419,  -419,   -17,   -13,  -419,  -419,  -419,
    -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,
    -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,
    -419,  -419,  -419,  -419,  -419,   425,   350,   362,    12,  -419,
     -46,  -419,   -46,   425,  -419,  -419,  -419,   314,   134,   134,
    -419,   425,   425,    93,   467,  -419,   425,  -419,   473,  -419,
    -419,   459,  -419,   554,   425,   526,  -419,   184,   425,   540,
    -419,   365,   425,  -419,   425,  -419,   366,  -419,   425,   367,
    -419,  -419,  -419,   368,  -419,  -419,  -419,  -419,   485,   425,
     425,   568,   179,  -419,  -419,  -419,   224,   369,  -419,   486,
    -419,  -419,   395,  -419,  -419,   499,  -419,  -419,  -419,   371,
    -419,   404,  -419,  -419,  -419,  -419,  -419,     4,   529,    15,
      34,  -419,   530,   184,  -419,   512,   425,   429,   425,  -419,
    -419,  -419,   425,  -419,  -419,   425,  -419,   425,   102,  -419,
     -23,  -419,   417,  -419,   538,   539,   542,  -419,   224,  -419,
     544,  -419,  -419,  -419,  -419,  -419,   136,  -419,  -419,   314,
      12,  -419
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -419,  -419,  -419,   532,   103,  -419,  -419,  -419,  -419,   360,
    -419,  -419,  -419,   487,  -419,  -419,  -419,   213,  -419,  -419,
    -419,   105,  -419,  -419,  -419,  -419,  -419,  -419,  -419,  -419,
    -419,  -419,  -419,  -419,  -419,   374,  -419,  -419,  -419,  -419,
    -419,   441,  -419,   452,  -419,  -419,  -419,  -419,  -419,  -419,
    -319,  -419,  -419,  -419,  -419,  -419,   252,  -419,  -419,  -419,
    -419,  -419,  -419,  -419,   379,   380,  -419,   -66,  -419,  -419,
    -418,  -419,  -419,  -419,  -419,  -419,  -198,   243,  -419,  -419,
    -419,  -419,  -419,  -419,  -419,  -419,  -419,   135,  -211,  -419,
      75,  -307,   109,  -419,   207,   273,  -419,  -419,  -419,   349,
     355,  -125,   375,  -419,   421,  -419,   311,  -206,   495,   -39,
    -155,  -419,  -419,  -419,   450,  -419,   -91,  -419,  -118,   292
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -256
static const yytype_int16 yytable[] =
{
      84,   100,   209,   147,   137,   253,   175,   376,   511,   464,
     176,   431,   269,   131,   205,   103,   186,  -145,   374,   514,
     379,   435,   374,  -145,    22,  -145,  -145,  -145,   348,   349,
     350,   351,   190,   101,  -145,   418,  -145,  -145,   516,   152,
      20,  -145,  -145,  -145,   445,   449,  -145,   147,   -39,   449,
      23,    24,    28,   435,   423,   452,   124,   254,    95,   454,
     138,    30,   177,   129,   314,    84,   316,   317,   139,     2,
     375,     3,     4,    96,   430,  -145,   512,   104,  -145,  -145,
    -145,   250,   436,   343,   142,   432,     5,   515,  -145,   142,
     259,    84,  -145,    55,  -145,    31,   446,   450,   270,   439,
     -74,   531,   356,   424,   453,   359,   517,   147,   455,   153,
     352,    36,    56,   154,   436,  -145,  -145,  -145,  -145,  -145,
    -145,   541,    97,  -145,   467,    33,  -145,  -145,  -145,   437,
     527,    84,    60,   142,    65,   191,  -145,   251,   480,    34,
     346,   252,   486,   192,   193,    73,    74,    75,    76,   419,
      77,   326,   421,    78,    79,    80,    81,   -75,    82,   300,
       8,    35,    56,    37,   -43,    60,   528,    65,   330,   344,
     469,    57,    40,   255,   257,   258,   470,   471,   529,    58,
      59,   155,   156,   157,   158,   266,    47,    48,    49,    50,
     365,   267,   191,   142,   326,     2,    54,     3,     4,   481,
     192,   193,    69,   482,   301,   302,   303,   304,   305,   306,
      70,    71,     5,   147,   460,   299,   461,   310,   540,    55,
     211,   307,   212,   213,   214,   293,    90,    92,    41,   451,
    -255,   215,    42,   216,   217,    43,    44,   159,   218,   219,
     220,   160,    51,   221,    78,    79,    80,    81,   440,   326,
     181,   456,   161,   182,    94,   345,   102,   347,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   463,
     357,   256,   222,   360,   361,   223,   224,   225,    56,   368,
     122,   123,   127,   125,   132,   226,     8,   133,    56,   227,
     -44,   228,   128,   135,   386,   164,   166,    57,   489,   142,
     491,   143,   167,   390,   134,    58,    59,   168,   171,   172,
     465,   466,    73,    74,    75,    76,   229,    77,   270,   179,
     230,   173,   174,   231,   232,    82,    73,    74,    75,    76,
       1,    77,     2,   233,     3,     4,   178,   184,   539,    82,
      73,    74,    75,    76,   188,    77,   500,   332,   323,     5,
      72,   504,     6,    82,   333,   199,     7,   201,   202,    73,
      74,    75,    76,   203,    77,   210,   260,    78,    79,    80,
      81,   261,    82,   263,   272,   -20,   457,   273,    73,    74,
      75,    76,   274,    77,   462,   277,    78,    79,    80,    81,
     278,    82,   298,   468,   313,   334,   335,   474,   293,    73,
      74,    75,    76,   537,    77,   478,   502,   441,   315,   484,
     319,   318,    82,   488,   354,   490,   328,   355,   358,   493,
     362,   373,   366,     8,   367,   388,     9,  -253,  -254,   416,
     497,   498,   417,   420,    10,    73,    74,    75,    76,   229,
      77,   422,   425,   336,    79,    80,   337,   338,    82,    73,
      74,    75,    76,    41,    77,   427,   444,   329,   339,   340,
     341,    44,    82,   428,   448,   429,   443,   521,   391,   523,
     458,   473,   459,   524,   392,   393,   525,   475,   526,   476,
     394,   395,   396,   397,   398,   399,   400,   487,   492,   496,
     495,   494,   505,   509,   401,   402,   403,   404,   280,   281,
     282,   283,   284,   285,   286,   287,   506,   288,   289,   290,
     291,   292,    73,    74,    75,    76,   138,    77,   507,   508,
      78,    79,    80,    81,   139,    82,   510,    73,    74,    75,
      76,   145,    77,   513,   519,    78,    79,    80,    81,   522,
      82,   532,   533,   534,    32,   405,   535,   406,   538,    93,
     189,   389,   407,   408,   409,   410,   411,   412,   413,   414,
      73,    74,    75,    76,    51,    77,   234,   144,    78,    79,
      80,    81,   136,    82,   372,   204,   385,   206,   477,   384,
     520,   442,   293,   503,   294,   295,    73,    74,    75,    76,
     138,    77,   369,   187,    78,    79,    80,    81,   139,    82,
      73,    74,    75,    76,   331,    77,   311,   275,   377,    79,
      80,    81,   312,    82,    73,    74,    75,    76,   141,    77,
     185,     0,   381,    79,    80,    81,   387,    82,    73,    74,
      75,    76,     0,    77,     0,     0,   479,    79,    80,    81,
       0,    82,    73,    74,    75,    76,     0,    77,     0,     0,
     485,    79,    80,    81,     0,    82,    73,    74,    75,    76,
     229,    77,     0,     0,   230,     0,     0,   231,     0,    82,
      73,    74,    75,    76,     0,    77,     0,     0,   499,     0,
       0,     0,     0,    82
};

static const yytype_int16 yycheck[] =
{
      39,    67,   200,   128,   122,   211,   161,   326,     4,   427,
      72,    11,   223,   104,     1,    72,   171,     4,    72,     4,
     327,     4,    72,    10,   110,    12,    13,    14,    16,    17,
      18,    19,     5,    72,    21,   354,    23,    24,     4,   130,
       7,    28,    29,    30,    72,    72,    33,   172,     4,    72,
     110,   121,   110,     4,    72,    72,    95,    14,    14,    72,
     106,     4,   124,   102,   262,   104,   264,   265,   114,     6,
     124,     8,     9,    29,   124,    62,    72,   134,    65,    66,
      67,   206,    65,   294,   123,    85,    23,    72,    75,   128,
     215,   130,    79,    30,    81,     0,   124,   124,   223,    82,
      73,   124,   308,   121,   121,   311,    72,   232,   121,   106,
      98,    72,    99,   110,    65,   102,   103,   104,   105,   106,
     107,   539,    78,   110,   431,     4,   113,   114,   115,    80,
      28,   170,    29,   172,    29,   108,   123,   106,   445,   111,
     295,   110,   449,   116,   117,   102,   103,   104,   105,   355,
     107,   276,   358,   110,   111,   112,   113,    73,   115,    10,
      97,     4,    99,    72,   101,    62,    64,    62,   293,   294,
      77,   108,     4,   212,   213,   214,    83,    84,    76,   116,
     117,    50,    51,    52,    53,   104,    50,    51,    52,    53,
     315,   110,   108,   232,   319,     6,     4,     8,     9,    15,
     116,   117,   110,    19,    55,    56,    57,    58,    59,    60,
     110,   122,    23,   338,   420,   254,   422,   256,   537,    30,
      10,    72,    12,    13,    14,   118,   106,     4,   106,   384,
     123,    21,   110,    23,    24,   113,   114,   106,    28,    29,
      30,   110,   106,    33,   110,   111,   112,   113,   373,   374,
     110,   406,   121,   113,   101,   294,    74,   296,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,    96,   424,
     309,    14,    62,   312,   313,    65,    66,    67,    99,   318,
     120,   111,     4,   110,   123,    75,    97,   123,    99,    79,
     101,    81,   114,     4,   333,   110,   120,   108,   453,   338,
     455,    72,   107,   342,   123,   116,   117,    99,   121,    72,
     428,   429,   102,   103,   104,   105,   106,   107,   443,     4,
     110,   124,   124,   113,   114,   115,   102,   103,   104,   105,
       4,   107,     6,   123,     8,     9,   124,   122,   536,   115,
     102,   103,   104,   105,   122,   107,   471,    14,   110,    23,
      74,   476,    26,   115,    21,   122,    30,     4,     4,   102,
     103,   104,   105,    73,   107,     4,   106,   110,   111,   112,
     113,   106,   115,   110,     4,   111,   415,     4,   102,   103,
     104,   105,     4,   107,   423,   123,   110,   111,   112,   113,
       4,   115,    20,   432,    72,    62,    63,   436,   118,   102,
     103,   104,   105,   528,   107,   444,   472,   110,    72,   448,
     123,   120,   115,   452,   106,   454,   123,    10,    10,   458,
     106,    20,   106,    97,   106,   106,   100,   123,   123,   122,
     469,   470,   123,    10,   108,   102,   103,   104,   105,   106,
     107,    10,    98,   110,   111,   112,   113,   114,   115,   102,
     103,   104,   105,   106,   107,    72,    20,   110,   125,   126,
     127,   114,   115,   120,    20,   120,   120,   506,    42,   508,
     120,     4,   110,   512,    48,    49,   515,     4,   517,    20,
      54,    55,    56,    57,    58,    59,    60,   122,   122,     4,
     122,   124,   123,   122,    68,    69,    70,    71,    34,    35,
      36,    37,    38,    39,    40,    41,    20,    43,    44,    45,
      46,    47,   102,   103,   104,   105,   106,   107,   123,    20,
     110,   111,   112,   113,   114,   115,   122,   102,   103,   104,
     105,   121,   107,     4,     4,   110,   111,   112,   113,   110,
     115,   124,     4,     4,    12,   119,     4,   121,     4,    62,
     176,   338,   126,   127,   128,   129,   130,   131,   132,   133,
     102,   103,   104,   105,   106,   107,   206,   126,   110,   111,
     112,   113,   120,   115,   322,   196,   333,   197,   443,   121,
     505,   374,   118,   474,   120,   121,   102,   103,   104,   105,
     106,   107,   319,   172,   110,   111,   112,   113,   114,   115,
     102,   103,   104,   105,   293,   107,   257,   232,   110,   111,
     112,   113,   257,   115,   102,   103,   104,   105,   123,   107,
     170,    -1,   110,   111,   112,   113,   334,   115,   102,   103,
     104,   105,    -1,   107,    -1,    -1,   110,   111,   112,   113,
      -1,   115,   102,   103,   104,   105,    -1,   107,    -1,    -1,
     110,   111,   112,   113,    -1,   115,   102,   103,   104,   105,
     106,   107,    -1,    -1,   110,    -1,    -1,   113,    -1,   115,
     102,   103,   104,   105,    -1,   107,    -1,    -1,   110,    -1,
      -1,    -1,    -1,   115
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,     6,     8,     9,    23,    26,    30,    97,   100,
     108,   136,   137,   138,   139,   141,   142,   153,   156,   158,
       7,   140,   110,   110,   121,   157,   159,   143,   110,   154,
       4,     0,   138,     4,   111,     4,    72,    72,   245,   246,
       4,   106,   110,   113,   114,   240,   241,    50,    51,    52,
      53,   106,   211,   212,     4,    30,    99,   108,   116,   117,
     139,   144,   147,   148,   155,   156,   200,   201,   202,   110,
     110,   122,    74,   102,   103,   104,   105,   107,   110,   111,
     112,   113,   115,   236,   244,   249,   251,   252,   253,   160,
     106,   145,     4,   148,   101,    14,    29,    78,   149,   150,
     202,   244,    74,    72,   134,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,   166,   167,   168,   176,
     177,   178,   120,   111,   244,   110,   151,     4,   114,   244,
     250,   251,   123,   123,   123,     4,   178,   253,   106,   114,
     242,   243,   244,    72,   176,   121,   152,   236,   237,   238,
     239,   243,   251,   106,   110,    50,    51,    52,    53,   106,
     110,   121,   169,   170,   110,   161,   120,   107,    99,   247,
     248,   121,    72,   124,   124,   245,    72,   124,   124,     4,
     162,   110,   113,   146,   122,   249,   245,   239,   122,   170,
       5,   108,   116,   117,   163,   171,   197,   198,   199,   122,
     164,     4,     4,    73,   199,     1,   200,   203,   165,   211,
       4,    10,    12,    13,    14,    21,    23,    24,    28,    29,
      30,    33,    62,    65,    66,    67,    75,    79,    81,   106,
     110,   113,   114,   123,   144,   172,   187,   189,   193,   195,
     207,   213,   217,   219,   221,   222,   223,   231,   232,   233,
     236,   106,   110,   242,    14,   244,    14,   244,   244,   236,
     106,   106,   208,   110,   209,   210,   104,   110,   254,   223,
     236,   218,     4,     4,     4,   237,   214,   123,     4,   224,
      34,    35,    36,    37,    38,    39,    40,    41,    43,    44,
      45,    46,    47,   118,   120,   121,   220,   185,    20,   244,
      10,    55,    56,    57,    58,    59,    60,    72,   234,   235,
     244,   234,   235,    72,   211,    72,   211,   211,   120,   123,
     173,   188,   190,   110,   229,   230,   236,   194,   123,   110,
     236,   241,    14,    21,    62,    63,   110,   113,   114,   125,
     126,   127,   215,   223,   236,   244,   245,   244,    16,    17,
      18,    19,    98,   186,   106,    10,   242,   244,    10,   242,
     244,   244,   106,   204,   205,   236,   106,   106,   244,   230,
     180,   191,   191,    20,    72,   124,   185,   110,   196,   226,
     244,   110,   225,   226,   121,   212,   244,   254,   106,   152,
     244,    42,    48,    49,    54,    55,    56,    57,    58,    59,
      60,    68,    69,    70,    71,   119,   121,   126,   127,   128,
     129,   130,   131,   132,   133,   216,   122,   123,   185,   242,
      10,   242,    10,    72,   121,    98,   206,    72,   120,   120,
     124,    11,    85,   175,   181,     4,    65,    80,   192,    82,
     236,   110,   229,   120,    20,    72,   124,   227,    20,    72,
     124,   245,    72,   121,    72,   121,   245,   244,   120,   110,
     242,   242,   244,   245,   205,   253,   253,   226,   244,    77,
      83,    84,   179,     4,   244,     4,    20,   222,   244,   110,
     226,    15,    19,   228,   244,   110,   226,   122,   244,   245,
     244,   245,   122,   244,   124,   122,     4,   244,   244,   110,
     236,   174,   202,   227,   236,   123,    20,   123,    20,   122,
     122,     4,    72,     4,     4,    72,     4,    72,   182,     4,
     225,   244,   110,   244,   244,   244,   244,    28,    64,    76,
     183,   124,   124,     4,     4,     4,   184,   236,     4,   211,
     185,   205
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
#line 613 "compilers/imcc/imcc.y"
    { if (yynerrs) YYABORT; (yyval.i) = 0; ;}
    break;

  case 5:
#line 622 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 6:
#line 623 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 7:
#line 624 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i);
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                     IMCC_INFO(interp)->cur_unit = 0; ;}
    break;

  case 8:
#line 627 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i);
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                     IMCC_INFO(interp)->cur_unit = 0; ;}
    break;

  case 9:
#line 630 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 10:
#line 631 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 11:
#line 632 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 12:
#line 635 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 13:
#line 636 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 14:
#line 637 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; do_loadlib(interp, (yyvsp[(2) - (3)].s)); ;}
    break;

  case 15:
#line 641 "compilers/imcc/imcc.y"
    { if ((yyvsp[(2) - (2)].s))
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    ;}
    break;

  case 16:
#line 649 "compilers/imcc/imcc.y"
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
#line 662 "compilers/imcc/imcc.y"
    {
            int built_in_type = 0;
            int language_type = 0;

            STRING *built_in_name = string_unescape_cstring(interp, (yyvsp[(2) - (4)].s) + 1, '"', NULL);
            STRING *language_name = string_unescape_cstring(interp, (yyvsp[(4) - (4)].s) + 1, '"', NULL);
            built_in_type = pmc_type(interp, built_in_name);
            language_type = pmc_type(interp, language_name);

            /*
            fprintf(stderr, "built in type is: %d, language type is: %d\n", built_in_type, language_type);
            */
            Parrot_register_HLL_type(interp,
                 CONTEXT(((Interp *)interp)->ctx)->current_HLL, built_in_type, language_type);
            (yyval.t) = 0;
         ;}
    break;

  case 18:
#line 681 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 19:
#line 682 "compilers/imcc/imcc.y"
    {
                    SymReg *ignored;
                    ignored = mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1);
                    UNUSED(ignored);
                    is_def=0;
                ;}
    break;

  case 20:
#line 691 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 21:
#line 692 "compilers/imcc/imcc.y"
    { (yyval.i) = mk_pmc_const(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].s)); is_def=0; ;}
    break;

  case 26:
#line 705 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 27:
#line 706 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 28:
#line 707 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 29:
#line 708 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 30:
#line 709 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 33:
#line 714 "compilers/imcc/imcc.y"
    { clear_state(interp); ;}
    break;

  case 34:
#line 716 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit,
                              (yyvsp[(2) - (3)].s), 0, IMCC_INFO(interp)->regs,
                              IMCC_INFO(interp)->nargs, IMCC_INFO(interp) -> keyvec, 1);
                     free((yyvsp[(2) - (3)].s)); ;}
    break;

  case 35:
#line 721 "compilers/imcc/imcc.y"
    {
                    imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                    IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM);
                    ;}
    break;

  case 36:
#line 726 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit,
                                mk_sub_label(interp, (yyvsp[(4) - (4)].s)));
                     IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(3) - (4)].t);
                   ;}
    break;

  case 37:
#line 732 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(2) - (2)].sr)); ;}
    break;

  case 38:
#line 734 "compilers/imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, (yyvsp[(4) - (4)].s));
                       set_lexical(interp, r, (yyvsp[(2) - (4)].s)); (yyval.i) = 0;
                   ;}
    break;

  case 39:
#line 738 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;;}
    break;

  case 41:
#line 746 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM); ;}
    break;

  case 42:
#line 748 "compilers/imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     (yyval.i)=0; ;}
    break;

  case 45:
#line 763 "compilers/imcc/imcc.y"
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
#line 777 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); ;}
    break;

  case 47:
#line 778 "compilers/imcc/imcc.y"
    { (yyval.sr) = NULL; ;}
    break;

  case 48:
#line 783 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        ;}
    break;

  case 49:
#line 787 "compilers/imcc/imcc.y"
    {
          iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (3)].sr));
        ;}
    break;

  case 50:
#line 790 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(5) - (6)].t); ;}
    break;

  case 51:
#line 792 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 52:
#line 796 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 53:
#line 797 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 54:
#line 798 "compilers/imcc/imcc.y"
    {
       if (IMCC_INFO(interp)->adv_named_id) {
             add_pcc_named_param(interp, IMCC_INFO(interp)->cur_call,
                                 IMCC_INFO(interp)->adv_named_id, (yyvsp[(2) - (3)].sr));
             IMCC_INFO(interp)->adv_named_id = NULL;
         }
         else add_pcc_param(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
   ;}
    break;

  case 55:
#line 809 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 56:
#line 809 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(3) - (3)].sr); is_def=0; ;}
    break;

  case 57:
#line 813 "compilers/imcc/imcc.y"
    { if ((yyvsp[(3) - (3)].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
                                         (yyval.sr)->type |= (yyvsp[(3) - (3)].t); ;}
    break;

  case 58:
#line 818 "compilers/imcc/imcc.y"
    {
                                         if ((yyvsp[(5) - (5)].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[(4) - (5)].s), (yyvsp[(1) - (5)].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[(4) - (5)].s), (yyvsp[(1) - (5)].t));
                                         (yyval.sr)->type |= (yyvsp[(5) - (5)].t);
                                         adv_named_set(interp, (yyvsp[(2) - (5)].s));;}
    break;

  case 59:
#line 829 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 60:
#line 833 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; IMCC_INFO(interp)->cur_unit->outer =
                     mk_sub_address_fromc(interp, (yyvsp[(3) - (4)].s)); ;}
    break;

  case 61:
#line 836 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; IMCC_INFO(interp)->cur_unit->outer =
                     mk_const(interp, (yyvsp[(3) - (4)].s), 'S'); ;}
    break;

  case 62:
#line 841 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;
                       IMCC_INFO(interp)->cur_unit->vtable_name = NULL;
                       IMCC_INFO(interp)->cur_unit->is_vtable_method = 1; ;}
    break;

  case 63:
#line 845 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;
                       IMCC_INFO(interp)->cur_unit->vtable_name = strdup((yyvsp[(3) - (4)].s));
                       IMCC_INFO(interp)->cur_unit->is_vtable_method = 1; ;}
    break;

  case 64:
#line 851 "compilers/imcc/imcc.y"
    { add_pcc_multi(IMCC_INFO(interp)->cur_call, NULL); ;}
    break;

  case 65:
#line 852 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr)); ;}
    break;

  case 66:
#line 853 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr));;}
    break;

  case 67:
#line 857 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("INTVAL"), 'S'); ;}
    break;

  case 68:
#line 858 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("FLOATVAL"), 'S'); ;}
    break;

  case 69:
#line 859 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("PMC"), 'S'); ;}
    break;

  case 70:
#line 860 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("STRING"), 'S'); ;}
    break;

  case 71:
#line 861 "compilers/imcc/imcc.y"
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

  case 72:
#line 871 "compilers/imcc/imcc.y"
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

  case 73:
#line 881 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); ;}
    break;

  case 76:
#line 891 "compilers/imcc/imcc.y"
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

  case 77:
#line 919 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 78:
#line 923 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->label = 0; ;}
    break;

  case 79:
#line 924 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->label = 1; ;}
    break;

  case 80:
#line 928 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; ;}
    break;

  case 81:
#line 930 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->object = (yyvsp[(2) - (3)].sr); ;}
    break;

  case 82:
#line 934 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 84:
#line 939 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (1)].t); ;}
    break;

  case 85:
#line 940 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); ;}
    break;

  case 86:
#line 944 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_LOAD; ;}
    break;

  case 87:
#line 945 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_INIT; ;}
    break;

  case 88:
#line 946 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_MAIN; ;}
    break;

  case 89:
#line 947 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_IMMEDIATE; ;}
    break;

  case 90:
#line 948 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_POSTCOMP; ;}
    break;

  case 91:
#line 949 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_ANON; ;}
    break;

  case 92:
#line 950 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_METHOD; ;}
    break;

  case 93:
#line 951 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_NEED_LEX; ;}
    break;

  case 97:
#line 959 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (5)].sr));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         ;}
    break;

  case 98:
#line 964 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); ;}
    break;

  case 99:
#line 966 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
            IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isNCI;
         ;}
    break;

  case 100:
#line 971 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); ;}
    break;

  case 101:
#line 973 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[(2) - (3)].s), 'S')); ;}
    break;

  case 102:
#line 975 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (5)].sr));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         ;}
    break;

  case 103:
#line 979 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[(2) - (5)].s), 'S'));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         ;}
    break;

  case 104:
#line 986 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 105:
#line 987 "compilers/imcc/imcc.y"
    {  add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); ;}
    break;

  case 106:
#line 991 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (2)].sr); ;}
    break;

  case 107:
#line 996 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 108:
#line 997 "compilers/imcc/imcc.y"
    {  if ((yyvsp[(2) - (3)].sr)) add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); ;}
    break;

  case 109:
#line 1001 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); ;}
    break;

  case 110:
#line 1002 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 111:
#line 1003 "compilers/imcc/imcc.y"
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

  case 112:
#line 1017 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; ;}
    break;

  case 113:
#line 1018 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); ;}
    break;

  case 114:
#line 1022 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_FLAT;   ;}
    break;

  case 115:
#line 1023 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPTIONAL; ;}
    break;

  case 116:
#line 1024 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPT_FLAG; ;}
    break;

  case 117:
#line 1025 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_NAMED; ;}
    break;

  case 118:
#line 1026 "compilers/imcc/imcc.y"
    {  adv_named_set(interp, (yyvsp[(3) - (4)].s)); (yyval.t) = 0; ;}
    break;

  case 119:
#line 1027 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_UNIQUE_REG; ;}
    break;

  case 120:
#line 1033 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, 0); ;}
    break;

  case 121:
#line 1036 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; ;}
    break;

  case 122:
#line 1037 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.i) = 0;  ;}
    break;

  case 123:
#line 1043 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, 1); ;}
    break;

  case 124:
#line 1046 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->asm_state = AsmDefault; ;}
    break;

  case 125:
#line 1050 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 126:
#line 1051 "compilers/imcc/imcc.y"
    {
       if ((yyvsp[(1) - (2)].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (2)].sr));
   ;}
    break;

  case 127:
#line 1054 "compilers/imcc/imcc.y"
    {
       if ((yyvsp[(2) - (3)].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(2) - (3)].sr));
   ;}
    break;

  case 128:
#line 1060 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); ;}
    break;

  case 129:
#line 1065 "compilers/imcc/imcc.y"
    {
            if (IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, (yyvsp[(1) - (2)].t));
        ;}
    break;

  case 130:
#line 1070 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  ;}
    break;

  case 131:
#line 1074 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 132:
#line 1075 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; ;}
    break;

  case 133:
#line 1079 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 134:
#line 1080 "compilers/imcc/imcc.y"
    {
      if (IMCC_INFO(interp)->adv_named_id) {
          add_pcc_named_return(interp, IMCC_INFO(interp)->sr_return,
                               IMCC_INFO(interp)->adv_named_id, (yyvsp[(1) - (1)].sr));
          IMCC_INFO(interp)->adv_named_id = NULL;
      }
      else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (1)].sr)); ;}
    break;

  case 135:
#line 1087 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp, IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (3)].s), (yyvsp[(3) - (3)].sr));;}
    break;

  case 136:
#line 1089 "compilers/imcc/imcc.y"
    {
      if (IMCC_INFO(interp)->adv_named_id) {
          add_pcc_named_return(interp, IMCC_INFO(interp)->sr_return,
                               IMCC_INFO(interp)->adv_named_id, (yyvsp[(3) - (3)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
      }
      else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(3) - (3)].sr));    ;}
    break;

  case 137:
#line 1096 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp, IMCC_INFO(interp)->sr_return, (yyvsp[(3) - (5)].s), (yyvsp[(5) - (5)].sr));;}
    break;

  case 140:
#line 1115 "compilers/imcc/imcc.y"
    { clear_state(interp); ;}
    break;

  case 141:
#line 1120 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[(2) - (2)].i); ;}
    break;

  case 142:
#line 1121 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 143:
#line 1122 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 144:
#line 1123 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 145:
#line 1127 "compilers/imcc/imcc.y"
    {  (yyval.i) = NULL; ;}
    break;

  case 149:
#line 1137 "compilers/imcc/imcc.y"
    {
         (yyval.i) = iLABEL(interp, IMCC_INFO(interp)->cur_unit, mk_local_label(interp, (yyvsp[(1) - (1)].s)));
                   ;}
    break;

  case 150:
#line 1146 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(2) - (3)].i); ;}
    break;

  case 151:
#line 1148 "compilers/imcc/imcc.y"
    { if (yynerrs >= PARROT_MAX_RECOVER_ERRORS) {
                           IMCC_warning(interp, "Too many errors. Correct some first.\n");
                           YYABORT;
                       }
                       yyerrok; ;}
    break;

  case 152:
#line 1157 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[(1) - (1)].idlist);
         l->next = NULL;
         (yyval.idlist) = l;
     ;}
    break;

  case 153:
#line 1164 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[(3) - (3)].idlist);
         l->next = (yyvsp[(1) - (3)].idlist);
         (yyval.idlist) = l;
     ;}
    break;

  case 154:
#line 1173 "compilers/imcc/imcc.y"
    {
         IdList* l = (IdList*)malloc(sizeof (IdList));
         l->id = (yyvsp[(1) - (2)].s);
         l->unique_reg = (yyvsp[(2) - (2)].t);
         (yyval.idlist) = l;
     ;}
    break;

  case 155:
#line 1182 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 156:
#line 1183 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; ;}
    break;

  case 159:
#line 1190 "compilers/imcc/imcc.y"
    { push_namespace((yyvsp[(2) - (2)].s)); ;}
    break;

  case 160:
#line 1191 "compilers/imcc/imcc.y"
    { pop_namespace((yyvsp[(2) - (2)].s)); ;}
    break;

  case 161:
#line 1192 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 162:
#line 1193 "compilers/imcc/imcc.y"
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

  case 163:
#line 1210 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, (yyvsp[(4) - (4)].sr), (yyvsp[(2) - (4)].s)); (yyval.i) = 0;
                    ;}
    break;

  case 164:
#line 1213 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 165:
#line 1214 "compilers/imcc/imcc.y"
    {
                        SymReg *ignored;
                        ignored = mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 0);
                        UNUSED(ignored);
                        is_def=0;
                    ;}
    break;

  case 167:
#line 1222 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 168:
#line 1223 "compilers/imcc/imcc.y"
    {
                        SymReg *ignored;
                        ignored = mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1);
                        UNUSED(ignored);
                        is_def=0;
                    ;}
    break;

  case 169:
#line 1229 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;
                           IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isTAIL_CALL;
                           IMCC_INFO(interp)->cur_call = NULL;
                        ;}
    break;

  case 170:
#line 1233 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "branch", 1, (yyvsp[(2) - (2)].sr)); ;}
    break;

  case 171:
#line 1235 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (2)].s), 0,
                              IMCC_INFO(interp) -> regs,
                              IMCC_INFO(interp) -> nargs,
                              IMCC_INFO(interp) -> keyvec, 1);
                       free((yyvsp[(1) - (2)].s)); ;}
    break;

  case 172:
#line 1241 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(2) - (2)].sr)); ;}
    break;

  case 173:
#line 1242 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 174:
#line 1243 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 177:
#line 1246 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;;}
    break;

  case 178:
#line 1250 "compilers/imcc/imcc.y"
    { (yyval.t) = 'I'; ;}
    break;

  case 179:
#line 1251 "compilers/imcc/imcc.y"
    { (yyval.t) = 'N'; ;}
    break;

  case 180:
#line 1252 "compilers/imcc/imcc.y"
    { (yyval.t) = 'S'; ;}
    break;

  case 181:
#line 1253 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; ;}
    break;

  case 182:
#line 1254 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 183:
#line 1259 "compilers/imcc/imcc.y"
    {
             if ((IMCC_INFO(interp)->cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, (yyvsp[(1) - (1)].s), 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", (yyvsp[(1) - (1)].s));
            }
         ;}
    break;

  case 184:
#line 1270 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr));  ;}
    break;

  case 185:
#line 1272 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (4)].s), 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));  ;}
    break;

  case 186:
#line 1274 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(4) - (5)].s), 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  ;}
    break;

  case 187:
#line 1276 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(5) - (6)].sr)); ;}
    break;

  case 188:
#line 1278 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 189:
#line 1280 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].s), (yyvsp[(6) - (6)].sr), 1); ;}
    break;

  case 190:
#line 1282 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].s), (yyvsp[(6) - (7)].sr), 1); ;}
    break;

  case 191:
#line 1284 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].s), NULL, 1); ;}
    break;

  case 192:
#line 1286 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 193:
#line 1288 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (6)].sr), (yyvsp[(5) - (6)].sr)); ;}
    break;

  case 194:
#line 1290 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 195:
#line 1292 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); ;}
    break;

  case 196:
#line 1294 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set_addr",
                        2, (yyvsp[(1) - (4)].sr), mk_label_address(interp, (yyvsp[(4) - (4)].s))); ;}
    break;

  case 197:
#line 1297 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "find_global", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));;}
    break;

  case 198:
#line 1299 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "store_global", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 199:
#line 1303 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 200:
#line 1305 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 201:
#line 1307 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); ;}
    break;

  case 202:
#line 1310 "compilers/imcc/imcc.y"
    {
            add_pcc_result((yyvsp[(3) - (3)].i)->r[0], (yyvsp[(1) - (3)].sr));
            IMCC_INFO(interp)->cur_call = NULL;
            (yyval.i) = 0;
         ;}
    break;

  case 203:
#line 1316 "compilers/imcc/imcc.y"
    {
            (yyval.i) = IMCC_create_itcall_label(interp);
         ;}
    break;

  case 204:
#line 1320 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[(6) - (9)].sr));
           IMCC_INFO(interp)->cur_call = NULL;
         ;}
    break;

  case 208:
#line 1328 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(1) - (3)].sr)); ;}
    break;

  case 209:
#line 1332 "compilers/imcc/imcc.y"
    { (yyval.s) = "not"; ;}
    break;

  case 210:
#line 1333 "compilers/imcc/imcc.y"
    { (yyval.s) = "bnot"; ;}
    break;

  case 211:
#line 1334 "compilers/imcc/imcc.y"
    { (yyval.s) = "neg"; ;}
    break;

  case 212:
#line 1338 "compilers/imcc/imcc.y"
    { (yyval.s) = "sub"; ;}
    break;

  case 213:
#line 1339 "compilers/imcc/imcc.y"
    { (yyval.s) = "add"; ;}
    break;

  case 214:
#line 1340 "compilers/imcc/imcc.y"
    { (yyval.s) = "mul"; ;}
    break;

  case 215:
#line 1341 "compilers/imcc/imcc.y"
    { (yyval.s) = "div"; ;}
    break;

  case 216:
#line 1342 "compilers/imcc/imcc.y"
    { (yyval.s) = "mod"; ;}
    break;

  case 217:
#line 1343 "compilers/imcc/imcc.y"
    { (yyval.s) = "fdiv"; ;}
    break;

  case 218:
#line 1344 "compilers/imcc/imcc.y"
    { (yyval.s) = "pow"; ;}
    break;

  case 219:
#line 1345 "compilers/imcc/imcc.y"
    { (yyval.s) = "concat"; ;}
    break;

  case 220:
#line 1346 "compilers/imcc/imcc.y"
    {  (yyval.s) = "iseq"; ;}
    break;

  case 221:
#line 1347 "compilers/imcc/imcc.y"
    {  (yyval.s) = "isne"; ;}
    break;

  case 222:
#line 1348 "compilers/imcc/imcc.y"
    {  (yyval.s) = "isgt"; ;}
    break;

  case 223:
#line 1349 "compilers/imcc/imcc.y"
    {  (yyval.s) = "isge"; ;}
    break;

  case 224:
#line 1350 "compilers/imcc/imcc.y"
    {  (yyval.s) = "islt"; ;}
    break;

  case 225:
#line 1351 "compilers/imcc/imcc.y"
    {  (yyval.s) = "isle"; ;}
    break;

  case 226:
#line 1352 "compilers/imcc/imcc.y"
    { (yyval.s) = "shl"; ;}
    break;

  case 227:
#line 1353 "compilers/imcc/imcc.y"
    { (yyval.s) = "shr"; ;}
    break;

  case 228:
#line 1354 "compilers/imcc/imcc.y"
    { (yyval.s) = "lsr"; ;}
    break;

  case 229:
#line 1355 "compilers/imcc/imcc.y"
    { (yyval.s) = "and"; ;}
    break;

  case 230:
#line 1356 "compilers/imcc/imcc.y"
    { (yyval.s) = "or"; ;}
    break;

  case 231:
#line 1357 "compilers/imcc/imcc.y"
    { (yyval.s) = "xor"; ;}
    break;

  case 232:
#line 1358 "compilers/imcc/imcc.y"
    { (yyval.s) = "band"; ;}
    break;

  case 233:
#line 1359 "compilers/imcc/imcc.y"
    { (yyval.s) = "bor"; ;}
    break;

  case 234:
#line 1360 "compilers/imcc/imcc.y"
    { (yyval.s) = "bxor"; ;}
    break;

  case 235:
#line 1364 "compilers/imcc/imcc.y"
    { (yyval.i) = IMCC_create_itcall_label(interp);
                           (yyval.i)->type &= ~ITCALL; (yyval.i)->type |= ITRESULT; ;}
    break;

  case 236:
#line 1366 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 237:
#line 1373 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(2) - (3)].s), 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); ;}
    break;

  case 238:
#line 1377 "compilers/imcc/imcc.y"
    { (yyval.s) = "add"; ;}
    break;

  case 239:
#line 1378 "compilers/imcc/imcc.y"
    { (yyval.s) = "sub"; ;}
    break;

  case 240:
#line 1379 "compilers/imcc/imcc.y"
    { (yyval.s) = "mul"; ;}
    break;

  case 241:
#line 1380 "compilers/imcc/imcc.y"
    { (yyval.s) = "div"; ;}
    break;

  case 242:
#line 1381 "compilers/imcc/imcc.y"
    { (yyval.s) = "mod"; ;}
    break;

  case 243:
#line 1382 "compilers/imcc/imcc.y"
    { (yyval.s) = "fdiv"; ;}
    break;

  case 244:
#line 1383 "compilers/imcc/imcc.y"
    { (yyval.s) = "concat"; ;}
    break;

  case 245:
#line 1384 "compilers/imcc/imcc.y"
    { (yyval.s) = "band"; ;}
    break;

  case 246:
#line 1385 "compilers/imcc/imcc.y"
    { (yyval.s) = "bor"; ;}
    break;

  case 247:
#line 1386 "compilers/imcc/imcc.y"
    { (yyval.s) = "bxor"; ;}
    break;

  case 248:
#line 1387 "compilers/imcc/imcc.y"
    { (yyval.s) = "shr"; ;}
    break;

  case 249:
#line 1388 "compilers/imcc/imcc.y"
    { (yyval.s) = "shl"; ;}
    break;

  case 250:
#line 1389 "compilers/imcc/imcc.y"
    { (yyval.s) = "lsr"; ;}
    break;

  case 251:
#line 1395 "compilers/imcc/imcc.y"
    { (yyval.i) = func_ins(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(3) - (4)].s),
                                   IMCC_INFO(interp) -> regs,
                                   IMCC_INFO(interp) -> nargs,
                                   IMCC_INFO(interp) -> keyvec, 1);
                     free((yyvsp[(3) - (4)].s));
                   ;}
    break;

  case 252:
#line 1403 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 253:
#line 1404 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 254:
#line 1405 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 255:
#line 1406 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (1)].sr);
                       if ((yyvsp[(1) - (1)].sr)->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     ;}
    break;

  case 256:
#line 1411 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); ;}
    break;

  case 257:
#line 1412 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = mk_const(interp, (yyvsp[(3) - (3)].s), 'S'); ;}
    break;

  case 258:
#line 1413 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); ;}
    break;

  case 259:
#line 1419 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[(1) - (1)].sr));
        ;}
    break;

  case 260:
#line 1424 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[(2) - (5)].i); ;}
    break;

  case 261:
#line 1428 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 262:
#line 1429 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0;
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, IMCC_INFO(interp)->adv_named_id, (yyvsp[(3) - (3)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       }
       else add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr));
   ;}
    break;

  case 263:
#line 1436 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0;
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, IMCC_INFO(interp)->adv_named_id, (yyvsp[(1) - (1)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       }
       else add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr));
   ;}
    break;

  case 264:
#line 1443 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0;
                                     add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (5)].s), (yyvsp[(5) - (5)].sr));;}
    break;

  case 265:
#line 1445 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (3)].s), (yyvsp[(3) - (3)].sr));;}
    break;

  case 266:
#line 1449 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); ;}
    break;

  case 267:
#line 1453 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; ;}
    break;

  case 268:
#line 1454 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); ;}
    break;

  case 269:
#line 1458 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT; ;}
    break;

  case 270:
#line 1459 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_NAMED; ;}
    break;

  case 271:
#line 1460 "compilers/imcc/imcc.y"
    { adv_named_set(interp, (yyvsp[(3) - (4)].s)); (yyval.t) = 0; ;}
    break;

  case 272:
#line 1463 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); ;}
    break;

  case 273:
#line 1467 "compilers/imcc/imcc.y"
    {
         (yyval.sr) = 0;
         if (IMCC_INFO(interp)->adv_named_id) {
             add_pcc_named_result(interp, IMCC_INFO(interp)->cur_call, IMCC_INFO(interp)->adv_named_id, (yyvsp[(3) - (3)].sr));
             IMCC_INFO(interp)->adv_named_id = NULL;
         }
         else add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr)); ;}
    break;

  case 274:
#line 1474 "compilers/imcc/imcc.y"
    {
        add_pcc_named_result(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (5)].s), (yyvsp[(5) - (5)].sr)); ;}
    break;

  case 275:
#line 1476 "compilers/imcc/imcc.y"
    {
       (yyval.sr) = 0;
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_result(interp, IMCC_INFO(interp)->cur_call, IMCC_INFO(interp)->adv_named_id, (yyvsp[(1) - (1)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       }
       else add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr)); ;}
    break;

  case 276:
#line 1483 "compilers/imcc/imcc.y"
    { add_pcc_named_result(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (3)].s), (yyvsp[(3) - (3)].sr)); ;}
    break;

  case 277:
#line 1484 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 278:
#line 1488 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 279:
#line 1489 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 280:
#line 1494 "compilers/imcc/imcc.y"
    { (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, inv_op((yyvsp[(3) - (6)].s)), 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 281:
#line 1496 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); ;}
    break;

  case 282:
#line 1498 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 283:
#line 1503 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 284:
#line 1505 "compilers/imcc/imcc.y"
    { (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 285:
#line 1507 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); ;}
    break;

  case 286:
#line 1511 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 287:
#line 1512 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 288:
#line 1516 "compilers/imcc/imcc.y"
    {  (yyval.s) = "eq"; ;}
    break;

  case 289:
#line 1517 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ne"; ;}
    break;

  case 290:
#line 1518 "compilers/imcc/imcc.y"
    {  (yyval.s) = "gt"; ;}
    break;

  case 291:
#line 1519 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ge"; ;}
    break;

  case 292:
#line 1520 "compilers/imcc/imcc.y"
    {  (yyval.s) = "lt"; ;}
    break;

  case 293:
#line 1521 "compilers/imcc/imcc.y"
    {  (yyval.s) = "le"; ;}
    break;

  case 296:
#line 1530 "compilers/imcc/imcc.y"
    {  (yyval.sr) = NULL; ;}
    break;

  case 297:
#line 1531 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(1) - (1)].sr); ;}
    break;

  case 298:
#line 1535 "compilers/imcc/imcc.y"
    { (yyval.sr) = IMCC_INFO(interp)->regs[0]; ;}
    break;

  case 300:
#line 1540 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(1) - (1)].sr); ;}
    break;

  case 301:
#line 1542 "compilers/imcc/imcc.y"
    {
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(1) - (4)].sr);
                      IMCC_INFO(interp) -> keyvec |= KEY_BIT(IMCC_INFO(interp)->nargs);
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(3) - (4)].sr);
                      (yyval.sr) = (yyvsp[(1) - (4)].sr);
                   ;}
    break;

  case 302:
#line 1549 "compilers/imcc/imcc.y"
    {
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(2) - (3)].sr);
                      (yyval.sr) = (yyvsp[(2) - (3)].sr);
                   ;}
    break;

  case 304:
#line 1556 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 305:
#line 1557 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 306:
#line 1561 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 307:
#line 1562 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 308:
#line 1566 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 309:
#line 1567 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); ;}
    break;

  case 314:
#line 1580 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->nkeys = 0;
                      IMCC_INFO(interp)->in_slice = 0; ;}
    break;

  case 315:
#line 1582 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp,
                                     IMCC_INFO(interp)->nkeys,
                                     IMCC_INFO(interp)->keys, 0); ;}
    break;

  case 316:
#line 1587 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->nkeys = 0;
                      IMCC_INFO(interp)->in_slice = 0; ;}
    break;

  case 317:
#line 1589 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp,
                                     IMCC_INFO(interp)->nkeys,
                                     IMCC_INFO(interp)->keys, 1); ;}
    break;

  case 318:
#line 1595 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(1) - (1)].sr); ;}
    break;

  case 319:
#line 1597 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(3) - (3)].sr);
                      (yyval.sr) = IMCC_INFO(interp)->keys[0]; ;}
    break;

  case 320:
#line 1599 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->in_slice = 1; ;}
    break;

  case 321:
#line 1600 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(4) - (4)].sr);
                       (yyval.sr) = IMCC_INFO(interp)->keys[0]; ;}
    break;

  case 322:
#line 1605 "compilers/imcc/imcc.y"
    { if (IMCC_INFO(interp)->in_slice) {
                         (yyvsp[(1) - (1)].sr)->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     (yyval.sr) = (yyvsp[(1) - (1)].sr);
                   ;}
    break;

  case 323:
#line 1611 "compilers/imcc/imcc.y"
    { (yyvsp[(1) - (3)].sr)->type |= VT_START_SLICE;
                     (yyvsp[(3) - (3)].sr)->type |= VT_END_SLICE;
                     IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(1) - (3)].sr);
                     (yyval.sr) = (yyvsp[(3) - (3)].sr); ;}
    break;

  case 324:
#line 1615 "compilers/imcc/imcc.y"
    { (yyvsp[(2) - (2)].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[(2) - (2)].sr); ;}
    break;

  case 325:
#line 1616 "compilers/imcc/imcc.y"
    { (yyvsp[(1) - (2)].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[(1) - (2)].sr); ;}
    break;

  case 326:
#line 1620 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'I'); ;}
    break;

  case 327:
#line 1621 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'N'); ;}
    break;

  case 328:
#line 1622 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); ;}
    break;

  case 329:
#line 1623 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'P'); ;}
    break;

  case 330:
#line 1624 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_pasm_reg(interp, (yyvsp[(1) - (1)].s));    ;}
    break;

  case 331:
#line 1628 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'I'); ;}
    break;

  case 332:
#line 1629 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'N'); ;}
    break;

  case 333:
#line 1630 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S'); ;}
    break;

  case 334:
#line 1631 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'U'); ;}
    break;

  case 335:
#line 1635 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); ;}
    break;

  case 336:
#line 1636 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S');  ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4471 "compilers/imcc/imcparser.c"
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


#line 1641 "compilers/imcc/imcc.y"


/* I need this prototype somewhere... */
char *yyget_text(yyscan_t yyscanner);

/* I do not like this function, but, atm, it is the only way I can
 * make the code in yyerror work without segfault on some specific
 * cases.
 */
/* int yyholds_char(yyscan_t yyscanner ); */

int yyerror(void *yyscanner, PARROT_INTERP, const char *s)
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
     * error. Instead of duplicating code for both cases (the 'newline' and
     * non-newline case, do the test twice; efficiency is not important when
     * we have an error anyway.
     */
    if (!at_eof(yyscanner)) {
        if (*chr == '\n') {
            IMCC_INFO(interp)->line--;
        }

        IMCC_warning(interp, "error:imcc:%s", s);
        /* don't print the current token if it is a newline */
        if (*chr != '\n') {
            IMCC_warning(interp, " ('%s')", chr);
        }
        IMCC_print_inc(interp);

        if (*chr == '\n') {
            IMCC_INFO(interp)->line++;
        }

    }
    else { /* scanner is at end of file; just to be sure, do not print "current" token. */
        IMCC_warning(interp, "error:imcc:%s", s);
        IMCC_print_inc(interp);
    }

    return 0;
}


/*

=back

=head1 SEE ALSO

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
