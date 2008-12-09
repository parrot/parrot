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
     ENDNAMESPACE = 280,
     DOT_METHOD = 281,
     SUB = 282,
     SYM = 283,
     LOCAL = 284,
     LEXICAL = 285,
     CONST = 286,
     INC = 287,
     DEC = 288,
     GLOBAL_CONST = 289,
     PLUS_ASSIGN = 290,
     MINUS_ASSIGN = 291,
     MUL_ASSIGN = 292,
     DIV_ASSIGN = 293,
     CONCAT_ASSIGN = 294,
     BAND_ASSIGN = 295,
     BOR_ASSIGN = 296,
     BXOR_ASSIGN = 297,
     FDIV = 298,
     FDIV_ASSIGN = 299,
     MOD_ASSIGN = 300,
     SHR_ASSIGN = 301,
     SHL_ASSIGN = 302,
     SHR_U_ASSIGN = 303,
     SHIFT_LEFT = 304,
     SHIFT_RIGHT = 305,
     INTV = 306,
     FLOATV = 307,
     STRINGV = 308,
     PMCV = 309,
     LOG_XOR = 310,
     RELOP_EQ = 311,
     RELOP_NE = 312,
     RELOP_GT = 313,
     RELOP_GTE = 314,
     RELOP_LT = 315,
     RELOP_LTE = 316,
     RESULT = 317,
     RETURN = 318,
     TAILCALL = 319,
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
     SUB_INSTANCE_OF = 352,
     SUBID = 353,
     NS_ENTRY = 354,
     UNIQUE_REG = 355,
     LABEL = 356,
     EMIT = 357,
     EOM = 358,
     IREG = 359,
     NREG = 360,
     SREG = 361,
     PREG = 362,
     IDENTIFIER = 363,
     REG = 364,
     MACRO = 365,
     ENDM = 366,
     STRINGC = 367,
     INTC = 368,
     FLOATC = 369,
     USTRINGC = 370,
     PARROT_OP = 371,
     VAR = 372,
     LINECOMMENT = 373,
     FILECOMMENT = 374,
     DOT = 375,
     CONCAT = 376
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
#define ENDNAMESPACE 280
#define DOT_METHOD 281
#define SUB 282
#define SYM 283
#define LOCAL 284
#define LEXICAL 285
#define CONST 286
#define INC 287
#define DEC 288
#define GLOBAL_CONST 289
#define PLUS_ASSIGN 290
#define MINUS_ASSIGN 291
#define MUL_ASSIGN 292
#define DIV_ASSIGN 293
#define CONCAT_ASSIGN 294
#define BAND_ASSIGN 295
#define BOR_ASSIGN 296
#define BXOR_ASSIGN 297
#define FDIV 298
#define FDIV_ASSIGN 299
#define MOD_ASSIGN 300
#define SHR_ASSIGN 301
#define SHL_ASSIGN 302
#define SHR_U_ASSIGN 303
#define SHIFT_LEFT 304
#define SHIFT_RIGHT 305
#define INTV 306
#define FLOATV 307
#define STRINGV 308
#define PMCV 309
#define LOG_XOR 310
#define RELOP_EQ 311
#define RELOP_NE 312
#define RELOP_GT 313
#define RELOP_GTE 314
#define RELOP_LT 315
#define RELOP_LTE 316
#define RESULT 317
#define RETURN 318
#define TAILCALL 319
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
#define SUB_INSTANCE_OF 352
#define SUBID 353
#define NS_ENTRY 354
#define UNIQUE_REG 355
#define LABEL 356
#define EMIT 357
#define EOM 358
#define IREG 359
#define NREG 360
#define SREG 361
#define PREG 362
#define IDENTIFIER 363
#define REG 364
#define MACRO 365
#define ENDM 366
#define STRINGC 367
#define INTC 368
#define FLOATC 369
#define USTRINGC 370
#define PARROT_OP 371
#define VAR 372
#define LINECOMMENT 373
#define FILECOMMENT 374
#define DOT 375
#define CONCAT 376




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
#line 1032 "compilers/imcc/imcparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 1045 "compilers/imcc/imcparser.c"

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
#define YYLAST   736

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  138
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  126
/* YYNRULES -- Number of rules.  */
#define YYNRULES  348
/* YYNRULES -- Number of states.  */
#define YYNSTATES  562

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   376

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   128,     2,     2,     2,   134,   135,     2,
     126,   127,   132,   131,     2,   130,     2,   133,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   137,
       2,   123,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   124,     2,   125,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   136,     2,   129,     2,     2,     2,
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
     116,   117,   118,   119,   120,   121,   122
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
     485,   489,   492,   493,   495,   497,   499,   502,   505,   506,
     511,   516,   517,   524,   526,   527,   534,   537,   540,   543,
     546,   548,   550,   552,   554,   555,   557,   559,   561,   563,
     565,   569,   574,   580,   587,   594,   601,   609,   614,   619,
     624,   631,   638,   646,   651,   658,   666,   670,   671,   681,
     683,   685,   687,   691,   693,   695,   697,   699,   701,   703,
     705,   707,   709,   711,   713,   715,   717,   719,   721,   723,
     725,   727,   729,   731,   733,   735,   737,   739,   741,   743,
     744,   750,   754,   756,   758,   760,   762,   764,   766,   768,
     770,   772,   774,   776,   778,   780,   785,   787,   789,   791,
     793,   797,   801,   805,   806,   812,   813,   817,   819,   825,
     829,   832,   833,   836,   838,   840,   845,   848,   852,   858,
     860,   864,   865,   867,   869,   876,   882,   887,   892,   899,
     905,   907,   909,   911,   913,   915,   917,   919,   921,   923,
     925,   926,   928,   932,   934,   936,   941,   945,   947,   949,
     951,   953,   955,   957,   959,   961,   963,   965,   967,   968,
     971,   972,   975,   977,   981,   982,   987,   989,   993,   996,
     999,  1001,  1003,  1005,  1007,  1009,  1011,  1013,  1015
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     139,     0,    -1,   140,    -1,   141,    -1,   140,   141,    -1,
     160,    -1,   145,    -1,   162,    -1,   157,    -1,   111,     4,
      -1,   142,    -1,   143,    -1,     4,    -1,   144,     4,    -1,
      97,   113,     4,    -1,     8,   114,    72,   113,     4,    -1,
       9,   113,     4,    -1,     6,   113,    -1,     7,   113,   123,
     113,    -1,    -1,    32,   146,   221,   109,   123,   263,    -1,
      -1,    32,   148,   114,   253,   123,   150,    -1,    -1,    32,
     149,   113,   253,   123,   150,    -1,   113,    -1,   116,    -1,
     152,    -1,   151,   152,    -1,   210,   153,     4,    -1,   111,
       4,    -1,   120,    -1,   119,    -1,   160,    -1,   147,    -1,
     142,    -1,    -1,   154,   117,   156,    -1,    -1,    78,   155,
     184,   102,    -1,    14,   254,    -1,    31,   113,    72,   110,
      -1,    -1,   247,    -1,    -1,   103,   158,   159,   104,    -1,
      -1,   151,    -1,    25,   161,     4,    -1,   124,   255,   125,
      -1,   124,   125,    -1,    -1,    -1,    -1,    28,   163,   250,
     164,   184,     4,   165,   166,   179,    73,    -1,    -1,     4,
      -1,   166,   167,     4,    -1,    -1,     5,   168,   169,    -1,
     221,   109,   193,    -1,    95,   126,   177,   127,    -1,    93,
     126,   113,   127,    -1,    93,   126,   109,   127,    -1,    96,
      -1,    96,   126,   113,   127,    -1,    91,    -1,    91,   126,
     150,   127,    -1,   100,    -1,   100,   126,   150,   127,    -1,
      98,   126,   113,   127,    -1,    99,    -1,    99,   126,   150,
     127,    -1,    -1,   177,    72,   178,    -1,   178,    -1,    52,
      -1,    53,    -1,    55,    -1,    54,    -1,   109,    -1,   113,
      -1,   124,   255,   125,    -1,    -1,   207,    -1,    -1,    75,
       4,   181,   188,   183,   187,   182,   190,    76,    -1,    -1,
     212,     4,    -1,    -1,    85,   254,     4,    -1,    -1,   185,
      -1,   186,    -1,   185,   186,    -1,    87,    -1,    88,    -1,
      86,    -1,    89,    -1,    90,    -1,    92,    -1,    94,    -1,
     170,    -1,   171,    -1,   172,    -1,   173,    -1,   174,    -1,
     175,    -1,   176,    -1,    77,   254,    72,   254,     4,    -1,
      77,   254,     4,    -1,    83,   254,     4,    -1,    84,   246,
       4,    -1,    84,   113,     4,    -1,    84,   246,    72,   254,
       4,    -1,    84,   113,    72,   254,     4,    -1,    -1,   188,
     189,     4,    -1,    11,   236,    -1,    -1,   190,   191,     4,
      -1,    63,   246,   193,    -1,    -1,    30,   192,   221,   215,
      -1,    -1,   193,   194,    -1,    18,    -1,    19,    -1,    20,
      -1,    21,    -1,    21,   126,   113,   127,    -1,   101,    -1,
      -1,    79,     4,   196,   199,    80,    -1,   203,    -1,    -1,
      81,     4,   198,   200,    82,    -1,    -1,   199,     4,    -1,
     199,   201,     4,    -1,    -1,   200,     4,    -1,   200,   202,
       4,    -1,    15,   254,   237,    -1,    16,   254,   237,    -1,
      -1,   205,   126,   204,   206,   127,    -1,    64,    -1,    66,
      -1,    -1,   236,    -1,   113,    22,   254,    -1,   206,    72,
     236,    -1,   206,    72,   113,    22,   254,    -1,   209,    -1,
     207,   209,    -1,    -1,   208,   213,    -1,   111,     4,    -1,
     120,    -1,   119,    -1,   143,    -1,    -1,   211,    -1,   211,
     212,    -1,   212,    -1,   102,    -1,   210,   217,     4,    -1,
       1,     4,    -1,   215,    -1,   214,    72,   215,    -1,   109,
     216,    -1,    -1,   101,    -1,   223,    -1,   241,    -1,    25,
     109,    -1,    26,   109,    -1,    -1,    30,   218,   221,   214,
      -1,    31,   113,    72,   246,    -1,    -1,    32,   219,   221,
     109,   123,   263,    -1,   147,    -1,    -1,    35,   220,   221,
     109,   123,   263,    -1,    65,   233,    -1,    10,   252,    -1,
     117,   247,    -1,    14,   254,    -1,   233,    -1,   180,    -1,
     195,    -1,   197,    -1,    -1,    52,    -1,    53,    -1,    54,
      -1,    55,    -1,   109,    -1,   246,   123,   254,    -1,   246,
     123,   225,   254,    -1,   246,   123,   254,   226,   254,    -1,
     246,   123,   254,   124,   255,   125,    -1,   246,   124,   255,
     125,   123,   254,    -1,   246,   123,    23,   222,    72,   254,
      -1,   246,   123,    23,   222,   124,   255,   125,    -1,   246,
     123,    23,   222,    -1,   246,   123,    23,   254,    -1,   246,
     123,    23,   161,    -1,   246,   123,    23,   161,    72,   254,
      -1,   246,   123,    23,   254,    72,   254,    -1,   246,   123,
      23,   254,   124,   255,   125,    -1,    23,   246,    72,   254,
      -1,    23,   246,    72,   254,    72,   254,    -1,    23,   246,
      72,   254,   124,   255,   125,    -1,   246,   123,   233,    -1,
      -1,   126,   224,   240,   127,   123,   232,   126,   235,   127,
      -1,   227,    -1,   229,    -1,   231,    -1,   246,   123,    14,
      -1,   128,    -1,   129,    -1,   130,    -1,   130,    -1,   131,
      -1,   132,    -1,   133,    -1,   134,    -1,    44,    -1,    68,
      -1,   122,    -1,    57,    -1,    58,    -1,    59,    -1,    60,
      -1,    61,    -1,    62,    -1,    50,    -1,    51,    -1,    69,
      -1,    70,    -1,    71,    -1,    56,    -1,   135,    -1,   136,
      -1,   129,    -1,    -1,    67,   228,   126,   240,   127,    -1,
     246,   230,   254,    -1,    36,    -1,    37,    -1,    38,    -1,
      39,    -1,    46,    -1,    45,    -1,    40,    -1,    41,    -1,
      42,    -1,    43,    -1,    47,    -1,    48,    -1,    49,    -1,
     246,   123,   117,   156,    -1,   109,    -1,   113,    -1,   116,
      -1,   246,    -1,   246,   121,   251,    -1,   246,   121,   113,
      -1,   246,   121,   246,    -1,    -1,   232,   234,   126,   235,
     127,    -1,    -1,   235,    72,   236,    -1,   236,    -1,   235,
      72,   113,    22,   254,    -1,   113,    22,   254,    -1,   254,
     237,    -1,    -1,   237,   238,    -1,    17,    -1,    21,    -1,
      21,   126,   113,   127,    -1,   246,   193,    -1,   240,    72,
     239,    -1,   240,    72,   113,    22,   246,    -1,   239,    -1,
     113,    22,   246,    -1,    -1,   243,    -1,   242,    -1,    13,
     254,   245,   254,    10,   252,    -1,    13,    14,   254,    10,
     252,    -1,    13,   254,   244,   252,    -1,    12,   254,   244,
     252,    -1,    12,   254,   245,   254,    10,   252,    -1,    12,
      14,   254,    10,   252,    -1,    72,    -1,    10,    -1,    57,
      -1,    58,    -1,    59,    -1,    60,    -1,    61,    -1,    62,
      -1,   118,    -1,   262,    -1,    -1,   248,    -1,   248,    72,
     249,    -1,   249,    -1,   253,    -1,   246,   124,   255,   125,
      -1,   124,   257,   125,    -1,   251,    -1,   113,    -1,   116,
      -1,   109,    -1,   117,    -1,   109,    -1,   117,    -1,   252,
      -1,   254,    -1,   246,    -1,   263,    -1,    -1,   256,   259,
      -1,    -1,   258,   259,    -1,   261,    -1,   259,   137,   261,
      -1,    -1,   259,    72,   260,   261,    -1,   254,    -1,   254,
      74,   254,    -1,    74,   254,    -1,   254,    74,    -1,   105,
      -1,   106,    -1,   107,    -1,   108,    -1,   110,    -1,   114,
      -1,   115,    -1,   113,    -1,   116,    -1
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
    1502,  1511,  1521,  1522,  1527,  1528,  1529,  1530,  1531,  1531,
    1547,  1551,  1551,  1558,  1559,  1559,  1565,  1571,  1572,  1584,
    1585,  1586,  1587,  1588,  1589,  1593,  1594,  1595,  1596,  1600,
    1613,  1615,  1617,  1619,  1621,  1623,  1625,  1627,  1629,  1631,
    1633,  1635,  1637,  1641,  1643,  1645,  1648,  1655,  1654,  1663,
    1664,  1665,  1666,  1674,  1675,  1676,  1680,  1681,  1682,  1683,
    1684,  1685,  1686,  1687,  1688,  1689,  1690,  1691,  1692,  1693,
    1694,  1695,  1696,  1697,  1698,  1699,  1700,  1701,  1702,  1708,
    1707,  1719,  1726,  1727,  1728,  1729,  1730,  1731,  1732,  1733,
    1734,  1735,  1736,  1737,  1738,  1743,  1754,  1755,  1756,  1757,
    1763,  1775,  1781,  1787,  1786,  1795,  1796,  1806,  1816,  1822,
    1831,  1835,  1836,  1840,  1841,  1844,  1848,  1852,  1862,  1867,
    1877,  1882,  1886,  1887,  1891,  1895,  1899,  1906,  1910,  1914,
    1921,  1922,  1926,  1927,  1928,  1929,  1930,  1931,  1935,  1936,
    1940,  1941,  1945,  1946,  1950,  1951,  1958,  1965,  1966,  1967,
    1971,  1972,  1976,  1977,  1981,  1982,  1986,  1987,  1991,  1991,
    2004,  2004,  2017,  2018,  2023,  2023,  2032,  2038,  2045,  2046,
    2050,  2051,  2052,  2053,  2054,  2058,  2059,  2060,  2061
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
  "NAMESPACE", "ENDNAMESPACE", "DOT_METHOD", "SUB", "SYM", "LOCAL",
  "LEXICAL", "CONST", "INC", "DEC", "GLOBAL_CONST", "PLUS_ASSIGN",
  "MINUS_ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", "CONCAT_ASSIGN",
  "BAND_ASSIGN", "BOR_ASSIGN", "BXOR_ASSIGN", "FDIV", "FDIV_ASSIGN",
  "MOD_ASSIGN", "SHR_ASSIGN", "SHL_ASSIGN", "SHR_U_ASSIGN", "SHIFT_LEFT",
  "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV", "LOG_XOR",
  "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", "RELOP_LTE",
  "RESULT", "RETURN", "TAILCALL", "YIELDT", "GET_RESULTS", "POW",
  "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", "DOTDOT",
  "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB", "PCC_BEGIN_RETURN",
  "PCC_END_RETURN", "PCC_BEGIN_YIELD", "PCC_END_YIELD", "NCI_CALL",
  "METH_CALL", "INVOCANT", "MAIN", "LOAD", "INIT", "IMMEDIATE", "POSTCOMP",
  "METHOD", "ANON", "OUTER", "NEED_LEX", "MULTI", "VTABLE_METHOD",
  "LOADLIB", "SUB_INSTANCE_OF", "SUBID", "NS_ENTRY", "UNIQUE_REG", "LABEL",
  "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "REG",
  "MACRO", "ENDM", "STRINGC", "INTC", "FLOATC", "USTRINGC", "PARROT_OP",
  "VAR", "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", "'='", "'['",
  "']'", "'('", "')'", "'!'", "'~'", "'-'", "'+'", "'*'", "'/'", "'%'",
  "'&'", "'|'", "';'", "$accept", "program", "compilation_units",
  "compilation_unit", "pragma", "location_directive", "hll_def",
  "constdef", "@1", "pmc_const", "@2", "@3", "any_string", "pasmcode",
  "pasmline", "pasm_inst", "@4", "@5", "pasm_args", "emit", "@6",
  "opt_pasmcode", "class_namespace", "maybe_ns", "sub", "@7", "@8", "@9",
  "sub_params", "sub_param", "@10", "sub_param_type_def", "multi", "outer",
  "vtable", "method", "ns_entry_name", "instanceof", "subid",
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
     374,   375,   376,    61,    91,    93,    40,    41,    33,   126,
      45,    43,    42,    47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   138,   139,   140,   140,   141,   141,   141,   141,   141,
     141,   141,   141,   142,   142,   143,   143,   144,   144,   146,
     145,   148,   147,   149,   147,   150,   150,   151,   151,   152,
     152,   152,   152,   152,   152,   152,   154,   153,   155,   153,
     153,   153,   153,   156,   158,   157,   159,   159,   160,   161,
     161,   163,   164,   165,   162,   166,   166,   166,   168,   167,
     169,   170,   171,   171,   172,   172,   173,   173,   174,   174,
     175,   176,   176,   177,   177,   177,   178,   178,   178,   178,
     178,   178,   178,   179,   179,   181,   180,   182,   182,   183,
     183,   184,   184,   185,   185,   186,   186,   186,   186,   186,
     186,   186,   186,   186,   186,   186,   186,   186,   186,   187,
     187,   187,   187,   187,   187,   187,   188,   188,   189,   190,
     190,   191,   192,   191,   193,   193,   194,   194,   194,   194,
     194,   194,   196,   195,   195,   198,   197,   199,   199,   199,
     200,   200,   200,   201,   202,   204,   203,   205,   205,   206,
     206,   206,   206,   206,   207,   207,   208,   209,   209,   209,
     209,   209,   210,   210,   211,   211,   212,   213,   213,   214,
     214,   215,   216,   216,   217,   217,   217,   217,   218,   217,
     217,   219,   217,   217,   220,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   221,   221,   221,   221,   222,
     223,   223,   223,   223,   223,   223,   223,   223,   223,   223,
     223,   223,   223,   223,   223,   223,   223,   224,   223,   223,
     223,   223,   223,   225,   225,   225,   226,   226,   226,   226,
     226,   226,   226,   226,   226,   226,   226,   226,   226,   226,
     226,   226,   226,   226,   226,   226,   226,   226,   226,   228,
     227,   229,   230,   230,   230,   230,   230,   230,   230,   230,
     230,   230,   230,   230,   230,   231,   232,   232,   232,   232,
     232,   232,   232,   234,   233,   235,   235,   235,   235,   235,
     236,   237,   237,   238,   238,   238,   239,   240,   240,   240,
     240,   240,   241,   241,   242,   242,   242,   243,   243,   243,
     244,   244,   245,   245,   245,   245,   245,   245,   246,   246,
     247,   247,   248,   248,   249,   249,   249,   250,   250,   250,
     251,   251,   252,   252,   253,   253,   254,   254,   256,   255,
     258,   257,   259,   259,   260,   259,   261,   261,   261,   261,
     262,   262,   262,   262,   262,   263,   263,   263,   263
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
       3,     2,     0,     1,     1,     1,     2,     2,     0,     4,
       4,     0,     6,     1,     0,     6,     2,     2,     2,     2,
       1,     1,     1,     1,     0,     1,     1,     1,     1,     1,
       3,     4,     5,     6,     6,     6,     7,     4,     4,     4,
       6,     6,     7,     4,     6,     7,     3,     0,     9,     1,
       1,     1,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     0,
       5,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     4,     1,     1,     1,     1,
       3,     3,     3,     0,     5,     0,     3,     1,     5,     3,
       2,     0,     2,     1,     1,     4,     2,     3,     5,     1,
       3,     0,     1,     1,     6,     5,     4,     4,     6,     5,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       0,     1,     3,     1,     1,     4,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     0,     2,
       0,     2,     1,     3,     0,     4,     1,     3,     2,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    12,     0,     0,     0,     0,     0,    51,    19,     0,
      44,     0,     0,     2,     3,    10,    11,     0,     6,     8,
       5,     7,    17,     0,     0,     0,   328,     0,     0,     0,
       0,   162,     9,     1,     4,    13,     0,     0,    16,    50,
       0,     0,    48,   320,   318,   319,   321,    52,   317,   195,
     196,   197,   198,     0,    14,    21,   166,     0,    32,    31,
      35,    34,   162,    27,     0,    33,    36,   163,   165,    18,
       0,    49,     0,   340,   341,   342,   343,   344,   347,   345,
     346,   348,   308,   326,   336,   329,   332,   309,   327,    91,
       0,     0,     0,    30,    28,    45,     0,     0,    38,     0,
       0,   164,    15,   338,   339,   334,     0,    97,    95,    96,
      98,    99,    66,   100,     0,   101,     0,    64,     0,    71,
      68,   102,   103,   104,   105,   106,   107,   108,     0,    92,
      93,     0,     0,     0,    40,     0,    91,    29,   310,   337,
       0,   333,     0,     0,    73,     0,     0,     0,     0,    53,
      94,    20,   322,   323,   324,     0,   325,     0,     0,     0,
     330,    37,   326,    43,   311,   313,   314,   335,    25,    26,
       0,     0,     0,    76,    77,    79,    78,    80,    81,   328,
       0,    75,     0,     0,     0,     0,    55,     0,     0,    41,
      39,     0,     0,   328,     0,    67,    63,    62,     0,     0,
      61,    65,    70,    72,    69,    56,   156,    22,    24,   316,
     331,     0,   312,    82,    74,    58,     0,   160,   159,   161,
       0,     0,   156,     0,   154,   315,     0,   158,    57,    54,
     155,     0,   194,   157,    59,     0,   168,     0,     0,     0,
       0,     0,     0,     0,   178,     0,   181,   184,   147,     0,
     148,   249,     0,     0,     0,   266,   267,   268,   310,   217,
     183,   191,   192,   193,   134,     0,     0,   174,   219,   220,
     221,   273,   190,   175,   293,   292,   269,   124,   187,     0,
       0,     0,     0,   189,     0,   176,   177,     0,     0,     0,
       0,   186,   269,     0,    85,   132,   135,   188,   291,   145,
     167,     0,   252,   253,   254,   255,   258,   259,   260,   261,
     257,   256,   262,   263,   264,     0,     0,   328,     0,    60,
       0,   301,   302,   303,   304,   305,   306,   307,   300,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   291,
     116,   137,   140,     0,   289,     0,   124,   149,   275,   271,
     272,   270,   222,     0,   347,   348,   310,   223,   224,   225,
       0,   216,   326,   200,     0,   251,   126,   127,   128,   129,
     131,   125,     0,   297,     0,     0,   296,     0,   213,   172,
     179,   169,   180,     0,     0,     0,    89,     0,     0,     0,
       0,     0,   286,   347,     0,   150,   281,   347,     0,   277,
     199,   209,   207,   208,   265,   201,   231,   240,   241,   245,
     234,   235,   236,   237,   238,   239,   232,   242,   243,   244,
     233,   328,   248,   226,   227,   228,   229,   230,   246,   247,
       0,     0,     0,   299,     0,   295,     0,     0,   328,   173,
     171,     0,     0,     0,   250,     0,     0,     0,     0,   138,
       0,   133,     0,   141,     0,   136,     0,   290,     0,   287,
       0,     0,     0,   146,   280,     0,     0,   274,     0,     0,
     328,     0,   328,     0,   202,     0,     0,   298,   294,   214,
       0,   170,   182,   185,   118,     0,     0,     0,     0,    87,
     117,   281,   139,   281,   142,     0,     0,   151,   347,   152,
     283,   284,   282,   279,   347,   276,   210,   205,     0,   211,
       0,   203,   204,   130,   215,    90,     0,     0,     0,     0,
     119,     0,   143,   144,   288,   275,     0,     0,     0,   206,
     212,   110,     0,   111,   113,     0,   112,     0,     0,    88,
       0,   153,     0,   278,     0,     0,     0,   122,     0,    86,
       0,   218,   285,   109,   115,   114,     0,   124,   120,     0,
     121,   123
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    12,    13,    14,    15,    16,    17,    18,    29,    61,
      91,    92,   170,    62,    63,    99,   100,   136,   161,    19,
      31,    64,    20,    27,    21,    28,    89,   186,   206,   220,
     226,   234,   121,   122,   123,   124,   125,   126,   127,   180,
     181,   221,   261,   340,   520,   447,   128,   129,   130,   489,
     386,   448,   538,   550,   556,   319,   371,   262,   341,   263,
     342,   387,   388,   452,   456,   264,   347,   265,   394,   222,
     223,   224,    66,    67,    68,   233,   380,   381,   440,   266,
     287,   289,   290,    53,   402,   267,   298,   360,   430,   268,
     293,   269,   318,   270,   271,   272,   301,   398,   399,   464,
     502,   344,   345,   273,   274,   275,   329,   330,    83,   163,
     164,   165,    47,    48,   154,   166,   156,    40,    41,   191,
     192,    85,   140,    86,    87,    88
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -430
static const yytype_int16 yypact[] =
{
     386,  -430,   -92,   -30,   -22,   -19,    24,  -430,  -430,    33,
    -430,   117,   158,   386,  -430,  -430,  -430,   155,  -430,  -430,
    -430,  -430,  -430,    46,   109,   178,    65,   179,    76,   196,
     203,   198,  -430,  -430,  -430,  -430,    97,    99,  -430,  -430,
      90,   408,  -430,  -430,  -430,  -430,  -430,  -430,  -430,  -430,
    -430,  -430,  -430,   107,  -430,   105,  -430,   215,  -430,  -430,
    -430,  -430,   230,  -430,   128,  -430,    55,   119,  -430,  -430,
     218,  -430,   511,  -430,  -430,  -430,  -430,  -430,  -430,  -430,
    -430,  -430,  -430,  -430,   151,   -64,  -430,  -430,  -430,   501,
     110,   138,   122,  -430,  -430,  -430,   511,   144,  -430,   261,
     150,  -430,  -430,  -430,   511,  -430,   408,  -430,  -430,  -430,
    -430,  -430,   146,  -430,   147,  -430,   148,   152,   154,   157,
     159,  -430,  -430,  -430,  -430,  -430,  -430,  -430,   272,   501,
    -430,   229,   497,   497,  -430,   222,   501,  -430,   439,  -430,
     408,  -430,    98,   -53,   100,   177,   186,    98,    98,  -430,
    -430,  -430,  -430,  -430,  -430,   174,  -430,   180,   191,   202,
    -430,  -430,   181,  -430,   236,  -430,  -430,  -430,  -430,  -430,
     183,   187,   199,  -430,  -430,  -430,  -430,  -430,  -430,  -430,
     -65,  -430,   201,   209,   211,   212,   307,    98,    98,  -430,
    -430,   188,   408,  -430,   439,  -430,  -430,  -430,   200,   100,
    -430,  -430,  -430,  -430,  -430,  -430,    20,  -430,  -430,  -430,
     -64,   204,  -430,  -430,  -430,  -430,   326,  -430,  -430,  -430,
     336,   273,    30,    10,  -430,  -430,   196,  -430,  -430,  -430,
    -430,   343,   256,  -430,  -430,   242,  -430,   -56,   270,   334,
     511,   153,   244,   245,  -430,   243,   -43,  -430,  -430,   581,
    -430,  -430,   351,   353,   354,  -430,  -430,  -430,   439,  -430,
    -430,  -430,  -430,  -430,  -430,   234,   363,  -430,  -430,  -430,
    -430,  -430,  -430,  -430,  -430,  -430,   462,  -430,  -430,   511,
     184,   511,   184,  -430,   296,  -430,  -430,   196,   298,   196,
     196,  -430,   250,   253,  -430,  -430,  -430,  -430,   121,  -430,
    -430,   255,  -430,  -430,  -430,  -430,  -430,  -430,  -430,  -430,
    -430,  -430,  -430,  -430,  -430,   595,    58,  -430,   511,    -3,
     377,  -430,  -430,  -430,  -430,  -430,  -430,  -430,  -430,   -56,
     511,   381,   -56,   511,   511,   288,   153,   289,   290,   121,
    -430,  -430,  -430,   378,  -430,   -21,  -430,   525,   539,  -430,
    -430,  -430,  -430,   460,   275,   276,   439,  -430,  -430,  -430,
     511,  -430,    70,   407,   278,  -430,  -430,  -430,  -430,   280,
    -430,  -430,   -56,  -430,   397,   -56,  -430,   398,   -24,   309,
     344,  -430,  -430,   292,   294,   -20,     2,    22,    28,   153,
     609,   299,    -3,   404,   -18,  -430,  -430,   409,     7,  -430,
    -430,   347,    18,    60,  -430,  -430,  -430,  -430,  -430,  -430,
    -430,  -430,  -430,  -430,  -430,  -430,  -430,  -430,  -430,  -430,
    -430,  -430,  -430,  -430,  -430,  -430,  -430,  -430,  -430,  -430,
     511,   306,   319,  -430,   -56,  -430,   -56,   511,  -430,  -430,
    -430,   288,   229,   229,  -430,   511,   511,   118,   429,  -430,
     511,  -430,   431,  -430,   511,  -430,   432,  -430,   415,  -430,
     581,   511,   553,  -430,   139,   511,   567,  -430,   511,   511,
    -430,   511,  -430,   313,  -430,   511,   316,  -430,  -430,  -430,
     328,  -430,  -430,  -430,  -430,   450,   511,   511,   618,   119,
    -430,  -430,  -430,  -430,  -430,   153,   329,  -430,   434,  -430,
    -430,   333,  -430,  -430,   438,  -430,  -430,  -430,   337,  -430,
     345,  -430,  -430,  -430,  -430,  -430,    23,   457,    39,    42,
    -430,   467,   139,   139,  -430,   539,   511,   359,   511,  -430,
    -430,  -430,   511,  -430,  -430,   511,  -430,   511,    94,  -430,
       8,  -430,   346,  -430,   470,   475,   476,  -430,   153,  -430,
     477,  -430,  -430,  -430,  -430,  -430,   196,  -430,  -430,   288,
      -3,  -430
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -430,  -430,  -430,   473,    16,   -61,  -430,  -430,  -430,   258,
    -430,  -430,   -10,  -430,   426,  -430,  -430,  -430,   136,  -430,
    -430,  -430,    26,   140,  -430,  -430,  -430,  -430,  -430,  -430,
    -430,  -430,  -430,  -430,  -430,  -430,  -430,  -430,  -430,  -430,
     318,  -430,  -430,  -430,  -430,  -430,   370,  -430,   366,  -430,
    -430,  -430,  -430,  -430,  -430,  -340,  -430,  -430,  -430,  -430,
    -430,  -430,  -430,  -430,  -430,  -430,  -430,  -430,  -430,  -430,
    -430,   297,   302,  -430,   -66,  -430,  -430,  -429,  -430,  -430,
    -430,  -430,  -430,  -223,  -430,  -430,  -430,  -430,  -430,  -430,
    -430,  -430,  -430,  -430,    52,  -219,  -430,    -5,  -337,  -409,
    -430,   137,   189,  -430,  -430,  -430,   248,   251,  -136,   274,
    -430,   340,  -430,   220,  -228,   -83,   -41,  -174,  -430,  -430,
    -430,   358,  -430,   -72,  -430,  -127
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -270
static const yytype_int16 yytable[] =
{
      84,   101,   162,   235,   151,   198,   392,   199,   105,   278,
     395,   231,   481,   445,  -162,   366,   367,   368,   369,   211,
    -162,    22,  -162,  -162,  -162,   215,   449,   531,     4,     5,
     291,   103,   453,  -162,   141,  -162,  -162,   450,     4,     5,
    -162,  -162,  -162,   534,   454,  -162,   536,    60,   437,   155,
     157,   390,   390,   152,   462,   134,   171,    65,   162,   -42,
     172,   153,   200,   139,   335,    84,   337,   338,   167,    96,
     -23,   -21,   352,   106,  -162,  -162,  -162,  -162,    60,   466,
     466,   353,   522,    23,   523,  -162,    97,   446,    65,  -162,
     469,  -162,    24,   -83,    25,   532,   276,   361,   370,    84,
     438,   373,   451,   -84,   376,   284,   391,   444,   484,   463,
     455,   535,    56,   292,   537,  -162,  -162,  -162,  -162,  -162,
    -162,    32,   162,  -162,   547,   499,  -162,  -162,  -162,   505,
     561,   216,   471,    98,   467,   551,  -162,   184,   185,   217,
     218,   216,   470,   364,   433,   219,    30,   435,    26,   217,
     218,    84,   173,   174,   175,   176,   500,   548,    33,    35,
     501,   219,   346,    73,    74,    75,    76,   255,    77,    36,
     549,   354,    79,    80,   355,   356,    82,   207,   208,   350,
     362,    37,    38,    42,   472,    43,   357,   358,   359,    44,
      39,   315,    45,    46,   321,   486,  -269,   280,   282,   283,
     382,   487,   488,   346,     2,     3,   477,    54,   478,   177,
      69,   168,    70,   178,   169,    71,    90,   560,   -23,    93,
     162,    56,   102,     6,   179,   104,    73,    74,    75,    76,
      55,    77,    95,   131,   343,   133,     2,     3,   320,    82,
     331,   322,   323,   324,   325,   326,   327,   473,    49,    50,
      51,    52,   132,   457,   346,     6,   328,   135,    73,    74,
      75,    76,    55,    77,   480,   137,   237,   138,   238,   239,
     240,    82,   142,   143,   144,   363,   149,   365,   145,   241,
     146,   242,   243,   147,   279,   148,   244,   245,   246,   374,
     182,   247,   377,   378,   158,     9,   508,   187,   510,   183,
      56,   189,   -46,   188,   190,   193,   396,   396,   194,    57,
     195,   205,   403,   209,   196,   482,   483,    58,    59,   405,
     248,   249,   250,   251,   292,   213,   197,     9,   201,   225,
     227,   252,    56,   559,   -47,   253,   202,   254,   203,   204,
     228,    57,    78,    79,    80,    81,   229,   236,   281,    58,
      59,   277,   519,   285,   286,   294,   288,   295,   296,   524,
     299,    73,    74,    75,    76,   255,    77,   300,   334,   256,
     336,   315,   257,   258,    82,    73,    74,    75,    76,   339,
      77,   348,   259,    78,    79,    80,    81,   372,    82,   474,
       1,   375,     2,     3,     4,     5,   479,   379,   383,   384,
     389,  -267,  -268,   431,   396,   485,   432,   434,   436,   491,
     439,     6,   557,   493,     7,   442,   441,   443,     8,   468,
     497,   396,   460,   521,   503,   396,   461,   506,   507,   475,
     509,   465,   476,   490,   512,   492,   494,   495,   511,    73,
      74,    75,    76,   513,    77,   516,   517,    78,    79,    80,
      81,   406,    82,   514,   515,   525,   526,   407,   408,   527,
     528,   533,   529,   409,   410,   411,   412,   413,   414,   415,
     530,   539,   542,   552,   553,   416,   417,   418,   419,   554,
     555,   558,    72,     9,   396,   541,    34,   543,    94,    10,
     260,   544,   404,   401,   545,   150,   546,    11,   302,   303,
     304,   305,   306,   307,   308,   309,   159,   310,   311,   312,
     313,   314,   496,    73,    74,    75,    76,   214,    77,   230,
     540,    78,    79,    80,    81,   232,    82,   459,   385,   420,
     332,   421,   297,   333,   212,   351,   422,   423,   424,   425,
     426,   427,   428,   429,    73,    74,    75,    76,   152,    77,
     210,     0,    78,    79,    80,    81,   153,    82,     0,     0,
       0,     0,     0,   160,     0,    73,    74,    75,    76,   400,
      77,     0,     0,    78,    79,    80,    81,     0,    82,     0,
       0,     0,     0,   315,    26,   316,   317,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,     0,   118,
     119,   120,    73,    74,    75,    76,   152,    77,     0,     0,
      78,    79,    80,    81,   153,    82,    73,    74,    75,    76,
       0,    77,     0,     0,    78,    79,    80,    81,     0,    82,
      73,    74,    75,    76,     0,    77,     0,     0,   393,    79,
      80,    81,     0,    82,    73,    74,    75,    76,     0,    77,
       0,     0,   397,    79,    80,    81,     0,    82,    73,    74,
      75,    76,     0,    77,     0,     0,   498,    79,    80,    81,
       0,    82,    73,    74,    75,    76,     0,    77,     0,     0,
     504,    79,    80,    81,     0,    82,    73,    74,    75,    76,
     255,    77,     0,     0,   256,     0,     0,   257,     0,    82,
      73,    74,    75,    76,    43,    77,     0,     0,   349,     0,
       0,     0,    46,    82,    73,    74,    75,    76,     0,    77,
       0,     0,   458,    73,    74,    75,    76,    82,    77,     0,
       0,   518,     0,     0,     0,     0,    82
};

static const yytype_int16 yycheck[] =
{
      41,    67,   138,   226,   131,   179,   346,    72,    72,   237,
     347,     1,   441,    11,     4,    18,    19,    20,    21,   193,
      10,   113,    12,    13,    14,     5,     4,     4,     8,     9,
     249,    72,     4,    23,   106,    25,    26,    15,     8,     9,
      30,    31,    32,     4,    16,    35,     4,    31,    72,   132,
     133,    72,    72,   109,    72,    96,   109,    31,   194,     4,
     113,   117,   127,   104,   287,   106,   289,   290,   140,    14,
     113,   114,    14,   137,    64,    65,    66,    67,    62,    72,
      72,    23,   491,   113,   493,    75,    31,    85,    62,    79,
      72,    81,   114,    73,   113,    72,   232,   316,   101,   140,
     124,   329,    80,    73,   332,   241,   127,   127,   445,   127,
      82,    72,   102,   249,    72,   105,   106,   107,   108,   109,
     110,     4,   258,   113,    30,   462,   116,   117,   118,   466,
     559,   111,    72,    78,   127,   127,   126,   147,   148,   119,
     120,   111,   124,   317,   372,   206,   113,   375,   124,   119,
     120,   192,    52,    53,    54,    55,    17,    63,     0,     4,
      21,   222,   298,   105,   106,   107,   108,   109,   110,   123,
      76,   113,   114,   115,   116,   117,   118,   187,   188,   315,
     316,    72,     4,     4,   124,   109,   128,   129,   130,   113,
     125,   121,   116,   117,    10,    77,   126,   238,   239,   240,
     336,    83,    84,   339,     6,     7,   434,     4,   436,   109,
     113,   113,   113,   113,   116,   125,   109,   557,   113,     4,
     356,   102,     4,    25,   124,    74,   105,   106,   107,   108,
      32,   110,   104,   123,   113,   113,     6,     7,   279,   118,
     281,    57,    58,    59,    60,    61,    62,   421,    52,    53,
      54,    55,   114,   389,   390,    25,    72,   113,   105,   106,
     107,   108,    32,   110,   438,     4,    10,   117,    12,    13,
      14,   118,   126,   126,   126,   316,     4,   318,   126,    23,
     126,    25,    26,   126,    14,   126,    30,    31,    32,   330,
     113,    35,   333,   334,    72,    97,   470,   123,   472,   113,
     102,   110,   104,   123,   102,   124,   347,   348,    72,   111,
     127,     4,   353,   125,   127,   442,   443,   119,   120,   360,
      64,    65,    66,    67,   460,   125,   127,    97,   127,   125,
       4,    75,   102,   556,   104,    79,   127,    81,   127,   127,
       4,   111,   113,   114,   115,   116,    73,     4,    14,   119,
     120,   109,   488,   109,   109,     4,   113,     4,     4,   495,
     126,   105,   106,   107,   108,   109,   110,     4,    72,   113,
      72,   121,   116,   117,   118,   105,   106,   107,   108,   126,
     110,   126,   126,   113,   114,   115,   116,    10,   118,   430,
       4,    10,     6,     7,     8,     9,   437,   109,   109,   109,
      22,   126,   126,   125,   445,   446,   126,    10,    10,   450,
     101,    25,   548,   454,    28,   123,    72,   123,    32,    72,
     461,   462,   123,   489,   465,   466,    22,   468,   469,   123,
     471,    22,   113,     4,   475,     4,     4,    22,   125,   105,
     106,   107,   108,   127,   110,   486,   487,   113,   114,   115,
     116,    44,   118,   125,     4,   126,    22,    50,    51,   126,
      22,     4,   125,    56,    57,    58,    59,    60,    61,    62,
     125,     4,   113,   127,     4,    68,    69,    70,    71,     4,
       4,     4,    74,    97,   525,   526,    13,   528,    62,   103,
     232,   532,   356,   353,   535,   129,   537,   111,    36,    37,
      38,    39,    40,    41,    42,    43,   136,    45,    46,    47,
      48,    49,   460,   105,   106,   107,   108,   199,   110,   222,
     525,   113,   114,   115,   116,   223,   118,   390,   339,   122,
     282,   124,   258,   282,   194,   315,   129,   130,   131,   132,
     133,   134,   135,   136,   105,   106,   107,   108,   109,   110,
     192,    -1,   113,   114,   115,   116,   117,   118,    -1,    -1,
      -1,    -1,    -1,   124,    -1,   105,   106,   107,   108,   109,
     110,    -1,    -1,   113,   114,   115,   116,    -1,   118,    -1,
      -1,    -1,    -1,   121,   124,   123,   124,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    96,    -1,    98,
      99,   100,   105,   106,   107,   108,   109,   110,    -1,    -1,
     113,   114,   115,   116,   117,   118,   105,   106,   107,   108,
      -1,   110,    -1,    -1,   113,   114,   115,   116,    -1,   118,
     105,   106,   107,   108,    -1,   110,    -1,    -1,   113,   114,
     115,   116,    -1,   118,   105,   106,   107,   108,    -1,   110,
      -1,    -1,   113,   114,   115,   116,    -1,   118,   105,   106,
     107,   108,    -1,   110,    -1,    -1,   113,   114,   115,   116,
      -1,   118,   105,   106,   107,   108,    -1,   110,    -1,    -1,
     113,   114,   115,   116,    -1,   118,   105,   106,   107,   108,
     109,   110,    -1,    -1,   113,    -1,    -1,   116,    -1,   118,
     105,   106,   107,   108,   109,   110,    -1,    -1,   113,    -1,
      -1,    -1,   117,   118,   105,   106,   107,   108,    -1,   110,
      -1,    -1,   113,   105,   106,   107,   108,   118,   110,    -1,
      -1,   113,    -1,    -1,    -1,    -1,   118
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     4,     6,     7,     8,     9,    25,    28,    32,    97,
     103,   111,   139,   140,   141,   142,   143,   144,   145,   157,
     160,   162,   113,   113,   114,   113,   124,   161,   163,   146,
     113,   158,     4,     0,   141,     4,   123,    72,     4,   125,
     255,   256,     4,   109,   113,   116,   117,   250,   251,    52,
      53,    54,    55,   221,     4,    32,   102,   111,   119,   120,
     142,   147,   151,   152,   159,   160,   210,   211,   212,   113,
     113,   125,    74,   105,   106,   107,   108,   110,   113,   114,
     115,   116,   118,   246,   254,   259,   261,   262,   263,   164,
     109,   148,   149,     4,   152,   104,    14,    31,    78,   153,
     154,   212,     4,   254,    74,    72,   137,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    96,    98,    99,
     100,   170,   171,   172,   173,   174,   175,   176,   184,   185,
     186,   123,   114,   113,   254,   113,   155,     4,   117,   254,
     260,   261,   126,   126,   126,   126,   126,   126,   126,     4,
     186,   263,   109,   117,   252,   253,   254,   253,    72,   184,
     124,   156,   246,   247,   248,   249,   253,   261,   113,   116,
     150,   109,   113,    52,    53,    54,    55,   109,   113,   124,
     177,   178,   113,   113,   150,   150,   165,   123,   123,   110,
     102,   257,   258,   124,    72,   127,   127,   127,   255,    72,
     127,   127,   127,   127,   127,     4,   166,   150,   150,   125,
     259,   255,   249,   125,   178,     5,   111,   119,   120,   143,
     167,   179,   207,   208,   209,   125,   168,     4,     4,    73,
     209,     1,   210,   213,   169,   221,     4,    10,    12,    13,
      14,    23,    25,    26,    30,    31,    32,    35,    64,    65,
      66,    67,    75,    79,    81,   109,   113,   116,   117,   126,
     147,   180,   195,   197,   203,   205,   217,   223,   227,   229,
     231,   232,   233,   241,   242,   243,   246,   109,   252,    14,
     254,    14,   254,   254,   246,   109,   109,   218,   113,   219,
     220,   233,   246,   228,     4,     4,     4,   247,   224,   126,
       4,   234,    36,    37,    38,    39,    40,    41,    42,    43,
      45,    46,    47,    48,    49,   121,   123,   124,   230,   193,
     254,    10,    57,    58,    59,    60,    61,    62,    72,   244,
     245,   254,   244,   245,    72,   221,    72,   221,   221,   126,
     181,   196,   198,   113,   239,   240,   246,   204,   126,   113,
     246,   251,    14,    23,   113,   116,   117,   128,   129,   130,
     225,   233,   246,   254,   255,   254,    18,    19,    20,    21,
     101,   194,    10,   252,   254,    10,   252,   254,   254,   109,
     214,   215,   246,   109,   109,   240,   188,   199,   200,    22,
      72,   127,   193,   113,   206,   236,   254,   113,   235,   236,
     109,   161,   222,   254,   156,   254,    44,    50,    51,    56,
      57,    58,    59,    60,    61,    62,    68,    69,    70,    71,
     122,   124,   129,   130,   131,   132,   133,   134,   135,   136,
     226,   125,   126,   252,    10,   252,    10,    72,   124,   101,
     216,    72,   123,   123,   127,    11,    85,   183,   189,     4,
      15,    80,   201,     4,    16,    82,   202,   246,   113,   239,
     123,    22,    72,   127,   237,    22,    72,   127,    72,    72,
     124,    72,   124,   255,   254,   123,   113,   252,   252,   254,
     255,   215,   263,   263,   236,   254,    77,    83,    84,   187,
       4,   254,     4,   254,     4,    22,   232,   254,   113,   236,
      17,    21,   238,   254,   113,   236,   254,   254,   255,   254,
     255,   125,   254,   127,   125,     4,   254,   254,   113,   246,
     182,   212,   237,   237,   246,   126,    22,   126,    22,   125,
     125,     4,    72,     4,     4,    72,     4,    72,   190,     4,
     235,   254,   113,   254,   254,   254,   254,    30,    63,    76,
     191,   127,   127,     4,     4,     4,   192,   246,     4,   221,
     193,   215
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
    { push_namespace(interp, (yyvsp[(2) - (2)].s)); mem_sys_free((yyvsp[(2) - (2)].s)); ;}
    break;

  case 177:
#line 1530 "compilers/imcc/imcc.y"
    { pop_namespace(interp, (yyvsp[(2) - (2)].s)); mem_sys_free((yyvsp[(2) - (2)].s)); ;}
    break;

  case 178:
#line 1531 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 179:
#line 1532 "compilers/imcc/imcc.y"
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

  case 180:
#line 1548 "compilers/imcc/imcc.y"
    {
           set_lexical(interp, (yyvsp[(4) - (4)].sr), (yyvsp[(2) - (4)].s)); (yyval.i) = 0;
         ;}
    break;

  case 181:
#line 1551 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 182:
#line 1552 "compilers/imcc/imcc.y"
    {
           mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 0);
           is_def=0;
           mem_sys_free((yyvsp[(4) - (6)].s));
         ;}
    break;

  case 184:
#line 1559 "compilers/imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 185:
#line 1560 "compilers/imcc/imcc.y"
    {
           mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1);
           is_def=0;
           mem_sys_free((yyvsp[(4) - (6)].s));
         ;}
    break;

  case 186:
#line 1566 "compilers/imcc/imcc.y"
    {
           (yyval.i) = NULL;
           IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isTAIL_CALL;
           IMCC_INFO(interp)->cur_call = NULL;
         ;}
    break;

  case 187:
#line 1571 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "branch", 1, (yyvsp[(2) - (2)].sr)); ;}
    break;

  case 188:
#line 1573 "compilers/imcc/imcc.y"
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

  case 189:
#line 1584 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(2) - (2)].sr)); ;}
    break;

  case 190:
#line 1585 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; ;}
    break;

  case 191:
#line 1586 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 194:
#line 1589 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;;}
    break;

  case 195:
#line 1593 "compilers/imcc/imcc.y"
    { (yyval.t) = 'I'; ;}
    break;

  case 196:
#line 1594 "compilers/imcc/imcc.y"
    { (yyval.t) = 'N'; ;}
    break;

  case 197:
#line 1595 "compilers/imcc/imcc.y"
    { (yyval.t) = 'S'; ;}
    break;

  case 198:
#line 1596 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; ;}
    break;

  case 199:
#line 1601 "compilers/imcc/imcc.y"
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

  case 200:
#line 1614 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr));  ;}
    break;

  case 201:
#line 1616 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (4)].s), 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));  ;}
    break;

  case 202:
#line 1618 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(4) - (5)].s), 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  ;}
    break;

  case 203:
#line 1620 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(5) - (6)].sr)); ;}
    break;

  case 204:
#line 1622 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 205:
#line 1624 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].s), (yyvsp[(6) - (6)].sr), 1); ;}
    break;

  case 206:
#line 1626 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].s), (yyvsp[(6) - (7)].sr), 1); ;}
    break;

  case 207:
#line 1628 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].s), NULL, 1); ;}
    break;

  case 208:
#line 1630 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 209:
#line 1632 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 210:
#line 1634 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 211:
#line 1636 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 212:
#line 1638 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); ;}
    break;

  case 213:
#line 1642 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); ;}
    break;

  case 214:
#line 1644 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); ;}
    break;

  case 215:
#line 1646 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); ;}
    break;

  case 216:
#line 1649 "compilers/imcc/imcc.y"
    {
           add_pcc_result((yyvsp[(3) - (3)].i)->symregs[0], (yyvsp[(1) - (3)].sr));
           IMCC_INFO(interp)->cur_call = NULL;
           (yyval.i) = 0;
         ;}
    break;

  case 217:
#line 1655 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
         ;}
    break;

  case 218:
#line 1659 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[(6) - (9)].sr));
           IMCC_INFO(interp)->cur_call = NULL;
         ;}
    break;

  case 222:
#line 1667 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(1) - (3)].sr));
         ;}
    break;

  case 223:
#line 1674 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"not"; ;}
    break;

  case 224:
#line 1675 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"bnot"; ;}
    break;

  case 225:
#line 1676 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"neg"; ;}
    break;

  case 226:
#line 1680 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"sub"; ;}
    break;

  case 227:
#line 1681 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"add"; ;}
    break;

  case 228:
#line 1682 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"mul"; ;}
    break;

  case 229:
#line 1683 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"div"; ;}
    break;

  case 230:
#line 1684 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"mod"; ;}
    break;

  case 231:
#line 1685 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"fdiv"; ;}
    break;

  case 232:
#line 1686 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"pow"; ;}
    break;

  case 233:
#line 1687 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"concat"; ;}
    break;

  case 234:
#line 1688 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"iseq"; ;}
    break;

  case 235:
#line 1689 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"isne"; ;}
    break;

  case 236:
#line 1690 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"isgt"; ;}
    break;

  case 237:
#line 1691 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"isge"; ;}
    break;

  case 238:
#line 1692 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"islt"; ;}
    break;

  case 239:
#line 1693 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"isle"; ;}
    break;

  case 240:
#line 1694 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"shl"; ;}
    break;

  case 241:
#line 1695 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"shr"; ;}
    break;

  case 242:
#line 1696 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"lsr"; ;}
    break;

  case 243:
#line 1697 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"and"; ;}
    break;

  case 244:
#line 1698 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"or"; ;}
    break;

  case 245:
#line 1699 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"xor"; ;}
    break;

  case 246:
#line 1700 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"band"; ;}
    break;

  case 247:
#line 1701 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"bor"; ;}
    break;

  case 248:
#line 1702 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"bxor"; ;}
    break;

  case 249:
#line 1708 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           (yyval.i)->type &= ~ITCALL;
           (yyval.i)->type |= ITRESULT;
         ;}
    break;

  case 250:
#line 1713 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 251:
#line 1720 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(2) - (3)].s), 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr));
         ;}
    break;

  case 252:
#line 1726 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"add"; ;}
    break;

  case 253:
#line 1727 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"sub"; ;}
    break;

  case 254:
#line 1728 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"mul"; ;}
    break;

  case 255:
#line 1729 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"div"; ;}
    break;

  case 256:
#line 1730 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"mod"; ;}
    break;

  case 257:
#line 1731 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"fdiv"; ;}
    break;

  case 258:
#line 1732 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"concat"; ;}
    break;

  case 259:
#line 1733 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"band"; ;}
    break;

  case 260:
#line 1734 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"bor"; ;}
    break;

  case 261:
#line 1735 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"bxor"; ;}
    break;

  case 262:
#line 1736 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"shr"; ;}
    break;

  case 263:
#line 1737 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"shl"; ;}
    break;

  case 264:
#line 1738 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"lsr"; ;}
    break;

  case 265:
#line 1744 "compilers/imcc/imcc.y"
    {
        (yyval.i) = func_ins(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(3) - (4)].s),
                      IMCC_INFO(interp) -> regs,
                      IMCC_INFO(interp) -> nargs,
                      IMCC_INFO(interp) -> keyvec, 1);
         mem_sys_free((yyvsp[(3) - (4)].s));
       ;}
    break;

  case 266:
#line 1754 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s));  mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 267:
#line 1755 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 268:
#line 1756 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 269:
#line 1758 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = (yyvsp[(1) - (1)].sr);
           if ((yyvsp[(1) - (1)].sr)->set != 'P')
               IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR, "Sub isn't a PMC");
         ;}
    break;

  case 270:
#line 1764 "compilers/imcc/imcc.y"
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

  case 271:
#line 1776 "compilers/imcc/imcc.y"
    {
            IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr);
            (yyval.sr)                         = mk_const(interp, (yyvsp[(3) - (3)].s), 'S');
            mem_sys_free((yyvsp[(3) - (3)].s));
         ;}
    break;

  case 272:
#line 1781 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); ;}
    break;

  case 273:
#line 1787 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[(1) - (1)].sr));
         ;}
    break;

  case 274:
#line 1791 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(2) - (5)].i); ;}
    break;

  case 275:
#line 1795 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 276:
#line 1797 "compilers/imcc/imcc.y"
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

  case 277:
#line 1807 "compilers/imcc/imcc.y"
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

  case 278:
#line 1817 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = 0;
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (5)].s), (yyvsp[(5) - (5)].sr));
           mem_sys_free((yyvsp[(3) - (5)].s));
         ;}
    break;

  case 279:
#line 1823 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = 0;
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (3)].s), (yyvsp[(3) - (3)].sr));
           mem_sys_free((yyvsp[(1) - (3)].s));
         ;}
    break;

  case 280:
#line 1831 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); ;}
    break;

  case 281:
#line 1835 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 282:
#line 1836 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); ;}
    break;

  case 283:
#line 1840 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT; ;}
    break;

  case 284:
#line 1841 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_NAMED; ;}
    break;

  case 285:
#line 1844 "compilers/imcc/imcc.y"
    { adv_named_set(interp, (yyvsp[(3) - (4)].s)); (yyval.t) = 0; ;}
    break;

  case 286:
#line 1848 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); ;}
    break;

  case 287:
#line 1853 "compilers/imcc/imcc.y"
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

  case 288:
#line 1863 "compilers/imcc/imcc.y"
    {
           add_pcc_named_result(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (5)].s), (yyvsp[(5) - (5)].sr));
           mem_sys_free((yyvsp[(3) - (5)].s));
         ;}
    break;

  case 289:
#line 1868 "compilers/imcc/imcc.y"
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

  case 290:
#line 1878 "compilers/imcc/imcc.y"
    {
           add_pcc_named_result(interp, IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (3)].s), (yyvsp[(3) - (3)].sr));
           mem_sys_free((yyvsp[(1) - (3)].s));
         ;}
    break;

  case 291:
#line 1882 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 292:
#line 1886 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 293:
#line 1887 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); ;}
    break;

  case 294:
#line 1892 "compilers/imcc/imcc.y"
    {
           (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, inv_op((yyvsp[(3) - (6)].s)), 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr));
         ;}
    break;

  case 295:
#line 1896 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));
         ;}
    break;

  case 296:
#line 1900 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr));
         ;}
    break;

  case 297:
#line 1907 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr));
         ;}
    break;

  case 298:
#line 1911 "compilers/imcc/imcc.y"
    {
           (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr));
         ;}
    break;

  case 299:
#line 1915 "compilers/imcc/imcc.y"
    {
           (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));
         ;}
    break;

  case 300:
#line 1921 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 301:
#line 1922 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 302:
#line 1926 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"eq"; ;}
    break;

  case 303:
#line 1927 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"ne"; ;}
    break;

  case 304:
#line 1928 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"gt"; ;}
    break;

  case 305:
#line 1929 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"ge"; ;}
    break;

  case 306:
#line 1930 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"lt"; ;}
    break;

  case 307:
#line 1931 "compilers/imcc/imcc.y"
    { (yyval.s) = (char *)"le"; ;}
    break;

  case 310:
#line 1940 "compilers/imcc/imcc.y"
    { (yyval.sr) = NULL; ;}
    break;

  case 311:
#line 1941 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (1)].sr); ;}
    break;

  case 312:
#line 1945 "compilers/imcc/imcc.y"
    { (yyval.sr) = IMCC_INFO(interp)->regs[0]; ;}
    break;

  case 314:
#line 1950 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(1) - (1)].sr); ;}
    break;

  case 315:
#line 1952 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(1) - (4)].sr);
           IMCC_INFO(interp) -> keyvec |= KEY_BIT(IMCC_INFO(interp)->nargs);
           IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(3) - (4)].sr);
           (yyval.sr) = (yyvsp[(1) - (4)].sr);
         ;}
    break;

  case 316:
#line 1959 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(2) - (3)].sr);
           (yyval.sr) = (yyvsp[(2) - (3)].sr);
         ;}
    break;

  case 318:
#line 1966 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 319:
#line 1967 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s));  mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 320:
#line 1971 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 321:
#line 1972 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 322:
#line 1976 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 323:
#line 1977 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 328:
#line 1991 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->nkeys    = 0;
           IMCC_INFO(interp)->in_slice = 0;
         ;}
    break;

  case 329:
#line 1996 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = link_keys(interp,
                          IMCC_INFO(interp)->nkeys,
                          IMCC_INFO(interp)->keys, 0);
         ;}
    break;

  case 330:
#line 2004 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->nkeys = 0;
           IMCC_INFO(interp)->in_slice = 0;
         ;}
    break;

  case 331:
#line 2009 "compilers/imcc/imcc.y"
    {
           (yyval.sr) = link_keys(interp,
                          IMCC_INFO(interp)->nkeys,
                          IMCC_INFO(interp)->keys, 1);
         ;}
    break;

  case 332:
#line 2017 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(1) - (1)].sr); ;}
    break;

  case 333:
#line 2019 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(3) - (3)].sr);
           (yyval.sr) = IMCC_INFO(interp)->keys[0];
         ;}
    break;

  case 334:
#line 2023 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->in_slice = 1; ;}
    break;

  case 335:
#line 2025 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(4) - (4)].sr);
           (yyval.sr) = IMCC_INFO(interp)->keys[0];
         ;}
    break;

  case 336:
#line 2033 "compilers/imcc/imcc.y"
    {
           if (IMCC_INFO(interp)->in_slice)
               (yyvsp[(1) - (1)].sr)->type |= VT_START_SLICE | VT_END_SLICE;
           (yyval.sr) = (yyvsp[(1) - (1)].sr);
         ;}
    break;

  case 337:
#line 2039 "compilers/imcc/imcc.y"
    {
           (yyvsp[(1) - (3)].sr)->type |= VT_START_SLICE;
           (yyvsp[(3) - (3)].sr)->type |= VT_END_SLICE;
           IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(1) - (3)].sr);
           (yyval.sr) = (yyvsp[(3) - (3)].sr);
         ;}
    break;

  case 338:
#line 2045 "compilers/imcc/imcc.y"
    { (yyvsp[(2) - (2)].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[(2) - (2)].sr); ;}
    break;

  case 339:
#line 2046 "compilers/imcc/imcc.y"
    { (yyvsp[(1) - (2)].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[(1) - (2)].sr); ;}
    break;

  case 340:
#line 2050 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'I'); ;}
    break;

  case 341:
#line 2051 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'N'); ;}
    break;

  case 342:
#line 2052 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); ;}
    break;

  case 343:
#line 2053 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'P'); ;}
    break;

  case 344:
#line 2054 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_pasm_reg(interp, (yyvsp[(1) - (1)].s)); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 345:
#line 2058 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'I'); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 346:
#line 2059 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'N'); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 347:
#line 2060 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S'); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;

  case 348:
#line 2061 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'U'); mem_sys_free((yyvsp[(1) - (1)].s)); ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4888 "compilers/imcc/imcparser.c"
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


#line 2071 "compilers/imcc/imcc.y"


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

