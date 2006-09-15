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
 * we use a pure parser with the interpreter as a parameter this still
 * doesn't make the parser reentrant, there are too many globals
 * around.
 *
 * These globals should go into one structure, which could be attached
 * to the interpreter
 */

/*
 * Choosing instructions for Parrot is pretty easy since many are
 * polymorphic.
 */


/*
 * Some convenient vars
 */
/* static SymReg *cur_obj , *cur_call; */
static char *adv_named_id = NULL;
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
    clear_state();
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
    sprintf(name, yield ? "%cpcc_sub_yield_%d" : "%cpcc_sub_ret_%d", IMCC_INTERNAL_CHAR, cnr++);
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

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 397 "compilers/imcc/imcc.y"
{
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
}
/* Line 193 of yacc.c.  */
#line 734 "compilers/imcc/imcparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 747 "compilers/imcc/imcparser.c"

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
#define YYLAST   828

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  134
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  119
/* YYNRULES -- Number of rules.  */
#define YYNRULES  340
/* YYNRULES -- Number of states.  */
#define YYNSTATES  591

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
static const yytype_uint16 yyprhs[] =
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
     455,   457,   461,   464,   466,   468,   470,   473,   476,   477,
     482,   487,   488,   495,   497,   498,   505,   508,   511,   514,
     517,   519,   521,   523,   524,   526,   528,   530,   532,   534,
     536,   538,   542,   547,   552,   557,   563,   569,   575,   581,
     587,   593,   599,   605,   611,   617,   623,   629,   635,   641,
     647,   653,   659,   665,   671,   677,   683,   689,   695,   702,
     709,   716,   724,   729,   734,   741,   748,   756,   761,   766,
     771,   776,   783,   791,   795,   796,   806,   808,   810,   812,
     816,   817,   823,   827,   831,   835,   839,   843,   847,   851,
     855,   859,   863,   867,   871,   875,   880,   882,   884,   886,
     888,   892,   896,   900,   902,   904,   905,   911,   912,   916,
     918,   924,   928,   931,   932,   935,   937,   939,   944,   947,
     951,   957,   959,   963,   964,   971,   978,   984,   990,   995,
    1000,  1005,  1010,  1012,  1014,  1016,  1018,  1020,  1022,  1024,
    1026,  1027,  1029,  1033,  1035,  1037,  1042,  1046,  1048,  1050,
    1052,  1054,  1056,  1058,  1060,  1062,  1064,  1066,  1068,  1069,
    1072,  1073,  1076,  1078,  1082,  1083,  1088,  1090,  1094,  1097,
    1100,  1102,  1104,  1106,  1108,  1110,  1112,  1114,  1116,  1118,
    1120
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
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
       4,    -1,     1,     4,    -1,   209,    -1,   208,    72,   209,
      -1,   104,    96,    -1,   104,    -1,   216,    -1,   232,    -1,
      22,   104,    -1,    23,   104,    -1,    -1,    27,   211,   214,
     208,    -1,    28,   108,    72,   234,    -1,    -1,    29,   212,
     214,   104,   119,   251,    -1,   144,    -1,    -1,    32,   213,
     214,   104,   119,   251,    -1,    65,   224,    -1,    10,   240,
      -1,   112,   235,    -1,    14,   242,    -1,   224,    -1,   176,
      -1,   193,    -1,    -1,    49,    -1,    50,    -1,    51,    -1,
      52,    -1,    53,    -1,   215,    -1,   104,    -1,   234,   119,
     242,    -1,   234,   119,   124,   242,    -1,   234,   119,   125,
     242,    -1,   234,   119,   126,   242,    -1,   234,   119,   242,
     127,   242,    -1,   234,   119,   242,   125,   242,    -1,   234,
     119,   242,   128,   242,    -1,   234,   119,   242,    68,   242,
      -1,   234,   119,   242,   129,   242,    -1,   234,   119,   242,
      41,   242,    -1,   234,   119,   242,   130,   242,    -1,   234,
     119,   242,   117,   242,    -1,   234,   119,   242,    55,   242,
      -1,   234,   119,   242,    56,   242,    -1,   234,   119,   242,
      57,   242,    -1,   234,   119,   242,    59,   242,    -1,   234,
     119,   242,    60,   242,    -1,   234,   119,   242,    58,   242,
      -1,   234,   119,   242,    47,   242,    -1,   234,   119,   242,
      48,   242,    -1,   234,   119,   242,    69,   242,    -1,   234,
     119,   242,    70,   242,    -1,   234,   119,   242,    71,   242,
      -1,   234,   119,   242,    54,   242,    -1,   234,   119,   242,
     131,   242,    -1,   234,   119,   242,   132,   242,    -1,   234,
     119,   242,   126,   242,    -1,   234,   119,   242,   120,   243,
     121,    -1,   234,   120,   243,   121,   119,   242,    -1,   234,
     119,    21,   215,    72,   242,    -1,   234,   119,    21,   215,
     120,   243,   121,    -1,   234,   119,    21,   215,    -1,   234,
     119,    21,   242,    -1,   234,   119,    21,   120,   243,   121,
      -1,   234,   119,    21,   242,    72,   242,    -1,   234,   119,
      21,   242,   120,   243,   121,    -1,   234,   119,    63,   104,
      -1,   234,   119,    62,   252,    -1,    62,   252,   119,   242,
      -1,    21,   234,    72,   242,    -1,    21,   234,    72,   242,
      72,   242,    -1,    21,   234,    72,   242,   120,   243,   121,
      -1,   234,   119,   224,    -1,    -1,   122,   217,   231,   123,
     119,   222,   122,   226,   123,    -1,   218,    -1,   220,    -1,
     221,    -1,   234,   119,    14,    -1,    -1,    67,   219,   122,
     231,   123,    -1,   234,    33,   242,    -1,   234,    34,   242,
      -1,   234,    35,   242,    -1,   234,    36,   242,    -1,   234,
      43,   242,    -1,   234,    42,   242,    -1,   234,    37,   242,
      -1,   234,    38,   242,    -1,   234,    39,   242,    -1,   234,
      40,   242,    -1,   234,    44,   242,    -1,   234,    45,   242,
      -1,   234,    46,   242,    -1,   234,   119,   112,   152,    -1,
     104,    -1,   108,    -1,   111,    -1,   234,    -1,   234,   223,
     239,    -1,   234,   223,   108,    -1,   234,   223,   234,    -1,
     118,    -1,   116,    -1,    -1,   222,   225,   122,   226,   123,
      -1,    -1,   226,    72,   227,    -1,   227,    -1,   226,    72,
     108,    20,   242,    -1,   108,    20,   242,    -1,   242,   228,
      -1,    -1,   228,   229,    -1,    15,    -1,    19,    -1,    19,
     122,   108,   123,    -1,   234,   189,    -1,   231,    72,   230,
      -1,   231,    72,   108,    20,   234,    -1,   230,    -1,   108,
      20,   234,    -1,    -1,    12,   242,   233,   242,    10,   240,
      -1,    13,   242,   233,   242,    10,   240,    -1,    12,    14,
     242,    10,   240,    -1,    13,    14,   242,    10,   240,    -1,
      12,   242,    10,   240,    -1,    13,   242,    10,   240,    -1,
      12,   242,    72,   240,    -1,    13,   242,    72,   240,    -1,
      55,    -1,    56,    -1,    57,    -1,    58,    -1,    59,    -1,
      60,    -1,   113,    -1,   250,    -1,    -1,   236,    -1,   236,
      72,   237,    -1,   237,    -1,   241,    -1,   234,   120,   243,
     121,    -1,   120,   245,   121,    -1,   239,    -1,   108,    -1,
     111,    -1,   104,    -1,   112,    -1,   104,    -1,   112,    -1,
     240,    -1,   242,    -1,   234,    -1,   251,    -1,    -1,   244,
     247,    -1,    -1,   246,   247,    -1,   249,    -1,   247,   133,
     249,    -1,    -1,   247,    72,   248,   249,    -1,   242,    -1,
     242,    74,   242,    -1,    74,   242,    -1,   242,    74,    -1,
     100,    -1,   101,    -1,   102,    -1,   103,    -1,   105,    -1,
     109,    -1,   110,    -1,   108,    -1,   111,    -1,   102,    -1,
     108,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   487,   487,   491,   492,   496,   497,   498,   499,   502,
     505,   508,   509,   510,   513,   514,   515,   518,   526,   535,
     544,   550,   559,   559,   564,   564,   568,   569,   573,   574,
     578,   579,   580,   581,   582,   583,   584,   587,   587,   592,
     591,   602,   604,   609,   613,   617,   617,   627,   629,   633,
     649,   650,   655,   659,   662,   654,   668,   669,   670,   679,
     679,   683,   688,   698,   699,   703,   706,   709,   715,   716,
     717,   721,   722,   723,   724,   725,   735,   745,   748,   750,
     754,   755,   756,   754,   763,   762,   794,   795,   799,   800,
     805,   806,   810,   811,   815,   816,   817,   818,   819,   820,
     821,   822,   823,   827,   832,   834,   839,   841,   843,   847,
     855,   856,   860,   865,   866,   870,   871,   871,   884,   885,
     889,   890,   891,   892,   893,   894,   899,   900,   904,   905,
     910,   909,   914,   920,   921,   924,   930,   935,   934,   942,
     941,   951,   952,   958,   960,   966,   972,   973,   985,   989,
     991,   992,   993,   997,   998,  1002,  1003,  1007,  1015,  1017,
    1026,  1033,  1042,  1050,  1060,  1061,  1062,  1063,  1064,  1064,
    1079,  1083,  1083,  1085,  1086,  1086,  1088,  1092,  1093,  1096,
    1098,  1099,  1100,  1101,  1105,  1106,  1107,  1108,  1109,  1110,
    1114,  1125,  1127,  1129,  1131,  1133,  1135,  1137,  1139,  1141,
    1143,  1145,  1147,  1149,  1151,  1153,  1155,  1157,  1159,  1161,
    1163,  1165,  1167,  1169,  1171,  1173,  1175,  1177,  1179,  1181,
    1183,  1185,  1187,  1189,  1191,  1193,  1195,  1197,  1200,  1202,
    1206,  1208,  1210,  1213,  1220,  1219,  1228,  1229,  1230,  1231,
    1235,  1235,  1241,  1243,  1245,  1247,  1249,  1251,  1253,  1255,
    1257,  1259,  1261,  1263,  1265,  1270,  1277,  1278,  1279,  1280,
    1285,  1286,  1287,  1290,  1291,  1296,  1295,  1305,  1306,  1312,
    1318,  1320,  1324,  1328,  1329,  1333,  1334,  1335,  1338,  1342,
    1348,  1350,  1356,  1357,  1361,  1363,  1365,  1367,  1369,  1371,
    1373,  1375,  1380,  1381,  1382,  1383,  1384,  1385,  1389,  1390,
    1394,  1395,  1399,  1400,  1404,  1405,  1412,  1419,  1420,  1421,
    1425,  1426,  1430,  1431,  1435,  1436,  1440,  1441,  1444,  1444,
    1448,  1448,  1453,  1454,  1456,  1456,  1461,  1466,  1469,  1470,
    1474,  1475,  1476,  1477,  1478,  1482,  1483,  1484,  1485,  1489,
    1490
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
      91,    93,    40,    41,    33,    45,   126,    43,    42,    47,
      37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
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
     203,   203,   203,   204,   204,   205,   205,   206,   207,   207,
     208,   208,   209,   209,   210,   210,   210,   210,   211,   210,
     210,   212,   210,   210,   213,   210,   210,   210,   210,   210,
     210,   210,   210,   210,   214,   214,   214,   214,   214,   214,
     215,   216,   216,   216,   216,   216,   216,   216,   216,   216,
     216,   216,   216,   216,   216,   216,   216,   216,   216,   216,
     216,   216,   216,   216,   216,   216,   216,   216,   216,   216,
     216,   216,   216,   216,   216,   216,   216,   216,   216,   216,
     216,   216,   216,   216,   217,   216,   216,   216,   216,   216,
     219,   218,   220,   220,   220,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   221,   222,   222,   222,   222,
     222,   222,   222,   223,   223,   225,   224,   226,   226,   226,
     226,   226,   227,   228,   228,   229,   229,   229,   230,   231,
     231,   231,   231,   231,   232,   232,   232,   232,   232,   232,
     232,   232,   233,   233,   233,   233,   233,   233,   234,   234,
     235,   235,   236,   236,   237,   237,   237,   238,   238,   238,
     239,   239,   240,   240,   241,   241,   242,   242,   244,   243,
     246,   245,   247,   247,   248,   247,   249,   249,   249,   249,
     250,   250,   250,   250,   250,   251,   251,   251,   251,   252,
     252
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
       3,     3,     5,     0,     1,     4,     4,     4,     0,     3,
       1,     1,     1,     1,     1,     1,     1,     3,     0,     1,
       0,     0,     0,    10,     0,     9,     0,     2,     0,     3,
       0,     1,     1,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     5,     3,     3,     3,     3,     5,     5,
       0,     3,     2,     0,     3,     3,     0,     4,     0,     2,
       1,     1,     1,     1,     4,     1,     1,     1,     1,     1,
       0,     5,     1,     0,     2,     3,     3,     0,     5,     0,
       5,     0,     1,     3,     3,     5,     1,     2,     0,     2,
       2,     1,     1,     0,     1,     2,     1,     1,     3,     2,
       1,     3,     2,     1,     1,     1,     2,     2,     0,     4,
       4,     0,     6,     1,     0,     6,     2,     2,     2,     2,
       1,     1,     1,     0,     1,     1,     1,     1,     1,     1,
       1,     3,     4,     4,     4,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     6,     6,
       6,     7,     4,     4,     6,     6,     7,     4,     4,     4,
       4,     6,     7,     3,     0,     9,     1,     1,     1,     3,
       0,     5,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     4,     1,     1,     1,     1,
       3,     3,     3,     1,     1,     0,     5,     0,     3,     1,
       5,     3,     2,     0,     2,     1,     1,     4,     2,     3,
       5,     1,     3,     0,     6,     6,     5,     5,     4,     4,
       4,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       0,     1,     3,     1,     1,     4,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     0,     2,
       0,     2,     1,     3,     0,     4,     1,     3,     2,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    13,     0,     0,     0,    51,    52,    22,     0,    80,
       0,    45,     0,     0,     2,     3,    12,     0,     7,     6,
      10,     5,     8,     9,     0,     0,     0,     0,   318,     0,
       0,     0,   184,   185,   186,   187,   188,   190,     0,   189,
       0,     0,   153,    11,     1,     4,    15,    17,    14,     0,
       0,     0,     0,    49,   310,   308,   309,   311,    53,   307,
       0,    20,    81,    16,    24,   157,     0,    33,    32,    36,
      35,   153,    28,     0,    34,    37,   154,   156,    18,    19,
      50,     0,   330,   331,   332,   333,   334,   337,   335,   336,
     338,   298,   316,   326,   319,   322,   299,   317,    90,     0,
       0,    90,     0,    31,    29,    46,     0,     0,    39,     0,
       0,   155,   328,   329,   324,     0,    95,    94,    96,    97,
      99,    98,     0,   100,     0,   101,   102,     0,    63,    92,
       0,    21,     0,     0,    41,     0,    90,    30,   300,   327,
       0,   323,     0,    68,    54,    64,     0,    23,    82,   312,
     313,   314,     0,   315,     0,     0,   320,    38,   316,    44,
     301,   303,   304,   325,     0,     0,    71,    72,    74,    73,
      75,    76,   318,     0,    70,    56,    93,    56,     0,    42,
      40,     0,     0,   318,     0,    67,    66,     0,     0,    65,
      57,   148,   148,    26,    27,    25,   306,   321,     0,   302,
      77,    69,    59,     0,   152,   151,     0,     0,   148,     0,
     146,     0,   305,     0,   150,    58,    55,   147,     0,   183,
     149,    83,    60,     0,   159,     0,     0,     0,     0,     0,
       0,     0,   168,     0,   171,   174,     0,     0,     0,   240,
       0,   126,   127,   256,   257,   258,   300,   234,   173,   181,
       0,   182,   132,     0,   164,   236,   237,   238,   265,   180,
     165,   259,   118,     0,   177,     0,     0,     0,     0,   179,
       0,   166,   167,     0,     0,     0,     0,   339,   340,     0,
     137,   176,   259,   139,     0,    84,   178,   283,   130,   158,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   264,   263,     0,   318,     0,    61,
       0,     0,     0,   292,   293,   294,   295,   296,   297,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   141,   141,   283,   110,     0,   281,     0,   118,   133,
     267,   242,   243,   244,   245,   248,   249,   250,   251,   247,
     246,   252,   253,   254,   239,     0,     0,     0,   337,   338,
     300,     0,     0,     0,   233,   316,   191,     0,   261,   262,
     260,   120,   121,   122,   123,   125,   119,   118,     0,   288,
     290,     0,     0,   289,   291,     0,   230,   163,   169,   160,
     170,     0,     0,   229,   337,     0,   142,   273,     0,     0,
      88,     0,     0,     0,   278,     0,   337,     0,   269,   318,
     222,   223,   228,   227,   255,   192,   193,   194,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   318,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    62,   286,     0,   287,     0,     0,
     318,   162,     0,     0,     0,     0,     0,   138,   272,   140,
     241,     0,     0,     0,     0,   282,     0,   279,     0,   134,
       0,   128,   129,   131,     0,     0,     0,   266,     0,     0,
     318,     0,   318,   200,   209,   210,   214,   203,   204,   205,
     208,   206,   207,   198,   211,   212,   213,   202,     0,   196,
     217,   195,   197,   199,   201,   215,   216,     0,     0,   284,
     285,   231,     0,   161,   172,   175,   143,   337,   144,   275,
     276,   274,   112,     0,     0,     0,     0,    86,   111,     0,
       0,   273,   135,   271,   337,   268,   224,   220,     0,   225,
       0,   218,   219,   124,   232,     0,     0,    89,     0,     0,
       0,     0,   113,     0,   280,   267,   136,     0,   221,   226,
     145,     0,   104,     0,   105,   107,     0,   106,     0,     0,
      87,     0,   270,   277,     0,     0,     0,   116,     0,    85,
       0,   235,   103,   109,   108,     0,   118,   114,     0,   115,
     117
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    13,    14,    15,    16,    25,    17,    18,    19,    31,
      70,   102,   195,    71,    72,   109,   110,   136,   157,    20,
      42,    73,    21,    29,    22,    30,    98,   175,   191,   206,
     213,   222,   146,   125,   126,   173,   174,   207,    23,    40,
     101,   177,   249,   334,   552,   463,   127,   128,   129,   527,
     400,   464,   569,   580,   585,   309,   376,   250,   473,   251,
     339,   405,   474,   252,   331,   332,   395,   208,   209,   210,
      75,    76,    77,   220,   388,   389,   253,   273,   275,   276,
      38,    39,   254,   287,   255,   284,   256,   257,   258,   308,
     259,   290,   407,   396,   458,   521,   336,   337,   260,   320,
      92,   159,   160,   161,    58,    59,   151,   162,   397,    51,
      52,   181,   182,    94,   140,    95,    96,    97,   279
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -447
static const yytype_int16 yypact[] =
{
      52,  -447,    24,   -90,   -69,   -79,  -447,  -447,   239,  -447,
     -54,  -447,    90,   118,    52,  -447,  -447,   123,  -447,  -447,
    -447,  -447,  -447,  -447,    26,   124,    65,    73,  -447,   150,
     135,   239,  -447,  -447,  -447,  -447,  -447,  -447,    58,  -447,
      59,   152,    37,  -447,  -447,  -447,  -447,  -447,  -447,    70,
      92,    81,   395,  -447,  -447,  -447,  -447,  -447,  -447,  -447,
      69,    85,  -447,  -447,  -447,  -447,   205,  -447,  -447,  -447,
    -447,   199,  -447,   121,  -447,     1,   128,  -447,  -447,  -447,
    -447,   447,  -447,  -447,  -447,  -447,  -447,  -447,  -447,  -447,
    -447,  -447,  -447,   155,   -46,  -447,  -447,  -447,   734,   112,
     198,   734,   127,  -447,  -447,  -447,   447,   129,  -447,   228,
     157,  -447,  -447,   447,  -447,   395,  -447,  -447,  -447,  -447,
    -447,  -447,   119,  -447,   142,  -447,  -447,   268,    -1,  -447,
     198,  -447,   275,   617,  -447,   211,   734,  -447,   589,  -447,
     395,  -447,    25,    72,  -447,  -447,   734,  -447,  -447,  -447,
    -447,  -447,   161,  -447,   179,   189,  -447,  -447,   173,  -447,
     223,  -447,  -447,  -447,   174,   176,  -447,  -447,  -447,  -447,
    -447,  -447,  -447,   -56,  -447,   296,  -447,   296,    -2,  -447,
    -447,   180,   395,  -447,   589,  -447,  -447,   182,    72,  -447,
    -447,     2,     2,  -447,  -447,  -447,  -447,   -46,   183,  -447,
    -447,  -447,  -447,   306,  -447,  -447,   307,   242,   120,   462,
    -447,   243,  -447,   239,  -447,  -447,  -447,  -447,   324,   566,
    -447,  -447,  -447,    67,  -447,   -76,   257,   313,   447,   248,
     225,   226,  -447,   227,   222,  -447,   -53,   345,   214,  -447,
     329,  -447,  -447,  -447,  -447,  -447,   589,  -447,  -447,  -447,
     333,  -447,  -447,   335,  -447,  -447,  -447,  -447,  -447,  -447,
    -447,   615,  -447,   320,  -447,   447,   158,   447,   266,  -447,
     270,  -447,  -447,   239,   272,   239,   239,  -447,  -447,   233,
    -447,  -447,    28,  -447,   224,  -447,  -447,    64,  -447,  -447,
     232,   447,   447,   447,   447,   447,   447,   447,   447,   447,
     447,   447,   447,   447,  -447,  -447,    86,  -447,   692,     3,
     241,   337,   -76,  -447,  -447,  -447,  -447,  -447,  -447,   -76,
     447,   353,   -76,   -76,   447,   447,   260,   248,   265,   267,
     447,   636,   636,    64,  -447,   352,  -447,   -47,  -447,  -447,
     650,  -447,  -447,  -447,  -447,  -447,  -447,  -447,  -447,  -447,
    -447,  -447,  -447,  -447,  -447,   603,   -53,   269,   252,   278,
     589,   447,   447,   447,  -447,    39,   555,   280,  -447,  -447,
    -447,  -447,  -447,  -447,   281,  -447,  -447,  -447,   -76,  -447,
    -447,   380,   -76,  -447,  -447,   394,    -8,   309,   336,  -447,
    -447,   288,   290,  -447,   390,   -38,  -447,  -447,   -35,   -30,
      16,   248,   165,   292,     3,     4,   397,   -25,  -447,  -447,
      11,    33,  -447,  -447,  -447,  -447,  -447,  -447,   447,   447,
     447,   447,   447,   447,   447,   447,   447,   447,   447,   447,
     447,   447,   447,  -447,   447,   447,   447,   447,   447,   447,
     447,   447,   301,   317,     3,  -447,   -76,  -447,   -76,   447,
    -447,  -447,   260,   198,   198,   447,   664,  -447,   208,  -447,
    -447,   447,   447,   -33,   424,  -447,   409,  -447,   431,  -447,
     447,  -447,  -447,  -447,   426,   447,   678,  -447,   310,   447,
    -447,   447,  -447,  -447,  -447,  -447,  -447,  -447,  -447,  -447,
    -447,  -447,  -447,  -447,  -447,  -447,  -447,  -447,   312,  -447,
    -447,  -447,  -447,  -447,  -447,  -447,  -447,   447,   311,  -447,
    -447,  -447,   314,  -447,  -447,  -447,  -447,   417,  -447,  -447,
     318,  -447,  -447,   435,   447,   447,   706,   128,  -447,   248,
     319,  -447,  -447,  -447,   422,  -447,  -447,  -447,   322,  -447,
     323,  -447,  -447,  -447,  -447,   447,   346,  -447,     6,   451,
       8,    19,  -447,   453,  -447,   650,   208,   447,  -447,  -447,
    -447,   338,  -447,   447,  -447,  -447,   447,  -447,   447,    62,
    -447,   -20,  -447,  -447,   455,   456,   458,  -447,   248,  -447,
     461,  -447,  -447,  -447,  -447,   239,  -447,  -447,   260,     3,
    -447
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -447,  -447,  -447,   454,    -9,  -447,  -447,  -447,  -447,  -447,
     251,  -447,  -447,  -447,   400,  -447,  -447,  -447,   113,  -447,
    -447,  -447,    -3,  -447,  -447,  -447,  -447,  -447,   300,  -447,
    -447,  -447,  -447,  -447,  -447,  -447,   291,   286,  -447,  -447,
    -447,  -447,  -447,  -447,  -447,  -447,   -71,  -447,   334,  -447,
    -447,  -447,  -447,  -447,  -447,  -324,  -447,  -447,  -447,  -447,
    -447,  -447,  -447,  -447,  -447,  -447,   154,  -447,  -447,   279,
     283,  -447,   -75,  -447,  -447,  -446,  -447,  -447,  -447,  -447,
     -31,   133,  -447,  -447,  -447,  -447,  -447,  -447,    31,  -447,
    -224,  -447,   -62,  -336,   -24,  -447,    99,   177,  -447,   244,
    -127,   263,  -447,   327,  -447,   207,  -208,   383,   -43,  -148,
    -447,  -447,  -447,   331,  -447,   -67,  -447,   -98,   162
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -260
static const yytype_int16 yytable[] =
{
      60,   111,   131,   -91,   408,   -43,   513,   202,   469,    93,
     562,   158,   565,   281,   404,   106,   188,   264,    26,   371,
     372,   373,   374,   567,   187,   402,   114,   461,   149,   107,
     132,    24,   147,    69,   456,   198,   150,   456,   112,    74,
      27,    28,   402,     2,   524,     3,     4,   476,   141,   277,
     525,   526,   476,   444,    41,   278,     1,   158,     2,     5,
       3,     4,    69,   134,   449,   155,    64,   189,    74,   470,
     139,   145,    93,   163,     5,   -78,   403,     6,   563,   108,
     566,     7,   364,   479,   471,   457,   472,   115,   459,   577,
     153,   568,   261,   460,    43,   153,   -91,    93,   477,   375,
     354,   462,   270,   581,   379,   481,   193,   355,   203,   194,
     282,   380,   450,     8,   383,   384,   204,   205,    44,   158,
     518,   166,   167,   168,   169,   522,   578,    46,    48,   164,
       9,   480,    10,   165,    65,    47,   -47,    49,   579,    93,
     535,   153,   590,    66,   304,    50,   305,    10,   356,   357,
      11,    67,    68,   482,    53,   304,    63,   305,    12,   367,
     338,  -259,    61,    62,    82,    83,    84,    85,   312,    86,
     445,   262,   335,    99,   447,   263,   170,    91,    78,   365,
     171,   369,   223,   266,   268,   269,    82,    83,    84,    85,
     243,    86,   172,   -79,   358,    88,    89,   359,   360,    91,
     390,    79,    80,   153,   100,     2,   338,     3,     4,   103,
     361,   362,   363,   313,   314,   315,   316,   317,   318,   408,
     105,     5,   311,   519,   321,    65,   203,   520,    64,   113,
     319,   130,   137,   158,   204,   205,   133,   135,   509,    54,
     510,   142,   326,    55,   328,   329,    56,    57,   341,   342,
     343,   344,   345,   346,   347,   348,   349,   350,   351,   352,
     353,   478,   589,   366,   143,    82,    83,    84,    85,   138,
      86,   265,   144,   466,   465,   338,   322,   381,    91,   148,
     178,   385,   386,   154,   179,   498,   180,   393,    32,    33,
      34,    35,    36,   183,    10,   184,    65,   185,   -48,   186,
     190,   196,   512,   200,   212,    66,    87,    88,    89,    90,
     214,   215,   411,    67,    68,   216,   221,   153,   415,   416,
     417,   313,   314,   315,   316,   317,   318,   267,   224,   271,
     272,   -24,   538,   285,   540,   274,   283,   288,   323,   289,
     310,   282,   325,    37,   327,   377,   333,   378,    82,    83,
      84,    85,   330,    86,   340,   514,   515,    82,    83,    84,
      85,    91,    86,   382,   387,    87,    88,    89,    90,   391,
      91,   392,   401,   413,  -257,   483,   484,   485,   486,   487,
     488,   489,   490,   491,   492,   493,   494,   495,   496,   497,
     446,   499,   500,   501,   502,   503,   504,   505,   506,   551,
    -258,   442,   554,   443,   448,   451,   511,   453,   452,   454,
     455,   468,   516,    82,    83,    84,    85,   475,    86,   523,
     507,    87,    88,    89,    90,   508,    91,   531,   528,   529,
     532,   536,   533,   541,   543,   544,   537,   545,   539,   547,
     546,   555,   557,   558,   559,    82,    83,    84,    85,   243,
      86,   586,   553,   244,   561,   564,   245,   570,    91,   582,
     583,   573,   584,   218,   542,   587,  -153,   280,    45,    81,
     248,   104,  -153,   414,  -153,  -153,  -153,   192,   211,   201,
     176,   548,   549,  -153,  -153,  -153,   398,   217,   410,  -153,
    -153,  -153,   219,   571,  -153,    82,    83,    84,    85,   530,
      86,   467,   560,    87,    88,    89,    90,   556,    91,   286,
     399,   199,   324,   197,   572,   370,   152,     0,   412,     0,
     574,     0,     0,   575,  -153,   576,     0,  -153,  -153,  -153,
       0,    82,    83,    84,    85,   243,    86,  -153,     0,   244,
       0,  -153,   245,  -153,    91,     0,     0,    82,    83,    84,
      85,     0,    86,     0,   588,    87,    88,    89,    90,    65,
      91,     0,  -153,  -153,  -153,  -153,  -153,  -153,     0,     0,
    -153,     0,     0,  -153,  -153,  -153,   225,     0,   226,   227,
     228,     0,     0,     0,  -153,     0,     0,   229,   230,   231,
       0,     0,     0,   232,   233,   234,   418,     0,   235,     0,
       0,     0,   419,   420,     0,     0,     0,     0,     0,   421,
     422,   423,   424,   425,   426,   427,     0,     0,     0,     0,
       0,     0,     0,   428,   429,   430,   431,     0,   236,     0,
       0,   237,   238,   239,     0,     0,     0,     0,     0,     0,
       0,   240,     0,     0,     0,   241,     0,   242,   291,   292,
     293,   294,   295,   296,   297,   298,     0,   299,   300,   301,
     302,   303,     0,     0,     0,     0,    82,    83,    84,    85,
     243,    86,   432,     0,   244,   433,     0,   245,   246,    91,
     434,   435,   436,   437,   438,   439,   440,   441,   247,    82,
      83,    84,    85,   149,    86,     0,     0,    87,    88,    89,
      90,   150,    91,    82,    83,    84,    85,    37,    86,   156,
       0,    87,    88,    89,    90,     0,    91,    82,    83,    84,
      85,   149,    86,   409,     0,    87,    88,    89,    90,   150,
      91,   304,     0,   305,   306,   307,    82,    83,    84,    85,
       0,    86,     0,     0,   394,    88,    89,    90,     0,    91,
      82,    83,    84,    85,     0,    86,     0,     0,   406,    88,
      89,    90,     0,    91,    82,    83,    84,    85,     0,    86,
       0,     0,   517,    88,    89,    90,     0,    91,    82,    83,
      84,    85,     0,    86,     0,     0,   534,    88,    89,    90,
       0,    91,    82,    83,    84,    85,    54,    86,     0,     0,
     368,     0,     0,     0,    57,    91,    82,    83,    84,    85,
       0,    86,     0,     0,   550,     0,     0,     0,     0,    91,
     116,   117,   118,   119,   120,   121,   122,   123,   124
};

static const yytype_int16 yycheck[] =
{
      31,    76,   100,     4,   340,     4,   452,     5,     4,    52,
       4,   138,     4,   237,   338,    14,    72,   225,   108,    16,
      17,    18,    19,     4,   172,    72,    72,    11,   104,    28,
     101,     7,   130,    42,    72,   183,   112,    72,    81,    42,
     109,   120,    72,     6,    77,     8,     9,    72,   115,   102,
      83,    84,    72,   377,   108,   108,     4,   184,     6,    22,
       8,     9,    71,   106,    72,   136,    29,   123,    71,    65,
     113,    72,   115,   140,    22,    73,   123,    25,    72,    78,
      72,    29,   306,    72,    80,   123,    82,   133,   123,    27,
     133,    72,   219,   123,     4,   138,    97,   140,   123,    96,
      14,    85,   229,   123,   312,    72,   108,    21,   106,   111,
     237,   319,   120,    61,   322,   323,   114,   115,     0,   246,
     456,    49,    50,    51,    52,   461,    64,     4,     4,   104,
      78,   120,    95,   108,    97,   109,    99,    72,    76,   182,
     476,   184,   588,   106,   116,    72,   118,    95,    62,    63,
      98,   114,   115,   120,     4,   116,     4,   118,   106,   307,
     287,   122,   104,   104,   100,   101,   102,   103,    10,   105,
     378,   104,   108,   104,   382,   108,   104,   113,   108,   306,
     108,   308,   213,   226,   227,   228,   100,   101,   102,   103,
     104,   105,   120,    73,   108,   109,   110,   111,   112,   113,
     327,   109,   121,   246,   119,     6,   333,     8,     9,     4,
     124,   125,   126,    55,    56,    57,    58,    59,    60,   555,
      99,    22,   265,    15,   267,    97,   106,    19,    29,    74,
      72,   119,     4,   360,   114,   115,   109,   108,   446,   104,
     448,   122,   273,   108,   275,   276,   111,   112,   291,   292,
     293,   294,   295,   296,   297,   298,   299,   300,   301,   302,
     303,   409,   586,   306,   122,   100,   101,   102,   103,   112,
     105,    14,     4,   108,   401,   402,    10,   320,   113,     4,
     119,   324,   325,    72,   105,   433,    97,   330,    49,    50,
      51,    52,    53,   120,    95,    72,    97,   123,    99,   123,
       4,   121,   450,   121,   121,   106,   108,   109,   110,   111,
       4,     4,   355,   114,   115,    73,    73,   360,   361,   362,
     363,    55,    56,    57,    58,    59,    60,    14,     4,   104,
     104,   109,   480,     4,   482,   108,   122,     4,    72,     4,
      20,   468,    72,   104,    72,   104,   122,    10,   100,   101,
     102,   103,   119,   105,   122,   453,   454,   100,   101,   102,
     103,   113,   105,    10,   104,   108,   109,   110,   111,   104,
     113,   104,    20,   104,   122,   418,   419,   420,   421,   422,
     423,   424,   425,   426,   427,   428,   429,   430,   431,   432,
      10,   434,   435,   436,   437,   438,   439,   440,   441,   526,
     122,   121,   529,   122,    10,    96,   449,   119,    72,   119,
      20,   119,   455,   100,   101,   102,   103,    20,   105,   462,
     119,   108,   109,   110,   111,   108,   113,   470,     4,    20,
       4,   121,   475,   121,   123,   121,   479,    20,   481,     4,
     122,   122,    20,   121,   121,   100,   101,   102,   103,   104,
     105,   578,   527,   108,   108,     4,   111,     4,   113,     4,
       4,   123,     4,     1,   507,     4,     4,   122,    14,    74,
     219,    71,    10,   360,    12,    13,    14,   177,   192,   188,
     146,   524,   525,    21,    22,    23,   332,   208,   355,    27,
      28,    29,   209,   555,    32,   100,   101,   102,   103,   468,
     105,   402,   545,   108,   109,   110,   111,   531,   113,   246,
     333,   184,   268,   182,   557,   308,   133,    -1,   356,    -1,
     563,    -1,    -1,   566,    62,   568,    -1,    65,    66,    67,
      -1,   100,   101,   102,   103,   104,   105,    75,    -1,   108,
      -1,    79,   111,    81,   113,    -1,    -1,   100,   101,   102,
     103,    -1,   105,    -1,   585,   108,   109,   110,   111,    97,
     113,    -1,   100,   101,   102,   103,   104,   105,    -1,    -1,
     108,    -1,    -1,   111,   112,   113,    10,    -1,    12,    13,
      14,    -1,    -1,    -1,   122,    -1,    -1,    21,    22,    23,
      -1,    -1,    -1,    27,    28,    29,    41,    -1,    32,    -1,
      -1,    -1,    47,    48,    -1,    -1,    -1,    -1,    -1,    54,
      55,    56,    57,    58,    59,    60,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    69,    70,    71,    -1,    62,    -1,
      -1,    65,    66,    67,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    -1,    -1,    -1,    79,    -1,    81,    33,    34,
      35,    36,    37,    38,    39,    40,    -1,    42,    43,    44,
      45,    46,    -1,    -1,    -1,    -1,   100,   101,   102,   103,
     104,   105,   117,    -1,   108,   120,    -1,   111,   112,   113,
     125,   126,   127,   128,   129,   130,   131,   132,   122,   100,
     101,   102,   103,   104,   105,    -1,    -1,   108,   109,   110,
     111,   112,   113,   100,   101,   102,   103,   104,   105,   120,
      -1,   108,   109,   110,   111,    -1,   113,   100,   101,   102,
     103,   104,   105,   120,    -1,   108,   109,   110,   111,   112,
     113,   116,    -1,   118,   119,   120,   100,   101,   102,   103,
      -1,   105,    -1,    -1,   108,   109,   110,   111,    -1,   113,
     100,   101,   102,   103,    -1,   105,    -1,    -1,   108,   109,
     110,   111,    -1,   113,   100,   101,   102,   103,    -1,   105,
      -1,    -1,   108,   109,   110,   111,    -1,   113,   100,   101,
     102,   103,    -1,   105,    -1,    -1,   108,   109,   110,   111,
      -1,   113,   100,   101,   102,   103,   104,   105,    -1,    -1,
     108,    -1,    -1,    -1,   112,   113,   100,   101,   102,   103,
      -1,   105,    -1,    -1,   108,    -1,    -1,    -1,    -1,   113,
      86,    87,    88,    89,    90,    91,    92,    93,    94
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
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
     203,   171,   121,   164,     4,     4,    73,   203,     1,   204,
     207,    73,   165,   214,     4,    10,    12,    13,    14,    21,
      22,    23,    27,    28,    29,    32,    62,    65,    66,    67,
      75,    79,    81,   104,   108,   111,   112,   122,   144,   176,
     191,   193,   197,   210,   216,   218,   220,   221,   222,   224,
     232,   234,   104,   108,   240,    14,   242,    14,   242,   242,
     234,   104,   104,   211,   108,   212,   213,   102,   108,   252,
     122,   224,   234,   122,   219,     4,   235,   217,     4,     4,
     225,    33,    34,    35,    36,    37,    38,    39,    40,    42,
      43,    44,    45,    46,   116,   118,   119,   120,   223,   189,
      20,   242,    10,    55,    56,    57,    58,    59,    60,    72,
     233,   242,    10,    72,   233,    72,   214,    72,   214,   214,
     119,   198,   199,   122,   177,   108,   230,   231,   234,   194,
     122,   242,   242,   242,   242,   242,   242,   242,   242,   242,
     242,   242,   242,   242,    14,    21,    62,    63,   108,   111,
     112,   124,   125,   126,   224,   234,   242,   243,   108,   234,
     239,    16,    17,    18,    19,    96,   190,   104,    10,   240,
     240,   242,    10,   240,   240,   242,   242,   104,   208,   209,
     234,   104,   104,   242,   108,   200,   227,   242,   200,   231,
     184,    20,    72,   123,   189,   195,   108,   226,   227,   120,
     215,   242,   252,   104,   152,   242,   242,   242,    41,    47,
      48,    54,    55,    56,    57,    58,    59,    60,    68,    69,
      70,    71,   117,   120,   125,   126,   127,   128,   129,   130,
     131,   132,   121,   122,   189,   240,    10,   240,    10,    72,
     120,    96,    72,   119,   119,    20,    72,   123,   228,   123,
     123,    11,    85,   179,   185,   234,   108,   230,   119,     4,
      65,    80,    82,   192,   196,    20,    72,   123,   243,    72,
     120,    72,   120,   242,   242,   242,   242,   242,   242,   242,
     242,   242,   242,   242,   242,   242,   242,   242,   243,   242,
     242,   242,   242,   242,   242,   242,   242,   119,   108,   240,
     240,   242,   243,   209,   251,   251,   242,   108,   227,    15,
      19,   229,   227,   242,    77,    83,    84,   183,     4,    20,
     222,   242,     4,   242,   108,   227,   121,   242,   243,   242,
     243,   121,   242,   123,   121,    20,   122,     4,   242,   242,
     108,   234,   178,   206,   234,   122,   228,    20,   121,   121,
     242,   108,     4,    72,     4,     4,    72,     4,    72,   186,
       4,   226,   242,   123,   242,   242,   242,    27,    64,    76,
     187,   123,     4,     4,     4,   188,   234,     4,   214,   189,
     209
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
#line 487 "compilers/imcc/imcc.y"
    { if (yynerrs) YYABORT; (yyval.i) = 0; }
    break;

  case 5:
#line 496 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 6:
#line 497 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 7:
#line 498 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 8:
#line 499 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); 
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit); 
                     IMCC_INFO(interp)->cur_unit = 0; }
    break;

  case 9:
#line 502 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i);
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                     IMCC_INFO(interp)->cur_unit = 0; }
    break;

  case 10:
#line 505 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i);
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                     IMCC_INFO(interp)->cur_unit = 0; }
    break;

  case 11:
#line 508 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 12:
#line 509 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 13:
#line 510 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 14:
#line 513 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 15:
#line 514 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 16:
#line 515 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; do_loadlib(interp, (yyvsp[(2) - (3)].s)); }
    break;

  case 17:
#line 519 "compilers/imcc/imcc.y"
    { if ((yyvsp[(2) - (2)].s))
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 18:
#line 527 "compilers/imcc/imcc.y"
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
#line 536 "compilers/imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                CONTEXT(((Interp*)interp)->ctx)->current_HLL, atoi((yyvsp[(2) - (4)].s)), atoi((yyvsp[(4) - (4)].s)));
             (yyval.t) = 0;
         }
    break;

  case 20:
#line 545 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 21:
#line 551 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 22:
#line 559 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 23:
#line 560 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1); is_def=0; }
    break;

  case 24:
#line 564 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 25:
#line 565 "compilers/imcc/imcc.y"
    { (yyval.i) = mk_pmc_const(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].s)); is_def=0; }
    break;

  case 30:
#line 578 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 31:
#line 579 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 32:
#line 580 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 33:
#line 581 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 34:
#line 582 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 37:
#line 587 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 38:
#line 589 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(2) - (3)].s),0,regs,nargs,keyvec,1);
                     free((yyvsp[(2) - (3)].s)); }
    break;

  case 39:
#line 592 "compilers/imcc/imcc.y"
    {
                    imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                    IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM);
                    }
    break;

  case 40:
#line 597 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit,
                                mk_sub_label(interp, (yyvsp[(4) - (4)].s)));
                     IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(3) - (4)].t);
                   }
    break;

  case 41:
#line 603 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(2) - (2)].sr)); }
    break;

  case 42:
#line 605 "compilers/imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, (yyvsp[(4) - (4)].s));
                       set_lexical(interp, r, (yyvsp[(2) - (4)].s)); (yyval.i) = 0;
                   }
    break;

  case 43:
#line 609 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 45:
#line 617 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 46:
#line 619 "compilers/imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     (yyval.i)=0; }
    break;

  case 49:
#line 634 "compilers/imcc/imcc.y"
    {
                    int re_open = 0;
                    (yyval.i) = 0;
                    if (IMCC_INFO(interp)->state->pasm_file && cur_namespace) {
                        imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                        re_open = 1;
                    }
                    IMCC_INFO(interp)->cur_namespace = (yyvsp[(2) - (3)].sr);
                    cur_namespace = (yyvsp[(2) - (3)].sr);
                    if (re_open)
                        IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM);
                }
    break;

  case 50:
#line 649 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); }
    break;

  case 51:
#line 650 "compilers/imcc/imcc.y"
    { (yyval.sr) = NULL; }
    break;

  case 52:
#line 655 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 53:
#line 659 "compilers/imcc/imcc.y"
    {
          iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (3)].sr));
        }
    break;

  case 54:
#line 662 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(5) - (6)].t); }
    break;

  case 55:
#line 664 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
    break;

  case 56:
#line 668 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 57:
#line 669 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 58:
#line 670 "compilers/imcc/imcc.y"
    { 
         if (adv_named_id) {
             add_pcc_named_param(interp,IMCC_INFO(interp)->cur_call,adv_named_id,(yyvsp[(2) - (3)].sr));
             adv_named_id = NULL;
         } else add_pcc_param(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
   }
    break;

  case 59:
#line 679 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 60:
#line 679 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(3) - (3)].sr); is_def=0; }
    break;

  case 61:
#line 683 "compilers/imcc/imcc.y"
    { if ((yyvsp[(3) - (3)].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
                                         (yyval.sr)->type |= (yyvsp[(3) - (3)].t); }
    break;

  case 62:
#line 688 "compilers/imcc/imcc.y"
    { 
                                         if ((yyvsp[(5) - (5)].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[(4) - (5)].s), (yyvsp[(1) - (5)].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[(4) - (5)].s), (yyvsp[(1) - (5)].t));
                                         (yyval.sr)->type |= (yyvsp[(5) - (5)].t);
                                         adv_named_set(interp,(yyvsp[(2) - (5)].s));}
    break;

  case 63:
#line 698 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  }
    break;

  case 65:
#line 703 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 66:
#line 707 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; IMCC_INFO(interp)->cur_unit->outer =
                     mk_sub_address_fromc(interp, (yyvsp[(3) - (4)].s)); }
    break;

  case 67:
#line 710 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; IMCC_INFO(interp)->cur_unit->outer =
                     mk_const(interp, (yyvsp[(3) - (4)].s), 'S'); }
    break;

  case 68:
#line 715 "compilers/imcc/imcc.y"
    { add_pcc_multi(IMCC_INFO(interp)->cur_call, NULL); }
    break;

  case 69:
#line 716 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr)); }
    break;

  case 70:
#line 717 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr));}
    break;

  case 71:
#line 721 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 72:
#line 722 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 73:
#line 723 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 74:
#line 724 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 75:
#line 725 "compilers/imcc/imcc.y"
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

  case 76:
#line 735 "compilers/imcc/imcc.y"
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

  case 77:
#line 745 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); }
    break;

  case 80:
#line 754 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 81:
#line 755 "compilers/imcc/imcc.y"
    { iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit, mk_sub_label(interp, (yyvsp[(3) - (3)].s))); }
    break;

  case 82:
#line 756 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[(5) - (6)].t); }
    break;

  case 83:
#line 758 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
    break;

  case 84:
#line 763 "compilers/imcc/imcc.y"
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

  case 85:
#line 790 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
    break;

  case 86:
#line 794 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->label = 0; }
    break;

  case 87:
#line 795 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->label = 1; }
    break;

  case 88:
#line 799 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; }
    break;

  case 89:
#line 801 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->object = (yyvsp[(2) - (3)].sr); }
    break;

  case 90:
#line 805 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 92:
#line 810 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (1)].t); }
    break;

  case 93:
#line 811 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (3)].t) | (yyvsp[(3) - (3)].t); }
    break;

  case 94:
#line 815 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_LOAD; }
    break;

  case 95:
#line 816 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_MAIN; }
    break;

  case 96:
#line 817 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_IMMEDIATE; }
    break;

  case 97:
#line 818 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_POSTCOMP; }
    break;

  case 98:
#line 819 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_ANON; }
    break;

  case 99:
#line 820 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_METHOD; }
    break;

  case 100:
#line 821 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_NEED_LEX; }
    break;

  case 103:
#line 828 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (5)].sr));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         }
    break;

  case 104:
#line 833 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 105:
#line 835 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr));
            IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 106:
#line 840 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 107:
#line 842 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[(2) - (3)].s),'S')); }
    break;

  case 108:
#line 844 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (5)].sr));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         }
    break;

  case 109:
#line 848 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[(2) - (5)].s),'S'));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[(4) - (5)].sr));
         }
    break;

  case 110:
#line 855 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 111:
#line 856 "compilers/imcc/imcc.y"
    {  add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 112:
#line 860 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (2)].sr); }
    break;

  case 113:
#line 865 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 114:
#line 866 "compilers/imcc/imcc.y"
    {  if((yyvsp[(2) - (3)].sr)) add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 115:
#line 870 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); }
    break;

  case 116:
#line 871 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 117:
#line 872 "compilers/imcc/imcc.y"
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

  case 118:
#line 884 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 119:
#line 885 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); }
    break;

  case 120:
#line 889 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_FLAT;   }
    break;

  case 121:
#line 890 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPTIONAL; }
    break;

  case 122:
#line 891 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPT_FLAG; }
    break;

  case 123:
#line 892 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_NAMED; }
    break;

  case 124:
#line 893 "compilers/imcc/imcc.y"
    {  adv_named_set(interp,(yyvsp[(3) - (4)].s)); (yyval.t) = 0; }
    break;

  case 125:
#line 894 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_UNIQUE_REG; }
    break;

  case 126:
#line 899 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 127:
#line 900 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; }
    break;

  case 130:
#line 910 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, (yyvsp[(1) - (2)].t)); }
    break;

  case 131:
#line 913 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 132:
#line 914 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.i) = 0;  }
    break;

  case 133:
#line 920 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 134:
#line 921 "compilers/imcc/imcc.y"
    {
       if((yyvsp[(1) - (2)].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (2)].sr)); 
   }
    break;

  case 135:
#line 924 "compilers/imcc/imcc.y"
    {
       if((yyvsp[(2) - (3)].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(2) - (3)].sr)); 
   }
    break;

  case 136:
#line 930 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); }
    break;

  case 137:
#line 935 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 138:
#line 940 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 139:
#line 942 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 140:
#line 947 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 141:
#line 951 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 142:
#line 952 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id, (yyvsp[(1) - (1)].sr));
          adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (1)].sr)); }
    break;

  case 143:
#line 958 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[(1) - (3)].s),(yyvsp[(3) - (3)].sr));}
    break;

  case 144:
#line 960 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id,(yyvsp[(3) - (3)].sr));
           adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(3) - (3)].sr));    }
    break;

  case 145:
#line 966 "compilers/imcc/imcc.y"
    {  
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[(3) - (5)].s),(yyvsp[(5) - (5)].sr));}
    break;

  case 148:
#line 985 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 149:
#line 990 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[(2) - (2)].i); }
    break;

  case 150:
#line 991 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 151:
#line 992 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 152:
#line 993 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 153:
#line 997 "compilers/imcc/imcc.y"
    {  (yyval.i) = NULL; }
    break;

  case 157:
#line 1007 "compilers/imcc/imcc.y"
    {
         (yyval.i) = iLABEL(interp, IMCC_INFO(interp)->cur_unit, mk_local_label(interp, (yyvsp[(1) - (1)].s)));
                   }
    break;

  case 158:
#line 1016 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(2) - (3)].i); }
    break;

  case 159:
#line 1018 "compilers/imcc/imcc.y"
    { if (yynerrs >= PARROT_MAX_RECOVER_ERRORS) {
                           IMCC_warning(interp, "Too many errors. Correct some first.\n");
                           YYABORT;
                       }
                       yyerrok; }
    break;

  case 160:
#line 1027 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[(1) - (1)].idlist);
         l->next = NULL;
         (yyval.idlist) = l;
     }
    break;

  case 161:
#line 1034 "compilers/imcc/imcc.y"
    {  
         IdList* l = (yyvsp[(3) - (3)].idlist);
         l->next = (yyvsp[(1) - (3)].idlist);
         (yyval.idlist) = l;
     }
    break;

  case 162:
#line 1043 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = (yyvsp[(1) - (2)].s);
         l->unique_reg = 1;
         (yyval.idlist) = l;
     }
    break;

  case 163:
#line 1051 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = (yyvsp[(1) - (1)].s);
         l->unique_reg = 0;
         (yyval.idlist) = l;
     }
    break;

  case 166:
#line 1062 "compilers/imcc/imcc.y"
    { push_namespace((yyvsp[(2) - (2)].s)); }
    break;

  case 167:
#line 1063 "compilers/imcc/imcc.y"
    { pop_namespace((yyvsp[(2) - (2)].s)); }
    break;

  case 168:
#line 1064 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 169:
#line 1065 "compilers/imcc/imcc.y"
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

  case 170:
#line 1080 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, (yyvsp[(4) - (4)].sr), (yyvsp[(2) - (4)].s)); (yyval.i) = 0;
                    }
    break;

  case 171:
#line 1083 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 172:
#line 1084 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 0);is_def=0; }
    break;

  case 174:
#line 1086 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 175:
#line 1087 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1);is_def=0; }
    break;

  case 176:
#line 1088 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;
                           IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isTAIL_CALL;
                           IMCC_INFO(interp)->cur_call = NULL;
                        }
    break;

  case 177:
#line 1092 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "branch",1, (yyvsp[(2) - (2)].sr)); }
    break;

  case 178:
#line 1094 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (2)].s), 0, regs, nargs, keyvec, 1);
                                          free((yyvsp[(1) - (2)].s)); }
    break;

  case 179:
#line 1097 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(2) - (2)].sr)); }
    break;

  case 180:
#line 1098 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
    break;

  case 181:
#line 1099 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 183:
#line 1101 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 184:
#line 1105 "compilers/imcc/imcc.y"
    { (yyval.t) = 'I'; }
    break;

  case 185:
#line 1106 "compilers/imcc/imcc.y"
    { (yyval.t) = 'N'; }
    break;

  case 186:
#line 1107 "compilers/imcc/imcc.y"
    { (yyval.t) = 'S'; }
    break;

  case 187:
#line 1108 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 188:
#line 1109 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 189:
#line 1110 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; free((yyvsp[(1) - (1)].s)); }
    break;

  case 190:
#line 1115 "compilers/imcc/imcc.y"
    {
             if (( IMCC_INFO(interp)->cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, (yyvsp[(1) - (1)].s), 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", (yyvsp[(1) - (1)].s));
            }
         }
    break;

  case 191:
#line 1126 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr));      }
    break;

  case 192:
#line 1128 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "not", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));      }
    break;

  case 193:
#line 1130 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "neg", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));      }
    break;

  case 194:
#line 1132 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bnot", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));     }
    break;

  case 195:
#line 1134 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "add", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 196:
#line 1136 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "sub", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 197:
#line 1138 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mul", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 198:
#line 1140 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "pow", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 199:
#line 1142 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "div", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 200:
#line 1144 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "fdiv", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 201:
#line 1146 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mod", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 202:
#line 1148 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "concat", 3, (yyvsp[(1) - (5)].sr),(yyvsp[(3) - (5)].sr),(yyvsp[(5) - (5)].sr)); }
    break;

  case 203:
#line 1150 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "iseq", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 204:
#line 1152 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isne", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 205:
#line 1154 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isgt", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 206:
#line 1156 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "islt", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 207:
#line 1158 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isle", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 208:
#line 1160 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isge", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 209:
#line 1162 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shl", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 210:
#line 1164 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shr", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 211:
#line 1166 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "lsr", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 212:
#line 1168 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "and", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 213:
#line 1170 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "or", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));   }
    break;

  case 214:
#line 1172 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "xor", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 215:
#line 1174 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "band", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 216:
#line 1176 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bor", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 217:
#line 1178 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bxor", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 218:
#line 1180 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(5) - (6)].sr)); }
    break;

  case 219:
#line 1182 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 220:
#line 1184 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].s), (yyvsp[(6) - (6)].sr), 1); }
    break;

  case 221:
#line 1186 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].s), (yyvsp[(6) - (7)].sr), 1); }
    break;

  case 222:
#line 1188 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].s), NULL, 1); }
    break;

  case 223:
#line 1190 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 224:
#line 1192 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(1) - (6)].sr), (yyvsp[(5) - (6)].sr)); }
    break;

  case 225:
#line 1194 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 226:
#line 1196 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); }
    break;

  case 227:
#line 1198 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set_addr",
                        2, (yyvsp[(1) - (4)].sr), mk_label_address(interp, (yyvsp[(4) - (4)].s))); }
    break;

  case 228:
#line 1201 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "find_global",2,(yyvsp[(1) - (4)].sr),(yyvsp[(4) - (4)].sr));}
    break;

  case 229:
#line 1203 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "store_global",2, (yyvsp[(2) - (4)].sr),(yyvsp[(4) - (4)].sr)); }
    break;

  case 230:
#line 1207 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 231:
#line 1209 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 232:
#line 1211 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[(2) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); }
    break;

  case 233:
#line 1214 "compilers/imcc/imcc.y"
    {
            add_pcc_result((yyvsp[(3) - (3)].i)->r[0], (yyvsp[(1) - (3)].sr));
            IMCC_INFO(interp)->cur_call = NULL;
            (yyval.i) = 0;
         }
    break;

  case 234:
#line 1220 "compilers/imcc/imcc.y"
    {
            (yyval.i) = IMCC_create_itcall_label(interp);
         }
    break;

  case 235:
#line 1224 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[(6) - (9)].sr));
           IMCC_INFO(interp)->cur_call = NULL;
         }
    break;

  case 239:
#line 1232 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[(1) - (3)].sr)); }
    break;

  case 240:
#line 1235 "compilers/imcc/imcc.y"
    { (yyval.i) = IMCC_create_itcall_label(interp);
                           (yyval.i)->type &= ~ITCALL; (yyval.i)->type |= ITRESULT; }
    break;

  case 241:
#line 1237 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 242:
#line 1242 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "add", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 243:
#line 1244 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "sub", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 244:
#line 1246 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mul", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 245:
#line 1248 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "div", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 246:
#line 1250 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mod", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 247:
#line 1252 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "fdiv", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 248:
#line 1254 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "concat", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 249:
#line 1256 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "band", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 250:
#line 1258 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bor", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 251:
#line 1260 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bxor", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 252:
#line 1262 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shr", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 253:
#line 1264 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shl", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 254:
#line 1266 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "lsr", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 255:
#line 1271 "compilers/imcc/imcc.y"
    { (yyval.i) = func_ins(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(3) - (4)].s),
                                   regs,nargs,keyvec,1);
                     free((yyvsp[(3) - (4)].s));
                   }
    break;

  case 256:
#line 1277 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 257:
#line 1278 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 258:
#line 1279 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 259:
#line 1280 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (1)].sr);
                       if ((yyvsp[(1) - (1)].sr)->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 260:
#line 1285 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); }
    break;

  case 261:
#line 1286 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = mk_const(interp, (yyvsp[(3) - (3)].s), 'S'); }
    break;

  case 262:
#line 1287 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); }
    break;

  case 263:
#line 1290 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 264:
#line 1291 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 265:
#line 1296 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[(1) - (1)].sr));
        }
    break;

  case 266:
#line 1301 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[(2) - (5)].i); }
    break;

  case 267:
#line 1305 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 268:
#line 1306 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, adv_named_id, (yyvsp[(3) - (3)].sr));
           adv_named_id = NULL;
       } else add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr)); 
   }
    break;

  case 269:
#line 1312 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call,adv_named_id,(yyvsp[(1) - (1)].sr));
           adv_named_id = NULL;
       } else add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr));
   }
    break;

  case 270:
#line 1318 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0;
                                     add_pcc_named_arg(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(3) - (5)].s),(yyvsp[(5) - (5)].sr));}
    break;

  case 271:
#line 1320 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_named_arg(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(1) - (3)].s),(yyvsp[(3) - (3)].sr));}
    break;

  case 272:
#line 1324 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); }
    break;

  case 273:
#line 1328 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 274:
#line 1329 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); }
    break;

  case 275:
#line 1333 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT; }
    break;

  case 276:
#line 1334 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_NAMED; }
    break;

  case 277:
#line 1335 "compilers/imcc/imcc.y"
    { adv_named_set(interp,(yyvsp[(3) - (4)].s)); (yyval.t) = 0; }
    break;

  case 278:
#line 1338 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); }
    break;

  case 279:
#line 1342 "compilers/imcc/imcc.y"
    { 
         (yyval.sr) = 0;
         if (adv_named_id) {
             add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,adv_named_id,(yyvsp[(3) - (3)].sr));
             adv_named_id = NULL;
         } else add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(3) - (3)].sr)); }
    break;

  case 280:
#line 1348 "compilers/imcc/imcc.y"
    { 
        add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(3) - (5)].s),(yyvsp[(5) - (5)].sr)); }
    break;

  case 281:
#line 1350 "compilers/imcc/imcc.y"
    { 
       (yyval.sr) = 0;
       if (adv_named_id) {
           add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,adv_named_id,(yyvsp[(1) - (1)].sr));
           adv_named_id = NULL;
       } else add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[(1) - (1)].sr)); }
    break;

  case 282:
#line 1356 "compilers/imcc/imcc.y"
    { add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,(yyvsp[(1) - (3)].s),(yyvsp[(3) - (3)].sr)); }
    break;

  case 283:
#line 1357 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 284:
#line 1362 "compilers/imcc/imcc.y"
    { (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[(3) - (6)].s), 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 285:
#line 1364 "compilers/imcc/imcc.y"
    { (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, inv_op((yyvsp[(3) - (6)].s)), 3, (yyvsp[(2) - (6)].sr),(yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 286:
#line 1366 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 287:
#line 1368 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 288:
#line 1370 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 289:
#line 1372 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless",2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 290:
#line 1374 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 291:
#line 1376 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 292:
#line 1380 "compilers/imcc/imcc.y"
    {  (yyval.s) = "eq"; }
    break;

  case 293:
#line 1381 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ne"; }
    break;

  case 294:
#line 1382 "compilers/imcc/imcc.y"
    {  (yyval.s) = "gt"; }
    break;

  case 295:
#line 1383 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ge"; }
    break;

  case 296:
#line 1384 "compilers/imcc/imcc.y"
    {  (yyval.s) = "lt"; }
    break;

  case 297:
#line 1385 "compilers/imcc/imcc.y"
    {  (yyval.s) = "le"; }
    break;

  case 300:
#line 1394 "compilers/imcc/imcc.y"
    {  (yyval.sr) = NULL; }
    break;

  case 301:
#line 1395 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(1) - (1)].sr); }
    break;

  case 302:
#line 1399 "compilers/imcc/imcc.y"
    { (yyval.sr) = regs[0]; }
    break;

  case 304:
#line 1404 "compilers/imcc/imcc.y"
    {  regs[nargs++] = (yyvsp[(1) - (1)].sr); }
    break;

  case 305:
#line 1406 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = (yyvsp[(1) - (4)].sr);
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = (yyvsp[(3) - (4)].sr);
                      (yyval.sr) = (yyvsp[(1) - (4)].sr);
                   }
    break;

  case 306:
#line 1413 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = (yyvsp[(2) - (3)].sr);
                      (yyval.sr) = (yyvsp[(2) - (3)].sr);
                   }
    break;

  case 308:
#line 1420 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 309:
#line 1421 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 310:
#line 1425 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 311:
#line 1426 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 312:
#line 1430 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 313:
#line 1431 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 318:
#line 1444 "compilers/imcc/imcc.y"
    {  nkeys = 0; in_slice = 0; }
    break;

  case 319:
#line 1445 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp, nkeys, keys, 0); }
    break;

  case 320:
#line 1448 "compilers/imcc/imcc.y"
    {  nkeys = 0; in_slice = 0; }
    break;

  case 321:
#line 1449 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp, nkeys, keys, 1); }
    break;

  case 322:
#line 1453 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[(1) - (1)].sr); }
    break;

  case 323:
#line 1455 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[(3) - (3)].sr); (yyval.sr) =  keys[0]; }
    break;

  case 324:
#line 1456 "compilers/imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 325:
#line 1457 "compilers/imcc/imcc.y"
    { keys[nkeys++] = (yyvsp[(4) - (4)].sr); (yyval.sr) =  keys[0]; }
    break;

  case 326:
#line 1461 "compilers/imcc/imcc.y"
    { if (in_slice) {
                         (yyvsp[(1) - (1)].sr)->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     (yyval.sr) = (yyvsp[(1) - (1)].sr);
                   }
    break;

  case 327:
#line 1467 "compilers/imcc/imcc.y"
    { (yyvsp[(1) - (3)].sr)->type |= VT_START_SLICE;  (yyvsp[(3) - (3)].sr)->type |= VT_END_SLICE;
                     keys[nkeys++] = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); }
    break;

  case 328:
#line 1469 "compilers/imcc/imcc.y"
    { (yyvsp[(2) - (2)].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[(2) - (2)].sr); }
    break;

  case 329:
#line 1470 "compilers/imcc/imcc.y"
    { (yyvsp[(1) - (2)].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[(1) - (2)].sr); }
    break;

  case 330:
#line 1474 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'I'); }
    break;

  case 331:
#line 1475 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'N'); }
    break;

  case 332:
#line 1476 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); }
    break;

  case 333:
#line 1477 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'P'); }
    break;

  case 334:
#line 1478 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_pasm_reg(interp, (yyvsp[(1) - (1)].s));    }
    break;

  case 335:
#line 1482 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'I'); }
    break;

  case 336:
#line 1483 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'N'); }
    break;

  case 337:
#line 1484 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S'); }
    break;

  case 338:
#line 1485 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'U'); }
    break;

  case 339:
#line 1489 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); }
    break;

  case 340:
#line 1490 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S');  }
    break;


/* Line 1267 of yacc.c.  */
#line 4375 "compilers/imcc/imcparser.c"
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


#line 1495 "compilers/imcc/imcc.y"


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

