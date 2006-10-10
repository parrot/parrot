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
     CONCAT = 372,
     POINTY = 373
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
#define POINTY 373




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
#line 712 "compilers/imcc/imcparser.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 219 of yacc.c.  */
#line 724 "compilers/imcc/imcparser.c"

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
#define YYLAST   869

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  135
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  119
/* YYNRULES -- Number of rules. */
#define YYNRULES  341
/* YYNRULES -- Number of states. */
#define YYNSTATES  592

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   373

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   125,     2,     2,     2,   131,   132,     2,
     123,   124,   129,   128,     2,   126,     2,   130,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   134,
       2,   120,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   121,     2,   122,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   133,     2,   127,     2,     2,     2,
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
     918,   924,   928,   931,   932,   935,   937,   939,   941,   946,
     949,   953,   959,   961,   965,   966,   973,   980,   986,   992,
     997,  1002,  1007,  1012,  1014,  1016,  1018,  1020,  1022,  1024,
    1026,  1028,  1029,  1031,  1035,  1037,  1039,  1044,  1048,  1050,
    1052,  1054,  1056,  1058,  1060,  1062,  1064,  1066,  1068,  1070,
    1071,  1074,  1075,  1078,  1080,  1084,  1085,  1090,  1092,  1096,
    1099,  1102,  1104,  1106,  1108,  1110,  1112,  1114,  1116,  1118,
    1120,  1122
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     136,     0,    -1,   137,    -1,   138,    -1,   137,   138,    -1,
     157,    -1,   143,    -1,   142,    -1,   159,    -1,   173,    -1,
     154,    -1,   107,     4,    -1,   139,    -1,     4,    -1,     6,
     140,     4,    -1,   141,     4,    -1,    96,   109,     4,    -1,
       7,   110,    -1,     8,   109,    73,   109,    -1,     9,   110,
      73,   110,    -1,    62,   215,   105,    -1,    62,   215,   105,
     120,   252,    -1,    -1,    30,   144,   215,   105,   120,   252,
      -1,    -1,    30,   146,   110,   242,   120,   147,    -1,   109,
      -1,   112,    -1,   149,    -1,   148,   149,    -1,   205,   150,
       4,    -1,   107,     4,    -1,   116,    -1,   115,    -1,   157,
      -1,   145,    -1,   139,    -1,    -1,   151,   113,   153,    -1,
      -1,    79,   152,   181,    98,    -1,    14,   243,    -1,    29,
     109,    73,   106,    -1,    -1,   236,    -1,    -1,    99,   155,
     156,   100,    -1,    -1,   148,    -1,    23,   158,     4,    -1,
     121,   244,   122,    -1,    -1,    -1,    -1,    -1,    26,   160,
     239,   161,   181,     4,   162,   163,   172,    74,    -1,    -1,
       4,    -1,   163,   164,     4,    -1,    -1,     5,   165,   166,
      -1,   215,   105,   190,    -1,   215,   109,    20,   105,   190,
      -1,    -1,    73,    -1,    95,   123,   170,   124,    -1,    93,
     123,   109,   124,    -1,    93,   123,   105,   124,    -1,    -1,
     170,    73,   171,    -1,   171,    -1,    50,    -1,    51,    -1,
      53,    -1,    52,    -1,   105,    -1,   109,    -1,   121,   244,
     122,    -1,    -1,   202,    -1,    -1,    -1,    -1,    79,   174,
     105,   175,   181,     4,   176,   163,   172,    74,    -1,    -1,
      76,     4,   178,   185,   180,   184,   179,   187,    77,    -1,
      -1,   207,     4,    -1,    -1,    86,   243,     4,    -1,    -1,
     182,    -1,   183,    -1,   182,   167,   183,    -1,    88,    -1,
      87,    -1,    89,    -1,    90,    -1,    92,    -1,    91,    -1,
      94,    -1,   168,    -1,   169,    -1,    78,   243,    73,   243,
       4,    -1,    78,   243,     4,    -1,    84,   243,     4,    -1,
      85,   235,     4,    -1,    85,   109,     4,    -1,    85,   235,
      73,   243,     4,    -1,    85,   109,    73,   243,     4,    -1,
      -1,   185,   186,     4,    -1,    11,   228,    -1,    -1,   187,
     188,     4,    -1,    65,   235,   190,    -1,    -1,    28,   189,
     215,   210,    -1,    -1,   190,   191,    -1,    16,    -1,    17,
      -1,    18,    -1,    19,    -1,    19,   123,   109,   124,    -1,
      97,    -1,    80,    -1,    82,    -1,    81,    -1,    83,    -1,
      -1,   192,     4,   195,   196,   193,    -1,   198,    -1,    -1,
     196,     4,    -1,   196,   197,     4,    -1,    66,   243,   229,
      -1,    -1,    66,   123,   199,   201,   124,    -1,    -1,    67,
     123,   200,   201,   124,    -1,    -1,   228,    -1,   109,    20,
     243,    -1,   201,    73,   228,    -1,   201,    73,   109,    20,
     243,    -1,   204,    -1,   202,   204,    -1,    -1,   203,   208,
      -1,   107,     4,    -1,   116,    -1,   115,    -1,    -1,   206,
      -1,   206,   207,    -1,   207,    -1,    98,    -1,   205,   211,
       4,    -1,     1,     4,    -1,   210,    -1,   209,    73,   210,
      -1,   105,    97,    -1,   105,    -1,   217,    -1,   233,    -1,
      23,   105,    -1,    24,   105,    -1,    -1,    28,   212,   215,
     209,    -1,    29,   109,    73,   235,    -1,    -1,    30,   213,
     215,   105,   120,   252,    -1,   145,    -1,    -1,    33,   214,
     215,   105,   120,   252,    -1,    66,   225,    -1,    10,   241,
      -1,   113,   236,    -1,    14,   243,    -1,   225,    -1,   177,
      -1,   194,    -1,    -1,    50,    -1,    51,    -1,    52,    -1,
      53,    -1,    54,    -1,   216,    -1,   105,    -1,   235,   120,
     243,    -1,   235,   120,   125,   243,    -1,   235,   120,   126,
     243,    -1,   235,   120,   127,   243,    -1,   235,   120,   243,
     128,   243,    -1,   235,   120,   243,   126,   243,    -1,   235,
     120,   243,   129,   243,    -1,   235,   120,   243,    69,   243,
      -1,   235,   120,   243,   130,   243,    -1,   235,   120,   243,
      42,   243,    -1,   235,   120,   243,   131,   243,    -1,   235,
     120,   243,   118,   243,    -1,   235,   120,   243,    56,   243,
      -1,   235,   120,   243,    57,   243,    -1,   235,   120,   243,
      58,   243,    -1,   235,   120,   243,    60,   243,    -1,   235,
     120,   243,    61,   243,    -1,   235,   120,   243,    59,   243,
      -1,   235,   120,   243,    48,   243,    -1,   235,   120,   243,
      49,   243,    -1,   235,   120,   243,    70,   243,    -1,   235,
     120,   243,    71,   243,    -1,   235,   120,   243,    72,   243,
      -1,   235,   120,   243,    55,   243,    -1,   235,   120,   243,
     132,   243,    -1,   235,   120,   243,   133,   243,    -1,   235,
     120,   243,   127,   243,    -1,   235,   120,   243,   121,   244,
     122,    -1,   235,   121,   244,   122,   120,   243,    -1,   235,
     120,    22,   216,    73,   243,    -1,   235,   120,    22,   216,
     121,   244,   122,    -1,   235,   120,    22,   216,    -1,   235,
     120,    22,   243,    -1,   235,   120,    22,   121,   244,   122,
      -1,   235,   120,    22,   243,    73,   243,    -1,   235,   120,
      22,   243,   121,   244,   122,    -1,   235,   120,    64,   105,
      -1,   235,   120,    63,   253,    -1,    63,   253,   120,   243,
      -1,    22,   235,    73,   243,    -1,    22,   235,    73,   243,
      73,   243,    -1,    22,   235,    73,   243,   121,   244,   122,
      -1,   235,   120,   225,    -1,    -1,   123,   218,   232,   124,
     120,   223,   123,   227,   124,    -1,   219,    -1,   221,    -1,
     222,    -1,   235,   120,    14,    -1,    -1,    68,   220,   123,
     232,   124,    -1,   235,    34,   243,    -1,   235,    35,   243,
      -1,   235,    36,   243,    -1,   235,    37,   243,    -1,   235,
      44,   243,    -1,   235,    43,   243,    -1,   235,    38,   243,
      -1,   235,    39,   243,    -1,   235,    40,   243,    -1,   235,
      41,   243,    -1,   235,    45,   243,    -1,   235,    46,   243,
      -1,   235,    47,   243,    -1,   235,   120,   113,   153,    -1,
     105,    -1,   109,    -1,   112,    -1,   235,    -1,   235,   224,
     240,    -1,   235,   224,   109,    -1,   235,   224,   235,    -1,
     119,    -1,   117,    -1,    -1,   223,   226,   123,   227,   124,
      -1,    -1,   227,    73,   228,    -1,   228,    -1,   227,    73,
     109,    20,   243,    -1,   109,    20,   243,    -1,   243,   229,
      -1,    -1,   229,   230,    -1,    15,    -1,    21,    -1,    19,
      -1,    19,   123,   109,   124,    -1,   235,   190,    -1,   232,
      73,   231,    -1,   232,    73,   109,    20,   235,    -1,   231,
      -1,   109,    20,   235,    -1,    -1,    12,   243,   234,   243,
      10,   241,    -1,    13,   243,   234,   243,    10,   241,    -1,
      12,    14,   243,    10,   241,    -1,    13,    14,   243,    10,
     241,    -1,    12,   243,    10,   241,    -1,    13,   243,    10,
     241,    -1,    12,   243,    73,   241,    -1,    13,   243,    73,
     241,    -1,    56,    -1,    57,    -1,    58,    -1,    59,    -1,
      60,    -1,    61,    -1,   114,    -1,   251,    -1,    -1,   237,
      -1,   237,    73,   238,    -1,   238,    -1,   242,    -1,   235,
     121,   244,   122,    -1,   121,   246,   122,    -1,   240,    -1,
     109,    -1,   112,    -1,   105,    -1,   113,    -1,   105,    -1,
     113,    -1,   241,    -1,   243,    -1,   235,    -1,   252,    -1,
      -1,   245,   248,    -1,    -1,   247,   248,    -1,   250,    -1,
     248,   134,   250,    -1,    -1,   248,    73,   249,   250,    -1,
     243,    -1,   243,    75,   243,    -1,    75,   243,    -1,   243,
      75,    -1,   101,    -1,   102,    -1,   103,    -1,   104,    -1,
     106,    -1,   110,    -1,   111,    -1,   109,    -1,   112,    -1,
     103,    -1,   109,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   475,   475,   479,   480,   484,   485,   486,   487,   490,
     493,   496,   497,   498,   501,   502,   503,   506,   514,   523,
     532,   538,   547,   547,   552,   552,   556,   557,   561,   562,
     566,   567,   568,   569,   570,   571,   572,   575,   575,   582,
     581,   592,   594,   599,   603,   607,   607,   617,   619,   623,
     638,   639,   644,   648,   651,   643,   657,   658,   659,   669,
     669,   673,   678,   688,   689,   693,   696,   699,   705,   706,
     707,   711,   712,   713,   714,   715,   725,   735,   738,   740,
     744,   745,   746,   744,   753,   752,   785,   786,   790,   791,
     796,   797,   801,   802,   806,   807,   808,   809,   810,   811,
     812,   813,   814,   818,   823,   825,   830,   832,   834,   838,
     846,   847,   851,   856,   857,   861,   862,   862,   875,   876,
     880,   881,   882,   883,   884,   885,   890,   891,   895,   896,
     901,   900,   905,   911,   912,   915,   921,   926,   925,   933,
     932,   942,   943,   949,   951,   957,   963,   964,   976,   980,
     982,   983,   984,   988,   989,   993,   994,   998,  1006,  1008,
    1017,  1024,  1033,  1041,  1051,  1052,  1053,  1054,  1055,  1055,
    1070,  1074,  1074,  1076,  1077,  1077,  1079,  1083,  1084,  1090,
    1092,  1093,  1094,  1095,  1099,  1100,  1101,  1102,  1103,  1104,
    1108,  1119,  1121,  1123,  1125,  1127,  1129,  1131,  1133,  1135,
    1137,  1139,  1141,  1143,  1145,  1147,  1149,  1151,  1153,  1155,
    1157,  1159,  1161,  1163,  1165,  1167,  1169,  1171,  1173,  1175,
    1177,  1179,  1181,  1183,  1185,  1187,  1189,  1191,  1194,  1196,
    1200,  1202,  1204,  1207,  1214,  1213,  1222,  1223,  1224,  1225,
    1229,  1229,  1235,  1237,  1239,  1241,  1243,  1245,  1247,  1249,
    1251,  1253,  1255,  1257,  1259,  1264,  1273,  1274,  1275,  1276,
    1281,  1282,  1283,  1286,  1287,  1292,  1291,  1301,  1302,  1308,
    1314,  1316,  1320,  1324,  1325,  1329,  1330,  1331,  1332,  1335,
    1339,  1345,  1347,  1353,  1354,  1358,  1360,  1362,  1364,  1366,
    1368,  1370,  1372,  1377,  1378,  1379,  1380,  1381,  1382,  1386,
    1387,  1391,  1392,  1396,  1397,  1401,  1402,  1409,  1416,  1417,
    1418,  1422,  1423,  1427,  1428,  1432,  1433,  1437,  1438,  1441,
    1441,  1448,  1448,  1456,  1457,  1460,  1460,  1466,  1471,  1476,
    1477,  1481,  1482,  1483,  1484,  1485,  1489,  1490,  1491,  1492,
    1496,  1497
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
  "METHOD", "ANON", "OUTER", "NEED_LEX", "MULTI", "LOADLIB", "UNIQUE_REG",
  "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER",
  "REG", "MACRO", "ENDM", "STRINGC", "INTC", "FLOATC", "USTRINGC",
  "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT",
  "POINTY", "'='", "'['", "']'", "'('", "')'", "'!'", "'-'", "'~'", "'+'",
  "'*'", "'/'", "'%'", "'&'", "'|'", "';'", "$accept", "program",
  "compilation_units", "compilation_unit", "pragma", "pragma_1", "hll_def",
  "global", "constdef", "@1", "pmc_const", "@2", "any_string", "pasmcode",
  "pasmline", "pasm_inst", "@3", "@4", "pasm_args", "emit", "@5",
  "opt_pasmcode", "class_namespace", "maybe_ns", "sub", "@6", "@7", "@8",
  "sub_params", "sub_param", "@9", "sub_param_type_def", "opt_comma",
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
     364,   365,   366,   367,   368,   369,   370,   371,   372,   373,
      61,    91,    93,    40,    41,    33,    45,   126,    43,    42,
      47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   135,   136,   137,   137,   138,   138,   138,   138,   138,
     138,   138,   138,   138,   139,   139,   139,   140,   141,   141,
     142,   142,   144,   143,   146,   145,   147,   147,   148,   148,
     149,   149,   149,   149,   149,   149,   149,   151,   150,   152,
     150,   150,   150,   150,   153,   155,   154,   156,   156,   157,
     158,   158,   160,   161,   162,   159,   163,   163,   163,   165,
     164,   166,   166,   167,   167,   168,   169,   169,   170,   170,
     170,   171,   171,   171,   171,   171,   171,   171,   172,   172,
     174,   175,   176,   173,   178,   177,   179,   179,   180,   180,
     181,   181,   182,   182,   183,   183,   183,   183,   183,   183,
     183,   183,   183,   184,   184,   184,   184,   184,   184,   184,
     185,   185,   186,   187,   187,   188,   189,   188,   190,   190,
     191,   191,   191,   191,   191,   191,   192,   192,   193,   193,
     195,   194,   194,   196,   196,   196,   197,   199,   198,   200,
     198,   201,   201,   201,   201,   201,   202,   202,   203,   204,
     204,   204,   204,   205,   205,   206,   206,   207,   208,   208,
     209,   209,   210,   210,   211,   211,   211,   211,   212,   211,
     211,   213,   211,   211,   214,   211,   211,   211,   211,   211,
     211,   211,   211,   211,   215,   215,   215,   215,   215,   215,
     216,   217,   217,   217,   217,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   218,   217,   217,   217,   217,   217,
     220,   219,   221,   221,   221,   221,   221,   221,   221,   221,
     221,   221,   221,   221,   221,   222,   223,   223,   223,   223,
     223,   223,   223,   224,   224,   226,   225,   227,   227,   227,
     227,   227,   228,   229,   229,   230,   230,   230,   230,   231,
     232,   232,   232,   232,   232,   233,   233,   233,   233,   233,
     233,   233,   233,   234,   234,   234,   234,   234,   234,   235,
     235,   236,   236,   237,   237,   238,   238,   238,   239,   239,
     239,   240,   240,   241,   241,   242,   242,   243,   243,   245,
     244,   247,   246,   248,   248,   249,   248,   250,   250,   250,
     250,   251,   251,   251,   251,   251,   252,   252,   252,   252,
     253,   253
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
       5,     3,     2,     0,     2,     1,     1,     1,     4,     2,
       3,     5,     1,     3,     0,     6,     6,     5,     5,     4,
       4,     4,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     0,     1,     3,     1,     1,     4,     3,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     0,
       2,     0,     2,     1,     3,     0,     4,     1,     3,     2,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
       0,    13,     0,     0,     0,    51,    52,    22,     0,    80,
       0,    45,     0,     0,     2,     3,    12,     0,     7,     6,
      10,     5,     8,     9,     0,     0,     0,     0,   319,     0,
       0,     0,   184,   185,   186,   187,   188,   190,     0,   189,
       0,     0,   153,    11,     1,     4,    15,    17,    14,     0,
       0,     0,     0,    49,   311,   309,   310,   312,    53,   308,
       0,    20,    81,    16,    24,   157,     0,    33,    32,    36,
      35,   153,    28,     0,    34,    37,   154,   156,    18,    19,
      50,     0,   331,   332,   333,   334,   335,   338,   336,   337,
     339,   299,   317,   327,   320,   323,   300,   318,    90,     0,
       0,    90,     0,    31,    29,    46,     0,     0,    39,     0,
       0,   155,   329,   330,   325,     0,    95,    94,    96,    97,
      99,    98,     0,   100,     0,   101,   102,     0,    63,    92,
       0,    21,     0,     0,    41,     0,    90,    30,   301,   328,
       0,   324,     0,    68,    54,    64,     0,    23,    82,   313,
     314,   315,     0,   316,     0,     0,   321,    38,   317,    44,
     302,   304,   305,   326,     0,     0,    71,    72,    74,    73,
      75,    76,   319,     0,    70,    56,    93,    56,     0,    42,
      40,     0,     0,   319,     0,    67,    66,     0,     0,    65,
      57,   148,   148,    26,    27,    25,   307,   322,     0,   303,
      77,    69,    59,     0,   152,   151,     0,     0,   148,     0,
     146,     0,   306,     0,   150,    58,    55,   147,     0,   183,
     149,    83,    60,     0,   159,     0,     0,     0,     0,     0,
       0,     0,   168,     0,   171,   174,     0,     0,     0,   240,
       0,   126,   127,   256,   257,   258,   301,   234,   173,   181,
       0,   182,   132,     0,   164,   236,   237,   238,   265,   180,
     165,   259,   118,     0,   177,     0,     0,     0,     0,   179,
       0,   166,   167,     0,     0,     0,     0,   340,   341,     0,
     137,   176,   259,   139,     0,    84,   178,   284,   130,   158,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   264,   263,     0,   319,     0,    61,
       0,     0,     0,   293,   294,   295,   296,   297,   298,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   141,   141,   284,   110,     0,   282,     0,   118,   133,
     267,   242,   243,   244,   245,   248,   249,   250,   251,   247,
     246,   252,   253,   254,   239,     0,     0,     0,   338,   339,
     301,     0,     0,     0,   233,   317,   191,     0,   261,   262,
     260,   120,   121,   122,   123,   125,   119,   118,     0,   289,
     291,     0,     0,   290,   292,     0,   230,   163,   169,   160,
     170,     0,     0,   229,   338,     0,   142,   273,     0,     0,
      88,     0,     0,     0,   279,     0,   338,     0,   269,   319,
     222,   223,   228,   227,   255,   192,   193,   194,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   319,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    62,   287,     0,   288,     0,     0,
     319,   162,     0,     0,     0,     0,     0,   138,   272,   140,
     241,     0,     0,     0,     0,   283,     0,   280,     0,   134,
       0,   128,   129,   131,     0,     0,     0,   266,     0,     0,
     319,     0,   319,   200,   209,   210,   214,   203,   204,   205,
     208,   206,   207,   198,   211,   212,   213,   202,     0,   196,
     217,   195,   197,   199,   201,   215,   216,     0,     0,   285,
     286,   231,     0,   161,   172,   175,   143,   338,   144,   275,
     277,   276,   274,   112,     0,     0,     0,     0,    86,   111,
       0,     0,   273,   135,   271,   338,   268,   224,   220,     0,
     225,     0,   218,   219,   124,   232,     0,     0,    89,     0,
       0,     0,     0,   113,     0,   281,   267,   136,     0,   221,
     226,   145,     0,   104,     0,   105,   107,     0,   106,     0,
       0,    87,     0,   270,   278,     0,     0,     0,   116,     0,
      85,     0,   235,   103,   109,   108,     0,   118,   114,     0,
     115,   117
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    13,    14,    15,    16,    25,    17,    18,    19,    31,
      70,   102,   195,    71,    72,   109,   110,   136,   157,    20,
      42,    73,    21,    29,    22,    30,    98,   175,   191,   206,
     213,   222,   146,   125,   126,   173,   174,   207,    23,    40,
     101,   177,   249,   334,   553,   463,   127,   128,   129,   528,
     400,   464,   570,   581,   586,   309,   376,   250,   473,   251,
     339,   405,   474,   252,   331,   332,   395,   208,   209,   210,
      75,    76,    77,   220,   388,   389,   253,   273,   275,   276,
      38,    39,   254,   287,   255,   284,   256,   257,   258,   308,
     259,   290,   407,   396,   458,   522,   336,   337,   260,   320,
      92,   159,   160,   161,    58,    59,   151,   162,   397,    51,
      52,   181,   182,    94,   140,    95,    96,    97,   279
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -447
static const short int yypact[] =
{
     338,  -447,    36,   -49,    27,    17,  -447,  -447,   142,  -447,
     -48,  -447,   101,   150,   338,  -447,  -447,   110,  -447,  -447,
    -447,  -447,  -447,  -447,    32,   147,    88,    93,  -447,   169,
     -60,   142,  -447,  -447,  -447,  -447,  -447,  -447,    70,  -447,
      74,   185,    12,  -447,  -447,  -447,  -447,  -447,  -447,    91,
      87,    82,   346,  -447,  -447,  -447,  -447,  -447,  -447,  -447,
     118,   105,  -447,  -447,  -447,  -447,   226,  -447,  -447,  -447,
    -447,   168,  -447,   135,  -447,    25,   138,  -447,  -447,  -447,
    -447,   639,  -447,  -447,  -447,  -447,  -447,  -447,  -447,  -447,
    -447,  -447,  -447,   163,   -51,  -447,  -447,  -447,   774,   119,
      97,   774,   130,  -447,  -447,  -447,   639,   132,  -447,   239,
     133,  -447,  -447,   639,  -447,   346,  -447,  -447,  -447,  -447,
    -447,  -447,   144,  -447,   146,  -447,  -447,   261,    13,  -447,
      97,  -447,   266,   625,  -447,   198,   774,  -447,   564,  -447,
     346,  -447,   -59,    81,  -447,  -447,   774,  -447,  -447,  -447,
    -447,  -447,   152,  -447,   170,   180,  -447,  -447,   158,  -447,
     207,  -447,  -447,  -447,   161,   171,  -447,  -447,  -447,  -447,
    -447,  -447,  -447,   -50,  -447,   288,  -447,   288,    14,  -447,
    -447,   172,   346,  -447,   564,  -447,  -447,   178,    81,  -447,
    -447,     6,     6,  -447,  -447,  -447,  -447,   -51,   182,  -447,
    -447,  -447,  -447,   301,  -447,  -447,   302,   233,    56,   462,
    -447,   234,  -447,   142,  -447,  -447,  -447,  -447,   305,   523,
    -447,  -447,  -447,   -47,  -447,   -65,   187,   220,   639,   115,
     205,   206,  -447,   204,   215,  -447,    26,   395,   191,  -447,
     311,  -447,  -447,  -447,  -447,  -447,   564,  -447,  -447,  -447,
     312,  -447,  -447,   323,  -447,  -447,  -447,  -447,  -447,  -447,
    -447,   572,  -447,   308,  -447,   639,   154,   639,   292,  -447,
     263,  -447,  -447,   142,   264,   142,   142,  -447,  -447,   218,
    -447,  -447,    48,  -447,   216,  -447,  -447,   478,  -447,  -447,
     222,   639,   639,   639,   639,   639,   639,   639,   639,   639,
     639,   639,   639,   639,  -447,  -447,    43,  -447,   709,    -3,
     236,   333,   -65,  -447,  -447,  -447,  -447,  -447,  -447,   -65,
     639,   344,   -65,   -65,   639,   639,   252,   115,   253,   254,
     639,   653,   653,   478,  -447,   340,  -447,   -45,  -447,  -447,
     667,  -447,  -447,  -447,  -447,  -447,  -447,  -447,  -447,  -447,
    -447,  -447,  -447,  -447,  -447,   593,    26,   257,   240,   243,
     564,   639,   639,   639,  -447,   114,   592,   245,  -447,  -447,
    -447,  -447,  -447,  -447,   246,  -447,  -447,  -447,   -65,  -447,
    -447,   360,   -65,  -447,  -447,   361,   -46,   275,   300,  -447,
    -447,   270,   281,  -447,   354,   -40,  -447,  -447,   -39,   -36,
      -8,   115,   737,   283,    -3,    15,   384,    -9,  -447,  -447,
     -32,    -5,  -447,  -447,  -447,  -447,  -447,  -447,   639,   639,
     639,   639,   639,   639,   639,   639,   639,   639,   639,   639,
     639,   639,   639,  -447,   639,   639,   639,   639,   639,   639,
     639,   639,   285,   298,    -3,  -447,   -65,  -447,   -65,   639,
    -447,  -447,   252,    97,    97,   639,   681,  -447,    52,  -447,
    -447,   639,   639,   103,   404,  -447,   389,  -447,   723,  -447,
     639,  -447,  -447,  -447,   406,   639,   695,  -447,   289,   639,
    -447,   639,  -447,  -447,  -447,  -447,  -447,  -447,  -447,  -447,
    -447,  -447,  -447,  -447,  -447,  -447,  -447,  -447,   291,  -447,
    -447,  -447,  -447,  -447,  -447,  -447,  -447,   639,   290,  -447,
    -447,  -447,   293,  -447,  -447,  -447,  -447,   396,  -447,  -447,
     295,  -447,  -447,  -447,   416,   639,   639,   746,   138,  -447,
     115,   299,  -447,  -447,  -447,   403,  -447,  -447,  -447,   303,
    -447,   304,  -447,  -447,  -447,  -447,   639,   315,  -447,     3,
     424,     4,    20,  -447,   425,  -447,   667,    52,   639,  -447,
    -447,  -447,   306,  -447,   639,  -447,  -447,   639,  -447,   639,
      59,  -447,    -7,  -447,  -447,   427,   429,   431,  -447,   115,
    -447,   435,  -447,  -447,  -447,  -447,   142,  -447,  -447,   252,
      -3,  -447
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -447,  -447,  -447,   426,   -16,  -447,  -447,  -447,  -447,  -447,
     223,  -447,  -447,  -447,   370,  -447,  -447,  -447,    83,  -447,
    -447,  -447,   -12,  -447,  -447,  -447,  -447,  -447,   267,  -447,
    -447,  -447,  -447,  -447,  -447,  -447,   258,   262,  -447,  -447,
    -447,  -447,  -447,  -447,  -447,  -447,   -54,  -447,   313,  -447,
    -447,  -447,  -447,  -447,  -447,  -326,  -447,  -447,  -447,  -447,
    -447,  -447,  -447,  -447,  -447,  -447,   129,  -447,  -447,   259,
     256,  -447,   -75,  -447,  -447,  -446,  -447,  -447,  -447,  -447,
     -31,   107,  -447,  -447,  -447,  -447,  -447,  -447,     0,  -447,
    -206,  -447,   -87,  -336,   -62,  -447,    69,   140,  -447,   209,
    -128,   232,  -447,   296,  -447,   173,  -220,   355,   -43,  -147,
    -447,  -447,  -447,   297,  -447,   -71,  -447,   -98,   131
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -260
static const short int yytable[] =
{
      60,   111,   131,   461,   408,   264,   513,   563,   566,    93,
     158,   202,   404,   371,   372,   373,   374,   -91,     2,   469,
       3,     4,   114,   188,   568,   187,    69,   449,   402,   -43,
      74,   281,   147,   456,   456,     5,   198,   402,   112,   106,
     149,   479,    64,    24,   141,    54,   164,   132,   150,    55,
     165,   444,    56,    57,   107,    69,   158,   354,   262,    74,
      26,    41,   263,   134,   476,   355,   476,   519,   481,   163,
     139,   520,    93,   521,   189,   450,   564,   567,   462,   403,
     -78,   470,   155,   115,   457,   459,   145,   578,   460,   480,
     153,   261,   379,   569,   375,   153,   471,    93,   472,   380,
     364,   270,   383,   384,   108,    43,   356,   357,    10,   282,
      65,   -91,   -47,   203,    46,   477,   482,   582,   158,    66,
     518,   204,   205,   193,   579,   523,   194,    67,    68,   277,
     -79,   166,   167,   168,   169,   278,   580,    27,    28,    93,
     536,   153,    47,   591,    82,    83,    84,    85,   243,    86,
      44,    48,   358,    88,    89,   359,   360,    91,   445,   338,
     367,    49,   447,   203,   312,   304,    50,   305,   361,   362,
     363,   204,   205,    53,     2,    61,     3,     4,   365,    62,
     369,   525,   223,   266,   268,   269,   170,   526,   527,    63,
     171,     5,    32,    33,    34,    35,    36,    79,    64,   390,
      78,   265,   172,   153,    80,   338,    87,    88,    89,    90,
     313,   314,   315,   316,   317,   318,    82,    83,    84,    85,
     408,    86,   311,    99,   321,   100,   509,   319,   510,    91,
     103,   304,   158,   305,   267,   105,    65,  -259,   113,   130,
     133,   135,   326,   137,   328,   329,   138,    37,   341,   342,
     343,   344,   345,   346,   347,   348,   349,   350,   351,   352,
     353,   590,   478,   366,    10,   144,    65,   142,   -48,   143,
     148,   154,   178,   465,   338,    66,   179,   381,   180,   183,
     184,   385,   386,    67,    68,   185,   498,   393,    82,    83,
      84,    85,   190,    86,   196,   186,    87,    88,    89,    90,
     200,    91,   322,   512,   212,   214,   215,   216,   221,   224,
     271,   272,   411,   274,   283,   285,   288,   153,   415,   416,
     417,    82,    83,    84,    85,   -24,    86,   289,   310,    87,
      88,    89,    90,   539,    91,   541,   325,   327,   330,   333,
     282,   377,     1,   378,     2,   340,     3,     4,   313,   314,
     315,   316,   317,   318,   382,   514,   515,   387,   391,   392,
     401,     5,   413,  -257,     6,   323,  -258,   442,     7,   443,
     446,   448,   451,   452,   455,   483,   484,   485,   486,   487,
     488,   489,   490,   491,   492,   493,   494,   495,   496,   497,
     453,   499,   500,   501,   502,   503,   504,   505,   506,   552,
       8,   454,   555,   468,   475,   507,   511,   508,   529,   530,
     533,   537,   516,   542,   544,   545,   546,     9,   547,   524,
     548,    81,   556,   558,   562,   559,   560,   532,   565,   571,
     574,   583,   534,   584,    10,   585,   538,    11,   540,   588,
      45,   104,   248,   414,   192,    12,   201,    82,    83,    84,
      85,   587,    86,   554,   211,    87,    88,    89,    90,   176,
      91,   398,   410,   218,   543,   219,  -153,   217,   531,   572,
     557,   467,  -153,   399,  -153,  -153,  -153,   324,   286,   197,
     199,   370,   549,   550,  -153,  -153,  -153,   412,   152,     0,
    -153,  -153,  -153,     0,     0,  -153,    82,    83,    84,    85,
     243,    86,     0,   561,   244,     0,     0,   245,     0,    91,
       0,     0,     0,     0,     0,   573,     0,     0,   280,     0,
       0,   575,     0,     0,   576,  -153,   577,     0,  -153,  -153,
    -153,     0,     0,   225,     0,   226,   227,   228,  -153,     0,
       0,     0,  -153,     0,  -153,   229,   230,   231,     0,     0,
       0,   232,   233,   234,     0,   589,   235,     0,     0,     0,
      65,     0,     0,  -153,  -153,  -153,  -153,  -153,  -153,     0,
       0,  -153,     0,     0,  -153,  -153,  -153,     0,     0,    82,
      83,    84,    85,     0,    86,  -153,   236,   335,     0,   237,
     238,   239,    91,     0,     0,     0,     0,     0,     0,   240,
       0,     0,     0,   241,     0,   242,   291,   292,   293,   294,
     295,   296,   297,   298,     0,   299,   300,   301,   302,   303,
       0,     0,     0,     0,    82,    83,    84,    85,   243,    86,
       0,     0,   244,     0,   418,   245,   246,    91,     0,     0,
     419,   420,     0,     0,     0,     0,   247,   421,   422,   423,
     424,   425,   426,   427,     0,     0,     0,     0,     0,     0,
       0,   428,   429,   430,   431,    82,    83,    84,    85,   149,
      86,     0,     0,    87,    88,    89,    90,   150,    91,     0,
       0,     0,     0,     0,     0,   156,     0,     0,     0,   304,
       0,   305,   306,   307,    82,    83,    84,    85,    37,    86,
       0,     0,    87,    88,    89,    90,     0,    91,     0,     0,
     432,     0,     0,   433,   409,     0,     0,     0,   434,   435,
     436,   437,   438,   439,   440,   441,    82,    83,    84,    85,
     149,    86,     0,     0,    87,    88,    89,    90,   150,    91,
      82,    83,    84,    85,     0,    86,     0,     0,    87,    88,
      89,    90,     0,    91,    82,    83,    84,    85,     0,    86,
       0,     0,   394,    88,    89,    90,     0,    91,    82,    83,
      84,    85,     0,    86,     0,     0,   406,    88,    89,    90,
       0,    91,    82,    83,    84,    85,     0,    86,     0,     0,
     517,    88,    89,    90,     0,    91,    82,    83,    84,    85,
       0,    86,     0,     0,   535,    88,    89,    90,     0,    91,
      82,    83,    84,    85,    54,    86,     0,     0,   368,     0,
       0,     0,    57,    91,    82,    83,    84,    85,   243,    86,
       0,     0,   244,     0,     0,   245,     0,    91,    82,    83,
      84,    85,     0,    86,     0,     0,   466,    82,    83,    84,
      85,    91,    86,     0,     0,   551,     0,     0,     0,     0,
      91,   116,   117,   118,   119,   120,   121,   122,   123,   124
};

static const short int yycheck[] =
{
      31,    76,   100,    11,   340,   225,   452,     4,     4,    52,
     138,     5,   338,    16,    17,    18,    19,     4,     6,     4,
       8,     9,    73,    73,     4,   172,    42,    73,    73,     4,
      42,   237,   130,    73,    73,    23,   183,    73,    81,    14,
     105,    73,    30,     7,   115,   105,   105,   101,   113,   109,
     109,   377,   112,   113,    29,    71,   184,    14,   105,    71,
     109,   109,   109,   106,    73,    22,    73,    15,    73,   140,
     113,    19,   115,    21,   124,   121,    73,    73,    86,   124,
      74,    66,   136,   134,   124,   124,    73,    28,   124,   121,
     133,   219,   312,    73,    97,   138,    81,   140,    83,   319,
     306,   229,   322,   323,    79,     4,    63,    64,    96,   237,
      98,    98,   100,   107,     4,   124,   121,   124,   246,   107,
     456,   115,   116,   109,    65,   461,   112,   115,   116,   103,
      74,    50,    51,    52,    53,   109,    77,   110,   121,   182,
     476,   184,   110,   589,   101,   102,   103,   104,   105,   106,
       0,     4,   109,   110,   111,   112,   113,   114,   378,   287,
     307,    73,   382,   107,    10,   117,    73,   119,   125,   126,
     127,   115,   116,     4,     6,   105,     8,     9,   306,   105,
     308,    78,   213,   226,   227,   228,   105,    84,    85,     4,
     109,    23,    50,    51,    52,    53,    54,   110,    30,   327,
     109,    14,   121,   246,   122,   333,   109,   110,   111,   112,
      56,    57,    58,    59,    60,    61,   101,   102,   103,   104,
     556,   106,   265,   105,   267,   120,   446,    73,   448,   114,
       4,   117,   360,   119,    14,   100,    98,   123,    75,   120,
     110,   109,   273,     4,   275,   276,   113,   105,   291,   292,
     293,   294,   295,   296,   297,   298,   299,   300,   301,   302,
     303,   587,   409,   306,    96,     4,    98,   123,   100,   123,
       4,    73,   120,   401,   402,   107,   106,   320,    98,   121,
      73,   324,   325,   115,   116,   124,   433,   330,   101,   102,
     103,   104,     4,   106,   122,   124,   109,   110,   111,   112,
     122,   114,    10,   450,   122,     4,     4,    74,    74,     4,
     105,   105,   355,   109,   123,     4,     4,   360,   361,   362,
     363,   101,   102,   103,   104,   110,   106,     4,    20,   109,
     110,   111,   112,   480,   114,   482,    73,    73,   120,   123,
     468,   105,     4,    10,     6,   123,     8,     9,    56,    57,
      58,    59,    60,    61,    10,   453,   454,   105,   105,   105,
      20,    23,   105,   123,    26,    73,   123,   122,    30,   123,
      10,    10,    97,    73,    20,   418,   419,   420,   421,   422,
     423,   424,   425,   426,   427,   428,   429,   430,   431,   432,
     120,   434,   435,   436,   437,   438,   439,   440,   441,   527,
      62,   120,   530,   120,    20,   120,   449,   109,     4,    20,
       4,   122,   455,   122,   124,   122,    20,    79,   123,   462,
       4,    75,   123,    20,   109,   122,   122,   470,     4,     4,
     124,     4,   475,     4,    96,     4,   479,    99,   481,     4,
      14,    71,   219,   360,   177,   107,   188,   101,   102,   103,
     104,   579,   106,   528,   192,   109,   110,   111,   112,   146,
     114,   332,   355,     1,   507,   209,     4,   208,   468,   556,
     532,   402,    10,   333,    12,    13,    14,   268,   246,   182,
     184,   308,   525,   526,    22,    23,    24,   356,   133,    -1,
      28,    29,    30,    -1,    -1,    33,   101,   102,   103,   104,
     105,   106,    -1,   546,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,    -1,    -1,    -1,   558,    -1,    -1,   123,    -1,
      -1,   564,    -1,    -1,   567,    63,   569,    -1,    66,    67,
      68,    -1,    -1,    10,    -1,    12,    13,    14,    76,    -1,
      -1,    -1,    80,    -1,    82,    22,    23,    24,    -1,    -1,
      -1,    28,    29,    30,    -1,   586,    33,    -1,    -1,    -1,
      98,    -1,    -1,   101,   102,   103,   104,   105,   106,    -1,
      -1,   109,    -1,    -1,   112,   113,   114,    -1,    -1,   101,
     102,   103,   104,    -1,   106,   123,    63,   109,    -1,    66,
      67,    68,   114,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      -1,    -1,    -1,    80,    -1,    82,    34,    35,    36,    37,
      38,    39,    40,    41,    -1,    43,    44,    45,    46,    47,
      -1,    -1,    -1,    -1,   101,   102,   103,   104,   105,   106,
      -1,    -1,   109,    -1,    42,   112,   113,   114,    -1,    -1,
      48,    49,    -1,    -1,    -1,    -1,   123,    55,    56,    57,
      58,    59,    60,    61,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    69,    70,    71,    72,   101,   102,   103,   104,   105,
     106,    -1,    -1,   109,   110,   111,   112,   113,   114,    -1,
      -1,    -1,    -1,    -1,    -1,   121,    -1,    -1,    -1,   117,
      -1,   119,   120,   121,   101,   102,   103,   104,   105,   106,
      -1,    -1,   109,   110,   111,   112,    -1,   114,    -1,    -1,
     118,    -1,    -1,   121,   121,    -1,    -1,    -1,   126,   127,
     128,   129,   130,   131,   132,   133,   101,   102,   103,   104,
     105,   106,    -1,    -1,   109,   110,   111,   112,   113,   114,
     101,   102,   103,   104,    -1,   106,    -1,    -1,   109,   110,
     111,   112,    -1,   114,   101,   102,   103,   104,    -1,   106,
      -1,    -1,   109,   110,   111,   112,    -1,   114,   101,   102,
     103,   104,    -1,   106,    -1,    -1,   109,   110,   111,   112,
      -1,   114,   101,   102,   103,   104,    -1,   106,    -1,    -1,
     109,   110,   111,   112,    -1,   114,   101,   102,   103,   104,
      -1,   106,    -1,    -1,   109,   110,   111,   112,    -1,   114,
     101,   102,   103,   104,   105,   106,    -1,    -1,   109,    -1,
      -1,    -1,   113,   114,   101,   102,   103,   104,   105,   106,
      -1,    -1,   109,    -1,    -1,   112,    -1,   114,   101,   102,
     103,   104,    -1,   106,    -1,    -1,   109,   101,   102,   103,
     104,   114,   106,    -1,    -1,   109,    -1,    -1,    -1,    -1,
     114,    87,    88,    89,    90,    91,    92,    93,    94,    95
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,     9,    23,    26,    30,    62,    79,
      96,    99,   107,   136,   137,   138,   139,   141,   142,   143,
     154,   157,   159,   173,     7,   140,   109,   110,   121,   158,
     160,   144,    50,    51,    52,    53,    54,   105,   215,   216,
     174,   109,   155,     4,     0,   138,     4,   110,     4,    73,
      73,   244,   245,     4,   105,   109,   112,   113,   239,   240,
     215,   105,   105,     4,    30,    98,   107,   115,   116,   139,
     145,   148,   149,   156,   157,   205,   206,   207,   109,   110,
     122,    75,   101,   102,   103,   104,   106,   109,   110,   111,
     112,   114,   235,   243,   248,   250,   251,   252,   161,   105,
     120,   175,   146,     4,   149,   100,    14,    29,    79,   150,
     151,   207,   243,    75,    73,   134,    87,    88,    89,    90,
      91,    92,    93,    94,    95,   168,   169,   181,   182,   183,
     120,   252,   181,   110,   243,   109,   152,     4,   113,   243,
     249,   250,   123,   123,     4,    73,   167,   252,     4,   105,
     113,   241,   242,   243,    73,   181,   121,   153,   235,   236,
     237,   238,   242,   250,   105,   109,    50,    51,    52,    53,
     105,   109,   121,   170,   171,   162,   183,   176,   120,   106,
      98,   246,   247,   121,    73,   124,   124,   244,    73,   124,
       4,   163,   163,   109,   112,   147,   122,   248,   244,   238,
     122,   171,     5,   107,   115,   116,   164,   172,   202,   203,
     204,   172,   122,   165,     4,     4,    74,   204,     1,   205,
     208,    74,   166,   215,     4,    10,    12,    13,    14,    22,
      23,    24,    28,    29,    30,    33,    63,    66,    67,    68,
      76,    80,    82,   105,   109,   112,   113,   123,   145,   177,
     192,   194,   198,   211,   217,   219,   221,   222,   223,   225,
     233,   235,   105,   109,   241,    14,   243,    14,   243,   243,
     235,   105,   105,   212,   109,   213,   214,   103,   109,   253,
     123,   225,   235,   123,   220,     4,   236,   218,     4,     4,
     226,    34,    35,    36,    37,    38,    39,    40,    41,    43,
      44,    45,    46,    47,   117,   119,   120,   121,   224,   190,
      20,   243,    10,    56,    57,    58,    59,    60,    61,    73,
     234,   243,    10,    73,   234,    73,   215,    73,   215,   215,
     120,   199,   200,   123,   178,   109,   231,   232,   235,   195,
     123,   243,   243,   243,   243,   243,   243,   243,   243,   243,
     243,   243,   243,   243,    14,    22,    63,    64,   109,   112,
     113,   125,   126,   127,   225,   235,   243,   244,   109,   235,
     240,    16,    17,    18,    19,    97,   191,   105,    10,   241,
     241,   243,    10,   241,   241,   243,   243,   105,   209,   210,
     235,   105,   105,   243,   109,   201,   228,   243,   201,   232,
     185,    20,    73,   124,   190,   196,   109,   227,   228,   121,
     216,   243,   253,   105,   153,   243,   243,   243,    42,    48,
      49,    55,    56,    57,    58,    59,    60,    61,    69,    70,
      71,    72,   118,   121,   126,   127,   128,   129,   130,   131,
     132,   133,   122,   123,   190,   241,    10,   241,    10,    73,
     121,    97,    73,   120,   120,    20,    73,   124,   229,   124,
     124,    11,    86,   180,   186,   235,   109,   231,   120,     4,
      66,    81,    83,   193,   197,    20,    73,   124,   244,    73,
     121,    73,   121,   243,   243,   243,   243,   243,   243,   243,
     243,   243,   243,   243,   243,   243,   243,   243,   244,   243,
     243,   243,   243,   243,   243,   243,   243,   120,   109,   241,
     241,   243,   244,   210,   252,   252,   243,   109,   228,    15,
      19,    21,   230,   228,   243,    78,    84,    85,   184,     4,
      20,   223,   243,     4,   243,   109,   228,   122,   243,   244,
     243,   244,   122,   243,   124,   122,    20,   123,     4,   243,
     243,   109,   235,   179,   207,   235,   123,   229,    20,   122,
     122,   243,   109,     4,    73,     4,     4,    73,     4,    73,
     187,     4,   227,   243,   124,   243,   243,   243,    28,    65,
      77,   188,   124,     4,     4,     4,   189,   235,     4,   215,
     190,   210
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
#line 475 "compilers/imcc/imcc.y"
    { if (yynerrs) YYABORT; (yyval.i) = 0; }
    break;

  case 5:
#line 484 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 6:
#line 485 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 7:
#line 486 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 8:
#line 487 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); 
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit); 
                     IMCC_INFO(interp)->cur_unit = 0; }
    break;

  case 9:
#line 490 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i);
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                     IMCC_INFO(interp)->cur_unit = 0; }
    break;

  case 10:
#line 493 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i);
                     imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                     IMCC_INFO(interp)->cur_unit = 0; }
    break;

  case 11:
#line 496 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 12:
#line 497 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 13:
#line 498 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 14:
#line 501 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 15:
#line 502 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 16:
#line 503 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; do_loadlib(interp, (yyvsp[-1].s)); }
    break;

  case 17:
#line 507 "compilers/imcc/imcc.y"
    { if ((yyvsp[0].s))
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 18:
#line 515 "compilers/imcc/imcc.y"
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
#line 524 "compilers/imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                CONTEXT(((Interp*)interp)->ctx)->current_HLL, atoi((yyvsp[-2].s)), atoi((yyvsp[0].s)));
             (yyval.t) = 0;
         }
    break;

  case 20:
#line 533 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 21:
#line 539 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 22:
#line 547 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 23:
#line 548 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1); is_def=0; }
    break;

  case 24:
#line 552 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 25:
#line 553 "compilers/imcc/imcc.y"
    { (yyval.i) = mk_pmc_const(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-3].s), (yyvsp[-2].sr), (yyvsp[0].s)); is_def=0; }
    break;

  case 30:
#line 566 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 31:
#line 567 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 32:
#line 568 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 33:
#line 569 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;  }
    break;

  case 34:
#line 570 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 37:
#line 575 "compilers/imcc/imcc.y"
    { clear_state(interp); }
    break;

  case 38:
#line 577 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit, 
                              (yyvsp[-1].s), 0, IMCC_INFO(interp)->regs, 
                              IMCC_INFO(interp)->nargs, IMCC_INFO(interp) -> keyvec, 1);
                     free((yyvsp[-1].s)); }
    break;

  case 39:
#line 582 "compilers/imcc/imcc.y"
    {
                    imc_close_unit(interp, IMCC_INFO(interp)->cur_unit);
                    IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM);
                    }
    break;

  case 40:
#line 587 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit,
                                mk_sub_label(interp, (yyvsp[0].s)));
                     IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[-1].t);
                   }
    break;

  case 41:
#line 593 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[0].sr)); }
    break;

  case 42:
#line 595 "compilers/imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, (yyvsp[0].s));
                       set_lexical(interp, r, (yyvsp[-2].s)); (yyval.i) = 0;
                   }
    break;

  case 43:
#line 599 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 45:
#line 607 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 46:
#line 609 "compilers/imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     (yyval.i)=0; }
    break;

  case 49:
#line 624 "compilers/imcc/imcc.y"
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
                }
    break;

  case 50:
#line 638 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[-1].sr); }
    break;

  case 51:
#line 639 "compilers/imcc/imcc.y"
    { (yyval.sr) = NULL; }
    break;

  case 52:
#line 644 "compilers/imcc/imcc.y"
    {
           IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 53:
#line 648 "compilers/imcc/imcc.y"
    {
          iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[0].sr));
        }
    break;

  case 54:
#line 651 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[-1].t); }
    break;

  case 55:
#line 653 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
    break;

  case 56:
#line 657 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 57:
#line 658 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 58:
#line 659 "compilers/imcc/imcc.y"
    { 
       if (IMCC_INFO(interp)->adv_named_id) {
             add_pcc_named_param(interp,IMCC_INFO(interp)->cur_call,
                                 IMCC_INFO(interp)->adv_named_id,(yyvsp[-1].sr));
             IMCC_INFO(interp)->adv_named_id = NULL;
         } else add_pcc_param(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr));
   }
    break;

  case 59:
#line 669 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 60:
#line 669 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[0].sr); is_def=0; }
    break;

  case 61:
#line 673 "compilers/imcc/imcc.y"
    { if ((yyvsp[0].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[-1].s), (yyvsp[-2].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[-1].s), (yyvsp[-2].t));
                                         (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 62:
#line 678 "compilers/imcc/imcc.y"
    { 
                                         if ((yyvsp[0].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[-1].s), (yyvsp[-4].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[-1].s), (yyvsp[-4].t));
                                         (yyval.sr)->type |= (yyvsp[0].t);
                                         adv_named_set(interp,(yyvsp[-3].s));}
    break;

  case 63:
#line 688 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  }
    break;

  case 65:
#line 693 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 66:
#line 697 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; IMCC_INFO(interp)->cur_unit->outer =
                     mk_sub_address_fromc(interp, (yyvsp[-1].s)); }
    break;

  case 67:
#line 700 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; IMCC_INFO(interp)->cur_unit->outer =
                     mk_const(interp, (yyvsp[-1].s), 'S'); }
    break;

  case 68:
#line 705 "compilers/imcc/imcc.y"
    { add_pcc_multi(IMCC_INFO(interp)->cur_call, NULL); }
    break;

  case 69:
#line 706 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[0].sr)); }
    break;

  case 70:
#line 707 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  add_pcc_multi(IMCC_INFO(interp)->cur_call, (yyvsp[0].sr));}
    break;

  case 71:
#line 711 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 72:
#line 712 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 73:
#line 713 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 74:
#line 714 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 75:
#line 715 "compilers/imcc/imcc.y"
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
#line 725 "compilers/imcc/imcc.y"
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
#line 735 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[-1].sr); }
    break;

  case 80:
#line 744 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 81:
#line 745 "compilers/imcc/imcc.y"
    { iSUBROUTINE(interp, IMCC_INFO(interp)->cur_unit, mk_sub_label(interp, (yyvsp[0].s))); }
    break;

  case 82:
#line 746 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_call->pcc_sub->pragma = (yyvsp[-1].t); }
    break;

  case 83:
#line 748 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
    break;

  case 84:
#line 753 "compilers/imcc/imcc.y"
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

  case 85:
#line 781 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
    break;

  case 86:
#line 785 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->label = 0; }
    break;

  case 87:
#line 786 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->label = 1; }
    break;

  case 88:
#line 790 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; }
    break;

  case 89:
#line 792 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  IMCC_INFO(interp)->cur_call->pcc_sub->object = (yyvsp[-1].sr); }
    break;

  case 90:
#line 796 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 92:
#line 801 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[0].t); }
    break;

  case 93:
#line 802 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[-2].t) | (yyvsp[0].t); }
    break;

  case 94:
#line 806 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_LOAD; }
    break;

  case 95:
#line 807 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_MAIN; }
    break;

  case 96:
#line 808 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_IMMEDIATE; }
    break;

  case 97:
#line 809 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_POSTCOMP; }
    break;

  case 98:
#line 810 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_ANON; }
    break;

  case 99:
#line 811 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_METHOD; }
    break;

  case 100:
#line 812 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_NEED_LEX; }
    break;

  case 103:
#line 819 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[-3].sr));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr));
         }
    break;

  case 104:
#line 824 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr)); }
    break;

  case 105:
#line 826 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr));
            IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 106:
#line 831 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr)); }
    break;

  case 107:
#line 833 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[-1].s),'S')); }
    break;

  case 108:
#line 835 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, (yyvsp[-3].sr));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr));
         }
    break;

  case 109:
#line 839 "compilers/imcc/imcc.y"
    {  add_pcc_sub(IMCC_INFO(interp)->cur_call, mk_const(interp, (yyvsp[-3].s),'S'));
            add_pcc_cc(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr));
         }
    break;

  case 110:
#line 846 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 111:
#line 847 "compilers/imcc/imcc.y"
    {  add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr)); }
    break;

  case 112:
#line 851 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 113:
#line 856 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 114:
#line 857 "compilers/imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[-1].sr)); }
    break;

  case 115:
#line 861 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 116:
#line 862 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 117:
#line 863 "compilers/imcc/imcc.y"
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
#line 875 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 119:
#line 876 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); }
    break;

  case 120:
#line 880 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_FLAT;   }
    break;

  case 121:
#line 881 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPTIONAL; }
    break;

  case 122:
#line 882 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPT_FLAG; }
    break;

  case 123:
#line 883 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_NAMED; }
    break;

  case 124:
#line 884 "compilers/imcc/imcc.y"
    {  adv_named_set(interp,(yyvsp[-1].s)); (yyval.t) = 0; }
    break;

  case 125:
#line 885 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_UNIQUE_REG; }
    break;

  case 126:
#line 890 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 127:
#line 891 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; }
    break;

  case 130:
#line 901 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, (yyvsp[-1].t)); }
    break;

  case 131:
#line 904 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 132:
#line 905 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.i) = 0;  }
    break;

  case 133:
#line 911 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 134:
#line 912 "compilers/imcc/imcc.y"
    {
       if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); 
   }
    break;

  case 135:
#line 915 "compilers/imcc/imcc.y"
    {
       if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); 
   }
    break;

  case 136:
#line 921 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 137:
#line 926 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 138:
#line 931 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 139:
#line 933 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 140:
#line 938 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 141:
#line 942 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 142:
#line 943 "compilers/imcc/imcc.y"
    {  
      if (IMCC_INFO(interp)->adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               IMCC_INFO(interp)->adv_named_id, (yyvsp[0].sr));
          IMCC_INFO(interp)->adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr)); }
    break;

  case 143:
#line 949 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[-2].s),(yyvsp[0].sr));}
    break;

  case 144:
#line 951 "compilers/imcc/imcc.y"
    {  
      if (IMCC_INFO(interp)->adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               IMCC_INFO(interp)->adv_named_id,(yyvsp[0].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr));    }
    break;

  case 145:
#line 957 "compilers/imcc/imcc.y"
    {  
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[-2].s),(yyvsp[0].sr));}
    break;

  case 148:
#line 976 "compilers/imcc/imcc.y"
    { clear_state(interp); }
    break;

  case 149:
#line 981 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[0].i); }
    break;

  case 150:
#line 982 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 151:
#line 983 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 152:
#line 984 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 153:
#line 988 "compilers/imcc/imcc.y"
    {  (yyval.i) = NULL; }
    break;

  case 157:
#line 998 "compilers/imcc/imcc.y"
    {
         (yyval.i) = iLABEL(interp, IMCC_INFO(interp)->cur_unit, mk_local_label(interp, (yyvsp[0].s)));
                   }
    break;

  case 158:
#line 1007 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[-1].i); }
    break;

  case 159:
#line 1009 "compilers/imcc/imcc.y"
    { if (yynerrs >= PARROT_MAX_RECOVER_ERRORS) {
                           IMCC_warning(interp, "Too many errors. Correct some first.\n");
                           YYABORT;
                       }
                       yyerrok; }
    break;

  case 160:
#line 1018 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[0].idlist);
         l->next = NULL;
         (yyval.idlist) = l;
     }
    break;

  case 161:
#line 1025 "compilers/imcc/imcc.y"
    {  
         IdList* l = (yyvsp[0].idlist);
         l->next = (yyvsp[-2].idlist);
         (yyval.idlist) = l;
     }
    break;

  case 162:
#line 1034 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = (yyvsp[-1].s);
         l->unique_reg = 1;
         (yyval.idlist) = l;
     }
    break;

  case 163:
#line 1042 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = (yyvsp[0].s);
         l->unique_reg = 0;
         (yyval.idlist) = l;
     }
    break;

  case 166:
#line 1053 "compilers/imcc/imcc.y"
    { push_namespace((yyvsp[0].s)); }
    break;

  case 167:
#line 1054 "compilers/imcc/imcc.y"
    { pop_namespace((yyvsp[0].s)); }
    break;

  case 168:
#line 1055 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 169:
#line 1056 "compilers/imcc/imcc.y"
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

  case 170:
#line 1071 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, (yyvsp[0].sr), (yyvsp[-2].s)); (yyval.i) = 0;
                    }
    break;

  case 171:
#line 1074 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 172:
#line 1075 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 0);is_def=0; }
    break;

  case 174:
#line 1077 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 175:
#line 1078 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1);is_def=0; }
    break;

  case 176:
#line 1079 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;
                           IMCC_INFO(interp)->cur_call->pcc_sub->flags |= isTAIL_CALL;
                           IMCC_INFO(interp)->cur_call = NULL;
                        }
    break;

  case 177:
#line 1083 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "branch",1, (yyvsp[0].sr)); }
    break;

  case 178:
#line 1085 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-1].s), 0, 
                              IMCC_INFO(interp) -> regs,
                              IMCC_INFO(interp) -> nargs, 
                              IMCC_INFO(interp) -> keyvec, 1);
                       free((yyvsp[-1].s)); }
    break;

  case 179:
#line 1091 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[0].sr)); }
    break;

  case 180:
#line 1092 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; IMCC_INFO(interp)->cur_call = NULL; }
    break;

  case 181:
#line 1093 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 183:
#line 1095 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 184:
#line 1099 "compilers/imcc/imcc.y"
    { (yyval.t) = 'I'; }
    break;

  case 185:
#line 1100 "compilers/imcc/imcc.y"
    { (yyval.t) = 'N'; }
    break;

  case 186:
#line 1101 "compilers/imcc/imcc.y"
    { (yyval.t) = 'S'; }
    break;

  case 187:
#line 1102 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 188:
#line 1103 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 189:
#line 1104 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; free((yyvsp[0].s)); }
    break;

  case 190:
#line 1109 "compilers/imcc/imcc.y"
    {
             if (( IMCC_INFO(interp)->cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, (yyvsp[0].s), 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", (yyvsp[0].s));
            }
         }
    break;

  case 191:
#line 1120 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set", 2, (yyvsp[-2].sr), (yyvsp[0].sr));      }
    break;

  case 192:
#line 1122 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "not", 2, (yyvsp[-3].sr), (yyvsp[0].sr));      }
    break;

  case 193:
#line 1124 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "neg", 2, (yyvsp[-3].sr), (yyvsp[0].sr));      }
    break;

  case 194:
#line 1126 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bnot", 2, (yyvsp[-3].sr), (yyvsp[0].sr));     }
    break;

  case 195:
#line 1128 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "add", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 196:
#line 1130 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "sub", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 197:
#line 1132 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mul", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 198:
#line 1134 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "pow", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 199:
#line 1136 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "div", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 200:
#line 1138 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "fdiv", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 201:
#line 1140 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mod", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 202:
#line 1142 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "concat", 3, (yyvsp[-4].sr),(yyvsp[-2].sr),(yyvsp[0].sr)); }
    break;

  case 203:
#line 1144 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "iseq", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 204:
#line 1146 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isne", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 205:
#line 1148 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isgt", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 206:
#line 1150 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "islt", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 207:
#line 1152 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isle", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 208:
#line 1154 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "isge", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 209:
#line 1156 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shl", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 210:
#line 1158 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 211:
#line 1160 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "lsr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 212:
#line 1162 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "and", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 213:
#line 1164 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "or", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));   }
    break;

  case 214:
#line 1166 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "xor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 215:
#line 1168 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "band", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 216:
#line 1170 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 217:
#line 1172 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bxor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 218:
#line 1174 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); }
    break;

  case 219:
#line 1176 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[0].sr)); }
    break;

  case 220:
#line 1178 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-5].sr), (yyvsp[-2].s), (yyvsp[0].sr), 1); }
    break;

  case 221:
#line 1180 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-6].sr), (yyvsp[-3].s), (yyvsp[-1].sr), 1); }
    break;

  case 222:
#line 1182 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-3].sr), (yyvsp[0].s), NULL, 1); }
    break;

  case 223:
#line 1184 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[-3].sr), (yyvsp[0].sr)); }
    break;

  case 224:
#line 1186 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[-5].sr), (yyvsp[-1].sr)); }
    break;

  case 225:
#line 1188 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 226:
#line 1190 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[-6].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); }
    break;

  case 227:
#line 1192 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "set_addr",
                        2, (yyvsp[-3].sr), mk_label_address(interp, (yyvsp[0].s))); }
    break;

  case 228:
#line 1195 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "find_global",2,(yyvsp[-3].sr),(yyvsp[0].sr));}
    break;

  case 229:
#line 1197 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "store_global",2, (yyvsp[-2].sr),(yyvsp[0].sr)); }
    break;

  case 230:
#line 1201 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 231:
#line 1203 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 232:
#line 1205 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); }
    break;

  case 233:
#line 1208 "compilers/imcc/imcc.y"
    {
            add_pcc_result((yyvsp[0].i)->r[0], (yyvsp[-2].sr));
            IMCC_INFO(interp)->cur_call = NULL;
            (yyval.i) = 0;
         }
    break;

  case 234:
#line 1214 "compilers/imcc/imcc.y"
    {
            (yyval.i) = IMCC_create_itcall_label(interp);
         }
    break;

  case 235:
#line 1218 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[-3].sr));
           IMCC_INFO(interp)->cur_call = NULL;
         }
    break;

  case 239:
#line 1226 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, "null", 1, (yyvsp[-2].sr)); }
    break;

  case 240:
#line 1229 "compilers/imcc/imcc.y"
    { (yyval.i) = IMCC_create_itcall_label(interp);
                           (yyval.i)->type &= ~ITCALL; (yyval.i)->type |= ITRESULT; }
    break;

  case 241:
#line 1231 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 242:
#line 1236 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "add", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 243:
#line 1238 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "sub", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 244:
#line 1240 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mul", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 245:
#line 1242 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "div", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 246:
#line 1244 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "mod", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 247:
#line 1246 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "fdiv", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 248:
#line 1248 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "concat", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 249:
#line 1250 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "band", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 250:
#line 1252 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 251:
#line 1254 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "bxor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 252:
#line 1256 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 253:
#line 1258 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "shl", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 254:
#line 1260 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "lsr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 255:
#line 1265 "compilers/imcc/imcc.y"
    { (yyval.i) = func_ins(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-3].sr), (yyvsp[-1].s),
                                   IMCC_INFO(interp) -> regs,
                                   IMCC_INFO(interp) -> nargs,
                                   IMCC_INFO(interp) -> keyvec, 1);
                     free((yyvsp[-1].s));
                   }
    break;

  case 256:
#line 1273 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); }
    break;

  case 257:
#line 1274 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); }
    break;

  case 258:
#line 1275 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[0].s)); }
    break;

  case 259:
#line 1276 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[0].sr);
                       if ((yyvsp[0].sr)->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 260:
#line 1281 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 261:
#line 1282 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[-2].sr); (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); }
    break;

  case 262:
#line 1283 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 263:
#line 1286 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 264:
#line 1287 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 265:
#line 1292 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[0].sr));
        }
    break;

  case 266:
#line 1297 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[-3].i); }
    break;

  case 267:
#line 1301 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 268:
#line 1302 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; 
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call, IMCC_INFO(interp)->adv_named_id, (yyvsp[0].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       } else add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[0].sr)); 
   }
    break;

  case 269:
#line 1308 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; 
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_arg(interp, IMCC_INFO(interp)->cur_call,IMCC_INFO(interp)->adv_named_id,(yyvsp[0].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       } else add_pcc_arg(IMCC_INFO(interp)->cur_call, (yyvsp[0].sr));
   }
    break;

  case 270:
#line 1314 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0;
                                     add_pcc_named_arg(interp,IMCC_INFO(interp)->cur_call,(yyvsp[-2].s),(yyvsp[0].sr));}
    break;

  case 271:
#line 1316 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_named_arg(interp,IMCC_INFO(interp)->cur_call,(yyvsp[-2].s),(yyvsp[0].sr));}
    break;

  case 272:
#line 1320 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 273:
#line 1324 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 274:
#line 1325 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); }
    break;

  case 275:
#line 1329 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT; }
    break;

  case 276:
#line 1330 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_MAYBE_FLAT; }
    break;

  case 277:
#line 1331 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_NAMED; }
    break;

  case 278:
#line 1332 "compilers/imcc/imcc.y"
    { adv_named_set(interp,(yyvsp[-1].s)); (yyval.t) = 0; }
    break;

  case 279:
#line 1335 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 280:
#line 1339 "compilers/imcc/imcc.y"
    { 
         (yyval.sr) = 0;
         if (IMCC_INFO(interp)->adv_named_id) {
             add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,IMCC_INFO(interp)->adv_named_id,(yyvsp[0].sr));
             IMCC_INFO(interp)->adv_named_id = NULL;
         } else add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[0].sr)); }
    break;

  case 281:
#line 1345 "compilers/imcc/imcc.y"
    { 
        add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,(yyvsp[-2].s),(yyvsp[0].sr)); }
    break;

  case 282:
#line 1347 "compilers/imcc/imcc.y"
    { 
       (yyval.sr) = 0;
       if (IMCC_INFO(interp)->adv_named_id) {
           add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,IMCC_INFO(interp)->adv_named_id,(yyvsp[0].sr));
           IMCC_INFO(interp)->adv_named_id = NULL;
       } else add_pcc_result(IMCC_INFO(interp)->cur_call, (yyvsp[0].sr)); }
    break;

  case 283:
#line 1353 "compilers/imcc/imcc.y"
    { add_pcc_named_result(interp,IMCC_INFO(interp)->cur_call,(yyvsp[-2].s),(yyvsp[0].sr)); }
    break;

  case 284:
#line 1354 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 285:
#line 1359 "compilers/imcc/imcc.y"
    { (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, (yyvsp[-3].s), 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 286:
#line 1361 "compilers/imcc/imcc.y"
    { (yyval.i) =MK_I(interp, IMCC_INFO(interp)->cur_unit, inv_op((yyvsp[-3].s)), 3, (yyvsp[-4].sr),(yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 287:
#line 1363 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 288:
#line 1365 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 289:
#line 1367 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 290:
#line 1369 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless",2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 291:
#line 1371 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 292:
#line 1373 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, IMCC_INFO(interp)->cur_unit, "unless", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 293:
#line 1377 "compilers/imcc/imcc.y"
    {  (yyval.s) = "eq"; }
    break;

  case 294:
#line 1378 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ne"; }
    break;

  case 295:
#line 1379 "compilers/imcc/imcc.y"
    {  (yyval.s) = "gt"; }
    break;

  case 296:
#line 1380 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ge"; }
    break;

  case 297:
#line 1381 "compilers/imcc/imcc.y"
    {  (yyval.s) = "lt"; }
    break;

  case 298:
#line 1382 "compilers/imcc/imcc.y"
    {  (yyval.s) = "le"; }
    break;

  case 301:
#line 1391 "compilers/imcc/imcc.y"
    {  (yyval.sr) = NULL; }
    break;

  case 302:
#line 1392 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 303:
#line 1396 "compilers/imcc/imcc.y"
    { (yyval.sr) = IMCC_INFO(interp)->regs[0]; }
    break;

  case 305:
#line 1401 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->regs[IMCC_INFO(interp)->nargs++] = (yyvsp[0].sr); }
    break;

  case 306:
#line 1403 "compilers/imcc/imcc.y"
    {
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[-3].sr);
                      IMCC_INFO(interp) -> keyvec |= KEY_BIT(IMCC_INFO(interp)->nargs);
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[-1].sr);
                      (yyval.sr) = (yyvsp[-3].sr);
                   }
    break;

  case 307:
#line 1410 "compilers/imcc/imcc.y"
    {
                      IMCC_INFO(interp) -> regs[IMCC_INFO(interp)->nargs++] = (yyvsp[-1].sr);
                      (yyval.sr) = (yyvsp[-1].sr);
                   }
    break;

  case 309:
#line 1417 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); }
    break;

  case 310:
#line 1418 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[0].s)); }
    break;

  case 311:
#line 1422 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); }
    break;

  case 312:
#line 1423 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); }
    break;

  case 313:
#line 1427 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); }
    break;

  case 314:
#line 1428 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); }
    break;

  case 319:
#line 1441 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->nkeys = 0;
                      IMCC_INFO(interp)->in_slice = 0; }
    break;

  case 320:
#line 1443 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp, 
                                     IMCC_INFO(interp)->nkeys, 
                                     IMCC_INFO(interp)->keys, 0); }
    break;

  case 321:
#line 1448 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->nkeys = 0;
                      IMCC_INFO(interp)->in_slice = 0; }
    break;

  case 322:
#line 1450 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp,
                                     IMCC_INFO(interp)->nkeys, 
                                     IMCC_INFO(interp)->keys, 1); }
    break;

  case 323:
#line 1456 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[0].sr); }
    break;

  case 324:
#line 1458 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[0].sr);
                      (yyval.sr) = IMCC_INFO(interp)->keys[0]; }
    break;

  case 325:
#line 1460 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->in_slice = 1; }
    break;

  case 326:
#line 1461 "compilers/imcc/imcc.y"
    { IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[0].sr);
                       (yyval.sr) = IMCC_INFO(interp)->keys[0]; }
    break;

  case 327:
#line 1466 "compilers/imcc/imcc.y"
    { if (IMCC_INFO(interp)->in_slice) {
                         (yyvsp[0].sr)->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     (yyval.sr) = (yyvsp[0].sr);
                   }
    break;

  case 328:
#line 1472 "compilers/imcc/imcc.y"
    { (yyvsp[-2].sr)->type |= VT_START_SLICE;
                     (yyvsp[0].sr)->type |= VT_END_SLICE;
                     IMCC_INFO(interp)->keys[IMCC_INFO(interp)->nkeys++] = (yyvsp[-2].sr); 
                     (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 329:
#line 1476 "compilers/imcc/imcc.y"
    { (yyvsp[0].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 330:
#line 1477 "compilers/imcc/imcc.y"
    { (yyvsp[-1].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[-1].sr); }
    break;

  case 331:
#line 1481 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'I'); }
    break;

  case 332:
#line 1482 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'N'); }
    break;

  case 333:
#line 1483 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); }
    break;

  case 334:
#line 1484 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'P'); }
    break;

  case 335:
#line 1485 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_pasm_reg(interp, (yyvsp[0].s));    }
    break;

  case 336:
#line 1489 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'I'); }
    break;

  case 337:
#line 1490 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'N'); }
    break;

  case 338:
#line 1491 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); }
    break;

  case 339:
#line 1492 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'U'); }
    break;

  case 340:
#line 1496 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); }
    break;

  case 341:
#line 1497 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S');  }
    break;


      default: break;
    }

/* Line 1126 of yacc.c.  */
#line 4166 "compilers/imcc/imcparser.c"

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


#line 1502 "compilers/imcc/imcc.y"


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

