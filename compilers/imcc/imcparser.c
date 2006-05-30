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
#define YYLAST   750

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  133
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  115
/* YYNRULES -- Number of rules. */
#define YYNRULES  328
/* YYNRULES -- Number of states. */
#define YYNSTATES  573

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
     202,   204,   205,   207,   208,   209,   210,   221,   222,   232,
     233,   236,   237,   241,   242,   244,   246,   250,   252,   254,
     256,   258,   260,   262,   264,   266,   268,   274,   278,   282,
     286,   290,   296,   302,   303,   307,   310,   311,   315,   319,
     320,   325,   326,   329,   331,   333,   335,   337,   342,   344,
     346,   348,   350,   352,   353,   359,   361,   362,   365,   369,
     373,   374,   380,   381,   387,   388,   390,   394,   398,   404,
     406,   409,   410,   413,   416,   418,   420,   421,   423,   426,
     428,   430,   434,   436,   440,   443,   445,   447,   449,   452,
     455,   456,   461,   466,   467,   474,   476,   477,   484,   487,
     490,   493,   496,   498,   500,   502,   503,   505,   507,   509,
     511,   513,   515,   517,   521,   526,   531,   536,   542,   548,
     554,   560,   566,   572,   578,   584,   590,   596,   602,   608,
     614,   620,   626,   632,   638,   644,   650,   656,   662,   668,
     674,   681,   688,   695,   703,   708,   713,   720,   727,   735,
     740,   745,   750,   755,   762,   770,   774,   775,   785,   787,
     789,   791,   795,   796,   802,   806,   810,   814,   818,   822,
     826,   830,   834,   838,   842,   846,   850,   854,   859,   861,
     863,   865,   869,   873,   877,   879,   881,   882,   888,   889,
     893,   895,   901,   905,   908,   909,   912,   914,   916,   921,
     924,   928,   934,   936,   940,   941,   948,   955,   961,   967,
     972,   977,   982,   987,   989,   991,   993,   995,   997,   999,
    1001,  1003,  1004,  1006,  1010,  1012,  1014,  1019,  1023,  1025,
    1027,  1029,  1031,  1033,  1035,  1037,  1039,  1041,  1043,  1044,
    1047,  1049,  1053,  1054,  1059,  1061,  1065,  1068,  1071,  1073,
    1075,  1077,  1079,  1081,  1083,  1085,  1087,  1089,  1091
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
     103,    -1,   107,    -1,    -1,   198,    -1,    -1,    -1,    -1,
      78,   170,   103,   171,   177,     4,   172,   159,   168,    73,
      -1,    -1,    75,     4,   174,   181,   176,   180,   175,   183,
      76,    -1,    -1,   203,     4,    -1,    -1,    85,   239,     4,
      -1,    -1,   178,    -1,   179,    -1,   178,   163,   179,    -1,
      87,    -1,    86,    -1,    88,    -1,    89,    -1,    91,    -1,
      90,    -1,    93,    -1,   164,    -1,   165,    -1,    77,   239,
      72,   239,     4,    -1,    77,   239,     4,    -1,    83,   239,
       4,    -1,    84,   231,     4,    -1,    84,   107,     4,    -1,
      84,   231,    72,   239,     4,    -1,    84,   107,    72,   239,
       4,    -1,    -1,   181,   182,     4,    -1,    11,   224,    -1,
      -1,   183,   184,     4,    -1,    64,   231,   186,    -1,    -1,
      27,   185,   211,   206,    -1,    -1,   186,   187,    -1,    16,
      -1,    17,    -1,    18,    -1,    19,    -1,    19,   121,   107,
     122,    -1,    95,    -1,    79,    -1,    81,    -1,    80,    -1,
      82,    -1,    -1,   188,     4,   191,   192,   189,    -1,   194,
      -1,    -1,   192,     4,    -1,   192,   193,     4,    -1,    65,
     239,   225,    -1,    -1,    65,   121,   195,   197,   122,    -1,
      -1,    66,   121,   196,   197,   122,    -1,    -1,   224,    -1,
     107,    20,   239,    -1,   197,    72,   224,    -1,   197,    72,
     107,    20,   239,    -1,   200,    -1,   198,   200,    -1,    -1,
     199,   204,    -1,   105,     4,    -1,   114,    -1,   113,    -1,
      -1,   202,    -1,   202,   203,    -1,   203,    -1,    96,    -1,
     201,   207,     4,    -1,   206,    -1,   205,    72,   206,    -1,
     103,    95,    -1,   103,    -1,   213,    -1,   229,    -1,    22,
     103,    -1,    23,   103,    -1,    -1,    27,   208,   211,   205,
      -1,    28,   107,    72,   231,    -1,    -1,    29,   209,   211,
     103,   118,   246,    -1,   143,    -1,    -1,    32,   210,   211,
     103,   118,   246,    -1,    65,   221,    -1,    10,   237,    -1,
     111,   232,    -1,    14,   239,    -1,   221,    -1,   173,    -1,
     190,    -1,    -1,    49,    -1,    50,    -1,    51,    -1,    52,
      -1,    53,    -1,   212,    -1,   103,    -1,   231,   118,   239,
      -1,   231,   118,   123,   239,    -1,   231,   118,   124,   239,
      -1,   231,   118,   125,   239,    -1,   231,   118,   239,   126,
     239,    -1,   231,   118,   239,   124,   239,    -1,   231,   118,
     239,   127,   239,    -1,   231,   118,   239,    68,   239,    -1,
     231,   118,   239,   128,   239,    -1,   231,   118,   239,    41,
     239,    -1,   231,   118,   239,   129,   239,    -1,   231,   118,
     239,   116,   239,    -1,   231,   118,   239,    55,   239,    -1,
     231,   118,   239,    56,   239,    -1,   231,   118,   239,    57,
     239,    -1,   231,   118,   239,    59,   239,    -1,   231,   118,
     239,    60,   239,    -1,   231,   118,   239,    58,   239,    -1,
     231,   118,   239,    47,   239,    -1,   231,   118,   239,    48,
     239,    -1,   231,   118,   239,    69,   239,    -1,   231,   118,
     239,    70,   239,    -1,   231,   118,   239,    71,   239,    -1,
     231,   118,   239,    54,   239,    -1,   231,   118,   239,   130,
     239,    -1,   231,   118,   239,   131,   239,    -1,   231,   118,
     239,   125,   239,    -1,   231,   118,   239,   119,   240,   120,
      -1,   231,   119,   240,   120,   118,   239,    -1,   231,   118,
      21,   212,    72,   239,    -1,   231,   118,    21,   212,   119,
     240,   120,    -1,   231,   118,    21,   212,    -1,   231,   118,
      21,   239,    -1,   231,   118,    21,   119,   240,   120,    -1,
     231,   118,    21,   239,    72,   239,    -1,   231,   118,    21,
     239,   119,   240,   120,    -1,   231,   118,    63,   103,    -1,
     231,   118,    62,   247,    -1,    62,   247,   118,   239,    -1,
      21,   231,    72,   239,    -1,    21,   231,    72,   239,    72,
     239,    -1,    21,   231,    72,   239,   119,   240,   120,    -1,
     231,   118,   221,    -1,    -1,   121,   214,   228,   122,   118,
     219,   121,   223,   122,    -1,   215,    -1,   217,    -1,   218,
      -1,   231,   118,    14,    -1,    -1,    67,   216,   121,   228,
     122,    -1,   231,    33,   239,    -1,   231,    34,   239,    -1,
     231,    35,   239,    -1,   231,    36,   239,    -1,   231,    43,
     239,    -1,   231,    42,   239,    -1,   231,    37,   239,    -1,
     231,    38,   239,    -1,   231,    39,   239,    -1,   231,    40,
     239,    -1,   231,    44,   239,    -1,   231,    45,   239,    -1,
     231,    46,   239,    -1,   231,   118,   111,   150,    -1,   103,
      -1,   107,    -1,   231,    -1,   231,   220,   236,    -1,   231,
     220,   107,    -1,   231,   220,   231,    -1,   117,    -1,   115,
      -1,    -1,   219,   222,   121,   223,   122,    -1,    -1,   223,
      72,   224,    -1,   224,    -1,   223,    72,   107,    20,   239,
      -1,   107,    20,   239,    -1,   239,   225,    -1,    -1,   225,
     226,    -1,    15,    -1,    19,    -1,    19,   121,   107,   122,
      -1,   231,   186,    -1,   228,    72,   227,    -1,   228,    72,
     107,    20,   231,    -1,   227,    -1,   107,    20,   231,    -1,
      -1,    12,   239,   230,   239,    10,   237,    -1,    13,   239,
     230,   239,    10,   237,    -1,    12,    14,   239,    10,   237,
      -1,    13,    14,   239,    10,   237,    -1,    12,   239,    10,
     237,    -1,    13,   239,    10,   237,    -1,    12,   239,    72,
     237,    -1,    13,   239,    72,   237,    -1,    55,    -1,    56,
      -1,    57,    -1,    58,    -1,    59,    -1,    60,    -1,   112,
      -1,   245,    -1,    -1,   233,    -1,   233,    72,   234,    -1,
     234,    -1,   238,    -1,   231,   119,   240,   120,    -1,   119,
     240,   120,    -1,   236,    -1,   107,    -1,   103,    -1,   111,
      -1,   103,    -1,   111,    -1,   237,    -1,   239,    -1,   231,
      -1,   246,    -1,    -1,   241,   242,    -1,   244,    -1,   242,
     132,   244,    -1,    -1,   242,    72,   243,   244,    -1,   239,
      -1,   239,    74,   239,    -1,    74,   239,    -1,   239,    74,
      -1,    99,    -1,   100,    -1,   101,    -1,   102,    -1,   104,
      -1,   108,    -1,   109,    -1,   107,    -1,   110,    -1,   101,
      -1,   107,    -1
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
     687,   699,   701,   705,   707,   711,   705,   718,   717,   749,
     750,   754,   755,   760,   761,   765,   766,   770,   771,   772,
     773,   774,   775,   776,   777,   778,   782,   787,   789,   794,
     796,   798,   802,   810,   811,   815,   820,   821,   825,   826,
     826,   839,   840,   844,   845,   846,   847,   848,   849,   854,
     855,   859,   860,   865,   864,   869,   875,   876,   879,   885,
     890,   889,   897,   896,   906,   907,   913,   915,   921,   927,
     928,   940,   944,   946,   947,   948,   952,   953,   957,   958,
     962,   968,   973,   980,   989,   997,  1007,  1008,  1009,  1010,
    1011,  1011,  1026,  1030,  1030,  1032,  1033,  1033,  1035,  1039,
    1040,  1043,  1045,  1046,  1047,  1048,  1052,  1053,  1054,  1055,
    1056,  1057,  1061,  1072,  1073,  1074,  1075,  1076,  1077,  1078,
    1079,  1080,  1081,  1082,  1083,  1084,  1085,  1086,  1087,  1088,
    1089,  1090,  1092,  1094,  1096,  1098,  1100,  1102,  1104,  1106,
    1108,  1110,  1112,  1114,  1116,  1118,  1120,  1122,  1124,  1126,
    1129,  1131,  1135,  1137,  1139,  1142,  1149,  1148,  1157,  1158,
    1159,  1160,  1164,  1164,  1170,  1172,  1174,  1176,  1178,  1180,
    1182,  1184,  1186,  1188,  1190,  1192,  1194,  1199,  1206,  1207,
    1208,  1213,  1214,  1215,  1218,  1219,  1224,  1223,  1233,  1234,
    1240,  1246,  1248,  1252,  1256,  1257,  1261,  1262,  1263,  1266,
    1270,  1276,  1278,  1284,  1285,  1289,  1291,  1293,  1295,  1297,
    1299,  1301,  1303,  1308,  1309,  1310,  1311,  1312,  1313,  1317,
    1318,  1322,  1323,  1327,  1328,  1332,  1333,  1339,  1346,  1347,
    1351,  1352,  1356,  1357,  1361,  1362,  1366,  1367,  1370,  1370,
    1375,  1376,  1378,  1378,  1383,  1388,  1391,  1392,  1396,  1397,
    1398,  1399,  1400,  1404,  1405,  1406,  1407,  1411,  1412
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
     167,   168,   168,   170,   171,   172,   169,   174,   173,   175,
     175,   176,   176,   177,   177,   178,   178,   179,   179,   179,
     179,   179,   179,   179,   179,   179,   180,   180,   180,   180,
     180,   180,   180,   181,   181,   182,   183,   183,   184,   185,
     184,   186,   186,   187,   187,   187,   187,   187,   187,   188,
     188,   189,   189,   191,   190,   190,   192,   192,   192,   193,
     195,   194,   196,   194,   197,   197,   197,   197,   197,   198,
     198,   199,   200,   200,   200,   200,   201,   201,   202,   202,
     203,   204,   205,   205,   206,   206,   207,   207,   207,   207,
     208,   207,   207,   209,   207,   207,   210,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   211,   211,   211,   211,
     211,   211,   212,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   214,   213,   213,   213,
     213,   213,   216,   215,   217,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   217,   218,   219,   219,
     219,   219,   219,   219,   220,   220,   222,   221,   223,   223,
     223,   223,   223,   224,   225,   225,   226,   226,   226,   227,
     228,   228,   228,   228,   228,   229,   229,   229,   229,   229,
     229,   229,   229,   230,   230,   230,   230,   230,   230,   231,
     231,   232,   232,   233,   233,   234,   234,   234,   235,   235,
     236,   236,   237,   237,   238,   238,   239,   239,   241,   240,
     242,   242,   243,   242,   244,   244,   244,   244,   245,   245,
     245,   245,   245,   246,   246,   246,   246,   247,   247
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
       1,     0,     1,     0,     0,     0,    10,     0,     9,     0,
       2,     0,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     5,     3,     3,     3,
       3,     5,     5,     0,     3,     2,     0,     3,     3,     0,
       4,     0,     2,     1,     1,     1,     1,     4,     1,     1,
       1,     1,     1,     0,     5,     1,     0,     2,     3,     3,
       0,     5,     0,     5,     0,     1,     3,     3,     5,     1,
       2,     0,     2,     2,     1,     1,     0,     1,     2,     1,
       1,     3,     1,     3,     2,     1,     1,     1,     2,     2,
       0,     4,     4,     0,     6,     1,     0,     6,     2,     2,
       2,     2,     1,     1,     1,     0,     1,     1,     1,     1,
       1,     1,     1,     3,     4,     4,     4,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       6,     6,     6,     7,     4,     4,     6,     6,     7,     4,
       4,     4,     4,     6,     7,     3,     0,     9,     1,     1,
       1,     3,     0,     5,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     4,     1,     1,
       1,     3,     3,     3,     1,     1,     0,     5,     0,     3,
       1,     5,     3,     2,     0,     2,     1,     1,     4,     2,
       3,     5,     1,     3,     0,     6,     6,     5,     5,     4,
       4,     4,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     0,     1,     3,     1,     1,     4,     3,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     0,     2,
       1,     3,     0,     4,     1,     3,     2,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,     0,     0,    46,    21,     0,    73,
      41,     0,     0,     2,     3,    12,     0,     7,     6,    10,
       5,     8,     9,     0,     0,     0,     0,   308,     0,     0,
     176,   177,   178,   179,   180,   182,     0,   181,     0,   146,
      11,     1,     4,    15,    16,    14,     0,     0,     0,     0,
     300,   299,   301,    47,   298,     0,    19,    74,    23,   150,
       0,    30,    29,    32,   146,    25,     0,    31,    33,   147,
     149,    17,    18,    45,     0,   318,   319,   320,   321,   322,
     325,   323,   324,   326,   289,   306,   314,   309,   310,   290,
     307,    83,     0,     0,    83,     0,    28,    26,    42,     0,
       0,    35,     0,     0,   148,   316,   317,   312,     0,    88,
      87,    89,    90,    92,    91,     0,    93,     0,    94,    95,
       0,    57,    85,     0,    20,     0,     0,    37,     0,    83,
      27,   291,   315,     0,   311,     0,    62,    48,    58,     0,
      22,    75,   302,   303,   304,     0,   305,     0,     0,   308,
      34,   306,    40,   292,   294,   295,   313,     0,     0,    65,
      66,    68,    67,    69,    70,     0,    64,    50,    86,    50,
       0,    38,    36,     0,   308,     0,    61,    60,     0,    59,
      51,   141,   141,    24,   297,     0,   293,    63,    53,     0,
     145,   144,     0,     0,   141,   146,   139,     0,   296,     0,
     143,    52,    49,   140,   175,   142,    76,    54,     0,     0,
       0,     0,     0,     0,     0,     0,   160,     0,   163,   166,
       0,     0,     0,   232,     0,   119,   120,   248,   249,   291,
     226,   165,   173,     0,   174,   125,     0,   156,   228,   229,
     230,   256,   172,   157,   250,   111,     0,   169,     0,     0,
       0,     0,   171,     0,   158,   159,     0,     0,     0,     0,
     327,   328,     0,   130,   168,   250,   132,     0,    77,   170,
     274,   123,   151,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   255,   254,     0,
     308,     0,    55,     0,     0,     0,   283,   284,   285,   286,
     287,   288,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   134,   134,   274,   103,     0,   272,
       0,   111,   126,   258,   234,   235,   236,   237,   240,   241,
     242,   243,   239,   238,   244,   245,   246,   231,     0,     0,
       0,   325,   291,     0,     0,     0,   225,   306,   183,     0,
     252,   253,   251,   113,   114,   115,   116,   118,   112,   111,
       0,   279,   281,     0,     0,   280,   282,     0,   222,   155,
     161,   152,   162,     0,     0,   221,   325,     0,   135,   264,
       0,     0,    81,     0,     0,     0,   269,     0,   325,     0,
     260,   308,   214,   215,   220,   219,   247,   184,   185,   186,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   308,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    56,   277,     0,   278,
       0,     0,   308,   154,     0,     0,     0,     0,     0,   131,
     263,   133,   233,     0,     0,     0,     0,   273,     0,   270,
       0,   127,     0,   121,   122,   124,     0,     0,     0,   257,
       0,     0,   308,     0,   308,   192,   201,   202,   206,   195,
     196,   197,   200,   198,   199,   190,   203,   204,   205,   194,
       0,   188,   209,   187,   189,   191,   193,   207,   208,     0,
       0,   275,   276,   223,     0,   153,   164,   167,   136,   325,
     137,   266,   267,   265,   105,     0,     0,     0,     0,    79,
     104,     0,     0,   264,   128,   262,   325,   259,   216,   212,
       0,   217,     0,   210,   211,   117,   224,     0,     0,    82,
       0,     0,     0,     0,   106,     0,   271,   258,   129,     0,
     213,   218,   138,     0,    97,     0,    98,   100,     0,    99,
       0,     0,    80,     0,   261,   268,     0,     0,     0,   109,
       0,    78,     0,   227,    96,   102,   101,     0,   111,   107,
       0,   108,   110
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    12,    13,    14,    15,    24,    16,    17,    18,    29,
      63,    95,    64,    65,   102,   103,   129,   150,    19,    39,
      66,    20,    21,    28,    91,   167,   181,   192,   199,   207,
     139,   118,   119,   165,   166,   193,    22,    38,    94,   169,
     232,   317,   534,   445,   120,   121,   122,   509,   382,   446,
     551,   562,   567,   292,   358,   233,   455,   234,   322,   387,
     456,   235,   314,   315,   377,   194,   195,   196,    68,    69,
      70,   205,   370,   371,   236,   256,   258,   259,    36,    37,
     237,   270,   238,   267,   239,   240,   241,   291,   242,   273,
     389,   378,   440,   503,   319,   320,   243,   303,    85,   152,
     153,   154,    53,    54,   144,   155,   379,    48,    49,    87,
     133,    88,    89,    90,   262
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -426
static const short yypact[] =
{
     188,  -426,    33,   -82,   -67,   -66,  -426,  -426,   238,  -426,
    -426,    50,    57,   188,  -426,  -426,    74,  -426,  -426,  -426,
    -426,  -426,  -426,     6,   120,    67,    79,  -426,   -56,   238,
    -426,  -426,  -426,  -426,  -426,  -426,    49,  -426,    84,    42,
    -426,  -426,  -426,  -426,  -426,  -426,    81,    83,    40,   298,
    -426,  -426,  -426,  -426,  -426,    90,    77,  -426,  -426,  -426,
     194,  -426,  -426,  -426,    52,  -426,   110,  -426,    38,   113,
    -426,  -426,  -426,  -426,   545,  -426,  -426,  -426,  -426,  -426,
    -426,  -426,  -426,  -426,  -426,  -426,   132,   -59,  -426,  -426,
    -426,   260,    93,   212,   260,   104,  -426,  -426,  -426,   545,
     107,  -426,   214,   114,  -426,  -426,   545,  -426,   298,  -426,
    -426,  -426,  -426,  -426,  -426,   103,  -426,   105,  -426,  -426,
     243,    15,  -426,   212,  -426,   247,   518,  -426,   181,   260,
    -426,   472,  -426,   298,  -426,   -80,   171,  -426,  -426,   260,
    -426,  -426,  -426,  -426,  -426,   136,  -426,   151,   162,  -426,
    -426,   140,  -426,   189,  -426,  -426,  -426,   141,   145,  -426,
    -426,  -426,  -426,  -426,  -426,   -54,  -426,   258,  -426,   258,
     161,  -426,  -426,   152,  -426,   472,  -426,  -426,   171,  -426,
    -426,    28,    28,  -426,  -426,   153,  -426,  -426,  -426,   267,
    -426,  -426,   271,   203,    58,   113,  -426,   204,  -426,   238,
    -426,  -426,  -426,  -426,   416,  -426,  -426,  -426,   -77,   -42,
     205,   230,   545,   180,   191,   193,  -426,   176,   190,  -426,
     -57,   350,   182,  -426,   293,  -426,  -426,  -426,  -426,   472,
    -426,  -426,  -426,   304,  -426,  -426,   306,  -426,  -426,  -426,
    -426,  -426,  -426,  -426,   524,  -426,   291,  -426,   545,   118,
     545,   144,  -426,   252,  -426,  -426,   238,   253,   238,   238,
    -426,  -426,   208,  -426,  -426,    44,  -426,   206,  -426,  -426,
     399,  -426,  -426,   207,   545,   545,   545,   545,   545,   545,
     545,   545,   545,   545,   545,   545,   545,  -426,  -426,    -4,
    -426,   615,    18,   232,   323,   -42,  -426,  -426,  -426,  -426,
    -426,  -426,   -42,   545,   326,   -42,   -42,   545,   545,   240,
     180,   279,   280,   545,   559,   559,   399,  -426,   335,  -426,
     -52,  -426,  -426,   573,  -426,  -426,  -426,  -426,  -426,  -426,
    -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,   486,   -57,
     282,   235,   472,   545,   545,   545,  -426,    64,   485,   266,
    -426,  -426,  -426,  -426,  -426,  -426,   268,  -426,  -426,  -426,
     -42,  -426,  -426,   377,   -42,  -426,  -426,   380,   -34,   296,
     320,  -426,  -426,   275,   277,  -426,   376,   -50,  -426,  -426,
     -33,   -12,    -3,   180,   629,   285,    18,    11,   384,   -10,
    -426,  -426,   -27,    63,  -426,  -426,  -426,  -426,  -426,  -426,
     545,   545,   545,   545,   545,   545,   545,   545,   545,   545,
     545,   545,   545,   545,   545,  -426,   545,   545,   545,   545,
     545,   545,   545,   545,   294,   308,    18,  -426,   -42,  -426,
     -42,   545,  -426,  -426,   240,   212,   212,   545,   587,  -426,
     108,  -426,  -426,   545,   545,    53,   407,  -426,   393,  -426,
     373,  -426,   545,  -426,  -426,  -426,   412,   545,   601,  -426,
     297,   545,  -426,   545,  -426,  -426,  -426,  -426,  -426,  -426,
    -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,
     299,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,   545,
     300,  -426,  -426,  -426,   301,  -426,  -426,  -426,  -426,   403,
    -426,  -426,   303,  -426,  -426,   421,   545,   545,   638,   113,
    -426,   180,   310,  -426,  -426,  -426,   414,  -426,  -426,  -426,
     307,  -426,   312,  -426,  -426,  -426,  -426,   545,   328,  -426,
       3,   432,     7,     8,  -426,   436,  -426,   573,   108,   545,
    -426,  -426,  -426,   325,  -426,   545,  -426,  -426,   545,  -426,
     545,    82,  -426,    -5,  -426,  -426,   438,   451,   452,  -426,
     180,  -426,   454,  -426,  -426,  -426,  -426,   238,  -426,  -426,
     240,    18,  -426
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -426,  -426,  -426,   446,  -426,  -426,  -426,  -426,  -426,  -426,
     256,  -426,  -426,   397,  -426,  -426,  -426,   123,  -426,  -426,
    -426,   -18,  -426,  -426,  -426,  -426,   317,  -426,  -426,  -426,
    -426,  -426,  -426,  -426,   288,   286,  -426,  -426,  -426,  -426,
    -426,  -426,  -426,  -426,    24,  -426,   330,  -426,  -426,  -426,
    -426,  -426,  -426,  -316,  -426,  -426,  -426,  -426,  -426,  -426,
    -426,  -426,  -426,  -426,   155,  -426,  -426,   273,   284,  -426,
     -68,  -426,  -426,  -425,  -426,  -426,  -426,  -426,   -29,   149,
    -426,  -426,  -426,  -426,  -426,  -426,    39,  -426,  -205,  -426,
     -49,  -309,   -23,  -426,   109,   178,  -426,   241,  -127,   281,
    -426,   329,  -426,   217,  -180,   383,   -43,  -146,  -426,  -426,
    -426,   -84,  -426,   -91,   173
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -251
static const short yytable[] =
{
      55,   104,   124,   173,   151,   386,    86,   544,   443,   495,
     337,   547,   549,   107,   390,   451,   264,   338,   178,   -84,
     384,    67,   438,   157,   134,    25,   245,   158,   185,   247,
     246,   105,   140,   188,   353,   354,   355,   356,   431,   438,
      23,    26,   -39,   426,   260,   461,    67,    50,   151,   156,
     261,    51,    99,    27,    40,    52,   127,    41,   339,   340,
     384,   142,   458,   132,     5,    86,   100,   458,   179,   143,
     385,    58,   439,   108,     5,   545,   452,   244,    43,   548,
     550,    58,   444,   146,   346,   432,   253,   138,   146,   441,
      86,   453,   462,   454,   265,    75,    76,    77,    78,   227,
      79,   -71,   151,   341,    81,    82,    83,   342,    84,   559,
     442,   -84,   459,   357,    44,   361,   101,   563,   125,   343,
     344,   345,   362,   501,    45,   365,   366,   502,   295,   500,
     506,   -72,   146,   189,   504,   463,   507,   508,    59,    46,
     -43,   190,   191,   321,   349,   572,   560,    60,    59,   517,
     -44,    47,    56,   148,   305,    61,    62,    60,   561,   287,
      73,   288,   347,   189,   351,    61,    62,   249,   251,   252,
     208,   190,   191,   296,   297,   298,   299,   300,   301,   287,
     427,   288,   464,   372,   429,  -250,   146,    57,    71,   321,
     302,    72,     1,    92,     2,    93,     3,     4,    96,   296,
     297,   298,   299,   300,   301,   294,   106,   304,    98,    59,
       5,   123,   126,     6,   128,   151,   306,     7,   130,   248,
     159,   160,   161,   162,   135,   131,   136,   309,   390,   311,
     312,   324,   325,   326,   327,   328,   329,   330,   331,   332,
     333,   334,   335,   336,   250,   460,   348,   137,   491,     8,
     492,   141,   571,   147,   170,   171,   447,   321,   172,   174,
     363,   175,   180,   176,   367,   368,     9,   177,   183,   480,
     375,   200,   184,   198,   163,   201,   202,   206,   164,    75,
      76,    77,    78,   257,    79,    10,   494,    30,    31,    32,
      33,    34,    84,    11,   254,   393,   255,   268,   -23,   146,
     397,   398,   399,   266,    75,    76,    77,    78,   271,    79,
     272,   293,    80,    81,    82,    83,   520,    84,   522,    80,
      81,    82,    83,   265,   308,   310,   313,   316,   323,    75,
      76,    77,    78,   360,    79,   359,   364,    80,    81,    82,
      83,    35,    84,   369,   496,   497,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   383,  -249,   465,   466,   467,
     468,   469,   470,   471,   472,   473,   474,   475,   476,   477,
     478,   479,    74,   481,   482,   483,   484,   485,   486,   487,
     488,   533,   373,   374,   536,   395,   424,   428,   493,   425,
     430,   433,   434,   435,   498,   436,   437,    75,    76,    77,
      78,   505,    79,   450,   457,    80,    81,    82,    83,   513,
      84,   510,   489,   511,   515,   490,   514,   518,   519,   523,
     521,   526,   525,   527,   528,   529,   209,   540,   210,   211,
     212,   537,   541,   568,   539,   543,   546,   213,   214,   215,
     552,   535,   564,   216,   217,   218,   524,   555,   219,    75,
      76,    77,    78,   227,    79,   565,   566,   228,   569,    42,
     231,    97,    84,   530,   531,   396,   187,   203,   197,   168,
     380,   263,    75,    76,    77,    78,   227,    79,   220,   204,
     228,   221,   222,   223,   542,    84,   182,   392,   553,   512,
     538,   224,   307,   449,   381,   225,   554,   226,    75,    76,
      77,    78,   556,    79,   186,   557,   318,   558,   352,   145,
     269,    84,   394,     0,     0,    75,    76,    77,    78,   227,
      79,     0,     0,   228,     0,     0,   400,   229,    84,     0,
       0,     0,   401,   402,     0,     0,     0,   230,   570,   403,
     404,   405,   406,   407,   408,   409,     0,     0,     0,     0,
       0,     0,     0,   410,   411,   412,   413,   274,   275,   276,
     277,   278,   279,   280,   281,     0,   282,   283,   284,   285,
     286,    75,    76,    77,    78,   142,    79,     0,     0,    80,
      81,    82,    83,   143,    84,    75,    76,    77,    78,    35,
      79,   149,     0,    80,    81,    82,    83,     0,    84,     0,
       0,   414,     0,     0,   415,   391,     0,     0,     0,   416,
     417,   418,   419,   420,   421,   422,   423,    75,    76,    77,
      78,   142,    79,     0,     0,    80,    81,    82,    83,   143,
      84,     0,     0,     0,     0,     0,     0,     0,     0,   287,
       0,   288,   289,   290,    75,    76,    77,    78,     0,    79,
       0,     0,    80,    81,    82,    83,     0,    84,    75,    76,
      77,    78,     0,    79,     0,     0,   376,    81,    82,    83,
       0,    84,    75,    76,    77,    78,     0,    79,     0,     0,
     388,    81,    82,    83,     0,    84,    75,    76,    77,    78,
       0,    79,     0,     0,   499,    81,    82,    83,     0,    84,
      75,    76,    77,    78,     0,    79,     0,     0,   516,    81,
      82,    83,     0,    84,    75,    76,    77,    78,    50,    79,
       0,     0,   350,     0,     0,     0,    52,    84,    75,    76,
      77,    78,     0,    79,     0,     0,   448,    75,    76,    77,
      78,    84,    79,     0,     0,   532,     0,     0,     0,     0,
      84
};

static const short yycheck[] =
{
      29,    69,    93,   149,   131,   321,    49,     4,    11,   434,
      14,     4,     4,    72,   323,     4,   221,    21,    72,     4,
      72,    39,    72,   103,   108,   107,   103,   107,   174,   209,
     107,    74,   123,     5,    16,    17,    18,    19,    72,    72,
       7,   108,     4,   359,   101,    72,    64,   103,   175,   133,
     107,   107,    14,   119,     4,   111,    99,     0,    62,    63,
      72,   103,    72,   106,    22,   108,    28,    72,   122,   111,
     122,    29,   122,   132,    22,    72,    65,   204,     4,    72,
      72,    29,    85,   126,   289,   119,   213,    72,   131,   122,
     133,    80,   119,    82,   221,    99,   100,   101,   102,   103,
     104,    73,   229,   107,   108,   109,   110,   111,   112,    27,
     122,    96,   122,    95,   108,   295,    78,   122,    94,   123,
     124,   125,   302,    15,     4,   305,   306,    19,    10,   438,
      77,    73,   175,   105,   443,    72,    83,    84,    96,    72,
      98,   113,   114,   270,   290,   570,    64,   105,    96,   458,
      98,    72,   103,   129,    10,   113,   114,   105,    76,   115,
     120,   117,   289,   105,   291,   113,   114,   210,   211,   212,
     199,   113,   114,    55,    56,    57,    58,    59,    60,   115,
     360,   117,   119,   310,   364,   121,   229,   103,   107,   316,
      72,   108,     4,   103,     6,   118,     8,     9,     4,    55,
      56,    57,    58,    59,    60,   248,    74,   250,    98,    96,
      22,   118,   108,    25,   107,   342,    72,    29,     4,    14,
      49,    50,    51,    52,   121,   111,   121,   256,   537,   258,
     259,   274,   275,   276,   277,   278,   279,   280,   281,   282,
     283,   284,   285,   286,    14,   391,   289,     4,   428,    61,
     430,     4,   568,    72,   118,   104,   383,   384,    96,   119,
     303,    72,     4,   122,   307,   308,    78,   122,   107,   415,
     313,     4,   120,   120,   103,     4,    73,    73,   107,    99,
     100,   101,   102,   107,   104,    97,   432,    49,    50,    51,
      52,    53,   112,   105,   103,   338,   103,     4,   108,   342,
     343,   344,   345,   121,    99,   100,   101,   102,     4,   104,
       4,    20,   107,   108,   109,   110,   462,   112,   464,   107,
     108,   109,   110,   450,    72,    72,   118,   121,   121,    99,
     100,   101,   102,    10,   104,   103,    10,   107,   108,   109,
     110,   103,   112,   103,   435,   436,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    20,   121,   400,   401,   402,
     403,   404,   405,   406,   407,   408,   409,   410,   411,   412,
     413,   414,    74,   416,   417,   418,   419,   420,   421,   422,
     423,   508,   103,   103,   511,   103,   120,    10,   431,   121,
      10,    95,    72,   118,   437,   118,    20,    99,   100,   101,
     102,   444,   104,   118,    20,   107,   108,   109,   110,   452,
     112,     4,   118,    20,   457,   107,     4,   120,   461,   120,
     463,   120,   122,    20,   121,     4,    10,   120,    12,    13,
      14,   121,   120,   560,    20,   107,     4,    21,    22,    23,
       4,   509,     4,    27,    28,    29,   489,   122,    32,    99,
     100,   101,   102,   103,   104,     4,     4,   107,     4,    13,
     204,    64,   112,   506,   507,   342,   178,   194,   182,   139,
     315,   121,    99,   100,   101,   102,   103,   104,    62,   195,
     107,    65,    66,    67,   527,   112,   169,   338,   537,   450,
     513,    75,   251,   384,   316,    79,   539,    81,    99,   100,
     101,   102,   545,   104,   175,   548,   107,   550,   291,   126,
     229,   112,   339,    -1,    -1,    99,   100,   101,   102,   103,
     104,    -1,    -1,   107,    -1,    -1,    41,   111,   112,    -1,
      -1,    -1,    47,    48,    -1,    -1,    -1,   121,   567,    54,
      55,    56,    57,    58,    59,    60,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    69,    70,    71,    33,    34,    35,
      36,    37,    38,    39,    40,    -1,    42,    43,    44,    45,
      46,    99,   100,   101,   102,   103,   104,    -1,    -1,   107,
     108,   109,   110,   111,   112,    99,   100,   101,   102,   103,
     104,   119,    -1,   107,   108,   109,   110,    -1,   112,    -1,
      -1,   116,    -1,    -1,   119,   119,    -1,    -1,    -1,   124,
     125,   126,   127,   128,   129,   130,   131,    99,   100,   101,
     102,   103,   104,    -1,    -1,   107,   108,   109,   110,   111,
     112,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   115,
      -1,   117,   118,   119,    99,   100,   101,   102,    -1,   104,
      -1,    -1,   107,   108,   109,   110,    -1,   112,    99,   100,
     101,   102,    -1,   104,    -1,    -1,   107,   108,   109,   110,
      -1,   112,    99,   100,   101,   102,    -1,   104,    -1,    -1,
     107,   108,   109,   110,    -1,   112,    99,   100,   101,   102,
      -1,   104,    -1,    -1,   107,   108,   109,   110,    -1,   112,
      99,   100,   101,   102,    -1,   104,    -1,    -1,   107,   108,
     109,   110,    -1,   112,    99,   100,   101,   102,   103,   104,
      -1,    -1,   107,    -1,    -1,    -1,   111,   112,    99,   100,
     101,   102,    -1,   104,    -1,    -1,   107,    99,   100,   101,
     102,   112,   104,    -1,    -1,   107,    -1,    -1,    -1,    -1,
     112
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
     103,   107,   111,   235,   236,   211,   103,   103,    29,    96,
     105,   113,   114,   143,   145,   146,   153,   154,   201,   202,
     203,   107,   108,   120,    74,    99,   100,   101,   102,   104,
     107,   108,   109,   110,   112,   231,   239,   242,   244,   245,
     246,   157,   103,   118,   171,   144,     4,   146,    98,    14,
      28,    78,   147,   148,   203,   239,    74,    72,   132,    86,
      87,    88,    89,    90,    91,    92,    93,    94,   164,   165,
     177,   178,   179,   118,   246,   177,   108,   239,   107,   149,
       4,   111,   239,   243,   244,   121,   121,     4,    72,   163,
     246,     4,   103,   111,   237,   238,   239,    72,   177,   119,
     150,   231,   232,   233,   234,   238,   244,   103,   107,    49,
      50,    51,    52,   103,   107,   166,   167,   158,   179,   172,
     118,   104,    96,   240,   119,    72,   122,   122,    72,   122,
       4,   159,   159,   107,   120,   240,   234,   167,     5,   105,
     113,   114,   160,   168,   198,   199,   200,   168,   120,   161,
       4,     4,    73,   200,   201,   204,    73,   162,   211,    10,
      12,    13,    14,    21,    22,    23,    27,    28,    29,    32,
      62,    65,    66,    67,    75,    79,    81,   103,   107,   111,
     121,   143,   173,   188,   190,   194,   207,   213,   215,   217,
     218,   219,   221,   229,   231,   103,   107,   237,    14,   239,
      14,   239,   239,   231,   103,   103,   208,   107,   209,   210,
     101,   107,   247,   121,   221,   231,   121,   216,     4,   232,
     214,     4,     4,   222,    33,    34,    35,    36,    37,    38,
      39,    40,    42,    43,    44,    45,    46,   115,   117,   118,
     119,   220,   186,    20,   239,    10,    55,    56,    57,    58,
      59,    60,    72,   230,   239,    10,    72,   230,    72,   211,
      72,   211,   211,   118,   195,   196,   121,   174,   107,   227,
     228,   231,   191,   121,   239,   239,   239,   239,   239,   239,
     239,   239,   239,   239,   239,   239,   239,    14,    21,    62,
      63,   107,   111,   123,   124,   125,   221,   231,   239,   240,
     107,   231,   236,    16,    17,    18,    19,    95,   187,   103,
      10,   237,   237,   239,    10,   237,   237,   239,   239,   103,
     205,   206,   231,   103,   103,   239,   107,   197,   224,   239,
     197,   228,   181,    20,    72,   122,   186,   192,   107,   223,
     224,   119,   212,   239,   247,   103,   150,   239,   239,   239,
      41,    47,    48,    54,    55,    56,    57,    58,    59,    60,
      68,    69,    70,    71,   116,   119,   124,   125,   126,   127,
     128,   129,   130,   131,   120,   121,   186,   237,    10,   237,
      10,    72,   119,    95,    72,   118,   118,    20,    72,   122,
     225,   122,   122,    11,    85,   176,   182,   231,   107,   227,
     118,     4,    65,    80,    82,   189,   193,    20,    72,   122,
     240,    72,   119,    72,   119,   239,   239,   239,   239,   239,
     239,   239,   239,   239,   239,   239,   239,   239,   239,   239,
     240,   239,   239,   239,   239,   239,   239,   239,   239,   118,
     107,   237,   237,   239,   240,   206,   246,   246,   239,   107,
     224,    15,    19,   226,   224,   239,    77,    83,    84,   180,
       4,    20,   219,   239,     4,   239,   107,   224,   120,   239,
     240,   239,   240,   120,   239,   122,   120,    20,   121,     4,
     239,   239,   107,   231,   175,   203,   231,   121,   225,    20,
     120,   120,   239,   107,     4,    72,     4,     4,    72,     4,
      72,   183,     4,   223,   239,   122,   239,   239,   239,    27,
      64,    76,   184,   122,     4,     4,     4,   185,   231,     4,
     211,   186,   206
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

  case 73:
#line 705 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 74:
#line 707 "compilers/imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, yyvsp[0].s));

         }
    break;

  case 75:
#line 711 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 76:
#line 713 "compilers/imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 77:
#line 718 "compilers/imcc/imcc.y"
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

  case 78:
#line 745 "compilers/imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 79:
#line 749 "compilers/imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 80:
#line 750 "compilers/imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 81:
#line 754 "compilers/imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 82:
#line 756 "compilers/imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 83:
#line 760 "compilers/imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 85:
#line 765 "compilers/imcc/imcc.y"
    { yyval.t = yyvsp[0].t; }
    break;

  case 86:
#line 766 "compilers/imcc/imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; }
    break;

  case 87:
#line 770 "compilers/imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 88:
#line 771 "compilers/imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 89:
#line 772 "compilers/imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 90:
#line 773 "compilers/imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 91:
#line 774 "compilers/imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 92:
#line 775 "compilers/imcc/imcc.y"
    {  yyval.t = P_METHOD; }
    break;

  case 93:
#line 776 "compilers/imcc/imcc.y"
    {  yyval.t = P_NEED_LEX; }
    break;

  case 96:
#line 783 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 97:
#line 788 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 98:
#line 790 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-1].sr);
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 99:
#line 795 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 100:
#line 797 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 101:
#line 799 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 102:
#line 803 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 103:
#line 810 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 104:
#line 811 "compilers/imcc/imcc.y"
    {  add_pcc_arg(cur_call, yyvsp[-1].sr); }
    break;

  case 105:
#line 815 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 106:
#line 820 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 107:
#line 821 "compilers/imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(cur_call, yyvsp[-1].sr); }
    break;

  case 108:
#line 825 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 109:
#line 826 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 110:
#line 827 "compilers/imcc/imcc.y"
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

  case 111:
#line 839 "compilers/imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 112:
#line 840 "compilers/imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 113:
#line 844 "compilers/imcc/imcc.y"
    {  yyval.t = VT_FLAT;   }
    break;

  case 114:
#line 845 "compilers/imcc/imcc.y"
    {  yyval.t = VT_OPTIONAL; }
    break;

  case 115:
#line 846 "compilers/imcc/imcc.y"
    {  yyval.t = VT_OPT_FLAG; }
    break;

  case 116:
#line 847 "compilers/imcc/imcc.y"
    {  yyval.t = VT_NAMED; }
    break;

  case 117:
#line 848 "compilers/imcc/imcc.y"
    {  adv_named_set(interp,yyvsp[-1].s); yyval.t = 0; }
    break;

  case 118:
#line 849 "compilers/imcc/imcc.y"
    {  yyval.t = VT_UNIQUE_REG; }
    break;

  case 119:
#line 854 "compilers/imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 120:
#line 855 "compilers/imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 123:
#line 865 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 124:
#line 868 "compilers/imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 125:
#line 869 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 126:
#line 875 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 127:
#line 876 "compilers/imcc/imcc.y"
    {
       if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); 
   }
    break;

  case 128:
#line 879 "compilers/imcc/imcc.y"
    {
       if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); 
   }
    break;

  case 129:
#line 885 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 130:
#line 890 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 131:
#line 895 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 132:
#line 897 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 133:
#line 902 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 134:
#line 906 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 135:
#line 907 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id, yyvsp[0].sr);
          adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr); }
    break;

  case 136:
#line 913 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 137:
#line 915 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id,yyvsp[0].sr);
           adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 138:
#line 921 "compilers/imcc/imcc.y"
    {  
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 141:
#line 940 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 142:
#line 945 "compilers/imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 143:
#line 946 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
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
#line 952 "compilers/imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 150:
#line 962 "compilers/imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 151:
#line 969 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 152:
#line 974 "compilers/imcc/imcc.y"
    {
         IdList* l = yyvsp[0].idlist;
         l->next = NULL;
         yyval.idlist = l;
     }
    break;

  case 153:
#line 981 "compilers/imcc/imcc.y"
    {  
         IdList* l = yyvsp[0].idlist;
         l->next = yyvsp[-2].idlist;
         yyval.idlist = l;
     }
    break;

  case 154:
#line 990 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = yyvsp[-1].s;
         l->unique_reg = 1;
         yyval.idlist = l;
     }
    break;

  case 155:
#line 998 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = yyvsp[0].s;
         l->unique_reg = 0;
         yyval.idlist = l;
     }
    break;

  case 158:
#line 1009 "compilers/imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 159:
#line 1010 "compilers/imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 160:
#line 1011 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 161:
#line 1012 "compilers/imcc/imcc.y"
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

  case 162:
#line 1027 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, yyvsp[0].sr, yyvsp[-2].s); yyval.i = 0;
                    }
    break;

  case 163:
#line 1030 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 164:
#line 1031 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 166:
#line 1033 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 167:
#line 1034 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 168:
#line 1035 "compilers/imcc/imcc.y"
    { yyval.i = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 169:
#line 1039 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 170:
#line 1041 "compilers/imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 171:
#line 1044 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 172:
#line 1045 "compilers/imcc/imcc.y"
    {  yyval.i = 0; cur_call = NULL; }
    break;

  case 173:
#line 1046 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 175:
#line 1048 "compilers/imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 176:
#line 1052 "compilers/imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 177:
#line 1053 "compilers/imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 178:
#line 1054 "compilers/imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 179:
#line 1055 "compilers/imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 180:
#line 1056 "compilers/imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 181:
#line 1057 "compilers/imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 182:
#line 1062 "compilers/imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 183:
#line 1072 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 1073 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 185:
#line 1074 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 186:
#line 1075 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 187:
#line 1076 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 188:
#line 1077 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 189:
#line 1078 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 190:
#line 1079 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 191:
#line 1080 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 192:
#line 1081 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 193:
#line 1082 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 194:
#line 1083 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 195:
#line 1084 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "iseq", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 1085 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isne", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 1086 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isgt", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 1087 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "islt", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 1088 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isle", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 1089 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isge", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 1091 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 1093 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 1095 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 1097 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 1099 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 1101 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 1103 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 208:
#line 1105 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 1107 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 210:
#line 1109 "compilers/imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 211:
#line 1111 "compilers/imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 1113 "compilers/imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 213:
#line 1115 "compilers/imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 214:
#line 1117 "compilers/imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 215:
#line 1119 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 216:
#line 1121 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-5].sr, yyvsp[-1].sr); }
    break;

  case 217:
#line 1123 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 218:
#line 1125 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 219:
#line 1127 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 220:
#line 1130 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 221:
#line 1132 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 222:
#line 1136 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 223:
#line 1138 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 1140 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 225:
#line 1143 "compilers/imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            cur_call = NULL;
            yyval.i = 0;
         }
    break;

  case 226:
#line 1149 "compilers/imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 227:
#line 1153 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           cur_call = NULL;
         }
    break;

  case 231:
#line 1161 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[-2].sr); }
    break;

  case 232:
#line 1164 "compilers/imcc/imcc.y"
    { yyval.i = IMCC_create_itcall_label(interp);
                           yyval.i->type &= ~ITCALL; yyval.i->type |= ITRESULT; }
    break;

  case 233:
#line 1166 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 234:
#line 1171 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 235:
#line 1173 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 236:
#line 1175 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 237:
#line 1177 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 238:
#line 1179 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 239:
#line 1181 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 240:
#line 1183 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 241:
#line 1185 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 242:
#line 1187 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 243:
#line 1189 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 244:
#line 1191 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 245:
#line 1193 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 246:
#line 1195 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 247:
#line 1200 "compilers/imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 248:
#line 1206 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 249:
#line 1207 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 250:
#line 1208 "compilers/imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 251:
#line 1213 "compilers/imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 252:
#line 1214 "compilers/imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 253:
#line 1215 "compilers/imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 254:
#line 1218 "compilers/imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 255:
#line 1219 "compilers/imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 256:
#line 1224 "compilers/imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 257:
#line 1229 "compilers/imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 258:
#line 1233 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 259:
#line 1234 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call, adv_named_id, yyvsp[0].sr);
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, yyvsp[0].sr); 
   }
    break;

  case 260:
#line 1240 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call,adv_named_id,yyvsp[0].sr);
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, yyvsp[0].sr);
   }
    break;

  case 261:
#line 1246 "compilers/imcc/imcc.y"
    { yyval.sr = 0;
                                     add_pcc_named_arg(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 262:
#line 1248 "compilers/imcc/imcc.y"
    { yyval.sr = 0; add_pcc_named_arg(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 263:
#line 1252 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 264:
#line 1256 "compilers/imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 265:
#line 1257 "compilers/imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 266:
#line 1261 "compilers/imcc/imcc.y"
    { yyval.t = VT_FLAT; }
    break;

  case 267:
#line 1262 "compilers/imcc/imcc.y"
    { yyval.t = VT_NAMED; }
    break;

  case 268:
#line 1263 "compilers/imcc/imcc.y"
    { adv_named_set(interp,yyvsp[-1].s); yyval.t = 0; }
    break;

  case 269:
#line 1266 "compilers/imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 270:
#line 1270 "compilers/imcc/imcc.y"
    { 
         yyval.sr = 0;
         if (adv_named_id) {
             add_pcc_named_result(interp,cur_call,adv_named_id,yyvsp[0].sr);
             adv_named_id = NULL;
         } else add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 271:
#line 1276 "compilers/imcc/imcc.y"
    { 
        add_pcc_named_result(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr); }
    break;

  case 272:
#line 1278 "compilers/imcc/imcc.y"
    { 
       yyval.sr = 0;
       if (adv_named_id) {
           add_pcc_named_result(interp,cur_call,adv_named_id,yyvsp[0].sr);
           adv_named_id = NULL;
       } else add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 273:
#line 1284 "compilers/imcc/imcc.y"
    { add_pcc_named_result(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr); }
    break;

  case 274:
#line 1285 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 275:
#line 1290 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 276:
#line 1292 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 277:
#line 1294 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 278:
#line 1296 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 279:
#line 1298 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 280:
#line 1300 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 281:
#line 1302 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 282:
#line 1304 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 283:
#line 1308 "compilers/imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 284:
#line 1309 "compilers/imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 285:
#line 1310 "compilers/imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 286:
#line 1311 "compilers/imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 287:
#line 1312 "compilers/imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 288:
#line 1313 "compilers/imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 291:
#line 1322 "compilers/imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 292:
#line 1323 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 293:
#line 1327 "compilers/imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 295:
#line 1332 "compilers/imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 296:
#line 1334 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 297:
#line 1340 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-1].sr;
                      yyval.sr = yyvsp[-1].sr;
                   }
    break;

  case 299:
#line 1347 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 300:
#line 1351 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 301:
#line 1352 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 302:
#line 1356 "compilers/imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 303:
#line 1357 "compilers/imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 308:
#line 1370 "compilers/imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 309:
#line 1371 "compilers/imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 310:
#line 1375 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 311:
#line 1377 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 312:
#line 1378 "compilers/imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 313:
#line 1379 "compilers/imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 314:
#line 1383 "compilers/imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 315:
#line 1389 "compilers/imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 316:
#line 1391 "compilers/imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 317:
#line 1392 "compilers/imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 318:
#line 1396 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 319:
#line 1397 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 320:
#line 1398 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 321:
#line 1399 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 322:
#line 1400 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 323:
#line 1404 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 324:
#line 1405 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 325:
#line 1406 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 326:
#line 1407 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 327:
#line 1411 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 328:
#line 1412 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 991 of yacc.c.  */
#line 3912 "compilers/imcc/imcparser.c"

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


#line 1417 "compilers/imcc/imcc.y"



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

