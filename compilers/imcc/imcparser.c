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
     HLL = 260,
     HLL_MAP = 261,
     TK_LINE = 262,
     GOTO = 263,
     ARG = 264,
     IF = 265,
     UNLESS = 266,
     PNULL = 267,
     ADV_FLAT = 268,
     ADV_SLURPY = 269,
     ADV_OPTIONAL = 270,
     ADV_OPT_FLAG = 271,
     ADV_NAMED = 272,
     ADV_ARROW = 273,
     NEW = 274,
     ADV_INVOCANT = 275,
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
     GLOBALOP = 314,
     RESULT = 315,
     RETURN = 316,
     TAILCALL = 317,
     YIELDT = 318,
     GET_RESULTS = 319,
     POW = 320,
     SHIFT_RIGHT_U = 321,
     LOG_AND = 322,
     LOG_OR = 323,
     COMMA = 324,
     ESUB = 325,
     DOTDOT = 326,
     PCC_BEGIN = 327,
     PCC_END = 328,
     PCC_CALL = 329,
     PCC_SUB = 330,
     PCC_BEGIN_RETURN = 331,
     PCC_END_RETURN = 332,
     PCC_BEGIN_YIELD = 333,
     PCC_END_YIELD = 334,
     NCI_CALL = 335,
     METH_CALL = 336,
     INVOCANT = 337,
     MAIN = 338,
     LOAD = 339,
     INIT = 340,
     IMMEDIATE = 341,
     POSTCOMP = 342,
     METHOD = 343,
     ANON = 344,
     OUTER = 345,
     NEED_LEX = 346,
     MULTI = 347,
     VTABLE_METHOD = 348,
     LOADLIB = 349,
     SUB_INSTANCE_OF = 350,
     SUB_LEXID = 351,
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
#define HLL 260
#define HLL_MAP 261
#define TK_LINE 262
#define GOTO 263
#define ARG 264
#define IF 265
#define UNLESS 266
#define PNULL 267
#define ADV_FLAT 268
#define ADV_SLURPY 269
#define ADV_OPTIONAL 270
#define ADV_OPT_FLAG 271
#define ADV_NAMED 272
#define ADV_ARROW 273
#define NEW 274
#define ADV_INVOCANT 275
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
#define GLOBALOP 314
#define RESULT 315
#define RETURN 316
#define TAILCALL 317
#define YIELDT 318
#define GET_RESULTS 319
#define POW 320
#define SHIFT_RIGHT_U 321
#define LOG_AND 322
#define LOG_OR 323
#define COMMA 324
#define ESUB 325
#define DOTDOT 326
#define PCC_BEGIN 327
#define PCC_END 328
#define PCC_CALL 329
#define PCC_SUB 330
#define PCC_BEGIN_RETURN 331
#define PCC_END_RETURN 332
#define PCC_BEGIN_YIELD 333
#define PCC_END_YIELD 334
#define NCI_CALL 335
#define METH_CALL 336
#define INVOCANT 337
#define MAIN 338
#define LOAD 339
#define INIT 340
#define IMMEDIATE 341
#define POSTCOMP 342
#define METHOD 343
#define ANON 344
#define OUTER 345
#define NEED_LEX 346
#define MULTI 347
#define VTABLE_METHOD 348
#define LOADLIB 349
#define SUB_INSTANCE_OF 350
#define SUB_LEXID 351
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
 * Copyright (C) 2002-2008, The Perl Foundation.
 *
 * Grammar of the PIR language parser.
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

/* prevent declarations of malloc() and free() in the generated parser. */
#define YYMALLOC
#define YYFREE

#ifndef YYENABLE_NLS
#  define YYENABLE_NLS 0
#endif

#ifndef YYLTYPE_IS_TRIVIAL
#  define YYLTYPE_IS_TRIVIAL 0
#endif

/* HEADERIZER HFILE: compilers/imcc/imc.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void add_pcc_named_arg(PARROT_INTERP,
    ARGMOD(SymReg *cur_call),
    ARGIN(const char *name),
    ARGIN(SymReg *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*cur_call);

static void add_pcc_named_param(PARROT_INTERP,
    ARGMOD(SymReg *cur_call),
    ARGIN(const char *name),
    ARGIN(SymReg *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*cur_call);

static void add_pcc_named_result(PARROT_INTERP,
    ARGMOD(SymReg *cur_call),
    ARGIN(const char *name),
    ARGIN(SymReg *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*cur_call);

static void add_pcc_named_return(PARROT_INTERP,
    ARGMOD(SymReg *cur_call),
    ARGIN(const char *name),
    ARGIN(SymReg *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*cur_call);

static void adv_named_set(PARROT_INTERP, ARGIN(char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

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

PARROT_CAN_RETURN_NULL
static Instruction * iINDEXFETCH(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(SymReg *r0),
    ARGIN(SymReg *r1),
    ARGIN(SymReg *r2))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*unit);

PARROT_CAN_RETURN_NULL
static Instruction * iINDEXSET(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(SymReg *r0),
    ARGIN(SymReg *r1),
    ARGIN(SymReg *r2))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*unit);

PARROT_CANNOT_RETURN_NULL
static Instruction * iLABEL(PARROT_INTERP,
    ARGMOD_NULLOK(IMC_Unit *unit),
    ARGMOD(SymReg *r0))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*r0);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const char * inv_op(ARGIN(const char *op))
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static Instruction * iSUBROUTINE(PARROT_INTERP,
    ARGMOD_NULLOK(IMC_Unit *unit),
    ARGMOD(SymReg *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*r);

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
    ARGIN(const char *constant))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*left);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static Instruction* mk_pmc_const_named(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(const char *name),
    ARGMOD(SymReg *left),
    ARGIN(const char *constant))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*left);

PARROT_CANNOT_RETURN_NULL
static SymReg * mk_sub_address_fromc(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static SymReg * mk_sub_address_u(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void set_lexical(PARROT_INTERP,
    ARGMOD(SymReg *r),
    ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*r);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


#define YYDEBUG 1
#define YYERROR_VERBOSE 1

/*
 * We use a pure parser with the interpreter as a parameter. However this still
 * doesn't make the parser reentrant, as there are too many globals around.
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
    return INS(interp, unit, opname, fmt, r, n,
               IMCC_INFO(interp)->keyvec, 1);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static Instruction*
mk_pmc_const(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(const char *type),
        ARGMOD(SymReg *left), ARGIN(const char *constant))
{
    const int type_enum = atoi(type);
    const int ascii = (*constant == '\'' || *constant == '"');
    SymReg *rhs;
    SymReg *r[2];
    char   *name;

    if (left->type == VTADDRESS) {      /* IDENTIFIER */
        if (IMCC_INFO(interp)->state->pasm_file) {
            IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR,
                        "Ident as PMC constant",
                        " %s\n", left->name);
        }
        left->type = VTIDENTIFIER;
        left->set = 'P';
    }
    r[0] = left;
    if (ascii) {
        /* strip delimiters */
        name                   = str_dup(constant + 1);
        name[strlen(name) - 1] = '\0';
    }
    else {
        name = str_dup(constant);
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

    mem_sys_free(name);

    return INS(interp, unit, "set_p_pc", "", r, 2, 0, 1);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static Instruction*
mk_pmc_const_named(PARROT_INTERP, ARGMOD(IMC_Unit *unit),
    ARGIN(const char *name), ARGMOD(SymReg *left), ARGIN(const char *constant))
{
    SymReg *rhs;
    SymReg *r[2];
    char   *const_name;
    const int ascii       = (*constant == '\'' || *constant == '"');
    char   *unquoted_name = str_dup(name + 1);
    size_t  name_length   = strlen(unquoted_name) - 1;

    unquoted_name[name_length] = '\0';

    if (left->type == VTADDRESS) {      /* IDENTIFIER */
        if (IMCC_INFO(interp)->state->pasm_file) {
            IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR,
                        "Ident as PMC constant",
                        " %s\n", left->name);
        }
        left->type = VTIDENTIFIER;
        left->set = 'P';
    }
    r[0] = left;
    if (ascii) {
        /* strip delimiters */
        const_name                         = str_dup(constant + 1);
        const_name[strlen(const_name) - 1] = '\0';
    }
    else {
        const_name = str_dup(constant);
    }

    if ((strncmp(unquoted_name, "Sub",       name_length) == 0)
    ||  (strncmp(unquoted_name, "Coroutine", name_length) == 0)) {
        rhs = mk_const(interp, const_name, 'p');

        if (!ascii)
            rhs->type |= VT_ENCODED;

        rhs->usage    = U_FIXUP;
    }
    else {
        rhs = mk_const(interp, const_name, 'P');
    }

    r[1]          = rhs;
    rhs->pmc_type = pmc_type(interp,
        string_from_cstring(interp, unquoted_name, name_length));

    mem_sys_free(unquoted_name);
    mem_sys_free(const_name);

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

PARROT_CANNOT_RETURN_NULL
Instruction *
INS_LABEL(PARROT_INTERP, ARGMOD_NULLOK(IMC_Unit *unit), ARGMOD(SymReg *r0), int emit)
{

    Instruction * const ins = _mk_instruction("", "%s:", 1, &r0, 0);
    ins->type               = ITLABEL;
    r0->first_ins           = ins;

    if (emit)
        emitb(interp, unit, ins);

    return ins;
}

PARROT_CANNOT_RETURN_NULL
static Instruction *
iLABEL(PARROT_INTERP, ARGMOD_NULLOK(IMC_Unit *unit), ARGMOD(SymReg *r0))
{
    Instruction * const i = INS_LABEL(interp, unit, r0, 1);
    i->line               = IMCC_INFO(interp)->line;

    clear_state(interp);
    return i;
}

PARROT_CANNOT_RETURN_NULL
static Instruction *
iSUBROUTINE(PARROT_INTERP, ARGMOD_NULLOK(IMC_Unit *unit), ARGMOD(SymReg *r))
{
    Instruction * const i = iLABEL(interp, unit, r);

    r->type    = (r->type & VT_ENCODED) ? VT_PCC_SUB|VT_ENCODED : VT_PCC_SUB;
    r->pcc_sub = mem_allocate_zeroed_typed(pcc_sub_t);

    IMCC_INFO(interp)->cur_call = r;
    i->line                     = IMCC_INFO(interp)->line;

    add_namespace(interp, unit);
    return i;
}

/*
 * substr or X = P[key]
 */
PARROT_CAN_RETURN_NULL
static Instruction *
iINDEXFETCH(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(SymReg *r0), ARGIN(SymReg *r1),
        ARGIN(SymReg *r2))
{
    if (r0->set == 'S' && r1->set == 'S' && r2->set == 'I') {
        SymReg * const r3 = mk_const(interp, "1", 'I');
        return MK_I(interp, unit, "substr %s, %s, %s, 1", 4, r0, r1, r2, r3);
    }

    IMCC_INFO(interp) -> keyvec |= KEY_BIT(2);
    return MK_I(interp, unit, "set %s, %s[%s]", 3, r0, r1, r2);
}

/*
 * substr or P[key] = X
 */

PARROT_CAN_RETURN_NULL
static Instruction *
iINDEXSET(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(SymReg *r0), ARGIN(SymReg *r1),
        ARGIN(SymReg *r2))
{
    if (r0->set == 'S' && r1->set == 'I' && r2->set == 'S') {
        SymReg * const r3 = mk_const(interp, "1", 'I');
        MK_I(interp, unit, "substr %s, %s, %s, %s", 4, r0, r1, r3, r2);
    }
    else if (r0->set == 'P') {
        IMCC_INFO(interp)->keyvec |= KEY_BIT(1);
        MK_I(interp, unit, "set %s[%s], %s", 3, r0, r1, r2);
    }
    else
        IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR,
            "unsupported indexed set op\n");

    return NULL;
}

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const char *
inv_op(ARGIN(const char *op))
{
    int n;
    return get_neg_op(op, &n);
}

PARROT_CANNOT_RETURN_NULL
Instruction *
IMCC_create_itcall_label(PARROT_INTERP)
{
    char         name[128];
    SymReg      *r;
    Instruction *i;

    snprintf(name, sizeof (name), "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR,
        IMCC_INFO(interp)->cnr++);

    r       = mk_pcc_sub(interp, name, 0);
    i       = iLABEL(interp, IMCC_INFO(interp)->cur_unit, r);
    i->type = ITCALL | ITPCCSUB;

    IMCC_INFO(interp)->cur_call = r;

    return i;
}

PARROT_CANNOT_RETURN_NULL
static SymReg *
mk_sub_address_fromc(PARROT_INTERP, ARGIN(const char *name))
{
    /* name is a quoted sub name */
    SymReg *r;
    char *name_copy                  = str_dup(name + 1);
    name_copy[strlen(name_copy) - 1] = '\0';

    r = mk_sub_address(interp, name_copy);
    mem_sys_free(name_copy);

    return r;
}

PARROT_CANNOT_RETURN_NULL
static SymReg *
mk_sub_address_u(PARROT_INTERP, ARGIN(const char *name))
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
            IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR, "object isn't a PMC");
        IMCC_INFO(interp)->cur_call->pcc_sub->object = IMCC_INFO(interp)->cur_obj;
        IMCC_INFO(interp)->cur_obj = NULL;
    }
    if (IMCC_INFO(interp)->cur_call->pcc_sub->sub->pmc_type == enum_class_NCI)
        IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isNCI;
    if (IMCC_INFO(interp)->cur_unit->type == IMC_PCCSUB)
        IMCC_INFO(interp)->cur_unit->instructions->symregs[0]->pcc_sub->calls_a_sub |= 1;
}

static void
begin_return_or_yield(PARROT_INTERP, int yield)
{
    Instruction *i;
    Instruction * const ins = IMCC_INFO(interp)->cur_unit->instructions;
    char                name[128];

    if (!ins || !ins->symregs[0] || !(ins->symregs[0]->type & VT_PCC_SUB))
        IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR,
                    "yield or return directive outside pcc subroutine\n");
    if (yield)
       ins->symregs[0]->pcc_sub->calls_a_sub = 1 | ITPCCYIELD;
    snprintf(name, sizeof (name), yield ? "%cpcc_sub_yield_%d" : "%cpcc_sub_ret_%d",
            IMCC_INTERNAL_CHAR, IMCC_INFO(interp)->cnr++);
    interp->imc_info->sr_return = mk_pcc_sub(interp, name, 0);
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
        IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR,
            "register %s already declared as lexical %s", r->name, n->name);

    /* chain all names in r->reg */
    n->reg = r->reg;
    r->reg = n;
    r->use_count++;
}

static void
add_pcc_named_arg(PARROT_INTERP, ARGMOD(SymReg *cur_call), ARGIN(const char *name),
        ARGIN(SymReg *value))
{
    SymReg * const r = mk_const(interp, name, 'S');

    r->type  |= VT_NAMED;

    add_pcc_arg(cur_call, r);
    add_pcc_arg(cur_call, value);
}

static void
add_pcc_named_result(PARROT_INTERP, ARGMOD(SymReg *cur_call), ARGIN(const char *name),
        ARGIN(SymReg *value))
{
    SymReg * const r = mk_const(interp, name, 'S');
    r->type         |= VT_NAMED;

    add_pcc_result(cur_call, r);
    add_pcc_result(cur_call, value);
}

static void
add_pcc_named_param(PARROT_INTERP, ARGMOD(SymReg *cur_call), ARGIN(const char *name),
        ARGIN(SymReg *value))
{
    SymReg * const r = mk_const(interp, name, 'S');
    r->type         |= VT_NAMED;

    add_pcc_arg(cur_call, r);
    add_pcc_arg(cur_call, value);
}

static void
add_pcc_named_return(PARROT_INTERP, ARGMOD(SymReg *cur_call), ARGIN(const char *name),
        ARGIN(SymReg *value))
{
    SymReg * const r = mk_const(interp, name, 'S');
    r->type         |= VT_NAMED;

    add_pcc_result(cur_call, r);
    add_pcc_result(cur_call, value);
}

/* XXX Can name be consted? */
static void
adv_named_set(PARROT_INTERP, ARGIN(char *name))
{
    if (IMCC_INFO(interp)->adv_named_id) {
        IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR,
                    "Named parameter with more than one name.\n");
    }
    IMCC_INFO(interp)->adv_named_id = name;
}

static void
do_loadlib(PARROT_INTERP, ARGIN(const char *lib))
{
    STRING * const s = string_unescape_cstring(interp, lib + 1, '"', NULL);
    PMC    *ignored  = Parrot_load_lib(interp, s, NULL);
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
#line 687 "compilers/imcc/imcc.y"
{
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
}
/* Line 187 of yacc.c.  */
#line 1026 "compilers/imcc/imcparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 1039 "compilers/imcc/imcparser.c"

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
#define YYLAST   784

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  135
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  123
/* YYNRULES -- Number of rules.  */
#define YYNRULES  342
/* YYNRULES -- Number of states.  */
#define YYNSTATES  556

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
      21,    23,    25,    27,    30,    34,    40,    43,    48,    49,
      56,    57,    64,    65,    72,    74,    76,    78,    81,    85,
      88,    90,    92,    94,    96,    98,    99,   103,   104,   109,
     112,   117,   118,   120,   121,   126,   127,   129,   133,   137,
     140,   141,   142,   143,   154,   155,   157,   161,   162,   166,
     170,   176,   181,   186,   191,   193,   198,   203,   208,   209,
     213,   215,   217,   219,   221,   223,   225,   227,   231,   232,
     234,   235,   245,   246,   249,   250,   254,   255,   257,   259,
     262,   264,   266,   268,   270,   272,   274,   276,   278,   280,
     282,   284,   286,   288,   294,   298,   302,   306,   310,   316,
     322,   323,   327,   330,   331,   335,   339,   340,   345,   346,
     349,   351,   353,   355,   357,   362,   364,   365,   371,   373,
     374,   380,   381,   384,   388,   392,   393,   399,   401,   403,
     404,   406,   410,   414,   420,   422,   425,   426,   429,   432,
     434,   436,   438,   439,   441,   444,   446,   448,   452,   455,
     457,   461,   464,   465,   467,   469,   471,   474,   477,   478,
     483,   488,   489,   496,   498,   499,   506,   509,   512,   515,
     518,   520,   522,   524,   526,   527,   529,   531,   533,   535,
     537,   541,   546,   552,   559,   566,   573,   581,   586,   591,
     596,   603,   610,   618,   623,   628,   633,   640,   648,   652,
     653,   663,   665,   667,   669,   673,   675,   677,   679,   681,
     683,   685,   687,   689,   691,   693,   695,   697,   699,   701,
     703,   705,   707,   709,   711,   713,   715,   717,   719,   721,
     723,   725,   726,   732,   736,   738,   740,   742,   744,   746,
     748,   750,   752,   754,   756,   758,   760,   762,   767,   769,
     771,   773,   775,   779,   783,   787,   788,   794,   795,   799,
     801,   807,   811,   814,   815,   818,   820,   822,   827,   830,
     834,   840,   842,   846,   847,   849,   851,   858,   864,   869,
     874,   881,   887,   889,   891,   893,   895,   897,   899,   901,
     903,   905,   907,   908,   910,   914,   916,   918,   923,   927,
     929,   931,   933,   935,   937,   939,   941,   943,   945,   947,
     949,   950,   953,   954,   957,   959,   963,   964,   969,   971,
     975,   978,   981,   983,   985,   987,   989,   991,   993,   995,
     997,   999,  1001
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     136,     0,    -1,   137,    -1,   138,    -1,   137,   138,    -1,
     157,    -1,   142,    -1,   159,    -1,   154,    -1,   108,     4,
      -1,   139,    -1,   140,    -1,     4,    -1,   141,     4,    -1,
      95,   110,     4,    -1,     8,   111,    70,   110,     4,    -1,
       6,   110,    -1,     7,   110,   120,   110,    -1,    -1,    29,
     143,   214,   106,   120,   256,    -1,    -1,    29,   145,   111,
     246,   120,   147,    -1,    -1,    29,   146,   110,   246,   120,
     147,    -1,   110,    -1,   113,    -1,   149,    -1,   148,   149,
      -1,   203,   150,     4,    -1,   108,     4,    -1,   117,    -1,
     116,    -1,   157,    -1,   144,    -1,   139,    -1,    -1,   151,
     114,   153,    -1,    -1,    76,   152,   179,    99,    -1,    13,
     247,    -1,    28,   110,    70,   107,    -1,    -1,   240,    -1,
      -1,   100,   155,   156,   101,    -1,    -1,   148,    -1,    22,
     158,     4,    -1,   121,   248,   122,    -1,   121,   122,    -1,
      -1,    -1,    -1,    25,   160,   243,   161,   179,     4,   162,
     163,   174,    71,    -1,    -1,     4,    -1,   163,   164,     4,
      -1,    -1,     5,   165,   166,    -1,   214,   106,   188,    -1,
     214,   110,    19,   106,   188,    -1,    93,   123,   172,   124,
      -1,    91,   123,   110,   124,    -1,    91,   123,   106,   124,
      -1,    94,    -1,    94,   123,   110,   124,    -1,    96,   123,
     110,   124,    -1,    97,   123,   110,   124,    -1,    -1,   172,
      70,   173,    -1,   173,    -1,    49,    -1,    50,    -1,    52,
      -1,    51,    -1,   106,    -1,   110,    -1,   121,   248,   122,
      -1,    -1,   200,    -1,    -1,    73,     4,   176,   183,   178,
     182,   177,   185,    74,    -1,    -1,   205,     4,    -1,    -1,
      83,   247,     4,    -1,    -1,   180,    -1,   181,    -1,   180,
     181,    -1,    85,    -1,    86,    -1,    84,    -1,    87,    -1,
      88,    -1,    90,    -1,    89,    -1,    92,    -1,   167,    -1,
     168,    -1,   169,    -1,   170,    -1,   171,    -1,    75,   247,
      70,   247,     4,    -1,    75,   247,     4,    -1,    81,   247,
       4,    -1,    82,   239,     4,    -1,    82,   110,     4,    -1,
      82,   239,    70,   247,     4,    -1,    82,   110,    70,   247,
       4,    -1,    -1,   183,   184,     4,    -1,    10,   229,    -1,
      -1,   185,   186,     4,    -1,    61,   239,   188,    -1,    -1,
      27,   187,   214,   208,    -1,    -1,   188,   189,    -1,    15,
      -1,    16,    -1,    17,    -1,    18,    -1,    18,   123,   110,
     124,    -1,    98,    -1,    -1,    77,     4,   191,   194,    78,
      -1,   196,    -1,    -1,    79,     4,   193,   194,    80,    -1,
      -1,   194,     4,    -1,   194,   195,     4,    -1,    62,   247,
     230,    -1,    -1,   198,   123,   197,   199,   124,    -1,    62,
      -1,    64,    -1,    -1,   229,    -1,   110,    19,   247,    -1,
     199,    70,   229,    -1,   199,    70,   110,    19,   247,    -1,
     202,    -1,   200,   202,    -1,    -1,   201,   206,    -1,   108,
       4,    -1,   117,    -1,   116,    -1,   140,    -1,    -1,   204,
      -1,   204,   205,    -1,   205,    -1,    99,    -1,   203,   210,
       4,    -1,     1,     4,    -1,   208,    -1,   207,    70,   208,
      -1,   106,   209,    -1,    -1,    98,    -1,   216,    -1,   234,
      -1,    22,   106,    -1,    23,   106,    -1,    -1,    27,   211,
     214,   207,    -1,    28,   110,    70,   239,    -1,    -1,    29,
     212,   214,   106,   120,   256,    -1,   144,    -1,    -1,    32,
     213,   214,   106,   120,   256,    -1,    63,   226,    -1,     9,
     245,    -1,   114,   240,    -1,    13,   247,    -1,   226,    -1,
     175,    -1,   190,    -1,   192,    -1,    -1,    49,    -1,    50,
      -1,    51,    -1,    52,    -1,   106,    -1,   239,   120,   247,
      -1,   239,   120,   218,   247,    -1,   239,   120,   247,   219,
     247,    -1,   239,   120,   247,   121,   248,   122,    -1,   239,
     121,   248,   122,   120,   247,    -1,   239,   120,    20,   215,
      70,   247,    -1,   239,   120,    20,   215,   121,   248,   122,
      -1,   239,   120,    20,   215,    -1,   239,   120,    20,   247,
      -1,   239,   120,    20,   158,    -1,   239,   120,    20,   158,
      70,   247,    -1,   239,   120,    20,   247,    70,   247,    -1,
     239,   120,    20,   247,   121,   248,   122,    -1,   239,   120,
      60,   257,    -1,    60,   257,   120,   247,    -1,    20,   239,
      70,   247,    -1,    20,   239,    70,   247,    70,   247,    -1,
      20,   239,    70,   247,   121,   248,   122,    -1,   239,   120,
     226,    -1,    -1,   123,   217,   233,   124,   120,   225,   123,
     228,   124,    -1,   220,    -1,   222,    -1,   224,    -1,   239,
     120,    13,    -1,   125,    -1,   126,    -1,   127,    -1,   127,
      -1,   128,    -1,   129,    -1,   130,    -1,   131,    -1,    41,
      -1,    66,    -1,   119,    -1,    54,    -1,    55,    -1,    56,
      -1,    57,    -1,    58,    -1,    59,    -1,    47,    -1,    48,
      -1,    67,    -1,    68,    -1,    69,    -1,    53,    -1,   132,
      -1,   133,    -1,   126,    -1,    -1,    65,   221,   123,   233,
     124,    -1,   239,   223,   247,    -1,    33,    -1,    34,    -1,
      35,    -1,    36,    -1,    43,    -1,    42,    -1,    37,    -1,
      38,    -1,    39,    -1,    40,    -1,    44,    -1,    45,    -1,
      46,    -1,   239,   120,   114,   153,    -1,   106,    -1,   110,
      -1,   113,    -1,   239,    -1,   239,   118,   244,    -1,   239,
     118,   110,    -1,   239,   118,   239,    -1,    -1,   225,   227,
     123,   228,   124,    -1,    -1,   228,    70,   229,    -1,   229,
      -1,   228,    70,   110,    19,   247,    -1,   110,    19,   247,
      -1,   247,   230,    -1,    -1,   230,   231,    -1,    14,    -1,
      18,    -1,    18,   123,   110,   124,    -1,   239,   188,    -1,
     233,    70,   232,    -1,   233,    70,   110,    19,   239,    -1,
     232,    -1,   110,    19,   239,    -1,    -1,   236,    -1,   235,
      -1,    12,   247,   238,   247,     9,   245,    -1,    12,    13,
     247,     9,   245,    -1,    12,   247,   237,   245,    -1,    11,
     247,   237,   245,    -1,    11,   247,   238,   247,     9,   245,
      -1,    11,    13,   247,     9,   245,    -1,    70,    -1,     9,
      -1,    54,    -1,    55,    -1,    56,    -1,    57,    -1,    58,
      -1,    59,    -1,   115,    -1,   255,    -1,    -1,   241,    -1,
     241,    70,   242,    -1,   242,    -1,   246,    -1,   239,   121,
     248,   122,    -1,   121,   250,   122,    -1,   244,    -1,   110,
      -1,   113,    -1,   106,    -1,   114,    -1,   106,    -1,   114,
      -1,   245,    -1,   247,    -1,   239,    -1,   256,    -1,    -1,
     249,   252,    -1,    -1,   251,   252,    -1,   254,    -1,   252,
     134,   254,    -1,    -1,   252,    70,   253,   254,    -1,   247,
      -1,   247,    72,   247,    -1,    72,   247,    -1,   247,    72,
      -1,   102,    -1,   103,    -1,   104,    -1,   105,    -1,   107,
      -1,   111,    -1,   112,    -1,   110,    -1,   113,    -1,   104,
      -1,   110,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   779,   779,   783,   784,   788,   789,   790,   796,   802,
     803,   804,   805,   809,   810,   819,   828,   837,   855,   855,
     864,   864,   870,   870,   877,   878,   882,   883,   887,   888,
     889,   890,   891,   892,   893,   896,   896,   905,   904,   916,
     920,   928,   932,   936,   936,   948,   950,   954,   969,   977,
     982,   986,   989,   981,   995,   996,   997,  1010,  1010,  1014,
    1025,  1040,  1044,  1050,  1059,  1065,  1074,  1082,  1092,  1095,
    1100,  1108,  1109,  1110,  1111,  1112,  1123,  1134,  1137,  1139,
    1144,  1143,  1176,  1177,  1181,  1182,  1186,  1187,  1191,  1192,
    1196,  1197,  1198,  1199,  1200,  1201,  1202,  1203,  1204,  1205,
    1206,  1207,  1208,  1212,  1217,  1221,  1226,  1230,  1234,  1239,
    1248,  1249,  1253,  1258,  1259,  1267,  1268,  1268,  1283,  1284,
    1288,  1289,  1290,  1291,  1292,  1293,  1299,  1298,  1307,  1315,
    1315,  1321,  1322,  1327,  1335,  1340,  1339,  1352,  1353,  1357,
    1358,  1368,  1372,  1382,  1390,  1391,  1403,  1407,  1409,  1410,
    1411,  1412,  1416,  1417,  1421,  1422,  1426,  1435,  1436,  1447,
    1454,  1463,  1473,  1474,  1479,  1480,  1481,  1482,  1483,  1483,
    1499,  1503,  1503,  1510,  1511,  1511,  1517,  1523,  1524,  1536,
    1537,  1538,  1539,  1540,  1541,  1545,  1546,  1547,  1548,  1552,
    1565,  1567,  1569,  1571,  1573,  1575,  1577,  1579,  1581,  1583,
    1585,  1587,  1589,  1591,  1593,  1597,  1599,  1601,  1604,  1611,
    1610,  1619,  1620,  1621,  1622,  1630,  1631,  1632,  1636,  1637,
    1638,  1639,  1640,  1641,  1642,  1643,  1644,  1645,  1646,  1647,
    1648,  1649,  1650,  1651,  1652,  1653,  1654,  1655,  1656,  1657,
    1658,  1664,  1663,  1675,  1682,  1683,  1684,  1685,  1686,  1687,
    1688,  1689,  1690,  1691,  1692,  1693,  1694,  1699,  1710,  1711,
    1712,  1713,  1719,  1731,  1737,  1743,  1742,  1751,  1752,  1762,
    1772,  1778,  1787,  1791,  1792,  1796,  1797,  1800,  1804,  1808,
    1818,  1823,  1833,  1838,  1842,  1843,  1847,  1851,  1855,  1862,
    1866,  1870,  1877,  1878,  1882,  1883,  1884,  1885,  1886,  1887,
    1891,  1892,  1896,  1897,  1901,  1902,  1906,  1907,  1914,  1921,
    1922,  1923,  1927,  1928,  1932,  1933,  1937,  1938,  1942,  1943,
    1947,  1947,  1960,  1960,  1973,  1974,  1979,  1979,  1988,  1994,
    2001,  2002,  2006,  2007,  2008,  2009,  2010,  2014,  2015,  2016,
    2017,  2021,  2022
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "HLL",
  "HLL_MAP", "TK_LINE", "GOTO", "ARG", "IF", "UNLESS", "PNULL", "ADV_FLAT",
  "ADV_SLURPY", "ADV_OPTIONAL", "ADV_OPT_FLAG", "ADV_NAMED", "ADV_ARROW",
  "NEW", "ADV_INVOCANT", "NAMESPACE", "ENDNAMESPACE", "DOT_METHOD", "SUB",
  "SYM", "LOCAL", "LEXICAL", "CONST", "INC", "DEC", "GLOBAL_CONST",
  "PLUS_ASSIGN", "MINUS_ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN",
  "CONCAT_ASSIGN", "BAND_ASSIGN", "BOR_ASSIGN", "BXOR_ASSIGN", "FDIV",
  "FDIV_ASSIGN", "MOD_ASSIGN", "SHR_ASSIGN", "SHL_ASSIGN", "SHR_U_ASSIGN",
  "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV",
  "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT",
  "RELOP_LTE", "GLOBALOP", "RESULT", "RETURN", "TAILCALL", "YIELDT",
  "GET_RESULTS", "POW", "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA",
  "ESUB", "DOTDOT", "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB",
  "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD", "PCC_END_YIELD",
  "NCI_CALL", "METH_CALL", "INVOCANT", "MAIN", "LOAD", "INIT", "IMMEDIATE",
  "POSTCOMP", "METHOD", "ANON", "OUTER", "NEED_LEX", "MULTI",
  "VTABLE_METHOD", "LOADLIB", "SUB_INSTANCE_OF", "SUB_LEXID", "UNIQUE_REG",
  "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER",
  "REG", "MACRO", "ENDM", "STRINGC", "INTC", "FLOATC", "USTRINGC",
  "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", "'='",
  "'['", "']'", "'('", "')'", "'!'", "'~'", "'-'", "'+'", "'*'", "'/'",
  "'%'", "'&'", "'|'", "';'", "$accept", "program", "compilation_units",
  "compilation_unit", "pragma", "line_directive", "hll_def", "constdef",
  "@1", "pmc_const", "@2", "@3", "any_string", "pasmcode", "pasmline",
  "pasm_inst", "@4", "@5", "pasm_args", "emit", "@6", "opt_pasmcode",
  "class_namespace", "maybe_ns", "sub", "@7", "@8", "@9", "sub_params",
  "sub_param", "@10", "sub_param_type_def", "multi", "outer", "vtable",
  "instanceof", "subid", "multi_types", "multi_type", "sub_body",
  "pcc_sub_call", "@11", "opt_label", "opt_invocant", "sub_proto",
  "sub_proto_list", "proto", "pcc_call", "pcc_args", "pcc_arg",
  "pcc_results", "pcc_result", "@12", "paramtype_list", "paramtype",
  "pcc_ret", "@13", "pcc_yield", "@14", "pcc_returns", "pcc_return",
  "pcc_return_many", "@15", "return_or_yield", "var_returns", "statements",
  "helper_clear_state", "statement", "labels", "_labels", "label",
  "instruction", "id_list", "id_list_id", "opt_unique_reg", "labeled_inst",
  "@16", "@17", "@18", "type", "classname", "assignment", "@19", "un_op",
  "bin_op", "get_results", "@20", "op_assign", "assign_op", "func_assign",
  "the_sub", "sub_call", "@21", "arglist", "arg", "argtype_list",
  "argtype", "result", "targetlist", "conditional_statement",
  "unless_statement", "if_statement", "comma_or_goto", "relop", "target",
  "vars", "_vars", "_var_or_i", "sub_label_op_c", "sub_label_op",
  "label_op", "var_or_i", "var", "keylist", "@22", "keylist_force", "@23",
  "_keylist", "@24", "key", "reg", "const", "string", 0
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
static const yytype_uint16 yyr1[] =
{
       0,   135,   136,   137,   137,   138,   138,   138,   138,   138,
     138,   138,   138,   139,   139,   140,   141,   141,   143,   142,
     145,   144,   146,   144,   147,   147,   148,   148,   149,   149,
     149,   149,   149,   149,   149,   151,   150,   152,   150,   150,
     150,   150,   153,   155,   154,   156,   156,   157,   158,   158,
     160,   161,   162,   159,   163,   163,   163,   165,   164,   166,
     166,   167,   168,   168,   169,   169,   170,   171,   172,   172,
     172,   173,   173,   173,   173,   173,   173,   173,   174,   174,
     176,   175,   177,   177,   178,   178,   179,   179,   180,   180,
     181,   181,   181,   181,   181,   181,   181,   181,   181,   181,
     181,   181,   181,   182,   182,   182,   182,   182,   182,   182,
     183,   183,   184,   185,   185,   186,   187,   186,   188,   188,
     189,   189,   189,   189,   189,   189,   191,   190,   190,   193,
     192,   194,   194,   194,   195,   197,   196,   198,   198,   199,
     199,   199,   199,   199,   200,   200,   201,   202,   202,   202,
     202,   202,   203,   203,   204,   204,   205,   206,   206,   207,
     207,   208,   209,   209,   210,   210,   210,   210,   211,   210,
     210,   212,   210,   210,   213,   210,   210,   210,   210,   210,
     210,   210,   210,   210,   210,   214,   214,   214,   214,   215,
     216,   216,   216,   216,   216,   216,   216,   216,   216,   216,
     216,   216,   216,   216,   216,   216,   216,   216,   216,   217,
     216,   216,   216,   216,   216,   218,   218,   218,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,   221,   220,   222,   223,   223,   223,   223,   223,   223,
     223,   223,   223,   223,   223,   223,   223,   224,   225,   225,
     225,   225,   225,   225,   225,   227,   226,   228,   228,   228,
     228,   228,   229,   230,   230,   231,   231,   231,   232,   233,
     233,   233,   233,   233,   234,   234,   235,   235,   235,   236,
     236,   236,   237,   237,   238,   238,   238,   238,   238,   238,
     239,   239,   240,   240,   241,   241,   242,   242,   242,   243,
     243,   243,   244,   244,   245,   245,   246,   246,   247,   247,
     249,   248,   251,   250,   252,   252,   253,   252,   254,   254,
     254,   254,   255,   255,   255,   255,   255,   256,   256,   256,
     256,   257,   257
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     2,
       1,     1,     1,     2,     3,     5,     2,     4,     0,     6,
       0,     6,     0,     6,     1,     1,     1,     2,     3,     2,
       1,     1,     1,     1,     1,     0,     3,     0,     4,     2,
       4,     0,     1,     0,     4,     0,     1,     3,     3,     2,
       0,     0,     0,    10,     0,     1,     3,     0,     3,     3,
       5,     4,     4,     4,     1,     4,     4,     4,     0,     3,
       1,     1,     1,     1,     1,     1,     1,     3,     0,     1,
       0,     9,     0,     2,     0,     3,     0,     1,     1,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     5,     3,     3,     3,     3,     5,     5,
       0,     3,     2,     0,     3,     3,     0,     4,     0,     2,
       1,     1,     1,     1,     4,     1,     0,     5,     1,     0,
       5,     0,     2,     3,     3,     0,     5,     1,     1,     0,
       1,     3,     3,     5,     1,     2,     0,     2,     2,     1,
       1,     1,     0,     1,     2,     1,     1,     3,     2,     1,
       3,     2,     0,     1,     1,     1,     2,     2,     0,     4,
       4,     0,     6,     1,     0,     6,     2,     2,     2,     2,
       1,     1,     1,     1,     0,     1,     1,     1,     1,     1,
       3,     4,     5,     6,     6,     6,     7,     4,     4,     4,
       6,     6,     7,     4,     4,     4,     6,     7,     3,     0,
       9,     1,     1,     1,     3,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     0,     5,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     4,     1,     1,
       1,     1,     3,     3,     3,     0,     5,     0,     3,     1,
       5,     3,     2,     0,     2,     1,     1,     4,     2,     3,
       5,     1,     3,     0,     1,     1,     6,     5,     4,     4,
       6,     5,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     0,     1,     3,     1,     1,     4,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       0,     2,     0,     2,     1,     3,     0,     4,     1,     3,
       2,     2,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    12,     0,     0,     0,     0,    50,    18,     0,    43,
       0,     0,     2,     3,    10,    11,     0,     6,     8,     5,
       7,    16,     0,     0,   320,     0,     0,     0,     0,   152,
       9,     1,     4,    13,     0,     0,    49,     0,     0,    47,
     312,   310,   311,   313,    51,   309,   185,   186,   187,   188,
       0,    14,    20,   156,     0,    31,    30,    34,    33,   152,
      26,     0,    32,    35,   153,   155,    17,     0,    48,     0,
     332,   333,   334,   335,   336,   339,   337,   338,   340,   300,
     318,   328,   321,   324,   301,   319,    86,     0,     0,     0,
      29,    27,    44,     0,     0,    37,     0,     0,   154,    15,
     330,   331,   326,     0,    92,    90,    91,    93,    94,    96,
      95,     0,    97,     0,    64,     0,     0,    98,    99,   100,
     101,   102,     0,    87,    88,     0,     0,     0,    39,     0,
      86,    28,   302,   329,     0,   325,     0,    68,     0,     0,
       0,    52,    89,    19,   314,   315,   316,     0,   317,     0,
       0,     0,   322,    36,   318,    42,   303,   305,   306,   327,
       0,     0,    71,    72,    74,    73,    75,    76,   320,     0,
      70,     0,     0,     0,    54,     0,     0,    40,    38,     0,
       0,   320,     0,    63,    62,     0,     0,    61,    65,    66,
      67,    55,   146,    24,    25,    21,    23,   308,   323,     0,
     304,    77,    69,    57,     0,   150,   149,   151,     0,     0,
     146,     0,   144,   307,     0,   148,    56,    53,   145,     0,
     184,   147,    58,     0,   158,     0,     0,     0,     0,     0,
       0,     0,   168,     0,   171,   174,     0,   137,     0,   138,
     241,     0,     0,     0,   258,   259,   260,   302,   209,   173,
     181,   182,   183,   128,     0,     0,   164,   211,   212,   213,
     265,   180,   165,   285,   284,   261,   118,     0,   177,     0,
       0,     0,     0,   179,     0,   166,   167,     0,     0,     0,
       0,   341,   342,     0,   176,   261,     0,    80,   126,   129,
     178,   283,   135,   157,     0,   244,   245,   246,   247,   250,
     251,   252,   253,   249,   248,   254,   255,   256,     0,     0,
     320,     0,    59,     0,     0,   293,   294,   295,   296,   297,
     298,   299,   292,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   283,   110,   131,   131,     0,   281,
       0,   118,   139,   267,   263,   264,   262,   214,     0,     0,
     339,   340,   302,   215,   216,   217,     0,   208,   318,   190,
       0,   243,   120,   121,   122,   123,   125,   119,   118,     0,
     289,     0,     0,   288,     0,   205,   162,   169,   159,   170,
       0,     0,   204,     0,    84,     0,     0,     0,     0,     0,
     278,   339,     0,   140,   273,   339,     0,   269,   189,   199,
     197,   198,   203,   257,   191,   223,   232,   233,   237,   226,
     227,   228,   229,   230,   231,   224,   234,   235,   236,   225,
     320,   240,   218,   219,   220,   221,   222,   238,   239,     0,
       0,     0,    60,   291,     0,   287,     0,     0,   320,   163,
     161,     0,     0,     0,   242,     0,     0,     0,     0,   132,
       0,   127,     0,   130,   282,     0,   279,     0,     0,     0,
     136,   272,     0,     0,   266,     0,     0,   320,     0,   320,
       0,   192,     0,     0,   290,   286,   206,     0,   160,   172,
     175,   112,     0,     0,     0,     0,    82,   111,   273,   133,
       0,     0,   141,   339,   142,   275,   276,   274,   271,   339,
     268,   200,   195,     0,   201,     0,   193,   194,   124,   207,
      85,     0,     0,     0,     0,   113,     0,   134,   280,   267,
       0,     0,     0,   196,   202,   104,     0,   105,   107,     0,
     106,     0,     0,    83,     0,   143,     0,   270,     0,     0,
       0,   116,     0,    81,     0,   210,   277,   103,   109,   108,
       0,   118,   114,     0,   115,   117
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    11,    12,    13,    14,    15,    16,    17,    27,    58,
      88,    89,   195,    59,    60,    96,    97,   130,   153,    18,
      29,    61,    19,    25,    20,    26,    86,   174,   192,   208,
     214,   222,   117,   118,   119,   120,   121,   169,   170,   209,
     250,   335,   515,   447,   122,   123,   124,   486,   384,   448,
     532,   544,   550,   312,   367,   251,   336,   252,   337,   385,
     452,   253,   342,   254,   392,   210,   211,   212,    63,    64,
      65,   221,   377,   378,   440,   255,   277,   279,   280,    50,
     400,   256,   291,   356,   429,   257,   286,   258,   311,   259,
     260,   261,   294,   396,   397,   461,   497,   339,   340,   262,
     263,   264,   323,   324,    80,   155,   156,   157,    44,    45,
     146,   158,   148,    37,    38,   179,   180,    82,   134,    83,
      84,    85,   283
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -431
static const yytype_int16 yypact[] =
{
      73,  -431,   -78,   -44,   -65,   -48,  -431,  -431,   -24,  -431,
     116,   143,    73,  -431,  -431,  -431,   144,  -431,  -431,  -431,
    -431,  -431,    33,    94,    53,   162,    72,   169,   170,    16,
    -431,  -431,  -431,  -431,    66,    77,  -431,    70,   285,  -431,
    -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,
      87,  -431,    84,  -431,   192,  -431,  -431,  -431,  -431,    30,
    -431,    96,  -431,    14,   100,  -431,  -431,   196,  -431,   599,
    -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,
    -431,   130,   -50,  -431,  -431,  -431,   578,    83,    93,    97,
    -431,  -431,  -431,   599,   105,  -431,   218,   118,  -431,  -431,
    -431,   599,  -431,   285,  -431,  -431,  -431,  -431,  -431,  -431,
    -431,   106,  -431,   107,   112,   113,   114,  -431,  -431,  -431,
    -431,  -431,   230,   578,  -431,   115,   585,   585,  -431,   168,
     578,  -431,   510,  -431,   285,  -431,   -42,    85,   129,   136,
     137,  -431,  -431,  -431,  -431,  -431,  -431,   134,  -431,   135,
     149,   158,  -431,  -431,   140,  -431,   197,  -431,  -431,  -431,
     142,   145,  -431,  -431,  -431,  -431,  -431,  -431,  -431,   -64,
    -431,   146,   150,   152,   258,   -52,   -52,  -431,  -431,   155,
     285,  -431,   510,  -431,  -431,   157,    85,  -431,  -431,  -431,
    -431,  -431,     5,  -431,  -431,  -431,  -431,  -431,   -50,   159,
    -431,  -431,  -431,  -431,   264,  -431,  -431,  -431,   281,   216,
      11,   271,  -431,  -431,   169,  -431,  -431,  -431,  -431,   284,
     438,  -431,  -431,    35,  -431,   -57,   416,   455,   599,    52,
     186,   190,  -431,   187,    50,  -431,   -60,  -431,   370,  -431,
    -431,   297,   298,   302,  -431,  -431,  -431,   510,  -431,  -431,
    -431,  -431,  -431,  -431,   185,   307,  -431,  -431,  -431,  -431,
    -431,  -431,  -431,  -431,  -431,   565,  -431,   293,  -431,   599,
     154,   599,   154,  -431,   243,  -431,  -431,   169,   244,   169,
     169,  -431,  -431,   195,  -431,   198,   194,  -431,  -431,  -431,
    -431,   222,  -431,  -431,   199,  -431,  -431,  -431,  -431,  -431,
    -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,   669,   138,
    -431,   599,    -1,   215,   314,  -431,  -431,  -431,  -431,  -431,
    -431,  -431,  -431,   -57,   599,   321,   -57,   599,   599,   232,
      52,   233,   235,   599,   222,  -431,  -431,  -431,   323,  -431,
     -46,  -431,   613,   627,  -431,  -431,  -431,  -431,   530,   -60,
     220,   223,   510,  -431,  -431,  -431,   599,  -431,   -75,   528,
     225,  -431,  -431,  -431,  -431,   226,  -431,  -431,  -431,   -57,
    -431,   336,   -57,  -431,   342,   -14,   254,   283,  -431,  -431,
     234,   238,  -431,   -35,     2,    26,    21,    52,   299,   239,
      -1,   341,   -19,  -431,  -431,   343,   -16,  -431,  -431,   294,
      23,    44,  -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,
    -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,
    -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,   599,
     245,   253,    -1,  -431,   -57,  -431,   -57,   599,  -431,  -431,
    -431,   232,   115,   115,  -431,   599,   599,   102,   351,  -431,
     599,  -431,   362,  -431,  -431,   348,  -431,   370,   599,   641,
    -431,    57,   599,   655,  -431,   599,   599,  -431,   599,  -431,
     246,  -431,   599,   247,  -431,  -431,  -431,   250,  -431,  -431,
    -431,  -431,   365,   599,   599,   333,   100,  -431,  -431,  -431,
      52,   256,  -431,   361,  -431,  -431,   259,  -431,  -431,   364,
    -431,  -431,  -431,   288,  -431,   289,  -431,  -431,  -431,  -431,
    -431,    22,   389,    24,    29,  -431,   401,    57,  -431,   627,
     599,   305,   599,  -431,  -431,  -431,   599,  -431,  -431,   599,
    -431,   599,    13,  -431,    -8,  -431,   292,  -431,   413,   414,
     415,  -431,    52,  -431,   418,  -431,  -431,  -431,  -431,  -431,
     169,  -431,  -431,   232,    -1,  -431
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -431,  -431,  -431,   419,   110,  -163,  -431,  -431,  -431,   206,
    -431,  -431,   257,  -431,   373,  -431,  -431,  -431,    89,  -431,
    -431,  -431,   111,    91,  -431,  -431,  -431,  -431,  -431,  -431,
    -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,   266,  -431,
    -431,  -431,  -431,  -431,   312,  -431,   330,  -431,  -431,  -431,
    -431,  -431,  -431,  -334,  -431,  -431,  -431,  -431,  -431,   117,
    -431,  -431,  -431,  -431,  -431,  -431,  -431,   249,   251,  -431,
     -63,  -431,  -431,  -430,  -431,  -431,  -431,  -431,  -431,  -210,
    -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,  -431,
     -13,  -199,  -431,   -56,  -333,   -33,  -431,    68,   123,  -431,
    -431,  -431,   207,   214,  -129,   217,  -431,   287,  -431,   163,
    -220,    45,   -38,  -160,  -431,  -431,  -431,   309,  -431,   -62,
    -431,  -123,   141
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -262
static const yytype_int16 yytable[] =
{
      81,    98,   143,   154,   223,   268,   186,   390,   185,   393,
     203,   478,   445,     4,   362,   363,   364,   365,   -41,     4,
     102,   199,     2,     3,   388,   449,   525,    93,   528,   207,
     449,   100,    21,   530,   432,   388,     2,     3,     5,   284,
     541,   135,    94,   308,   281,    52,    23,   207,  -261,   144,
     282,   459,     5,   154,   463,   128,   437,   145,   193,    52,
     187,   194,   463,   133,   160,    81,    22,   329,   161,   331,
     332,   495,   159,    24,   542,   496,   -78,     1,   389,     2,
       3,     4,   -79,   450,   103,   446,    28,   543,   450,   444,
      95,   265,   526,   466,   529,     5,    81,   366,     6,   531,
     274,   453,     7,   370,   451,   460,   373,   438,   464,   285,
     357,     8,   481,   204,   468,    53,   545,   -45,   154,   204,
      30,   205,   206,   555,    54,     8,   494,   205,   206,    53,
     500,   -46,    55,    56,   162,   163,   164,   165,    54,    57,
      62,   266,    81,    31,   467,   267,    55,    56,    33,   433,
     360,   347,   435,    34,    70,    71,    72,    73,   348,    74,
     -22,   -20,   341,   315,    35,   469,    39,    79,     8,    57,
      62,   147,   149,     9,    51,    36,    66,   483,    40,   345,
     358,    10,    41,   484,   485,    42,    43,    67,   270,   272,
     273,   166,    68,    87,   -22,   167,    90,    92,   349,    53,
      99,   379,   101,   125,   126,   341,   168,   127,   316,   317,
     318,   319,   320,   321,   474,   129,   475,   554,    46,    47,
      48,    49,   131,   154,   322,    75,    76,    77,    78,   136,
     137,   314,   132,   325,   141,   138,   139,   140,   150,   171,
      70,    71,    72,    73,   244,    74,   172,   173,   350,    76,
      77,   351,   352,    79,   175,   176,   177,   178,   454,   341,
     470,   181,   191,   353,   354,   355,   183,   182,   215,   184,
     188,   359,   219,   361,   189,  -152,   190,   197,   477,   201,
    -152,   213,  -152,  -152,  -152,   216,   371,   217,   224,   374,
     375,  -152,   275,  -152,  -152,   382,   276,   278,  -152,  -152,
    -152,   287,   288,  -152,   394,   394,   289,   503,   292,   505,
     401,   293,   313,   328,   330,   333,   308,   334,   404,   479,
     480,   368,   343,   369,    70,    71,    72,    73,   285,    74,
     372,  -152,   338,  -152,  -152,  -152,  -152,    79,   376,   380,
     553,   381,   387,  -259,  -152,   434,  -260,   430,  -152,   431,
    -152,   436,   439,   441,   442,   487,   514,    69,   443,   457,
     458,   518,   462,   473,   465,   472,   489,   490,   506,   510,
      53,   508,   509,  -152,  -152,  -152,  -152,  -152,  -152,   519,
     520,  -152,   521,   522,  -152,  -152,  -152,    70,    71,    72,
      73,   471,    74,   527,  -152,    75,    76,    77,    78,   476,
      79,    70,    71,    72,    73,   533,    74,   394,   482,   455,
     523,   524,   488,   551,    79,   536,   546,   547,   548,   549,
     492,   394,   552,   516,   498,   394,   249,   501,   502,   269,
     504,    32,    91,   196,   507,    70,    71,    72,    73,   399,
      74,   403,   151,   513,   491,   511,   512,   225,    79,   226,
     227,   228,   202,   142,   386,   517,   456,   383,   229,   218,
     230,   231,   220,   534,   290,   232,   233,   234,   271,   200,
     235,   346,    70,    71,    72,    73,   244,    74,     0,   326,
     245,   394,   535,   246,   537,    79,   327,     0,   538,   198,
     402,   539,     0,   540,     0,     0,     0,     0,   236,     0,
     237,   238,   239,   240,     0,     0,     0,     0,     0,     0,
       0,   241,     0,     0,     0,   242,     0,   243,    70,    71,
      72,    73,     0,    74,     0,     0,    75,    76,    77,    78,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
      70,    71,    72,    73,   244,    74,     0,     0,   245,     0,
       0,   246,   247,    79,     0,     0,     0,    70,    71,    72,
      73,   248,    74,     0,     0,    75,    76,    77,    78,   405,
      79,     0,     0,     0,     0,   406,   407,     0,     0,     0,
       0,   408,   409,   410,   411,   412,   413,   414,     0,     0,
       0,     0,     0,     0,   415,   416,   417,   418,   295,   296,
     297,   298,   299,   300,   301,   302,     0,   303,   304,   305,
     306,   307,    70,    71,    72,    73,   144,    74,     0,     0,
      75,    76,    77,    78,   145,    79,     0,     0,     0,     0,
       0,   152,    70,    71,    72,    73,   398,    74,     0,     0,
      75,    76,    77,    78,     0,    79,     0,   419,     0,   420,
       0,    24,     0,     0,   421,   422,   423,   424,   425,   426,
     427,   428,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,     0,   115,   116,     0,     0,     0,     0,
       0,     0,     0,   308,     0,   309,   310,    70,    71,    72,
      73,   144,    74,     0,     0,    75,    76,    77,    78,   145,
      79,    70,    71,    72,    73,     0,    74,     0,     0,    75,
      76,    77,    78,     0,    79,    70,    71,    72,    73,     0,
      74,     0,     0,   391,    76,    77,    78,     0,    79,    70,
      71,    72,    73,     0,    74,     0,     0,   395,    76,    77,
      78,     0,    79,    70,    71,    72,    73,     0,    74,     0,
       0,   493,    76,    77,    78,     0,    79,    70,    71,    72,
      73,     0,    74,     0,     0,   499,    76,    77,    78,     0,
      79,    70,    71,    72,    73,    40,    74,     0,     0,   344,
       0,     0,     0,    43,    79
};

static const yytype_int16 yycheck[] =
{
      38,    64,   125,   132,   214,   225,    70,   341,   168,   342,
       5,   441,    10,     8,    15,    16,    17,    18,     4,     8,
      70,   181,     6,     7,    70,     4,     4,    13,     4,   192,
       4,    69,   110,     4,   368,    70,     6,     7,    22,   238,
      27,   103,    28,   118,   104,    29,   111,   210,   123,   106,
     110,    70,    22,   182,    70,    93,    70,   114,   110,    29,
     124,   113,    70,   101,   106,   103,   110,   277,   110,   279,
     280,    14,   134,   121,    61,    18,    71,     4,   124,     6,
       7,     8,    71,    62,   134,    83,   110,    74,    62,   124,
      76,   220,    70,    70,    70,    22,   134,    98,    25,    70,
     229,    80,    29,   323,    78,   124,   326,   121,   124,   238,
     309,    95,   445,   108,    70,    99,   124,   101,   247,   108,
       4,   116,   117,   553,   108,    95,   459,   116,   117,    99,
     463,   101,   116,   117,    49,    50,    51,    52,   108,    29,
      29,   106,   180,     0,   121,   110,   116,   117,     4,   369,
     310,    13,   372,   120,   102,   103,   104,   105,    20,   107,
     110,   111,   291,     9,    70,   121,     4,   115,    95,    59,
      59,   126,   127,   100,     4,   122,   110,    75,   106,   308,
     309,   108,   110,    81,    82,   113,   114,   110,   226,   227,
     228,   106,   122,   106,   110,   110,     4,   101,    60,    99,
       4,   330,    72,   120,   111,   334,   121,   110,    54,    55,
      56,    57,    58,    59,   434,   110,   436,   551,    49,    50,
      51,    52,     4,   352,    70,   110,   111,   112,   113,   123,
     123,   269,   114,   271,     4,   123,   123,   123,    70,   110,
     102,   103,   104,   105,   106,   107,   110,   110,   110,   111,
     112,   113,   114,   115,   120,   120,   107,    99,   387,   388,
     420,   121,     4,   125,   126,   127,   124,    70,     4,   124,
     124,   309,     1,   311,   124,     4,   124,   122,   438,   122,
       9,   122,    11,    12,    13,     4,   324,    71,     4,   327,
     328,    20,   106,    22,    23,   333,   106,   110,    27,    28,
      29,     4,     4,    32,   342,   343,     4,   467,   123,   469,
     348,     4,    19,    70,    70,   120,   118,   123,   356,   442,
     443,   106,   123,     9,   102,   103,   104,   105,   457,   107,
       9,    60,   110,    62,    63,    64,    65,   115,   106,   106,
     550,   106,    19,   123,    73,     9,   123,   122,    77,   123,
      79,     9,    98,    70,   120,     4,   485,    72,   120,   120,
      19,   490,    19,   110,    70,   120,     4,    19,   122,     4,
      99,   124,   122,   102,   103,   104,   105,   106,   107,   123,
      19,   110,   123,    19,   113,   114,   115,   102,   103,   104,
     105,   429,   107,     4,   123,   110,   111,   112,   113,   437,
     115,   102,   103,   104,   105,     4,   107,   445,   446,   110,
     122,   122,   450,   542,   115,   110,   124,     4,     4,     4,
     458,   459,     4,   486,   462,   463,   220,   465,   466,    13,
     468,    12,    59,   176,   472,   102,   103,   104,   105,   348,
     107,   352,   130,   110,   457,   483,   484,     9,   115,    11,
      12,    13,   186,   123,   337,   488,   388,   334,    20,   210,
      22,    23,   211,   519,   247,    27,    28,    29,    13,   182,
      32,   308,   102,   103,   104,   105,   106,   107,    -1,   272,
     110,   519,   520,   113,   522,   115,   272,    -1,   526,   180,
     349,   529,    -1,   531,    -1,    -1,    -1,    -1,    60,    -1,
      62,    63,    64,    65,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    73,    -1,    -1,    -1,    77,    -1,    79,   102,   103,
     104,   105,    -1,   107,    -1,    -1,   110,   111,   112,   113,
      -1,   115,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,   104,   105,   106,   107,    -1,    -1,   110,    -1,
      -1,   113,   114,   115,    -1,    -1,    -1,   102,   103,   104,
     105,   123,   107,    -1,    -1,   110,   111,   112,   113,    41,
     115,    -1,    -1,    -1,    -1,    47,    48,    -1,    -1,    -1,
      -1,    53,    54,    55,    56,    57,    58,    59,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    67,    68,    69,    33,    34,
      35,    36,    37,    38,    39,    40,    -1,    42,    43,    44,
      45,    46,   102,   103,   104,   105,   106,   107,    -1,    -1,
     110,   111,   112,   113,   114,   115,    -1,    -1,    -1,    -1,
      -1,   121,   102,   103,   104,   105,   106,   107,    -1,    -1,
     110,   111,   112,   113,    -1,   115,    -1,   119,    -1,   121,
      -1,   121,    -1,    -1,   126,   127,   128,   129,   130,   131,
     132,   133,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    -1,    96,    97,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   118,    -1,   120,   121,   102,   103,   104,
     105,   106,   107,    -1,    -1,   110,   111,   112,   113,   114,
     115,   102,   103,   104,   105,    -1,   107,    -1,    -1,   110,
     111,   112,   113,    -1,   115,   102,   103,   104,   105,    -1,
     107,    -1,    -1,   110,   111,   112,   113,    -1,   115,   102,
     103,   104,   105,    -1,   107,    -1,    -1,   110,   111,   112,
     113,    -1,   115,   102,   103,   104,   105,    -1,   107,    -1,
      -1,   110,   111,   112,   113,    -1,   115,   102,   103,   104,
     105,    -1,   107,    -1,    -1,   110,   111,   112,   113,    -1,
     115,   102,   103,   104,   105,   106,   107,    -1,    -1,   110,
      -1,    -1,    -1,   114,   115
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     4,     6,     7,     8,    22,    25,    29,    95,   100,
     108,   136,   137,   138,   139,   140,   141,   142,   154,   157,
     159,   110,   110,   111,   121,   158,   160,   143,   110,   155,
       4,     0,   138,     4,   120,    70,   122,   248,   249,     4,
     106,   110,   113,   114,   243,   244,    49,    50,    51,    52,
     214,     4,    29,    99,   108,   116,   117,   139,   144,   148,
     149,   156,   157,   203,   204,   205,   110,   110,   122,    72,
     102,   103,   104,   105,   107,   110,   111,   112,   113,   115,
     239,   247,   252,   254,   255,   256,   161,   106,   145,   146,
       4,   149,   101,    13,    28,    76,   150,   151,   205,     4,
     247,    72,    70,   134,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    96,    97,   167,   168,   169,
     170,   171,   179,   180,   181,   120,   111,   110,   247,   110,
     152,     4,   114,   247,   253,   254,   123,   123,   123,   123,
     123,     4,   181,   256,   106,   114,   245,   246,   247,   246,
      70,   179,   121,   153,   239,   240,   241,   242,   246,   254,
     106,   110,    49,    50,    51,    52,   106,   110,   121,   172,
     173,   110,   110,   110,   162,   120,   120,   107,    99,   250,
     251,   121,    70,   124,   124,   248,    70,   124,   124,   124,
     124,     4,   163,   110,   113,   147,   147,   122,   252,   248,
     242,   122,   173,     5,   108,   116,   117,   140,   164,   174,
     200,   201,   202,   122,   165,     4,     4,    71,   202,     1,
     203,   206,   166,   214,     4,     9,    11,    12,    13,    20,
      22,    23,    27,    28,    29,    32,    60,    62,    63,    64,
      65,    73,    77,    79,   106,   110,   113,   114,   123,   144,
     175,   190,   192,   196,   198,   210,   216,   220,   222,   224,
     225,   226,   234,   235,   236,   239,   106,   110,   245,    13,
     247,    13,   247,   247,   239,   106,   106,   211,   110,   212,
     213,   104,   110,   257,   226,   239,   221,     4,     4,     4,
     240,   217,   123,     4,   227,    33,    34,    35,    36,    37,
      38,    39,    40,    42,    43,    44,    45,    46,   118,   120,
     121,   223,   188,    19,   247,     9,    54,    55,    56,    57,
      58,    59,    70,   237,   238,   247,   237,   238,    70,   214,
      70,   214,   214,   120,   123,   176,   191,   193,   110,   232,
     233,   239,   197,   123,   110,   239,   244,    13,    20,    60,
     110,   113,   114,   125,   126,   127,   218,   226,   239,   247,
     248,   247,    15,    16,    17,    18,    98,   189,   106,     9,
     245,   247,     9,   245,   247,   247,   106,   207,   208,   239,
     106,   106,   247,   233,   183,   194,   194,    19,    70,   124,
     188,   110,   199,   229,   247,   110,   228,   229,   106,   158,
     215,   247,   257,   153,   247,    41,    47,    48,    53,    54,
      55,    56,    57,    58,    59,    66,    67,    68,    69,   119,
     121,   126,   127,   128,   129,   130,   131,   132,   133,   219,
     122,   123,   188,   245,     9,   245,     9,    70,   121,    98,
     209,    70,   120,   120,   124,    10,    83,   178,   184,     4,
      62,    78,   195,    80,   239,   110,   232,   120,    19,    70,
     124,   230,    19,    70,   124,    70,    70,   121,    70,   121,
     248,   247,   120,   110,   245,   245,   247,   248,   208,   256,
     256,   229,   247,    75,    81,    82,   182,     4,   247,     4,
      19,   225,   247,   110,   229,    14,    18,   231,   247,   110,
     229,   247,   247,   248,   247,   248,   122,   247,   124,   122,
       4,   247,   247,   110,   239,   177,   205,   230,   239,   123,
      19,   123,    19,   122,   122,     4,    70,     4,     4,    70,
       4,    70,   185,     4,   228,   247,   110,   247,   247,   247,
     247,    27,    61,    74,   186,   124,   124,     4,     4,     4,
     187,   239,     4,   214,   188,   208
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
#line 779 "compilers/imcc/imcc.y"
    { if (yynerrs) YYABORT; (yyval.i) = 0; ;}
    break;

  case 5:
#line 788 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 6:
#line 789 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 7:
#line 791 "compilers/imcc/imcc.y"
    {
           (yyval.i) = (yyvsp[(1) - (1)].i);
           imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
           IMCC_INFO(interp)->cur_unit = 0;
         ;}
    break;

  case 8:
#line 797 "compilers/imcc/imcc.y"
    {
           (yyval.i) = (yyvsp[(1) - (1)].i);
           imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
           IMCC_INFO(interp)->cur_unit = 0;
         ;}
    break;

  case 9:
#line 802 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 10:
#line 803 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 11:
#line 804 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 12:
#line 805 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 13:
#line 809 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 14:
#line 811 "compilers/imcc/imcc.y"
    {
           (yyval.i) = 0;
           do_loadlib(interp, (yyvsp[(2) - (3)].s));
           mem_sys_free((yyvsp[(2) - (3)].s));
         ;}
    break;

  case 15:
#line 820 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->line = atoi((yyvsp[(2) - (5)].s));
           set_filename(interp, (yyvsp[(4) - (5)].s));
         ;}
    break;

  case 16:
#line 829 "compilers/imcc/imcc.y"
    {
            STRING * const hll_name = string_unescape_cstring(interp, (yyvsp[(2) - (2)].s) + 1, '"', NULL);
            CONTEXT(interp)->current_HLL =
                Parrot_register_HLL(interp, hll_name);

            IMCC_INFO(interp)->cur_namespace = NULL;
            (yyval.t) = 0;
         ;}
    break;

  case 17:
#line 838 "compilers/imcc/imcc.y"
    {
            Parrot_Context *ctx           = CONTEXT(interp);
            STRING * const  built_in_name =
                string_unescape_cstring(interp, (yyvsp[(2) - (4)].s) + 1, '"', NULL);
            STRING * const language_name  =
                string_unescape_cstring(interp, (yyvsp[(4) - (4)].s) + 1, '"', NULL);

            int             built_in_type = pmc_type(interp, built_in_name);
            int             language_type = pmc_type(interp, language_name);

            Parrot_register_HLL_type(interp, ctx->current_HLL,
                built_in_type, language_type);
            (yyval.t) = 0;
         ;}
    break;

  case 18:
#line 855 "compilers/imcc/imcc.y"
    { is_def = 1; ;}
    break;

  case 19:
#line 856 "compilers/imcc/imcc.y"
    {
             mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1);
             mem_sys_free((yyvsp[(4) - (6)].s));
             is_def = 0;
         ;}
    break;

  case 20:
#line 864 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 21:
#line 865 "compilers/imcc/imcc.y"
    {
           (yyval.i) = mk_pmc_const(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].s));
           is_def = 0;
         ;}
    break;

  case 22:
#line 870 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 23:
#line 871 "compilers/imcc/imcc.y"
    {
           (yyval.i) = mk_pmc_const_named(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].s));
           is_def = 0;
         ;}
    break;

  case 28:
#line 887 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 29:
#line 888 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 30:
#line 889 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 31:
#line 890 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 32:
#line 891 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 35:
#line 896 "compilers/imcc/imcc.y"
    { clear_state(interp); ;}
    break;

  case 36:
#line 898 "compilers/imcc/imcc.y"
    {
           (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit,
                    (yyvsp[(2) - (3)].s), 0, IMCC_INFO(interp)->regs,
                    IMCC_INFO(interp)->nargs, IMCC_INFO(interp) -> keyvec, 1);
           /* XXX: can't seem to mem_sys_free($1) here */
         ;}
    break;

  case 37:
#line 905 "compilers/imcc/imcc.y"
    {
           imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
           IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM);
         ;}
    break;

  case 38:
#line 910 "compilers/imcc/imcc.y"
    {
           (yyval.i) = iSUBROUTINE(interp,
                    IMCC_INFO(interp)->cur_unit,
                    mk_sub_label(interp, (yyvsp[(4) - (4)].s)));
           IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(3) - (4)].t);
         ;}
    break;

  case 39:
#line 917 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(2) - (2)].sr));
         ;}
    break;

  case 40:
#line 921 "compilers/imcc/imcc.y"
    {
           SymReg *r = mk_pasm_reg(interp, (yyvsp[(4) - (4)].s));
           set_lexical(interp, r, (yyvsp[(2) - (4)].s));
           (yyval.i) = 0;
           mem_sys_free((yyvsp[(2) - (4)].s));
           mem_sys_free((yyvsp[(4) - (4)].s));
         ;}
    break;

  case 41:
#line 928 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;;}
    break;

  case 43:
#line 936 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM); ;}
    break;

  case 44:
#line 939 "compilers/imcc/imcc.y"
    {
           /* if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
           */
           (yyval.i) = 0;
         ;}
    break;

  case 47:
#line 955 "compilers/imcc/imcc.y"
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

  case 48:
#line 970 "compilers/imcc/imcc.y"
    {
            if (IMCC_INFO(interp)->in_slice)
                IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR,
                    "Slice not allowed in namespace.");

            (yyval.sr) = (yyvsp[(2) - (3)].sr);
        ;}
    break;

  case 49:
#line 977 "compilers/imcc/imcc.y"
    { (yyval.sr) = NULL; ;}
    break;

  case 50:
#line 982 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PCCSUB);
         ;}
    break;

  case 51:
#line 986 "compilers/imcc/imcc.y"
    {
           iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (3)].sr));
         ;}
    break;

  case 52:
#line 989 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(5) - (6)].t); ;}
    break;

  case 53:
#line 991 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 54:
#line 995 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 55:
#line 996 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 56:
#line 998 "compilers/imcc/imcc.y"
    {
           if (IMCC_INFO(interp)->adv_named_id) {
                 add_pcc_named_param(interp, IMCC_INFO(interp)->cur_call,
                                     IMCC_INFO(interp)->adv_named_id, (yyvsp[(2) - (3)].sr));
                 IMCC_INFO(interp)->adv_named_id = NULL;
           }
           else
               add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
         ;}
    break;

  case 57:
#line 1010 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 58:
#line 1010 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(3) - (3)].sr); is_def=0; ;}
    break;

  case 59:
#line 1015 "compilers/imcc/imcc.y"
    {
           if ((yyvsp[(3) - (3)].t) & VT_UNIQUE_REG)
               (yyval.sr) = mk_ident_ur(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
           else
               (yyval.sr) = mk_ident(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
           (yyval.sr)->type |= (yyvsp[(3) - (3)].t);
           mem_sys_free((yyvsp[(2) - (3)].s));
          ;}
    break;

  case 60:
#line 1026 "compilers/imcc/imcc.y"
    {
            if ((yyvsp[(5) - (5)].t) & VT_UNIQUE_REG)
                (yyval.sr) = mk_ident_ur(interp, (yyvsp[(4) - (5)].s), (yyvsp[(1) - (5)].t));
            else
                (yyval.sr) = mk_ident(interp, (yyvsp[(4) - (5)].s), (yyvsp[(1) - (5)].t));
            (yyval.sr)->type |= (yyvsp[(5) - (5)].t);
            adv_named_set(interp, (yyvsp[(2) - (5)].s));
            mem_sys_free((yyvsp[(4) - (5)].s));
          ;}
    break;

  case 61:
#line 1040 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 62:
#line 1045 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           IMCC_INFO(interp)->cur_unit->outer = mk_sub_address_fromc(interp, (yyvsp[(3) - (4)].s));
           mem_sys_free((yyvsp[(3) - (4)].s));
         ;}
    break;

  case 63:
#line 1051 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           IMCC_INFO(interp)->cur_unit->outer = mk_const(interp, (yyvsp[(3) - (4)].s), 'S');
           mem_sys_free((yyvsp[(3) - (4)].s));
         ;}
    break;

  case 64:
#line 1060 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           IMCC_INFO(interp)->cur_unit->vtable_name = NULL;
           IMCC_INFO(interp)->cur_unit->is_vtable_method = 1;
         ;}
    break;

  case 65:
#line 1066 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           IMCC_INFO(interp)->cur_unit->vtable_name = (yyvsp[(3) - (4)].s);
           IMCC_INFO(interp)->cur_unit->is_vtable_method = 1;
         ;}
    break;

  case 66:
#line 1075 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           IMCC_INFO(interp)->cur_unit->instance_of = (yyvsp[(3) - (4)].s);
         ;}
    break;

  case 67:
#line 1083 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           IMCC_INFO(interp)->cur_unit->subid = mk_const(interp, (yyvsp[(3) - (4)].s), 'S');
           mem_sys_free((yyvsp[(3) - (4)].s));
         ;}
    break;

  case 68:
#line 1092 "compilers/imcc/imcc.y"
    {
           add_pcc_multi(IMCC_INFO(interp)->cur_call, NULL);
         ;}
    break;

  case 69:
#line 1096 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr));
         ;}
    break;

  case 70:
#line 1101 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr));
         ;}
    break;

  case 71:
#line 1108 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, "INTVAL",   'S'); ;}
    break;

  case 72:
#line 1109 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, "FLOATVAL", 'S'); ;}
    break;

  case 73:
#line 1110 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, "PMC",      'S'); ;}
    break;

  case 74:
#line 1111 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, "STRING",   'S'); ;}
    break;

  case 75:
#line 1113 "compilers/imcc/imcc.y"
    {
           SymReg *r;
           if (strcmp((yyvsp[(1) - (1)].s), "_") != 0)
               r = mk_const(interp, (yyvsp[(1) - (1)].s), 'S');
           else {
               r = mk_const(interp, "PMC", 'S');
           }
           mem_sys_free((yyvsp[(1) - (1)].s));
           (yyval.sr) = r;
         ;}
    break;

  case 76:
#line 1124 "compilers/imcc/imcc.y"
    {
           SymReg *r;
           if (strcmp((yyvsp[(1) - (1)].s), "_") != 0)
               r = mk_const(interp, (yyvsp[(1) - (1)].s), 'S');
           else {
               r = mk_const(interp, "PMC", 'S');
           }
           mem_sys_free((yyvsp[(1) - (1)].s));
           (yyval.sr) = r;
         ;}
    break;

  case 77:
#line 1134 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); ;}
    break;

  case 80:
#line 1144 "compilers/imcc/imcc.y"
    {
           char name[128];
           SymReg *r, *r1;
           Instruction *i;

           snprintf(name, sizeof (name), "%cpcc_sub_call_%d",
                   IMCC_INTERNAL_CHAR, IMCC_INFO(interp)->cnr++);
           (yyval.sr) = r = mk_pcc_sub(interp, name, 0);
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
           r1 = IMCC_INFO(interp)->cur_unit->instructions->symregs[0];
           if (r1 && r1->pcc_sub)
               r1->pcc_sub->calls_a_sub |= 1;
         ;}
    break;

  case 81:
#line 1172 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 82:
#line 1176 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; IMCC_INFO(interp)->cur_call->pcc_sub->label = 0; ;}
    break;

  case 83:
#line 1177 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; IMCC_INFO(interp)->cur_call->pcc_sub->label = 1; ;}
    break;

  case 84:
#line 1181 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; ;}
    break;

  case 85:
#line 1182 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->object = (yyvsp[(2) - (3)].sr); ;}
    break;

  case 86:
#line 1186 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 88:
#line 1191 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (1)].t); ;}
    break;

  case 89:
#line 1192 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); ;}
    break;

  case 90:
#line 1196 "compilers/imcc/imcc.y"
    { (yyval.t) = P_LOAD; ;}
    break;

  case 91:
#line 1197 "compilers/imcc/imcc.y"
    { (yyval.t) = P_INIT; ;}
    break;

  case 92:
#line 1198 "compilers/imcc/imcc.y"
    { (yyval.t) = P_MAIN; ;}
    break;

  case 93:
#line 1199 "compilers/imcc/imcc.y"
    { (yyval.t) = P_IMMEDIATE; ;}
    break;

  case 94:
#line 1200 "compilers/imcc/imcc.y"
    { (yyval.t) = P_POSTCOMP; ;}
    break;

  case 95:
#line 1201 "compilers/imcc/imcc.y"
    { (yyval.t) = P_ANON; ;}
    break;

  case 96:
#line 1202 "compilers/imcc/imcc.y"
    { (yyval.t) = P_METHOD; ;}
    break;

  case 97:
#line 1203 "compilers/imcc/imcc.y"
    { (yyval.t) = P_NEED_LEX; ;}
    break;

  case 103:
#line 1213 "compilers/imcc/imcc.y"
    {
           add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (5)].sr));
           add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         ;}
    break;

  case 104:
#line 1218 "compilers/imcc/imcc.y"
    {
           add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
         ;}
    break;

  case 105:
#line 1222 "compilers/imcc/imcc.y"
    {
           add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
           IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isNCI;
         ;}
    break;

  case 106:
#line 1227 "compilers/imcc/imcc.y"
    {
           add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
         ;}
    break;

  case 107:
#line 1231 "compilers/imcc/imcc.y"
    {
           add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[(2) - (3)].s), 'S'));
         ;}
    break;

  case 108:
#line 1235 "compilers/imcc/imcc.y"
    {
           add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (5)].sr));
           add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         ;}
    break;

  case 109:
#line 1240 "compilers/imcc/imcc.y"
    {
           add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[(2) - (5)].s), 'S'));
           add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         ;}
    break;

  case 110:
#line 1248 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 111:
#line 1249 "compilers/imcc/imcc.y"
    { add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); ;}
    break;

  case 112:
#line 1253 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (2)].sr); ;}
    break;

  case 113:
#line 1258 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 114:
#line 1260 "compilers/imcc/imcc.y"
    {
           if ((yyvsp[(2) - (3)].sr))
               add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
         ;}
    break;

  case 115:
#line 1267 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); ;}
    break;

  case 116:
#line 1268 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 117:
#line 1269 "compilers/imcc/imcc.y"
    {
           IdList *l = (yyvsp[(4) - (4)].idlist);
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

  case 118:
#line 1283 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 119:
#line 1284 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); ;}
    break;

  case 120:
#line 1288 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT;   ;}
    break;

  case 121:
#line 1289 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_OPTIONAL; ;}
    break;

  case 122:
#line 1290 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_OPT_FLAG; ;}
    break;

  case 123:
#line 1291 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_NAMED; ;}
    break;

  case 124:
#line 1292 "compilers/imcc/imcc.y"
    { adv_named_set(interp, (yyvsp[(3) - (4)].s)); (yyval.t) = 0; ;}
    break;

  case 125:
#line 1293 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_UNIQUE_REG; ;}
    break;

  case 126:
#line 1299 "compilers/imcc/imcc.y"
    {
           begin_return_or_yield(interp, 0);
         ;}
    break;

  case 127:
#line 1303 "compilers/imcc/imcc.y"
    {
           (yyval.i) = 0;
           IMCC_INFO(interp)->asm_state = AsmDefault;
         ;}
    break;

  case 128:
#line 1308 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->asm_state = AsmDefault;
           (yyval.i) = 0;
         ;}
    break;

  case 129:
#line 1315 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, 1); ;}
    break;

  case 130:
#line 1317 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->asm_state = AsmDefault; ;}
    break;

  case 131:
#line 1321 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 132:
#line 1323 "compilers/imcc/imcc.y"
    {
           if ((yyvsp[(1) - (2)].sr))
               add_pcc_result(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (2)].sr));
         ;}
    break;

  case 133:
#line 1328 "compilers/imcc/imcc.y"
    {
           if ((yyvsp[(2) - (3)].sr))
               add_pcc_result(IMCC_INFO(interp)->sr_return, (yyvsp[(2) - (3)].sr));
         ;}
    break;

  case 134:
#line 1335 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); ;}
    break;

  case 135:
#line 1340 "compilers/imcc/imcc.y"
    {
          if (IMCC_INFO(interp)->asm_state == AsmDefault)
              begin_return_or_yield(interp, (yyvsp[(1) - (2)].t));
        ;}
    break;

  case 136:
#line 1345 "compilers/imcc/imcc.y"
    {
          IMCC_INFO(interp)->asm_state = AsmDefault;
          (yyval.t) = 0;
        ;}
    break;

  case 137:
#line 1352 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 138:
#line 1353 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; ;}
    break;

  case 139:
#line 1357 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 140:
#line 1359 "compilers/imcc/imcc.y"
    {
           if (IMCC_INFO(interp)->adv_named_id) {
               add_pcc_named_return(interp, IMCC_INFO(interp)->sr_return,
                                    IMCC_INFO(interp)->adv_named_id, (yyvsp[(1) - (1)].sr));
               IMCC_INFO(interp)->adv_named_id = NULL;
           }
           else
               add_pcc_result(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (1)].sr));
         ;}
    break;

  case 141:
#line 1369 "compilers/imcc/imcc.y"
    {
           add_pcc_named_return(interp, IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (3)].s), (yyvsp[(3) - (3)].sr));
         ;}
    break;

  case 142:
#line 1373 "compilers/imcc/imcc.y"
    {
           if (IMCC_INFO(interp)->adv_named_id) {
               add_pcc_named_return(interp, IMCC_INFO(interp)->sr_return,
                                    IMCC_INFO(interp)->adv_named_id, (yyvsp[(3) - (3)].sr));
               IMCC_INFO(interp)->adv_named_id = NULL;
             }
             else
                 add_pcc_result(IMCC_INFO(interp)->sr_return, (yyvsp[(3) - (3)].sr));
         ;}
    break;

  case 143:
#line 1383 "compilers/imcc/imcc.y"
    {
           add_pcc_named_return(interp, IMCC_INFO(interp)->sr_return, (yyvsp[(3) - (5)].s), (yyvsp[(5) - (5)].sr));
         ;}
    break;

  case 146:
#line 1403 "compilers/imcc/imcc.y"
    { clear_state(interp); ;}
    break;

  case 147:
#line 1408 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(2) - (2)].i); ;}
    break;

  case 148:
#line 1409 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 149:
#line 1410 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 150:
#line 1411 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 151:
#line 1412 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 152:
#line 1416 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; ;}
    break;

  case 156:
#line 1427 "compilers/imcc/imcc.y"
    {
           (yyval.i) = iLABEL(interp, IMCC_INFO(interp)->cur_unit, mk_local_label(interp, (yyvsp[(1) - (1)].s)));
         ;}
    break;

  case 157:
#line 1435 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(2) - (3)].i); ;}
    break;

  case 158:
#line 1437 "compilers/imcc/imcc.y"
    {
           if (yynerrs >= PARROT_MAX_RECOVER_ERRORS) {
               IMCC_warning(interp, "Too many errors. Correct some first.\n");
               YYABORT;
           }
           yyerrok;
         ;}
    break;

  case 159:
#line 1448 "compilers/imcc/imcc.y"
    {
           IdList* l = (yyvsp[(1) - (1)].idlist);
           l->next = NULL;
           (yyval.idlist) = l;
         ;}
    break;

  case 160:
#line 1455 "compilers/imcc/imcc.y"
    {
           IdList* l = (yyvsp[(3) - (3)].idlist);
           l->next = (yyvsp[(1) - (3)].idlist);
           (yyval.idlist) = l;
         ;}
    break;

  case 161:
#line 1464 "compilers/imcc/imcc.y"
    {
           IdList* const l = mem_allocate_n_zeroed_typed(1, IdList);
           l->id           = (yyvsp[(1) - (2)].s);
           l->unique_reg   = (yyvsp[(2) - (2)].t);
           (yyval.idlist) = l;
         ;}
    break;

  case 162:
#line 1473 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 163:
#line 1474 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; ;}
    break;

  case 166:
#line 1481 "compilers/imcc/imcc.y"
    { push_namespace(interp, (yyvsp[(2) - (2)].s)); mem_sys_free((yyvsp[(2) - (2)].s)); ;}
    break;

  case 167:
#line 1482 "compilers/imcc/imcc.y"
    { pop_namespace(interp, (yyvsp[(2) - (2)].s)); mem_sys_free((yyvsp[(2) - (2)].s)); ;}
    break;

  case 168:
#line 1483 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 169:
#line 1484 "compilers/imcc/imcc.y"
    {
           IdList *l = (yyvsp[(4) - (4)].idlist);
           while (l) {
               IdList *l1;
               if (l->unique_reg)
                   mk_ident_ur(interp, l->id, (yyvsp[(3) - (4)].t));
               else
                   mk_ident(interp, l->id, (yyvsp[(3) - (4)].t));
               l1 = l;
               l  = l->next;
               mem_sys_free(l1->id);
               mem_sys_free(l1);
           }
           is_def=0; (yyval.i)=0;
         ;}
    break;

  case 170:
#line 1500 "compilers/imcc/imcc.y"
    {
           set_lexical(interp, (yyvsp[(4) - (4)].sr), (yyvsp[(2) - (4)].s)); (yyval.i) = 0;
         ;}
    break;

  case 171:
#line 1503 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 172:
#line 1504 "compilers/imcc/imcc.y"
    {
           mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 0);
           is_def=0;
           mem_sys_free((yyvsp[(4) - (6)].s));
         ;}
    break;

  case 174:
#line 1511 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 175:
#line 1512 "compilers/imcc/imcc.y"
    {
           mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1);
           is_def=0;
           mem_sys_free((yyvsp[(4) - (6)].s));
         ;}
    break;

  case 176:
#line 1518 "compilers/imcc/imcc.y"
    {
           (yyval.i) = NULL;
           IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isTAIL_CALL;
           IMCC_INFO(interp)->cur_call = NULL;
         ;}
    break;

  case 177:
#line 1523 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "branch", 1, (yyvsp[(2) - (2)].sr)); ;}
    break;

  case 178:
#line 1525 "compilers/imcc/imcc.y"
    {
           (yyval.i) = INS(interp,
                    IMCC_INFO(interp)->cur_unit,
                    (yyvsp[(1) - (2)].s),
                    0,
                    IMCC_INFO(interp)->regs,
                    IMCC_INFO(interp)->nargs,
                    IMCC_INFO(interp)->keyvec,
                    1);
           mem_sys_free((yyvsp[(1) - (2)].s));
         ;}
    break;

  case 179:
#line 1536 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(2) - (2)].sr)); ;}
    break;

  case 180:
#line 1537 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 181:
#line 1538 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 184:
#line 1541 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;;}
    break;

  case 185:
#line 1545 "compilers/imcc/imcc.y"
    { (yyval.t) = 'I'; ;}
    break;

  case 186:
#line 1546 "compilers/imcc/imcc.y"
    { (yyval.t) = 'N'; ;}
    break;

  case 187:
#line 1547 "compilers/imcc/imcc.y"
    { (yyval.t) = 'S'; ;}
    break;

  case 188:
#line 1548 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; ;}
    break;

  case 189:
#line 1553 "compilers/imcc/imcc.y"
    {
           /* there'd normally be a str_dup() here, but the lexer already
            * copied the string, so it's safe to use directly */
           if ((IMCC_INFO(interp)->cur_pmc_type = pmc_type(interp,
               string_from_cstring(interp, (yyvsp[(1) - (1)].s), 0))) <= 0) {
               IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR,
                    "Unknown PMC type '%s'\n", (yyvsp[(1) - (1)].s));
           }
         ;}
    break;

  case 190:
#line 1566 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr));  ;}
    break;

  case 191:
#line 1568 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (4)].s), 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));  ;}
    break;

  case 192:
#line 1570 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(4) - (5)].s), 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  ;}
    break;

  case 193:
#line 1572 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(5) - (6)].sr)); ;}
    break;

  case 194:
#line 1574 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 195:
#line 1576 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].s), (yyvsp[(6) - (6)].sr), 1); ;}
    break;

  case 196:
#line 1578 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].s), (yyvsp[(6) - (7)].sr), 1); ;}
    break;

  case 197:
#line 1580 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].s), NULL, 1); ;}
    break;

  case 198:
#line 1582 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 199:
#line 1584 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 200:
#line 1586 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 201:
#line 1588 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 202:
#line 1590 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); ;}
    break;

  case 203:
#line 1592 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "find_global", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));;}
    break;

  case 204:
#line 1594 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "store_global", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 205:
#line 1598 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 206:
#line 1600 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 207:
#line 1602 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); ;}
    break;

  case 208:
#line 1605 "compilers/imcc/imcc.y"
    {
           add_pcc_result((yyvsp[(3) - (3)].i)->symregs[0], (yyvsp[(1) - (3)].sr));
           IMCC_INFO(interp)->cur_call = NULL;
           (yyval.i) = 0;
         ;}
    break;

  case 209:
#line 1611 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
         ;}
    break;

  case 210:
#line 1615 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[(6) - (9)].sr));
           IMCC_INFO(interp)->cur_call = NULL;
         ;}
    break;

  case 214:
#line 1623 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(1) - (3)].sr));
         ;}
    break;

  case 215:
#line 1630 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"not"; ;}
    break;

  case 216:
#line 1631 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"bnot"; ;}
    break;

  case 217:
#line 1632 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"neg"; ;}
    break;

  case 218:
#line 1636 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"sub"; ;}
    break;

  case 219:
#line 1637 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"add"; ;}
    break;

  case 220:
#line 1638 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"mul"; ;}
    break;

  case 221:
#line 1639 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"div"; ;}
    break;

  case 222:
#line 1640 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"mod"; ;}
    break;

  case 223:
#line 1641 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"fdiv"; ;}
    break;

  case 224:
#line 1642 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"pow"; ;}
    break;

  case 225:
#line 1643 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"concat"; ;}
    break;

  case 226:
#line 1644 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"iseq"; ;}
    break;

  case 227:
#line 1645 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"isne"; ;}
    break;

  case 228:
#line 1646 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"isgt"; ;}
    break;

  case 229:
#line 1647 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"isge"; ;}
    break;

  case 230:
#line 1648 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"islt"; ;}
    break;

  case 231:
#line 1649 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"isle"; ;}
    break;

  case 232:
#line 1650 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"shl"; ;}
    break;

  case 233:
#line 1651 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"shr"; ;}
    break;

  case 234:
#line 1652 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"lsr"; ;}
    break;

  case 235:
#line 1653 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"and"; ;}
    break;

  case 236:
#line 1654 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"or"; ;}
    break;

  case 237:
#line 1655 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"xor"; ;}
    break;

  case 238:
#line 1656 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"band"; ;}
    break;

  case 239:
#line 1657 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"bor"; ;}
    break;

  case 240:
#line 1658 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"bxor"; ;}
    break;

  case 241:
#line 1664 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           (yyval.i)->type &= ~ITCALL;
           (yyval.i)->type |= ITRESULT;
         ;}
    break;

  case 242:
#line 1669 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 243:
#line 1676 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(2) - (3)].s), 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr));
         ;}
    break;

  case 244:
#line 1682 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"add"; ;}
    break;

  case 245:
#line 1683 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"sub"; ;}
    break;

  case 246:
#line 1684 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"mul"; ;}
    break;

  case 247:
#line 1685 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"div"; ;}
    break;

  case 248:
#line 1686 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"mod"; ;}
    break;

  case 249:
#line 1687 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"fdiv"; ;}
    break;

  case 250:
#line 1688 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"concat"; ;}
    break;

  case 251:
#line 1689 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"band"; ;}
    break;

  case 252:
#line 1690 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"bor"; ;}
    break;

  case 253:
#line 1691 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"bxor"; ;}
    break;

  case 254:
#line 1692 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"shr"; ;}
    break;

  case 255:
#line 1693 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"shl"; ;}
    break;

  case 256:
#line 1694 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"lsr"; ;}
    break;

  case 257:
#line 1700 "compilers/imcc/imcc.y"
    {
        (yyval.i) = func_ins(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(3) - (4)].s),
                      IMCC_INFO(interp) -> regs,
                      IMCC_INFO(interp) -> nargs,
                      IMCC_INFO(interp) -> keyvec, 1);
         mem_sys_free((yyvsp[(3) - (4)].s));
       ;}
    break;

  case 258:
#line 1710 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s));  mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 259:
#line 1711 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 260:
#line 1712 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 261:
#line 1714 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = (yyvsp[(1) - (1)].sr);
           if ((yyvsp[(1) - (1)].sr)->set != 'P')
               IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR, "Sub isn't a PMC");
         ;}
    break;

  case 262:
#line 1720 "compilers/imcc/imcc.y"
    {
            /* disallow bareword method names; SREG name constants are fine */
            char *name = (yyvsp[(3) - (3)].sr)->name;
            if (!((yyvsp[(3) - (3)].sr)->type & VTREG) && (*name != '\'' || *name != '\"')) {
                IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR,
                    "Bareword method name '%s' not allowed in PIR", (yyvsp[(3) - (3)].sr)->name);
            }

            IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr);
            (yyval.sr)                         = (yyvsp[(3) - (3)].sr);
        ;}
    break;

  case 263:
#line 1732 "compilers/imcc/imcc.y"
    {
            IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr);
            (yyval.sr)                         = mk_const(interp, (yyvsp[(3) - (3)].s), 'S');
            mem_sys_free((yyvsp[(3) - (3)].s));
         ;}
    break;

  case 264:
#line 1737 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); ;}
    break;

  case 265:
#line 1743 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[(1) - (1)].sr));
         ;}
    break;

  case 266:
#line 1747 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(2) - (5)].i); ;}
    break;

  case 267:
#line 1751 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 268:
#line 1753 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = 0;
           if (IMCC_INFO(interp)->adv_named_id) {
               add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, IMCC_INFO(interp)->adv_named_id, (yyvsp[(3) - (3)].sr));
               IMCC_INFO(interp)->adv_named_id = NULL;
           }
           else
               add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr));
         ;}
    break;

  case 269:
#line 1763 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = 0;
           if (IMCC_INFO(interp)->adv_named_id) {
               add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, IMCC_INFO(interp)->adv_named_id, (yyvsp[(1) - (1)].sr));
               IMCC_INFO(interp)->adv_named_id = NULL;
           }
           else
               add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr));
         ;}
    break;

  case 270:
#line 1773 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = 0;
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (5)].s), (yyvsp[(5) - (5)].sr));
           mem_sys_free((yyvsp[(3) - (5)].s));
         ;}
    break;

  case 271:
#line 1779 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = 0;
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (3)].s), (yyvsp[(3) - (3)].sr));
           mem_sys_free((yyvsp[(1) - (3)].s));
         ;}
    break;

  case 272:
#line 1787 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); ;}
    break;

  case 273:
#line 1791 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 274:
#line 1792 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); ;}
    break;

  case 275:
#line 1796 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT; ;}
    break;

  case 276:
#line 1797 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_NAMED; ;}
    break;

  case 277:
#line 1800 "compilers/imcc/imcc.y"
    { adv_named_set(interp, (yyvsp[(3) - (4)].s)); (yyval.t) = 0; ;}
    break;

  case 278:
#line 1804 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); ;}
    break;

  case 279:
#line 1809 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = 0;
           if (IMCC_INFO(interp)->adv_named_id) {
               add_pcc_named_result(interp, IMCC_INFO(interp)->cur_call, IMCC_INFO(interp)->adv_named_id, (yyvsp[(3) - (3)].sr));
               IMCC_INFO(interp)->adv_named_id = NULL;
           }
           else
               add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr));
         ;}
    break;

  case 280:
#line 1819 "compilers/imcc/imcc.y"
    {
           add_pcc_named_result(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (5)].s), (yyvsp[(5) - (5)].sr));
           mem_sys_free((yyvsp[(3) - (5)].s));
         ;}
    break;

  case 281:
#line 1824 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = 0;
           if (IMCC_INFO(interp)->adv_named_id) {
               add_pcc_named_result(interp, IMCC_INFO(interp)->cur_call, IMCC_INFO(interp)->adv_named_id, (yyvsp[(1) - (1)].sr));
               IMCC_INFO(interp)->adv_named_id = NULL;
           }
           else
               add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr));
         ;}
    break;

  case 282:
#line 1834 "compilers/imcc/imcc.y"
    {
           add_pcc_named_result(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (3)].s), (yyvsp[(3) - (3)].sr));
           mem_sys_free((yyvsp[(1) - (3)].s));
         ;}
    break;

  case 283:
#line 1838 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 284:
#line 1842 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 285:
#line 1843 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 286:
#line 1848 "compilers/imcc/imcc.y"
    {
           (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, inv_op((yyvsp[(3) - (6)].s)), 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr));
         ;}
    break;

  case 287:
#line 1852 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));
         ;}
    break;

  case 288:
#line 1856 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr));
         ;}
    break;

  case 289:
#line 1863 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr));
         ;}
    break;

  case 290:
#line 1867 "compilers/imcc/imcc.y"
    {
           (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr));
         ;}
    break;

  case 291:
#line 1871 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));
         ;}
    break;

  case 292:
#line 1877 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 293:
#line 1878 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 294:
#line 1882 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"eq"; ;}
    break;

  case 295:
#line 1883 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"ne"; ;}
    break;

  case 296:
#line 1884 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"gt"; ;}
    break;

  case 297:
#line 1885 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"ge"; ;}
    break;

  case 298:
#line 1886 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"lt"; ;}
    break;

  case 299:
#line 1887 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"le"; ;}
    break;

  case 302:
#line 1896 "compilers/imcc/imcc.y"
    { (yyval.sr) = NULL; ;}
    break;

  case 303:
#line 1897 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (1)].sr); ;}
    break;

  case 304:
#line 1901 "compilers/imcc/imcc.y"
    { (yyval.sr) = IMCC_INFO(interp)->regs[0]; ;}
    break;

  case 306:
#line 1906 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(1) - (1)].sr); ;}
    break;

  case 307:
#line 1908 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(1) - (4)].sr);
           IMCC_INFO(interp) -> keyvec |= KEY_BIT(IMCC_INFO(interp)->nargs);
           IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(3) - (4)].sr);
           (yyval.sr) = (yyvsp[(1) - (4)].sr);
         ;}
    break;

  case 308:
#line 1915 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(2) - (3)].sr);
           (yyval.sr) = (yyvsp[(2) - (3)].sr);
         ;}
    break;

  case 310:
#line 1922 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 311:
#line 1923 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s));  mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 312:
#line 1927 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 313:
#line 1928 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 314:
#line 1932 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 315:
#line 1933 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 320:
#line 1947 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->nkeys    = 0;
           IMCC_INFO(interp)->in_slice = 0;
         ;}
    break;

  case 321:
#line 1952 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = link_keys(interp,
                          IMCC_INFO(interp)->nkeys,
                          IMCC_INFO(interp)->keys, 0);
         ;}
    break;

  case 322:
#line 1960 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->nkeys = 0;
           IMCC_INFO(interp)->in_slice = 0;
         ;}
    break;

  case 323:
#line 1965 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = link_keys(interp,
                          IMCC_INFO(interp)->nkeys,
                          IMCC_INFO(interp)->keys, 1);
         ;}
    break;

  case 324:
#line 1973 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(1) - (1)].sr); ;}
    break;

  case 325:
#line 1975 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(3) - (3)].sr);
           (yyval.sr) = IMCC_INFO(interp)->keys[0];
         ;}
    break;

  case 326:
#line 1979 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->in_slice = 1; ;}
    break;

  case 327:
#line 1981 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(4) - (4)].sr);
           (yyval.sr) = IMCC_INFO(interp)->keys[0];
         ;}
    break;

  case 328:
#line 1989 "compilers/imcc/imcc.y"
    {
           if (IMCC_INFO(interp)->in_slice)
               (yyvsp[(1) - (1)].sr)->type |= VT_START_SLICE | VT_END_SLICE;
           (yyval.sr) = (yyvsp[(1) - (1)].sr);
         ;}
    break;

  case 329:
#line 1995 "compilers/imcc/imcc.y"
    {
           (yyvsp[(1) - (3)].sr)->type |= VT_START_SLICE;
           (yyvsp[(3) - (3)].sr)->type |= VT_END_SLICE;
           IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(1) - (3)].sr);
           (yyval.sr) = (yyvsp[(3) - (3)].sr);
         ;}
    break;

  case 330:
#line 2001 "compilers/imcc/imcc.y"
    { (yyvsp[(2) - (2)].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[(2) - (2)].sr); ;}
    break;

  case 331:
#line 2002 "compilers/imcc/imcc.y"
    { (yyvsp[(1) - (2)].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[(1) - (2)].sr); ;}
    break;

  case 332:
#line 2006 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'I'); ;}
    break;

  case 333:
#line 2007 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'N'); ;}
    break;

  case 334:
#line 2008 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); ;}
    break;

  case 335:
#line 2009 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'P'); ;}
    break;

  case 336:
#line 2010 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_pasm_reg(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 337:
#line 2014 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'I'); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 338:
#line 2015 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'N'); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 339:
#line 2016 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S'); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 340:
#line 2017 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'U'); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 341:
#line 2021 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 342:
#line 2022 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S');  mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4846 "compilers/imcc/imcparser.c"
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


#line 2027 "compilers/imcc/imcc.y"


/* I need this prototype somewhere... */
char *yyget_text(yyscan_t yyscanner);

/* I do not like this function, but, atm, it is the only way I can
 * make the code in yyerror work without segfault on some specific
 * cases.
 */
/* int yyholds_char(yyscan_t yyscanner); */

int yyerror(void *yyscanner, PARROT_INTERP, const char *s)
{
    /* If the error occurr in the end of the buffer (I mean, the last
     * token was already read), yyget_text will return a pointer
     * outside the bison buffer, and thus, not "accessible" by
     * us. This means it may segfault. */
    const char * const chr = yyget_text((yyscan_t)yyscanner);

    /* IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR, s); */
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
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

