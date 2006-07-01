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
     UNIQUE_REG = 349,
     LABEL = 350,
     EMIT = 351,
     EOM = 352,
     IREG = 353,
     NREG = 354,
     SREG = 355,
     PREG = 356,
     IDENTIFIER = 357,
     REG = 358,
     MACRO = 359,
     ENDM = 360,
     STRINGC = 361,
     INTC = 362,
     FLOATC = 363,
     USTRINGC = 364,
     PARROT_OP = 365,
     VAR = 366,
     LINECOMMENT = 367,
     FILECOMMENT = 368,
     DOT = 369,
     CONCAT = 370,
     POINTY = 371
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
#define UNIQUE_REG 349
#define LABEL 350
#define EMIT 351
#define EOM 352
#define IREG 353
#define NREG 354
#define SREG 355
#define PREG 356
#define IDENTIFIER 357
#define REG 358
#define MACRO 359
#define ENDM 360
#define STRINGC 361
#define INTC 362
#define FLOATC 363
#define USTRINGC 364
#define PARROT_OP 365
#define VAR 366
#define LINECOMMENT 367
#define FILECOMMENT 368
#define DOT 369
#define CONCAT 370
#define POINTY 371




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
#include "pbc.h"
#include "parser.h"

#define YYDEBUG 1
#define YYERROR_VERBOSE 1

/*
 * we use a pure parser with the interpreter as a parameter
 * this still doesn't make the parser reentrant, there are too
 * many globals around.
 * These globals should go into one structure, which could be
 * attached to the interpreter
 */

#define YYPARSE_PARAM interp
#define YYLEX_PARAM interp
/*
 * Choosing instructions for Parrot is pretty easy since
 * many are polymorphic.
 */


/*
 * Some convenient vars
 */
static SymReg *cur_obj, *cur_call;
static char *adv_named_id = NULL;
int cur_pmc_type;      /* used in mk_ident */
IMC_Unit * cur_unit;
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

Instruction * INS_LABEL(IMC_Unit * unit, SymReg * r0, int emit)
{

    Instruction *ins;

    ins = _mk_instruction("","%s:", 1, &r0, 0);
    ins->type = ITLABEL;
    r0->first_ins = ins;
    if (emit)
        emitb(unit, ins);
    return ins;
}

static Instruction * iLABEL(IMC_Unit * unit, SymReg * r0) {
    Instruction *i = INS_LABEL(unit, r0, 1);
    i->line = line;
    clear_state();
    return i;
}

static Instruction * iSUBROUTINE(Interp *interp, IMC_Unit * unit, SymReg * r) {
    Instruction *i;
    i =  iLABEL(unit, r);
    r->type = (r->type & VT_ENCODED) ? VT_PCC_SUB|VT_ENCODED : VT_PCC_SUB;
    r->pcc_sub = calloc(1, sizeof(struct pcc_sub_t));
    cur_call = r;
    i->line = line - 1;
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
    i = iLABEL(cur_unit, r);
    cur_call = r;
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
    cur_call->pcc_sub->sub = sub;
    if (cur_obj) {
        if (cur_obj->set != 'P')
            IMCC_fataly(interp, E_SyntaxError, "object isn't a PMC");
        cur_call->pcc_sub->object = cur_obj;
        cur_obj = NULL;
    }
    if (cur_call->pcc_sub->sub->pmc_type == enum_class_NCI)
        cur_call->pcc_sub->flags |= isNCI;
    if (cur_unit->type == IMC_PCCSUB)
        cur_unit->instructions->r[0]->pcc_sub->calls_a_sub |= 1;
}

static void
begin_return_or_yield(Interp *interp, int yield)
{
    Instruction *i, *ins;
    char name[128];
    ins = cur_unit->instructions;
    if(!ins || !ins->r[0] || !(ins->r[0]->type & VT_PCC_SUB))
        IMCC_fataly(interp, E_SyntaxError,
              "yield or return directive outside pcc subroutine\n");
    if(yield)
       ins->r[0]->pcc_sub->calls_a_sub = 1 | ITPCCYIELD;
    sprintf(name, yield ? "%cpcc_sub_yield_%d" : "%cpcc_sub_ret_%d", IMCC_INTERNAL_CHAR, cnr++);
    interp->imc_info->sr_return = mk_pcc_sub(interp, str_dup(name), 0);
    i = iLABEL(cur_unit, interp->imc_info->sr_return);
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
#line 389 "compilers/imcc/imcc.y"
{
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
}
/* Line 193 of yacc.c.  */
#line 724 "compilers/imcc/imcparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 737 "compilers/imcc/imcparser.c"

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
#define YYFINAL  42
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   754

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  133
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  117
/* YYNRULES -- Number of rules.  */
#define YYNRULES  335
/* YYNRULES -- Number of states.  */
#define YYNSTATES  583

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   371

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   123,     2,     2,     2,   129,   130,     2,
     121,   122,   127,   126,     2,   124,     2,   128,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   132,
       2,   118,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   119,     2,   120,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   131,     2,   125,     2,     2,     2,
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
     116,   117
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    25,    27,    29,    33,    36,    39,    44,    49,
      53,    59,    60,    67,    68,    75,    77,    79,    81,    84,
      88,    91,    93,    95,    97,    99,   100,   104,   105,   110,
     113,   118,   119,   121,   122,   127,   128,   130,   134,   138,
     139,   140,   141,   142,   153,   154,   156,   160,   161,   165,
     169,   175,   176,   178,   183,   188,   193,   194,   198,   200,
     202,   204,   206,   208,   210,   212,   216,   217,   219,   220,
     221,   222,   233,   234,   244,   245,   248,   249,   253,   254,
     256,   258,   262,   264,   266,   268,   270,   272,   274,   276,
     278,   280,   286,   290,   294,   298,   302,   308,   314,   315,
     319,   322,   323,   327,   331,   332,   337,   338,   341,   343,
     345,   347,   349,   354,   356,   358,   360,   362,   364,   365,
     371,   373,   374,   377,   381,   385,   386,   392,   393,   399,
     400,   402,   406,   410,   416,   418,   421,   422,   425,   428,
     430,   432,   433,   435,   438,   440,   442,   446,   448,   452,
     455,   457,   459,   461,   464,   467,   468,   473,   478,   479,
     486,   488,   489,   496,   499,   502,   505,   508,   510,   512,
     514,   515,   517,   519,   521,   523,   525,   527,   529,   533,
     538,   543,   548,   554,   560,   566,   572,   578,   584,   590,
     596,   602,   608,   614,   620,   626,   632,   638,   644,   650,
     656,   662,   668,   674,   680,   686,   693,   700,   707,   715,
     720,   725,   732,   739,   747,   752,   757,   762,   767,   774,
     782,   786,   787,   797,   799,   801,   803,   807,   808,   814,
     818,   822,   826,   830,   834,   838,   842,   846,   850,   854,
     858,   862,   866,   871,   873,   875,   877,   879,   883,   887,
     891,   893,   895,   896,   902,   903,   907,   909,   915,   919,
     922,   923,   926,   928,   930,   935,   938,   942,   948,   950,
     954,   955,   962,   969,   975,   981,   986,   991,   996,  1001,
    1003,  1005,  1007,  1009,  1011,  1013,  1015,  1017,  1018,  1020,
    1024,  1026,  1028,  1033,  1037,  1039,  1041,  1043,  1045,  1047,
    1049,  1051,  1053,  1055,  1057,  1059,  1060,  1063,  1065,  1069,
    1070,  1075,  1077,  1081,  1084,  1087,  1089,  1091,  1093,  1095,
    1097,  1099,  1101,  1103,  1105,  1107
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     134,     0,    -1,   135,    -1,   136,    -1,   135,   136,    -1,
     155,    -1,   141,    -1,   140,    -1,   157,    -1,   171,    -1,
     152,    -1,   105,     4,    -1,   137,    -1,     4,    -1,     6,
     138,     4,    -1,   139,     4,    -1,     7,   108,    -1,     8,
     107,    72,   107,    -1,     9,   108,    72,   108,    -1,    61,
     213,   103,    -1,    61,   213,   103,   118,   248,    -1,    -1,
      29,   142,   213,   103,   118,   248,    -1,    -1,    29,   144,
     108,   240,   118,   145,    -1,   107,    -1,   110,    -1,   147,
      -1,   146,   147,    -1,   203,   148,     4,    -1,   105,     4,
      -1,   114,    -1,   113,    -1,   155,    -1,   143,    -1,    -1,
     149,   111,   151,    -1,    -1,    78,   150,   179,    96,    -1,
      14,   241,    -1,    28,   107,    72,   104,    -1,    -1,   234,
      -1,    -1,    97,   153,   154,    98,    -1,    -1,   146,    -1,
      22,   156,     4,    -1,   119,   242,   120,    -1,    -1,    -1,
      -1,    -1,    25,   158,   237,   159,   179,     4,   160,   161,
     170,    73,    -1,    -1,     4,    -1,   161,   162,     4,    -1,
      -1,     5,   163,   164,    -1,   213,   103,   188,    -1,   213,
     107,    20,   103,   188,    -1,    -1,    72,    -1,    94,   121,
     168,   122,    -1,    92,   121,   107,   122,    -1,    92,   121,
     103,   122,    -1,    -1,   168,    72,   169,    -1,   169,    -1,
      49,    -1,    50,    -1,    52,    -1,    51,    -1,   103,    -1,
     107,    -1,   119,   242,   120,    -1,    -1,   200,    -1,    -1,
      -1,    -1,    78,   172,   103,   173,   179,     4,   174,   161,
     170,    73,    -1,    -1,    75,     4,   176,   183,   178,   182,
     177,   185,    76,    -1,    -1,   205,     4,    -1,    -1,    85,
     241,     4,    -1,    -1,   180,    -1,   181,    -1,   180,   165,
     181,    -1,    87,    -1,    86,    -1,    88,    -1,    89,    -1,
      91,    -1,    90,    -1,    93,    -1,   166,    -1,   167,    -1,
      77,   241,    72,   241,     4,    -1,    77,   241,     4,    -1,
      83,   241,     4,    -1,    84,   233,     4,    -1,    84,   107,
       4,    -1,    84,   233,    72,   241,     4,    -1,    84,   107,
      72,   241,     4,    -1,    -1,   183,   184,     4,    -1,    11,
     226,    -1,    -1,   185,   186,     4,    -1,    64,   233,   188,
      -1,    -1,    27,   187,   213,   208,    -1,    -1,   188,   189,
      -1,    16,    -1,    17,    -1,    18,    -1,    19,    -1,    19,
     121,   107,   122,    -1,    95,    -1,    79,    -1,    81,    -1,
      80,    -1,    82,    -1,    -1,   190,     4,   193,   194,   191,
      -1,   196,    -1,    -1,   194,     4,    -1,   194,   195,     4,
      -1,    65,   241,   227,    -1,    -1,    65,   121,   197,   199,
     122,    -1,    -1,    66,   121,   198,   199,   122,    -1,    -1,
     226,    -1,   107,    20,   241,    -1,   199,    72,   226,    -1,
     199,    72,   107,    20,   241,    -1,   202,    -1,   200,   202,
      -1,    -1,   201,   206,    -1,   105,     4,    -1,   114,    -1,
     113,    -1,    -1,   204,    -1,   204,   205,    -1,   205,    -1,
      96,    -1,   203,   209,     4,    -1,   208,    -1,   207,    72,
     208,    -1,   103,    95,    -1,   103,    -1,   215,    -1,   231,
      -1,    22,   103,    -1,    23,   103,    -1,    -1,    27,   210,
     213,   207,    -1,    28,   107,    72,   233,    -1,    -1,    29,
     211,   213,   103,   118,   248,    -1,   143,    -1,    -1,    32,
     212,   213,   103,   118,   248,    -1,    65,   223,    -1,    10,
     239,    -1,   111,   234,    -1,    14,   241,    -1,   223,    -1,
     175,    -1,   192,    -1,    -1,    49,    -1,    50,    -1,    51,
      -1,    52,    -1,    53,    -1,   214,    -1,   103,    -1,   233,
     118,   241,    -1,   233,   118,   123,   241,    -1,   233,   118,
     124,   241,    -1,   233,   118,   125,   241,    -1,   233,   118,
     241,   126,   241,    -1,   233,   118,   241,   124,   241,    -1,
     233,   118,   241,   127,   241,    -1,   233,   118,   241,    68,
     241,    -1,   233,   118,   241,   128,   241,    -1,   233,   118,
     241,    41,   241,    -1,   233,   118,   241,   129,   241,    -1,
     233,   118,   241,   116,   241,    -1,   233,   118,   241,    55,
     241,    -1,   233,   118,   241,    56,   241,    -1,   233,   118,
     241,    57,   241,    -1,   233,   118,   241,    59,   241,    -1,
     233,   118,   241,    60,   241,    -1,   233,   118,   241,    58,
     241,    -1,   233,   118,   241,    47,   241,    -1,   233,   118,
     241,    48,   241,    -1,   233,   118,   241,    69,   241,    -1,
     233,   118,   241,    70,   241,    -1,   233,   118,   241,    71,
     241,    -1,   233,   118,   241,    54,   241,    -1,   233,   118,
     241,   130,   241,    -1,   233,   118,   241,   131,   241,    -1,
     233,   118,   241,   125,   241,    -1,   233,   118,   241,   119,
     242,   120,    -1,   233,   119,   242,   120,   118,   241,    -1,
     233,   118,    21,   214,    72,   241,    -1,   233,   118,    21,
     214,   119,   242,   120,    -1,   233,   118,    21,   214,    -1,
     233,   118,    21,   241,    -1,   233,   118,    21,   119,   242,
     120,    -1,   233,   118,    21,   241,    72,   241,    -1,   233,
     118,    21,   241,   119,   242,   120,    -1,   233,   118,    63,
     103,    -1,   233,   118,    62,   249,    -1,    62,   249,   118,
     241,    -1,    21,   233,    72,   241,    -1,    21,   233,    72,
     241,    72,   241,    -1,    21,   233,    72,   241,   119,   242,
     120,    -1,   233,   118,   223,    -1,    -1,   121,   216,   230,
     122,   118,   221,   121,   225,   122,    -1,   217,    -1,   219,
      -1,   220,    -1,   233,   118,    14,    -1,    -1,    67,   218,
     121,   230,   122,    -1,   233,    33,   241,    -1,   233,    34,
     241,    -1,   233,    35,   241,    -1,   233,    36,   241,    -1,
     233,    43,   241,    -1,   233,    42,   241,    -1,   233,    37,
     241,    -1,   233,    38,   241,    -1,   233,    39,   241,    -1,
     233,    40,   241,    -1,   233,    44,   241,    -1,   233,    45,
     241,    -1,   233,    46,   241,    -1,   233,   118,   111,   151,
      -1,   103,    -1,   107,    -1,   110,    -1,   233,    -1,   233,
     222,   238,    -1,   233,   222,   107,    -1,   233,   222,   233,
      -1,   117,    -1,   115,    -1,    -1,   221,   224,   121,   225,
     122,    -1,    -1,   225,    72,   226,    -1,   226,    -1,   225,
      72,   107,    20,   241,    -1,   107,    20,   241,    -1,   241,
     227,    -1,    -1,   227,   228,    -1,    15,    -1,    19,    -1,
      19,   121,   107,   122,    -1,   233,   188,    -1,   230,    72,
     229,    -1,   230,    72,   107,    20,   233,    -1,   229,    -1,
     107,    20,   233,    -1,    -1,    12,   241,   232,   241,    10,
     239,    -1,    13,   241,   232,   241,    10,   239,    -1,    12,
      14,   241,    10,   239,    -1,    13,    14,   241,    10,   239,
      -1,    12,   241,    10,   239,    -1,    13,   241,    10,   239,
      -1,    12,   241,    72,   239,    -1,    13,   241,    72,   239,
      -1,    55,    -1,    56,    -1,    57,    -1,    58,    -1,    59,
      -1,    60,    -1,   112,    -1,   247,    -1,    -1,   235,    -1,
     235,    72,   236,    -1,   236,    -1,   240,    -1,   233,   119,
     242,   120,    -1,   119,   242,   120,    -1,   238,    -1,   107,
      -1,   110,    -1,   103,    -1,   111,    -1,   103,    -1,   111,
      -1,   239,    -1,   241,    -1,   233,    -1,   248,    -1,    -1,
     243,   244,    -1,   246,    -1,   244,   132,   246,    -1,    -1,
     244,    72,   245,   246,    -1,   241,    -1,   241,    74,   241,
      -1,    74,   241,    -1,   241,    74,    -1,    99,    -1,   100,
      -1,   101,    -1,   102,    -1,   104,    -1,   108,    -1,   109,
      -1,   107,    -1,   110,    -1,   101,    -1,   107,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   472,   472,   476,   477,   481,   482,   483,   484,   485,
     486,   487,   488,   489,   492,   493,   496,   504,   513,   522,
     528,   537,   537,   542,   542,   546,   547,   551,   552,   556,
     557,   558,   559,   560,   561,   564,   564,   569,   568,   579,
     581,   586,   590,   594,   594,   604,   606,   610,   626,   627,
     632,   636,   639,   631,   645,   646,   647,   656,   656,   660,
     665,   675,   676,   680,   683,   686,   692,   693,   694,   698,
     699,   700,   701,   702,   712,   722,   725,   727,   731,   733,
     737,   731,   744,   743,   775,   776,   780,   781,   786,   787,
     791,   792,   796,   797,   798,   799,   800,   801,   802,   803,
     804,   808,   813,   815,   820,   822,   824,   828,   836,   837,
     841,   846,   847,   851,   852,   852,   865,   866,   870,   871,
     872,   873,   874,   875,   880,   881,   885,   886,   891,   890,
     895,   901,   902,   905,   911,   916,   915,   923,   922,   932,
     933,   939,   941,   947,   953,   954,   966,   970,   972,   973,
     974,   978,   979,   983,   984,   988,   994,   999,  1006,  1015,
    1023,  1033,  1034,  1035,  1036,  1037,  1037,  1052,  1056,  1056,
    1058,  1059,  1059,  1061,  1065,  1066,  1069,  1071,  1072,  1073,
    1074,  1078,  1079,  1080,  1081,  1082,  1083,  1087,  1098,  1099,
    1100,  1101,  1102,  1103,  1104,  1105,  1106,  1107,  1108,  1109,
    1110,  1111,  1112,  1113,  1114,  1115,  1116,  1118,  1120,  1122,
    1124,  1126,  1128,  1130,  1132,  1134,  1136,  1138,  1140,  1142,
    1144,  1146,  1148,  1150,  1152,  1155,  1157,  1161,  1163,  1165,
    1168,  1175,  1174,  1183,  1184,  1185,  1186,  1190,  1190,  1196,
    1198,  1200,  1202,  1204,  1206,  1208,  1210,  1212,  1214,  1216,
    1218,  1220,  1225,  1232,  1233,  1234,  1235,  1240,  1241,  1242,
    1245,  1246,  1251,  1250,  1260,  1261,  1267,  1273,  1275,  1279,
    1283,  1284,  1288,  1289,  1290,  1293,  1297,  1303,  1305,  1311,
    1312,  1316,  1318,  1320,  1322,  1324,  1326,  1328,  1330,  1335,
    1336,  1337,  1338,  1339,  1340,  1344,  1345,  1349,  1350,  1354,
    1355,  1359,  1360,  1366,  1373,  1374,  1375,  1379,  1380,  1384,
    1385,  1389,  1390,  1394,  1395,  1398,  1398,  1403,  1404,  1406,
    1406,  1411,  1416,  1419,  1420,  1424,  1425,  1426,  1427,  1428,
    1432,  1433,  1434,  1435,  1439,  1440
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
  "UNIQUE_REG", "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG",
  "IDENTIFIER", "REG", "MACRO", "ENDM", "STRINGC", "INTC", "FLOATC",
  "USTRINGC", "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", "DOT",
  "CONCAT", "POINTY", "'='", "'['", "']'", "'('", "')'", "'!'", "'-'",
  "'~'", "'+'", "'*'", "'/'", "'%'", "'&'", "'|'", "';'", "$accept",
  "program", "compilation_units", "compilation_unit", "pragma", "pragma_1",
  "hll_def", "global", "constdef", "@1", "pmc_const", "@2", "any_string",
  "pasmcode", "pasmline", "pasm_inst", "@3", "@4", "pasm_args", "emit",
  "@5", "opt_pasmcode", "class_namespace", "maybe_keylist", "sub", "@6",
  "@7", "@8", "sub_params", "sub_param", "@9", "sub_param_type_def",
  "opt_comma", "multi", "outer", "multi_types", "multi_type", "sub_body",
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
  "var_or_i", "var", "keylist", "@24", "_keylist", "@25", "key", "reg",
  "const", "string", 0
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
     364,   365,   366,   367,   368,   369,   370,   371,    61,    91,
      93,    40,    41,    33,    45,   126,    43,    42,    47,    37,
      38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   133,   134,   135,   135,   136,   136,   136,   136,   136,
     136,   136,   136,   136,   137,   137,   138,   139,   139,   140,
     140,   142,   141,   144,   143,   145,   145,   146,   146,   147,
     147,   147,   147,   147,   147,   149,   148,   150,   148,   148,
     148,   148,   151,   153,   152,   154,   154,   155,   156,   156,
     158,   159,   160,   157,   161,   161,   161,   163,   162,   164,
     164,   165,   165,   166,   167,   167,   168,   168,   168,   169,
     169,   169,   169,   169,   169,   169,   170,   170,   172,   173,
     174,   171,   176,   175,   177,   177,   178,   178,   179,   179,
     180,   180,   181,   181,   181,   181,   181,   181,   181,   181,
     181,   182,   182,   182,   182,   182,   182,   182,   183,   183,
     184,   185,   185,   186,   187,   186,   188,   188,   189,   189,
     189,   189,   189,   189,   190,   190,   191,   191,   193,   192,
     192,   194,   194,   194,   195,   197,   196,   198,   196,   199,
     199,   199,   199,   199,   200,   200,   201,   202,   202,   202,
     202,   203,   203,   204,   204,   205,   206,   207,   207,   208,
     208,   209,   209,   209,   209,   210,   209,   209,   211,   209,
     209,   212,   209,   209,   209,   209,   209,   209,   209,   209,
     209,   213,   213,   213,   213,   213,   213,   214,   215,   215,
     215,   215,   215,   215,   215,   215,   215,   215,   215,   215,
     215,   215,   215,   215,   215,   215,   215,   215,   215,   215,
     215,   215,   215,   215,   215,   215,   215,   215,   215,   215,
     215,   215,   215,   215,   215,   215,   215,   215,   215,   215,
     215,   216,   215,   215,   215,   215,   215,   218,   217,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,   219,   220,   221,   221,   221,   221,   221,   221,   221,
     222,   222,   224,   223,   225,   225,   225,   225,   225,   226,
     227,   227,   228,   228,   228,   229,   230,   230,   230,   230,
     230,   231,   231,   231,   231,   231,   231,   231,   231,   232,
     232,   232,   232,   232,   232,   233,   233,   234,   234,   235,
     235,   236,   236,   236,   237,   237,   237,   238,   238,   239,
     239,   240,   240,   241,   241,   243,   242,   244,   244,   245,
     244,   246,   246,   246,   246,   247,   247,   247,   247,   247,
     248,   248,   248,   248,   249,   249
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     3,     2,     2,     4,     4,     3,
       5,     0,     6,     0,     6,     1,     1,     1,     2,     3,
       2,     1,     1,     1,     1,     0,     3,     0,     4,     2,
       4,     0,     1,     0,     4,     0,     1,     3,     3,     0,
       0,     0,     0,    10,     0,     1,     3,     0,     3,     3,
       5,     0,     1,     4,     4,     4,     0,     3,     1,     1,
       1,     1,     1,     1,     1,     3,     0,     1,     0,     0,
       0,    10,     0,     9,     0,     2,     0,     3,     0,     1,
       1,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     5,     3,     3,     3,     3,     5,     5,     0,     3,
       2,     0,     3,     3,     0,     4,     0,     2,     1,     1,
       1,     1,     4,     1,     1,     1,     1,     1,     0,     5,
       1,     0,     2,     3,     3,     0,     5,     0,     5,     0,
       1,     3,     3,     5,     1,     2,     0,     2,     2,     1,
       1,     0,     1,     2,     1,     1,     3,     1,     3,     2,
       1,     1,     1,     2,     2,     0,     4,     4,     0,     6,
       1,     0,     6,     2,     2,     2,     2,     1,     1,     1,
       0,     1,     1,     1,     1,     1,     1,     1,     3,     4,
       4,     4,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     6,     6,     6,     7,     4,
       4,     6,     6,     7,     4,     4,     4,     4,     6,     7,
       3,     0,     9,     1,     1,     1,     3,     0,     5,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     4,     1,     1,     1,     1,     3,     3,     3,
       1,     1,     0,     5,     0,     3,     1,     5,     3,     2,
       0,     2,     1,     1,     4,     2,     3,     5,     1,     3,
       0,     6,     6,     5,     5,     4,     4,     4,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     0,     1,     3,
       1,     1,     4,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     0,     2,     1,     3,     0,
       4,     1,     3,     2,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    13,     0,     0,     0,    49,    50,    21,     0,    78,
      43,     0,     0,     2,     3,    12,     0,     7,     6,    10,
       5,     8,     9,     0,     0,     0,     0,   315,     0,     0,
       0,   181,   182,   183,   184,   185,   187,     0,   186,     0,
     151,    11,     1,     4,    15,    16,    14,     0,     0,     0,
       0,    47,   307,   305,   306,   308,    51,   304,     0,    19,
      79,    23,   155,     0,    32,    31,    34,   151,    27,     0,
      33,    35,   152,   154,    17,    18,    48,     0,   325,   326,
     327,   328,   329,   332,   330,   331,   333,   295,   313,   321,
     316,   317,   296,   314,    88,     0,     0,    88,     0,    30,
      28,    44,     0,     0,    37,     0,     0,   153,   323,   324,
     319,     0,    93,    92,    94,    95,    97,    96,     0,    98,
       0,    99,   100,     0,    61,    90,     0,    20,     0,     0,
      39,     0,    88,    29,   297,   322,     0,   318,     0,    66,
      52,    62,     0,    22,    80,   309,   310,   311,     0,   312,
       0,     0,   315,    36,   313,    42,   298,   300,   301,   320,
       0,     0,    69,    70,    72,    71,    73,    74,   315,     0,
      68,    54,    91,    54,     0,    40,    38,     0,   315,     0,
      65,    64,     0,     0,    63,    55,   146,   146,    25,    26,
      24,   303,     0,   299,    75,    67,    57,     0,   150,   149,
       0,     0,   146,   151,   144,     0,   302,     0,   148,    56,
      53,   145,   180,   147,    81,    58,     0,     0,     0,     0,
       0,     0,     0,     0,   165,     0,   168,   171,     0,     0,
       0,   237,     0,   124,   125,   253,   254,   255,   297,   231,
     170,   178,     0,   179,   130,     0,   161,   233,   234,   235,
     262,   177,   162,   256,   116,     0,   174,     0,     0,     0,
       0,   176,     0,   163,   164,     0,     0,     0,     0,   334,
     335,     0,   135,   173,   256,   137,     0,    82,   175,   280,
     128,   156,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   261,   260,     0,   315,
       0,    59,     0,     0,     0,   289,   290,   291,   292,   293,
     294,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   139,   139,   280,   108,     0,   278,     0,
     116,   131,   264,   239,   240,   241,   242,   245,   246,   247,
     248,   244,   243,   249,   250,   251,   236,     0,     0,     0,
     332,   333,   297,     0,     0,     0,   230,   313,   188,     0,
     258,   259,   257,   118,   119,   120,   121,   123,   117,   116,
       0,   285,   287,     0,     0,   286,   288,     0,   227,   160,
     166,   157,   167,     0,     0,   226,   332,     0,   140,   270,
       0,     0,    86,     0,     0,     0,   275,     0,   332,     0,
     266,   315,   219,   220,   225,   224,   252,   189,   190,   191,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   315,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    60,   283,     0,   284,
       0,     0,   315,   159,     0,     0,     0,     0,     0,   136,
     269,   138,   238,     0,     0,     0,     0,   279,     0,   276,
       0,   132,     0,   126,   127,   129,     0,     0,     0,   263,
       0,     0,   315,     0,   315,   197,   206,   207,   211,   200,
     201,   202,   205,   203,   204,   195,   208,   209,   210,   199,
       0,   193,   214,   192,   194,   196,   198,   212,   213,     0,
       0,   281,   282,   228,     0,   158,   169,   172,   141,   332,
     142,   272,   273,   271,   110,     0,     0,     0,     0,    84,
     109,     0,     0,   270,   133,   268,   332,   265,   221,   217,
       0,   222,     0,   215,   216,   122,   229,     0,     0,    87,
       0,     0,     0,     0,   111,     0,   277,   264,   134,     0,
     218,   223,   143,     0,   102,     0,   103,   105,     0,   104,
       0,     0,    85,     0,   267,   274,     0,     0,     0,   114,
       0,    83,     0,   232,   101,   107,   106,     0,   116,   112,
       0,   113,   115
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    12,    13,    14,    15,    24,    16,    17,    18,    30,
      66,    98,   190,    67,    68,   105,   106,   132,   153,    19,
      40,    69,    20,    28,    21,    29,    94,   171,   186,   200,
     207,   215,   142,   121,   122,   169,   170,   201,    22,    39,
      97,   173,   241,   326,   544,   455,   123,   124,   125,   519,
     392,   456,   561,   572,   577,   301,   368,   242,   465,   243,
     331,   397,   466,   244,   323,   324,   387,   202,   203,   204,
      71,    72,    73,   213,   380,   381,   245,   265,   267,   268,
      37,    38,   246,   279,   247,   276,   248,   249,   250,   300,
     251,   282,   399,   388,   450,   513,   328,   329,   252,   312,
      88,   155,   156,   157,    56,    57,   147,   158,   389,    49,
      50,    90,   136,    91,    92,    93,   271
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -438
static const yytype_int16 yypact[] =
{
      16,  -438,    21,   -50,   -42,   -49,  -438,  -438,   133,  -438,
    -438,   111,   123,    16,  -438,  -438,   144,  -438,  -438,  -438,
    -438,  -438,  -438,    70,   154,   115,   118,  -438,   194,   -28,
     133,  -438,  -438,  -438,  -438,  -438,  -438,   102,  -438,   104,
      13,  -438,  -438,  -438,  -438,  -438,  -438,   101,   108,    98,
     307,  -438,  -438,  -438,  -438,  -438,  -438,  -438,   117,   103,
    -438,  -438,  -438,   223,  -438,  -438,  -438,    75,  -438,   130,
    -438,    22,   135,  -438,  -438,  -438,  -438,   436,  -438,  -438,
    -438,  -438,  -438,  -438,  -438,  -438,  -438,  -438,  -438,   155,
     -60,  -438,  -438,  -438,   660,   138,   116,   660,   126,  -438,
    -438,  -438,   436,   150,  -438,   254,   149,  -438,  -438,   436,
    -438,   307,  -438,  -438,  -438,  -438,  -438,  -438,   140,  -438,
     141,  -438,  -438,   259,     9,  -438,   116,  -438,   260,   522,
    -438,   193,   660,  -438,   494,  -438,   307,  -438,    65,   152,
    -438,  -438,   660,  -438,  -438,  -438,  -438,  -438,   148,  -438,
     165,   174,  -438,  -438,   158,  -438,   228,  -438,  -438,  -438,
     179,   182,  -438,  -438,  -438,  -438,  -438,  -438,  -438,   -58,
    -438,   301,  -438,   301,    60,  -438,  -438,   198,  -438,   494,
    -438,  -438,   199,   152,  -438,  -438,     3,     3,  -438,  -438,
    -438,  -438,   200,  -438,  -438,  -438,  -438,   317,  -438,  -438,
     318,   251,    51,   135,  -438,   253,  -438,   133,  -438,  -438,
    -438,  -438,   453,  -438,  -438,  -438,    89,    31,    29,    45,
     436,   244,   224,   225,  -438,   231,   222,  -438,   -38,   387,
     210,  -438,   335,  -438,  -438,  -438,  -438,  -438,   494,  -438,
    -438,  -438,   336,  -438,  -438,   338,  -438,  -438,  -438,  -438,
    -438,  -438,  -438,   246,  -438,   330,  -438,   436,   257,   436,
     277,  -438,   281,  -438,  -438,   133,   283,   133,   133,  -438,
    -438,   239,  -438,  -438,    44,  -438,   237,  -438,  -438,   110,
    -438,  -438,   238,   436,   436,   436,   436,   436,   436,   436,
     436,   436,   436,   436,   436,   436,  -438,  -438,   333,  -438,
     195,    37,   287,   350,    31,  -438,  -438,  -438,  -438,  -438,
    -438,    31,   436,   352,    31,    31,   436,   436,   288,   244,
     289,   290,   436,   554,   554,   110,  -438,   374,  -438,   -54,
    -438,  -438,   568,  -438,  -438,  -438,  -438,  -438,  -438,  -438,
    -438,  -438,  -438,  -438,  -438,  -438,  -438,   508,   -38,   295,
     279,   280,   494,   436,   436,   436,  -438,    76,   521,   284,
    -438,  -438,  -438,  -438,  -438,  -438,   291,  -438,  -438,  -438,
      31,  -438,  -438,   395,    31,  -438,  -438,   403,   -45,   325,
     349,  -438,  -438,   304,   306,  -438,   405,   -35,  -438,  -438,
     -33,   -23,    10,   244,   624,   308,    37,     6,   408,   -21,
    -438,  -438,   -41,    50,  -438,  -438,  -438,  -438,  -438,  -438,
     436,   436,   436,   436,   436,   436,   436,   436,   436,   436,
     436,   436,   436,   436,   436,  -438,   436,   436,   436,   436,
     436,   436,   436,   436,   312,   324,    37,  -438,    31,  -438,
      31,   436,  -438,  -438,   288,   116,   116,   436,   582,  -438,
     180,  -438,  -438,   436,   436,   -37,   434,  -438,   419,  -438,
     610,  -438,   436,  -438,  -438,  -438,   442,   436,   596,  -438,
     327,   436,  -438,   436,  -438,  -438,  -438,  -438,  -438,  -438,
    -438,  -438,  -438,  -438,  -438,  -438,  -438,  -438,  -438,  -438,
     329,  -438,  -438,  -438,  -438,  -438,  -438,  -438,  -438,   436,
     328,  -438,  -438,  -438,   332,  -438,  -438,  -438,  -438,   433,
    -438,  -438,   339,  -438,  -438,   450,   436,   436,   633,   135,
    -438,   244,   340,  -438,  -438,  -438,   439,  -438,  -438,  -438,
     342,  -438,   344,  -438,  -438,  -438,  -438,   436,   361,  -438,
      12,   465,    19,    26,  -438,   466,  -438,   568,   180,   436,
    -438,  -438,  -438,   355,  -438,   436,  -438,  -438,   436,  -438,
     436,    87,  -438,   -10,  -438,  -438,   467,   474,   475,  -438,
     244,  -438,   479,  -438,  -438,  -438,  -438,   133,  -438,  -438,
     288,    37,  -438
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -438,  -438,  -438,   471,  -438,  -438,  -438,  -438,  -438,  -438,
     286,  -438,  -438,  -438,   425,  -438,  -438,  -438,   143,  -438,
    -438,  -438,    -6,  -438,  -438,  -438,  -438,  -438,   323,  -438,
    -438,  -438,  -438,  -438,  -438,  -438,   319,   313,  -438,  -438,
    -438,  -438,  -438,  -438,  -438,  -438,   -80,  -438,   359,  -438,
    -438,  -438,  -438,  -438,  -438,  -325,  -438,  -438,  -438,  -438,
    -438,  -438,  -438,  -438,  -438,  -438,   183,  -438,  -438,   302,
     300,  -438,   -71,  -438,  -438,  -437,  -438,  -438,  -438,  -438,
     -30,   159,  -438,  -438,  -438,  -438,  -438,  -438,    49,  -438,
    -218,  -438,   -34,  -328,   -13,  -438,   127,   187,  -438,   262,
    -119,   285,  -438,   345,  -438,   217,  -208,   396,   -44,  -149,
    -438,  -438,  -438,   -63,  -438,   -94,   178
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -257
static const yytype_int16 yytable[] =
{
      58,   107,   127,   177,   400,   396,    89,   505,   196,   256,
     461,   273,   110,   -89,   183,   154,   554,   128,   394,   182,
       1,   453,     2,   557,     3,     4,   -41,   441,    23,   192,
     559,   471,   143,   108,    70,     5,   102,   448,     5,   448,
     516,     6,    61,   257,   436,     7,   517,   518,   137,   394,
     103,   468,   151,   363,   364,   365,   366,    25,   130,   259,
     154,    70,   468,   269,   184,   135,    26,    89,   395,   270,
      27,   462,   111,   159,   442,    52,   -76,     8,   472,    53,
     356,   141,    54,    55,   555,   149,   463,   449,   464,   451,
     149,   558,    89,   253,     9,   454,   371,     5,   560,   452,
     104,   469,   262,   372,    61,   -89,   375,   376,   197,    62,
     274,   -45,   573,    10,   569,    41,   198,   199,    63,   154,
     510,    11,   473,    42,   -77,   514,    64,    65,    78,    79,
      80,    81,   367,    82,   145,   149,    83,    84,    85,    86,
     527,    87,   146,   582,    78,    79,    80,    81,    44,    82,
     359,   570,    83,    84,    85,    86,   197,    87,    46,   296,
     330,   297,   437,   571,   198,   199,   439,   188,   160,   474,
     189,    62,   161,   -46,   258,   260,   261,   216,    45,   357,
      63,   361,    31,    32,    33,    34,    35,    47,    64,    65,
      48,   296,   254,   297,   149,   511,   255,  -256,    51,   512,
     382,   162,   163,   164,   165,    59,   330,    60,    74,    78,
      79,    80,    81,   303,    82,   313,    75,   327,    76,   400,
      95,    96,    87,    83,    84,    85,    86,    99,   101,   109,
     501,    62,   502,   154,   129,   318,    36,   320,   321,   333,
     334,   335,   336,   337,   338,   339,   340,   341,   342,   343,
     344,   345,   470,   581,   358,   166,   126,   131,   133,   167,
     134,   138,   139,   140,   144,   150,   174,   304,   373,   175,
     176,   168,   377,   378,   457,   330,   490,   178,   385,   283,
     284,   285,   286,   287,   288,   289,   290,   314,   291,   292,
     293,   294,   295,   504,    78,    79,    80,    81,    52,    82,
     179,   180,   360,   403,   181,   185,    55,    87,   149,   407,
     408,   409,   305,   306,   307,   308,   309,   310,   191,   194,
     206,   208,   209,   530,   210,   532,   214,   263,   264,   311,
     -23,   275,   305,   306,   307,   308,   309,   310,   266,   277,
     280,   274,   281,    78,    79,    80,    81,   346,    82,   315,
     302,   506,   507,   317,   347,   319,    87,   322,   325,   332,
     370,   296,   374,   297,   298,   299,   475,   476,   477,   478,
     479,   480,   481,   482,   483,   484,   485,   486,   487,   488,
     489,    77,   491,   492,   493,   494,   495,   496,   497,   498,
     369,   379,   383,   384,   393,   348,   349,   503,   405,   543,
    -254,  -255,   546,   508,   434,   438,    78,    79,    80,    81,
     515,    82,   435,   440,    83,    84,    85,    86,   523,    87,
     443,   444,   445,   525,   446,   447,   460,   529,   467,   531,
     499,   500,    78,    79,    80,    81,   235,    82,   520,   521,
     350,    84,    85,   351,   352,    87,   524,   528,   545,   533,
     535,   578,   536,   537,   539,   534,   353,   354,   355,   549,
     538,   547,   550,   217,   551,   218,   219,   220,   553,   556,
     562,   574,   540,   541,   221,   222,   223,   565,   575,   576,
     224,   225,   226,   579,    43,   227,    78,    79,    80,    81,
     235,    82,   100,   552,   236,   406,   187,   237,   240,    87,
     205,   172,   195,   212,   211,   564,   402,   390,   272,   522,
     548,   566,   391,   563,   567,   228,   568,   362,   229,   230,
     231,   459,   316,   278,   193,   148,   404,     0,   232,     0,
       0,     0,   233,     0,   234,    78,    79,    80,    81,     0,
      82,     0,     0,    83,    84,    85,    86,   580,    87,     0,
       0,     0,    78,    79,    80,    81,   235,    82,     0,     0,
     236,     0,   410,   237,   238,    87,     0,     0,   411,   412,
       0,     0,     0,     0,   239,   413,   414,   415,   416,   417,
     418,   419,     0,     0,     0,     0,     0,     0,     0,   420,
     421,   422,   423,    78,    79,    80,    81,   145,    82,     0,
       0,    83,    84,    85,    86,   146,    87,    78,    79,    80,
      81,    36,    82,   152,     0,    83,    84,    85,    86,     0,
      87,    78,    79,    80,    81,   145,    82,   401,     0,    83,
      84,    85,    86,   146,    87,     0,     0,   424,     0,     0,
     425,     0,     0,     0,     0,   426,   427,   428,   429,   430,
     431,   432,   433,    78,    79,    80,    81,     0,    82,     0,
       0,   386,    84,    85,    86,     0,    87,    78,    79,    80,
      81,     0,    82,     0,     0,   398,    84,    85,    86,     0,
      87,    78,    79,    80,    81,     0,    82,     0,     0,   509,
      84,    85,    86,     0,    87,    78,    79,    80,    81,     0,
      82,     0,     0,   526,    84,    85,    86,     0,    87,    78,
      79,    80,    81,   235,    82,     0,     0,   236,     0,     0,
     237,     0,    87,    78,    79,    80,    81,     0,    82,     0,
       0,   458,    78,    79,    80,    81,    87,    82,     0,     0,
     542,     0,     0,     0,     0,    87,   112,   113,   114,   115,
     116,   117,   118,   119,   120
};

static const yytype_int16 yycheck[] =
{
      30,    72,    96,   152,   332,   330,    50,   444,     5,   217,
       4,   229,    72,     4,    72,   134,     4,    97,    72,   168,
       4,    11,     6,     4,     8,     9,     4,    72,     7,   178,
       4,    72,   126,    77,    40,    22,    14,    72,    22,    72,
      77,    25,    29,    14,   369,    29,    83,    84,   111,    72,
      28,    72,   132,    16,    17,    18,    19,   107,   102,    14,
     179,    67,    72,   101,   122,   109,   108,   111,   122,   107,
     119,    65,   132,   136,   119,   103,    73,    61,   119,   107,
     298,    72,   110,   111,    72,   129,    80,   122,    82,   122,
     134,    72,   136,   212,    78,    85,   304,    22,    72,   122,
      78,   122,   221,   311,    29,    96,   314,   315,   105,    96,
     229,    98,   122,    97,    27,     4,   113,   114,   105,   238,
     448,   105,    72,     0,    73,   453,   113,   114,    99,   100,
     101,   102,    95,   104,   103,   179,   107,   108,   109,   110,
     468,   112,   111,   580,    99,   100,   101,   102,     4,   104,
     299,    64,   107,   108,   109,   110,   105,   112,     4,   115,
     279,   117,   370,    76,   113,   114,   374,   107,   103,   119,
     110,    96,   107,    98,   218,   219,   220,   207,   108,   298,
     105,   300,    49,    50,    51,    52,    53,    72,   113,   114,
      72,   115,   103,   117,   238,    15,   107,   121,     4,    19,
     319,    49,    50,    51,    52,   103,   325,   103,   107,    99,
     100,   101,   102,   257,   104,   259,   108,   107,   120,   547,
     103,   118,   112,   107,   108,   109,   110,     4,    98,    74,
     438,    96,   440,   352,   108,   265,   103,   267,   268,   283,
     284,   285,   286,   287,   288,   289,   290,   291,   292,   293,
     294,   295,   401,   578,   298,   103,   118,   107,     4,   107,
     111,   121,   121,     4,     4,    72,   118,    10,   312,   104,
      96,   119,   316,   317,   393,   394,   425,   119,   322,    33,
      34,    35,    36,    37,    38,    39,    40,    10,    42,    43,
      44,    45,    46,   442,    99,   100,   101,   102,   103,   104,
      72,   122,   107,   347,   122,     4,   111,   112,   352,   353,
     354,   355,    55,    56,    57,    58,    59,    60,   120,   120,
     120,     4,     4,   472,    73,   474,    73,   103,   103,    72,
     108,   121,    55,    56,    57,    58,    59,    60,   107,     4,
       4,   460,     4,    99,   100,   101,   102,    14,   104,    72,
      20,   445,   446,    72,    21,    72,   112,   118,   121,   121,
      10,   115,    10,   117,   118,   119,   410,   411,   412,   413,
     414,   415,   416,   417,   418,   419,   420,   421,   422,   423,
     424,    74,   426,   427,   428,   429,   430,   431,   432,   433,
     103,   103,   103,   103,    20,    62,    63,   441,   103,   518,
     121,   121,   521,   447,   120,    10,    99,   100,   101,   102,
     454,   104,   121,    10,   107,   108,   109,   110,   462,   112,
      95,    72,   118,   467,   118,    20,   118,   471,    20,   473,
     118,   107,    99,   100,   101,   102,   103,   104,     4,    20,
     107,   108,   109,   110,   111,   112,     4,   120,   519,   120,
     122,   570,   120,    20,     4,   499,   123,   124,   125,    20,
     121,   121,   120,    10,   120,    12,    13,    14,   107,     4,
       4,     4,   516,   517,    21,    22,    23,   122,     4,     4,
      27,    28,    29,     4,    13,    32,    99,   100,   101,   102,
     103,   104,    67,   537,   107,   352,   173,   110,   212,   112,
     187,   142,   183,   203,   202,   549,   347,   324,   121,   460,
     523,   555,   325,   547,   558,    62,   560,   300,    65,    66,
      67,   394,   260,   238,   179,   129,   348,    -1,    75,    -1,
      -1,    -1,    79,    -1,    81,    99,   100,   101,   102,    -1,
     104,    -1,    -1,   107,   108,   109,   110,   577,   112,    -1,
      -1,    -1,    99,   100,   101,   102,   103,   104,    -1,    -1,
     107,    -1,    41,   110,   111,   112,    -1,    -1,    47,    48,
      -1,    -1,    -1,    -1,   121,    54,    55,    56,    57,    58,
      59,    60,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      69,    70,    71,    99,   100,   101,   102,   103,   104,    -1,
      -1,   107,   108,   109,   110,   111,   112,    99,   100,   101,
     102,   103,   104,   119,    -1,   107,   108,   109,   110,    -1,
     112,    99,   100,   101,   102,   103,   104,   119,    -1,   107,
     108,   109,   110,   111,   112,    -1,    -1,   116,    -1,    -1,
     119,    -1,    -1,    -1,    -1,   124,   125,   126,   127,   128,
     129,   130,   131,    99,   100,   101,   102,    -1,   104,    -1,
      -1,   107,   108,   109,   110,    -1,   112,    99,   100,   101,
     102,    -1,   104,    -1,    -1,   107,   108,   109,   110,    -1,
     112,    99,   100,   101,   102,    -1,   104,    -1,    -1,   107,
     108,   109,   110,    -1,   112,    99,   100,   101,   102,    -1,
     104,    -1,    -1,   107,   108,   109,   110,    -1,   112,    99,
     100,   101,   102,   103,   104,    -1,    -1,   107,    -1,    -1,
     110,    -1,   112,    99,   100,   101,   102,    -1,   104,    -1,
      -1,   107,    99,   100,   101,   102,   112,   104,    -1,    -1,
     107,    -1,    -1,    -1,    -1,   112,    86,    87,    88,    89,
      90,    91,    92,    93,    94
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,     6,     8,     9,    22,    25,    29,    61,    78,
      97,   105,   134,   135,   136,   137,   139,   140,   141,   152,
     155,   157,   171,     7,   138,   107,   108,   119,   156,   158,
     142,    49,    50,    51,    52,    53,   103,   213,   214,   172,
     153,     4,     0,   136,     4,   108,     4,    72,    72,   242,
     243,     4,   103,   107,   110,   111,   237,   238,   213,   103,
     103,    29,    96,   105,   113,   114,   143,   146,   147,   154,
     155,   203,   204,   205,   107,   108,   120,    74,    99,   100,
     101,   102,   104,   107,   108,   109,   110,   112,   233,   241,
     244,   246,   247,   248,   159,   103,   118,   173,   144,     4,
     147,    98,    14,    28,    78,   148,   149,   205,   241,    74,
      72,   132,    86,    87,    88,    89,    90,    91,    92,    93,
      94,   166,   167,   179,   180,   181,   118,   248,   179,   108,
     241,   107,   150,     4,   111,   241,   245,   246,   121,   121,
       4,    72,   165,   248,     4,   103,   111,   239,   240,   241,
      72,   179,   119,   151,   233,   234,   235,   236,   240,   246,
     103,   107,    49,    50,    51,    52,   103,   107,   119,   168,
     169,   160,   181,   174,   118,   104,    96,   242,   119,    72,
     122,   122,   242,    72,   122,     4,   161,   161,   107,   110,
     145,   120,   242,   236,   120,   169,     5,   105,   113,   114,
     162,   170,   200,   201,   202,   170,   120,   163,     4,     4,
      73,   202,   203,   206,    73,   164,   213,    10,    12,    13,
      14,    21,    22,    23,    27,    28,    29,    32,    62,    65,
      66,    67,    75,    79,    81,   103,   107,   110,   111,   121,
     143,   175,   190,   192,   196,   209,   215,   217,   219,   220,
     221,   223,   231,   233,   103,   107,   239,    14,   241,    14,
     241,   241,   233,   103,   103,   210,   107,   211,   212,   101,
     107,   249,   121,   223,   233,   121,   218,     4,   234,   216,
       4,     4,   224,    33,    34,    35,    36,    37,    38,    39,
      40,    42,    43,    44,    45,    46,   115,   117,   118,   119,
     222,   188,    20,   241,    10,    55,    56,    57,    58,    59,
      60,    72,   232,   241,    10,    72,   232,    72,   213,    72,
     213,   213,   118,   197,   198,   121,   176,   107,   229,   230,
     233,   193,   121,   241,   241,   241,   241,   241,   241,   241,
     241,   241,   241,   241,   241,   241,    14,    21,    62,    63,
     107,   110,   111,   123,   124,   125,   223,   233,   241,   242,
     107,   233,   238,    16,    17,    18,    19,    95,   189,   103,
      10,   239,   239,   241,    10,   239,   239,   241,   241,   103,
     207,   208,   233,   103,   103,   241,   107,   199,   226,   241,
     199,   230,   183,    20,    72,   122,   188,   194,   107,   225,
     226,   119,   214,   241,   249,   103,   151,   241,   241,   241,
      41,    47,    48,    54,    55,    56,    57,    58,    59,    60,
      68,    69,    70,    71,   116,   119,   124,   125,   126,   127,
     128,   129,   130,   131,   120,   121,   188,   239,    10,   239,
      10,    72,   119,    95,    72,   118,   118,    20,    72,   122,
     227,   122,   122,    11,    85,   178,   184,   233,   107,   229,
     118,     4,    65,    80,    82,   191,   195,    20,    72,   122,
     242,    72,   119,    72,   119,   241,   241,   241,   241,   241,
     241,   241,   241,   241,   241,   241,   241,   241,   241,   241,
     242,   241,   241,   241,   241,   241,   241,   241,   241,   118,
     107,   239,   239,   241,   242,   208,   248,   248,   241,   107,
     226,    15,    19,   228,   226,   241,    77,    83,    84,   182,
       4,    20,   221,   241,     4,   241,   107,   226,   120,   241,
     242,   241,   242,   120,   241,   122,   120,    20,   121,     4,
     241,   241,   107,   233,   177,   205,   233,   121,   227,    20,
     120,   120,   241,   107,     4,    72,     4,     4,    72,     4,
      72,   185,     4,   225,   241,   122,   241,   241,   241,    27,
      64,    76,   186,   122,     4,     4,     4,   187,   233,     4,
     213,   188,   208
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
      yyerror (interp, YY_("syntax error: cannot back up")); \
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
# define YYLEX yylex (&yylval)
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
		  Type, Value, interp); \
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
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, Interp *interp)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, interp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    Interp *interp;
#endif
{
  if (!yyvaluep)
    return;
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
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, Interp *interp)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, interp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    Interp *interp;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep, interp);
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
yy_reduce_print (YYSTYPE *yyvsp, int yyrule, Interp *interp)
#else
static void
yy_reduce_print (yyvsp, yyrule, interp)
    YYSTYPE *yyvsp;
    int yyrule;
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
		       		       , interp);
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule, interp); \
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
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, Interp *interp)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, interp)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    Interp *interp;
#endif
{
  YYUSE (yyvaluep);
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
int yyparse (Interp *interp);
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
yyparse (Interp *interp)
#else
int
yyparse (interp)
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
#line 472 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 5:
#line 481 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 6:
#line 482 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 7:
#line 483 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 8:
#line 484 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 485 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 486 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 487 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 12:
#line 488 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 13:
#line 489 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 14:
#line 492 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 15:
#line 493 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 16:
#line 497 "compilers/imcc/imcc.y"
    { if ((yyvsp[(2) - (2)].s))
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 17:
#line 505 "compilers/imcc/imcc.y"
    {
            STRING *hll_name, *hll_lib;
            hll_name = string_unescape_cstring(interp, (yyvsp[(2) - (4)].s) + 1, '"', NULL);
            hll_lib =  string_unescape_cstring(interp, (yyvsp[(4) - (4)].s) + 1, '"', NULL);
            CONTEXT(((Interp*)interp)->ctx)->current_HLL = 
                Parrot_register_HLL(interp, hll_name, hll_lib);
            (yyval.t) = 0;
         }
    break;

  case 18:
#line 514 "compilers/imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                CONTEXT(((Interp*)interp)->ctx)->current_HLL, atoi((yyvsp[(2) - (4)].s)), atoi((yyvsp[(4) - (4)].s)));
             (yyval.t) = 0;
         }
    break;

  case 19:
#line 523 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 20:
#line 529 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 21:
#line 537 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 22:
#line 538 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1);is_def=0; }
    break;

  case 23:
#line 542 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 24:
#line 543 "compilers/imcc/imcc.y"
    { (yyval.i) = mk_pmc_const(interp, cur_unit, (yyvsp[(3) - (6)].s), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].s));is_def=0; }
    break;

  case 29:
#line 556 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 30:
#line 557 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 31:
#line 558 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 32:
#line 559 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 33:
#line 560 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(1) - (1)].i); }
    break;

  case 35:
#line 564 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 36:
#line 566 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, cur_unit, (yyvsp[(2) - (3)].s),0,regs,nargs,keyvec,1);
                     free((yyvsp[(2) - (3)].s)); }
    break;

  case 37:
#line 569 "compilers/imcc/imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                    }
    break;

  case 38:
#line 574 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, (yyvsp[(4) - (4)].s)));
                     cur_call->pcc_sub->pragma = (yyvsp[(3) - (4)].t);
                   }
    break;

  case 39:
#line 580 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[(2) - (2)].sr)); }
    break;

  case 40:
#line 582 "compilers/imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, (yyvsp[(4) - (4)].s));
                       set_lexical(interp, r, (yyvsp[(2) - (4)].s)); (yyval.i) = 0;
                   }
    break;

  case 41:
#line 586 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 43:
#line 594 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 44:
#line 596 "compilers/imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     (yyval.i)=0; }
    break;

  case 47:
#line 611 "compilers/imcc/imcc.y"
    {
                    int re_open = 0;
                    (yyval.i) = 0;
                    if (IMCC_INFO(interp)->state->pasm_file && cur_namespace) {
                        imc_close_unit(interp, cur_unit);
                        re_open = 1;
                    }
                    IMCC_INFO(interp)->cur_namespace = (yyvsp[(2) - (3)].sr);
                    cur_namespace = (yyvsp[(2) - (3)].sr);
                    if (re_open)
                        cur_unit = imc_open_unit(interp, IMC_PASM);
                }
    break;

  case 48:
#line 626 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); }
    break;

  case 49:
#line 627 "compilers/imcc/imcc.y"
    { (yyval.sr) = NULL; }
    break;

  case 50:
#line 632 "compilers/imcc/imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 51:
#line 636 "compilers/imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, (yyvsp[(3) - (3)].sr));
        }
    break;

  case 52:
#line 639 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = (yyvsp[(5) - (6)].t); }
    break;

  case 53:
#line 641 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; }
    break;

  case 54:
#line 645 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 55:
#line 646 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 56:
#line 647 "compilers/imcc/imcc.y"
    { 
         if (adv_named_id) {
             add_pcc_named_param(interp,cur_call,adv_named_id,(yyvsp[(2) - (3)].sr));
             adv_named_id = NULL;
         } else add_pcc_param(cur_call, (yyvsp[(2) - (3)].sr));
   }
    break;

  case 57:
#line 656 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 58:
#line 656 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(3) - (3)].sr); is_def=0; }
    break;

  case 59:
#line 660 "compilers/imcc/imcc.y"
    { if ((yyvsp[(3) - (3)].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[(2) - (3)].s), (yyvsp[(1) - (3)].t));
                                         (yyval.sr)->type |= (yyvsp[(3) - (3)].t); }
    break;

  case 60:
#line 665 "compilers/imcc/imcc.y"
    { 
                                         if ((yyvsp[(5) - (5)].t) & VT_UNIQUE_REG)
                                             (yyval.sr) = mk_ident_ur(interp, (yyvsp[(4) - (5)].s), (yyvsp[(1) - (5)].t));
                                         else
                                             (yyval.sr) = mk_ident(interp, (yyvsp[(4) - (5)].s), (yyvsp[(1) - (5)].t));
                                         (yyval.sr)->type |= (yyvsp[(5) - (5)].t);
                                         adv_named_set(interp,(yyvsp[(2) - (5)].s));}
    break;

  case 61:
#line 675 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  }
    break;

  case 63:
#line 680 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 64:
#line 684 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; cur_unit->outer =
                     mk_sub_address_fromc(interp, (yyvsp[(3) - (4)].s)); }
    break;

  case 65:
#line 687 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; cur_unit->outer =
                     mk_const(interp, (yyvsp[(3) - (4)].s), 'S'); }
    break;

  case 66:
#line 692 "compilers/imcc/imcc.y"
    { add_pcc_multi(cur_call, NULL); }
    break;

  case 67:
#line 693 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; add_pcc_multi(cur_call, (yyvsp[(3) - (3)].sr)); }
    break;

  case 68:
#line 694 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  add_pcc_multi(cur_call, (yyvsp[(1) - (1)].sr));}
    break;

  case 69:
#line 698 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 70:
#line 699 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 71:
#line 700 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 72:
#line 701 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 73:
#line 702 "compilers/imcc/imcc.y"
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

  case 74:
#line 712 "compilers/imcc/imcc.y"
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

  case 75:
#line 722 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(2) - (3)].sr); }
    break;

  case 78:
#line 731 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 79:
#line 733 "compilers/imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, (yyvsp[(3) - (3)].s)));

         }
    break;

  case 80:
#line 737 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = (yyvsp[(5) - (6)].t); }
    break;

  case 81:
#line 739 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; }
    break;

  case 82:
#line 744 "compilers/imcc/imcc.y"
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
            i = iLABEL(cur_unit, r);
            cur_call = r;
            i->type = ITPCCSUB;
            /*
             * if we are inside a pcc_sub mark the sub as doing a
             * sub call; the sub is in r[0] of the first ins
             */
            r1 = cur_unit->instructions->r[0];
            if (r1 && r1->pcc_sub)
                r1->pcc_sub->calls_a_sub |= 1;
         }
    break;

  case 83:
#line 771 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; }
    break;

  case 84:
#line 775 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 85:
#line 776 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 86:
#line 780 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; }
    break;

  case 87:
#line 782 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->object = (yyvsp[(2) - (3)].sr); }
    break;

  case 88:
#line 786 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 90:
#line 791 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (1)].t); }
    break;

  case 91:
#line 792 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[(1) - (3)].t) | (yyvsp[(3) - (3)].t); }
    break;

  case 92:
#line 796 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_LOAD; }
    break;

  case 93:
#line 797 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_MAIN; }
    break;

  case 94:
#line 798 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_IMMEDIATE; }
    break;

  case 95:
#line 799 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_POSTCOMP; }
    break;

  case 96:
#line 800 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_ANON; }
    break;

  case 97:
#line 801 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_METHOD; }
    break;

  case 98:
#line 802 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_NEED_LEX; }
    break;

  case 101:
#line 809 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, (yyvsp[(2) - (5)].sr));
            add_pcc_cc(cur_call, (yyvsp[(4) - (5)].sr));
         }
    break;

  case 102:
#line 814 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 103:
#line 816 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, (yyvsp[(2) - (3)].sr));
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 104:
#line 821 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 105:
#line 823 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, (yyvsp[(2) - (3)].s),'S')); }
    break;

  case 106:
#line 825 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[(2) - (5)].sr));
            add_pcc_cc(cur_call, (yyvsp[(4) - (5)].sr));
         }
    break;

  case 107:
#line 829 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, (yyvsp[(2) - (5)].s),'S'));
            add_pcc_cc(cur_call, (yyvsp[(4) - (5)].sr));
         }
    break;

  case 108:
#line 836 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 109:
#line 837 "compilers/imcc/imcc.y"
    {  add_pcc_arg(cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 110:
#line 841 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (2)].sr); }
    break;

  case 111:
#line 846 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 112:
#line 847 "compilers/imcc/imcc.y"
    {  if((yyvsp[(2) - (3)].sr)) add_pcc_result(cur_call, (yyvsp[(2) - (3)].sr)); }
    break;

  case 113:
#line 851 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); }
    break;

  case 114:
#line 852 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 115:
#line 853 "compilers/imcc/imcc.y"
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

  case 116:
#line 865 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 117:
#line 866 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); }
    break;

  case 118:
#line 870 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_FLAT;   }
    break;

  case 119:
#line 871 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPTIONAL; }
    break;

  case 120:
#line 872 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPT_FLAG; }
    break;

  case 121:
#line 873 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_NAMED; }
    break;

  case 122:
#line 874 "compilers/imcc/imcc.y"
    {  adv_named_set(interp,(yyvsp[(3) - (4)].s)); (yyval.t) = 0; }
    break;

  case 123:
#line 875 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_UNIQUE_REG; }
    break;

  case 124:
#line 880 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 125:
#line 881 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; }
    break;

  case 128:
#line 891 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, (yyvsp[(1) - (2)].t)); }
    break;

  case 129:
#line 894 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 130:
#line 895 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.i) = 0;  }
    break;

  case 131:
#line 901 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 132:
#line 902 "compilers/imcc/imcc.y"
    {
       if((yyvsp[(1) - (2)].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (2)].sr)); 
   }
    break;

  case 133:
#line 905 "compilers/imcc/imcc.y"
    {
       if((yyvsp[(2) - (3)].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(2) - (3)].sr)); 
   }
    break;

  case 134:
#line 911 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(2) - (3)].sr); (yyval.sr)->type |= (yyvsp[(3) - (3)].t); }
    break;

  case 135:
#line 916 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 136:
#line 921 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 137:
#line 923 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 138:
#line 928 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 139:
#line 932 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 140:
#line 933 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id, (yyvsp[(1) - (1)].sr));
          adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(1) - (1)].sr)); }
    break;

  case 141:
#line 939 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[(1) - (3)].s),(yyvsp[(3) - (3)].sr));}
    break;

  case 142:
#line 941 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id,(yyvsp[(3) - (3)].sr));
           adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[(3) - (3)].sr));    }
    break;

  case 143:
#line 947 "compilers/imcc/imcc.y"
    {  
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[(3) - (5)].s),(yyvsp[(5) - (5)].sr));}
    break;

  case 146:
#line 966 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 147:
#line 971 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[(2) - (2)].i); }
    break;

  case 148:
#line 972 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 149:
#line 973 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 150:
#line 974 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 151:
#line 978 "compilers/imcc/imcc.y"
    {  (yyval.i) = NULL; }
    break;

  case 155:
#line 988 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iLABEL(cur_unit, mk_local_label(interp, (yyvsp[(1) - (1)].s)));
                   }
    break;

  case 156:
#line 995 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[(2) - (3)].i); }
    break;

  case 157:
#line 1000 "compilers/imcc/imcc.y"
    {
         IdList* l = (yyvsp[(1) - (1)].idlist);
         l->next = NULL;
         (yyval.idlist) = l;
     }
    break;

  case 158:
#line 1007 "compilers/imcc/imcc.y"
    {  
         IdList* l = (yyvsp[(3) - (3)].idlist);
         l->next = (yyvsp[(1) - (3)].idlist);
         (yyval.idlist) = l;
     }
    break;

  case 159:
#line 1016 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = (yyvsp[(1) - (2)].s);
         l->unique_reg = 1;
         (yyval.idlist) = l;
     }
    break;

  case 160:
#line 1024 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = (yyvsp[(1) - (1)].s);
         l->unique_reg = 0;
         (yyval.idlist) = l;
     }
    break;

  case 163:
#line 1035 "compilers/imcc/imcc.y"
    { push_namespace((yyvsp[(2) - (2)].s)); }
    break;

  case 164:
#line 1036 "compilers/imcc/imcc.y"
    { pop_namespace((yyvsp[(2) - (2)].s)); }
    break;

  case 165:
#line 1037 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 166:
#line 1038 "compilers/imcc/imcc.y"
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

  case 167:
#line 1053 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, (yyvsp[(4) - (4)].sr), (yyvsp[(2) - (4)].s)); (yyval.i) = 0;
                    }
    break;

  case 168:
#line 1056 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 169:
#line 1057 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 0);is_def=0; }
    break;

  case 171:
#line 1059 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 172:
#line 1060 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[(4) - (6)].s), (yyvsp[(3) - (6)].t), (yyvsp[(6) - (6)].sr), 1);is_def=0; }
    break;

  case 173:
#line 1061 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 174:
#line 1065 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "branch",1, (yyvsp[(2) - (2)].sr)); }
    break;

  case 175:
#line 1067 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, cur_unit, (yyvsp[(1) - (2)].s), 0, regs, nargs, keyvec, 1);
                                          free((yyvsp[(1) - (2)].s)); }
    break;

  case 176:
#line 1070 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[(2) - (2)].sr)); }
    break;

  case 177:
#line 1071 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; cur_call = NULL; }
    break;

  case 178:
#line 1072 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 180:
#line 1074 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 181:
#line 1078 "compilers/imcc/imcc.y"
    { (yyval.t) = 'I'; }
    break;

  case 182:
#line 1079 "compilers/imcc/imcc.y"
    { (yyval.t) = 'N'; }
    break;

  case 183:
#line 1080 "compilers/imcc/imcc.y"
    { (yyval.t) = 'S'; }
    break;

  case 184:
#line 1081 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 185:
#line 1082 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 186:
#line 1083 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; free((yyvsp[(1) - (1)].s)); }
    break;

  case 187:
#line 1088 "compilers/imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, (yyvsp[(1) - (1)].s), 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", (yyvsp[(1) - (1)].s));
            }
         }
    break;

  case 188:
#line 1098 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "set", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 189:
#line 1099 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "not", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));}
    break;

  case 190:
#line 1100 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "neg", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));}
    break;

  case 191:
#line 1101 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bnot", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr));}
    break;

  case 192:
#line 1102 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "add", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 193:
#line 1103 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "sub", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 194:
#line 1104 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mul", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 195:
#line 1105 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "pow", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 196:
#line 1106 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "div", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 197:
#line 1107 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "fdiv", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 198:
#line 1108 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mod", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr));  }
    break;

  case 199:
#line 1109 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "concat", 3, (yyvsp[(1) - (5)].sr),(yyvsp[(3) - (5)].sr),(yyvsp[(5) - (5)].sr)); }
    break;

  case 200:
#line 1110 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "iseq", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 201:
#line 1111 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isne", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 202:
#line 1112 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isgt", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 203:
#line 1113 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "islt", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 204:
#line 1114 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isle", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 205:
#line 1115 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isge", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 206:
#line 1117 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shl", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 207:
#line 1119 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shr", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 208:
#line 1121 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "lsr", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 209:
#line 1123 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "and", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 210:
#line 1125 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "or", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 211:
#line 1127 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "xor", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 212:
#line 1129 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "band", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 213:
#line 1131 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bor", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 214:
#line 1133 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bxor", 3, (yyvsp[(1) - (5)].sr), (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 215:
#line 1135 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(5) - (6)].sr)); }
    break;

  case 216:
#line 1137 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(3) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 217:
#line 1139 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].s), (yyvsp[(6) - (6)].sr), 1); }
    break;

  case 218:
#line 1141 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].s), (yyvsp[(6) - (7)].sr), 1); }
    break;

  case 219:
#line 1143 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].s), NULL, 1); }
    break;

  case 220:
#line 1145 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[(1) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 221:
#line 1147 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[(1) - (6)].sr), (yyvsp[(5) - (6)].sr)); }
    break;

  case 222:
#line 1149 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[(1) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 223:
#line 1151 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[(1) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); }
    break;

  case 224:
#line 1153 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "set_addr",
                            2, (yyvsp[(1) - (4)].sr), mk_label_address(interp, (yyvsp[(4) - (4)].s))); }
    break;

  case 225:
#line 1156 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "find_global",2,(yyvsp[(1) - (4)].sr),(yyvsp[(4) - (4)].sr));}
    break;

  case 226:
#line 1158 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "store_global",2, (yyvsp[(2) - (4)].sr),(yyvsp[(4) - (4)].sr)); }
    break;

  case 227:
#line 1162 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 228:
#line 1164 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 229:
#line 1166 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[(2) - (7)].sr), (yyvsp[(4) - (7)].sr), (yyvsp[(6) - (7)].sr)); }
    break;

  case 230:
#line 1169 "compilers/imcc/imcc.y"
    {
            add_pcc_result((yyvsp[(3) - (3)].i)->r[0], (yyvsp[(1) - (3)].sr));
            cur_call = NULL;
            (yyval.i) = 0;
         }
    break;

  case 231:
#line 1175 "compilers/imcc/imcc.y"
    {
            (yyval.i) = IMCC_create_itcall_label(interp);
         }
    break;

  case 232:
#line 1179 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[(6) - (9)].sr));
           cur_call = NULL;
         }
    break;

  case 236:
#line 1187 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[(1) - (3)].sr)); }
    break;

  case 237:
#line 1190 "compilers/imcc/imcc.y"
    { (yyval.i) = IMCC_create_itcall_label(interp);
                           (yyval.i)->type &= ~ITCALL; (yyval.i)->type |= ITRESULT; }
    break;

  case 238:
#line 1192 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 239:
#line 1197 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "add", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 240:
#line 1199 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "sub", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 241:
#line 1201 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mul", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 242:
#line 1203 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "div", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 243:
#line 1205 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mod", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 244:
#line 1207 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "fdiv", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 245:
#line 1209 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "concat", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 246:
#line 1211 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "band", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 247:
#line 1213 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bor", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 248:
#line 1215 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bxor", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 249:
#line 1217 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shr", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 250:
#line 1219 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shl", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 251:
#line 1221 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "lsr", 2, (yyvsp[(1) - (3)].sr), (yyvsp[(3) - (3)].sr)); }
    break;

  case 252:
#line 1226 "compilers/imcc/imcc.y"
    { (yyval.i) = func_ins(interp, cur_unit, (yyvsp[(1) - (4)].sr), (yyvsp[(3) - (4)].s),
                                   regs,nargs,keyvec,1);
                     free((yyvsp[(3) - (4)].s));
                   }
    break;

  case 253:
#line 1232 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 254:
#line 1233 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 255:
#line 1234 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 256:
#line 1235 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (1)].sr);
                       if ((yyvsp[(1) - (1)].sr)->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 257:
#line 1240 "compilers/imcc/imcc.y"
    { cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); }
    break;

  case 258:
#line 1241 "compilers/imcc/imcc.y"
    { cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = mk_const(interp, (yyvsp[(3) - (3)].s), 'S'); }
    break;

  case 259:
#line 1242 "compilers/imcc/imcc.y"
    { cur_obj = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); }
    break;

  case 260:
#line 1245 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 261:
#line 1246 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 262:
#line 1251 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[(1) - (1)].sr));
        }
    break;

  case 263:
#line 1256 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[(2) - (5)].i); }
    break;

  case 264:
#line 1260 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 265:
#line 1261 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call, adv_named_id, (yyvsp[(3) - (3)].sr));
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, (yyvsp[(3) - (3)].sr)); 
   }
    break;

  case 266:
#line 1267 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call,adv_named_id,(yyvsp[(1) - (1)].sr));
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, (yyvsp[(1) - (1)].sr));
   }
    break;

  case 267:
#line 1273 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0;
                                     add_pcc_named_arg(interp,cur_call,(yyvsp[(3) - (5)].s),(yyvsp[(5) - (5)].sr));}
    break;

  case 268:
#line 1275 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_named_arg(interp,cur_call,(yyvsp[(1) - (3)].s),(yyvsp[(3) - (3)].sr));}
    break;

  case 269:
#line 1279 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); }
    break;

  case 270:
#line 1283 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 271:
#line 1284 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[(1) - (2)].t) | (yyvsp[(2) - (2)].t); }
    break;

  case 272:
#line 1288 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT; }
    break;

  case 273:
#line 1289 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_NAMED; }
    break;

  case 274:
#line 1290 "compilers/imcc/imcc.y"
    { adv_named_set(interp,(yyvsp[(3) - (4)].s)); (yyval.t) = 0; }
    break;

  case 275:
#line 1293 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[(1) - (2)].sr); (yyval.sr)->type |= (yyvsp[(2) - (2)].t); }
    break;

  case 276:
#line 1297 "compilers/imcc/imcc.y"
    { 
         (yyval.sr) = 0;
         if (adv_named_id) {
             add_pcc_named_result(interp,cur_call,adv_named_id,(yyvsp[(3) - (3)].sr));
             adv_named_id = NULL;
         } else add_pcc_result(cur_call, (yyvsp[(3) - (3)].sr)); }
    break;

  case 277:
#line 1303 "compilers/imcc/imcc.y"
    { 
        add_pcc_named_result(interp,cur_call,(yyvsp[(3) - (5)].s),(yyvsp[(5) - (5)].sr)); }
    break;

  case 278:
#line 1305 "compilers/imcc/imcc.y"
    { 
       (yyval.sr) = 0;
       if (adv_named_id) {
           add_pcc_named_result(interp,cur_call,adv_named_id,(yyvsp[(1) - (1)].sr));
           adv_named_id = NULL;
       } else add_pcc_result(cur_call, (yyvsp[(1) - (1)].sr)); }
    break;

  case 279:
#line 1311 "compilers/imcc/imcc.y"
    { add_pcc_named_result(interp,cur_call,(yyvsp[(1) - (3)].s),(yyvsp[(3) - (3)].sr)); }
    break;

  case 280:
#line 1312 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 281:
#line 1317 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, (yyvsp[(3) - (6)].s), 3, (yyvsp[(2) - (6)].sr), (yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 282:
#line 1319 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, inv_op((yyvsp[(3) - (6)].s)), 3, (yyvsp[(2) - (6)].sr),(yyvsp[(4) - (6)].sr), (yyvsp[(6) - (6)].sr)); }
    break;

  case 283:
#line 1321 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 284:
#line 1323 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless_null", 2, (yyvsp[(3) - (5)].sr), (yyvsp[(5) - (5)].sr)); }
    break;

  case 285:
#line 1325 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 286:
#line 1327 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless",2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 287:
#line 1329 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 288:
#line 1331 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless", 2, (yyvsp[(2) - (4)].sr), (yyvsp[(4) - (4)].sr)); }
    break;

  case 289:
#line 1335 "compilers/imcc/imcc.y"
    {  (yyval.s) = "eq"; }
    break;

  case 290:
#line 1336 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ne"; }
    break;

  case 291:
#line 1337 "compilers/imcc/imcc.y"
    {  (yyval.s) = "gt"; }
    break;

  case 292:
#line 1338 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ge"; }
    break;

  case 293:
#line 1339 "compilers/imcc/imcc.y"
    {  (yyval.s) = "lt"; }
    break;

  case 294:
#line 1340 "compilers/imcc/imcc.y"
    {  (yyval.s) = "le"; }
    break;

  case 297:
#line 1349 "compilers/imcc/imcc.y"
    {  (yyval.sr) = NULL; }
    break;

  case 298:
#line 1350 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[(1) - (1)].sr); }
    break;

  case 299:
#line 1354 "compilers/imcc/imcc.y"
    { (yyval.sr) = regs[0]; }
    break;

  case 301:
#line 1359 "compilers/imcc/imcc.y"
    {  regs[nargs++] = (yyvsp[(1) - (1)].sr); }
    break;

  case 302:
#line 1361 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = (yyvsp[(1) - (4)].sr);
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = (yyvsp[(3) - (4)].sr); (yyval.sr) = (yyvsp[(1) - (4)].sr);
                   }
    break;

  case 303:
#line 1367 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = (yyvsp[(2) - (3)].sr);
                      (yyval.sr) = (yyvsp[(2) - (3)].sr);
                   }
    break;

  case 305:
#line 1374 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 306:
#line 1375 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_u(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 307:
#line 1379 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 308:
#line 1380 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 309:
#line 1384 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 310:
#line 1385 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 315:
#line 1398 "compilers/imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 316:
#line 1399 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp, nkeys, keys); }
    break;

  case 317:
#line 1403 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[(1) - (1)].sr); }
    break;

  case 318:
#line 1405 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[(3) - (3)].sr); (yyval.sr) =  keys[0]; }
    break;

  case 319:
#line 1406 "compilers/imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 320:
#line 1407 "compilers/imcc/imcc.y"
    { keys[nkeys++] = (yyvsp[(4) - (4)].sr); (yyval.sr) =  keys[0]; }
    break;

  case 321:
#line 1411 "compilers/imcc/imcc.y"
    { if (in_slice) {
                         (yyvsp[(1) - (1)].sr)->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     (yyval.sr) = (yyvsp[(1) - (1)].sr);
                   }
    break;

  case 322:
#line 1417 "compilers/imcc/imcc.y"
    { (yyvsp[(1) - (3)].sr)->type |= VT_START_SLICE;  (yyvsp[(3) - (3)].sr)->type |= VT_END_SLICE;
                     keys[nkeys++] = (yyvsp[(1) - (3)].sr); (yyval.sr) = (yyvsp[(3) - (3)].sr); }
    break;

  case 323:
#line 1419 "compilers/imcc/imcc.y"
    { (yyvsp[(2) - (2)].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[(2) - (2)].sr); }
    break;

  case 324:
#line 1420 "compilers/imcc/imcc.y"
    { (yyvsp[(1) - (2)].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[(1) - (2)].sr); }
    break;

  case 325:
#line 1424 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'I'); }
    break;

  case 326:
#line 1425 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'N'); }
    break;

  case 327:
#line 1426 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); }
    break;

  case 328:
#line 1427 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'P'); }
    break;

  case 329:
#line 1428 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_pasm_reg(interp, (yyvsp[(1) - (1)].s)); }
    break;

  case 330:
#line 1432 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'I'); }
    break;

  case 331:
#line 1433 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'N'); }
    break;

  case 332:
#line 1434 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S'); }
    break;

  case 333:
#line 1435 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'U'); }
    break;

  case 334:
#line 1439 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[(1) - (1)].s), 'S'); }
    break;

  case 335:
#line 1440 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[(1) - (1)].s), 'S'); }
    break;


/* Line 1267 of yacc.c.  */
#line 4307 "compilers/imcc/imcparser.c"
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
      yyerror (interp, YY_("syntax error"));
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
	    yyerror (interp, yymsg);
	  }
	else
	  {
	    yyerror (interp, YY_("syntax error"));
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
		      yytoken, &yylval, interp);
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
		  yystos[yystate], yyvsp, interp);
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
  yyerror (interp, YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval, interp);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp, interp);
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


#line 1445 "compilers/imcc/imcc.y"



int yyerror(Interp *interp, char * s)
{
    /* support bison 1.75, convert 'parse error to syntax error' */
    if (!memcmp(s, "parse", 5))
        IMCC_fataly(interp, E_SyntaxError, "syntax%s", s+5);
    else
        IMCC_fataly(interp, E_SyntaxError, s);
    /* fprintf(stderr, "last token = [%s]\n", yylval.s); */
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

