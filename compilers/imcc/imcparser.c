/* A Bison parser, made by GNU Bison 1.875.  */

/* Skeleton parser for Yacc-like parsing with Bison,
   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002 Free Software Foundation, Inc.

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
   Foundation, Inc., 59 Temple Place - Suite 330,
   Boston, MA 02111-1307, USA.  */

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
    int len;

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
    /* strip delimiters */
    len = strlen(constant);
    name = mem_sys_allocate(len);
    constant[len - 1] = '\0';
    strcpy(name, constant + 1);
    free(constant);
    switch (type_enum) {
        case enum_class_Sub:
        case enum_class_Coroutine:
            rhs = mk_const(interp, name, 'p');
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
    r->type = VT_PCC_SUB;
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
    if(!ins || !ins->r[0] || ins->r[0]->type != VT_PCC_SUB)
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

#if ! defined (YYSTYPE) && ! defined (YYSTYPE_IS_DECLARED)
#line 374 "compilers/imcc/imcc.y"
typedef union YYSTYPE {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} YYSTYPE;
/* Line 191 of yacc.c.  */
#line 688 "compilers/imcc/imcparser.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 214 of yacc.c.  */
#line 700 "compilers/imcc/imcparser.c"

#if ! defined (yyoverflow) || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# if YYSTACK_USE_ALLOCA
#  define YYSTACK_ALLOC alloca
# else
#  ifndef YYSTACK_USE_ALLOCA
#   if defined (alloca) || defined (_ALLOCA_H)
#    define YYSTACK_ALLOC alloca
#   else
#    ifdef __GNUC__
#     define YYSTACK_ALLOC __builtin_alloca
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning. */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
# else
#  if defined (__STDC__) || defined (__cplusplus)
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   define YYSIZE_T size_t
#  endif
#  define YYSTACK_ALLOC malloc
#  define YYSTACK_FREE free
# endif
#endif /* ! defined (yyoverflow) || YYERROR_VERBOSE */


#if (! defined (yyoverflow) \
     && (! defined (__cplusplus) \
	 || (YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  short yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short) + sizeof (YYSTYPE))				\
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  register YYSIZE_T yyi;		\
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
   typedef short yysigned_char;
#endif

/* YYFINAL -- State number of the termination state. */
#define YYFINAL  41
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   759

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  133
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  115
/* YYNRULES -- Number of rules. */
#define YYNRULES  331
/* YYNRULES -- Number of states. */
#define YYNSTATES  579

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   371

#define YYTRANSLATE(YYX) 						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
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
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    25,    27,    29,    33,    36,    39,    44,    49,
      53,    59,    60,    67,    68,    75,    77,    80,    84,    87,
      89,    91,    93,    95,    96,   100,   101,   106,   109,   114,
     115,   117,   118,   123,   124,   126,   131,   132,   133,   134,
     145,   146,   148,   152,   153,   157,   161,   167,   168,   170,
     175,   180,   185,   186,   190,   192,   194,   196,   198,   200,
     202,   204,   208,   209,   211,   212,   213,   214,   225,   226,
     236,   237,   240,   241,   245,   246,   248,   250,   254,   256,
     258,   260,   262,   264,   266,   268,   270,   272,   278,   282,
     286,   290,   294,   300,   306,   307,   311,   314,   315,   319,
     323,   324,   329,   330,   333,   335,   337,   339,   341,   346,
     348,   350,   352,   354,   356,   357,   363,   365,   366,   369,
     373,   377,   378,   384,   385,   391,   392,   394,   398,   402,
     408,   410,   413,   414,   417,   420,   422,   424,   425,   427,
     430,   432,   434,   438,   440,   444,   447,   449,   451,   453,
     456,   459,   460,   465,   470,   471,   478,   480,   481,   488,
     491,   494,   497,   500,   502,   504,   506,   507,   509,   511,
     513,   515,   517,   519,   521,   525,   530,   535,   540,   546,
     552,   558,   564,   570,   576,   582,   588,   594,   600,   606,
     612,   618,   624,   630,   636,   642,   648,   654,   660,   666,
     672,   678,   685,   692,   699,   707,   712,   717,   724,   731,
     739,   744,   749,   754,   759,   766,   774,   778,   779,   789,
     791,   793,   795,   799,   800,   806,   810,   814,   818,   822,
     826,   830,   834,   838,   842,   846,   850,   854,   858,   863,
     865,   867,   869,   871,   875,   879,   883,   885,   887,   888,
     894,   895,   899,   901,   907,   911,   914,   915,   918,   920,
     922,   927,   930,   934,   940,   942,   946,   947,   954,   961,
     967,   973,   978,   983,   988,   993,   995,   997,   999,  1001,
    1003,  1005,  1007,  1009,  1010,  1012,  1016,  1018,  1020,  1025,
    1029,  1031,  1033,  1035,  1037,  1039,  1041,  1043,  1045,  1047,
    1049,  1051,  1052,  1055,  1057,  1061,  1062,  1067,  1069,  1073,
    1076,  1079,  1081,  1083,  1085,  1087,  1089,  1091,  1093,  1095,
    1097,  1099
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     134,     0,    -1,   135,    -1,   136,    -1,   135,   136,    -1,
     154,    -1,   141,    -1,   140,    -1,   155,    -1,   169,    -1,
     151,    -1,   105,     4,    -1,   137,    -1,     4,    -1,     6,
     138,     4,    -1,   139,     4,    -1,     7,   108,    -1,     8,
     107,    72,   107,    -1,     9,   108,    72,   108,    -1,    61,
     211,   103,    -1,    61,   211,   103,   118,   246,    -1,    -1,
      29,   142,   211,   103,   118,   246,    -1,    -1,    29,   144,
     108,   238,   118,   107,    -1,   146,    -1,   145,   146,    -1,
     201,   147,     4,    -1,   105,     4,    -1,   114,    -1,   113,
      -1,   154,    -1,   143,    -1,    -1,   148,   111,   150,    -1,
      -1,    78,   149,   177,    96,    -1,    14,   239,    -1,    28,
     107,    72,   104,    -1,    -1,   232,    -1,    -1,    97,   152,
     153,    98,    -1,    -1,   145,    -1,    22,   119,   240,   120,
      -1,    -1,    -1,    -1,    25,   156,   235,   157,   177,     4,
     158,   159,   168,    73,    -1,    -1,     4,    -1,   159,   160,
       4,    -1,    -1,     5,   161,   162,    -1,   211,   103,   186,
      -1,   211,   107,    20,   103,   186,    -1,    -1,    72,    -1,
      94,   121,   166,   122,    -1,    92,   121,   107,   122,    -1,
      92,   121,   103,   122,    -1,    -1,   166,    72,   167,    -1,
     167,    -1,    49,    -1,    50,    -1,    52,    -1,    51,    -1,
     103,    -1,   107,    -1,   119,   240,   120,    -1,    -1,   198,
      -1,    -1,    -1,    -1,    78,   170,   103,   171,   177,     4,
     172,   159,   168,    73,    -1,    -1,    75,     4,   174,   181,
     176,   180,   175,   183,    76,    -1,    -1,   203,     4,    -1,
      -1,    85,   239,     4,    -1,    -1,   178,    -1,   179,    -1,
     178,   163,   179,    -1,    87,    -1,    86,    -1,    88,    -1,
      89,    -1,    91,    -1,    90,    -1,    93,    -1,   164,    -1,
     165,    -1,    77,   239,    72,   239,     4,    -1,    77,   239,
       4,    -1,    83,   239,     4,    -1,    84,   231,     4,    -1,
      84,   107,     4,    -1,    84,   231,    72,   239,     4,    -1,
      84,   107,    72,   239,     4,    -1,    -1,   181,   182,     4,
      -1,    11,   224,    -1,    -1,   183,   184,     4,    -1,    64,
     231,   186,    -1,    -1,    27,   185,   211,   206,    -1,    -1,
     186,   187,    -1,    16,    -1,    17,    -1,    18,    -1,    19,
      -1,    19,   121,   107,   122,    -1,    95,    -1,    79,    -1,
      81,    -1,    80,    -1,    82,    -1,    -1,   188,     4,   191,
     192,   189,    -1,   194,    -1,    -1,   192,     4,    -1,   192,
     193,     4,    -1,    65,   239,   225,    -1,    -1,    65,   121,
     195,   197,   122,    -1,    -1,    66,   121,   196,   197,   122,
      -1,    -1,   224,    -1,   107,    20,   239,    -1,   197,    72,
     224,    -1,   197,    72,   107,    20,   239,    -1,   200,    -1,
     198,   200,    -1,    -1,   199,   204,    -1,   105,     4,    -1,
     114,    -1,   113,    -1,    -1,   202,    -1,   202,   203,    -1,
     203,    -1,    96,    -1,   201,   207,     4,    -1,   206,    -1,
     205,    72,   206,    -1,   103,    95,    -1,   103,    -1,   213,
      -1,   229,    -1,    22,   103,    -1,    23,   103,    -1,    -1,
      27,   208,   211,   205,    -1,    28,   107,    72,   231,    -1,
      -1,    29,   209,   211,   103,   118,   246,    -1,   143,    -1,
      -1,    32,   210,   211,   103,   118,   246,    -1,    65,   221,
      -1,    10,   237,    -1,   111,   232,    -1,    14,   239,    -1,
     221,    -1,   173,    -1,   190,    -1,    -1,    49,    -1,    50,
      -1,    51,    -1,    52,    -1,    53,    -1,   212,    -1,   103,
      -1,   231,   118,   239,    -1,   231,   118,   123,   239,    -1,
     231,   118,   124,   239,    -1,   231,   118,   125,   239,    -1,
     231,   118,   239,   126,   239,    -1,   231,   118,   239,   124,
     239,    -1,   231,   118,   239,   127,   239,    -1,   231,   118,
     239,    68,   239,    -1,   231,   118,   239,   128,   239,    -1,
     231,   118,   239,    41,   239,    -1,   231,   118,   239,   129,
     239,    -1,   231,   118,   239,   116,   239,    -1,   231,   118,
     239,    55,   239,    -1,   231,   118,   239,    56,   239,    -1,
     231,   118,   239,    57,   239,    -1,   231,   118,   239,    59,
     239,    -1,   231,   118,   239,    60,   239,    -1,   231,   118,
     239,    58,   239,    -1,   231,   118,   239,    47,   239,    -1,
     231,   118,   239,    48,   239,    -1,   231,   118,   239,    69,
     239,    -1,   231,   118,   239,    70,   239,    -1,   231,   118,
     239,    71,   239,    -1,   231,   118,   239,    54,   239,    -1,
     231,   118,   239,   130,   239,    -1,   231,   118,   239,   131,
     239,    -1,   231,   118,   239,   125,   239,    -1,   231,   118,
     239,   119,   240,   120,    -1,   231,   119,   240,   120,   118,
     239,    -1,   231,   118,    21,   212,    72,   239,    -1,   231,
     118,    21,   212,   119,   240,   120,    -1,   231,   118,    21,
     212,    -1,   231,   118,    21,   239,    -1,   231,   118,    21,
     119,   240,   120,    -1,   231,   118,    21,   239,    72,   239,
      -1,   231,   118,    21,   239,   119,   240,   120,    -1,   231,
     118,    63,   103,    -1,   231,   118,    62,   247,    -1,    62,
     247,   118,   239,    -1,    21,   231,    72,   239,    -1,    21,
     231,    72,   239,    72,   239,    -1,    21,   231,    72,   239,
     119,   240,   120,    -1,   231,   118,   221,    -1,    -1,   121,
     214,   228,   122,   118,   219,   121,   223,   122,    -1,   215,
      -1,   217,    -1,   218,    -1,   231,   118,    14,    -1,    -1,
      67,   216,   121,   228,   122,    -1,   231,    33,   239,    -1,
     231,    34,   239,    -1,   231,    35,   239,    -1,   231,    36,
     239,    -1,   231,    43,   239,    -1,   231,    42,   239,    -1,
     231,    37,   239,    -1,   231,    38,   239,    -1,   231,    39,
     239,    -1,   231,    40,   239,    -1,   231,    44,   239,    -1,
     231,    45,   239,    -1,   231,    46,   239,    -1,   231,   118,
     111,   150,    -1,   103,    -1,   107,    -1,   110,    -1,   231,
      -1,   231,   220,   236,    -1,   231,   220,   107,    -1,   231,
     220,   231,    -1,   117,    -1,   115,    -1,    -1,   219,   222,
     121,   223,   122,    -1,    -1,   223,    72,   224,    -1,   224,
      -1,   223,    72,   107,    20,   239,    -1,   107,    20,   239,
      -1,   239,   225,    -1,    -1,   225,   226,    -1,    15,    -1,
      19,    -1,    19,   121,   107,   122,    -1,   231,   186,    -1,
     228,    72,   227,    -1,   228,    72,   107,    20,   231,    -1,
     227,    -1,   107,    20,   231,    -1,    -1,    12,   239,   230,
     239,    10,   237,    -1,    13,   239,   230,   239,    10,   237,
      -1,    12,    14,   239,    10,   237,    -1,    13,    14,   239,
      10,   237,    -1,    12,   239,    10,   237,    -1,    13,   239,
      10,   237,    -1,    12,   239,    72,   237,    -1,    13,   239,
      72,   237,    -1,    55,    -1,    56,    -1,    57,    -1,    58,
      -1,    59,    -1,    60,    -1,   112,    -1,   245,    -1,    -1,
     233,    -1,   233,    72,   234,    -1,   234,    -1,   238,    -1,
     231,   119,   240,   120,    -1,   119,   240,   120,    -1,   236,
      -1,   107,    -1,   110,    -1,   103,    -1,   111,    -1,   103,
      -1,   111,    -1,   237,    -1,   239,    -1,   231,    -1,   246,
      -1,    -1,   241,   242,    -1,   244,    -1,   242,   132,   244,
      -1,    -1,   242,    72,   243,   244,    -1,   239,    -1,   239,
      74,   239,    -1,    74,   239,    -1,   239,    74,    -1,    99,
      -1,   100,    -1,   101,    -1,   102,    -1,   104,    -1,   108,
      -1,   109,    -1,   107,    -1,   110,    -1,   101,    -1,   107,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   457,   457,   461,   462,   466,   467,   468,   469,   470,
     471,   472,   473,   474,   477,   478,   481,   489,   498,   507,
     513,   522,   522,   527,   527,   531,   532,   536,   537,   538,
     539,   540,   541,   544,   544,   549,   548,   559,   561,   566,
     570,   574,   574,   584,   586,   590,   607,   611,   614,   606,
     620,   621,   622,   631,   631,   635,   640,   650,   651,   655,
     658,   661,   667,   668,   669,   673,   674,   675,   676,   677,
     687,   697,   700,   702,   706,   708,   712,   706,   719,   718,
     750,   751,   755,   756,   761,   762,   766,   767,   771,   772,
     773,   774,   775,   776,   777,   778,   779,   783,   788,   790,
     795,   797,   799,   803,   811,   812,   816,   821,   822,   826,
     827,   827,   840,   841,   845,   846,   847,   848,   849,   850,
     855,   856,   860,   861,   866,   865,   870,   876,   877,   880,
     886,   891,   890,   898,   897,   907,   908,   914,   916,   922,
     928,   929,   941,   945,   947,   948,   949,   953,   954,   958,
     959,   963,   969,   974,   981,   990,   998,  1008,  1009,  1010,
    1011,  1012,  1012,  1027,  1031,  1031,  1033,  1034,  1034,  1036,
    1040,  1041,  1044,  1046,  1047,  1048,  1049,  1053,  1054,  1055,
    1056,  1057,  1058,  1062,  1073,  1074,  1075,  1076,  1077,  1078,
    1079,  1080,  1081,  1082,  1083,  1084,  1085,  1086,  1087,  1088,
    1089,  1090,  1091,  1093,  1095,  1097,  1099,  1101,  1103,  1105,
    1107,  1109,  1111,  1113,  1115,  1117,  1119,  1121,  1123,  1125,
    1127,  1130,  1132,  1136,  1138,  1140,  1143,  1150,  1149,  1158,
    1159,  1160,  1161,  1165,  1165,  1171,  1173,  1175,  1177,  1179,
    1181,  1183,  1185,  1187,  1189,  1191,  1193,  1195,  1200,  1207,
    1208,  1209,  1210,  1215,  1216,  1217,  1220,  1221,  1226,  1225,
    1235,  1236,  1242,  1248,  1250,  1254,  1258,  1259,  1263,  1264,
    1265,  1268,  1272,  1278,  1280,  1286,  1287,  1291,  1293,  1295,
    1297,  1299,  1301,  1303,  1305,  1310,  1311,  1312,  1313,  1314,
    1315,  1319,  1320,  1324,  1325,  1329,  1330,  1334,  1335,  1341,
    1348,  1349,  1350,  1354,  1355,  1359,  1360,  1364,  1365,  1369,
    1370,  1373,  1373,  1378,  1379,  1381,  1381,  1386,  1391,  1394,
    1395,  1399,  1400,  1401,  1402,  1403,  1407,  1408,  1409,  1410,
    1414,  1415
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
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
  "program", "compilation_units", "compilation_unit", "pragma", 
  "pragma_1", "hll_def", "global", "constdef", "@1", "pmc_const", "@2", 
  "pasmcode", "pasmline", "pasm_inst", "@3", "@4", "pasm_args", "emit", 
  "@5", "opt_pasmcode", "class_namespace", "sub", "@6", "@7", "@8", 
  "sub_params", "sub_param", "@9", "sub_param_type_def", "opt_comma", 
  "multi", "outer", "multi_types", "multi_type", "sub_body", "pcc_sub", 
  "@10", "@11", "@12", "pcc_sub_call", "@13", "opt_label", "opt_invocant", 
  "sub_proto", "sub_proto_list", "proto", "pcc_call", "pcc_args", 
  "pcc_arg", "pcc_results", "pcc_result", "@14", "paramtype_list", 
  "paramtype", "begin_ret_or_yield", "end_ret_or_yield", "pcc_ret", "@15", 
  "pcc_returns", "pcc_return", "pcc_return_many", "@16", "@17", 
  "var_returns", "statements", "helper_clear_state", "statement", 
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
static const unsigned short yytoknum[] =
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
static const unsigned char yyr1[] =
{
       0,   133,   134,   135,   135,   136,   136,   136,   136,   136,
     136,   136,   136,   136,   137,   137,   138,   139,   139,   140,
     140,   142,   141,   144,   143,   145,   145,   146,   146,   146,
     146,   146,   146,   148,   147,   149,   147,   147,   147,   147,
     150,   152,   151,   153,   153,   154,   156,   157,   158,   155,
     159,   159,   159,   161,   160,   162,   162,   163,   163,   164,
     165,   165,   166,   166,   166,   167,   167,   167,   167,   167,
     167,   167,   168,   168,   170,   171,   172,   169,   174,   173,
     175,   175,   176,   176,   177,   177,   178,   178,   179,   179,
     179,   179,   179,   179,   179,   179,   179,   180,   180,   180,
     180,   180,   180,   180,   181,   181,   182,   183,   183,   184,
     185,   184,   186,   186,   187,   187,   187,   187,   187,   187,
     188,   188,   189,   189,   191,   190,   190,   192,   192,   192,
     193,   195,   194,   196,   194,   197,   197,   197,   197,   197,
     198,   198,   199,   200,   200,   200,   200,   201,   201,   202,
     202,   203,   204,   205,   205,   206,   206,   207,   207,   207,
     207,   208,   207,   207,   209,   207,   207,   210,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   211,   211,   211,
     211,   211,   211,   212,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   214,   213,   213,
     213,   213,   213,   216,   215,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   217,   217,   218,   219,
     219,   219,   219,   219,   219,   219,   220,   220,   222,   221,
     223,   223,   223,   223,   223,   224,   225,   225,   226,   226,
     226,   227,   228,   228,   228,   228,   228,   229,   229,   229,
     229,   229,   229,   229,   229,   230,   230,   230,   230,   230,
     230,   231,   231,   232,   232,   233,   233,   234,   234,   234,
     235,   235,   235,   236,   236,   237,   237,   238,   238,   239,
     239,   241,   240,   242,   242,   243,   242,   244,   244,   244,
     244,   245,   245,   245,   245,   245,   246,   246,   246,   246,
     247,   247
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     3,     2,     2,     4,     4,     3,
       5,     0,     6,     0,     6,     1,     2,     3,     2,     1,
       1,     1,     1,     0,     3,     0,     4,     2,     4,     0,
       1,     0,     4,     0,     1,     4,     0,     0,     0,    10,
       0,     1,     3,     0,     3,     3,     5,     0,     1,     4,
       4,     4,     0,     3,     1,     1,     1,     1,     1,     1,
       1,     3,     0,     1,     0,     0,     0,    10,     0,     9,
       0,     2,     0,     3,     0,     1,     1,     3,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     5,     3,     3,
       3,     3,     5,     5,     0,     3,     2,     0,     3,     3,
       0,     4,     0,     2,     1,     1,     1,     1,     4,     1,
       1,     1,     1,     1,     0,     5,     1,     0,     2,     3,
       3,     0,     5,     0,     5,     0,     1,     3,     3,     5,
       1,     2,     0,     2,     2,     1,     1,     0,     1,     2,
       1,     1,     3,     1,     3,     2,     1,     1,     1,     2,
       2,     0,     4,     4,     0,     6,     1,     0,     6,     2,
       2,     2,     2,     1,     1,     1,     0,     1,     1,     1,
       1,     1,     1,     1,     3,     4,     4,     4,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     6,     6,     6,     7,     4,     4,     6,     6,     7,
       4,     4,     4,     4,     6,     7,     3,     0,     9,     1,
       1,     1,     3,     0,     5,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     4,     1,
       1,     1,     1,     3,     3,     3,     1,     1,     0,     5,
       0,     3,     1,     5,     3,     2,     0,     2,     1,     1,
       4,     2,     3,     5,     1,     3,     0,     6,     6,     5,
       5,     4,     4,     4,     4,     1,     1,     1,     1,     1,
       1,     1,     1,     0,     1,     3,     1,     1,     4,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     0,     2,     1,     3,     0,     4,     1,     3,     2,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,     0,     0,    46,    21,     0,    74,
      41,     0,     0,     2,     3,    12,     0,     7,     6,    10,
       5,     8,     9,     0,     0,     0,     0,   311,     0,     0,
     177,   178,   179,   180,   181,   183,     0,   182,     0,   147,
      11,     1,     4,    15,    16,    14,     0,     0,     0,     0,
     303,   301,   302,   304,    47,   300,     0,    19,    75,    23,
     151,     0,    30,    29,    32,   147,    25,     0,    31,    33,
     148,   150,    17,    18,    45,     0,   321,   322,   323,   324,
     325,   328,   326,   327,   329,   291,   309,   317,   312,   313,
     292,   310,    84,     0,     0,    84,     0,    28,    26,    42,
       0,     0,    35,     0,     0,   149,   319,   320,   315,     0,
      89,    88,    90,    91,    93,    92,     0,    94,     0,    95,
      96,     0,    57,    86,     0,    20,     0,     0,    37,     0,
      84,    27,   293,   318,     0,   314,     0,    62,    48,    58,
       0,    22,    76,   305,   306,   307,     0,   308,     0,     0,
     311,    34,   309,    40,   294,   296,   297,   316,     0,     0,
      65,    66,    68,    67,    69,    70,   311,     0,    64,    50,
      87,    50,     0,    38,    36,     0,   311,     0,    61,    60,
       0,     0,    59,    51,   142,   142,    24,   299,     0,   295,
      71,    63,    53,     0,   146,   145,     0,     0,   142,   147,
     140,     0,   298,     0,   144,    52,    49,   141,   176,   143,
      77,    54,     0,     0,     0,     0,     0,     0,     0,     0,
     161,     0,   164,   167,     0,     0,     0,   233,     0,   120,
     121,   249,   250,   251,   293,   227,   166,   174,     0,   175,
     126,     0,   157,   229,   230,   231,   258,   173,   158,   252,
     112,     0,   170,     0,     0,     0,     0,   172,     0,   159,
     160,     0,     0,     0,     0,   330,   331,     0,   131,   169,
     252,   133,     0,    78,   171,   276,   124,   152,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   257,   256,     0,   311,     0,    55,     0,     0,
       0,   285,   286,   287,   288,   289,   290,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   135,
     135,   276,   104,     0,   274,     0,   112,   127,   260,   235,
     236,   237,   238,   241,   242,   243,   244,   240,   239,   245,
     246,   247,   232,     0,     0,     0,   328,   329,   293,     0,
       0,     0,   226,   309,   184,     0,   254,   255,   253,   114,
     115,   116,   117,   119,   113,   112,     0,   281,   283,     0,
       0,   282,   284,     0,   223,   156,   162,   153,   163,     0,
       0,   222,   328,     0,   136,   266,     0,     0,    82,     0,
       0,     0,   271,     0,   328,     0,   262,   311,   215,   216,
     221,   220,   248,   185,   186,   187,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   311,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    56,   279,     0,   280,     0,     0,   311,   155,
       0,     0,     0,     0,     0,   132,   265,   134,   234,     0,
       0,     0,     0,   275,     0,   272,     0,   128,     0,   122,
     123,   125,     0,     0,     0,   259,     0,     0,   311,     0,
     311,   193,   202,   203,   207,   196,   197,   198,   201,   199,
     200,   191,   204,   205,   206,   195,     0,   189,   210,   188,
     190,   192,   194,   208,   209,     0,     0,   277,   278,   224,
       0,   154,   165,   168,   137,   328,   138,   268,   269,   267,
     106,     0,     0,     0,     0,    80,   105,     0,     0,   266,
     129,   264,   328,   261,   217,   213,     0,   218,     0,   211,
     212,   118,   225,     0,     0,    83,     0,     0,     0,     0,
     107,     0,   273,   260,   130,     0,   214,   219,   139,     0,
      98,     0,    99,   101,     0,   100,     0,     0,    81,     0,
     263,   270,     0,     0,     0,   110,     0,    79,     0,   228,
      97,   103,   102,     0,   112,   108,     0,   109,   111
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    12,    13,    14,    15,    24,    16,    17,    18,    29,
      64,    96,    65,    66,   103,   104,   130,   151,    19,    39,
      67,    20,    21,    28,    92,   169,   184,   196,   203,   211,
     140,   119,   120,   167,   168,   197,    22,    38,    95,   171,
     237,   322,   540,   451,   121,   122,   123,   515,   388,   452,
     557,   568,   573,   297,   364,   238,   461,   239,   327,   393,
     462,   240,   319,   320,   383,   198,   199,   200,    69,    70,
      71,   209,   376,   377,   241,   261,   263,   264,    36,    37,
     242,   275,   243,   272,   244,   245,   246,   296,   247,   278,
     395,   384,   446,   509,   324,   325,   248,   308,    86,   153,
     154,   155,    54,    55,   145,   156,   385,    48,    49,    88,
     134,    89,    90,    91,   267
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -432
static const short yypact[] =
{
      15,  -432,    51,   -66,   -39,   -77,  -432,  -432,     3,  -432,
    -432,    57,   117,    15,  -432,  -432,   122,  -432,  -432,  -432,
    -432,  -432,  -432,    29,   159,    93,   107,  -432,   115,     3,
    -432,  -432,  -432,  -432,  -432,  -432,    77,  -432,    78,    63,
    -432,  -432,  -432,  -432,  -432,  -432,    75,    76,    80,   304,
    -432,  -432,  -432,  -432,  -432,  -432,    90,    84,  -432,  -432,
    -432,   191,  -432,  -432,  -432,   163,  -432,   105,  -432,     8,
     121,  -432,  -432,  -432,  -432,   527,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,   134,   -57,  -432,
    -432,  -432,   665,   101,    42,   665,   103,  -432,  -432,  -432,
     527,   113,  -432,   220,   120,  -432,  -432,   527,  -432,   304,
    -432,  -432,  -432,  -432,  -432,  -432,   139,  -432,   151,  -432,
    -432,   270,     7,  -432,    42,  -432,   274,   495,  -432,   207,
     665,  -432,   185,  -432,   304,  -432,    20,   164,  -432,  -432,
     665,  -432,  -432,  -432,  -432,  -432,   162,  -432,   177,   186,
    -432,  -432,   172,  -432,   229,  -432,  -432,  -432,   180,   181,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,   -55,  -432,   311,
    -432,   311,   209,  -432,  -432,   197,  -432,   185,  -432,  -432,
     198,   164,  -432,  -432,     5,     5,  -432,  -432,   199,  -432,
    -432,  -432,  -432,   317,  -432,  -432,   319,   251,    73,   121,
    -432,   252,  -432,     3,  -432,  -432,  -432,  -432,   422,  -432,
    -432,  -432,    59,   -72,    31,    97,   527,   154,   224,   225,
    -432,   223,   226,  -432,    35,   356,   210,  -432,   328,  -432,
    -432,  -432,  -432,  -432,   185,  -432,  -432,  -432,   329,  -432,
    -432,   337,  -432,  -432,  -432,  -432,  -432,  -432,  -432,   533,
    -432,   322,  -432,   527,    98,   527,   254,  -432,   277,  -432,
    -432,     3,   280,     3,     3,  -432,  -432,   235,  -432,  -432,
     -47,  -432,   233,  -432,  -432,   374,  -432,  -432,   234,   527,
     527,   527,   527,   527,   527,   527,   527,   527,   527,   527,
     527,   527,  -432,  -432,   236,  -432,   610,    30,   253,   347,
     -72,  -432,  -432,  -432,  -432,  -432,  -432,   -72,   527,   348,
     -72,   -72,   527,   527,   259,   154,   285,   286,   527,   554,
     554,   374,  -432,   371,  -432,   -42,  -432,  -432,   568,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,   481,    35,   289,   272,   275,   185,   527,
     527,   527,  -432,   112,   494,   278,  -432,  -432,  -432,  -432,
    -432,  -432,   276,  -432,  -432,  -432,   -72,  -432,  -432,   385,
     -72,  -432,  -432,   389,   -46,   306,   330,  -432,  -432,   291,
     292,  -432,   397,   -13,  -432,  -432,    -9,    -7,     2,   154,
     392,   300,    30,    34,   399,    -1,  -432,  -432,   -37,    56,
    -432,  -432,  -432,  -432,  -432,  -432,   527,   527,   527,   527,
     527,   527,   527,   527,   527,   527,   527,   527,   527,   527,
     527,  -432,   527,   527,   527,   527,   527,   527,   527,   527,
     303,   315,    30,  -432,   -72,  -432,   -72,   527,  -432,  -432,
     259,    42,    42,   527,   582,  -432,    81,  -432,  -432,   527,
     527,   106,   419,  -432,   405,  -432,   624,  -432,   527,  -432,
    -432,  -432,   423,   527,   596,  -432,   308,   527,  -432,   527,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,   309,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,   527,   316,  -432,  -432,  -432,
     310,  -432,  -432,  -432,  -432,   411,  -432,  -432,   312,  -432,
    -432,   433,   527,   527,   638,   121,  -432,   154,   320,  -432,
    -432,  -432,   420,  -432,  -432,  -432,   327,  -432,   333,  -432,
    -432,  -432,  -432,   527,   335,  -432,    16,   444,    23,    25,
    -432,   457,  -432,   568,    81,   527,  -432,  -432,  -432,   340,
    -432,   527,  -432,  -432,   527,  -432,   527,    -2,  -432,     0,
    -432,  -432,   460,   461,   463,  -432,   154,  -432,   467,  -432,
    -432,  -432,  -432,     3,  -432,  -432,   259,    30,  -432
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -432,  -432,  -432,   459,  -432,  -432,  -432,  -432,  -432,  -432,
     271,  -432,  -432,   415,  -432,  -432,  -432,   135,  -432,  -432,
    -432,    -5,  -432,  -432,  -432,  -432,   314,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,   301,   313,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,   -79,  -432,   355,  -432,  -432,  -432,
    -432,  -432,  -432,  -322,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,   187,  -432,  -432,   302,   307,  -432,
     -69,  -432,  -432,  -431,  -432,  -432,  -432,  -432,   -29,   166,
    -432,  -432,  -432,  -432,  -432,  -432,    49,  -432,  -211,  -432,
     -33,  -320,    -4,  -432,   124,   195,  -432,   256,  -127,   283,
    -432,   341,  -432,   231,  -206,   393,   -43,  -148,  -432,  -432,
    -432,   -32,  -432,   -91,   175
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -253
static const short yytable[] =
{
      56,   105,   175,   125,   392,   152,    87,   252,   396,   501,
     192,   -85,   -39,   449,   269,   108,   126,   181,   180,     1,
     550,     2,   100,     3,     4,   565,   437,   553,   188,   555,
     390,   143,   106,   141,    68,   467,   101,     5,   457,   144,
       6,    25,    27,   432,     7,   253,   359,   360,   361,   362,
     152,   149,    30,    31,    32,    33,    34,   128,    23,   444,
      68,    40,   566,   444,   133,   390,    87,   182,   292,    26,
     293,   464,   464,   438,   567,   109,     8,   135,   -72,   139,
     391,   249,   468,   352,   147,     5,   102,   450,   551,   147,
     258,    87,    59,     9,   367,   554,   507,   556,   270,   458,
     508,   368,   157,   -85,   371,   372,    35,   152,   300,   445,
     193,   255,    10,   447,   459,   448,   460,    41,   194,   195,
      11,   465,   569,   158,   506,   363,    43,   159,   469,   510,
      76,    77,    78,    79,   147,    80,   265,    44,    81,    82,
      83,    84,   266,    85,   523,   578,   -73,   355,   326,    81,
      82,    83,    84,   301,   302,   303,   304,   305,   306,    60,
     433,   -43,   250,    45,   435,    46,   251,   353,    61,   357,
     307,   254,   256,   257,   212,   470,    62,    63,   193,    47,
      57,    58,    72,   512,    73,     5,   194,   195,   378,   513,
     514,   147,    59,    93,   326,    97,    76,    77,    78,    79,
      74,    80,    94,    99,    81,    82,    83,    84,   107,    85,
     299,   127,   309,   160,   161,   162,   163,    60,    50,   124,
     129,   152,    51,   396,   131,    52,    53,   292,   497,   293,
     498,   132,   314,  -252,   316,   317,   329,   330,   331,   332,
     333,   334,   335,   336,   337,   338,   339,   340,   341,   466,
     342,   354,   577,    76,    77,    78,    79,   343,    80,    60,
     136,   -44,   453,   326,   310,   369,    85,   164,    61,   373,
     374,   165,   137,   486,   138,   381,    62,    63,   142,   148,
     172,   173,   174,   166,    76,    77,    78,    79,   143,    80,
     500,   176,    81,    82,    83,    84,   144,    85,   344,   345,
     399,   177,   178,   179,   150,   147,   403,   404,   405,   301,
     302,   303,   304,   305,   306,   183,   186,   187,   190,   202,
     526,   204,   528,   205,   206,   210,   311,   259,   260,   270,
     262,   271,   273,   276,   -23,    76,    77,    78,    79,   231,
      80,   277,   298,   346,    82,    83,   347,   348,    85,   313,
     502,   503,   315,   318,   321,   328,   365,   366,   370,   349,
     350,   351,   375,   471,   472,   473,   474,   475,   476,   477,
     478,   479,   480,   481,   482,   483,   484,   485,    75,   487,
     488,   489,   490,   491,   492,   493,   494,   539,   379,   380,
     542,   389,   401,  -250,   499,   434,  -251,   431,   430,   436,
     504,   439,   440,    76,    77,    78,    79,   511,    80,   441,
     442,    81,    82,    83,    84,   519,    85,   443,   456,   463,
     521,   495,   496,   516,   525,   517,   527,   520,   524,   529,
     532,   533,   213,   534,   214,   215,   216,   535,   531,   574,
     545,   543,   549,   217,   218,   219,   541,   546,   552,   220,
     221,   222,   530,   547,   223,    76,    77,    78,    79,   231,
      80,   558,   561,   232,   570,   571,   233,   572,    85,   536,
     537,   575,    42,    76,    77,    78,    79,   268,    80,   236,
      98,   323,   191,   402,   224,   185,    85,   225,   226,   227,
     548,    76,    77,    78,    79,   170,    80,   228,   201,   454,
     207,   229,   560,   230,    85,   518,   208,   386,   562,   398,
     559,   563,   312,   564,   455,   544,   387,   274,   189,   400,
     146,    76,    77,    78,    79,   231,    80,   358,     0,   232,
       0,     0,   233,   234,    85,   406,     0,     0,     0,     0,
       0,   407,   408,   235,   576,     0,     0,     0,   409,   410,
     411,   412,   413,   414,   415,     0,     0,     0,     0,     0,
       0,     0,   416,   417,   418,   419,   279,   280,   281,   282,
     283,   284,   285,   286,     0,   287,   288,   289,   290,   291,
      76,    77,    78,    79,    35,    80,     0,     0,    81,    82,
      83,    84,     0,    85,    76,    77,    78,    79,   143,    80,
     397,     0,    81,    82,    83,    84,   144,    85,     0,     0,
     420,     0,     0,   421,     0,     0,     0,     0,   422,   423,
     424,   425,   426,   427,   428,   429,    76,    77,    78,    79,
       0,    80,     0,     0,    81,    82,    83,    84,     0,    85,
       0,     0,     0,     0,     0,     0,     0,     0,   292,     0,
     293,   294,   295,    76,    77,    78,    79,     0,    80,     0,
       0,   382,    82,    83,    84,     0,    85,    76,    77,    78,
      79,     0,    80,     0,     0,   394,    82,    83,    84,     0,
      85,    76,    77,    78,    79,     0,    80,     0,     0,   505,
      82,    83,    84,     0,    85,    76,    77,    78,    79,     0,
      80,     0,     0,   522,    82,    83,    84,     0,    85,    76,
      77,    78,    79,    50,    80,     0,     0,   356,     0,     0,
       0,    53,    85,    76,    77,    78,    79,   231,    80,     0,
       0,   232,     0,     0,   233,     0,    85,    76,    77,    78,
      79,     0,    80,     0,     0,   538,     0,     0,     0,     0,
      85,   110,   111,   112,   113,   114,   115,   116,   117,   118
};

static const short yycheck[] =
{
      29,    70,   150,    94,   326,   132,    49,   213,   328,   440,
       5,     4,     4,    11,   225,    72,    95,    72,   166,     4,
       4,     6,    14,     8,     9,    27,    72,     4,   176,     4,
      72,   103,    75,   124,    39,    72,    28,    22,     4,   111,
      25,   107,   119,   365,    29,    14,    16,    17,    18,    19,
     177,   130,    49,    50,    51,    52,    53,   100,     7,    72,
      65,     4,    64,    72,   107,    72,   109,   122,   115,   108,
     117,    72,    72,   119,    76,   132,    61,   109,    73,    72,
     122,   208,   119,   294,   127,    22,    78,    85,    72,   132,
     217,   134,    29,    78,   300,    72,    15,    72,   225,    65,
      19,   307,   134,    96,   310,   311,   103,   234,    10,   122,
     105,    14,    97,   122,    80,   122,    82,     0,   113,   114,
     105,   122,   122,   103,   444,    95,     4,   107,    72,   449,
      99,   100,   101,   102,   177,   104,   101,   108,   107,   108,
     109,   110,   107,   112,   464,   576,    73,   295,   275,   107,
     108,   109,   110,    55,    56,    57,    58,    59,    60,    96,
     366,    98,   103,     4,   370,    72,   107,   294,   105,   296,
      72,   214,   215,   216,   203,   119,   113,   114,   105,    72,
     103,   103,   107,    77,   108,    22,   113,   114,   315,    83,
      84,   234,    29,   103,   321,     4,    99,   100,   101,   102,
     120,   104,   118,    98,   107,   108,   109,   110,    74,   112,
     253,   108,   255,    49,    50,    51,    52,    96,   103,   118,
     107,   348,   107,   543,     4,   110,   111,   115,   434,   117,
     436,   111,   261,   121,   263,   264,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   397,
      14,   294,   574,    99,   100,   101,   102,    21,   104,    96,
     121,    98,   389,   390,    10,   308,   112,   103,   105,   312,
     313,   107,   121,   421,     4,   318,   113,   114,     4,    72,
     118,   104,    96,   119,    99,   100,   101,   102,   103,   104,
     438,   119,   107,   108,   109,   110,   111,   112,    62,    63,
     343,    72,   122,   122,   119,   348,   349,   350,   351,    55,
      56,    57,    58,    59,    60,     4,   107,   120,   120,   120,
     468,     4,   470,     4,    73,    73,    72,   103,   103,   456,
     107,   121,     4,     4,   108,    99,   100,   101,   102,   103,
     104,     4,    20,   107,   108,   109,   110,   111,   112,    72,
     441,   442,    72,   118,   121,   121,   103,    10,    10,   123,
     124,   125,   103,   406,   407,   408,   409,   410,   411,   412,
     413,   414,   415,   416,   417,   418,   419,   420,    74,   422,
     423,   424,   425,   426,   427,   428,   429,   514,   103,   103,
     517,    20,   103,   121,   437,    10,   121,   121,   120,    10,
     443,    95,    72,    99,   100,   101,   102,   450,   104,   118,
     118,   107,   108,   109,   110,   458,   112,    20,   118,    20,
     463,   118,   107,     4,   467,    20,   469,     4,   120,   120,
     120,    20,    10,   121,    12,    13,    14,     4,   122,   566,
      20,   121,   107,    21,    22,    23,   515,   120,     4,    27,
      28,    29,   495,   120,    32,    99,   100,   101,   102,   103,
     104,     4,   122,   107,     4,     4,   110,     4,   112,   512,
     513,     4,    13,    99,   100,   101,   102,   121,   104,   208,
      65,   107,   181,   348,    62,   171,   112,    65,    66,    67,
     533,    99,   100,   101,   102,   140,   104,    75,   185,   107,
     198,    79,   545,    81,   112,   456,   199,   320,   551,   343,
     543,   554,   256,   556,   390,   519,   321,   234,   177,   344,
     127,    99,   100,   101,   102,   103,   104,   296,    -1,   107,
      -1,    -1,   110,   111,   112,    41,    -1,    -1,    -1,    -1,
      -1,    47,    48,   121,   573,    -1,    -1,    -1,    54,    55,
      56,    57,    58,    59,    60,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    69,    70,    71,    33,    34,    35,    36,
      37,    38,    39,    40,    -1,    42,    43,    44,    45,    46,
      99,   100,   101,   102,   103,   104,    -1,    -1,   107,   108,
     109,   110,    -1,   112,    99,   100,   101,   102,   103,   104,
     119,    -1,   107,   108,   109,   110,   111,   112,    -1,    -1,
     116,    -1,    -1,   119,    -1,    -1,    -1,    -1,   124,   125,
     126,   127,   128,   129,   130,   131,    99,   100,   101,   102,
      -1,   104,    -1,    -1,   107,   108,   109,   110,    -1,   112,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   115,    -1,
     117,   118,   119,    99,   100,   101,   102,    -1,   104,    -1,
      -1,   107,   108,   109,   110,    -1,   112,    99,   100,   101,
     102,    -1,   104,    -1,    -1,   107,   108,   109,   110,    -1,
     112,    99,   100,   101,   102,    -1,   104,    -1,    -1,   107,
     108,   109,   110,    -1,   112,    99,   100,   101,   102,    -1,
     104,    -1,    -1,   107,   108,   109,   110,    -1,   112,    99,
     100,   101,   102,   103,   104,    -1,    -1,   107,    -1,    -1,
      -1,   111,   112,    99,   100,   101,   102,   103,   104,    -1,
      -1,   107,    -1,    -1,   110,    -1,   112,    99,   100,   101,
     102,    -1,   104,    -1,    -1,   107,    -1,    -1,    -1,    -1,
     112,    86,    87,    88,    89,    90,    91,    92,    93,    94
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,     9,    22,    25,    29,    61,    78,
      97,   105,   134,   135,   136,   137,   139,   140,   141,   151,
     154,   155,   169,     7,   138,   107,   108,   119,   156,   142,
      49,    50,    51,    52,    53,   103,   211,   212,   170,   152,
       4,     0,   136,     4,   108,     4,    72,    72,   240,   241,
     103,   107,   110,   111,   235,   236,   211,   103,   103,    29,
      96,   105,   113,   114,   143,   145,   146,   153,   154,   201,
     202,   203,   107,   108,   120,    74,    99,   100,   101,   102,
     104,   107,   108,   109,   110,   112,   231,   239,   242,   244,
     245,   246,   157,   103,   118,   171,   144,     4,   146,    98,
      14,    28,    78,   147,   148,   203,   239,    74,    72,   132,
      86,    87,    88,    89,    90,    91,    92,    93,    94,   164,
     165,   177,   178,   179,   118,   246,   177,   108,   239,   107,
     149,     4,   111,   239,   243,   244,   121,   121,     4,    72,
     163,   246,     4,   103,   111,   237,   238,   239,    72,   177,
     119,   150,   231,   232,   233,   234,   238,   244,   103,   107,
      49,    50,    51,    52,   103,   107,   119,   166,   167,   158,
     179,   172,   118,   104,    96,   240,   119,    72,   122,   122,
     240,    72,   122,     4,   159,   159,   107,   120,   240,   234,
     120,   167,     5,   105,   113,   114,   160,   168,   198,   199,
     200,   168,   120,   161,     4,     4,    73,   200,   201,   204,
      73,   162,   211,    10,    12,    13,    14,    21,    22,    23,
      27,    28,    29,    32,    62,    65,    66,    67,    75,    79,
      81,   103,   107,   110,   111,   121,   143,   173,   188,   190,
     194,   207,   213,   215,   217,   218,   219,   221,   229,   231,
     103,   107,   237,    14,   239,    14,   239,   239,   231,   103,
     103,   208,   107,   209,   210,   101,   107,   247,   121,   221,
     231,   121,   216,     4,   232,   214,     4,     4,   222,    33,
      34,    35,    36,    37,    38,    39,    40,    42,    43,    44,
      45,    46,   115,   117,   118,   119,   220,   186,    20,   239,
      10,    55,    56,    57,    58,    59,    60,    72,   230,   239,
      10,    72,   230,    72,   211,    72,   211,   211,   118,   195,
     196,   121,   174,   107,   227,   228,   231,   191,   121,   239,
     239,   239,   239,   239,   239,   239,   239,   239,   239,   239,
     239,   239,    14,    21,    62,    63,   107,   110,   111,   123,
     124,   125,   221,   231,   239,   240,   107,   231,   236,    16,
      17,    18,    19,    95,   187,   103,    10,   237,   237,   239,
      10,   237,   237,   239,   239,   103,   205,   206,   231,   103,
     103,   239,   107,   197,   224,   239,   197,   228,   181,    20,
      72,   122,   186,   192,   107,   223,   224,   119,   212,   239,
     247,   103,   150,   239,   239,   239,    41,    47,    48,    54,
      55,    56,    57,    58,    59,    60,    68,    69,    70,    71,
     116,   119,   124,   125,   126,   127,   128,   129,   130,   131,
     120,   121,   186,   237,    10,   237,    10,    72,   119,    95,
      72,   118,   118,    20,    72,   122,   225,   122,   122,    11,
      85,   176,   182,   231,   107,   227,   118,     4,    65,    80,
      82,   189,   193,    20,    72,   122,   240,    72,   119,    72,
     119,   239,   239,   239,   239,   239,   239,   239,   239,   239,
     239,   239,   239,   239,   239,   239,   240,   239,   239,   239,
     239,   239,   239,   239,   239,   118,   107,   237,   237,   239,
     240,   206,   246,   246,   239,   107,   224,    15,    19,   226,
     224,   239,    77,    83,    84,   180,     4,    20,   219,   239,
       4,   239,   107,   224,   120,   239,   240,   239,   240,   120,
     239,   122,   120,    20,   121,     4,   239,   239,   107,   231,
     175,   203,   231,   121,   225,    20,   120,   120,   239,   107,
       4,    72,     4,     4,    72,     4,    72,   183,     4,   223,
     239,   122,   239,   239,   239,    27,    64,    76,   184,   122,
       4,     4,     4,   185,   231,     4,   211,   186,   206
};

#if ! defined (YYSIZE_T) && defined (__SIZE_TYPE__)
# define YYSIZE_T __SIZE_TYPE__
#endif
#if ! defined (YYSIZE_T) && defined (size_t)
# define YYSIZE_T size_t
#endif
#if ! defined (YYSIZE_T)
# if defined (__STDC__) || defined (__cplusplus)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# endif
#endif
#if ! defined (YYSIZE_T)
# define YYSIZE_T unsigned int
#endif

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrlab1

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
    { 								\
      yyerror (interp, "syntax error: cannot back up");\
      YYERROR;							\
    }								\
while (0)

#define YYTERROR	1
#define YYERRCODE	256

/* YYLLOC_DEFAULT -- Compute the default location (before the actions
   are run).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)         \
  Current.first_line   = Rhs[1].first_line;      \
  Current.first_column = Rhs[1].first_column;    \
  Current.last_line    = Rhs[N].last_line;       \
  Current.last_column  = Rhs[N].last_column;
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
} while (0)

# define YYDSYMPRINT(Args)			\
do {						\
  if (yydebug)					\
    yysymprint Args;				\
} while (0)

# define YYDSYMPRINTF(Title, Token, Value, Location)		\
do {								\
  if (yydebug)							\
    {								\
      YYFPRINTF (stderr, "%s ", Title);				\
      yysymprint (stderr, 					\
                  Token, Value);	\
      YYFPRINTF (stderr, "\n");					\
    }								\
} while (0)

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (cinluded).                                                   |
`------------------------------------------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yy_stack_print (short *bottom, short *top)
#else
static void
yy_stack_print (bottom, top)
    short *bottom;
    short *top;
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
  unsigned int yylineno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %u), ",
             yyrule - 1, yylineno);
  /* Print the symbols being reduced, and their result.  */
  for (yyi = yyprhs[yyrule]; 0 <= yyrhs[yyi]; yyi++)
    YYFPRINTF (stderr, "%s ", yytname [yyrhs[yyi]]);
  YYFPRINTF (stderr, "-> %s\n", yytname [yyr1[yyrule]]);
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
# define YYDSYMPRINT(Args)
# define YYDSYMPRINTF(Title, Token, Value, Location)
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
   SIZE_MAX < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#if YYMAXDEPTH == 0
# undef YYMAXDEPTH
#endif

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
  register const char *yys = yystr;

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
  register char *yyd = yydest;
  register const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

#endif /* !YYERROR_VERBOSE */



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
    {
      YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
# ifdef YYPRINT
      YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
    }
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

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
yydestruct (int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yytype, yyvaluep)
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvaluep;

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
int yyparse (Interp *interp);
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
yyparse (Interp *interp)
#else
int
yyparse (interp)
    Interp *interp;
#endif
#endif
{
  /* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;

  register int yystate;
  register int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  short	yyssa[YYINITDEPTH];
  short *yyss = yyssa;
  register short *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  register YYSTYPE *yyvsp;



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
	short *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow ("parser stack overflow",
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyoverflowlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyoverflowlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	short *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyoverflowlab;
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
/* Read a lookahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to lookahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
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
      YYDSYMPRINTF ("Next token is", yytoken, &yylval, &yylloc);
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

  /* Shift the lookahead token.  */
  YYDPRINTF ((stderr, "Shifting token %s, ", yytname[yytoken]));

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
#line 457 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 466 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 6:
#line 467 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 468 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 469 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 470 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 471 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 472 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 12:
#line 473 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 474 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 477 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 478 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 482 "compilers/imcc/imcc.y"
    { if (yyvsp[0].s)
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 17:
#line 490 "compilers/imcc/imcc.y"
    {
            STRING *hll_name, *hll_lib;
            hll_name = string_unescape_cstring(interp, yyvsp[-2].s + 1, '"', NULL);
            hll_lib =  string_unescape_cstring(interp, yyvsp[0].s + 1, '"', NULL);
            CONTEXT(((Interp*)interp)->ctx)->current_HLL = 
                Parrot_register_HLL(interp, hll_name, hll_lib);
            yyval.t = 0;
         }
    break;

  case 18:
#line 499 "compilers/imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                CONTEXT(((Interp*)interp)->ctx)->current_HLL, atoi(yyvsp[-2].s), atoi(yyvsp[0].s));
             yyval.t = 0;
         }
    break;

  case 19:
#line 508 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 20:
#line 514 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 21:
#line 522 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 22:
#line 523 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 23:
#line 527 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 24:
#line 528 "compilers/imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 27:
#line 536 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 28:
#line 537 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 29:
#line 538 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 30:
#line 539 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 31:
#line 540 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 33:
#line 544 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 34:
#line 546 "compilers/imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 35:
#line 549 "compilers/imcc/imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                    }
    break;

  case 36:
#line 554 "compilers/imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, yyvsp[0].s));
                     cur_call->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 37:
#line 560 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 38:
#line 562 "compilers/imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, yyvsp[0].s);
                       set_lexical(interp, r, yyvsp[-2].s); yyval.i = 0;
                   }
    break;

  case 39:
#line 566 "compilers/imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 41:
#line 574 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 42:
#line 576 "compilers/imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 45:
#line 591 "compilers/imcc/imcc.y"
    {
                    int re_open = 0;
                    yyval.i=0;
                    if (IMCC_INFO(interp)->state->pasm_file && cur_namespace) {
                        imc_close_unit(interp, cur_unit);
                        re_open = 1;
                    }
                    IMCC_INFO(interp)->cur_namespace = yyvsp[-1].sr;
                    cur_namespace = yyvsp[-1].sr;
                    if (re_open)
                        cur_unit = imc_open_unit(interp, IMC_PASM);
                }
    break;

  case 46:
#line 607 "compilers/imcc/imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 47:
#line 611 "compilers/imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, yyvsp[0].sr);
        }
    break;

  case 48:
#line 614 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 49:
#line 616 "compilers/imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 50:
#line 620 "compilers/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 51:
#line 621 "compilers/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 52:
#line 622 "compilers/imcc/imcc.y"
    { 
         if (adv_named_id) {
             add_pcc_named_param(interp,cur_call,adv_named_id,yyvsp[-1].sr);
             adv_named_id = NULL;
         } else add_pcc_param(cur_call, yyvsp[-1].sr);
   }
    break;

  case 53:
#line 631 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 54:
#line 631 "compilers/imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; is_def=0; }
    break;

  case 55:
#line 635 "compilers/imcc/imcc.y"
    { if (yyvsp[0].t & VT_UNIQUE_REG)
                                             yyval.sr = mk_ident_ur(interp, yyvsp[-1].s, yyvsp[-2].t);
                                         else
                                             yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-2].t);
                                         yyval.sr->type |= yyvsp[0].t; }
    break;

  case 56:
#line 640 "compilers/imcc/imcc.y"
    { 
                                         if (yyvsp[0].t & VT_UNIQUE_REG)
                                             yyval.sr = mk_ident_ur(interp, yyvsp[-1].s, yyvsp[-4].t);
                                         else
                                             yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-4].t);
                                         yyval.sr->type |= yyvsp[0].t;
                                         adv_named_set(interp,yyvsp[-3].s);}
    break;

  case 57:
#line 650 "compilers/imcc/imcc.y"
    { yyval.t = 0;  }
    break;

  case 59:
#line 655 "compilers/imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 60:
#line 659 "compilers/imcc/imcc.y"
    { yyval.t = 0; cur_unit->outer =
                     mk_sub_address_fromc(interp, yyvsp[-1].s); }
    break;

  case 61:
#line 662 "compilers/imcc/imcc.y"
    { yyval.t = 0; cur_unit->outer =
                     mk_const(interp, yyvsp[-1].s, 'S'); }
    break;

  case 62:
#line 667 "compilers/imcc/imcc.y"
    { add_pcc_multi(cur_call, NULL); }
    break;

  case 63:
#line 668 "compilers/imcc/imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); }
    break;

  case 64:
#line 669 "compilers/imcc/imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);}
    break;

  case 65:
#line 673 "compilers/imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 66:
#line 674 "compilers/imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 67:
#line 675 "compilers/imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 68:
#line 676 "compilers/imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 69:
#line 677 "compilers/imcc/imcc.y"
    {
                          SymReg *r;
                          if (strcmp(yyvsp[0].s, "_"))
                              r = mk_const(interp, yyvsp[0].s, 'S');
                          else {
                              free(yyvsp[0].s),
                              r = mk_const(interp, str_dup("PMC"), 'S');
                           }
                           yyval.sr = r;
                      }
    break;

  case 70:
#line 687 "compilers/imcc/imcc.y"
    {
                          SymReg *r;
                          if (strcmp(yyvsp[0].s, "_"))
                              r = mk_const(interp, yyvsp[0].s, 'S');
                          else {
                              free(yyvsp[0].s),
                              r = mk_const(interp, str_dup("PMC"), 'S');
                           }
                           yyval.sr = r;
                      }
    break;

  case 71:
#line 697 "compilers/imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; }
    break;

  case 74:
#line 706 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 75:
#line 708 "compilers/imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, yyvsp[0].s));

         }
    break;

  case 76:
#line 712 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 77:
#line 714 "compilers/imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 78:
#line 719 "compilers/imcc/imcc.y"
    {
            char name[128];
            SymReg * r, *r1;
            Instruction *i;

            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
            yyval.sr = r = mk_pcc_sub(interp, str_dup(name), 0);
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

  case 79:
#line 746 "compilers/imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 80:
#line 750 "compilers/imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 81:
#line 751 "compilers/imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 82:
#line 755 "compilers/imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 83:
#line 757 "compilers/imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 84:
#line 761 "compilers/imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 86:
#line 766 "compilers/imcc/imcc.y"
    { yyval.t = yyvsp[0].t; }
    break;

  case 87:
#line 767 "compilers/imcc/imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; }
    break;

  case 88:
#line 771 "compilers/imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 89:
#line 772 "compilers/imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 90:
#line 773 "compilers/imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 91:
#line 774 "compilers/imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 92:
#line 775 "compilers/imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 93:
#line 776 "compilers/imcc/imcc.y"
    {  yyval.t = P_METHOD; }
    break;

  case 94:
#line 777 "compilers/imcc/imcc.y"
    {  yyval.t = P_NEED_LEX; }
    break;

  case 97:
#line 784 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 98:
#line 789 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 99:
#line 791 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-1].sr);
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 100:
#line 796 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 101:
#line 798 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 102:
#line 800 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 103:
#line 804 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 104:
#line 811 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 105:
#line 812 "compilers/imcc/imcc.y"
    {  add_pcc_arg(cur_call, yyvsp[-1].sr); }
    break;

  case 106:
#line 816 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 107:
#line 821 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 108:
#line 822 "compilers/imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(cur_call, yyvsp[-1].sr); }
    break;

  case 109:
#line 826 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 110:
#line 827 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 111:
#line 828 "compilers/imcc/imcc.y"
    {
         IdList* l = yyvsp[0].idlist;
         if (l->unique_reg)
                 mk_ident_ur(interp, l->id, yyvsp[-1].t);
             else
                 mk_ident(interp, l->id, yyvsp[-1].t);
         is_def=0;
         yyval.sr=0;
     }
    break;

  case 112:
#line 840 "compilers/imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 113:
#line 841 "compilers/imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 114:
#line 845 "compilers/imcc/imcc.y"
    {  yyval.t = VT_FLAT;   }
    break;

  case 115:
#line 846 "compilers/imcc/imcc.y"
    {  yyval.t = VT_OPTIONAL; }
    break;

  case 116:
#line 847 "compilers/imcc/imcc.y"
    {  yyval.t = VT_OPT_FLAG; }
    break;

  case 117:
#line 848 "compilers/imcc/imcc.y"
    {  yyval.t = VT_NAMED; }
    break;

  case 118:
#line 849 "compilers/imcc/imcc.y"
    {  adv_named_set(interp,yyvsp[-1].s); yyval.t = 0; }
    break;

  case 119:
#line 850 "compilers/imcc/imcc.y"
    {  yyval.t = VT_UNIQUE_REG; }
    break;

  case 120:
#line 855 "compilers/imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 121:
#line 856 "compilers/imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 124:
#line 866 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 125:
#line 869 "compilers/imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 126:
#line 870 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 127:
#line 876 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 128:
#line 877 "compilers/imcc/imcc.y"
    {
       if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); 
   }
    break;

  case 129:
#line 880 "compilers/imcc/imcc.y"
    {
       if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); 
   }
    break;

  case 130:
#line 886 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 131:
#line 891 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 132:
#line 896 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 133:
#line 898 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 134:
#line 903 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 135:
#line 907 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 136:
#line 908 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id, yyvsp[0].sr);
          adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr); }
    break;

  case 137:
#line 914 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 138:
#line 916 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id,yyvsp[0].sr);
           adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 139:
#line 922 "compilers/imcc/imcc.y"
    {  
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 142:
#line 941 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 143:
#line 946 "compilers/imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 144:
#line 947 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 145:
#line 948 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 146:
#line 949 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 147:
#line 953 "compilers/imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 151:
#line 963 "compilers/imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 152:
#line 970 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 153:
#line 975 "compilers/imcc/imcc.y"
    {
         IdList* l = yyvsp[0].idlist;
         l->next = NULL;
         yyval.idlist = l;
     }
    break;

  case 154:
#line 982 "compilers/imcc/imcc.y"
    {  
         IdList* l = yyvsp[0].idlist;
         l->next = yyvsp[-2].idlist;
         yyval.idlist = l;
     }
    break;

  case 155:
#line 991 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = yyvsp[-1].s;
         l->unique_reg = 1;
         yyval.idlist = l;
     }
    break;

  case 156:
#line 999 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = yyvsp[0].s;
         l->unique_reg = 0;
         yyval.idlist = l;
     }
    break;

  case 159:
#line 1010 "compilers/imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 160:
#line 1011 "compilers/imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 161:
#line 1012 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 162:
#line 1013 "compilers/imcc/imcc.y"
    {
         IdList* l = yyvsp[0].idlist;
         while(l) {
             IdList* l1;
             if (l->unique_reg)
                 mk_ident_ur(interp, l->id, yyvsp[-1].t);
             else
                 mk_ident(interp, l->id, yyvsp[-1].t);
             l1 = l;
             l = l->next;
             free(l1);
         }
         is_def=0; yyval.i=0;
     }
    break;

  case 163:
#line 1028 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, yyvsp[0].sr, yyvsp[-2].s); yyval.i = 0;
                    }
    break;

  case 164:
#line 1031 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 165:
#line 1032 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 167:
#line 1034 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 168:
#line 1035 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 169:
#line 1036 "compilers/imcc/imcc.y"
    { yyval.i = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 170:
#line 1040 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 171:
#line 1042 "compilers/imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 172:
#line 1045 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 173:
#line 1046 "compilers/imcc/imcc.y"
    {  yyval.i = 0; cur_call = NULL; }
    break;

  case 174:
#line 1047 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 176:
#line 1049 "compilers/imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 177:
#line 1053 "compilers/imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 178:
#line 1054 "compilers/imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 179:
#line 1055 "compilers/imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 180:
#line 1056 "compilers/imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 181:
#line 1057 "compilers/imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 182:
#line 1058 "compilers/imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 183:
#line 1063 "compilers/imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 184:
#line 1073 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 185:
#line 1074 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 186:
#line 1075 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 187:
#line 1076 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 188:
#line 1077 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 189:
#line 1078 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 190:
#line 1079 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 191:
#line 1080 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 192:
#line 1081 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 193:
#line 1082 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 1083 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 195:
#line 1084 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 196:
#line 1085 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "iseq", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 1086 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isne", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 1087 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isgt", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 1088 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "islt", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 1089 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isle", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 1090 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isge", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 1092 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 1094 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 1096 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 1098 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 1100 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 1102 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 208:
#line 1104 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 1106 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 210:
#line 1108 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 211:
#line 1110 "compilers/imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 212:
#line 1112 "compilers/imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 213:
#line 1114 "compilers/imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 214:
#line 1116 "compilers/imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 215:
#line 1118 "compilers/imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 216:
#line 1120 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 1122 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-5].sr, yyvsp[-1].sr); }
    break;

  case 218:
#line 1124 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1126 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 220:
#line 1128 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 221:
#line 1131 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 222:
#line 1133 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 223:
#line 1137 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 1139 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 1141 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 226:
#line 1144 "compilers/imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            cur_call = NULL;
            yyval.i = 0;
         }
    break;

  case 227:
#line 1150 "compilers/imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 228:
#line 1154 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           cur_call = NULL;
         }
    break;

  case 232:
#line 1162 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[-2].sr); }
    break;

  case 233:
#line 1165 "compilers/imcc/imcc.y"
    { yyval.i = IMCC_create_itcall_label(interp);
                           yyval.i->type &= ~ITCALL; yyval.i->type |= ITRESULT; }
    break;

  case 234:
#line 1167 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 235:
#line 1172 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 236:
#line 1174 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 237:
#line 1176 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 238:
#line 1178 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 239:
#line 1180 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 240:
#line 1182 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 241:
#line 1184 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 242:
#line 1186 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 243:
#line 1188 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 244:
#line 1190 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 245:
#line 1192 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 246:
#line 1194 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 247:
#line 1196 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 248:
#line 1201 "compilers/imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 249:
#line 1207 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 250:
#line 1208 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 251:
#line 1209 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 252:
#line 1210 "compilers/imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 253:
#line 1215 "compilers/imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 254:
#line 1216 "compilers/imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 255:
#line 1217 "compilers/imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 256:
#line 1220 "compilers/imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 257:
#line 1221 "compilers/imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 258:
#line 1226 "compilers/imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 259:
#line 1231 "compilers/imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 260:
#line 1235 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 261:
#line 1236 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call, adv_named_id, yyvsp[0].sr);
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, yyvsp[0].sr); 
   }
    break;

  case 262:
#line 1242 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call,adv_named_id,yyvsp[0].sr);
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, yyvsp[0].sr);
   }
    break;

  case 263:
#line 1248 "compilers/imcc/imcc.y"
    { yyval.sr = 0;
                                     add_pcc_named_arg(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 264:
#line 1250 "compilers/imcc/imcc.y"
    { yyval.sr = 0; add_pcc_named_arg(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 265:
#line 1254 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 266:
#line 1258 "compilers/imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 267:
#line 1259 "compilers/imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 268:
#line 1263 "compilers/imcc/imcc.y"
    { yyval.t = VT_FLAT; }
    break;

  case 269:
#line 1264 "compilers/imcc/imcc.y"
    { yyval.t = VT_NAMED; }
    break;

  case 270:
#line 1265 "compilers/imcc/imcc.y"
    { adv_named_set(interp,yyvsp[-1].s); yyval.t = 0; }
    break;

  case 271:
#line 1268 "compilers/imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 272:
#line 1272 "compilers/imcc/imcc.y"
    { 
         yyval.sr = 0;
         if (adv_named_id) {
             add_pcc_named_result(interp,cur_call,adv_named_id,yyvsp[0].sr);
             adv_named_id = NULL;
         } else add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 273:
#line 1278 "compilers/imcc/imcc.y"
    { 
        add_pcc_named_result(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr); }
    break;

  case 274:
#line 1280 "compilers/imcc/imcc.y"
    { 
       yyval.sr = 0;
       if (adv_named_id) {
           add_pcc_named_result(interp,cur_call,adv_named_id,yyvsp[0].sr);
           adv_named_id = NULL;
       } else add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 275:
#line 1286 "compilers/imcc/imcc.y"
    { add_pcc_named_result(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr); }
    break;

  case 276:
#line 1287 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 277:
#line 1292 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 278:
#line 1294 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 279:
#line 1296 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 280:
#line 1298 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 281:
#line 1300 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 282:
#line 1302 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 283:
#line 1304 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 284:
#line 1306 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 285:
#line 1310 "compilers/imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 286:
#line 1311 "compilers/imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 287:
#line 1312 "compilers/imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 288:
#line 1313 "compilers/imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 289:
#line 1314 "compilers/imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 290:
#line 1315 "compilers/imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 293:
#line 1324 "compilers/imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 294:
#line 1325 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 295:
#line 1329 "compilers/imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 297:
#line 1334 "compilers/imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 298:
#line 1336 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 299:
#line 1342 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-1].sr;
                      yyval.sr = yyvsp[-1].sr;
                   }
    break;

  case 301:
#line 1349 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 302:
#line 1350 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 303:
#line 1354 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 304:
#line 1355 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 305:
#line 1359 "compilers/imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 306:
#line 1360 "compilers/imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 311:
#line 1373 "compilers/imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 312:
#line 1374 "compilers/imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 313:
#line 1378 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 314:
#line 1380 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 315:
#line 1381 "compilers/imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 316:
#line 1382 "compilers/imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 317:
#line 1386 "compilers/imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 318:
#line 1392 "compilers/imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 319:
#line 1394 "compilers/imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 320:
#line 1395 "compilers/imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 321:
#line 1399 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 322:
#line 1400 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 323:
#line 1401 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 324:
#line 1402 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 325:
#line 1403 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 326:
#line 1407 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 327:
#line 1408 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 328:
#line 1409 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 329:
#line 1410 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 330:
#line 1414 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 331:
#line 1415 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 991 of yacc.c.  */
#line 3932 "compilers/imcc/imcparser.c"

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
	  YYSIZE_T yysize = 0;
	  int yytype = YYTRANSLATE (yychar);
	  char *yymsg;
	  int yyx, yycount;

	  yycount = 0;
	  /* Start YYX at -YYN if negative to avoid negative indexes in
	     YYCHECK.  */
	  for (yyx = yyn < 0 ? -yyn : 0;
	       yyx < (int) (sizeof (yytname) / sizeof (char *)); yyx++)
	    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	      yysize += yystrlen (yytname[yyx]) + 15, yycount++;
	  yysize += yystrlen ("syntax error, unexpected ") + 1;
	  yysize += yystrlen (yytname[yytype]);
	  yymsg = (char *) YYSTACK_ALLOC (yysize);
	  if (yymsg != 0)
	    {
	      char *yyp = yystpcpy (yymsg, "syntax error, unexpected ");
	      yyp = yystpcpy (yyp, yytname[yytype]);

	      if (yycount < 5)
		{
		  yycount = 0;
		  for (yyx = yyn < 0 ? -yyn : 0;
		       yyx < (int) (sizeof (yytname) / sizeof (char *));
		       yyx++)
		    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
		      {
			const char *yyq = ! yycount ? ", expecting " : " or ";
			yyp = yystpcpy (yyp, yyq);
			yyp = yystpcpy (yyp, yytname[yyx]);
			yycount++;
		      }
		}
	      yyerror (interp, yymsg);
	      YYSTACK_FREE (yymsg);
	    }
	  else
	    yyerror (interp, "syntax error; also virtual memory exhausted");
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror (interp, "syntax error");
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      /* Return failure if at end of input.  */
      if (yychar == YYEOF)
        {
	  /* Pop the error token.  */
          YYPOPSTACK;
	  /* Pop the rest of the stack.  */
	  while (yyss < yyssp)
	    {
	      YYDSYMPRINTF ("Error: popping", yystos[*yyssp], yyvsp, yylsp);
	      yydestruct (yystos[*yyssp], yyvsp);
	      YYPOPSTACK;
	    }
	  YYABORT;
        }

      YYDSYMPRINTF ("Error: discarding", yytoken, &yylval, &yylloc);
      yydestruct (yytoken, &yylval);
      yychar = YYEMPTY;

    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab2;


/*----------------------------------------------------.
| yyerrlab1 -- error raised explicitly by an action.  |
`----------------------------------------------------*/
yyerrlab1:

  /* Suppress GCC warning that yyerrlab1 is unused when no action
     invokes YYERROR.  */
#if defined (__GNUC_MINOR__) && 2093 <= (__GNUC__ * 1000 + __GNUC_MINOR__) \
    && !defined __cplusplus
  __attribute__ ((__unused__))
#endif


  goto yyerrlab2;


/*---------------------------------------------------------------.
| yyerrlab2 -- pop states until the error token can be shifted.  |
`---------------------------------------------------------------*/
yyerrlab2:
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

      YYDSYMPRINTF ("Error: popping", yystos[*yyssp], yyvsp, yylsp);
      yydestruct (yystos[yystate], yyvsp);
      yyvsp--;
      yystate = *--yyssp;

      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  YYDPRINTF ((stderr, "Shifting error token, "));

  *++yyvsp = yylval;


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
/*----------------------------------------------.
| yyoverflowlab -- parser overflow comes here.  |
`----------------------------------------------*/
yyoverflowlab:
  yyerror (interp, "parser stack overflow");
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  return yyresult;
}


#line 1420 "compilers/imcc/imcc.y"



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

