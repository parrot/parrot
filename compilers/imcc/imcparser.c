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
 *        IMCC_INFO(interp)->cur_unit, but there are some
 *        exceptions. Thus, we can't easily factorize that piece of
 *        code.
 */
static Instruction *
MK_I(Interp *interp, IMC_Unit * unit, const char * fmt, int n, ...)
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
    return INS(interp, unit, opname, fmt, r, n,
               IMCC_INFO(interp)->keyvec, 1);
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
IMCC_create_itcall_label(Interp *interp)
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

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 385 "compilers/imcc/imcc.y"
{
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
}
/* Line 193 of yacc.c.  */
#line 726 "compilers/imcc/imcparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 739 "compilers/imcc/imcparser.c"

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
#define YYFINAL  44
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   835

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  136
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  120
/* YYNRULES -- Number of rules.  */
#define YYNRULES  344
/* YYNRULES -- Number of states.  */
#define YYNSTATES  597

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   374

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
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
static const yytype_uint16 yyprhs[] =
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
     283,   285,   287,   289,   291,   293,   295,   297,   303,   307,
     311,   315,   319,   325,   331,   332,   336,   339,   340,   344,
     348,   349,   354,   355,   358,   360,   362,   364,   366,   371,
     373,   375,   377,   379,   381,   382,   388,   390,   391,   394,
     398,   402,   403,   409,   410,   416,   417,   419,   423,   427,
     433,   435,   438,   439,   442,   445,   447,   449,   450,   452,
     455,   457,   459,   463,   466,   468,   472,   475,   477,   479,
     481,   484,   487,   488,   493,   498,   499,   506,   508,   509,
     516,   519,   522,   525,   528,   530,   532,   534,   535,   537,
     539,   541,   543,   545,   547,   549,   553,   558,   563,   568,
     574,   580,   586,   592,   598,   604,   610,   616,   622,   628,
     634,   640,   646,   652,   658,   664,   670,   676,   682,   688,
     694,   700,   706,   713,   720,   727,   735,   740,   745,   752,
     759,   767,   772,   777,   782,   787,   794,   802,   806,   807,
     817,   819,   821,   823,   827,   828,   834,   838,   842,   846,
     850,   854,   858,   862,   866,   870,   874,   878,   882,   886,
     891,   893,   895,   897,   899,   903,   907,   911,   913,   915,
     916,   922,   923,   927,   929,   935,   939,   942,   943,   946,
     948,   950,   955,   958,   962,   968,   970,   974,   975,   982,
     989,   995,  1001,  1006,  1011,  1016,  1021,  1023,  1025,  1027,
    1029,  1031,  1033,  1035,  1037,  1038,  1040,  1044,  1046,  1048,
    1053,  1057,  1059,  1061,  1063,  1065,  1067,  1069,  1071,  1073,
    1075,  1077,  1079,  1080,  1083,  1084,  1087,  1089,  1093,  1094,
    1099,  1101,  1105,  1108,  1111,  1113,  1115,  1117,  1119,  1121,
    1123,  1125,  1127,  1129,  1131
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     137,     0,    -1,   138,    -1,   139,    -1,   138,   139,    -1,
     158,    -1,   144,    -1,   143,    -1,   160,    -1,   175,    -1,
     155,    -1,   108,     4,    -1,   140,    -1,     4,    -1,     6,
     141,     4,    -1,   142,     4,    -1,    97,   110,     4,    -1,
       7,   111,    -1,     8,   110,    72,   110,    -1,     9,   111,
      72,   111,    -1,    61,   217,   106,    -1,    61,   217,   106,
     121,   254,    -1,    -1,    29,   145,   217,   106,   121,   254,
      -1,    -1,    29,   147,   111,   244,   121,   148,    -1,   110,
      -1,   113,    -1,   150,    -1,   149,   150,    -1,   207,   151,
       4,    -1,   108,     4,    -1,   117,    -1,   116,    -1,   158,
      -1,   146,    -1,   140,    -1,    -1,   152,   114,   154,    -1,
      -1,    78,   153,   183,    99,    -1,    14,   245,    -1,    28,
     110,    72,   107,    -1,    -1,   238,    -1,    -1,   100,   156,
     157,   101,    -1,    -1,   149,    -1,    22,   159,     4,    -1,
     122,   246,   123,    -1,    -1,    -1,    -1,    -1,    25,   161,
     241,   162,   183,     4,   163,   164,   174,    73,    -1,    -1,
       4,    -1,   164,   165,     4,    -1,    -1,     5,   166,   167,
      -1,   217,   106,   192,    -1,   217,   110,    20,   106,   192,
      -1,    -1,    72,    -1,    95,   124,   172,   125,    -1,    93,
     124,   110,   125,    -1,    93,   124,   106,   125,    -1,    96,
      -1,    96,   124,   110,   125,    -1,    -1,   172,    72,   173,
      -1,   173,    -1,    49,    -1,    50,    -1,    52,    -1,    51,
      -1,   106,    -1,   110,    -1,   122,   246,   123,    -1,    -1,
     204,    -1,    -1,    -1,    -1,    78,   176,   106,   177,   183,
       4,   178,   164,   174,    73,    -1,    -1,    75,     4,   180,
     187,   182,   186,   181,   189,    76,    -1,    -1,   209,     4,
      -1,    -1,    85,   245,     4,    -1,    -1,   184,    -1,   185,
      -1,   184,   168,   185,    -1,    87,    -1,    88,    -1,    86,
      -1,    89,    -1,    90,    -1,    92,    -1,    91,    -1,    94,
      -1,   169,    -1,   170,    -1,   171,    -1,    77,   245,    72,
     245,     4,    -1,    77,   245,     4,    -1,    83,   245,     4,
      -1,    84,   237,     4,    -1,    84,   110,     4,    -1,    84,
     237,    72,   245,     4,    -1,    84,   110,    72,   245,     4,
      -1,    -1,   187,   188,     4,    -1,    11,   230,    -1,    -1,
     189,   190,     4,    -1,    64,   237,   192,    -1,    -1,    27,
     191,   217,   212,    -1,    -1,   192,   193,    -1,    16,    -1,
      17,    -1,    18,    -1,    19,    -1,    19,   124,   110,   125,
      -1,    98,    -1,    79,    -1,    81,    -1,    80,    -1,    82,
      -1,    -1,   194,     4,   197,   198,   195,    -1,   200,    -1,
      -1,   198,     4,    -1,   198,   199,     4,    -1,    65,   245,
     231,    -1,    -1,    65,   124,   201,   203,   125,    -1,    -1,
      66,   124,   202,   203,   125,    -1,    -1,   230,    -1,   110,
      20,   245,    -1,   203,    72,   230,    -1,   203,    72,   110,
      20,   245,    -1,   206,    -1,   204,   206,    -1,    -1,   205,
     210,    -1,   108,     4,    -1,   117,    -1,   116,    -1,    -1,
     208,    -1,   208,   209,    -1,   209,    -1,    99,    -1,   207,
     213,     4,    -1,     1,     4,    -1,   212,    -1,   211,    72,
     212,    -1,   106,    98,    -1,   106,    -1,   219,    -1,   235,
      -1,    22,   106,    -1,    23,   106,    -1,    -1,    27,   214,
     217,   211,    -1,    28,   110,    72,   237,    -1,    -1,    29,
     215,   217,   106,   121,   254,    -1,   146,    -1,    -1,    32,
     216,   217,   106,   121,   254,    -1,    65,   227,    -1,    10,
     243,    -1,   114,   238,    -1,    14,   245,    -1,   227,    -1,
     179,    -1,   196,    -1,    -1,    49,    -1,    50,    -1,    51,
      -1,    52,    -1,    53,    -1,   218,    -1,   106,    -1,   237,
     121,   245,    -1,   237,   121,   126,   245,    -1,   237,   121,
     127,   245,    -1,   237,   121,   128,   245,    -1,   237,   121,
     245,   129,   245,    -1,   237,   121,   245,   127,   245,    -1,
     237,   121,   245,   130,   245,    -1,   237,   121,   245,    68,
     245,    -1,   237,   121,   245,   131,   245,    -1,   237,   121,
     245,    41,   245,    -1,   237,   121,   245,   132,   245,    -1,
     237,   121,   245,   119,   245,    -1,   237,   121,   245,    55,
     245,    -1,   237,   121,   245,    56,   245,    -1,   237,   121,
     245,    57,   245,    -1,   237,   121,   245,    59,   245,    -1,
     237,   121,   245,    60,   245,    -1,   237,   121,   245,    58,
     245,    -1,   237,   121,   245,    47,   245,    -1,   237,   121,
     245,    48,   245,    -1,   237,   121,   245,    69,   245,    -1,
     237,   121,   245,    70,   245,    -1,   237,   121,   245,    71,
     245,    -1,   237,   121,   245,    54,   245,    -1,   237,   121,
     245,   133,   245,    -1,   237,   121,   245,   134,   245,    -1,
     237,   121,   245,   128,   245,    -1,   237,   121,   245,   122,
     246,   123,    -1,   237,   122,   246,   123,   121,   245,    -1,
     237,   121,    21,   218,    72,   245,    -1,   237,   121,    21,
     218,   122,   246,   123,    -1,   237,   121,    21,   218,    -1,
     237,   121,    21,   245,    -1,   237,   121,    21,   122,   246,
     123,    -1,   237,   121,    21,   245,    72,   245,    -1,   237,
     121,    21,   245,   122,   246,   123,    -1,   237,   121,    63,
     106,    -1,   237,   121,    62,   255,    -1,    62,   255,   121,
     245,    -1,    21,   237,    72,   245,    -1,    21,   237,    72,
     245,    72,   245,    -1,    21,   237,    72,   245,   122,   246,
     123,    -1,   237,   121,   227,    -1,    -1,   124,   220,   234,
     125,   121,   225,   124,   229,   125,    -1,   221,    -1,   223,
      -1,   224,    -1,   237,   121,    14,    -1,    -1,    67,   222,
     124,   234,   125,    -1,   237,    33,   245,    -1,   237,    34,
     245,    -1,   237,    35,   245,    -1,   237,    36,   245,    -1,
     237,    43,   245,    -1,   237,    42,   245,    -1,   237,    37,
     245,    -1,   237,    38,   245,    -1,   237,    39,   245,    -1,
     237,    40,   245,    -1,   237,    44,   245,    -1,   237,    45,
     245,    -1,   237,    46,   245,    -1,   237,   121,   114,   154,
      -1,   106,    -1,   110,    -1,   113,    -1,   237,    -1,   237,
     226,   242,    -1,   237,   226,   110,    -1,   237,   226,   237,
      -1,   120,    -1,   118,    -1,    -1,   225,   228,   124,   229,
     125,    -1,    -1,   229,    72,   230,    -1,   230,    -1,   229,
      72,   110,    20,   245,    -1,   110,    20,   245,    -1,   245,
     231,    -1,    -1,   231,   232,    -1,    15,    -1,    19,    -1,
      19,   124,   110,   125,    -1,   237,   192,    -1,   234,    72,
     233,    -1,   234,    72,   110,    20,   237,    -1,   233,    -1,
     110,    20,   237,    -1,    -1,    12,   245,   236,   245,    10,
     243,    -1,    13,   245,   236,   245,    10,   243,    -1,    12,
      14,   245,    10,   243,    -1,    13,    14,   245,    10,   243,
      -1,    12,   245,    10,   243,    -1,    13,   245,    10,   243,
      -1,    12,   245,    72,   243,    -1,    13,   245,    72,   243,
      -1,    55,    -1,    56,    -1,    57,    -1,    58,    -1,    59,
      -1,    60,    -1,   115,    -1,   253,    -1,    -1,   239,    -1,
     239,    72,   240,    -1,   240,    -1,   244,    -1,   237,   122,
     246,   123,    -1,   122,   248,   123,    -1,   242,    -1,   110,
      -1,   113,    -1,   106,    -1,   114,    -1,   106,    -1,   114,
      -1,   243,    -1,   245,    -1,   237,    -1,   254,    -1,    -1,
     247,   250,    -1,    -1,   249,   250,    -1,   252,    -1,   250,
     135,   252,    -1,    -1,   250,    72,   251,   252,    -1,   245,
      -1,   245,    74,   245,    -1,    74,   245,    -1,   245,    74,
      -1,   102,    -1,   103,    -1,   104,    -1,   105,    -1,   107,
      -1,   111,    -1,   112,    -1,   110,    -1,   113,    -1,   104,
      -1,   110,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   476,   476,   480,   481,   485,   486,   487,   488,   491,
     494,   497,   498,   499,   502,   503,   504,   507,   515,   524,
     533,   539,   548,   548,   553,   553,   557,   558,   562,   563,
     567,   568,   569,   570,   571,   572,   573,   576,   576,   583,
     582,   593,   595,   600,   604,   608,   608,   618,   620,   624,
     639,   640,   645,   649,   652,   644,   658,   659,   660,   671,
     671,   675,   680,   690,   691,   695,   698,   701,   706,   710,
     717,   718,   719,   723,   724,   725,   726,   727,   737,   747,
     750,   752,   756,   757,   758,   756,   765,   764,   797,   798,
     802,   803,   808,   809,   813,   814,   818,   819,   820,   821,
     822,   823,   824,   825,   826,   827,   828,   832,   837,   839,
     844,   846,   848,   852,   860,   861,   865,   870,   871,   875,
     876,   876,   889,   890,   894,   895,   896,   897,   898,   899,
     904,   905,   909,   910,   915,   914,   919,   925,   926,   929,
     935,   940,   939,   947,   946,   956,   957,   964,   966,   973,
     979,   980,   992,   996,   998,   999,  1000,  1004,  1005,  1009,
    1010,  1014,  1022,  1024,  1033,  1040,  1049,  1057,  1067,  1068,
    1069,  1070,  1071,  1071,  1086,  1090,  1090,  1092,  1093,  1093,
    1095,  1099,  1100,  1106,  1108,  1109,  1110,  1111,  1115,  1116,
    1117,  1118,  1119,  1120,  1124,  1135,  1137,  1139,  1141,  1143,
    1145,  1147,  1149,  1151,  1153,  1155,  1157,  1159,  1161,  1163,
    1165,  1167,  1169,  1171,  1173,  1175,  1177,  1179,  1181,  1183,
    1185,  1187,  1189,  1191,  1193,  1195,  1197,  1199,  1201,  1203,
    1205,  1207,  1210,  1212,  1216,  1218,  1220,  1223,  1230,  1229,
    1238,  1239,  1240,  1241,  1245,  1245,  1251,  1253,  1255,  1257,
    1259,  1261,  1263,  1265,  1267,  1269,  1271,  1273,  1275,  1280,
    1289,  1290,  1291,  1292,  1297,  1298,  1299,  1302,  1303,  1308,
    1307,  1317,  1318,  1325,  1332,  1334,  1338,  1342,  1343,  1347,
    1348,  1349,  1352,  1356,  1363,  1365,  1372,  1373,  1377,  1379,
    1381,  1383,  1385,  1387,  1389,  1391,  1396,  1397,  1398,  1399,
    1400,  1401,  1405,  1406,  1410,  1411,  1415,  1416,  1420,  1421,
    1428,  1435,  1436,  1437,  1441,  1442,  1446,  1447,  1451,  1452,
    1456,  1457,  1460,  1460,  1467,  1467,  1475,  1476,  1479,  1479,
    1485,  1490,  1495,  1496,  1500,  1501,  1502,  1503,  1504,  1508,
    1509,  1510,  1511,  1515,  1516
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
  "OBJECTV", "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE",
  "RELOP_LT", "RELOP_LTE", "GLOBAL", "GLOBALOP", "ADDR", "RESULT",
  "RETURN", "YIELDT", "GET_RESULTS", "POW", "SHIFT_RIGHT_U", "LOG_AND",
  "LOG_OR", "COMMA", "ESUB", "DOTDOT", "PCC_BEGIN", "PCC_END", "PCC_CALL",
  "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD",
  "PCC_END_YIELD", "NCI_CALL", "METH_CALL", "INVOCANT", "MAIN", "LOAD",
  "INIT", "IMMEDIATE", "POSTCOMP", "METHOD", "ANON", "OUTER", "NEED_LEX",
  "MULTI", "VTABLE_METHOD", "LOADLIB", "UNIQUE_REG", "LABEL", "EMIT",
  "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "REG", "MACRO",
  "ENDM", "STRINGC", "INTC", "FLOATC", "USTRINGC", "PARROT_OP", "VAR",
  "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", "POINTY", "'='", "'['",
  "']'", "'('", "')'", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", "'%'",
  "'&'", "'|'", "';'", "$accept", "program", "compilation_units",
  "compilation_unit", "pragma", "pragma_1", "hll_def", "global",
  "constdef", "@1", "pmc_const", "@2", "any_string", "pasmcode",
  "pasmline", "pasm_inst", "@3", "@4", "pasm_args", "emit", "@5",
  "opt_pasmcode", "class_namespace", "maybe_ns", "sub", "@6", "@7", "@8",
  "sub_params", "sub_param", "@9", "sub_param_type_def", "opt_comma",
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
     374,    61,    91,    93,    40,    41,    33,    45,   126,    43,
      42,    47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
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
     185,   185,   185,   185,   185,   185,   185,   186,   186,   186,
     186,   186,   186,   186,   187,   187,   188,   189,   189,   190,
     191,   190,   192,   192,   193,   193,   193,   193,   193,   193,
     194,   194,   195,   195,   197,   196,   196,   198,   198,   198,
     199,   201,   200,   202,   200,   203,   203,   203,   203,   203,
     204,   204,   205,   206,   206,   206,   206,   207,   207,   208,
     208,   209,   210,   210,   211,   211,   212,   212,   213,   213,
     213,   213,   214,   213,   213,   215,   213,   213,   216,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   217,   217,
     217,   217,   217,   217,   218,   219,   219,   219,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   220,   219,
     219,   219,   219,   219,   222,   221,   223,   223,   223,   223,
     223,   223,   223,   223,   223,   223,   223,   223,   223,   224,
     225,   225,   225,   225,   225,   225,   225,   226,   226,   228,
     227,   229,   229,   229,   229,   229,   230,   231,   231,   232,
     232,   232,   233,   234,   234,   234,   234,   234,   235,   235,
     235,   235,   235,   235,   235,   235,   236,   236,   236,   236,
     236,   236,   237,   237,   238,   238,   239,   239,   240,   240,
     240,   241,   241,   241,   242,   242,   243,   243,   244,   244,
     245,   245,   247,   246,   249,   248,   250,   250,   251,   250,
     252,   252,   252,   252,   253,   253,   253,   253,   253,   254,
     254,   254,   254,   255,   255
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
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
       1,     1,     1,     1,     1,     1,     1,     5,     3,     3,
       3,     3,     5,     5,     0,     3,     2,     0,     3,     3,
       0,     4,     0,     2,     1,     1,     1,     1,     4,     1,
       1,     1,     1,     1,     0,     5,     1,     0,     2,     3,
       3,     0,     5,     0,     5,     0,     1,     3,     3,     5,
       1,     2,     0,     2,     2,     1,     1,     0,     1,     2,
       1,     1,     3,     2,     1,     3,     2,     1,     1,     1,
       2,     2,     0,     4,     4,     0,     6,     1,     0,     6,
       2,     2,     2,     2,     1,     1,     1,     0,     1,     1,
       1,     1,     1,     1,     1,     3,     4,     4,     4,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     6,     6,     6,     7,     4,     4,     6,     6,
       7,     4,     4,     4,     4,     6,     7,     3,     0,     9,
       1,     1,     1,     3,     0,     5,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     4,
       1,     1,     1,     1,     3,     3,     3,     1,     1,     0,
       5,     0,     3,     1,     5,     3,     2,     0,     2,     1,
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
static const yytype_uint16 yydefact[] =
{
       0,    13,     0,     0,     0,    51,    52,    22,     0,    82,
       0,    45,     0,     0,     2,     3,    12,     0,     7,     6,
      10,     5,     8,     9,     0,     0,     0,     0,   322,     0,
       0,     0,   188,   189,   190,   191,   192,   194,     0,   193,
       0,     0,   157,    11,     1,     4,    15,    17,    14,     0,
       0,     0,     0,    49,   314,   312,   313,   315,    53,   311,
       0,    20,    83,    16,    24,   161,     0,    33,    32,    36,
      35,   157,    28,     0,    34,    37,   158,   160,    18,    19,
      50,     0,   334,   335,   336,   337,   338,   341,   339,   340,
     342,   302,   320,   330,   323,   326,   303,   321,    92,     0,
       0,    92,     0,    31,    29,    46,     0,     0,    39,     0,
       0,   159,   332,   333,   328,     0,    98,    96,    97,    99,
     100,   102,   101,     0,   103,     0,    68,   104,   105,   106,
       0,    63,    94,     0,    21,     0,     0,    41,     0,    92,
      30,   304,   331,     0,   327,     0,    70,     0,    54,    64,
       0,    23,    84,   316,   317,   318,     0,   319,     0,     0,
     324,    38,   320,    44,   305,   307,   308,   329,     0,     0,
      73,    74,    76,    75,    77,    78,   322,     0,    72,     0,
      56,    95,    56,     0,    42,    40,     0,     0,   322,     0,
      67,    66,     0,     0,    65,    69,    57,   152,   152,    26,
      27,    25,   310,   325,     0,   306,    79,    71,    59,     0,
     156,   155,     0,     0,   152,     0,   150,     0,   309,     0,
     154,    58,    55,   151,     0,   187,   153,    85,    60,     0,
     163,     0,     0,     0,     0,     0,     0,     0,   172,     0,
     175,   178,     0,     0,     0,   244,     0,   130,   131,   260,
     261,   262,   304,   238,   177,   185,     0,   186,   136,     0,
     168,   240,   241,   242,   269,   184,   169,   263,   122,     0,
     181,     0,     0,     0,     0,   183,     0,   170,   171,     0,
       0,     0,     0,   343,   344,     0,   141,   180,   263,   143,
       0,    86,   182,   287,   134,   162,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     268,   267,     0,   322,     0,    61,     0,     0,     0,   296,
     297,   298,   299,   300,   301,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   145,   145,   287,
     114,     0,   285,     0,   122,   137,   271,   246,   247,   248,
     249,   252,   253,   254,   255,   251,   250,   256,   257,   258,
     243,     0,     0,     0,   341,   342,   304,     0,     0,     0,
     237,   320,   195,     0,   265,   266,   264,   124,   125,   126,
     127,   129,   123,   122,     0,   292,   294,     0,     0,   293,
     295,     0,   234,   167,   173,   164,   174,     0,     0,   233,
     341,     0,   146,   277,     0,     0,    90,     0,     0,     0,
     282,     0,   341,     0,   273,   322,   226,   227,   232,   231,
     259,   196,   197,   198,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   322,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      62,   290,     0,   291,     0,     0,   322,   166,     0,     0,
       0,     0,     0,   142,   276,   144,   245,     0,     0,     0,
       0,   286,     0,   283,     0,   138,     0,   132,   133,   135,
       0,     0,     0,   270,     0,     0,   322,     0,   322,   204,
     213,   214,   218,   207,   208,   209,   212,   210,   211,   202,
     215,   216,   217,   206,     0,   200,   221,   199,   201,   203,
     205,   219,   220,     0,     0,   288,   289,   235,     0,   165,
     176,   179,   147,   341,   148,   279,   280,   278,   116,     0,
       0,     0,     0,    88,   115,     0,     0,   277,   139,   275,
     341,   272,   228,   224,     0,   229,     0,   222,   223,   128,
     236,     0,     0,    91,     0,     0,     0,     0,   117,     0,
     284,   271,   140,     0,   225,   230,   149,     0,   108,     0,
     109,   111,     0,   110,     0,     0,    89,     0,   274,   281,
       0,     0,     0,   120,     0,    87,     0,   239,   107,   113,
     112,     0,   122,   118,     0,   119,   121
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    13,    14,    15,    16,    25,    17,    18,    19,    31,
      70,   102,   201,    71,    72,   109,   110,   139,   161,    20,
      42,    73,    21,    29,    22,    30,    98,   180,   197,   212,
     219,   228,   150,   127,   128,   129,   177,   178,   213,    23,
      40,   101,   182,   255,   340,   558,   469,   130,   131,   132,
     533,   406,   470,   575,   586,   591,   315,   382,   256,   479,
     257,   345,   411,   480,   258,   337,   338,   401,   214,   215,
     216,    75,    76,    77,   226,   394,   395,   259,   279,   281,
     282,    38,    39,   260,   293,   261,   290,   262,   263,   264,
     314,   265,   296,   413,   402,   464,   527,   342,   343,   266,
     326,    92,   163,   164,   165,    58,    59,   155,   166,   403,
      51,    52,   186,   187,    94,   143,    95,    96,    97,   285
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -453
static const yytype_int16 yypact[] =
{
     267,  -453,    28,   -58,   -49,    18,  -453,  -453,    -3,  -453,
     -36,  -453,    97,   119,   267,  -453,  -453,   116,  -453,  -453,
    -453,  -453,  -453,  -453,    17,   131,    73,    76,  -453,   153,
     164,    -3,  -453,  -453,  -453,  -453,  -453,  -453,    72,  -453,
      78,   175,    35,  -453,  -453,  -453,  -453,  -453,  -453,    82,
      71,    60,   399,  -453,  -453,  -453,  -453,  -453,  -453,  -453,
      81,    86,  -453,  -453,  -453,  -453,   198,  -453,  -453,  -453,
    -453,    59,  -453,   117,  -453,    11,   122,  -453,  -453,  -453,
    -453,   611,  -453,  -453,  -453,  -453,  -453,  -453,  -453,  -453,
    -453,  -453,  -453,   149,   -50,  -453,  -453,  -453,   739,   104,
     169,   739,   121,  -453,  -453,  -453,   611,   128,  -453,   223,
     126,  -453,  -453,   611,  -453,   399,  -453,  -453,  -453,  -453,
    -453,  -453,  -453,   120,  -453,   148,   161,  -453,  -453,  -453,
     237,    10,  -453,   169,  -453,   241,   451,  -453,   174,   739,
    -453,   597,  -453,   399,  -453,    19,     4,   142,  -453,  -453,
     739,  -453,  -453,  -453,  -453,  -453,   165,  -453,   190,   203,
    -453,  -453,   182,  -453,   233,  -453,  -453,  -453,   185,   187,
    -453,  -453,  -453,  -453,  -453,  -453,  -453,   -48,  -453,   188,
     311,  -453,   311,   -68,  -453,  -453,   194,   399,  -453,   597,
    -453,  -453,   197,     4,  -453,  -453,  -453,     0,     0,  -453,
    -453,  -453,  -453,   -50,   199,  -453,  -453,  -453,  -453,   315,
    -453,  -453,   317,   254,    77,   468,  -453,   256,  -453,    -3,
    -453,  -453,  -453,  -453,   332,   574,  -453,  -453,  -453,    49,
    -453,   -80,    93,   196,   611,   132,   231,   238,  -453,   236,
     239,  -453,    58,   109,   224,  -453,   343,  -453,  -453,  -453,
    -453,  -453,   597,  -453,  -453,  -453,   345,  -453,  -453,   347,
    -453,  -453,  -453,  -453,  -453,  -453,  -453,   623,  -453,   333,
    -453,   611,   114,   611,   395,  -453,   280,  -453,  -453,    -3,
     285,    -3,    -3,  -453,  -453,   244,  -453,  -453,    46,  -453,
     234,  -453,  -453,   306,  -453,  -453,   235,   611,   611,   611,
     611,   611,   611,   611,   611,   611,   611,   611,   611,   611,
    -453,  -453,   228,  -453,   686,    -6,   260,   350,   -80,  -453,
    -453,  -453,  -453,  -453,  -453,   -80,   611,   358,   -80,   -80,
     611,   611,   263,   132,   264,   265,   611,   625,   625,   306,
    -453,   352,  -453,   -45,  -453,  -453,   644,  -453,  -453,  -453,
    -453,  -453,  -453,  -453,  -453,  -453,  -453,  -453,  -453,  -453,
    -453,   324,    58,   268,   249,   252,   597,   611,   611,   611,
    -453,    13,   563,   255,  -453,  -453,  -453,  -453,  -453,  -453,
     253,  -453,  -453,  -453,   -80,  -453,  -453,   369,   -80,  -453,
    -453,   370,    -1,   298,   334,  -453,  -453,   286,   293,  -453,
     397,   -42,  -453,  -453,   -41,   -39,     6,   132,   700,   294,
      -6,    14,   400,   -21,  -453,  -453,    27,    41,  -453,  -453,
    -453,  -453,  -453,  -453,   611,   611,   611,   611,   611,   611,
     611,   611,   611,   611,   611,   611,   611,   611,   611,  -453,
     611,   611,   611,   611,   611,   611,   611,   611,   302,   314,
      -6,  -453,   -80,  -453,   -80,   611,  -453,  -453,   263,   169,
     169,   611,   658,  -453,   162,  -453,  -453,   611,   611,    70,
     428,  -453,   420,  -453,   435,  -453,   611,  -453,  -453,  -453,
     437,   611,   672,  -453,   320,   611,  -453,   611,  -453,  -453,
    -453,  -453,  -453,  -453,  -453,  -453,  -453,  -453,  -453,  -453,
    -453,  -453,  -453,  -453,   322,  -453,  -453,  -453,  -453,  -453,
    -453,  -453,  -453,   611,   323,  -453,  -453,  -453,   326,  -453,
    -453,  -453,  -453,   427,  -453,  -453,   335,  -453,  -453,   452,
     611,   611,   709,   122,  -453,   132,   336,  -453,  -453,  -453,
     441,  -453,  -453,  -453,   339,  -453,   340,  -453,  -453,  -453,
    -453,   611,   354,  -453,     3,   453,    15,    25,  -453,   461,
    -453,   644,   162,   611,  -453,  -453,  -453,   341,  -453,   611,
    -453,  -453,   611,  -453,   611,    51,  -453,   -14,  -453,  -453,
     464,   470,   471,  -453,   132,  -453,   472,  -453,  -453,  -453,
    -453,    -3,  -453,  -453,   263,    -6,  -453
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -453,  -453,  -453,   463,    -5,  -453,  -453,  -453,  -453,  -453,
     258,  -453,  -453,  -453,   408,  -453,  -453,  -453,   118,  -453,
    -453,  -453,    -2,  -453,  -453,  -453,  -453,  -453,   303,  -453,
    -453,  -453,  -453,  -453,  -453,  -453,  -453,   299,   288,  -453,
    -453,  -453,  -453,  -453,  -453,  -453,  -453,   -78,  -453,   344,
    -453,  -453,  -453,  -453,  -453,  -453,  -324,  -453,  -453,  -453,
    -453,  -453,  -453,  -453,  -453,  -453,  -453,   155,  -453,  -453,
     284,   290,  -453,   -75,  -453,  -453,  -452,  -453,  -453,  -453,
    -453,   -31,   138,  -453,  -453,  -453,  -453,  -453,  -453,    33,
    -453,  -222,  -453,   -46,  -344,   -24,  -453,   108,   178,  -453,
     245,  -113,   266,  -453,   338,  -453,   207,  -223,   386,   -43,
    -172,  -453,  -453,  -453,   337,  -453,   -83,  -453,   -97,   163
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -264
static const yytype_int16 yytable[] =
{
      60,   111,   414,   134,   192,   208,   519,   568,   270,    93,
     377,   378,   379,   380,   -93,   -43,   204,   467,   475,   571,
     410,   287,   114,   135,   193,   106,   153,   408,   162,   573,
     462,   462,   144,   408,   154,    24,   151,    69,   112,   107,
      74,     2,   199,     3,     4,   200,    32,    33,    34,    35,
      36,   482,    26,   170,   171,   172,   173,     5,   482,   450,
     167,   159,    27,   137,    64,     2,    69,     3,     4,    74,
     142,   455,    93,   -80,    41,   569,   162,   194,   583,   476,
     409,     5,   149,   463,   465,   115,   466,   572,    64,   108,
     370,   468,   381,   157,   477,   385,   478,   574,   157,   485,
      93,    43,   386,    37,   483,   389,   390,   271,   209,   -93,
     174,   587,   267,   487,   175,   584,   210,   211,   524,    44,
      46,   456,   276,   528,   318,   168,   176,   585,    47,   169,
     288,   310,    10,   311,    65,    48,   -47,  -263,   541,   162,
      28,   373,   596,    66,    93,    49,   157,   530,    50,   486,
     -81,    67,    68,   531,   532,   268,    10,    53,    65,   269,
     -48,   451,   283,   488,   310,   453,   311,    66,   284,   319,
     320,   321,   322,   323,   324,    67,    68,   525,    61,    63,
     344,   526,    79,    80,    62,   209,   325,    99,   229,   272,
     274,   275,    78,   210,   211,    82,    83,    84,    85,   371,
      86,   375,   103,    87,    88,    89,    90,   100,    91,   157,
     273,    82,    83,    84,    85,   249,    86,   414,   105,   250,
     396,    65,   251,   113,    91,   133,   344,   140,   317,   515,
     327,   516,   136,   286,    82,    83,    84,    85,   138,    86,
     141,   148,   360,   484,   145,   152,   158,    91,   332,   361,
     334,   335,   179,   162,   347,   348,   349,   350,   351,   352,
     353,   354,   355,   356,   357,   358,   359,   504,   595,   372,
      54,     1,   146,     2,    55,     3,     4,    56,    57,    87,
      88,    89,    90,   387,   518,   147,   183,   391,   392,     5,
     362,   363,     6,   399,   471,   344,     7,   184,    82,    83,
      84,    85,   185,    86,   188,   189,    87,    88,    89,    90,
     190,    91,   191,   195,   544,   196,   546,   202,   417,   220,
     206,   221,   218,   157,   421,   422,   423,   222,     8,   227,
      82,    83,    84,    85,   249,    86,   230,   277,   364,    88,
      89,   365,   366,    91,   278,     9,   280,   291,   289,   294,
     -24,   295,   331,   316,   367,   368,   369,   333,   339,   346,
     384,   288,   520,   521,    10,   336,   383,    11,   388,   393,
     397,   398,   407,  -261,   419,    12,  -262,   449,   448,   452,
     454,   489,   490,   491,   492,   493,   494,   495,   496,   497,
     498,   499,   500,   501,   502,   503,   457,   505,   506,   507,
     508,   509,   510,   511,   512,   328,   458,   459,    82,    83,
      84,    85,   517,    86,   460,   474,   341,   461,   522,   557,
     481,    91,   560,   513,   514,   529,    82,    83,    84,    85,
      37,    86,   534,   537,    87,    88,    89,    90,   539,    91,
     535,   538,   543,   542,   545,   547,   415,   551,   549,   550,
     319,   320,   321,   322,   323,   324,   553,   570,   559,   552,
     561,   563,   564,   565,   567,   576,   579,   329,   588,   224,
     548,   592,  -157,    81,   589,   590,   593,    45,  -157,   104,
    -157,  -157,  -157,   254,   420,   198,   217,   554,   555,  -157,
    -157,  -157,   207,   404,   181,  -157,  -157,  -157,   223,   416,
    -157,    82,    83,    84,    85,   225,    86,   536,   566,    87,
      88,    89,    90,   562,    91,   577,   473,   405,   292,   330,
     578,   376,   156,     0,   203,   418,   580,   205,     0,   581,
    -157,   582,     0,  -157,  -157,  -157,     0,    82,    83,    84,
      85,   249,    86,  -157,     0,   250,     0,  -157,   251,  -157,
      91,     0,     0,    82,    83,    84,    85,   153,    86,     0,
     594,    87,    88,    89,    90,   154,    91,    65,     0,     0,
    -157,  -157,  -157,  -157,  -157,  -157,     0,     0,  -157,     0,
       0,  -157,  -157,  -157,   231,     0,   232,   233,   234,     0,
       0,     0,  -157,     0,     0,   235,   236,   237,     0,     0,
       0,   238,   239,   240,   424,     0,   241,     0,     0,     0,
     425,   426,     0,     0,     0,     0,     0,   427,   428,   429,
     430,   431,   432,   433,     0,     0,     0,     0,     0,     0,
       0,   434,   435,   436,   437,     0,   242,     0,     0,   243,
     244,   245,     0,     0,     0,     0,     0,     0,     0,   246,
       0,     0,     0,   247,     0,   248,   297,   298,   299,   300,
     301,   302,   303,   304,     0,   305,   306,   307,   308,   309,
       0,     0,     0,     0,     0,     0,    82,    83,    84,    85,
     249,    86,   438,     0,   250,   439,     0,   251,   252,    91,
     440,   441,   442,   443,   444,   445,   446,   447,   253,    82,
      83,    84,    85,   153,    86,     0,     0,    87,    88,    89,
      90,   154,    91,    82,    83,    84,    85,     0,    86,   160,
       0,    87,    88,    89,    90,     0,    91,    82,    83,    84,
      85,     0,    86,     0,     0,   400,    88,    89,    90,     0,
      91,   310,     0,   311,   312,   313,    82,    83,    84,    85,
       0,    86,     0,     0,   412,    88,    89,    90,     0,    91,
      82,    83,    84,    85,     0,    86,     0,     0,   523,    88,
      89,    90,     0,    91,    82,    83,    84,    85,     0,    86,
       0,     0,   540,    88,    89,    90,     0,    91,    82,    83,
      84,    85,    54,    86,     0,     0,   374,     0,     0,     0,
      57,    91,    82,    83,    84,    85,     0,    86,     0,     0,
     472,    82,    83,    84,    85,    91,    86,     0,     0,   556,
       0,     0,     0,     0,    91,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126
};

static const yytype_int16 yycheck[] =
{
      31,    76,   346,   100,   176,     5,   458,     4,   231,    52,
      16,    17,    18,    19,     4,     4,   188,    11,     4,     4,
     344,   243,    72,   101,    72,    14,   106,    72,   141,     4,
      72,    72,   115,    72,   114,     7,   133,    42,    81,    28,
      42,     6,   110,     8,     9,   113,    49,    50,    51,    52,
      53,    72,   110,    49,    50,    51,    52,    22,    72,   383,
     143,   139,   111,   106,    29,     6,    71,     8,     9,    71,
     113,    72,   115,    73,   110,    72,   189,   125,    27,    65,
     125,    22,    72,   125,   125,   135,   125,    72,    29,    78,
     312,    85,    98,   136,    80,   318,    82,    72,   141,    72,
     143,     4,   325,   106,   125,   328,   329,    14,   108,    99,
     106,   125,   225,    72,   110,    64,   116,   117,   462,     0,
       4,   122,   235,   467,    10,   106,   122,    76,   111,   110,
     243,   118,    97,   120,    99,     4,   101,   124,   482,   252,
     122,   313,   594,   108,   187,    72,   189,    77,    72,   122,
      73,   116,   117,    83,    84,   106,    97,     4,    99,   110,
     101,   384,   104,   122,   118,   388,   120,   108,   110,    55,
      56,    57,    58,    59,    60,   116,   117,    15,   106,     4,
     293,    19,   111,   123,   106,   108,    72,   106,   219,   232,
     233,   234,   110,   116,   117,   102,   103,   104,   105,   312,
     107,   314,     4,   110,   111,   112,   113,   121,   115,   252,
      14,   102,   103,   104,   105,   106,   107,   561,   101,   110,
     333,    99,   113,    74,   115,   121,   339,     4,   271,   452,
     273,   454,   111,   124,   102,   103,   104,   105,   110,   107,
     114,     4,    14,   415,   124,     4,    72,   115,   279,    21,
     281,   282,   110,   366,   297,   298,   299,   300,   301,   302,
     303,   304,   305,   306,   307,   308,   309,   439,   592,   312,
     106,     4,   124,     6,   110,     8,     9,   113,   114,   110,
     111,   112,   113,   326,   456,   124,   121,   330,   331,    22,
      62,    63,    25,   336,   407,   408,    29,   107,   102,   103,
     104,   105,    99,   107,   122,    72,   110,   111,   112,   113,
     125,   115,   125,   125,   486,     4,   488,   123,   361,     4,
     123,     4,   123,   366,   367,   368,   369,    73,    61,    73,
     102,   103,   104,   105,   106,   107,     4,   106,   110,   111,
     112,   113,   114,   115,   106,    78,   110,     4,   124,     4,
     111,     4,    72,    20,   126,   127,   128,    72,   124,   124,
      10,   474,   459,   460,    97,   121,   106,   100,    10,   106,
     106,   106,    20,   124,   106,   108,   124,   124,   123,    10,
      10,   424,   425,   426,   427,   428,   429,   430,   431,   432,
     433,   434,   435,   436,   437,   438,    98,   440,   441,   442,
     443,   444,   445,   446,   447,    10,    72,   121,   102,   103,
     104,   105,   455,   107,   121,   121,   110,    20,   461,   532,
      20,   115,   535,   121,   110,   468,   102,   103,   104,   105,
     106,   107,     4,   476,   110,   111,   112,   113,   481,   115,
      20,     4,   485,   123,   487,   123,   122,    20,   125,   123,
      55,    56,    57,    58,    59,    60,     4,     4,   533,   124,
     124,    20,   123,   123,   110,     4,   125,    72,     4,     1,
     513,   584,     4,    74,     4,     4,     4,    14,    10,    71,
      12,    13,    14,   225,   366,   182,   198,   530,   531,    21,
      22,    23,   193,   338,   150,    27,    28,    29,   214,   361,
      32,   102,   103,   104,   105,   215,   107,   474,   551,   110,
     111,   112,   113,   537,   115,   561,   408,   339,   252,   274,
     563,   314,   136,    -1,   187,   362,   569,   189,    -1,   572,
      62,   574,    -1,    65,    66,    67,    -1,   102,   103,   104,
     105,   106,   107,    75,    -1,   110,    -1,    79,   113,    81,
     115,    -1,    -1,   102,   103,   104,   105,   106,   107,    -1,
     591,   110,   111,   112,   113,   114,   115,    99,    -1,    -1,
     102,   103,   104,   105,   106,   107,    -1,    -1,   110,    -1,
      -1,   113,   114,   115,    10,    -1,    12,    13,    14,    -1,
      -1,    -1,   124,    -1,    -1,    21,    22,    23,    -1,    -1,
      -1,    27,    28,    29,    41,    -1,    32,    -1,    -1,    -1,
      47,    48,    -1,    -1,    -1,    -1,    -1,    54,    55,    56,
      57,    58,    59,    60,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    69,    70,    71,    -1,    62,    -1,    -1,    65,
      66,    67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      -1,    -1,    -1,    79,    -1,    81,    33,    34,    35,    36,
      37,    38,    39,    40,    -1,    42,    43,    44,    45,    46,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,   104,   105,
     106,   107,   119,    -1,   110,   122,    -1,   113,   114,   115,
     127,   128,   129,   130,   131,   132,   133,   134,   124,   102,
     103,   104,   105,   106,   107,    -1,    -1,   110,   111,   112,
     113,   114,   115,   102,   103,   104,   105,    -1,   107,   122,
      -1,   110,   111,   112,   113,    -1,   115,   102,   103,   104,
     105,    -1,   107,    -1,    -1,   110,   111,   112,   113,    -1,
     115,   118,    -1,   120,   121,   122,   102,   103,   104,   105,
      -1,   107,    -1,    -1,   110,   111,   112,   113,    -1,   115,
     102,   103,   104,   105,    -1,   107,    -1,    -1,   110,   111,
     112,   113,    -1,   115,   102,   103,   104,   105,    -1,   107,
      -1,    -1,   110,   111,   112,   113,    -1,   115,   102,   103,
     104,   105,   106,   107,    -1,    -1,   110,    -1,    -1,    -1,
     114,   115,   102,   103,   104,   105,    -1,   107,    -1,    -1,
     110,   102,   103,   104,   105,   115,   107,    -1,    -1,   110,
      -1,    -1,    -1,    -1,   115,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,     6,     8,     9,    22,    25,    29,    61,    78,
      97,   100,   108,   137,   138,   139,   140,   142,   143,   144,
     155,   158,   160,   175,     7,   141,   110,   111,   122,   159,
     161,   145,    49,    50,    51,    52,    53,   106,   217,   218,
     176,   110,   156,     4,     0,   139,     4,   111,     4,    72,
      72,   246,   247,     4,   106,   110,   113,   114,   241,   242,
     217,   106,   106,     4,    29,    99,   108,   116,   117,   140,
     146,   149,   150,   157,   158,   207,   208,   209,   110,   111,
     123,    74,   102,   103,   104,   105,   107,   110,   111,   112,
     113,   115,   237,   245,   250,   252,   253,   254,   162,   106,
     121,   177,   147,     4,   150,   101,    14,    28,    78,   151,
     152,   209,   245,    74,    72,   135,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    96,   169,   170,   171,
     183,   184,   185,   121,   254,   183,   111,   245,   110,   153,
       4,   114,   245,   251,   252,   124,   124,   124,     4,    72,
     168,   254,     4,   106,   114,   243,   244,   245,    72,   183,
     122,   154,   237,   238,   239,   240,   244,   252,   106,   110,
      49,    50,    51,    52,   106,   110,   122,   172,   173,   110,
     163,   185,   178,   121,   107,    99,   248,   249,   122,    72,
     125,   125,   246,    72,   125,   125,     4,   164,   164,   110,
     113,   148,   123,   250,   246,   240,   123,   173,     5,   108,
     116,   117,   165,   174,   204,   205,   206,   174,   123,   166,
       4,     4,    73,   206,     1,   207,   210,    73,   167,   217,
       4,    10,    12,    13,    14,    21,    22,    23,    27,    28,
      29,    32,    62,    65,    66,    67,    75,    79,    81,   106,
     110,   113,   114,   124,   146,   179,   194,   196,   200,   213,
     219,   221,   223,   224,   225,   227,   235,   237,   106,   110,
     243,    14,   245,    14,   245,   245,   237,   106,   106,   214,
     110,   215,   216,   104,   110,   255,   124,   227,   237,   124,
     222,     4,   238,   220,     4,     4,   228,    33,    34,    35,
      36,    37,    38,    39,    40,    42,    43,    44,    45,    46,
     118,   120,   121,   122,   226,   192,    20,   245,    10,    55,
      56,    57,    58,    59,    60,    72,   236,   245,    10,    72,
     236,    72,   217,    72,   217,   217,   121,   201,   202,   124,
     180,   110,   233,   234,   237,   197,   124,   245,   245,   245,
     245,   245,   245,   245,   245,   245,   245,   245,   245,   245,
      14,    21,    62,    63,   110,   113,   114,   126,   127,   128,
     227,   237,   245,   246,   110,   237,   242,    16,    17,    18,
      19,    98,   193,   106,    10,   243,   243,   245,    10,   243,
     243,   245,   245,   106,   211,   212,   237,   106,   106,   245,
     110,   203,   230,   245,   203,   234,   187,    20,    72,   125,
     192,   198,   110,   229,   230,   122,   218,   245,   255,   106,
     154,   245,   245,   245,    41,    47,    48,    54,    55,    56,
      57,    58,    59,    60,    68,    69,    70,    71,   119,   122,
     127,   128,   129,   130,   131,   132,   133,   134,   123,   124,
     192,   243,    10,   243,    10,    72,   122,    98,    72,   121,
     121,    20,    72,   125,   231,   125,   125,    11,    85,   182,
     188,   237,   110,   233,   121,     4,    65,    80,    82,   195,
     199,    20,    72,   125,   246,    72,   122,    72,   122,   245,
     245,   245,   245,   245,   245,   245,   245,   245,   245,   245,
     245,   245,   245,   245,   246,   245,   245,   245,   245,   245,
     245,   245,   245,   121,   110,   243,   243,   245,   246,   212,
     254,   254,   245,   110,   230,    15,    19,   232,   230,   245,
      77,    83,    84,   186,     4,    20,   225,   245,     4,   245,
     110,   230,   123,   245,   246,   245,   246,   123,   245,   125,
     123,    20,   124,     4,   245,   245,   110,   237,   181,   209,
     237,   124,   231,    20,   123,   123,   245,   110,     4,    72,
       4,     4,    72,     4,    72,   189,     4,   229,   245,   125,
     245,   245,   245,    27,    64,    76,   190,   125,     4,     4,
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
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, void *yyscanner, Interp *interp)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, yyscanner, interp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    void *yyscanner;
    Interp *interp;
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
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, void *yyscanner, Interp *interp)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, yyscanner, interp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    void *yyscanner;
    Interp *interp;
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
yy_reduce_print (YYSTYPE *yyvsp, int yyrule, void *yyscanner, Interp *interp)
#else
static void
yy_reduce_print (yyvsp, yyrule, yyscanner, interp)
    YYSTYPE *yyvsp;
    int yyrule;
    void *yyscanner;
    Interp *interp;
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
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, void *yyscanner, Interp *interp)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, yyscanner, interp)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    void *yyscanner;
    Interp *interp;
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
int yyparse (void *yyscanner, Interp *interp);
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
#line 476 "compilers/imcc/imcc.y"
    { if (yynerrs) YYABORT; (yyval.i) = 0; }
    break;

  case 5:
#line 485 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 6:
#line 486 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 7:
#line 487 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 8:
#line 488 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i);
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                     IMCC_INFO(interp)->cur_unit = 0; }
    break;

  case 9:
#line 491 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i);
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                     IMCC_INFO(interp)->cur_unit = 0; }
    break;

  case 10:
#line 494 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i);
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                     IMCC_INFO(interp)->cur_unit = 0; }
    break;

  case 11:
#line 497 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 12:
#line 498 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 13:
#line 499 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 14:
#line 502 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 15:
#line 503 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 16:
#line 504 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; do_loadlib(interp, (yyvsp[(2) - (3)].s)); }
    break;

  case 17:
#line 508 "compilers/imcc/imcc.y"
    { if ((yyvsp[(2) - (2)].s))
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 18:
#line 516 "compilers/imcc/imcc.y"
    {
            STRING *hll_name, *hll_lib;
            hll_name = string_unescape_cstring(interp, (yyvsp[(2) - (4)].s) + 1, '"', NULL);
            hll_lib =  string_unescape_cstring(interp, (yyvsp[(4) - (4)].s) + 1, '"', NULL);
            CONTEXT(((Interp*)interp)->ctx)->current_HLL =
                Parrot_register_HLL(interp, hll_name, hll_lib);
            (yyval.t) = 0;
         }
    break;

  case 19:
#line 525 "compilers/imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                CONTEXT(((Interp*)interp)->ctx)->current_HLL, atoi((yyvsp[(2) - (4)].s)), atoi((yyvsp[(4) - (4)].s)));
             (yyval.t) = 0;
         }
    break;

  case 20:
#line 534 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 21:
#line 540 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 22:
#line 548 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 23:
#line 549 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1); is_def=0; }
    break;

  case 24:
#line 553 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 25:
#line 554 "compilers/imcc/imcc.y"
    { (yyval.i) = mk_pmc_const(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].s)); is_def=0; }
    break;

  case 30:
#line 567 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 31:
#line 568 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 32:
#line 569 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 33:
#line 570 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 34:
#line 571 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 37:
#line 576 "compilers/imcc/imcc.y"
    { clear_state(interp); }
    break;

  case 38:
#line 578 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit,
                              (yyvsp[(2) - (3)].s), 0, IMCC_INFO(interp)->regs,
                              IMCC_INFO(interp)->nargs, IMCC_INFO(interp) -> keyvec, 1);
                     free((yyvsp[(2) - (3)].s)); }
    break;

  case 39:
#line 583 "compilers/imcc/imcc.y"
    {
                    imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                    IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM);
                    }
    break;

  case 40:
#line 588 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit,
                                mk_sub_label(interp, (yyvsp[(4) - (4)].s)));
                     IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(3) - (4)].t);
                   }
    break;

  case 41:
#line 594 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(2) - (2)].sr)); }
    break;

  case 42:
#line 596 "compilers/imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, (yyvsp[(4) - (4)].s));
                       set_lexical(interp, r, (yyvsp[(2) - (4)].s)); (yyval.i) = 0;
                   }
    break;

  case 43:
#line 600 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 45:
#line 608 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM); }
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
                    if (IMCC_INFO(interp)->state->pasm_file && IMCC_INFO(interp)->cur_namespace) {
                        imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                        re_open = 1;
                    }
                    IMCC_INFO(interp)->cur_namespace = (yyvsp[(2) - (3)].sr);
                    if (re_open)
                        IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM);
                }
    break;

  case 50:
#line 639 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); }
    break;

  case 51:
#line 640 "compilers/imcc/imcc.y"
    { (yyval.sr) = NULL; }
    break;

  case 52:
#line 645 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 53:
#line 649 "compilers/imcc/imcc.y"
    {
          iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (3)].sr));
        }
    break;

  case 54:
#line 652 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(5) - (6)].t); }
    break;

  case 55:
#line 654 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
    break;

  case 56:
#line 658 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 57:
#line 659 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 58:
#line 660 "compilers/imcc/imcc.y"
    {
       if (IMCC_INFO(interp)->adv_named_id) {
             add_pcc_named_param(interp,IMCC_INFO(interp)->cur_call,
                                 IMCC_INFO(interp)->adv_named_id,(yyvsp[(2) - (3)].sr));
             IMCC_INFO(interp)->adv_named_id = NULL;
         }
         else add_pcc_param(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
   }
    break;

  case 59:
#line 671 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 60:
#line 671 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(3) - (3)].sr); is_def=0; }
    break;

  case 61:
#line 675 "compilers/imcc/imcc.y"
    { if ((yyvsp[(3) - (3)].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
                                         (yyval.sr)->type |= (yyvsp[(3) - (3)].t); }
    break;

  case 62:
#line 680 "compilers/imcc/imcc.y"
    {
                                         if ((yyvsp[(5) - (5)].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[(4) - (5)].s), (yyvsp[(1) - (5)].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[(4) - (5)].s), (yyvsp[(1) - (5)].t));
                                         (yyval.sr)->type |= (yyvsp[(5) - (5)].t);
                                         adv_named_set(interp,(yyvsp[(2) - (5)].s));}
    break;

  case 63:
#line 690 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  }
    break;

  case 65:
#line 695 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 66:
#line 699 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; IMCC_INFO(interp)->cur_unit->outer =
                     mk_sub_address_fromc(interp, (yyvsp[(3) - (4)].s)); }
    break;

  case 67:
#line 702 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; IMCC_INFO(interp)->cur_unit->outer =
                     mk_const(interp, (yyvsp[(3) - (4)].s), 'S'); }
    break;

  case 68:
#line 707 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;
                       IMCC_INFO(interp)->cur_unit->vtable_name = NULL;
                       IMCC_INFO(interp)->cur_unit->is_vtable_method = 1; }
    break;

  case 69:
#line 711 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;
                       IMCC_INFO(interp)->cur_unit->vtable_name = strdup((yyvsp[(3) - (4)].s));
                       IMCC_INFO(interp)->cur_unit->is_vtable_method = 1; }
    break;

  case 70:
#line 717 "compilers/imcc/imcc.y"
    { add_pcc_multi(IMCC_INFO(interp)->cur_call, NULL); }
    break;

  case 71:
#line 718 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr)); }
    break;

  case 72:
#line 719 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr));}
    break;

  case 73:
#line 723 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 74:
#line 724 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 75:
#line 725 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 76:
#line 726 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 77:
#line 727 "compilers/imcc/imcc.y"
    {
                          SymReg *r;
                          if (strcmp((yyvsp[(1) - (1)].s), "_"))
                              r = mk_const(interp, (yyvsp[(1) - (1)].s), 'S');
                          else {
                              free((yyvsp[(1) - (1)].s)),
                              r = mk_const(interp, str_dup("PMC"), 'S');
                           }
                           (yyval.sr) = r;
                      }
    break;

  case 78:
#line 737 "compilers/imcc/imcc.y"
    {
                          SymReg *r;
                          if (strcmp((yyvsp[(1) - (1)].s), "_"))
                              r = mk_const(interp, (yyvsp[(1) - (1)].s), 'S');
                          else {
                              free((yyvsp[(1) - (1)].s)),
                              r = mk_const(interp, str_dup("PMC"), 'S');
                           }
                           (yyval.sr) = r;
                      }
    break;

  case 79:
#line 747 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); }
    break;

  case 82:
#line 756 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 83:
#line 757 "compilers/imcc/imcc.y"
    { iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit, mk_sub_label(interp, (yyvsp[(3) - (3)].s))); }
    break;

  case 84:
#line 758 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(5) - (6)].t); }
    break;

  case 85:
#line 760 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
    break;

  case 86:
#line 765 "compilers/imcc/imcc.y"
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
         }
    break;

  case 87:
#line 793 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
    break;

  case 88:
#line 797 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->label = 0; }
    break;

  case 89:
#line 798 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->label = 1; }
    break;

  case 90:
#line 802 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; }
    break;

  case 91:
#line 804 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->object = (yyvsp[(2) - (3)].sr); }
    break;

  case 92:
#line 808 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 94:
#line 813 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (1)].t); }
    break;

  case 95:
#line 814 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (3)].t) | (yyvsp[(3) - (3)].t); }
    break;

  case 96:
#line 818 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_LOAD; }
    break;

  case 97:
#line 819 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_INIT; }
    break;

  case 98:
#line 820 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_MAIN; }
    break;

  case 99:
#line 821 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_IMMEDIATE; }
    break;

  case 100:
#line 822 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_POSTCOMP; }
    break;

  case 101:
#line 823 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_ANON; }
    break;

  case 102:
#line 824 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_METHOD; }
    break;

  case 103:
#line 825 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_NEED_LEX; }
    break;

  case 107:
#line 833 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (5)].sr));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         }
    break;

  case 108:
#line 838 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 109:
#line 840 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
            IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 110:
#line 845 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 111:
#line 847 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[(2) - (3)].s),'S')); }
    break;

  case 112:
#line 849 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (5)].sr));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         }
    break;

  case 113:
#line 853 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[(2) - (5)].s),'S'));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         }
    break;

  case 114:
#line 860 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 115:
#line 861 "compilers/imcc/imcc.y"
    {  add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 116:
#line 865 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (2)].sr); }
    break;

  case 117:
#line 870 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 118:
#line 871 "compilers/imcc/imcc.y"
    {  if((yyvsp[(2) - (3)].sr)) add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 119:
#line 875 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); }
    break;

  case 120:
#line 876 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 121:
#line 877 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[(4) - (4)].idlist);
         if (l->unique_reg)
                 mk_ident_ur(interp, l->id, (yyvsp[(3) - (4)].t));
             else
                 mk_ident(interp, l->id, (yyvsp[(3) - (4)].t));
         is_def=0;
         (yyval.sr)=0;
     }
    break;

  case 122:
#line 889 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 123:
#line 890 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); }
    break;

  case 124:
#line 894 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_FLAT;   }
    break;

  case 125:
#line 895 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPTIONAL; }
    break;

  case 126:
#line 896 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPT_FLAG; }
    break;

  case 127:
#line 897 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_NAMED; }
    break;

  case 128:
#line 898 "compilers/imcc/imcc.y"
    {  adv_named_set(interp,(yyvsp[(3) - (4)].s)); (yyval.t) = 0; }
    break;

  case 129:
#line 899 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_UNIQUE_REG; }
    break;

  case 130:
#line 904 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 131:
#line 905 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; }
    break;

  case 134:
#line 915 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, (yyvsp[(1) - (2)].t)); }
    break;

  case 135:
#line 918 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 136:
#line 919 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.i) = 0;  }
    break;

  case 137:
#line 925 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 138:
#line 926 "compilers/imcc/imcc.y"
    {
       if((yyvsp[(1) - (2)].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (2)].sr));
   }
    break;

  case 139:
#line 929 "compilers/imcc/imcc.y"
    {
       if((yyvsp[(2) - (3)].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(2) - (3)].sr));
   }
    break;

  case 140:
#line 935 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); }
    break;

  case 141:
#line 940 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 142:
#line 945 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 143:
#line 947 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 144:
#line 952 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 145:
#line 956 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 146:
#line 957 "compilers/imcc/imcc.y"
    {
      if (IMCC_INFO(interp)->adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               IMCC_INFO(interp)->adv_named_id, (yyvsp[(1) - (1)].sr));
          IMCC_INFO(interp)->adv_named_id = NULL;
      }
      else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (1)].sr)); }
    break;

  case 147:
#line 964 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[(1) - (3)].s),(yyvsp[(3) - (3)].sr));}
    break;

  case 148:
#line 966 "compilers/imcc/imcc.y"
    {
      if (IMCC_INFO(interp)->adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               IMCC_INFO(interp)->adv_named_id,(yyvsp[(3) - (3)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
      }
      else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(3) - (3)].sr));    }
    break;

  case 149:
#line 973 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[(3) - (5)].s),(yyvsp[(5) - (5)].sr));}
    break;

  case 152:
#line 992 "compilers/imcc/imcc.y"
    { clear_state(interp); }
    break;

  case 153:
#line 997 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[(2) - (2)].i); }
    break;

  case 154:
#line 998 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 155:
#line 999 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 156:
#line 1000 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 157:
#line 1004 "compilers/imcc/imcc.y"
    {  (yyval.i) = NULL; }
    break;

  case 161:
#line 1014 "compilers/imcc/imcc.y"
    {
         (yyval.i) = iLABEL(interp, IMCC_INFO(interp)->cur_unit, mk_local_label(interp, (yyvsp[(1) - (1)].s)));
                   }
    break;

  case 162:
#line 1023 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(2) - (3)].i); }
    break;

  case 163:
#line 1025 "compilers/imcc/imcc.y"
    { if (yynerrs >= PARROT_MAX_RECOVER_ERRORS) {
                           IMCC_warning(interp, "Too many errors. Correct some first.\n");
                           YYABORT;
                       }
                       yyerrok; }
    break;

  case 164:
#line 1034 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[(1) - (1)].idlist);
         l->next = NULL;
         (yyval.idlist) = l;
     }
    break;

  case 165:
#line 1041 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[(3) - (3)].idlist);
         l->next = (yyvsp[(1) - (3)].idlist);
         (yyval.idlist) = l;
     }
    break;

  case 166:
#line 1050 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = (yyvsp[(1) - (2)].s);
         l->unique_reg = 1;
         (yyval.idlist) = l;
     }
    break;

  case 167:
#line 1058 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = (yyvsp[(1) - (1)].s);
         l->unique_reg = 0;
         (yyval.idlist) = l;
     }
    break;

  case 170:
#line 1069 "compilers/imcc/imcc.y"
    { push_namespace((yyvsp[(2) - (2)].s)); }
    break;

  case 171:
#line 1070 "compilers/imcc/imcc.y"
    { pop_namespace((yyvsp[(2) - (2)].s)); }
    break;

  case 172:
#line 1071 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 173:
#line 1072 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[(4) - (4)].idlist);
         while(l) {
             IdList* l1;
             if (l->unique_reg)
                 mk_ident_ur(interp, l->id, (yyvsp[(3) - (4)].t));
             else
                 mk_ident(interp, l->id, (yyvsp[(3) - (4)].t));
             l1 = l;
             l = l->next;
             free(l1);
         }
         is_def=0; (yyval.i)=0;
     }
    break;

  case 174:
#line 1087 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, (yyvsp[(4) - (4)].sr), (yyvsp[(2) - (4)].s)); (yyval.i) = 0;
                    }
    break;

  case 175:
#line 1090 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 176:
#line 1091 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 0);is_def=0; }
    break;

  case 178:
#line 1093 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 179:
#line 1094 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1);is_def=0; }
    break;

  case 180:
#line 1095 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;
                           IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isTAIL_CALL;
                           IMCC_INFO(interp)->cur_call = NULL;
                        }
    break;

  case 181:
#line 1099 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "branch",1, (yyvsp[(2) - (2)].sr)); }
    break;

  case 182:
#line 1101 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (2)].s), 0,
                              IMCC_INFO(interp) -> regs,
                              IMCC_INFO(interp) -> nargs,
                              IMCC_INFO(interp) -> keyvec, 1);
                       free((yyvsp[(1) - (2)].s)); }
    break;

  case 183:
#line 1107 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(2) - (2)].sr)); }
    break;

  case 184:
#line 1108 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
    break;

  case 185:
#line 1109 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 187:
#line 1111 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 188:
#line 1115 "compilers/imcc/imcc.y"
    { (yyval.t) = 'I'; }
    break;

  case 189:
#line 1116 "compilers/imcc/imcc.y"
    { (yyval.t) = 'N'; }
    break;

  case 190:
#line 1117 "compilers/imcc/imcc.y"
    { (yyval.t) = 'S'; }
    break;

  case 191:
#line 1118 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 192:
#line 1119 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 193:
#line 1120 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; free((yyvsp[(1) - (1)].s)); }
    break;

  case 194:
#line 1125 "compilers/imcc/imcc.y"
    {
             if (( IMCC_INFO(interp)->cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, (yyvsp[(1) - (1)].s), 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", (yyvsp[(1) - (1)].s));
            }
         }
    break;

  case 195:
#line 1136 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr));      }
    break;

  case 196:
#line 1138 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "not", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));      }
    break;

  case 197:
#line 1140 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "neg", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));      }
    break;

  case 198:
#line 1142 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bnot", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));     }
    break;

  case 199:
#line 1144 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "add", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 200:
#line 1146 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "sub", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 201:
#line 1148 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mul", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 202:
#line 1150 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "pow", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 203:
#line 1152 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "div", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 204:
#line 1154 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "fdiv", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 205:
#line 1156 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mod", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 206:
#line 1158 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "concat", 3, (yyvsp[(1) - (5)].sr),(yyvsp[(3) - (5)].sr),(yyvsp[(5) - (5)].sr)); }
    break;

  case 207:
#line 1160 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "iseq", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 208:
#line 1162 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isne", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 209:
#line 1164 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isgt", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 210:
#line 1166 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "islt", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 211:
#line 1168 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isle", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 212:
#line 1170 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isge", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 213:
#line 1172 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shl", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 214:
#line 1174 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shr", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 215:
#line 1176 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "lsr", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 216:
#line 1178 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "and", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 217:
#line 1180 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "or", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));   }
    break;

  case 218:
#line 1182 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "xor", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 219:
#line 1184 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "band", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 220:
#line 1186 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bor", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 221:
#line 1188 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bxor", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 222:
#line 1190 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(5) - (6)].sr)); }
    break;

  case 223:
#line 1192 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 224:
#line 1194 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].s), (yyvsp[(6) - (6)].sr), 1); }
    break;

  case 225:
#line 1196 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].s), (yyvsp[(6) - (7)].sr), 1); }
    break;

  case 226:
#line 1198 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].s), NULL, 1); }
    break;

  case 227:
#line 1200 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 228:
#line 1202 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (6)].sr), (yyvsp[(5) - (6)].sr)); }
    break;

  case 229:
#line 1204 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 230:
#line 1206 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); }
    break;

  case 231:
#line 1208 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set_addr",
                        2, (yyvsp[(1) - (4)].sr), mk_label_address(interp, (yyvsp[(4) - (4)].s))); }
    break;

  case 232:
#line 1211 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "find_global",2,(yyvsp[(1) - (4)].sr),(yyvsp[(4) - (4)].sr));}
    break;

  case 233:
#line 1213 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "store_global",2, (yyvsp[(2) - (4)].sr),(yyvsp[(4) - (4)].sr)); }
    break;

  case 234:
#line 1217 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 235:
#line 1219 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 236:
#line 1221 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); }
    break;

  case 237:
#line 1224 "compilers/imcc/imcc.y"
    {
            add_pcc_result((yyvsp[(3) - (3)].i)->r[0], (yyvsp[(1) - (3)].sr));
            IMCC_INFO(interp)->cur_call = NULL;
            (yyval.i) = 0;
         }
    break;

  case 238:
#line 1230 "compilers/imcc/imcc.y"
    {
            (yyval.i) = IMCC_create_itcall_label(interp);
         }
    break;

  case 239:
#line 1234 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[(6) - (9)].sr));
           IMCC_INFO(interp)->cur_call = NULL;
         }
    break;

  case 243:
#line 1242 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(1) - (3)].sr)); }
    break;

  case 244:
#line 1245 "compilers/imcc/imcc.y"
    { (yyval.i) = IMCC_create_itcall_label(interp);
                           (yyval.i)->type &= ~ITCALL; (yyval.i)->type |= ITRESULT; }
    break;

  case 245:
#line 1247 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 246:
#line 1252 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "add", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 247:
#line 1254 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "sub", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 248:
#line 1256 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mul", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 249:
#line 1258 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "div", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 250:
#line 1260 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mod", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 251:
#line 1262 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "fdiv", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 252:
#line 1264 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "concat", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 253:
#line 1266 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "band", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 254:
#line 1268 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bor", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 255:
#line 1270 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bxor", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 256:
#line 1272 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shr", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 257:
#line 1274 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shl", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 258:
#line 1276 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "lsr", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 259:
#line 1281 "compilers/imcc/imcc.y"
    { (yyval.i) = func_ins(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(3) - (4)].s),
                                   IMCC_INFO(interp) -> regs,
                                   IMCC_INFO(interp) -> nargs,
                                   IMCC_INFO(interp) -> keyvec, 1);
                     free((yyvsp[(3) - (4)].s));
                   }
    break;

  case 260:
#line 1289 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 261:
#line 1290 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 262:
#line 1291 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 263:
#line 1292 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (1)].sr);
                       if ((yyvsp[(1) - (1)].sr)->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 264:
#line 1297 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); }
    break;

  case 265:
#line 1298 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = mk_const(interp, (yyvsp[(3) - (3)].s), 'S'); }
    break;

  case 266:
#line 1299 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); }
    break;

  case 267:
#line 1302 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 268:
#line 1303 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 269:
#line 1308 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[(1) - (1)].sr));
        }
    break;

  case 270:
#line 1313 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[(2) - (5)].i); }
    break;

  case 271:
#line 1317 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 272:
#line 1318 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0;
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, IMCC_INFO(interp)->adv_named_id, (yyvsp[(3) - (3)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       }
       else add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr));
   }
    break;

  case 273:
#line 1325 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0;
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call,IMCC_INFO(interp)->adv_named_id,(yyvsp[(1) - (1)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       }
       else add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr));
   }
    break;

  case 274:
#line 1332 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0;
                                     add_pcc_named_arg(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(3) - (5)].s),(yyvsp[(5) - (5)].sr));}
    break;

  case 275:
#line 1334 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_named_arg(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(1) - (3)].s),(yyvsp[(3) - (3)].sr));}
    break;

  case 276:
#line 1338 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); }
    break;

  case 277:
#line 1342 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 278:
#line 1343 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); }
    break;

  case 279:
#line 1347 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT; }
    break;

  case 280:
#line 1348 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_NAMED; }
    break;

  case 281:
#line 1349 "compilers/imcc/imcc.y"
    { adv_named_set(interp,(yyvsp[(3) - (4)].s)); (yyval.t) = 0; }
    break;

  case 282:
#line 1352 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); }
    break;

  case 283:
#line 1356 "compilers/imcc/imcc.y"
    {
         (yyval.sr) = 0;
         if (IMCC_INFO(interp)->adv_named_id) {
             add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,IMCC_INFO(interp)->adv_named_id,(yyvsp[(3) - (3)].sr));
             IMCC_INFO(interp)->adv_named_id = NULL;
         }
         else add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr)); }
    break;

  case 284:
#line 1363 "compilers/imcc/imcc.y"
    {
        add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(3) - (5)].s),(yyvsp[(5) - (5)].sr)); }
    break;

  case 285:
#line 1365 "compilers/imcc/imcc.y"
    {
       (yyval.sr) = 0;
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,IMCC_INFO(interp)->adv_named_id,(yyvsp[(1) - (1)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       }
       else add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr)); }
    break;

  case 286:
#line 1372 "compilers/imcc/imcc.y"
    { add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(1) - (3)].s),(yyvsp[(3) - (3)].sr)); }
    break;

  case 287:
#line 1373 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 288:
#line 1378 "compilers/imcc/imcc.y"
    { (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 289:
#line 1380 "compilers/imcc/imcc.y"
    { (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, inv_op((yyvsp[(3) - (6)].s)), 3, (yyvsp[(2) - (6)].sr),(yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 290:
#line 1382 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 291:
#line 1384 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 292:
#line 1386 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 293:
#line 1388 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless",2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 294:
#line 1390 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 295:
#line 1392 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 296:
#line 1396 "compilers/imcc/imcc.y"
    {  (yyval.s) = "eq"; }
    break;

  case 297:
#line 1397 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ne"; }
    break;

  case 298:
#line 1398 "compilers/imcc/imcc.y"
    {  (yyval.s) = "gt"; }
    break;

  case 299:
#line 1399 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ge"; }
    break;

  case 300:
#line 1400 "compilers/imcc/imcc.y"
    {  (yyval.s) = "lt"; }
    break;

  case 301:
#line 1401 "compilers/imcc/imcc.y"
    {  (yyval.s) = "le"; }
    break;

  case 304:
#line 1410 "compilers/imcc/imcc.y"
    {  (yyval.sr) = NULL; }
    break;

  case 305:
#line 1411 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(1) - (1)].sr); }
    break;

  case 306:
#line 1415 "compilers/imcc/imcc.y"
    { (yyval.sr) = IMCC_INFO(interp)->regs[0]; }
    break;

  case 308:
#line 1420 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(1) - (1)].sr); }
    break;

  case 309:
#line 1422 "compilers/imcc/imcc.y"
    {
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(1) - (4)].sr);
                      IMCC_INFO(interp) -> keyvec |= KEY_BIT(IMCC_INFO(interp)->nargs);
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(3) - (4)].sr);
                      (yyval.sr) = (yyvsp[(1) - (4)].sr);
                   }
    break;

  case 310:
#line 1429 "compilers/imcc/imcc.y"
    {
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(2) - (3)].sr);
                      (yyval.sr) = (yyvsp[(2) - (3)].sr);
                   }
    break;

  case 312:
#line 1436 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 313:
#line 1437 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 314:
#line 1441 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 315:
#line 1442 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 316:
#line 1446 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 317:
#line 1447 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 322:
#line 1460 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->nkeys = 0;
                      IMCC_INFO(interp)->in_slice = 0; }
    break;

  case 323:
#line 1462 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp,
                                     IMCC_INFO(interp)->nkeys,
                                     IMCC_INFO(interp)->keys, 0); }
    break;

  case 324:
#line 1467 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->nkeys = 0;
                      IMCC_INFO(interp)->in_slice = 0; }
    break;

  case 325:
#line 1469 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp,
                                     IMCC_INFO(interp)->nkeys,
                                     IMCC_INFO(interp)->keys, 1); }
    break;

  case 326:
#line 1475 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(1) - (1)].sr); }
    break;

  case 327:
#line 1477 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(3) - (3)].sr);
                      (yyval.sr) = IMCC_INFO(interp)->keys[0]; }
    break;

  case 328:
#line 1479 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->in_slice = 1; }
    break;

  case 329:
#line 1480 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(4) - (4)].sr);
                       (yyval.sr) = IMCC_INFO(interp)->keys[0]; }
    break;

  case 330:
#line 1485 "compilers/imcc/imcc.y"
    { if (IMCC_INFO(interp)->in_slice) {
                         (yyvsp[(1) - (1)].sr)->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     (yyval.sr) = (yyvsp[(1) - (1)].sr);
                   }
    break;

  case 331:
#line 1491 "compilers/imcc/imcc.y"
    { (yyvsp[(1) - (3)].sr)->type |= VT_START_SLICE;
                     (yyvsp[(3) - (3)].sr)->type |= VT_END_SLICE;
                     IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(1) - (3)].sr);
                     (yyval.sr) = (yyvsp[(3) - (3)].sr); }
    break;

  case 332:
#line 1495 "compilers/imcc/imcc.y"
    { (yyvsp[(2) - (2)].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[(2) - (2)].sr); }
    break;

  case 333:
#line 1496 "compilers/imcc/imcc.y"
    { (yyvsp[(1) - (2)].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[(1) - (2)].sr); }
    break;

  case 334:
#line 1500 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'I'); }
    break;

  case 335:
#line 1501 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'N'); }
    break;

  case 336:
#line 1502 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); }
    break;

  case 337:
#line 1503 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'P'); }
    break;

  case 338:
#line 1504 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_pasm_reg(interp, (yyvsp[(1) - (1)].s));    }
    break;

  case 339:
#line 1508 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'I'); }
    break;

  case 340:
#line 1509 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'N'); }
    break;

  case 341:
#line 1510 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S'); }
    break;

  case 342:
#line 1511 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'U'); }
    break;

  case 343:
#line 1515 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); }
    break;

  case 344:
#line 1516 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S');  }
    break;


/* Line 1267 of yacc.c.  */
#line 4415 "compilers/imcc/imcparser.c"
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


#line 1521 "compilers/imcc/imcc.y"


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

