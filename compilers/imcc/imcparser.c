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
     INIT = 343,
     IMMEDIATE = 344,
     POSTCOMP = 345,
     METHOD = 346,
     ANON = 347,
     OUTER = 348,
     NEED_LEX = 349,
     MULTI = 350,
     VTABLE_METHOD = 351,
     LOADLIB = 352,
     UNIQUE_REG = 353,
     LABEL = 354,
     EMIT = 355,
     EOM = 356,
     IREG = 357,
     NREG = 358,
     SREG = 359,
     PREG = 360,
     IDENTIFIER = 361,
     REG = 362,
     MACRO = 363,
     ENDM = 364,
     STRINGC = 365,
     INTC = 366,
     FLOATC = 367,
     USTRINGC = 368,
     PARROT_OP = 369,
     VAR = 370,
     LINECOMMENT = 371,
     FILECOMMENT = 372,
     DOT = 373,
     CONCAT = 374,
     POINTY = 375
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
#define INIT 343
#define IMMEDIATE 344
#define POSTCOMP 345
#define METHOD 346
#define ANON 347
#define OUTER 348
#define NEED_LEX 349
#define MULTI 350
#define VTABLE_METHOD 351
#define LOADLIB 352
#define UNIQUE_REG 353
#define LABEL 354
#define EMIT 355
#define EOM 356
#define IREG 357
#define NREG 358
#define SREG 359
#define PREG 360
#define IDENTIFIER 361
#define REG 362
#define MACRO 363
#define ENDM 364
#define STRINGC 365
#define INTC 366
#define FLOATC 367
#define USTRINGC 368
#define PARROT_OP 369
#define VAR 370
#define LINECOMMENT 371
#define FILECOMMENT 372
#define DOT 373
#define CONCAT 374
#define POINTY 375




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
#line 728 "compilers/imcc/imcparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 741 "compilers/imcc/imcparser.c"

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
#define YYLAST   825

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  137
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  120
/* YYNRULES -- Number of rules.  */
#define YYNRULES  345
/* YYNRULES -- Number of states.  */
#define YYNSTATES  598

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
     125,   126,   131,   130,     2,   128,     2,   132,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   136,
       2,   122,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   123,     2,   124,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   135,     2,   129,     2,     2,     2,
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
     948,   950,   952,   957,   960,   964,   970,   972,   976,   977,
     984,   991,   997,  1003,  1008,  1013,  1018,  1023,  1025,  1027,
    1029,  1031,  1033,  1035,  1037,  1039,  1040,  1042,  1046,  1048,
    1050,  1055,  1059,  1061,  1063,  1065,  1067,  1069,  1071,  1073,
    1075,  1077,  1079,  1081,  1082,  1085,  1086,  1089,  1091,  1095,
    1096,  1101,  1103,  1107,  1110,  1113,  1115,  1117,  1119,  1121,
    1123,  1125,  1127,  1129,  1131,  1133
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     138,     0,    -1,   139,    -1,   140,    -1,   139,   140,    -1,
     159,    -1,   145,    -1,   144,    -1,   161,    -1,   176,    -1,
     156,    -1,   109,     4,    -1,   141,    -1,     4,    -1,     6,
     142,     4,    -1,   143,     4,    -1,    98,   111,     4,    -1,
       7,   112,    -1,     8,   111,    73,   111,    -1,     9,   112,
      73,   112,    -1,    62,   218,   107,    -1,    62,   218,   107,
     122,   255,    -1,    -1,    30,   146,   218,   107,   122,   255,
      -1,    -1,    30,   148,   112,   245,   122,   149,    -1,   111,
      -1,   114,    -1,   151,    -1,   150,   151,    -1,   208,   152,
       4,    -1,   109,     4,    -1,   118,    -1,   117,    -1,   159,
      -1,   147,    -1,   141,    -1,    -1,   153,   115,   155,    -1,
      -1,    79,   154,   184,   100,    -1,    14,   246,    -1,    29,
     111,    73,   108,    -1,    -1,   239,    -1,    -1,   101,   157,
     158,   102,    -1,    -1,   150,    -1,    23,   160,     4,    -1,
     123,   247,   124,    -1,    -1,    -1,    -1,    -1,    26,   162,
     242,   163,   184,     4,   164,   165,   175,    74,    -1,    -1,
       4,    -1,   165,   166,     4,    -1,    -1,     5,   167,   168,
      -1,   218,   107,   193,    -1,   218,   111,    20,   107,   193,
      -1,    -1,    73,    -1,    96,   125,   173,   126,    -1,    94,
     125,   111,   126,    -1,    94,   125,   107,   126,    -1,    97,
      -1,    97,   125,   111,   126,    -1,    -1,   173,    73,   174,
      -1,   174,    -1,    50,    -1,    51,    -1,    53,    -1,    52,
      -1,   107,    -1,   111,    -1,   123,   247,   124,    -1,    -1,
     205,    -1,    -1,    -1,    -1,    79,   177,   107,   178,   184,
       4,   179,   165,   175,    74,    -1,    -1,    76,     4,   181,
     188,   183,   187,   182,   190,    77,    -1,    -1,   210,     4,
      -1,    -1,    86,   246,     4,    -1,    -1,   185,    -1,   186,
      -1,   185,   169,   186,    -1,    88,    -1,    89,    -1,    87,
      -1,    90,    -1,    91,    -1,    93,    -1,    92,    -1,    95,
      -1,   170,    -1,   171,    -1,   172,    -1,    78,   246,    73,
     246,     4,    -1,    78,   246,     4,    -1,    84,   246,     4,
      -1,    85,   238,     4,    -1,    85,   111,     4,    -1,    85,
     238,    73,   246,     4,    -1,    85,   111,    73,   246,     4,
      -1,    -1,   188,   189,     4,    -1,    11,   231,    -1,    -1,
     190,   191,     4,    -1,    65,   238,   193,    -1,    -1,    28,
     192,   218,   213,    -1,    -1,   193,   194,    -1,    16,    -1,
      17,    -1,    18,    -1,    19,    -1,    19,   125,   111,   126,
      -1,    99,    -1,    80,    -1,    82,    -1,    81,    -1,    83,
      -1,    -1,   195,     4,   198,   199,   196,    -1,   201,    -1,
      -1,   199,     4,    -1,   199,   200,     4,    -1,    66,   246,
     232,    -1,    -1,    66,   125,   202,   204,   126,    -1,    -1,
      67,   125,   203,   204,   126,    -1,    -1,   231,    -1,   111,
      20,   246,    -1,   204,    73,   231,    -1,   204,    73,   111,
      20,   246,    -1,   207,    -1,   205,   207,    -1,    -1,   206,
     211,    -1,   109,     4,    -1,   118,    -1,   117,    -1,    -1,
     209,    -1,   209,   210,    -1,   210,    -1,   100,    -1,   208,
     214,     4,    -1,     1,     4,    -1,   213,    -1,   212,    73,
     213,    -1,   107,    99,    -1,   107,    -1,   220,    -1,   236,
      -1,    23,   107,    -1,    24,   107,    -1,    -1,    28,   215,
     218,   212,    -1,    29,   111,    73,   238,    -1,    -1,    30,
     216,   218,   107,   122,   255,    -1,   147,    -1,    -1,    33,
     217,   218,   107,   122,   255,    -1,    66,   228,    -1,    10,
     244,    -1,   115,   239,    -1,    14,   246,    -1,   228,    -1,
     180,    -1,   197,    -1,    -1,    50,    -1,    51,    -1,    52,
      -1,    53,    -1,    54,    -1,   219,    -1,   107,    -1,   238,
     122,   246,    -1,   238,   122,   127,   246,    -1,   238,   122,
     128,   246,    -1,   238,   122,   129,   246,    -1,   238,   122,
     246,   130,   246,    -1,   238,   122,   246,   128,   246,    -1,
     238,   122,   246,   131,   246,    -1,   238,   122,   246,    69,
     246,    -1,   238,   122,   246,   132,   246,    -1,   238,   122,
     246,    42,   246,    -1,   238,   122,   246,   133,   246,    -1,
     238,   122,   246,   120,   246,    -1,   238,   122,   246,    56,
     246,    -1,   238,   122,   246,    57,   246,    -1,   238,   122,
     246,    58,   246,    -1,   238,   122,   246,    60,   246,    -1,
     238,   122,   246,    61,   246,    -1,   238,   122,   246,    59,
     246,    -1,   238,   122,   246,    48,   246,    -1,   238,   122,
     246,    49,   246,    -1,   238,   122,   246,    70,   246,    -1,
     238,   122,   246,    71,   246,    -1,   238,   122,   246,    72,
     246,    -1,   238,   122,   246,    55,   246,    -1,   238,   122,
     246,   134,   246,    -1,   238,   122,   246,   135,   246,    -1,
     238,   122,   246,   129,   246,    -1,   238,   122,   246,   123,
     247,   124,    -1,   238,   123,   247,   124,   122,   246,    -1,
     238,   122,    22,   219,    73,   246,    -1,   238,   122,    22,
     219,   123,   247,   124,    -1,   238,   122,    22,   219,    -1,
     238,   122,    22,   246,    -1,   238,   122,    22,   123,   247,
     124,    -1,   238,   122,    22,   246,    73,   246,    -1,   238,
     122,    22,   246,   123,   247,   124,    -1,   238,   122,    64,
     107,    -1,   238,   122,    63,   256,    -1,    63,   256,   122,
     246,    -1,    22,   238,    73,   246,    -1,    22,   238,    73,
     246,    73,   246,    -1,    22,   238,    73,   246,   123,   247,
     124,    -1,   238,   122,   228,    -1,    -1,   125,   221,   235,
     126,   122,   226,   125,   230,   126,    -1,   222,    -1,   224,
      -1,   225,    -1,   238,   122,    14,    -1,    -1,    68,   223,
     125,   235,   126,    -1,   238,    34,   246,    -1,   238,    35,
     246,    -1,   238,    36,   246,    -1,   238,    37,   246,    -1,
     238,    44,   246,    -1,   238,    43,   246,    -1,   238,    38,
     246,    -1,   238,    39,   246,    -1,   238,    40,   246,    -1,
     238,    41,   246,    -1,   238,    45,   246,    -1,   238,    46,
     246,    -1,   238,    47,   246,    -1,   238,   122,   115,   155,
      -1,   107,    -1,   111,    -1,   114,    -1,   238,    -1,   238,
     227,   243,    -1,   238,   227,   111,    -1,   238,   227,   238,
      -1,   121,    -1,   119,    -1,    -1,   226,   229,   125,   230,
     126,    -1,    -1,   230,    73,   231,    -1,   231,    -1,   230,
      73,   111,    20,   246,    -1,   111,    20,   246,    -1,   246,
     232,    -1,    -1,   232,   233,    -1,    15,    -1,    21,    -1,
      19,    -1,    19,   125,   111,   126,    -1,   238,   193,    -1,
     235,    73,   234,    -1,   235,    73,   111,    20,   238,    -1,
     234,    -1,   111,    20,   238,    -1,    -1,    12,   246,   237,
     246,    10,   244,    -1,    13,   246,   237,   246,    10,   244,
      -1,    12,    14,   246,    10,   244,    -1,    13,    14,   246,
      10,   244,    -1,    12,   246,    10,   244,    -1,    13,   246,
      10,   244,    -1,    12,   246,    73,   244,    -1,    13,   246,
      73,   244,    -1,    56,    -1,    57,    -1,    58,    -1,    59,
      -1,    60,    -1,    61,    -1,   116,    -1,   254,    -1,    -1,
     240,    -1,   240,    73,   241,    -1,   241,    -1,   245,    -1,
     238,   123,   247,   124,    -1,   123,   249,   124,    -1,   243,
      -1,   111,    -1,   114,    -1,   107,    -1,   115,    -1,   107,
      -1,   115,    -1,   244,    -1,   246,    -1,   238,    -1,   255,
      -1,    -1,   248,   251,    -1,    -1,   250,   251,    -1,   253,
      -1,   251,   136,   253,    -1,    -1,   251,    73,   252,   253,
      -1,   246,    -1,   246,    75,   246,    -1,    75,   246,    -1,
     246,    75,    -1,   103,    -1,   104,    -1,   105,    -1,   106,
      -1,   108,    -1,   112,    -1,   113,    -1,   111,    -1,   114,
      -1,   105,    -1,   111,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   477,   477,   481,   482,   486,   487,   488,   489,   492,
     495,   498,   499,   500,   503,   504,   505,   508,   516,   525,
     534,   540,   549,   549,   554,   554,   558,   559,   563,   564,
     568,   569,   570,   571,   572,   573,   574,   577,   577,   584,
     583,   594,   596,   601,   605,   609,   609,   619,   621,   625,
     640,   641,   646,   650,   653,   645,   659,   660,   661,   672,
     672,   676,   681,   691,   692,   696,   699,   702,   707,   711,
     718,   719,   720,   724,   725,   726,   727,   728,   738,   748,
     751,   753,   757,   758,   759,   757,   766,   765,   798,   799,
     803,   804,   809,   810,   814,   815,   819,   820,   821,   822,
     823,   824,   825,   826,   827,   828,   829,   833,   838,   840,
     845,   847,   849,   853,   861,   862,   866,   871,   872,   876,
     877,   877,   890,   891,   895,   896,   897,   898,   899,   900,
     905,   906,   910,   911,   916,   915,   920,   926,   927,   930,
     936,   941,   940,   948,   947,   957,   958,   965,   967,   974,
     980,   981,   993,   997,   999,  1000,  1001,  1005,  1006,  1010,
    1011,  1015,  1023,  1025,  1034,  1041,  1050,  1058,  1068,  1069,
    1070,  1071,  1072,  1072,  1087,  1091,  1091,  1093,  1094,  1094,
    1096,  1100,  1101,  1107,  1109,  1110,  1111,  1112,  1116,  1117,
    1118,  1119,  1120,  1121,  1125,  1136,  1138,  1140,  1142,  1144,
    1146,  1148,  1150,  1152,  1154,  1156,  1158,  1160,  1162,  1164,
    1166,  1168,  1170,  1172,  1174,  1176,  1178,  1180,  1182,  1184,
    1186,  1188,  1190,  1192,  1194,  1196,  1198,  1200,  1202,  1204,
    1206,  1208,  1211,  1213,  1217,  1219,  1221,  1224,  1231,  1230,
    1239,  1240,  1241,  1242,  1246,  1246,  1252,  1254,  1256,  1258,
    1260,  1262,  1264,  1266,  1268,  1270,  1272,  1274,  1276,  1281,
    1290,  1291,  1292,  1293,  1298,  1299,  1300,  1303,  1304,  1309,
    1308,  1318,  1319,  1326,  1333,  1335,  1339,  1343,  1344,  1348,
    1349,  1350,  1351,  1354,  1358,  1365,  1367,  1374,  1375,  1379,
    1381,  1383,  1385,  1387,  1389,  1391,  1393,  1398,  1399,  1400,
    1401,  1402,  1403,  1407,  1408,  1412,  1413,  1417,  1418,  1422,
    1423,  1430,  1437,  1438,  1439,  1443,  1444,  1448,  1449,  1453,
    1454,  1458,  1459,  1462,  1462,  1469,  1469,  1477,  1478,  1481,
    1481,  1487,  1492,  1497,  1498,  1502,  1503,  1504,  1505,  1506,
    1510,  1511,  1512,  1513,  1517,  1518
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
  "METH_CALL", "INVOCANT", "MAIN", "LOAD", "INIT", "IMMEDIATE", "POSTCOMP",
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
     374,   375,    61,    91,    93,    40,    41,    33,    45,   126,
      43,    42,    47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   137,   138,   139,   139,   140,   140,   140,   140,   140,
     140,   140,   140,   140,   141,   141,   141,   142,   143,   143,
     144,   144,   146,   145,   148,   147,   149,   149,   150,   150,
     151,   151,   151,   151,   151,   151,   151,   153,   152,   154,
     152,   152,   152,   152,   155,   157,   156,   158,   158,   159,
     160,   160,   162,   163,   164,   161,   165,   165,   165,   167,
     166,   168,   168,   169,   169,   170,   171,   171,   172,   172,
     173,   173,   173,   174,   174,   174,   174,   174,   174,   174,
     175,   175,   177,   178,   179,   176,   181,   180,   182,   182,
     183,   183,   184,   184,   185,   185,   186,   186,   186,   186,
     186,   186,   186,   186,   186,   186,   186,   187,   187,   187,
     187,   187,   187,   187,   188,   188,   189,   190,   190,   191,
     192,   191,   193,   193,   194,   194,   194,   194,   194,   194,
     195,   195,   196,   196,   198,   197,   197,   199,   199,   199,
     200,   202,   201,   203,   201,   204,   204,   204,   204,   204,
     205,   205,   206,   207,   207,   207,   207,   208,   208,   209,
     209,   210,   211,   211,   212,   212,   213,   213,   214,   214,
     214,   214,   215,   214,   214,   216,   214,   214,   217,   214,
     214,   214,   214,   214,   214,   214,   214,   214,   218,   218,
     218,   218,   218,   218,   219,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   220,   220,   220,   221,   220,
     220,   220,   220,   220,   223,   222,   224,   224,   224,   224,
     224,   224,   224,   224,   224,   224,   224,   224,   224,   225,
     226,   226,   226,   226,   226,   226,   226,   227,   227,   229,
     228,   230,   230,   230,   230,   230,   231,   232,   232,   233,
     233,   233,   233,   234,   235,   235,   235,   235,   235,   236,
     236,   236,   236,   236,   236,   236,   236,   237,   237,   237,
     237,   237,   237,   238,   238,   239,   239,   240,   240,   241,
     241,   241,   242,   242,   242,   243,   243,   244,   244,   245,
     245,   246,   246,   248,   247,   250,   249,   251,   251,   252,
     251,   253,   253,   253,   253,   254,   254,   254,   254,   254,
     255,   255,   255,   255,   256,   256
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
       1,     1,     4,     2,     3,     5,     1,     3,     0,     6,
       6,     5,     5,     4,     4,     4,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     0,     1,     3,     1,     1,
       4,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     0,     2,     0,     2,     1,     3,     0,
       4,     1,     3,     2,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    13,     0,     0,     0,    51,    52,    22,     0,    82,
       0,    45,     0,     0,     2,     3,    12,     0,     7,     6,
      10,     5,     8,     9,     0,     0,     0,     0,   323,     0,
       0,     0,   188,   189,   190,   191,   192,   194,     0,   193,
       0,     0,   157,    11,     1,     4,    15,    17,    14,     0,
       0,     0,     0,    49,   315,   313,   314,   316,    53,   312,
       0,    20,    83,    16,    24,   161,     0,    33,    32,    36,
      35,   157,    28,     0,    34,    37,   158,   160,    18,    19,
      50,     0,   335,   336,   337,   338,   339,   342,   340,   341,
     343,   303,   321,   331,   324,   327,   304,   322,    92,     0,
       0,    92,     0,    31,    29,    46,     0,     0,    39,     0,
       0,   159,   333,   334,   329,     0,    98,    96,    97,    99,
     100,   102,   101,     0,   103,     0,    68,   104,   105,   106,
       0,    63,    94,     0,    21,     0,     0,    41,     0,    92,
      30,   305,   332,     0,   328,     0,    70,     0,    54,    64,
       0,    23,    84,   317,   318,   319,     0,   320,     0,     0,
     325,    38,   321,    44,   306,   308,   309,   330,     0,     0,
      73,    74,    76,    75,    77,    78,   323,     0,    72,     0,
      56,    95,    56,     0,    42,    40,     0,     0,   323,     0,
      67,    66,     0,     0,    65,    69,    57,   152,   152,    26,
      27,    25,   311,   326,     0,   307,    79,    71,    59,     0,
     156,   155,     0,     0,   152,     0,   150,     0,   310,     0,
     154,    58,    55,   151,     0,   187,   153,    85,    60,     0,
     163,     0,     0,     0,     0,     0,     0,     0,   172,     0,
     175,   178,     0,     0,     0,   244,     0,   130,   131,   260,
     261,   262,   305,   238,   177,   185,     0,   186,   136,     0,
     168,   240,   241,   242,   269,   184,   169,   263,   122,     0,
     181,     0,     0,     0,     0,   183,     0,   170,   171,     0,
       0,     0,     0,   344,   345,     0,   141,   180,   263,   143,
       0,    86,   182,   288,   134,   162,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     268,   267,     0,   323,     0,    61,     0,     0,     0,   297,
     298,   299,   300,   301,   302,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   145,   145,   288,
     114,     0,   286,     0,   122,   137,   271,   246,   247,   248,
     249,   252,   253,   254,   255,   251,   250,   256,   257,   258,
     243,     0,     0,     0,   342,   343,   305,     0,     0,     0,
     237,   321,   195,     0,   265,   266,   264,   124,   125,   126,
     127,   129,   123,   122,     0,   293,   295,     0,     0,   294,
     296,     0,   234,   167,   173,   164,   174,     0,     0,   233,
     342,     0,   146,   277,     0,     0,    90,     0,     0,     0,
     283,     0,   342,     0,   273,   323,   226,   227,   232,   231,
     259,   196,   197,   198,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   323,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      62,   291,     0,   292,     0,     0,   323,   166,     0,     0,
       0,     0,     0,   142,   276,   144,   245,     0,     0,     0,
       0,   287,     0,   284,     0,   138,     0,   132,   133,   135,
       0,     0,     0,   270,     0,     0,   323,     0,   323,   204,
     213,   214,   218,   207,   208,   209,   212,   210,   211,   202,
     215,   216,   217,   206,     0,   200,   221,   199,   201,   203,
     205,   219,   220,     0,     0,   289,   290,   235,     0,   165,
     176,   179,   147,   342,   148,   279,   281,   280,   278,   116,
       0,     0,     0,     0,    88,   115,     0,     0,   277,   139,
     275,   342,   272,   228,   224,     0,   229,     0,   222,   223,
     128,   236,     0,     0,    91,     0,     0,     0,     0,   117,
       0,   285,   271,   140,     0,   225,   230,   149,     0,   108,
       0,   109,   111,     0,   110,     0,     0,    89,     0,   274,
     282,     0,     0,     0,   120,     0,    87,     0,   239,   107,
     113,   112,     0,   122,   118,     0,   119,   121
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    13,    14,    15,    16,    25,    17,    18,    19,    31,
      70,   102,   201,    71,    72,   109,   110,   139,   161,    20,
      42,    73,    21,    29,    22,    30,    98,   180,   197,   212,
     219,   228,   150,   127,   128,   129,   177,   178,   213,    23,
      40,   101,   182,   255,   340,   559,   469,   130,   131,   132,
     534,   406,   470,   576,   587,   592,   315,   382,   256,   479,
     257,   345,   411,   480,   258,   337,   338,   401,   214,   215,
     216,    75,    76,    77,   226,   394,   395,   259,   279,   281,
     282,    38,    39,   260,   293,   261,   290,   262,   263,   264,
     314,   265,   296,   413,   402,   464,   528,   342,   343,   266,
     326,    92,   163,   164,   165,    58,    59,   155,   166,   403,
      51,    52,   186,   187,    94,   143,    95,    96,    97,   285
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -451
static const yytype_int16 yypact[] =
{
     206,  -451,    25,   -88,   -59,   -86,  -451,  -451,    86,  -451,
     -37,  -451,    37,    58,   206,  -451,  -451,    67,  -451,  -451,
    -451,  -451,  -451,  -451,   -24,    95,    -8,    29,  -451,   100,
     167,    86,  -451,  -451,  -451,  -451,  -451,  -451,    41,  -451,
      48,   152,    16,  -451,  -451,  -451,  -451,  -451,  -451,    52,
      57,    40,   197,  -451,  -451,  -451,  -451,  -451,  -451,  -451,
      70,    60,  -451,  -451,  -451,  -451,   176,  -451,  -451,  -451,
    -451,    83,  -451,    85,  -451,    15,   103,  -451,  -451,  -451,
    -451,   560,  -451,  -451,  -451,  -451,  -451,  -451,  -451,  -451,
    -451,  -451,  -451,   129,   -58,  -451,  -451,  -451,   728,    99,
     183,   728,    96,  -451,  -451,  -451,   560,   112,  -451,   220,
     116,  -451,  -451,   560,  -451,   197,  -451,  -451,  -451,  -451,
    -451,  -451,  -451,   108,  -451,   109,   115,  -451,  -451,  -451,
     238,     3,  -451,   183,  -451,   240,   605,  -451,   173,   728,
    -451,   544,  -451,   197,  -451,   -71,   166,   138,  -451,  -451,
     728,  -451,  -451,  -451,  -451,  -451,   149,  -451,   162,   175,
    -451,  -451,   153,  -451,   213,  -451,  -451,  -451,   164,   165,
    -451,  -451,  -451,  -451,  -451,  -451,  -451,   -53,  -451,   172,
     288,  -451,   288,     9,  -451,  -451,   182,   197,  -451,   544,
    -451,  -451,   188,   166,  -451,  -451,  -451,    12,    12,  -451,
    -451,  -451,  -451,   -58,   193,  -451,  -451,  -451,  -451,   295,
    -451,  -451,   315,   246,    61,   468,  -451,   247,  -451,    86,
    -451,  -451,  -451,  -451,   318,   529,  -451,  -451,  -451,    36,
    -451,   -60,   225,   239,   560,   316,   227,   228,  -451,   216,
     236,  -451,    21,   399,   207,  -451,   336,  -451,  -451,  -451,
    -451,  -451,   544,  -451,  -451,  -451,   345,  -451,  -451,   350,
    -451,  -451,  -451,  -451,  -451,  -451,  -451,   329,  -451,   337,
    -451,   560,   370,   560,   404,  -451,   283,  -451,  -451,    86,
     285,    86,    86,  -451,  -451,   237,  -451,  -451,   -65,  -451,
     235,  -451,  -451,   483,  -451,  -451,   252,   560,   560,   560,
     560,   560,   560,   560,   560,   560,   560,   560,   560,   560,
    -451,  -451,    46,  -451,    91,    32,   264,   368,   -60,  -451,
    -451,  -451,  -451,  -451,  -451,   -60,   560,   369,   -60,   -60,
     560,   560,   289,   316,   299,   300,   560,   619,   619,   483,
    -451,   389,  -451,   -47,  -451,  -451,   633,  -451,  -451,  -451,
    -451,  -451,  -451,  -451,  -451,  -451,  -451,  -451,  -451,  -451,
    -451,   591,    21,   303,   286,   290,   544,   560,   560,   560,
    -451,    47,   558,   292,  -451,  -451,  -451,  -451,  -451,  -451,
     298,  -451,  -451,  -451,   -60,  -451,  -451,   403,   -60,  -451,
    -451,   407,   -46,   335,   362,  -451,  -451,   314,   317,  -451,
     417,   -30,  -451,  -451,   -21,    -9,    -1,   316,   689,   319,
      32,     1,   420,    -7,  -451,  -451,   -40,   -28,  -451,  -451,
    -451,  -451,  -451,  -451,   560,   560,   560,   560,   560,   560,
     560,   560,   560,   560,   560,   560,   560,   560,   560,  -451,
     560,   560,   560,   560,   560,   560,   560,   560,   323,   338,
      32,  -451,   -60,  -451,   -60,   560,  -451,  -451,   289,   183,
     183,   560,   647,  -451,   226,  -451,  -451,   560,   560,   142,
     442,  -451,   427,  -451,   675,  -451,   560,  -451,  -451,  -451,
     449,   560,   661,  -451,   330,   560,  -451,   560,  -451,  -451,
    -451,  -451,  -451,  -451,  -451,  -451,  -451,  -451,  -451,  -451,
    -451,  -451,  -451,  -451,   331,  -451,  -451,  -451,  -451,  -451,
    -451,  -451,  -451,   560,   332,  -451,  -451,  -451,   342,  -451,
    -451,  -451,  -451,   436,  -451,  -451,   343,  -451,  -451,  -451,
     463,   560,   560,   698,   103,  -451,   316,   346,  -451,  -451,
    -451,   453,  -451,  -451,  -451,   351,  -451,   352,  -451,  -451,
    -451,  -451,   560,   363,  -451,     7,   475,     8,    14,  -451,
     479,  -451,   633,   226,   560,  -451,  -451,  -451,   358,  -451,
     560,  -451,  -451,   560,  -451,   560,   148,  -451,     2,  -451,
    -451,   481,   482,   489,  -451,   316,  -451,   490,  -451,  -451,
    -451,  -451,    86,  -451,  -451,   289,    32,  -451
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -451,  -451,  -451,   473,   -14,  -451,  -451,  -451,  -451,  -451,
     270,  -451,  -451,  -451,   428,  -451,  -451,  -451,   134,  -451,
    -451,  -451,   -12,  -451,  -451,  -451,  -451,  -451,   326,  -451,
    -451,  -451,  -451,  -451,  -451,  -451,  -451,   321,   313,  -451,
    -451,  -451,  -451,  -451,  -451,  -451,  -451,   -70,  -451,   366,
    -451,  -451,  -451,  -451,  -451,  -451,  -341,  -451,  -451,  -451,
    -451,  -451,  -451,  -451,  -451,  -451,  -451,   174,  -451,  -451,
     304,   302,  -451,   -75,  -451,  -451,  -450,  -451,  -451,  -451,
    -451,   -31,   158,  -451,  -451,  -451,  -451,  -451,  -451,    49,
    -451,  -222,  -451,   -42,  -340,   -16,  -451,   117,   187,  -451,
     254,  -128,   277,  -451,   344,  -451,   223,  -217,   402,   -43,
    -172,  -451,  -451,  -451,   353,  -451,   -81,  -451,   -98,   184
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -264
static const yytype_int16 yytable[] =
{
      60,   111,   134,   410,   192,   475,   414,   -93,   519,    93,
     467,   569,   572,   162,   270,   114,   204,   208,   574,   -43,
     193,   287,     2,    26,     3,     4,   408,   455,    69,   106,
      74,   135,    24,   485,   144,   151,   168,    28,   112,     5,
     169,    43,   450,   462,   107,   487,    64,   153,   377,   378,
     379,   380,   462,    27,   310,   154,   311,    69,    44,    74,
     360,   162,   167,   137,   408,    49,   482,   476,   361,   159,
     142,    46,    93,   194,    41,   482,   149,   456,   115,   409,
     570,   573,   477,   486,   478,   468,   -80,   575,    47,     2,
     370,     3,     4,   157,   108,   488,   463,   267,   157,    48,
      93,   385,    50,   -93,    53,   465,     5,   276,   386,   362,
     363,   389,   390,    64,    10,   288,    65,   466,   -47,   483,
     199,   209,   524,   200,   162,    66,   283,   529,   588,   210,
     211,   381,   284,    67,    68,   -81,    32,    33,    34,    35,
      36,   373,   542,   268,    93,   597,   157,   269,    61,    82,
      83,    84,    85,   249,    86,    62,    63,   364,    88,    89,
     365,   366,    91,    78,    80,   344,   310,   451,   311,    79,
     209,   453,  -263,   367,   368,   369,   584,    99,   210,   211,
     103,    10,   100,    65,   371,   -48,   375,   105,   229,   272,
     274,   275,    66,    37,    82,    83,    84,    85,    54,    86,
      67,    68,   374,    65,   113,   396,    57,    91,   136,   157,
       1,   344,     2,   585,     3,     4,   170,   171,   172,   173,
     531,   133,   414,   138,   140,   586,   532,   533,   317,     5,
     327,   141,     6,   145,   146,   515,     7,   516,   162,   271,
     147,   525,   148,   484,   152,   526,   158,   527,   332,   179,
     334,   335,   596,   273,   347,   348,   349,   350,   351,   352,
     353,   354,   355,   356,   357,   358,   359,   504,     8,   372,
     184,   183,    81,   174,    54,   185,   188,   175,    55,   471,
     344,    56,    57,   387,   518,     9,   189,   391,   392,   176,
     190,   191,   196,   399,    87,    88,    89,    90,   195,   220,
      82,    83,    84,    85,    10,    86,   202,    11,    87,    88,
      89,    90,   206,    91,   545,    12,   547,   218,   417,   221,
     222,   227,   230,   157,   421,   422,   423,   280,    82,    83,
      84,    85,   289,    86,   277,   278,    87,    88,    89,    90,
     291,    91,    82,    83,    84,    85,   288,    86,   -24,   294,
      87,    88,    89,    90,   295,    91,   331,   316,   333,   336,
     339,   520,   521,   297,   298,   299,   300,   301,   302,   303,
     304,   383,   305,   306,   307,   308,   309,   346,   384,   388,
     318,   489,   490,   491,   492,   493,   494,   495,   496,   497,
     498,   499,   500,   501,   502,   503,   393,   505,   506,   507,
     508,   509,   510,   511,   512,   558,   397,   398,   561,   407,
     419,  -261,   517,   452,   328,  -262,   448,   454,   522,    82,
      83,    84,    85,   449,    86,   530,   319,   320,   321,   322,
     323,   324,    91,   538,   457,   458,   459,   461,   540,   460,
     481,   474,   544,   325,   546,   513,   535,   536,   310,   514,
     311,   312,   313,   539,   543,   548,   552,   593,   550,   560,
     319,   320,   321,   322,   323,   324,   551,   554,   553,   224,
     549,   562,  -157,   564,   568,   565,   566,   329,  -157,   571,
    -157,  -157,  -157,   577,   580,   589,   590,    45,   555,   556,
    -157,  -157,  -157,   591,   594,   254,  -157,  -157,  -157,   104,
     420,  -157,    82,    83,    84,    85,   249,    86,   198,   567,
     250,   217,   404,   251,   207,    91,   181,   225,   223,   416,
     578,   579,   563,   537,   286,   473,   405,   581,   330,   292,
     582,  -157,   583,   205,  -157,  -157,  -157,   376,   156,   231,
     203,   232,   233,   234,  -157,     0,   418,     0,  -157,     0,
    -157,   235,   236,   237,     0,     0,     0,   238,   239,   240,
       0,   595,   241,     0,     0,     0,     0,     0,    65,     0,
       0,  -157,  -157,  -157,  -157,  -157,  -157,     0,     0,  -157,
       0,     0,  -157,  -157,  -157,     0,    82,    83,    84,    85,
       0,    86,   242,  -157,   341,   243,   244,   245,     0,    91,
     424,     0,     0,     0,     0,   246,   425,   426,     0,   247,
       0,   248,     0,   427,   428,   429,   430,   431,   432,   433,
       0,     0,     0,     0,     0,     0,     0,   434,   435,   436,
     437,     0,    82,    83,    84,    85,   249,    86,     0,     0,
     250,     0,     0,   251,   252,    91,     0,    82,    83,    84,
      85,   153,    86,     0,   253,    87,    88,    89,    90,   154,
      91,     0,     0,    82,    83,    84,    85,   160,    86,     0,
       0,    87,    88,    89,    90,     0,    91,     0,   438,     0,
       0,   439,     0,     0,     0,     0,   440,   441,   442,   443,
     444,   445,   446,   447,    82,    83,    84,    85,    37,    86,
       0,     0,    87,    88,    89,    90,     0,    91,    82,    83,
      84,    85,   153,    86,   415,     0,    87,    88,    89,    90,
     154,    91,    82,    83,    84,    85,     0,    86,     0,     0,
     400,    88,    89,    90,     0,    91,    82,    83,    84,    85,
       0,    86,     0,     0,   412,    88,    89,    90,     0,    91,
      82,    83,    84,    85,     0,    86,     0,     0,   523,    88,
      89,    90,     0,    91,    82,    83,    84,    85,     0,    86,
       0,     0,   541,    88,    89,    90,     0,    91,    82,    83,
      84,    85,   249,    86,     0,     0,   250,     0,     0,   251,
       0,    91,    82,    83,    84,    85,     0,    86,     0,     0,
     472,    82,    83,    84,    85,    91,    86,     0,     0,   557,
       0,     0,     0,     0,    91,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126
};

static const yytype_int16 yycheck[] =
{
      31,    76,   100,   344,   176,     4,   346,     4,   458,    52,
      11,     4,     4,   141,   231,    73,   188,     5,     4,     4,
      73,   243,     6,   111,     8,     9,    73,    73,    42,    14,
      42,   101,     7,    73,   115,   133,   107,   123,    81,    23,
     111,     4,   383,    73,    29,    73,    30,   107,    16,    17,
      18,    19,    73,   112,   119,   115,   121,    71,     0,    71,
      14,   189,   143,   106,    73,    73,    73,    66,    22,   139,
     113,     4,   115,   126,   111,    73,    73,   123,   136,   126,
      73,    73,    81,   123,    83,    86,    74,    73,   112,     6,
     312,     8,     9,   136,    79,   123,   126,   225,   141,     4,
     143,   318,    73,   100,     4,   126,    23,   235,   325,    63,
      64,   328,   329,    30,    98,   243,   100,   126,   102,   126,
     111,   109,   462,   114,   252,   109,   105,   467,   126,   117,
     118,    99,   111,   117,   118,    74,    50,    51,    52,    53,
      54,   313,   482,   107,   187,   595,   189,   111,   107,   103,
     104,   105,   106,   107,   108,   107,     4,   111,   112,   113,
     114,   115,   116,   111,   124,   293,   119,   384,   121,   112,
     109,   388,   125,   127,   128,   129,    28,   107,   117,   118,
       4,    98,   122,   100,   312,   102,   314,   102,   219,   232,
     233,   234,   109,   107,   103,   104,   105,   106,   107,   108,
     117,   118,   111,   100,    75,   333,   115,   116,   112,   252,
       4,   339,     6,    65,     8,     9,    50,    51,    52,    53,
      78,   122,   562,   111,     4,    77,    84,    85,   271,    23,
     273,   115,    26,   125,   125,   452,    30,   454,   366,    14,
     125,    15,     4,   415,     4,    19,    73,    21,   279,   111,
     281,   282,   593,    14,   297,   298,   299,   300,   301,   302,
     303,   304,   305,   306,   307,   308,   309,   439,    62,   312,
     108,   122,    75,   107,   107,   100,   123,   111,   111,   407,
     408,   114,   115,   326,   456,    79,    73,   330,   331,   123,
     126,   126,     4,   336,   111,   112,   113,   114,   126,     4,
     103,   104,   105,   106,    98,   108,   124,   101,   111,   112,
     113,   114,   124,   116,   486,   109,   488,   124,   361,     4,
      74,    74,     4,   366,   367,   368,   369,   111,   103,   104,
     105,   106,   125,   108,   107,   107,   111,   112,   113,   114,
       4,   116,   103,   104,   105,   106,   474,   108,   112,     4,
     111,   112,   113,   114,     4,   116,    73,    20,    73,   122,
     125,   459,   460,    34,    35,    36,    37,    38,    39,    40,
      41,   107,    43,    44,    45,    46,    47,   125,    10,    10,
      10,   424,   425,   426,   427,   428,   429,   430,   431,   432,
     433,   434,   435,   436,   437,   438,   107,   440,   441,   442,
     443,   444,   445,   446,   447,   533,   107,   107,   536,    20,
     107,   125,   455,    10,    10,   125,   124,    10,   461,   103,
     104,   105,   106,   125,   108,   468,    56,    57,    58,    59,
      60,    61,   116,   476,    99,    73,   122,    20,   481,   122,
      20,   122,   485,    73,   487,   122,     4,    20,   119,   111,
     121,   122,   123,     4,   124,   124,    20,   585,   126,   534,
      56,    57,    58,    59,    60,    61,   124,     4,   125,     1,
     513,   125,     4,    20,   111,   124,   124,    73,    10,     4,
      12,    13,    14,     4,   126,     4,     4,    14,   531,   532,
      22,    23,    24,     4,     4,   225,    28,    29,    30,    71,
     366,    33,   103,   104,   105,   106,   107,   108,   182,   552,
     111,   198,   338,   114,   193,   116,   150,   215,   214,   361,
     562,   564,   538,   474,   125,   408,   339,   570,   274,   252,
     573,    63,   575,   189,    66,    67,    68,   314,   136,    10,
     187,    12,    13,    14,    76,    -1,   362,    -1,    80,    -1,
      82,    22,    23,    24,    -1,    -1,    -1,    28,    29,    30,
      -1,   592,    33,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,   103,   104,   105,   106,   107,   108,    -1,    -1,   111,
      -1,    -1,   114,   115,   116,    -1,   103,   104,   105,   106,
      -1,   108,    63,   125,   111,    66,    67,    68,    -1,   116,
      42,    -1,    -1,    -1,    -1,    76,    48,    49,    -1,    80,
      -1,    82,    -1,    55,    56,    57,    58,    59,    60,    61,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,    71,
      72,    -1,   103,   104,   105,   106,   107,   108,    -1,    -1,
     111,    -1,    -1,   114,   115,   116,    -1,   103,   104,   105,
     106,   107,   108,    -1,   125,   111,   112,   113,   114,   115,
     116,    -1,    -1,   103,   104,   105,   106,   123,   108,    -1,
      -1,   111,   112,   113,   114,    -1,   116,    -1,   120,    -1,
      -1,   123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,
     132,   133,   134,   135,   103,   104,   105,   106,   107,   108,
      -1,    -1,   111,   112,   113,   114,    -1,   116,   103,   104,
     105,   106,   107,   108,   123,    -1,   111,   112,   113,   114,
     115,   116,   103,   104,   105,   106,    -1,   108,    -1,    -1,
     111,   112,   113,   114,    -1,   116,   103,   104,   105,   106,
      -1,   108,    -1,    -1,   111,   112,   113,   114,    -1,   116,
     103,   104,   105,   106,    -1,   108,    -1,    -1,   111,   112,
     113,   114,    -1,   116,   103,   104,   105,   106,    -1,   108,
      -1,    -1,   111,   112,   113,   114,    -1,   116,   103,   104,
     105,   106,   107,   108,    -1,    -1,   111,    -1,    -1,   114,
      -1,   116,   103,   104,   105,   106,    -1,   108,    -1,    -1,
     111,   103,   104,   105,   106,   116,   108,    -1,    -1,   111,
      -1,    -1,    -1,    -1,   116,    87,    88,    89,    90,    91,
      92,    93,    94,    95,    96,    97
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     4,     6,     8,     9,    23,    26,    30,    62,    79,
      98,   101,   109,   138,   139,   140,   141,   143,   144,   145,
     156,   159,   161,   176,     7,   142,   111,   112,   123,   160,
     162,   146,    50,    51,    52,    53,    54,   107,   218,   219,
     177,   111,   157,     4,     0,   140,     4,   112,     4,    73,
      73,   247,   248,     4,   107,   111,   114,   115,   242,   243,
     218,   107,   107,     4,    30,   100,   109,   117,   118,   141,
     147,   150,   151,   158,   159,   208,   209,   210,   111,   112,
     124,    75,   103,   104,   105,   106,   108,   111,   112,   113,
     114,   116,   238,   246,   251,   253,   254,   255,   163,   107,
     122,   178,   148,     4,   151,   102,    14,    29,    79,   152,
     153,   210,   246,    75,    73,   136,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    97,   170,   171,   172,
     184,   185,   186,   122,   255,   184,   112,   246,   111,   154,
       4,   115,   246,   252,   253,   125,   125,   125,     4,    73,
     169,   255,     4,   107,   115,   244,   245,   246,    73,   184,
     123,   155,   238,   239,   240,   241,   245,   253,   107,   111,
      50,    51,    52,    53,   107,   111,   123,   173,   174,   111,
     164,   186,   179,   122,   108,   100,   249,   250,   123,    73,
     126,   126,   247,    73,   126,   126,     4,   165,   165,   111,
     114,   149,   124,   251,   247,   241,   124,   174,     5,   109,
     117,   118,   166,   175,   205,   206,   207,   175,   124,   167,
       4,     4,    74,   207,     1,   208,   211,    74,   168,   218,
       4,    10,    12,    13,    14,    22,    23,    24,    28,    29,
      30,    33,    63,    66,    67,    68,    76,    80,    82,   107,
     111,   114,   115,   125,   147,   180,   195,   197,   201,   214,
     220,   222,   224,   225,   226,   228,   236,   238,   107,   111,
     244,    14,   246,    14,   246,   246,   238,   107,   107,   215,
     111,   216,   217,   105,   111,   256,   125,   228,   238,   125,
     223,     4,   239,   221,     4,     4,   229,    34,    35,    36,
      37,    38,    39,    40,    41,    43,    44,    45,    46,    47,
     119,   121,   122,   123,   227,   193,    20,   246,    10,    56,
      57,    58,    59,    60,    61,    73,   237,   246,    10,    73,
     237,    73,   218,    73,   218,   218,   122,   202,   203,   125,
     181,   111,   234,   235,   238,   198,   125,   246,   246,   246,
     246,   246,   246,   246,   246,   246,   246,   246,   246,   246,
      14,    22,    63,    64,   111,   114,   115,   127,   128,   129,
     228,   238,   246,   247,   111,   238,   243,    16,    17,    18,
      19,    99,   194,   107,    10,   244,   244,   246,    10,   244,
     244,   246,   246,   107,   212,   213,   238,   107,   107,   246,
     111,   204,   231,   246,   204,   235,   188,    20,    73,   126,
     193,   199,   111,   230,   231,   123,   219,   246,   256,   107,
     155,   246,   246,   246,    42,    48,    49,    55,    56,    57,
      58,    59,    60,    61,    69,    70,    71,    72,   120,   123,
     128,   129,   130,   131,   132,   133,   134,   135,   124,   125,
     193,   244,    10,   244,    10,    73,   123,    99,    73,   122,
     122,    20,    73,   126,   232,   126,   126,    11,    86,   183,
     189,   238,   111,   234,   122,     4,    66,    81,    83,   196,
     200,    20,    73,   126,   247,    73,   123,    73,   123,   246,
     246,   246,   246,   246,   246,   246,   246,   246,   246,   246,
     246,   246,   246,   246,   247,   246,   246,   246,   246,   246,
     246,   246,   246,   122,   111,   244,   244,   246,   247,   213,
     255,   255,   246,   111,   231,    15,    19,    21,   233,   231,
     246,    78,    84,    85,   187,     4,    20,   226,   246,     4,
     246,   111,   231,   124,   246,   247,   246,   247,   124,   246,
     126,   124,    20,   125,     4,   246,   246,   111,   238,   182,
     210,   238,   125,   232,    20,   124,   124,   246,   111,     4,
      73,     4,     4,    73,     4,    73,   190,     4,   230,   246,
     126,   246,   246,   246,    28,    65,    77,   191,   126,     4,
       4,     4,   192,   238,     4,   218,   193,   213
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
#line 477 "compilers/imcc/imcc.y"
    { if (yynerrs) YYABORT; (yyval.i) = 0; }
    break;

  case 5:
#line 486 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 6:
#line 487 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 7:
#line 488 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 8:
#line 489 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); 
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit); 
                     IMCC_INFO(interp)->cur_unit = 0; }
    break;

  case 9:
#line 492 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i);
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                     IMCC_INFO(interp)->cur_unit = 0; }
    break;

  case 10:
#line 495 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i);
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                     IMCC_INFO(interp)->cur_unit = 0; }
    break;

  case 11:
#line 498 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 12:
#line 499 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 13:
#line 500 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 14:
#line 503 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 15:
#line 504 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 16:
#line 505 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; do_loadlib(interp, (yyvsp[(2) - (3)].s)); }
    break;

  case 17:
#line 509 "compilers/imcc/imcc.y"
    { if ((yyvsp[(2) - (2)].s))
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 18:
#line 517 "compilers/imcc/imcc.y"
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
#line 526 "compilers/imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                CONTEXT(((Interp*)interp)->ctx)->current_HLL, atoi((yyvsp[(2) - (4)].s)), atoi((yyvsp[(4) - (4)].s)));
             (yyval.t) = 0;
         }
    break;

  case 20:
#line 535 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 21:
#line 541 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 22:
#line 549 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 23:
#line 550 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1); is_def=0; }
    break;

  case 24:
#line 554 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 25:
#line 555 "compilers/imcc/imcc.y"
    { (yyval.i) = mk_pmc_const(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].s)); is_def=0; }
    break;

  case 30:
#line 568 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 31:
#line 569 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 32:
#line 570 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 33:
#line 571 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 34:
#line 572 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 37:
#line 577 "compilers/imcc/imcc.y"
    { clear_state(interp); }
    break;

  case 38:
#line 579 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit, 
                              (yyvsp[(2) - (3)].s), 0, IMCC_INFO(interp)->regs, 
                              IMCC_INFO(interp)->nargs, IMCC_INFO(interp) -> keyvec, 1);
                     free((yyvsp[(2) - (3)].s)); }
    break;

  case 39:
#line 584 "compilers/imcc/imcc.y"
    {
                    imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                    IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM);
                    }
    break;

  case 40:
#line 589 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit,
                                mk_sub_label(interp, (yyvsp[(4) - (4)].s)));
                     IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(3) - (4)].t);
                   }
    break;

  case 41:
#line 595 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(2) - (2)].sr)); }
    break;

  case 42:
#line 597 "compilers/imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, (yyvsp[(4) - (4)].s));
                       set_lexical(interp, r, (yyvsp[(2) - (4)].s)); (yyval.i) = 0;
                   }
    break;

  case 43:
#line 601 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 45:
#line 609 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 46:
#line 611 "compilers/imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     (yyval.i)=0; }
    break;

  case 49:
#line 626 "compilers/imcc/imcc.y"
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
#line 640 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); }
    break;

  case 51:
#line 641 "compilers/imcc/imcc.y"
    { (yyval.sr) = NULL; }
    break;

  case 52:
#line 646 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 53:
#line 650 "compilers/imcc/imcc.y"
    {
          iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (3)].sr));
        }
    break;

  case 54:
#line 653 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(5) - (6)].t); }
    break;

  case 55:
#line 655 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
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
       if (IMCC_INFO(interp)->adv_named_id) {
             add_pcc_named_param(interp,IMCC_INFO(interp)->cur_call,
                                 IMCC_INFO(interp)->adv_named_id,(yyvsp[(2) - (3)].sr));
             IMCC_INFO(interp)->adv_named_id = NULL;
         }
         else add_pcc_param(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
   }
    break;

  case 59:
#line 672 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 60:
#line 672 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(3) - (3)].sr); is_def=0; }
    break;

  case 61:
#line 676 "compilers/imcc/imcc.y"
    { if ((yyvsp[(3) - (3)].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
                                         (yyval.sr)->type |= (yyvsp[(3) - (3)].t); }
    break;

  case 62:
#line 681 "compilers/imcc/imcc.y"
    { 
                                         if ((yyvsp[(5) - (5)].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[(4) - (5)].s), (yyvsp[(1) - (5)].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[(4) - (5)].s), (yyvsp[(1) - (5)].t));
                                         (yyval.sr)->type |= (yyvsp[(5) - (5)].t);
                                         adv_named_set(interp,(yyvsp[(2) - (5)].s));}
    break;

  case 63:
#line 691 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  }
    break;

  case 65:
#line 696 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 66:
#line 700 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; IMCC_INFO(interp)->cur_unit->outer =
                     mk_sub_address_fromc(interp, (yyvsp[(3) - (4)].s)); }
    break;

  case 67:
#line 703 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; IMCC_INFO(interp)->cur_unit->outer =
                     mk_const(interp, (yyvsp[(3) - (4)].s), 'S'); }
    break;

  case 68:
#line 708 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; 
                       IMCC_INFO(interp)->cur_unit->vtable_name = NULL;
                       IMCC_INFO(interp)->cur_unit->is_vtable_method = 1; }
    break;

  case 69:
#line 712 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; 
                       IMCC_INFO(interp)->cur_unit->vtable_name = strdup((yyvsp[(3) - (4)].s));
                       IMCC_INFO(interp)->cur_unit->is_vtable_method = 1; }
    break;

  case 70:
#line 718 "compilers/imcc/imcc.y"
    { add_pcc_multi(IMCC_INFO(interp)->cur_call, NULL); }
    break;

  case 71:
#line 719 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr)); }
    break;

  case 72:
#line 720 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr));}
    break;

  case 73:
#line 724 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 74:
#line 725 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 75:
#line 726 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 76:
#line 727 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 77:
#line 728 "compilers/imcc/imcc.y"
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
#line 738 "compilers/imcc/imcc.y"
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
#line 748 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); }
    break;

  case 82:
#line 757 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 83:
#line 758 "compilers/imcc/imcc.y"
    { iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit, mk_sub_label(interp, (yyvsp[(3) - (3)].s))); }
    break;

  case 84:
#line 759 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(5) - (6)].t); }
    break;

  case 85:
#line 761 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
    break;

  case 86:
#line 766 "compilers/imcc/imcc.y"
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
#line 794 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
    break;

  case 88:
#line 798 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->label = 0; }
    break;

  case 89:
#line 799 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->label = 1; }
    break;

  case 90:
#line 803 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; }
    break;

  case 91:
#line 805 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->object = (yyvsp[(2) - (3)].sr); }
    break;

  case 92:
#line 809 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 94:
#line 814 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (1)].t); }
    break;

  case 95:
#line 815 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (3)].t) | (yyvsp[(3) - (3)].t); }
    break;

  case 96:
#line 819 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_LOAD; }
    break;

  case 97:
#line 820 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_INIT; }
    break;

  case 98:
#line 821 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_MAIN; }
    break;

  case 99:
#line 822 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_IMMEDIATE; }
    break;

  case 100:
#line 823 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_POSTCOMP; }
    break;

  case 101:
#line 824 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_ANON; }
    break;

  case 102:
#line 825 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_METHOD; }
    break;

  case 103:
#line 826 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_NEED_LEX; }
    break;

  case 107:
#line 834 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (5)].sr));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         }
    break;

  case 108:
#line 839 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 109:
#line 841 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
            IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 110:
#line 846 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 111:
#line 848 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[(2) - (3)].s),'S')); }
    break;

  case 112:
#line 850 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (5)].sr));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         }
    break;

  case 113:
#line 854 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[(2) - (5)].s),'S'));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         }
    break;

  case 114:
#line 861 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 115:
#line 862 "compilers/imcc/imcc.y"
    {  add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 116:
#line 866 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (2)].sr); }
    break;

  case 117:
#line 871 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 118:
#line 872 "compilers/imcc/imcc.y"
    {  if((yyvsp[(2) - (3)].sr)) add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 119:
#line 876 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); }
    break;

  case 120:
#line 877 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 121:
#line 878 "compilers/imcc/imcc.y"
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
#line 890 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 123:
#line 891 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); }
    break;

  case 124:
#line 895 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_FLAT;   }
    break;

  case 125:
#line 896 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPTIONAL; }
    break;

  case 126:
#line 897 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPT_FLAG; }
    break;

  case 127:
#line 898 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_NAMED; }
    break;

  case 128:
#line 899 "compilers/imcc/imcc.y"
    {  adv_named_set(interp,(yyvsp[(3) - (4)].s)); (yyval.t) = 0; }
    break;

  case 129:
#line 900 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_UNIQUE_REG; }
    break;

  case 130:
#line 905 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 131:
#line 906 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; }
    break;

  case 134:
#line 916 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, (yyvsp[(1) - (2)].t)); }
    break;

  case 135:
#line 919 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 136:
#line 920 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.i) = 0;  }
    break;

  case 137:
#line 926 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 138:
#line 927 "compilers/imcc/imcc.y"
    {
       if((yyvsp[(1) - (2)].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (2)].sr)); 
   }
    break;

  case 139:
#line 930 "compilers/imcc/imcc.y"
    {
       if((yyvsp[(2) - (3)].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(2) - (3)].sr)); 
   }
    break;

  case 140:
#line 936 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); }
    break;

  case 141:
#line 941 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 142:
#line 946 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 143:
#line 948 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 144:
#line 953 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 145:
#line 957 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 146:
#line 958 "compilers/imcc/imcc.y"
    {  
      if (IMCC_INFO(interp)->adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               IMCC_INFO(interp)->adv_named_id, (yyvsp[(1) - (1)].sr));
          IMCC_INFO(interp)->adv_named_id = NULL;
      }
      else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (1)].sr)); }
    break;

  case 147:
#line 965 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[(1) - (3)].s),(yyvsp[(3) - (3)].sr));}
    break;

  case 148:
#line 967 "compilers/imcc/imcc.y"
    {  
      if (IMCC_INFO(interp)->adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               IMCC_INFO(interp)->adv_named_id,(yyvsp[(3) - (3)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
      }
      else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(3) - (3)].sr));    }
    break;

  case 149:
#line 974 "compilers/imcc/imcc.y"
    {  
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[(3) - (5)].s),(yyvsp[(5) - (5)].sr));}
    break;

  case 152:
#line 993 "compilers/imcc/imcc.y"
    { clear_state(interp); }
    break;

  case 153:
#line 998 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[(2) - (2)].i); }
    break;

  case 154:
#line 999 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 155:
#line 1000 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 156:
#line 1001 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 157:
#line 1005 "compilers/imcc/imcc.y"
    {  (yyval.i) = NULL; }
    break;

  case 161:
#line 1015 "compilers/imcc/imcc.y"
    {
         (yyval.i) = iLABEL(interp, IMCC_INFO(interp)->cur_unit, mk_local_label(interp, (yyvsp[(1) - (1)].s)));
                   }
    break;

  case 162:
#line 1024 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(2) - (3)].i); }
    break;

  case 163:
#line 1026 "compilers/imcc/imcc.y"
    { if (yynerrs >= PARROT_MAX_RECOVER_ERRORS) {
                           IMCC_warning(interp, "Too many errors. Correct some first.\n");
                           YYABORT;
                       }
                       yyerrok; }
    break;

  case 164:
#line 1035 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[(1) - (1)].idlist);
         l->next = NULL;
         (yyval.idlist) = l;
     }
    break;

  case 165:
#line 1042 "compilers/imcc/imcc.y"
    {  
         IdList* l = (yyvsp[(3) - (3)].idlist);
         l->next = (yyvsp[(1) - (3)].idlist);
         (yyval.idlist) = l;
     }
    break;

  case 166:
#line 1051 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = (yyvsp[(1) - (2)].s);
         l->unique_reg = 1;
         (yyval.idlist) = l;
     }
    break;

  case 167:
#line 1059 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = (yyvsp[(1) - (1)].s);
         l->unique_reg = 0;
         (yyval.idlist) = l;
     }
    break;

  case 170:
#line 1070 "compilers/imcc/imcc.y"
    { push_namespace((yyvsp[(2) - (2)].s)); }
    break;

  case 171:
#line 1071 "compilers/imcc/imcc.y"
    { pop_namespace((yyvsp[(2) - (2)].s)); }
    break;

  case 172:
#line 1072 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 173:
#line 1073 "compilers/imcc/imcc.y"
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
#line 1088 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, (yyvsp[(4) - (4)].sr), (yyvsp[(2) - (4)].s)); (yyval.i) = 0;
                    }
    break;

  case 175:
#line 1091 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 176:
#line 1092 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 0);is_def=0; }
    break;

  case 178:
#line 1094 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 179:
#line 1095 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1);is_def=0; }
    break;

  case 180:
#line 1096 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;
                           IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isTAIL_CALL;
                           IMCC_INFO(interp)->cur_call = NULL;
                        }
    break;

  case 181:
#line 1100 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "branch",1, (yyvsp[(2) - (2)].sr)); }
    break;

  case 182:
#line 1102 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (2)].s), 0, 
                              IMCC_INFO(interp) -> regs,
                              IMCC_INFO(interp) -> nargs, 
                              IMCC_INFO(interp) -> keyvec, 1);
                       free((yyvsp[(1) - (2)].s)); }
    break;

  case 183:
#line 1108 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(2) - (2)].sr)); }
    break;

  case 184:
#line 1109 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
    break;

  case 185:
#line 1110 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 187:
#line 1112 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 188:
#line 1116 "compilers/imcc/imcc.y"
    { (yyval.t) = 'I'; }
    break;

  case 189:
#line 1117 "compilers/imcc/imcc.y"
    { (yyval.t) = 'N'; }
    break;

  case 190:
#line 1118 "compilers/imcc/imcc.y"
    { (yyval.t) = 'S'; }
    break;

  case 191:
#line 1119 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 192:
#line 1120 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 193:
#line 1121 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; free((yyvsp[(1) - (1)].s)); }
    break;

  case 194:
#line 1126 "compilers/imcc/imcc.y"
    {
             if (( IMCC_INFO(interp)->cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, (yyvsp[(1) - (1)].s), 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", (yyvsp[(1) - (1)].s));
            }
         }
    break;

  case 195:
#line 1137 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr));      }
    break;

  case 196:
#line 1139 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "not", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));      }
    break;

  case 197:
#line 1141 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "neg", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));      }
    break;

  case 198:
#line 1143 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bnot", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));     }
    break;

  case 199:
#line 1145 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "add", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 200:
#line 1147 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "sub", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 201:
#line 1149 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mul", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 202:
#line 1151 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "pow", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 203:
#line 1153 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "div", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 204:
#line 1155 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "fdiv", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 205:
#line 1157 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mod", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 206:
#line 1159 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "concat", 3, (yyvsp[(1) - (5)].sr),(yyvsp[(3) - (5)].sr),(yyvsp[(5) - (5)].sr)); }
    break;

  case 207:
#line 1161 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "iseq", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 208:
#line 1163 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isne", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 209:
#line 1165 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isgt", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 210:
#line 1167 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "islt", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 211:
#line 1169 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isle", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 212:
#line 1171 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isge", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 213:
#line 1173 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shl", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 214:
#line 1175 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shr", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 215:
#line 1177 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "lsr", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 216:
#line 1179 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "and", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 217:
#line 1181 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "or", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));   }
    break;

  case 218:
#line 1183 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "xor", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 219:
#line 1185 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "band", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 220:
#line 1187 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bor", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 221:
#line 1189 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bxor", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 222:
#line 1191 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(5) - (6)].sr)); }
    break;

  case 223:
#line 1193 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 224:
#line 1195 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].s), (yyvsp[(6) - (6)].sr), 1); }
    break;

  case 225:
#line 1197 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].s), (yyvsp[(6) - (7)].sr), 1); }
    break;

  case 226:
#line 1199 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].s), NULL, 1); }
    break;

  case 227:
#line 1201 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 228:
#line 1203 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (6)].sr), (yyvsp[(5) - (6)].sr)); }
    break;

  case 229:
#line 1205 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 230:
#line 1207 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); }
    break;

  case 231:
#line 1209 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set_addr",
                        2, (yyvsp[(1) - (4)].sr), mk_label_address(interp, (yyvsp[(4) - (4)].s))); }
    break;

  case 232:
#line 1212 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "find_global",2,(yyvsp[(1) - (4)].sr),(yyvsp[(4) - (4)].sr));}
    break;

  case 233:
#line 1214 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "store_global",2, (yyvsp[(2) - (4)].sr),(yyvsp[(4) - (4)].sr)); }
    break;

  case 234:
#line 1218 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 235:
#line 1220 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 236:
#line 1222 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); }
    break;

  case 237:
#line 1225 "compilers/imcc/imcc.y"
    {
            add_pcc_result((yyvsp[(3) - (3)].i)->r[0], (yyvsp[(1) - (3)].sr));
            IMCC_INFO(interp)->cur_call = NULL;
            (yyval.i) = 0;
         }
    break;

  case 238:
#line 1231 "compilers/imcc/imcc.y"
    {
            (yyval.i) = IMCC_create_itcall_label(interp);
         }
    break;

  case 239:
#line 1235 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[(6) - (9)].sr));
           IMCC_INFO(interp)->cur_call = NULL;
         }
    break;

  case 243:
#line 1243 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(1) - (3)].sr)); }
    break;

  case 244:
#line 1246 "compilers/imcc/imcc.y"
    { (yyval.i) = IMCC_create_itcall_label(interp);
                           (yyval.i)->type &= ~ITCALL; (yyval.i)->type |= ITRESULT; }
    break;

  case 245:
#line 1248 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 246:
#line 1253 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "add", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 247:
#line 1255 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "sub", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 248:
#line 1257 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mul", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 249:
#line 1259 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "div", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 250:
#line 1261 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mod", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 251:
#line 1263 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "fdiv", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 252:
#line 1265 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "concat", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 253:
#line 1267 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "band", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 254:
#line 1269 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bor", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 255:
#line 1271 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bxor", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 256:
#line 1273 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shr", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 257:
#line 1275 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shl", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 258:
#line 1277 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "lsr", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 259:
#line 1282 "compilers/imcc/imcc.y"
    { (yyval.i) = func_ins(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(3) - (4)].s),
                                   IMCC_INFO(interp) -> regs,
                                   IMCC_INFO(interp) -> nargs,
                                   IMCC_INFO(interp) -> keyvec, 1);
                     free((yyvsp[(3) - (4)].s));
                   }
    break;

  case 260:
#line 1290 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 261:
#line 1291 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 262:
#line 1292 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 263:
#line 1293 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (1)].sr);
                       if ((yyvsp[(1) - (1)].sr)->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 264:
#line 1298 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); }
    break;

  case 265:
#line 1299 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = mk_const(interp, (yyvsp[(3) - (3)].s), 'S'); }
    break;

  case 266:
#line 1300 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); }
    break;

  case 267:
#line 1303 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 268:
#line 1304 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 269:
#line 1309 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[(1) - (1)].sr));
        }
    break;

  case 270:
#line 1314 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[(2) - (5)].i); }
    break;

  case 271:
#line 1318 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 272:
#line 1319 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; 
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, IMCC_INFO(interp)->adv_named_id, (yyvsp[(3) - (3)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       }
       else add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr)); 
   }
    break;

  case 273:
#line 1326 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; 
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call,IMCC_INFO(interp)->adv_named_id,(yyvsp[(1) - (1)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       }
       else add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr));
   }
    break;

  case 274:
#line 1333 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0;
                                     add_pcc_named_arg(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(3) - (5)].s),(yyvsp[(5) - (5)].sr));}
    break;

  case 275:
#line 1335 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_named_arg(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(1) - (3)].s),(yyvsp[(3) - (3)].sr));}
    break;

  case 276:
#line 1339 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); }
    break;

  case 277:
#line 1343 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 278:
#line 1344 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); }
    break;

  case 279:
#line 1348 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT; }
    break;

  case 280:
#line 1349 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_MAYBE_FLAT; }
    break;

  case 281:
#line 1350 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_NAMED; }
    break;

  case 282:
#line 1351 "compilers/imcc/imcc.y"
    { adv_named_set(interp,(yyvsp[(3) - (4)].s)); (yyval.t) = 0; }
    break;

  case 283:
#line 1354 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); }
    break;

  case 284:
#line 1358 "compilers/imcc/imcc.y"
    { 
         (yyval.sr) = 0;
         if (IMCC_INFO(interp)->adv_named_id) {
             add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,IMCC_INFO(interp)->adv_named_id,(yyvsp[(3) - (3)].sr));
             IMCC_INFO(interp)->adv_named_id = NULL;
         }
         else add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr)); }
    break;

  case 285:
#line 1365 "compilers/imcc/imcc.y"
    { 
        add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(3) - (5)].s),(yyvsp[(5) - (5)].sr)); }
    break;

  case 286:
#line 1367 "compilers/imcc/imcc.y"
    { 
       (yyval.sr) = 0;
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,IMCC_INFO(interp)->adv_named_id,(yyvsp[(1) - (1)].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       }
       else add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr)); }
    break;

  case 287:
#line 1374 "compilers/imcc/imcc.y"
    { add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(1) - (3)].s),(yyvsp[(3) - (3)].sr)); }
    break;

  case 288:
#line 1375 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 289:
#line 1380 "compilers/imcc/imcc.y"
    { (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 290:
#line 1382 "compilers/imcc/imcc.y"
    { (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, inv_op((yyvsp[(3) - (6)].s)), 3, (yyvsp[(2) - (6)].sr),(yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 291:
#line 1384 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 292:
#line 1386 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 293:
#line 1388 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 294:
#line 1390 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless",2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 295:
#line 1392 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 296:
#line 1394 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 297:
#line 1398 "compilers/imcc/imcc.y"
    {  (yyval.s) = "eq"; }
    break;

  case 298:
#line 1399 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ne"; }
    break;

  case 299:
#line 1400 "compilers/imcc/imcc.y"
    {  (yyval.s) = "gt"; }
    break;

  case 300:
#line 1401 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ge"; }
    break;

  case 301:
#line 1402 "compilers/imcc/imcc.y"
    {  (yyval.s) = "lt"; }
    break;

  case 302:
#line 1403 "compilers/imcc/imcc.y"
    {  (yyval.s) = "le"; }
    break;

  case 305:
#line 1412 "compilers/imcc/imcc.y"
    {  (yyval.sr) = NULL; }
    break;

  case 306:
#line 1413 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(1) - (1)].sr); }
    break;

  case 307:
#line 1417 "compilers/imcc/imcc.y"
    { (yyval.sr) = IMCC_INFO(interp)->regs[0]; }
    break;

  case 309:
#line 1422 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(1) - (1)].sr); }
    break;

  case 310:
#line 1424 "compilers/imcc/imcc.y"
    {
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(1) - (4)].sr);
                      IMCC_INFO(interp) -> keyvec |= KEY_BIT(IMCC_INFO(interp)->nargs);
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(3) - (4)].sr);
                      (yyval.sr) = (yyvsp[(1) - (4)].sr);
                   }
    break;

  case 311:
#line 1431 "compilers/imcc/imcc.y"
    {
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[(2) - (3)].sr);
                      (yyval.sr) = (yyvsp[(2) - (3)].sr);
                   }
    break;

  case 313:
#line 1438 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 314:
#line 1439 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 315:
#line 1443 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 316:
#line 1444 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 317:
#line 1448 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 318:
#line 1449 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 323:
#line 1462 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->nkeys = 0;
                      IMCC_INFO(interp)->in_slice = 0; }
    break;

  case 324:
#line 1464 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp, 
                                     IMCC_INFO(interp)->nkeys, 
                                     IMCC_INFO(interp)->keys, 0); }
    break;

  case 325:
#line 1469 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->nkeys = 0;
                      IMCC_INFO(interp)->in_slice = 0; }
    break;

  case 326:
#line 1471 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp,
                                     IMCC_INFO(interp)->nkeys, 
                                     IMCC_INFO(interp)->keys, 1); }
    break;

  case 327:
#line 1477 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(1) - (1)].sr); }
    break;

  case 328:
#line 1479 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(3) - (3)].sr);
                      (yyval.sr) = IMCC_INFO(interp)->keys[0]; }
    break;

  case 329:
#line 1481 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->in_slice = 1; }
    break;

  case 330:
#line 1482 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(4) - (4)].sr);
                       (yyval.sr) = IMCC_INFO(interp)->keys[0]; }
    break;

  case 331:
#line 1487 "compilers/imcc/imcc.y"
    { if (IMCC_INFO(interp)->in_slice) {
                         (yyvsp[(1) - (1)].sr)->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     (yyval.sr) = (yyvsp[(1) - (1)].sr);
                   }
    break;

  case 332:
#line 1493 "compilers/imcc/imcc.y"
    { (yyvsp[(1) - (3)].sr)->type |= VT_START_SLICE;
                     (yyvsp[(3) - (3)].sr)->type |= VT_END_SLICE;
                     IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[(1) - (3)].sr); 
                     (yyval.sr) = (yyvsp[(3) - (3)].sr); }
    break;

  case 333:
#line 1497 "compilers/imcc/imcc.y"
    { (yyvsp[(2) - (2)].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[(2) - (2)].sr); }
    break;

  case 334:
#line 1498 "compilers/imcc/imcc.y"
    { (yyvsp[(1) - (2)].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[(1) - (2)].sr); }
    break;

  case 335:
#line 1502 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'I'); }
    break;

  case 336:
#line 1503 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'N'); }
    break;

  case 337:
#line 1504 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); }
    break;

  case 338:
#line 1505 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'P'); }
    break;

  case 339:
#line 1506 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_pasm_reg(interp, (yyvsp[(1) - (1)].s));    }
    break;

  case 340:
#line 1510 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'I'); }
    break;

  case 341:
#line 1511 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'N'); }
    break;

  case 342:
#line 1512 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S'); }
    break;

  case 343:
#line 1513 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'U'); }
    break;

  case 344:
#line 1517 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); }
    break;

  case 345:
#line 1518 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S');  }
    break;


/* Line 1267 of yacc.c.  */
#line 4420 "compilers/imcc/imcparser.c"
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


#line 1523 "compilers/imcc/imcc.y"


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

