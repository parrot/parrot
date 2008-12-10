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
     TK_FILE = 263,
     GOTO = 264,
     ARG = 265,
     IF = 266,
     UNLESS = 267,
     PNULL = 268,
     SET_RETURN = 269,
     SET_YIELD = 270,
     ADV_FLAT = 271,
     ADV_SLURPY = 272,
     ADV_OPTIONAL = 273,
     ADV_OPT_FLAG = 274,
     ADV_NAMED = 275,
     ADV_ARROW = 276,
     NEW = 277,
     ADV_INVOCANT = 278,
     NAMESPACE = 279,
     DOT_METHOD = 280,
     SUB = 281,
     SYM = 282,
     LOCAL = 283,
     LEXICAL = 284,
     CONST = 285,
     INC = 286,
     DEC = 287,
     GLOBAL_CONST = 288,
     PLUS_ASSIGN = 289,
     MINUS_ASSIGN = 290,
     MUL_ASSIGN = 291,
     DIV_ASSIGN = 292,
     CONCAT_ASSIGN = 293,
     BAND_ASSIGN = 294,
     BOR_ASSIGN = 295,
     BXOR_ASSIGN = 296,
     FDIV = 297,
     FDIV_ASSIGN = 298,
     MOD_ASSIGN = 299,
     SHR_ASSIGN = 300,
     SHL_ASSIGN = 301,
     SHR_U_ASSIGN = 302,
     SHIFT_LEFT = 303,
     SHIFT_RIGHT = 304,
     INTV = 305,
     FLOATV = 306,
     STRINGV = 307,
     PMCV = 308,
     LOG_XOR = 309,
     RELOP_EQ = 310,
     RELOP_NE = 311,
     RELOP_GT = 312,
     RELOP_GTE = 313,
     RELOP_LT = 314,
     RELOP_LTE = 315,
     RESULT = 316,
     RETURN = 317,
     TAILCALL = 318,
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
     SUB_INSTANCE_OF = 351,
     SUBID = 352,
     NS_ENTRY = 353,
     UNIQUE_REG = 354,
     LABEL = 355,
     EMIT = 356,
     EOM = 357,
     IREG = 358,
     NREG = 359,
     SREG = 360,
     PREG = 361,
     IDENTIFIER = 362,
     REG = 363,
     MACRO = 364,
     ENDM = 365,
     STRINGC = 366,
     INTC = 367,
     FLOATC = 368,
     USTRINGC = 369,
     PARROT_OP = 370,
     VAR = 371,
     LINECOMMENT = 372,
     FILECOMMENT = 373,
     DOT = 374,
     CONCAT = 375
   };
#endif
/* Tokens.  */
#define LOW_PREC 258
#define PARAM 259
#define HLL 260
#define HLL_MAP 261
#define TK_LINE 262
#define TK_FILE 263
#define GOTO 264
#define ARG 265
#define IF 266
#define UNLESS 267
#define PNULL 268
#define SET_RETURN 269
#define SET_YIELD 270
#define ADV_FLAT 271
#define ADV_SLURPY 272
#define ADV_OPTIONAL 273
#define ADV_OPT_FLAG 274
#define ADV_NAMED 275
#define ADV_ARROW 276
#define NEW 277
#define ADV_INVOCANT 278
#define NAMESPACE 279
#define DOT_METHOD 280
#define SUB 281
#define SYM 282
#define LOCAL 283
#define LEXICAL 284
#define CONST 285
#define INC 286
#define DEC 287
#define GLOBAL_CONST 288
#define PLUS_ASSIGN 289
#define MINUS_ASSIGN 290
#define MUL_ASSIGN 291
#define DIV_ASSIGN 292
#define CONCAT_ASSIGN 293
#define BAND_ASSIGN 294
#define BOR_ASSIGN 295
#define BXOR_ASSIGN 296
#define FDIV 297
#define FDIV_ASSIGN 298
#define MOD_ASSIGN 299
#define SHR_ASSIGN 300
#define SHL_ASSIGN 301
#define SHR_U_ASSIGN 302
#define SHIFT_LEFT 303
#define SHIFT_RIGHT 304
#define INTV 305
#define FLOATV 306
#define STRINGV 307
#define PMCV 308
#define LOG_XOR 309
#define RELOP_EQ 310
#define RELOP_NE 311
#define RELOP_GT 312
#define RELOP_GTE 313
#define RELOP_LT 314
#define RELOP_LTE 315
#define RESULT 316
#define RETURN 317
#define TAILCALL 318
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
#define SUB_INSTANCE_OF 351
#define SUBID 352
#define NS_ENTRY 353
#define UNIQUE_REG 354
#define LABEL 355
#define EMIT 356
#define EOM 357
#define IREG 358
#define NREG 359
#define SREG 360
#define PREG 361
#define IDENTIFIER 362
#define REG 363
#define MACRO 364
#define ENDM 365
#define STRINGC 366
#define INTC 367
#define FLOATC 368
#define USTRINGC 369
#define PARROT_OP 370
#define VAR 371
#define LINECOMMENT 372
#define FILECOMMENT 373
#define DOT 374
#define CONCAT 375




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
#line 1030 "compilers/imcc/imcparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 1043 "compilers/imcc/imcparser.c"

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
#define YYFINAL  33
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   713

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  137
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  126
/* YYNRULES -- Number of rules.  */
#define YYNRULES  346
/* YYNRULES -- Number of states.  */
#define YYNSTATES  558

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   375

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   127,     2,     2,     2,   133,   134,     2,
     125,   126,   131,   130,     2,   129,     2,   132,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   136,
       2,   122,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   123,     2,   124,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   135,     2,   128,     2,     2,     2,
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
     116,   117,   118,   119,   120,   121
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      21,    23,    25,    27,    30,    34,    40,    44,    47,    52,
      53,    60,    61,    68,    69,    76,    78,    80,    82,    85,
      89,    92,    94,    96,    98,   100,   102,   103,   107,   108,
     113,   116,   121,   122,   124,   125,   130,   131,   133,   137,
     141,   144,   145,   146,   147,   158,   159,   161,   165,   166,
     170,   174,   179,   184,   189,   191,   196,   198,   203,   205,
     210,   215,   217,   222,   223,   227,   229,   231,   233,   235,
     237,   239,   241,   245,   246,   248,   249,   259,   260,   263,
     264,   268,   269,   271,   273,   276,   278,   280,   282,   284,
     286,   288,   290,   292,   294,   296,   298,   300,   302,   304,
     310,   314,   318,   322,   326,   332,   338,   339,   343,   346,
     347,   351,   355,   356,   361,   362,   365,   367,   369,   371,
     373,   378,   380,   381,   387,   389,   390,   396,   397,   400,
     404,   405,   408,   412,   416,   420,   421,   427,   429,   431,
     432,   434,   438,   442,   448,   450,   453,   454,   457,   460,
     462,   464,   466,   467,   469,   472,   474,   476,   480,   483,
     485,   489,   492,   493,   495,   497,   499,   500,   505,   510,
     511,   518,   520,   521,   528,   531,   534,   537,   540,   542,
     544,   546,   548,   549,   551,   553,   555,   557,   559,   563,
     568,   574,   581,   588,   595,   603,   608,   613,   618,   625,
     632,   640,   645,   652,   660,   664,   665,   675,   677,   679,
     681,   685,   687,   689,   691,   693,   695,   697,   699,   701,
     703,   705,   707,   709,   711,   713,   715,   717,   719,   721,
     723,   725,   727,   729,   731,   733,   735,   737,   738,   744,
     748,   750,   752,   754,   756,   758,   760,   762,   764,   766,
     768,   770,   772,   774,   779,   781,   783,   785,   787,   791,
     795,   799,   800,   806,   807,   811,   813,   819,   823,   826,
     827,   830,   832,   834,   839,   842,   846,   852,   854,   858,
     859,   861,   863,   870,   876,   881,   886,   893,   899,   901,
     903,   905,   907,   909,   911,   913,   915,   917,   919,   920,
     922,   926,   928,   930,   935,   939,   941,   943,   945,   947,
     949,   951,   953,   955,   957,   959,   961,   962,   965,   966,
     969,   971,   975,   976,   981,   983,   987,   990,   993,   995,
     997,   999,  1001,  1003,  1005,  1007,  1009
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     138,     0,    -1,   139,    -1,   140,    -1,   139,   140,    -1,
     159,    -1,   144,    -1,   161,    -1,   156,    -1,   110,     4,
      -1,   141,    -1,   142,    -1,     4,    -1,   143,     4,    -1,
      96,   112,     4,    -1,     8,   113,    71,   112,     4,    -1,
       9,   112,     4,    -1,     6,   112,    -1,     7,   112,   122,
     112,    -1,    -1,    31,   145,   220,   108,   122,   262,    -1,
      -1,    31,   147,   113,   252,   122,   149,    -1,    -1,    31,
     148,   112,   252,   122,   149,    -1,   112,    -1,   115,    -1,
     151,    -1,   150,   151,    -1,   209,   152,     4,    -1,   110,
       4,    -1,   119,    -1,   118,    -1,   159,    -1,   146,    -1,
     141,    -1,    -1,   153,   116,   155,    -1,    -1,    77,   154,
     183,   101,    -1,    14,   253,    -1,    30,   112,    71,   109,
      -1,    -1,   246,    -1,    -1,   102,   157,   158,   103,    -1,
      -1,   150,    -1,    25,   160,     4,    -1,   123,   254,   124,
      -1,   123,   124,    -1,    -1,    -1,    -1,    27,   162,   249,
     163,   183,     4,   164,   165,   178,    72,    -1,    -1,     4,
      -1,   165,   166,     4,    -1,    -1,     5,   167,   168,    -1,
     220,   108,   192,    -1,    94,   125,   176,   126,    -1,    92,
     125,   112,   126,    -1,    92,   125,   108,   126,    -1,    95,
      -1,    95,   125,   112,   126,    -1,    90,    -1,    90,   125,
     149,   126,    -1,    99,    -1,    99,   125,   149,   126,    -1,
      97,   125,   112,   126,    -1,    98,    -1,    98,   125,   149,
     126,    -1,    -1,   176,    71,   177,    -1,   177,    -1,    51,
      -1,    52,    -1,    54,    -1,    53,    -1,   108,    -1,   112,
      -1,   123,   254,   124,    -1,    -1,   206,    -1,    -1,    74,
       4,   180,   187,   182,   186,   181,   189,    75,    -1,    -1,
     211,     4,    -1,    -1,    84,   253,     4,    -1,    -1,   184,
      -1,   185,    -1,   184,   185,    -1,    86,    -1,    87,    -1,
      85,    -1,    88,    -1,    89,    -1,    91,    -1,    93,    -1,
     169,    -1,   170,    -1,   171,    -1,   172,    -1,   173,    -1,
     174,    -1,   175,    -1,    76,   253,    71,   253,     4,    -1,
      76,   253,     4,    -1,    82,   253,     4,    -1,    83,   245,
       4,    -1,    83,   112,     4,    -1,    83,   245,    71,   253,
       4,    -1,    83,   112,    71,   253,     4,    -1,    -1,   187,
     188,     4,    -1,    11,   235,    -1,    -1,   189,   190,     4,
      -1,    62,   245,   192,    -1,    -1,    29,   191,   220,   214,
      -1,    -1,   192,   193,    -1,    18,    -1,    19,    -1,    20,
      -1,    21,    -1,    21,   125,   112,   126,    -1,   100,    -1,
      -1,    78,     4,   195,   198,    79,    -1,   202,    -1,    -1,
      80,     4,   197,   199,    81,    -1,    -1,   198,     4,    -1,
     198,   200,     4,    -1,    -1,   199,     4,    -1,   199,   201,
       4,    -1,    15,   253,   236,    -1,    16,   253,   236,    -1,
      -1,   204,   125,   203,   205,   126,    -1,    63,    -1,    65,
      -1,    -1,   235,    -1,   112,    22,   253,    -1,   205,    71,
     235,    -1,   205,    71,   112,    22,   253,    -1,   208,    -1,
     206,   208,    -1,    -1,   207,   212,    -1,   110,     4,    -1,
     119,    -1,   118,    -1,   142,    -1,    -1,   210,    -1,   210,
     211,    -1,   211,    -1,   101,    -1,   209,   216,     4,    -1,
       1,     4,    -1,   214,    -1,   213,    71,   214,    -1,   108,
     215,    -1,    -1,   100,    -1,   222,    -1,   240,    -1,    -1,
      29,   217,   220,   213,    -1,    30,   112,    71,   245,    -1,
      -1,    31,   218,   220,   108,   122,   262,    -1,   146,    -1,
      -1,    34,   219,   220,   108,   122,   262,    -1,    64,   232,
      -1,    10,   251,    -1,   116,   246,    -1,    14,   253,    -1,
     232,    -1,   179,    -1,   194,    -1,   196,    -1,    -1,    51,
      -1,    52,    -1,    53,    -1,    54,    -1,   108,    -1,   245,
     122,   253,    -1,   245,   122,   224,   253,    -1,   245,   122,
     253,   225,   253,    -1,   245,   122,   253,   123,   254,   124,
      -1,   245,   123,   254,   124,   122,   253,    -1,   245,   122,
      23,   221,    71,   253,    -1,   245,   122,    23,   221,   123,
     254,   124,    -1,   245,   122,    23,   221,    -1,   245,   122,
      23,   253,    -1,   245,   122,    23,   160,    -1,   245,   122,
      23,   160,    71,   253,    -1,   245,   122,    23,   253,    71,
     253,    -1,   245,   122,    23,   253,   123,   254,   124,    -1,
      23,   245,    71,   253,    -1,    23,   245,    71,   253,    71,
     253,    -1,    23,   245,    71,   253,   123,   254,   124,    -1,
     245,   122,   232,    -1,    -1,   125,   223,   239,   126,   122,
     231,   125,   234,   126,    -1,   226,    -1,   228,    -1,   230,
      -1,   245,   122,    14,    -1,   127,    -1,   128,    -1,   129,
      -1,   129,    -1,   130,    -1,   131,    -1,   132,    -1,   133,
      -1,    43,    -1,    67,    -1,   121,    -1,    56,    -1,    57,
      -1,    58,    -1,    59,    -1,    60,    -1,    61,    -1,    49,
      -1,    50,    -1,    68,    -1,    69,    -1,    70,    -1,    55,
      -1,   134,    -1,   135,    -1,   128,    -1,    -1,    66,   227,
     125,   239,   126,    -1,   245,   229,   253,    -1,    35,    -1,
      36,    -1,    37,    -1,    38,    -1,    45,    -1,    44,    -1,
      39,    -1,    40,    -1,    41,    -1,    42,    -1,    46,    -1,
      47,    -1,    48,    -1,   245,   122,   116,   155,    -1,   108,
      -1,   112,    -1,   115,    -1,   245,    -1,   245,   120,   250,
      -1,   245,   120,   112,    -1,   245,   120,   245,    -1,    -1,
     231,   233,   125,   234,   126,    -1,    -1,   234,    71,   235,
      -1,   235,    -1,   234,    71,   112,    22,   253,    -1,   112,
      22,   253,    -1,   253,   236,    -1,    -1,   236,   237,    -1,
      17,    -1,    21,    -1,    21,   125,   112,   126,    -1,   245,
     192,    -1,   239,    71,   238,    -1,   239,    71,   112,    22,
     245,    -1,   238,    -1,   112,    22,   245,    -1,    -1,   242,
      -1,   241,    -1,    13,   253,   244,   253,    10,   251,    -1,
      13,    14,   253,    10,   251,    -1,    13,   253,   243,   251,
      -1,    12,   253,   243,   251,    -1,    12,   253,   244,   253,
      10,   251,    -1,    12,    14,   253,    10,   251,    -1,    71,
      -1,    10,    -1,    56,    -1,    57,    -1,    58,    -1,    59,
      -1,    60,    -1,    61,    -1,   117,    -1,   261,    -1,    -1,
     247,    -1,   247,    71,   248,    -1,   248,    -1,   252,    -1,
     245,   123,   254,   124,    -1,   123,   256,   124,    -1,   250,
      -1,   112,    -1,   115,    -1,   108,    -1,   116,    -1,   108,
      -1,   116,    -1,   251,    -1,   253,    -1,   245,    -1,   262,
      -1,    -1,   255,   258,    -1,    -1,   257,   258,    -1,   260,
      -1,   258,   136,   260,    -1,    -1,   258,    71,   259,   260,
      -1,   253,    -1,   253,    73,   253,    -1,    73,   253,    -1,
     253,    73,    -1,   104,    -1,   105,    -1,   106,    -1,   107,
      -1,   109,    -1,   113,    -1,   114,    -1,   112,    -1,   115,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   781,   781,   785,   786,   790,   791,   792,   798,   804,
     805,   806,   807,   811,   812,   821,   826,   834,   843,   861,
     861,   870,   870,   876,   876,   883,   884,   888,   889,   893,
     894,   895,   896,   897,   898,   899,   902,   902,   911,   910,
     922,   926,   934,   938,   942,   942,   954,   956,   960,   975,
     983,   988,   992,   995,   987,  1001,  1002,  1003,  1016,  1016,
    1020,  1034,  1038,  1044,  1053,  1059,  1068,  1074,  1083,  1089,
    1098,  1106,  1115,  1127,  1130,  1135,  1143,  1144,  1145,  1146,
    1147,  1158,  1169,  1172,  1174,  1179,  1178,  1211,  1212,  1216,
    1217,  1221,  1222,  1226,  1227,  1231,  1232,  1233,  1234,  1235,
    1236,  1237,  1238,  1239,  1240,  1241,  1242,  1243,  1244,  1248,
    1253,  1257,  1262,  1266,  1270,  1275,  1284,  1285,  1289,  1294,
    1295,  1303,  1304,  1304,  1319,  1320,  1324,  1325,  1326,  1327,
    1328,  1329,  1334,  1334,  1337,  1345,  1345,  1351,  1352,  1357,
    1365,  1366,  1371,  1379,  1383,  1388,  1387,  1400,  1401,  1405,
    1406,  1416,  1420,  1430,  1438,  1439,  1451,  1455,  1457,  1458,
    1459,  1460,  1464,  1465,  1469,  1470,  1474,  1483,  1484,  1495,
    1502,  1511,  1521,  1522,  1527,  1528,  1529,  1529,  1545,  1549,
    1549,  1556,  1557,  1557,  1563,  1569,  1570,  1582,  1583,  1584,
    1585,  1586,  1587,  1591,  1592,  1593,  1594,  1598,  1611,  1613,
    1615,  1617,  1619,  1621,  1623,  1625,  1627,  1629,  1631,  1633,
    1635,  1639,  1641,  1643,  1646,  1653,  1652,  1661,  1662,  1663,
    1664,  1672,  1673,  1674,  1678,  1679,  1680,  1681,  1682,  1683,
    1684,  1685,  1686,  1687,  1688,  1689,  1690,  1691,  1692,  1693,
    1694,  1695,  1696,  1697,  1698,  1699,  1700,  1706,  1705,  1717,
    1724,  1725,  1726,  1727,  1728,  1729,  1730,  1731,  1732,  1733,
    1734,  1735,  1736,  1741,  1752,  1753,  1754,  1755,  1761,  1773,
    1779,  1785,  1784,  1793,  1794,  1804,  1814,  1820,  1829,  1833,
    1834,  1838,  1839,  1842,  1846,  1850,  1860,  1865,  1875,  1880,
    1884,  1885,  1889,  1893,  1897,  1904,  1908,  1912,  1919,  1920,
    1924,  1925,  1926,  1927,  1928,  1929,  1933,  1934,  1938,  1939,
    1943,  1944,  1948,  1949,  1956,  1963,  1964,  1965,  1969,  1970,
    1974,  1975,  1979,  1980,  1984,  1985,  1989,  1989,  2002,  2002,
    2015,  2016,  2021,  2021,  2030,  2036,  2043,  2044,  2048,  2049,
    2050,  2051,  2052,  2056,  2057,  2058,  2059
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "HLL",
  "HLL_MAP", "TK_LINE", "TK_FILE", "GOTO", "ARG", "IF", "UNLESS", "PNULL",
  "SET_RETURN", "SET_YIELD", "ADV_FLAT", "ADV_SLURPY", "ADV_OPTIONAL",
  "ADV_OPT_FLAG", "ADV_NAMED", "ADV_ARROW", "NEW", "ADV_INVOCANT",
  "NAMESPACE", "DOT_METHOD", "SUB", "SYM", "LOCAL", "LEXICAL", "CONST",
  "INC", "DEC", "GLOBAL_CONST", "PLUS_ASSIGN", "MINUS_ASSIGN",
  "MUL_ASSIGN", "DIV_ASSIGN", "CONCAT_ASSIGN", "BAND_ASSIGN", "BOR_ASSIGN",
  "BXOR_ASSIGN", "FDIV", "FDIV_ASSIGN", "MOD_ASSIGN", "SHR_ASSIGN",
  "SHL_ASSIGN", "SHR_U_ASSIGN", "SHIFT_LEFT", "SHIFT_RIGHT", "INTV",
  "FLOATV", "STRINGV", "PMCV", "LOG_XOR", "RELOP_EQ", "RELOP_NE",
  "RELOP_GT", "RELOP_GTE", "RELOP_LT", "RELOP_LTE", "RESULT", "RETURN",
  "TAILCALL", "YIELDT", "GET_RESULTS", "POW", "SHIFT_RIGHT_U", "LOG_AND",
  "LOG_OR", "COMMA", "ESUB", "DOTDOT", "PCC_BEGIN", "PCC_END", "PCC_CALL",
  "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD",
  "PCC_END_YIELD", "NCI_CALL", "METH_CALL", "INVOCANT", "MAIN", "LOAD",
  "INIT", "IMMEDIATE", "POSTCOMP", "METHOD", "ANON", "OUTER", "NEED_LEX",
  "MULTI", "VTABLE_METHOD", "LOADLIB", "SUB_INSTANCE_OF", "SUBID",
  "NS_ENTRY", "UNIQUE_REG", "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG",
  "PREG", "IDENTIFIER", "REG", "MACRO", "ENDM", "STRINGC", "INTC",
  "FLOATC", "USTRINGC", "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT",
  "DOT", "CONCAT", "'='", "'['", "']'", "'('", "')'", "'!'", "'~'", "'-'",
  "'+'", "'*'", "'/'", "'%'", "'&'", "'|'", "';'", "$accept", "program",
  "compilation_units", "compilation_unit", "pragma", "location_directive",
  "hll_def", "constdef", "@1", "pmc_const", "@2", "@3", "any_string",
  "pasmcode", "pasmline", "pasm_inst", "@4", "@5", "pasm_args", "emit",
  "@6", "opt_pasmcode", "class_namespace", "maybe_ns", "sub", "@7", "@8",
  "@9", "sub_params", "sub_param", "@10", "sub_param_type_def", "multi",
  "outer", "vtable", "method", "ns_entry_name", "instanceof", "subid",
  "multi_types", "multi_type", "sub_body", "pcc_sub_call", "@11",
  "opt_label", "opt_invocant", "sub_proto", "sub_proto_list", "proto",
  "pcc_call", "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@12",
  "paramtype_list", "paramtype", "pcc_ret", "@13", "pcc_yield", "@14",
  "pcc_returns", "pcc_yields", "pcc_return", "pcc_set_yield",
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
  "_keylist", "@24", "key", "reg", "const", 0
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
     374,   375,    61,    91,    93,    40,    41,    33,   126,    45,
      43,    42,    47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   137,   138,   139,   139,   140,   140,   140,   140,   140,
     140,   140,   140,   141,   141,   142,   142,   143,   143,   145,
     144,   147,   146,   148,   146,   149,   149,   150,   150,   151,
     151,   151,   151,   151,   151,   151,   153,   152,   154,   152,
     152,   152,   152,   155,   157,   156,   158,   158,   159,   160,
     160,   162,   163,   164,   161,   165,   165,   165,   167,   166,
     168,   169,   170,   170,   171,   171,   172,   172,   173,   173,
     174,   175,   175,   176,   176,   176,   177,   177,   177,   177,
     177,   177,   177,   178,   178,   180,   179,   181,   181,   182,
     182,   183,   183,   184,   184,   185,   185,   185,   185,   185,
     185,   185,   185,   185,   185,   185,   185,   185,   185,   186,
     186,   186,   186,   186,   186,   186,   187,   187,   188,   189,
     189,   190,   191,   190,   192,   192,   193,   193,   193,   193,
     193,   193,   195,   194,   194,   197,   196,   198,   198,   198,
     199,   199,   199,   200,   201,   203,   202,   204,   204,   205,
     205,   205,   205,   205,   206,   206,   207,   208,   208,   208,
     208,   208,   209,   209,   210,   210,   211,   212,   212,   213,
     213,   214,   215,   215,   216,   216,   217,   216,   216,   218,
     216,   216,   219,   216,   216,   216,   216,   216,   216,   216,
     216,   216,   216,   220,   220,   220,   220,   221,   222,   222,
     222,   222,   222,   222,   222,   222,   222,   222,   222,   222,
     222,   222,   222,   222,   222,   223,   222,   222,   222,   222,
     222,   224,   224,   224,   225,   225,   225,   225,   225,   225,
     225,   225,   225,   225,   225,   225,   225,   225,   225,   225,
     225,   225,   225,   225,   225,   225,   225,   227,   226,   228,
     229,   229,   229,   229,   229,   229,   229,   229,   229,   229,
     229,   229,   229,   230,   231,   231,   231,   231,   231,   231,
     231,   233,   232,   234,   234,   234,   234,   234,   235,   236,
     236,   237,   237,   237,   238,   239,   239,   239,   239,   239,
     240,   240,   241,   241,   241,   242,   242,   242,   243,   243,
     244,   244,   244,   244,   244,   244,   245,   245,   246,   246,
     247,   247,   248,   248,   248,   249,   249,   249,   250,   250,
     251,   251,   252,   252,   253,   253,   255,   254,   257,   256,
     258,   258,   259,   258,   260,   260,   260,   260,   261,   261,
     261,   261,   261,   262,   262,   262,   262
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     2,
       1,     1,     1,     2,     3,     5,     3,     2,     4,     0,
       6,     0,     6,     0,     6,     1,     1,     1,     2,     3,
       2,     1,     1,     1,     1,     1,     0,     3,     0,     4,
       2,     4,     0,     1,     0,     4,     0,     1,     3,     3,
       2,     0,     0,     0,    10,     0,     1,     3,     0,     3,
       3,     4,     4,     4,     1,     4,     1,     4,     1,     4,
       4,     1,     4,     0,     3,     1,     1,     1,     1,     1,
       1,     1,     3,     0,     1,     0,     9,     0,     2,     0,
       3,     0,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     5,
       3,     3,     3,     3,     5,     5,     0,     3,     2,     0,
       3,     3,     0,     4,     0,     2,     1,     1,     1,     1,
       4,     1,     0,     5,     1,     0,     5,     0,     2,     3,
       0,     2,     3,     3,     3,     0,     5,     1,     1,     0,
       1,     3,     3,     5,     1,     2,     0,     2,     2,     1,
       1,     1,     0,     1,     2,     1,     1,     3,     2,     1,
       3,     2,     0,     1,     1,     1,     0,     4,     4,     0,
       6,     1,     0,     6,     2,     2,     2,     2,     1,     1,
       1,     1,     0,     1,     1,     1,     1,     1,     3,     4,
       5,     6,     6,     6,     7,     4,     4,     4,     6,     6,
       7,     4,     6,     7,     3,     0,     9,     1,     1,     1,
       3,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     0,     5,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     1,     1,     1,     1,     3,     3,
       3,     0,     5,     0,     3,     1,     5,     3,     2,     0,
       2,     1,     1,     4,     2,     3,     5,     1,     3,     0,
       1,     1,     6,     5,     4,     4,     6,     5,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     0,     1,
       3,     1,     1,     4,     3,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     0,     2,     0,     2,
       1,     3,     0,     4,     1,     3,     2,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    12,     0,     0,     0,     0,     0,    51,    19,     0,
      44,     0,     0,     2,     3,    10,    11,     0,     6,     8,
       5,     7,    17,     0,     0,     0,   326,     0,     0,     0,
       0,   162,     9,     1,     4,    13,     0,     0,    16,    50,
       0,     0,    48,   318,   316,   317,   319,    52,   315,   193,
     194,   195,   196,     0,    14,    21,   166,     0,    32,    31,
      35,    34,   162,    27,     0,    33,    36,   163,   165,    18,
       0,    49,     0,   338,   339,   340,   341,   342,   345,   343,
     344,   346,   306,   324,   334,   327,   330,   307,   325,    91,
       0,     0,     0,    30,    28,    45,     0,     0,    38,     0,
       0,   164,    15,   336,   337,   332,     0,    97,    95,    96,
      98,    99,    66,   100,     0,   101,     0,    64,     0,    71,
      68,   102,   103,   104,   105,   106,   107,   108,     0,    92,
      93,     0,     0,     0,    40,     0,    91,    29,   308,   335,
       0,   331,     0,     0,    73,     0,     0,     0,     0,    53,
      94,    20,   320,   321,   322,     0,   323,     0,     0,     0,
     328,    37,   324,    43,   309,   311,   312,   333,    25,    26,
       0,     0,     0,    76,    77,    79,    78,    80,    81,   326,
       0,    75,     0,     0,     0,     0,    55,     0,     0,    41,
      39,     0,     0,   326,     0,    67,    63,    62,     0,     0,
      61,    65,    70,    72,    69,    56,   156,    22,    24,   314,
     329,     0,   310,    82,    74,    58,     0,   160,   159,   161,
       0,     0,   156,     0,   154,   313,     0,   158,    57,    54,
     155,     0,   192,   157,    59,     0,   168,     0,     0,     0,
       0,     0,   176,     0,   179,   182,   147,     0,   148,   247,
       0,     0,     0,   264,   265,   266,   308,   215,   181,   189,
     190,   191,   134,     0,     0,   174,   217,   218,   219,   271,
     188,   175,   291,   290,   267,   124,   185,     0,     0,     0,
       0,   187,     0,     0,     0,     0,     0,   184,   267,     0,
      85,   132,   135,   186,   289,   145,   167,     0,   250,   251,
     252,   253,   256,   257,   258,   259,   255,   254,   260,   261,
     262,     0,     0,   326,     0,    60,     0,   299,   300,   301,
     302,   303,   304,   305,   298,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   289,   116,   137,   140,     0,
     287,     0,   124,   149,   273,   269,   270,   268,   220,     0,
     345,   346,   308,   221,   222,   223,     0,   214,   324,   198,
       0,   249,   126,   127,   128,   129,   131,   125,     0,   295,
       0,     0,   294,     0,   211,   172,   177,   169,   178,     0,
       0,     0,    89,     0,     0,     0,     0,     0,   284,   345,
       0,   150,   279,   345,     0,   275,   197,   207,   205,   206,
     263,   199,   229,   238,   239,   243,   232,   233,   234,   235,
     236,   237,   230,   240,   241,   242,   231,   326,   246,   224,
     225,   226,   227,   228,   244,   245,     0,     0,     0,   297,
       0,   293,     0,     0,   326,   173,   171,     0,     0,     0,
     248,     0,     0,     0,     0,   138,     0,   133,     0,   141,
       0,   136,     0,   288,     0,   285,     0,     0,     0,   146,
     278,     0,     0,   272,     0,     0,   326,     0,   326,     0,
     200,     0,     0,   296,   292,   212,     0,   170,   180,   183,
     118,     0,     0,     0,     0,    87,   117,   279,   139,   279,
     142,     0,     0,   151,   345,   152,   281,   282,   280,   277,
     345,   274,   208,   203,     0,   209,     0,   201,   202,   130,
     213,    90,     0,     0,     0,     0,   119,     0,   143,   144,
     286,   273,     0,     0,     0,   204,   210,   110,     0,   111,
     113,     0,   112,     0,     0,    88,     0,   153,     0,   276,
       0,     0,     0,   122,     0,    86,     0,   216,   283,   109,
     115,   114,     0,   124,   120,     0,   121,   123
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    12,    13,    14,    15,    16,    17,    18,    29,    61,
      91,    92,   170,    62,    63,    99,   100,   136,   161,    19,
      31,    64,    20,    27,    21,    28,    89,   186,   206,   220,
     226,   234,   121,   122,   123,   124,   125,   126,   127,   180,
     181,   221,   259,   336,   516,   443,   128,   129,   130,   485,
     382,   444,   534,   546,   552,   315,   367,   260,   337,   261,
     338,   383,   384,   448,   452,   262,   343,   263,   390,   222,
     223,   224,    66,    67,    68,   233,   376,   377,   436,   264,
     283,   285,   286,    53,   398,   265,   294,   356,   426,   266,
     289,   267,   314,   268,   269,   270,   297,   394,   395,   460,
     498,   340,   341,   271,   272,   273,   325,   326,    83,   163,
     164,   165,    47,    48,   154,   166,   156,    40,    41,   191,
     192,    85,   140,    86,    87,    88
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -428
static const yytype_int16 yypact[] =
{
      50,  -428,   -73,   -67,   -65,    -4,    -9,  -428,  -428,     8,
    -428,   154,   184,    50,  -428,  -428,  -428,   183,  -428,  -428,
    -428,  -428,  -428,    70,   123,   191,    85,   206,   110,   197,
     217,    63,  -428,  -428,  -428,  -428,   111,   116,  -428,  -428,
      93,   274,  -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,
    -428,  -428,  -428,   124,  -428,   117,  -428,   227,  -428,  -428,
    -428,  -428,    67,  -428,   130,  -428,     5,   134,  -428,  -428,
     235,  -428,   462,  -428,  -428,  -428,  -428,  -428,  -428,  -428,
    -428,  -428,  -428,  -428,   167,   -60,  -428,  -428,  -428,   530,
     120,   131,   140,  -428,  -428,  -428,   462,   143,  -428,   253,
     144,  -428,  -428,  -428,   462,  -428,   274,  -428,  -428,  -428,
    -428,  -428,   136,  -428,   141,  -428,   147,   149,   150,   158,
     159,  -428,  -428,  -428,  -428,  -428,  -428,  -428,   255,   530,
    -428,   241,   526,   526,  -428,   194,   530,  -428,   447,  -428,
     274,  -428,   -85,   -40,    -1,   156,   170,   -85,   -85,  -428,
    -428,  -428,  -428,  -428,  -428,   164,  -428,   165,   160,   192,
    -428,  -428,   171,  -428,   224,  -428,  -428,  -428,  -428,  -428,
     174,   175,   178,  -428,  -428,  -428,  -428,  -428,  -428,  -428,
     -46,  -428,   179,   180,   186,   188,   312,   -85,   -85,  -428,
    -428,   199,   274,  -428,   447,  -428,  -428,  -428,   205,    -1,
    -428,  -428,  -428,  -428,  -428,  -428,     7,  -428,  -428,  -428,
     -60,   207,  -428,  -428,  -428,  -428,   317,  -428,  -428,  -428,
     328,   263,    38,   233,  -428,  -428,   197,  -428,  -428,  -428,
    -428,   332,   433,  -428,  -428,   236,  -428,    53,   213,   256,
     462,    84,  -428,   231,    92,  -428,  -428,   367,  -428,  -428,
     342,   347,   353,  -428,  -428,  -428,   447,  -428,  -428,  -428,
    -428,  -428,  -428,   239,   362,  -428,  -428,  -428,  -428,  -428,
    -428,  -428,  -428,  -428,   413,  -428,  -428,   462,   220,   462,
     220,  -428,   296,   197,   301,   197,   197,  -428,   254,   250,
    -428,  -428,  -428,  -428,   107,  -428,  -428,   251,  -428,  -428,
    -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,
    -428,   290,    26,  -428,   462,     2,   372,  -428,  -428,  -428,
    -428,  -428,  -428,  -428,  -428,    53,   462,   374,    53,   462,
     462,   269,    84,   282,   285,   107,  -428,  -428,  -428,   381,
    -428,   -39,  -428,   540,   554,  -428,  -428,  -428,  -428,   491,
     279,   283,   447,  -428,  -428,  -428,   462,  -428,    82,   459,
     286,  -428,  -428,  -428,  -428,   288,  -428,  -428,    53,  -428,
     401,    53,  -428,   404,   -38,   315,   351,  -428,  -428,   303,
     305,   -30,    -6,    14,    10,    84,   327,   306,     2,   396,
     -29,  -428,  -428,   407,   -10,  -428,  -428,   364,   -37,   -11,
    -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,
    -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,
    -428,  -428,  -428,  -428,  -428,  -428,   462,   316,   325,  -428,
      53,  -428,    53,   462,  -428,  -428,  -428,   269,   241,   241,
    -428,   462,   462,    89,   436,  -428,   462,  -428,   461,  -428,
     462,  -428,   464,  -428,   444,  -428,   367,   462,   568,  -428,
     157,   462,   582,  -428,   462,   462,  -428,   462,  -428,   345,
    -428,   462,   344,  -428,  -428,  -428,   354,  -428,  -428,  -428,
    -428,   473,   462,   462,   596,   134,  -428,  -428,  -428,  -428,
    -428,    84,   360,  -428,   466,  -428,  -428,   361,  -428,  -428,
     467,  -428,  -428,  -428,   369,  -428,   370,  -428,  -428,  -428,
    -428,  -428,    24,   487,    32,    34,  -428,   496,   157,   157,
    -428,   554,   462,   383,   462,  -428,  -428,  -428,   462,  -428,
    -428,   462,  -428,   462,   121,  -428,    19,  -428,   375,  -428,
     499,   500,   501,  -428,    84,  -428,   502,  -428,  -428,  -428,
    -428,  -428,   197,  -428,  -428,   269,     2,  -428
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -428,  -428,  -428,   497,    87,   -93,  -428,  -428,  -428,   280,
    -428,  -428,  -104,  -428,   460,  -428,  -428,  -428,   169,  -428,
    -428,  -428,   105,   176,  -428,  -428,  -428,  -428,  -428,  -428,
    -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,
     324,  -428,  -428,  -428,  -428,  -428,   388,  -428,   402,  -428,
    -428,  -428,  -428,  -428,  -428,  -338,  -428,  -428,  -428,  -428,
    -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,  -428,
    -428,   308,   309,  -428,   -66,  -428,  -428,  -427,  -428,  -428,
    -428,  -428,  -428,  -219,  -428,  -428,  -428,  -428,  -428,  -428,
    -428,  -428,  -428,  -428,    78,  -223,  -428,    22,  -335,  -368,
    -428,   161,   209,  -428,  -428,  -428,   266,   277,  -132,   322,
    -428,   371,  -428,   261,  -224,    43,   -41,  -176,  -428,  -428,
    -428,   389,  -428,   -69,  -428,  -129
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -268
static const yytype_int16 yytable[] =
{
      84,   101,   151,   198,   388,   441,   162,   235,   391,   -42,
     477,   105,   215,   276,   449,     4,     5,   211,   445,    96,
     362,   363,   364,   365,   287,   199,   450,   168,   527,   446,
     169,   103,   386,   433,   465,    97,   530,   141,   532,    22,
     348,   386,   458,   184,   185,    23,     4,     5,    24,   349,
     173,   174,   175,   176,     1,   134,     2,     3,     4,     5,
     467,   462,   162,   139,   331,    84,   333,   334,   171,     2,
       3,   167,   172,     2,     3,     6,   106,     7,   442,   -83,
     200,     8,    98,   207,   208,   434,   466,   387,     6,   357,
     462,   451,     6,   447,    55,   528,   440,   459,    55,    84,
     274,   369,   366,   531,   372,   533,   480,   177,    25,   282,
     -84,   178,   468,   219,    26,   288,   463,   216,    60,   518,
      30,   519,   179,   495,   162,   217,   218,   501,   557,   219,
      73,    74,    75,    76,   253,    77,    65,   360,   350,    79,
      80,   351,   352,    82,   429,   547,     9,   431,   216,    60,
     543,    84,    10,   353,   354,   355,   217,   218,    32,     9,
      11,   152,   342,     9,    56,   482,   -46,    65,    56,   153,
     -47,   483,   484,    57,   496,   155,   157,    57,   497,   346,
     358,    58,    59,   544,    33,    58,    59,    35,    73,    74,
      75,    76,    36,    77,    37,    38,   545,   278,   280,   281,
     378,    82,   311,   342,   -23,   -21,   473,  -267,   474,    39,
      42,    73,    74,    75,    76,   556,    77,    71,    43,   339,
     162,    54,    44,    69,    82,    45,    46,   277,    70,   -23,
     317,    93,    90,    95,   231,    56,   316,  -162,   327,   102,
     104,   469,   131,  -162,   132,  -162,  -162,  -162,    49,    50,
      51,    52,   133,   453,   342,   135,  -162,   137,   476,   149,
     138,   142,  -162,  -162,  -162,   158,   143,  -162,   182,   189,
     279,   359,   144,   361,   145,   146,   318,   319,   320,   321,
     322,   323,   183,   147,   148,   370,   187,   188,   373,   374,
     504,   324,   506,   190,   193,   194,  -162,  -162,  -162,  -162,
     195,   196,   392,   392,   197,   201,   202,  -162,   399,   478,
     479,  -162,   203,  -162,   204,   401,   205,    73,    74,    75,
      76,   227,    77,   209,   288,    78,    79,    80,    81,   213,
      82,   225,   228,   555,    56,   229,   236,  -162,  -162,  -162,
    -162,  -162,  -162,   284,   275,  -162,   290,    72,  -162,  -162,
    -162,   291,   515,    78,    79,    80,    81,   292,  -162,   520,
      73,    74,    75,    76,   295,    77,   296,   330,    78,    79,
      80,    81,   332,    82,   311,   335,   344,   375,    73,    74,
      75,    76,   368,    77,   371,   470,    78,    79,    80,    81,
     379,    82,   475,   380,    73,    74,    75,    76,    43,    77,
     392,   481,   345,   385,  -265,   487,    46,    82,  -266,   489,
     427,   430,   553,   428,   432,   435,   493,   392,   457,   517,
     499,   392,   437,   502,   503,   438,   505,   439,   456,   461,
     508,    73,    74,    75,    76,   464,    77,   472,   471,   454,
     486,   512,   513,   237,    82,   238,   239,   240,   298,   299,
     300,   301,   302,   303,   304,   305,   241,   306,   307,   308,
     309,   310,   242,   243,   244,   488,   491,   245,   490,   507,
     509,    73,    74,    75,    76,   253,    77,   511,   510,   254,
     392,   537,   255,   539,    82,   521,   523,   540,   522,   524,
     541,   529,   542,   525,   526,   538,   246,   247,   248,   249,
     535,   548,   402,   549,   550,   551,   554,   250,   403,   404,
      34,   251,   258,   252,   405,   406,   407,   408,   409,   410,
     411,   400,    94,   214,   159,   397,   412,   413,   414,   415,
     230,   150,   232,   311,   492,   312,   313,    73,    74,    75,
      76,   253,    77,   536,   381,   254,   328,   455,   255,   256,
      82,    73,    74,    75,    76,   152,    77,   329,   257,    78,
      79,    80,    81,   153,    82,   212,    73,    74,    75,    76,
     160,    77,   347,     0,    78,    79,    80,    81,   293,    82,
     416,   210,   417,     0,     0,     0,     0,   418,   419,   420,
     421,   422,   423,   424,   425,    73,    74,    75,    76,   396,
      77,     0,     0,    78,    79,    80,    81,     0,    82,     0,
       0,     0,     0,     0,    26,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   117,     0,   118,   119,   120,
      73,    74,    75,    76,   152,    77,     0,     0,    78,    79,
      80,    81,   153,    82,    73,    74,    75,    76,     0,    77,
       0,     0,   389,    79,    80,    81,     0,    82,    73,    74,
      75,    76,     0,    77,     0,     0,   393,    79,    80,    81,
       0,    82,    73,    74,    75,    76,     0,    77,     0,     0,
     494,    79,    80,    81,     0,    82,    73,    74,    75,    76,
       0,    77,     0,     0,   500,    79,    80,    81,     0,    82,
      73,    74,    75,    76,     0,    77,     0,     0,   514,     0,
       0,     0,     0,    82
};

static const yytype_int16 yycheck[] =
{
      41,    67,   131,   179,   342,    11,   138,   226,   343,     4,
     437,    71,     5,   237,     4,     8,     9,   193,     4,    14,
      18,    19,    20,    21,   247,    71,    16,   112,     4,    15,
     115,    72,    71,    71,    71,    30,     4,   106,     4,   112,
      14,    71,    71,   147,   148,   112,     8,     9,   113,    23,
      51,    52,    53,    54,     4,    96,     6,     7,     8,     9,
      71,    71,   194,   104,   283,   106,   285,   286,   108,     6,
       7,   140,   112,     6,     7,    25,   136,    27,    84,    72,
     126,    31,    77,   187,   188,   123,   123,   126,    25,   312,
      71,    81,    25,    79,    31,    71,   126,   126,    31,   140,
     232,   325,   100,    71,   328,    71,   441,   108,   112,   241,
      72,   112,   123,   206,   123,   247,   126,   110,    31,   487,
     112,   489,   123,   458,   256,   118,   119,   462,   555,   222,
     104,   105,   106,   107,   108,   109,    31,   313,   112,   113,
     114,   115,   116,   117,   368,   126,    96,   371,   110,    62,
      29,   192,   102,   127,   128,   129,   118,   119,     4,    96,
     110,   108,   294,    96,   101,    76,   103,    62,   101,   116,
     103,    82,    83,   110,    17,   132,   133,   110,    21,   311,
     312,   118,   119,    62,     0,   118,   119,     4,   104,   105,
     106,   107,   122,   109,    71,     4,    75,   238,   239,   240,
     332,   117,   120,   335,   112,   113,   430,   125,   432,   124,
       4,   104,   105,   106,   107,   553,   109,   124,   108,   112,
     352,     4,   112,   112,   117,   115,   116,    14,   112,   112,
      10,     4,   108,   103,     1,   101,   277,     4,   279,     4,
      73,   417,   122,    10,   113,    12,    13,    14,    51,    52,
      53,    54,   112,   385,   386,   112,    23,     4,   434,     4,
     116,   125,    29,    30,    31,    71,   125,    34,   112,   109,
      14,   312,   125,   314,   125,   125,    56,    57,    58,    59,
      60,    61,   112,   125,   125,   326,   122,   122,   329,   330,
     466,    71,   468,   101,   123,    71,    63,    64,    65,    66,
     126,   126,   343,   344,   126,   126,   126,    74,   349,   438,
     439,    78,   126,    80,   126,   356,     4,   104,   105,   106,
     107,     4,   109,   124,   456,   112,   113,   114,   115,   124,
     117,   124,     4,   552,   101,    72,     4,   104,   105,   106,
     107,   108,   109,   112,   108,   112,     4,    73,   115,   116,
     117,     4,   484,   112,   113,   114,   115,     4,   125,   491,
     104,   105,   106,   107,   125,   109,     4,    71,   112,   113,
     114,   115,    71,   117,   120,   125,   125,   108,   104,   105,
     106,   107,    10,   109,    10,   426,   112,   113,   114,   115,
     108,   117,   433,   108,   104,   105,   106,   107,   108,   109,
     441,   442,   112,    22,   125,   446,   116,   117,   125,   450,
     124,    10,   544,   125,    10,   100,   457,   458,    22,   485,
     461,   462,    71,   464,   465,   122,   467,   122,   122,    22,
     471,   104,   105,   106,   107,    71,   109,   112,   122,   112,
       4,   482,   483,    10,   117,    12,    13,    14,    35,    36,
      37,    38,    39,    40,    41,    42,    23,    44,    45,    46,
      47,    48,    29,    30,    31,     4,    22,    34,     4,   124,
     126,   104,   105,   106,   107,   108,   109,     4,   124,   112,
     521,   522,   115,   524,   117,   125,   125,   528,    22,    22,
     531,     4,   533,   124,   124,   112,    63,    64,    65,    66,
       4,   126,    43,     4,     4,     4,     4,    74,    49,    50,
      13,    78,   232,    80,    55,    56,    57,    58,    59,    60,
      61,   352,    62,   199,   136,   349,    67,    68,    69,    70,
     222,   129,   223,   120,   456,   122,   123,   104,   105,   106,
     107,   108,   109,   521,   335,   112,   280,   386,   115,   116,
     117,   104,   105,   106,   107,   108,   109,   280,   125,   112,
     113,   114,   115,   116,   117,   194,   104,   105,   106,   107,
     123,   109,   311,    -1,   112,   113,   114,   115,   256,   117,
     121,   192,   123,    -1,    -1,    -1,    -1,   128,   129,   130,
     131,   132,   133,   134,   135,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,   115,    -1,   117,    -1,
      -1,    -1,    -1,    -1,   123,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    -1,    97,    98,    99,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,   115,   116,   117,   104,   105,   106,   107,    -1,   109,
      -1,    -1,   112,   113,   114,   115,    -1,   117,   104,   105,
     106,   107,    -1,   109,    -1,    -1,   112,   113,   114,   115,
      -1,   117,   104,   105,   106,   107,    -1,   109,    -1,    -1,
     112,   113,   114,   115,    -1,   117,   104,   105,   106,   107,
      -1,   109,    -1,    -1,   112,   113,   114,   115,    -1,   117,
     104,   105,   106,   107,    -1,   109,    -1,    -1,   112,    -1,
      -1,    -1,    -1,   117
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     4,     6,     7,     8,     9,    25,    27,    31,    96,
     102,   110,   138,   139,   140,   141,   142,   143,   144,   156,
     159,   161,   112,   112,   113,   112,   123,   160,   162,   145,
     112,   157,     4,     0,   140,     4,   122,    71,     4,   124,
     254,   255,     4,   108,   112,   115,   116,   249,   250,    51,
      52,    53,    54,   220,     4,    31,   101,   110,   118,   119,
     141,   146,   150,   151,   158,   159,   209,   210,   211,   112,
     112,   124,    73,   104,   105,   106,   107,   109,   112,   113,
     114,   115,   117,   245,   253,   258,   260,   261,   262,   163,
     108,   147,   148,     4,   151,   103,    14,    30,    77,   152,
     153,   211,     4,   253,    73,    71,   136,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,    97,    98,
      99,   169,   170,   171,   172,   173,   174,   175,   183,   184,
     185,   122,   113,   112,   253,   112,   154,     4,   116,   253,
     259,   260,   125,   125,   125,   125,   125,   125,   125,     4,
     185,   262,   108,   116,   251,   252,   253,   252,    71,   183,
     123,   155,   245,   246,   247,   248,   252,   260,   112,   115,
     149,   108,   112,    51,    52,    53,    54,   108,   112,   123,
     176,   177,   112,   112,   149,   149,   164,   122,   122,   109,
     101,   256,   257,   123,    71,   126,   126,   126,   254,    71,
     126,   126,   126,   126,   126,     4,   165,   149,   149,   124,
     258,   254,   248,   124,   177,     5,   110,   118,   119,   142,
     166,   178,   206,   207,   208,   124,   167,     4,     4,    72,
     208,     1,   209,   212,   168,   220,     4,    10,    12,    13,
      14,    23,    29,    30,    31,    34,    63,    64,    65,    66,
      74,    78,    80,   108,   112,   115,   116,   125,   146,   179,
     194,   196,   202,   204,   216,   222,   226,   228,   230,   231,
     232,   240,   241,   242,   245,   108,   251,    14,   253,    14,
     253,   253,   245,   217,   112,   218,   219,   232,   245,   227,
       4,     4,     4,   246,   223,   125,     4,   233,    35,    36,
      37,    38,    39,    40,    41,    42,    44,    45,    46,    47,
      48,   120,   122,   123,   229,   192,   253,    10,    56,    57,
      58,    59,    60,    61,    71,   243,   244,   253,   243,   244,
      71,   220,    71,   220,   220,   125,   180,   195,   197,   112,
     238,   239,   245,   203,   125,   112,   245,   250,    14,    23,
     112,   115,   116,   127,   128,   129,   224,   232,   245,   253,
     254,   253,    18,    19,    20,    21,   100,   193,    10,   251,
     253,    10,   251,   253,   253,   108,   213,   214,   245,   108,
     108,   239,   187,   198,   199,    22,    71,   126,   192,   112,
     205,   235,   253,   112,   234,   235,   108,   160,   221,   253,
     155,   253,    43,    49,    50,    55,    56,    57,    58,    59,
      60,    61,    67,    68,    69,    70,   121,   123,   128,   129,
     130,   131,   132,   133,   134,   135,   225,   124,   125,   251,
      10,   251,    10,    71,   123,   100,   215,    71,   122,   122,
     126,    11,    84,   182,   188,     4,    15,    79,   200,     4,
      16,    81,   201,   245,   112,   238,   122,    22,    71,   126,
     236,    22,    71,   126,    71,    71,   123,    71,   123,   254,
     253,   122,   112,   251,   251,   253,   254,   214,   262,   262,
     235,   253,    76,    82,    83,   186,     4,   253,     4,   253,
       4,    22,   231,   253,   112,   235,    17,    21,   237,   253,
     112,   235,   253,   253,   254,   253,   254,   124,   253,   126,
     124,     4,   253,   253,   112,   245,   181,   211,   236,   236,
     245,   125,    22,   125,    22,   124,   124,     4,    71,     4,
       4,    71,     4,    71,   189,     4,   234,   253,   112,   253,
     253,   253,   253,    29,    62,    75,   190,   126,   126,     4,
       4,     4,   191,   245,     4,   220,   192,   214
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
#line 781 "compilers/imcc/imcc.y"
    { if (yynerrs) YYABORT; (yyval.i) = 0; ;}
    break;

  case 5:
#line 790 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 6:
#line 791 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 7:
#line 793 "compilers/imcc/imcc.y"
    {
           (yyval.i) = (yyvsp[(1) - (1)].i);
           imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
           IMCC_INFO(interp)->cur_unit = 0;
         ;}
    break;

  case 8:
#line 799 "compilers/imcc/imcc.y"
    {
           (yyval.i) = (yyvsp[(1) - (1)].i);
           imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
           IMCC_INFO(interp)->cur_unit = 0;
         ;}
    break;

  case 9:
#line 804 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 10:
#line 805 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 11:
#line 806 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 12:
#line 807 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 13:
#line 811 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 14:
#line 813 "compilers/imcc/imcc.y"
    {
           (yyval.i) = 0;
           do_loadlib(interp, (yyvsp[(2) - (3)].s));
           mem_sys_free((yyvsp[(2) - (3)].s));
         ;}
    break;

  case 15:
#line 822 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->line = atoi((yyvsp[(2) - (5)].s));
           set_filename(interp, (yyvsp[(4) - (5)].s));
         ;}
    break;

  case 16:
#line 827 "compilers/imcc/imcc.y"
    {
           set_filename(interp, (yyvsp[(2) - (3)].s));
         ;}
    break;

  case 17:
#line 835 "compilers/imcc/imcc.y"
    {
            STRING * const hll_name = string_unescape_cstring(interp, (yyvsp[(2) - (2)].s) + 1, '"', NULL);
            CONTEXT(interp)->current_HLL =
                Parrot_register_HLL(interp, hll_name);

            IMCC_INFO(interp)->cur_namespace = NULL;
            (yyval.t) = 0;
         ;}
    break;

  case 18:
#line 844 "compilers/imcc/imcc.y"
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

  case 19:
#line 861 "compilers/imcc/imcc.y"
    { is_def = 1; ;}
    break;

  case 20:
#line 862 "compilers/imcc/imcc.y"
    {
             mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1);
             mem_sys_free((yyvsp[(4) - (6)].s));
             is_def = 0;
         ;}
    break;

  case 21:
#line 870 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 22:
#line 871 "compilers/imcc/imcc.y"
    {
           (yyval.i) = mk_pmc_const(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].s));
           is_def = 0;
         ;}
    break;

  case 23:
#line 876 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 24:
#line 877 "compilers/imcc/imcc.y"
    {
           (yyval.i) = mk_pmc_const_named(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].s));
           is_def = 0;
         ;}
    break;

  case 29:
#line 893 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 30:
#line 894 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 31:
#line 895 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 32:
#line 896 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  ;}
    break;

  case 33:
#line 897 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 36:
#line 902 "compilers/imcc/imcc.y"
    { clear_state(interp); ;}
    break;

  case 37:
#line 904 "compilers/imcc/imcc.y"
    {
           (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit,
                    (yyvsp[(2) - (3)].s), 0, IMCC_INFO(interp)->regs,
                    IMCC_INFO(interp)->nargs, IMCC_INFO(interp) -> keyvec, 1);
           /* XXX: can't seem to mem_sys_free($1) here */
         ;}
    break;

  case 38:
#line 911 "compilers/imcc/imcc.y"
    {
           imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
           IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM);
         ;}
    break;

  case 39:
#line 916 "compilers/imcc/imcc.y"
    {
           (yyval.i) = iSUBROUTINE(interp,
                    IMCC_INFO(interp)->cur_unit,
                    mk_sub_label(interp, (yyvsp[(4) - (4)].s)));
           IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(3) - (4)].t);
         ;}
    break;

  case 40:
#line 923 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(2) - (2)].sr));
         ;}
    break;

  case 41:
#line 927 "compilers/imcc/imcc.y"
    {
           SymReg *r = mk_pasm_reg(interp, (yyvsp[(4) - (4)].s));
           set_lexical(interp, r, (yyvsp[(2) - (4)].s));
           (yyval.i) = 0;
           mem_sys_free((yyvsp[(2) - (4)].s));
           mem_sys_free((yyvsp[(4) - (4)].s));
         ;}
    break;

  case 42:
#line 934 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;;}
    break;

  case 44:
#line 942 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM); ;}
    break;

  case 45:
#line 945 "compilers/imcc/imcc.y"
    {
           /* if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
           */
           (yyval.i) = 0;
         ;}
    break;

  case 48:
#line 961 "compilers/imcc/imcc.y"
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

  case 49:
#line 976 "compilers/imcc/imcc.y"
    {
            if (IMCC_INFO(interp)->in_slice)
                IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR,
                    "Slice not allowed in namespace.");

            (yyval.sr) = (yyvsp[(2) - (3)].sr);
        ;}
    break;

  case 50:
#line 983 "compilers/imcc/imcc.y"
    { (yyval.sr) = NULL; ;}
    break;

  case 51:
#line 988 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PCCSUB);
         ;}
    break;

  case 52:
#line 992 "compilers/imcc/imcc.y"
    {
           iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (3)].sr));
         ;}
    break;

  case 53:
#line 995 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(5) - (6)].t); ;}
    break;

  case 54:
#line 997 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 55:
#line 1001 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 56:
#line 1002 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 57:
#line 1004 "compilers/imcc/imcc.y"
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

  case 58:
#line 1016 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 59:
#line 1016 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(3) - (3)].sr); is_def=0; ;}
    break;

  case 60:
#line 1021 "compilers/imcc/imcc.y"
    {
           if ((yyvsp[(3) - (3)].t) & VT_UNIQUE_REG)
               (yyval.sr) = mk_ident_ur(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
           else
               (yyval.sr) = mk_ident(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
           (yyval.sr)->type |= (yyvsp[(3) - (3)].t);
           mem_sys_free((yyvsp[(2) - (3)].s));
          ;}
    break;

  case 61:
#line 1034 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 62:
#line 1039 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           IMCC_INFO(interp)->cur_unit->outer = mk_sub_address_fromc(interp, (yyvsp[(3) - (4)].s));
           mem_sys_free((yyvsp[(3) - (4)].s));
         ;}
    break;

  case 63:
#line 1045 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           IMCC_INFO(interp)->cur_unit->outer = mk_const(interp, (yyvsp[(3) - (4)].s), 'S');
           mem_sys_free((yyvsp[(3) - (4)].s));
         ;}
    break;

  case 64:
#line 1054 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           IMCC_INFO(interp)->cur_unit->vtable_name = NULL;
           IMCC_INFO(interp)->cur_unit->is_vtable_method = 1;
         ;}
    break;

  case 65:
#line 1060 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           IMCC_INFO(interp)->cur_unit->vtable_name = (yyvsp[(3) - (4)].s);
           IMCC_INFO(interp)->cur_unit->is_vtable_method = 1;
         ;}
    break;

  case 66:
#line 1069 "compilers/imcc/imcc.y"
    {
           (yyval.t) = P_METHOD;
           IMCC_INFO(interp)->cur_unit->method_name = NULL;
           IMCC_INFO(interp)->cur_unit->is_method = 1;
         ;}
    break;

  case 67:
#line 1075 "compilers/imcc/imcc.y"
    {
           (yyval.t) = P_METHOD;
           IMCC_INFO(interp)->cur_unit->method_name = (yyvsp[(3) - (4)].s);
           IMCC_INFO(interp)->cur_unit->is_method = 1;
         ;}
    break;

  case 68:
#line 1084 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           IMCC_INFO(interp)->cur_unit->ns_entry_name = NULL;
           IMCC_INFO(interp)->cur_unit->has_ns_entry_name = 1;
         ;}
    break;

  case 69:
#line 1090 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           IMCC_INFO(interp)->cur_unit->ns_entry_name = (yyvsp[(3) - (4)].s);
           IMCC_INFO(interp)->cur_unit->has_ns_entry_name = 1;
         ;}
    break;

  case 70:
#line 1099 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           IMCC_INFO(interp)->cur_unit->instance_of = (yyvsp[(3) - (4)].s);
         ;}
    break;

  case 71:
#line 1107 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           IMCC_INFO(interp)->cur_unit->subid = NULL;
           /*
           IMCC_INFO(interp)->cur_unit->instructions->symregs[0]->subid = str_dup_remove_quotes($3);
           mem_sys_free($3);
           */
         ;}
    break;

  case 72:
#line 1116 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           /* IMCC_INFO(interp)->cur_unit->subid = $3; */
           IMCC_INFO(interp)->cur_unit->subid = mk_const(interp, (yyvsp[(3) - (4)].s), 'S');
           IMCC_INFO(interp)->cur_unit->instructions->symregs[0]->subid = str_dup_remove_quotes((yyvsp[(3) - (4)].s));
           mem_sys_free((yyvsp[(3) - (4)].s));
         ;}
    break;

  case 73:
#line 1127 "compilers/imcc/imcc.y"
    {
           add_pcc_multi(IMCC_INFO(interp)->cur_call, NULL);
         ;}
    break;

  case 74:
#line 1131 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr));
         ;}
    break;

  case 75:
#line 1136 "compilers/imcc/imcc.y"
    {
           (yyval.t) = 0;
           add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr));
         ;}
    break;

  case 76:
#line 1143 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, "INTVAL",   'S'); ;}
    break;

  case 77:
#line 1144 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, "FLOATVAL", 'S'); ;}
    break;

  case 78:
#line 1145 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, "PMC",      'S'); ;}
    break;

  case 79:
#line 1146 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, "STRING",   'S'); ;}
    break;

  case 80:
#line 1148 "compilers/imcc/imcc.y"
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

  case 81:
#line 1159 "compilers/imcc/imcc.y"
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

  case 82:
#line 1169 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); ;}
    break;

  case 85:
#line 1179 "compilers/imcc/imcc.y"
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

  case 86:
#line 1207 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 87:
#line 1211 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; IMCC_INFO(interp)->cur_call->pcc_sub->label = 0; ;}
    break;

  case 88:
#line 1212 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; IMCC_INFO(interp)->cur_call->pcc_sub->label = 1; ;}
    break;

  case 89:
#line 1216 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; ;}
    break;

  case 90:
#line 1217 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->object = (yyvsp[(2) - (3)].sr); ;}
    break;

  case 91:
#line 1221 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 93:
#line 1226 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (1)].t); ;}
    break;

  case 94:
#line 1227 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); ;}
    break;

  case 95:
#line 1231 "compilers/imcc/imcc.y"
    { (yyval.t) = P_LOAD; ;}
    break;

  case 96:
#line 1232 "compilers/imcc/imcc.y"
    { (yyval.t) = P_INIT; ;}
    break;

  case 97:
#line 1233 "compilers/imcc/imcc.y"
    { (yyval.t) = P_MAIN; ;}
    break;

  case 98:
#line 1234 "compilers/imcc/imcc.y"
    { (yyval.t) = P_IMMEDIATE; ;}
    break;

  case 99:
#line 1235 "compilers/imcc/imcc.y"
    { (yyval.t) = P_POSTCOMP; ;}
    break;

  case 100:
#line 1236 "compilers/imcc/imcc.y"
    { (yyval.t) = P_ANON; ;}
    break;

  case 101:
#line 1237 "compilers/imcc/imcc.y"
    { (yyval.t) = P_NEED_LEX; ;}
    break;

  case 109:
#line 1249 "compilers/imcc/imcc.y"
    {
           add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (5)].sr));
           add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         ;}
    break;

  case 110:
#line 1254 "compilers/imcc/imcc.y"
    {
           add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
         ;}
    break;

  case 111:
#line 1258 "compilers/imcc/imcc.y"
    {
           add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
           IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isNCI;
         ;}
    break;

  case 112:
#line 1263 "compilers/imcc/imcc.y"
    {
           add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
         ;}
    break;

  case 113:
#line 1267 "compilers/imcc/imcc.y"
    {
           add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[(2) - (3)].s), 'S'));
         ;}
    break;

  case 114:
#line 1271 "compilers/imcc/imcc.y"
    {
           add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (5)].sr));
           add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         ;}
    break;

  case 115:
#line 1276 "compilers/imcc/imcc.y"
    {
           add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[(2) - (5)].s), 'S'));
           add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         ;}
    break;

  case 116:
#line 1284 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 117:
#line 1285 "compilers/imcc/imcc.y"
    { add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); ;}
    break;

  case 118:
#line 1289 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (2)].sr); ;}
    break;

  case 119:
#line 1294 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 120:
#line 1296 "compilers/imcc/imcc.y"
    {
           if ((yyvsp[(2) - (3)].sr))
               add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
         ;}
    break;

  case 121:
#line 1303 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); ;}
    break;

  case 122:
#line 1304 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 123:
#line 1305 "compilers/imcc/imcc.y"
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

  case 124:
#line 1319 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 125:
#line 1320 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); ;}
    break;

  case 126:
#line 1324 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT;   ;}
    break;

  case 127:
#line 1325 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_OPTIONAL; ;}
    break;

  case 128:
#line 1326 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_OPT_FLAG; ;}
    break;

  case 129:
#line 1327 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_NAMED; ;}
    break;

  case 130:
#line 1328 "compilers/imcc/imcc.y"
    { adv_named_set(interp, (yyvsp[(3) - (4)].s)); (yyval.t) = 0; ;}
    break;

  case 131:
#line 1329 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_UNIQUE_REG; ;}
    break;

  case 132:
#line 1334 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, 0); ;}
    break;

  case 133:
#line 1336 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->asm_state = AsmDefault; ;}
    break;

  case 134:
#line 1338 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->asm_state = AsmDefault;
           (yyval.i) = 0;
         ;}
    break;

  case 135:
#line 1345 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, 1); ;}
    break;

  case 136:
#line 1347 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->asm_state = AsmDefault; ;}
    break;

  case 137:
#line 1351 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 138:
#line 1353 "compilers/imcc/imcc.y"
    {
           if ((yyvsp[(1) - (2)].sr))
               add_pcc_result(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (2)].sr));
         ;}
    break;

  case 139:
#line 1358 "compilers/imcc/imcc.y"
    {
           if ((yyvsp[(2) - (3)].sr))
               add_pcc_result(IMCC_INFO(interp)->sr_return, (yyvsp[(2) - (3)].sr));
         ;}
    break;

  case 140:
#line 1365 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 141:
#line 1367 "compilers/imcc/imcc.y"
    {
           if ((yyvsp[(1) - (2)].sr))
               add_pcc_result(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (2)].sr));
         ;}
    break;

  case 142:
#line 1372 "compilers/imcc/imcc.y"
    {
           if ((yyvsp[(2) - (3)].sr))
               add_pcc_result(IMCC_INFO(interp)->sr_return, (yyvsp[(2) - (3)].sr));
         ;}
    break;

  case 143:
#line 1379 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); ;}
    break;

  case 144:
#line 1383 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); ;}
    break;

  case 145:
#line 1388 "compilers/imcc/imcc.y"
    {
          if (IMCC_INFO(interp)->asm_state == AsmDefault)
              begin_return_or_yield(interp, (yyvsp[(1) - (2)].t));
        ;}
    break;

  case 146:
#line 1393 "compilers/imcc/imcc.y"
    {
          IMCC_INFO(interp)->asm_state = AsmDefault;
          (yyval.t) = 0;
        ;}
    break;

  case 147:
#line 1400 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 148:
#line 1401 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; ;}
    break;

  case 149:
#line 1405 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 150:
#line 1407 "compilers/imcc/imcc.y"
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

  case 151:
#line 1417 "compilers/imcc/imcc.y"
    {
           add_pcc_named_return(interp, IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (3)].s), (yyvsp[(3) - (3)].sr));
         ;}
    break;

  case 152:
#line 1421 "compilers/imcc/imcc.y"
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

  case 153:
#line 1431 "compilers/imcc/imcc.y"
    {
           add_pcc_named_return(interp, IMCC_INFO(interp)->sr_return, (yyvsp[(3) - (5)].s), (yyvsp[(5) - (5)].sr));
         ;}
    break;

  case 156:
#line 1451 "compilers/imcc/imcc.y"
    { clear_state(interp); ;}
    break;

  case 157:
#line 1456 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(2) - (2)].i); ;}
    break;

  case 158:
#line 1457 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 159:
#line 1458 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 160:
#line 1459 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 161:
#line 1460 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 162:
#line 1464 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; ;}
    break;

  case 166:
#line 1475 "compilers/imcc/imcc.y"
    {
           (yyval.i) = iLABEL(interp, IMCC_INFO(interp)->cur_unit, mk_local_label(interp, (yyvsp[(1) - (1)].s)));
         ;}
    break;

  case 167:
#line 1483 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(2) - (3)].i); ;}
    break;

  case 168:
#line 1485 "compilers/imcc/imcc.y"
    {
           if (yynerrs >= PARROT_MAX_RECOVER_ERRORS) {
               IMCC_warning(interp, "Too many errors. Correct some first.\n");
               YYABORT;
           }
           yyerrok;
         ;}
    break;

  case 169:
#line 1496 "compilers/imcc/imcc.y"
    {
           IdList* l = (yyvsp[(1) - (1)].idlist);
           l->next = NULL;
           (yyval.idlist) = l;
         ;}
    break;

  case 170:
#line 1503 "compilers/imcc/imcc.y"
    {
           IdList* l = (yyvsp[(3) - (3)].idlist);
           l->next = (yyvsp[(1) - (3)].idlist);
           (yyval.idlist) = l;
         ;}
    break;

  case 171:
#line 1512 "compilers/imcc/imcc.y"
    {
           IdList* const l = mem_allocate_n_zeroed_typed(1, IdList);
           l->id           = (yyvsp[(1) - (2)].s);
           l->unique_reg   = (yyvsp[(2) - (2)].t);
           (yyval.idlist) = l;
         ;}
    break;

  case 172:
#line 1521 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 173:
#line 1522 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; ;}
    break;

  case 176:
#line 1529 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 177:
#line 1530 "compilers/imcc/imcc.y"
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

  case 178:
#line 1546 "compilers/imcc/imcc.y"
    {
           set_lexical(interp, (yyvsp[(4) - (4)].sr), (yyvsp[(2) - (4)].s)); (yyval.i) = 0;
         ;}
    break;

  case 179:
#line 1549 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 180:
#line 1550 "compilers/imcc/imcc.y"
    {
           mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 0);
           is_def=0;
           mem_sys_free((yyvsp[(4) - (6)].s));
         ;}
    break;

  case 182:
#line 1557 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 183:
#line 1558 "compilers/imcc/imcc.y"
    {
           mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1);
           is_def=0;
           mem_sys_free((yyvsp[(4) - (6)].s));
         ;}
    break;

  case 184:
#line 1564 "compilers/imcc/imcc.y"
    {
           (yyval.i) = NULL;
           IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isTAIL_CALL;
           IMCC_INFO(interp)->cur_call = NULL;
         ;}
    break;

  case 185:
#line 1569 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "branch", 1, (yyvsp[(2) - (2)].sr)); ;}
    break;

  case 186:
#line 1571 "compilers/imcc/imcc.y"
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

  case 187:
#line 1582 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(2) - (2)].sr)); ;}
    break;

  case 188:
#line 1583 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 189:
#line 1584 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 192:
#line 1587 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;;}
    break;

  case 193:
#line 1591 "compilers/imcc/imcc.y"
    { (yyval.t) = 'I'; ;}
    break;

  case 194:
#line 1592 "compilers/imcc/imcc.y"
    { (yyval.t) = 'N'; ;}
    break;

  case 195:
#line 1593 "compilers/imcc/imcc.y"
    { (yyval.t) = 'S'; ;}
    break;

  case 196:
#line 1594 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; ;}
    break;

  case 197:
#line 1599 "compilers/imcc/imcc.y"
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

  case 198:
#line 1612 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr));  ;}
    break;

  case 199:
#line 1614 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (4)].s), 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));  ;}
    break;

  case 200:
#line 1616 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(4) - (5)].s), 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  ;}
    break;

  case 201:
#line 1618 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(5) - (6)].sr)); ;}
    break;

  case 202:
#line 1620 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 203:
#line 1622 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].s), (yyvsp[(6) - (6)].sr), 1); ;}
    break;

  case 204:
#line 1624 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].s), (yyvsp[(6) - (7)].sr), 1); ;}
    break;

  case 205:
#line 1626 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].s), NULL, 1); ;}
    break;

  case 206:
#line 1628 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 207:
#line 1630 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 208:
#line 1632 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 209:
#line 1634 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 210:
#line 1636 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); ;}
    break;

  case 211:
#line 1640 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 212:
#line 1642 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 213:
#line 1644 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); ;}
    break;

  case 214:
#line 1647 "compilers/imcc/imcc.y"
    {
           add_pcc_result((yyvsp[(3) - (3)].i)->symregs[0], (yyvsp[(1) - (3)].sr));
           IMCC_INFO(interp)->cur_call = NULL;
           (yyval.i) = 0;
         ;}
    break;

  case 215:
#line 1653 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
         ;}
    break;

  case 216:
#line 1657 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[(6) - (9)].sr));
           IMCC_INFO(interp)->cur_call = NULL;
         ;}
    break;

  case 220:
#line 1665 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(1) - (3)].sr));
         ;}
    break;

  case 221:
#line 1672 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"not"; ;}
    break;

  case 222:
#line 1673 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"bnot"; ;}
    break;

  case 223:
#line 1674 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"neg"; ;}
    break;

  case 224:
#line 1678 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"sub"; ;}
    break;

  case 225:
#line 1679 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"add"; ;}
    break;

  case 226:
#line 1680 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"mul"; ;}
    break;

  case 227:
#line 1681 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"div"; ;}
    break;

  case 228:
#line 1682 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"mod"; ;}
    break;

  case 229:
#line 1683 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"fdiv"; ;}
    break;

  case 230:
#line 1684 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"pow"; ;}
    break;

  case 231:
#line 1685 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"concat"; ;}
    break;

  case 232:
#line 1686 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"iseq"; ;}
    break;

  case 233:
#line 1687 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"isne"; ;}
    break;

  case 234:
#line 1688 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"isgt"; ;}
    break;

  case 235:
#line 1689 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"isge"; ;}
    break;

  case 236:
#line 1690 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"islt"; ;}
    break;

  case 237:
#line 1691 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"isle"; ;}
    break;

  case 238:
#line 1692 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"shl"; ;}
    break;

  case 239:
#line 1693 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"shr"; ;}
    break;

  case 240:
#line 1694 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"lsr"; ;}
    break;

  case 241:
#line 1695 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"and"; ;}
    break;

  case 242:
#line 1696 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"or"; ;}
    break;

  case 243:
#line 1697 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"xor"; ;}
    break;

  case 244:
#line 1698 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"band"; ;}
    break;

  case 245:
#line 1699 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"bor"; ;}
    break;

  case 246:
#line 1700 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"bxor"; ;}
    break;

  case 247:
#line 1706 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           (yyval.i)->type &= ~ITCALL;
           (yyval.i)->type |= ITRESULT;
         ;}
    break;

  case 248:
#line 1711 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 249:
#line 1718 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(2) - (3)].s), 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr));
         ;}
    break;

  case 250:
#line 1724 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"add"; ;}
    break;

  case 251:
#line 1725 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"sub"; ;}
    break;

  case 252:
#line 1726 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"mul"; ;}
    break;

  case 253:
#line 1727 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"div"; ;}
    break;

  case 254:
#line 1728 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"mod"; ;}
    break;

  case 255:
#line 1729 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"fdiv"; ;}
    break;

  case 256:
#line 1730 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"concat"; ;}
    break;

  case 257:
#line 1731 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"band"; ;}
    break;

  case 258:
#line 1732 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"bor"; ;}
    break;

  case 259:
#line 1733 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"bxor"; ;}
    break;

  case 260:
#line 1734 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"shr"; ;}
    break;

  case 261:
#line 1735 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"shl"; ;}
    break;

  case 262:
#line 1736 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"lsr"; ;}
    break;

  case 263:
#line 1742 "compilers/imcc/imcc.y"
    {
        (yyval.i) = func_ins(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(3) - (4)].s),
                      IMCC_INFO(interp) -> regs,
                      IMCC_INFO(interp) -> nargs,
                      IMCC_INFO(interp) -> keyvec, 1);
         mem_sys_free((yyvsp[(3) - (4)].s));
       ;}
    break;

  case 264:
#line 1752 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s));  mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 265:
#line 1753 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 266:
#line 1754 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 267:
#line 1756 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = (yyvsp[(1) - (1)].sr);
           if ((yyvsp[(1) - (1)].sr)->set != 'P')
               IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR, "Sub isn't a PMC");
         ;}
    break;

  case 268:
#line 1762 "compilers/imcc/imcc.y"
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

  case 269:
#line 1774 "compilers/imcc/imcc.y"
    {
            IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr);
            (yyval.sr)                         = mk_const(interp, (yyvsp[(3) - (3)].s), 'S');
            mem_sys_free((yyvsp[(3) - (3)].s));
         ;}
    break;

  case 270:
#line 1779 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); ;}
    break;

  case 271:
#line 1785 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[(1) - (1)].sr));
         ;}
    break;

  case 272:
#line 1789 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(2) - (5)].i); ;}
    break;

  case 273:
#line 1793 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 274:
#line 1795 "compilers/imcc/imcc.y"
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

  case 275:
#line 1805 "compilers/imcc/imcc.y"
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

  case 276:
#line 1815 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = 0;
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (5)].s), (yyvsp[(5) - (5)].sr));
           mem_sys_free((yyvsp[(3) - (5)].s));
         ;}
    break;

  case 277:
#line 1821 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = 0;
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (3)].s), (yyvsp[(3) - (3)].sr));
           mem_sys_free((yyvsp[(1) - (3)].s));
         ;}
    break;

  case 278:
#line 1829 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); ;}
    break;

  case 279:
#line 1833 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 280:
#line 1834 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); ;}
    break;

  case 281:
#line 1838 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT; ;}
    break;

  case 282:
#line 1839 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_NAMED; ;}
    break;

  case 283:
#line 1842 "compilers/imcc/imcc.y"
    { adv_named_set(interp, (yyvsp[(3) - (4)].s)); (yyval.t) = 0; ;}
    break;

  case 284:
#line 1846 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); ;}
    break;

  case 285:
#line 1851 "compilers/imcc/imcc.y"
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

  case 286:
#line 1861 "compilers/imcc/imcc.y"
    {
           add_pcc_named_result(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (5)].s), (yyvsp[(5) - (5)].sr));
           mem_sys_free((yyvsp[(3) - (5)].s));
         ;}
    break;

  case 287:
#line 1866 "compilers/imcc/imcc.y"
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

  case 288:
#line 1876 "compilers/imcc/imcc.y"
    {
           add_pcc_named_result(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (3)].s), (yyvsp[(3) - (3)].sr));
           mem_sys_free((yyvsp[(1) - (3)].s));
         ;}
    break;

  case 289:
#line 1880 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 290:
#line 1884 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 291:
#line 1885 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 292:
#line 1890 "compilers/imcc/imcc.y"
    {
           (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, inv_op((yyvsp[(3) - (6)].s)), 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr));
         ;}
    break;

  case 293:
#line 1894 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));
         ;}
    break;

  case 294:
#line 1898 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr));
         ;}
    break;

  case 295:
#line 1905 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr));
         ;}
    break;

  case 296:
#line 1909 "compilers/imcc/imcc.y"
    {
           (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr));
         ;}
    break;

  case 297:
#line 1913 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));
         ;}
    break;

  case 298:
#line 1919 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 299:
#line 1920 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 300:
#line 1924 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"eq"; ;}
    break;

  case 301:
#line 1925 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"ne"; ;}
    break;

  case 302:
#line 1926 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"gt"; ;}
    break;

  case 303:
#line 1927 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"ge"; ;}
    break;

  case 304:
#line 1928 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"lt"; ;}
    break;

  case 305:
#line 1929 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"le"; ;}
    break;

  case 308:
#line 1938 "compilers/imcc/imcc.y"
    { (yyval.sr) = NULL; ;}
    break;

  case 309:
#line 1939 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (1)].sr); ;}
    break;

  case 310:
#line 1943 "compilers/imcc/imcc.y"
    { (yyval.sr) = IMCC_INFO(interp)->regs[0]; ;}
    break;

  case 312:
#line 1948 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(1) - (1)].sr); ;}
    break;

  case 313:
#line 1950 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(1) - (4)].sr);
           IMCC_INFO(interp) -> keyvec |= KEY_BIT(IMCC_INFO(interp)->nargs);
           IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(3) - (4)].sr);
           (yyval.sr) = (yyvsp[(1) - (4)].sr);
         ;}
    break;

  case 314:
#line 1957 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(2) - (3)].sr);
           (yyval.sr) = (yyvsp[(2) - (3)].sr);
         ;}
    break;

  case 316:
#line 1964 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 317:
#line 1965 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s));  mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 318:
#line 1969 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 319:
#line 1970 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 320:
#line 1974 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 321:
#line 1975 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 326:
#line 1989 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->nkeys    = 0;
           IMCC_INFO(interp)->in_slice = 0;
         ;}
    break;

  case 327:
#line 1994 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = link_keys(interp,
                          IMCC_INFO(interp)->nkeys,
                          IMCC_INFO(interp)->keys, 0);
         ;}
    break;

  case 328:
#line 2002 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->nkeys = 0;
           IMCC_INFO(interp)->in_slice = 0;
         ;}
    break;

  case 329:
#line 2007 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = link_keys(interp,
                          IMCC_INFO(interp)->nkeys,
                          IMCC_INFO(interp)->keys, 1);
         ;}
    break;

  case 330:
#line 2015 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(1) - (1)].sr); ;}
    break;

  case 331:
#line 2017 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(3) - (3)].sr);
           (yyval.sr) = IMCC_INFO(interp)->keys[0];
         ;}
    break;

  case 332:
#line 2021 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->in_slice = 1; ;}
    break;

  case 333:
#line 2023 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(4) - (4)].sr);
           (yyval.sr) = IMCC_INFO(interp)->keys[0];
         ;}
    break;

  case 334:
#line 2031 "compilers/imcc/imcc.y"
    {
           if (IMCC_INFO(interp)->in_slice)
               (yyvsp[(1) - (1)].sr)->type |= VT_START_SLICE | VT_END_SLICE;
           (yyval.sr) = (yyvsp[(1) - (1)].sr);
         ;}
    break;

  case 335:
#line 2037 "compilers/imcc/imcc.y"
    {
           (yyvsp[(1) - (3)].sr)->type |= VT_START_SLICE;
           (yyvsp[(3) - (3)].sr)->type |= VT_END_SLICE;
           IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(1) - (3)].sr);
           (yyval.sr) = (yyvsp[(3) - (3)].sr);
         ;}
    break;

  case 336:
#line 2043 "compilers/imcc/imcc.y"
    { (yyvsp[(2) - (2)].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[(2) - (2)].sr); ;}
    break;

  case 337:
#line 2044 "compilers/imcc/imcc.y"
    { (yyvsp[(1) - (2)].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[(1) - (2)].sr); ;}
    break;

  case 338:
#line 2048 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'I'); ;}
    break;

  case 339:
#line 2049 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'N'); ;}
    break;

  case 340:
#line 2050 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); ;}
    break;

  case 341:
#line 2051 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'P'); ;}
    break;

  case 342:
#line 2052 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_pasm_reg(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 343:
#line 2056 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'I'); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 344:
#line 2057 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'N'); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 345:
#line 2058 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S'); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 346:
#line 2059 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'U'); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4868 "compilers/imcc/imcparser.c"
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


#line 2065 "compilers/imcc/imcc.y"


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

