/* A Bison parser, made by GNU Bison 2.0.  */

/* Skeleton parser for Yacc-like parsing with Bison,
   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004 Free Software Foundation, Inc.

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
     LABEL = 349,
     EMIT = 350,
     EOM = 351,
     IREG = 352,
     NREG = 353,
     SREG = 354,
     PREG = 355,
     IDENTIFIER = 356,
     REG = 357,
     MACRO = 358,
     ENDM = 359,
     STRINGC = 360,
     INTC = 361,
     FLOATC = 362,
     USTRINGC = 363,
     PARROT_OP = 364,
     VAR = 365,
     LINECOMMENT = 366,
     FILECOMMENT = 367,
     DOT = 368,
     CONCAT = 369,
     POINTY = 370
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
#define LABEL 349
#define EMIT 350
#define EOM 351
#define IREG 352
#define NREG 353
#define SREG 354
#define PREG 355
#define IDENTIFIER 356
#define REG 357
#define MACRO 358
#define ENDM 359
#define STRINGC 360
#define INTC 361
#define FLOATC 362
#define USTRINGC 363
#define PARROT_OP 364
#define VAR 365
#define LINECOMMENT 366
#define FILECOMMENT 367
#define DOT 368
#define CONCAT 369
#define POINTY 370




/* Copy the first part of user declarations.  */
#line 1 "compilers/imcc/imcc.y"

/*
 * imcc.y
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 *
 * Grammar for the parser.
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
#line 362 "compilers/imcc/imcc.y"
typedef union YYSTYPE {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} YYSTYPE;
/* Line 190 of yacc.c.  */
#line 675 "compilers/imcc/imcparser.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 213 of yacc.c.  */
#line 687 "compilers/imcc/imcparser.c"

#if ! defined (yyoverflow) || YYERROR_VERBOSE

# ifndef YYFREE
#  define YYFREE free
# endif
# ifndef YYMALLOC
#  define YYMALLOC malloc
# endif

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   else
#    define YYSTACK_ALLOC alloca
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
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
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
   typedef short int yysigned_char;
#endif

/* YYFINAL -- State number of the termination state. */
#define YYFINAL  41
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   687

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  132
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  114
/* YYNRULES -- Number of rules. */
#define YYNRULES  322
/* YYNRULES -- Number of states. */
#define YYNSTATES  562

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   370

#define YYTRANSLATE(YYX) 						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   122,     2,     2,     2,   128,   129,     2,
     120,   121,   126,   125,     2,   123,     2,   127,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   131,
       2,   117,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   118,     2,   119,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   130,     2,   124,     2,     2,     2,
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
     116
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short int yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    25,    27,    29,    33,    36,    39,    44,    49,
      53,    59,    60,    67,    68,    75,    77,    80,    84,    87,
      89,    91,    93,    95,    96,   100,   101,   106,   109,   114,
     115,   117,   118,   123,   124,   126,   131,   132,   133,   134,
     145,   146,   148,   152,   153,   157,   161,   166,   167,   169,
     174,   179,   184,   185,   189,   191,   193,   195,   197,   199,
     201,   202,   204,   205,   206,   207,   218,   219,   229,   230,
     233,   234,   238,   239,   241,   243,   247,   249,   251,   253,
     255,   257,   259,   261,   263,   265,   271,   275,   279,   283,
     287,   293,   299,   300,   304,   307,   308,   312,   316,   317,
     322,   323,   326,   328,   330,   332,   334,   339,   341,   343,
     345,   347,   348,   354,   356,   357,   360,   364,   368,   369,
     375,   376,   382,   383,   385,   389,   393,   399,   401,   404,
     405,   408,   411,   413,   415,   416,   418,   421,   423,   425,
     429,   431,   435,   437,   439,   442,   445,   446,   451,   456,
     457,   464,   466,   467,   474,   477,   480,   483,   486,   488,
     490,   492,   493,   495,   497,   499,   501,   503,   505,   507,
     511,   516,   521,   526,   532,   538,   544,   550,   556,   562,
     568,   574,   580,   586,   592,   598,   604,   610,   616,   622,
     628,   634,   640,   646,   652,   658,   664,   671,   678,   685,
     693,   698,   703,   710,   718,   723,   728,   733,   738,   745,
     753,   757,   758,   768,   770,   772,   774,   778,   779,   785,
     789,   793,   797,   801,   805,   809,   813,   817,   821,   825,
     829,   833,   837,   842,   844,   846,   848,   852,   856,   860,
     862,   864,   865,   871,   872,   876,   878,   884,   888,   891,
     892,   895,   897,   899,   904,   907,   911,   917,   919,   923,
     924,   931,   938,   944,   950,   955,   960,   965,   970,   972,
     974,   976,   978,   980,   982,   984,   986,   987,   989,   993,
     995,   997,  1002,  1004,  1006,  1008,  1010,  1012,  1014,  1016,
    1018,  1020,  1022,  1023,  1026,  1028,  1032,  1033,  1038,  1040,
    1044,  1047,  1050,  1052,  1054,  1056,  1058,  1060,  1062,  1064,
    1066,  1068,  1070
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     133,     0,    -1,   134,    -1,   135,    -1,   134,   135,    -1,
     153,    -1,   140,    -1,   139,    -1,   154,    -1,   168,    -1,
     150,    -1,   104,     4,    -1,   136,    -1,     4,    -1,     6,
     137,     4,    -1,   138,     4,    -1,     7,   107,    -1,     8,
     106,    72,   106,    -1,     9,   107,    72,   107,    -1,    61,
     209,   102,    -1,    61,   209,   102,   117,   244,    -1,    -1,
      29,   141,   209,   102,   117,   244,    -1,    -1,    29,   143,
     107,   236,   117,   106,    -1,   145,    -1,   144,   145,    -1,
     200,   146,     4,    -1,   104,     4,    -1,   113,    -1,   112,
      -1,   153,    -1,   142,    -1,    -1,   147,   110,   149,    -1,
      -1,    78,   148,   176,    95,    -1,    14,   237,    -1,    28,
     106,    72,   103,    -1,    -1,   230,    -1,    -1,    96,   151,
     152,    97,    -1,    -1,   144,    -1,    22,   118,   238,   119,
      -1,    -1,    -1,    -1,    25,   155,   233,   156,   176,     4,
     157,   158,   167,    73,    -1,    -1,     4,    -1,   158,   159,
       4,    -1,    -1,     5,   160,   161,    -1,   209,   102,   185,
      -1,   209,   106,    20,   102,    -1,    -1,    72,    -1,    94,
     120,   165,   121,    -1,    92,   120,   106,   121,    -1,    92,
     120,   102,   121,    -1,    -1,   165,    72,   166,    -1,   166,
      -1,    49,    -1,    50,    -1,    52,    -1,    51,    -1,   102,
      -1,    -1,   197,    -1,    -1,    -1,    -1,    78,   169,   102,
     170,   176,     4,   171,   158,   167,    73,    -1,    -1,    75,
       4,   173,   180,   175,   179,   174,   182,    76,    -1,    -1,
     202,     4,    -1,    -1,    85,   237,     4,    -1,    -1,   177,
      -1,   178,    -1,   177,   162,   178,    -1,    87,    -1,    86,
      -1,    88,    -1,    89,    -1,    91,    -1,    90,    -1,    93,
      -1,   163,    -1,   164,    -1,    77,   237,    72,   237,     4,
      -1,    77,   237,     4,    -1,    83,   237,     4,    -1,    84,
     229,     4,    -1,    84,   106,     4,    -1,    84,   229,    72,
     237,     4,    -1,    84,   106,    72,   237,     4,    -1,    -1,
     180,   181,     4,    -1,    11,   222,    -1,    -1,   182,   183,
       4,    -1,    64,   229,   185,    -1,    -1,    27,   184,   209,
     102,    -1,    -1,   185,   186,    -1,    16,    -1,    17,    -1,
      18,    -1,    19,    -1,    19,   120,   106,   121,    -1,    79,
      -1,    81,    -1,    80,    -1,    82,    -1,    -1,   187,     4,
     190,   191,   188,    -1,   193,    -1,    -1,   191,     4,    -1,
     191,   192,     4,    -1,    65,   237,   223,    -1,    -1,    65,
     120,   194,   196,   121,    -1,    -1,    66,   120,   195,   196,
     121,    -1,    -1,   222,    -1,   106,    20,   237,    -1,   196,
      72,   222,    -1,   196,    72,   106,    20,   237,    -1,   199,
      -1,   197,   199,    -1,    -1,   198,   203,    -1,   104,     4,
      -1,   113,    -1,   112,    -1,    -1,   201,    -1,   201,   202,
      -1,   202,    -1,    95,    -1,   200,   205,     4,    -1,   102,
      -1,   204,    72,   102,    -1,   211,    -1,   227,    -1,    22,
     102,    -1,    23,   102,    -1,    -1,    27,   206,   209,   204,
      -1,    28,   106,    72,   229,    -1,    -1,    29,   207,   209,
     102,   117,   244,    -1,   142,    -1,    -1,    32,   208,   209,
     102,   117,   244,    -1,    65,   219,    -1,    10,   235,    -1,
     110,   230,    -1,    14,   237,    -1,   219,    -1,   172,    -1,
     189,    -1,    -1,    49,    -1,    50,    -1,    51,    -1,    52,
      -1,    53,    -1,   210,    -1,   102,    -1,   229,   117,   237,
      -1,   229,   117,   122,   237,    -1,   229,   117,   123,   237,
      -1,   229,   117,   124,   237,    -1,   229,   117,   237,   125,
     237,    -1,   229,   117,   237,   123,   237,    -1,   229,   117,
     237,   126,   237,    -1,   229,   117,   237,    68,   237,    -1,
     229,   117,   237,   127,   237,    -1,   229,   117,   237,    41,
     237,    -1,   229,   117,   237,   128,   237,    -1,   229,   117,
     237,   115,   237,    -1,   229,   117,   237,    55,   237,    -1,
     229,   117,   237,    56,   237,    -1,   229,   117,   237,    57,
     237,    -1,   229,   117,   237,    59,   237,    -1,   229,   117,
     237,    60,   237,    -1,   229,   117,   237,    58,   237,    -1,
     229,   117,   237,    47,   237,    -1,   229,   117,   237,    48,
     237,    -1,   229,   117,   237,    69,   237,    -1,   229,   117,
     237,    70,   237,    -1,   229,   117,   237,    71,   237,    -1,
     229,   117,   237,    54,   237,    -1,   229,   117,   237,   129,
     237,    -1,   229,   117,   237,   130,   237,    -1,   229,   117,
     237,   124,   237,    -1,   229,   117,   237,   118,   238,   119,
      -1,   229,   118,   238,   119,   117,   237,    -1,   229,   117,
      21,   210,    72,   237,    -1,   229,   117,    21,   210,   118,
     238,   119,    -1,   229,   117,    21,   210,    -1,   229,   117,
      21,   237,    -1,   229,   117,    21,   237,    72,   237,    -1,
     229,   117,    21,   237,   118,   238,   119,    -1,   229,   117,
      63,   102,    -1,   229,   117,    62,   245,    -1,    62,   245,
     117,   237,    -1,    21,   229,    72,   237,    -1,    21,   229,
      72,   237,    72,   237,    -1,    21,   229,    72,   237,   118,
     238,   119,    -1,   229,   117,   219,    -1,    -1,   212,   120,
     226,   121,   117,   217,   120,   221,   121,    -1,   213,    -1,
     215,    -1,   216,    -1,   229,   117,    14,    -1,    -1,    67,
     214,   120,   226,   121,    -1,   229,    33,   237,    -1,   229,
      34,   237,    -1,   229,    35,   237,    -1,   229,    36,   237,
      -1,   229,    43,   237,    -1,   229,    42,   237,    -1,   229,
      37,   237,    -1,   229,    38,   237,    -1,   229,    39,   237,
      -1,   229,    40,   237,    -1,   229,    44,   237,    -1,   229,
      45,   237,    -1,   229,    46,   237,    -1,   229,   117,   110,
     149,    -1,   102,    -1,   106,    -1,   229,    -1,   229,   218,
     234,    -1,   229,   218,   106,    -1,   229,   218,   229,    -1,
     116,    -1,   114,    -1,    -1,   217,   220,   120,   221,   121,
      -1,    -1,   221,    72,   222,    -1,   222,    -1,   221,    72,
     106,    20,   237,    -1,   106,    20,   237,    -1,   237,   223,
      -1,    -1,   223,   224,    -1,    15,    -1,    19,    -1,    19,
     120,   106,   121,    -1,   229,   185,    -1,   226,    72,   225,
      -1,   226,    72,   106,    20,   229,    -1,   225,    -1,   106,
      20,   229,    -1,    -1,    12,   237,   228,   237,    10,   235,
      -1,    13,   237,   228,   237,    10,   235,    -1,    12,    14,
     237,    10,   235,    -1,    13,    14,   237,    10,   235,    -1,
      12,   237,    10,   235,    -1,    13,   237,    10,   235,    -1,
      12,   237,    72,   235,    -1,    13,   237,    72,   235,    -1,
      55,    -1,    56,    -1,    57,    -1,    58,    -1,    59,    -1,
      60,    -1,   111,    -1,   243,    -1,    -1,   231,    -1,   231,
      72,   232,    -1,   232,    -1,   236,    -1,   229,   118,   238,
     119,    -1,   234,    -1,   106,    -1,   102,    -1,   110,    -1,
     102,    -1,   110,    -1,   235,    -1,   237,    -1,   229,    -1,
     244,    -1,    -1,   239,   240,    -1,   242,    -1,   240,   131,
     242,    -1,    -1,   240,    72,   241,   242,    -1,   237,    -1,
     237,    74,   237,    -1,    74,   237,    -1,   237,    74,    -1,
      98,    -1,    99,    -1,   100,    -1,   101,    -1,   103,    -1,
     107,    -1,   108,    -1,   106,    -1,   109,    -1,   100,    -1,
     106,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   442,   442,   446,   447,   451,   452,   453,   454,   455,
     456,   457,   458,   459,   462,   463,   466,   474,   483,   492,
     498,   507,   507,   512,   512,   516,   517,   521,   522,   523,
     524,   525,   526,   529,   529,   534,   533,   544,   546,   551,
     555,   559,   559,   569,   571,   575,   592,   596,   599,   591,
     605,   606,   607,   616,   616,   620,   622,   627,   628,   632,
     635,   638,   644,   645,   646,   650,   651,   652,   653,   654,
     666,   668,   672,   674,   678,   672,   685,   684,   716,   717,
     721,   722,   727,   728,   732,   733,   737,   738,   739,   740,
     741,   742,   743,   744,   745,   749,   754,   756,   761,   763,
     765,   769,   777,   778,   782,   787,   788,   792,   793,   793,
     798,   799,   803,   804,   805,   806,   807,   812,   813,   817,
     818,   823,   822,   827,   833,   834,   837,   843,   848,   847,
     855,   854,   864,   865,   871,   873,   879,   885,   886,   898,
     902,   904,   905,   906,   910,   911,   915,   916,   920,   926,
     930,   938,   947,   948,   949,   950,   951,   951,   964,   968,
     968,   970,   971,   971,   973,   977,   978,   981,   983,   984,
     985,   986,   990,   991,   992,   993,   994,   995,   999,  1010,
    1011,  1012,  1013,  1014,  1015,  1016,  1017,  1018,  1019,  1020,
    1021,  1022,  1023,  1024,  1025,  1026,  1027,  1028,  1030,  1032,
    1034,  1036,  1038,  1040,  1042,  1044,  1046,  1048,  1050,  1052,
    1054,  1056,  1058,  1060,  1062,  1065,  1067,  1071,  1073,  1075,
    1078,  1085,  1085,  1093,  1094,  1095,  1096,  1100,  1100,  1106,
    1108,  1110,  1112,  1114,  1116,  1118,  1120,  1122,  1124,  1126,
    1128,  1130,  1135,  1142,  1143,  1144,  1149,  1150,  1151,  1154,
    1155,  1160,  1159,  1169,  1170,  1176,  1182,  1184,  1188,  1192,
    1193,  1197,  1198,  1199,  1202,  1206,  1212,  1214,  1220,  1221,
    1225,  1227,  1229,  1231,  1233,  1235,  1237,  1239,  1244,  1245,
    1246,  1247,  1248,  1249,  1253,  1254,  1258,  1259,  1263,  1264,
    1268,  1269,  1277,  1278,  1282,  1283,  1287,  1288,  1292,  1293,
    1297,  1298,  1301,  1301,  1306,  1307,  1309,  1309,  1314,  1319,
    1322,  1323,  1327,  1328,  1329,  1330,  1331,  1335,  1336,  1337,
    1338,  1342,  1343
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
  "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER",
  "REG", "MACRO", "ENDM", "STRINGC", "INTC", "FLOATC", "USTRINGC",
  "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT",
  "POINTY", "'='", "'['", "']'", "'('", "')'", "'!'", "'-'", "'~'", "'+'",
  "'*'", "'/'", "'%'", "'&'", "'|'", "';'", "$accept", "program",
  "compilation_units", "compilation_unit", "pragma", "pragma_1", "hll_def",
  "global", "constdef", "@1", "pmc_const", "@2", "pasmcode", "pasmline",
  "pasm_inst", "@3", "@4", "pasm_args", "emit", "@5", "opt_pasmcode",
  "class_namespace", "sub", "@6", "@7", "@8", "sub_params", "sub_param",
  "@9", "sub_param_type_def", "opt_comma", "multi", "outer", "multi_types",
  "multi_type", "sub_body", "pcc_sub", "@10", "@11", "@12", "pcc_sub_call",
  "@13", "opt_label", "opt_invocant", "sub_proto", "sub_proto_list",
  "proto", "pcc_call", "pcc_args", "pcc_arg", "pcc_results", "pcc_result",
  "@14", "paramtype_list", "paramtype", "begin_ret_or_yield",
  "end_ret_or_yield", "pcc_ret", "@15", "pcc_returns", "pcc_return",
  "pcc_return_many", "@16", "@17", "var_returns", "statements",
  "helper_clear_state", "statement", "labels", "_labels", "label",
  "instruction", "id_list", "labeled_inst", "@18", "@19", "@20", "type",
  "classname", "assignment", "@21", "get_results", "@22", "op_assign",
  "func_assign", "the_sub", "ptr", "sub_call", "@23", "arglist", "arg",
  "argtype_list", "argtype", "result", "targetlist", "if_statement",
  "relop", "target", "vars", "_vars", "_var_or_i", "sub_label_op_c",
  "sub_label_op", "label_op", "var_or_i", "var", "keylist", "@24",
  "_keylist", "@25", "key", "reg", "const", "string", 0
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
     364,   365,   366,   367,   368,   369,   370,    61,    91,    93,
      40,    41,    33,    45,   126,    43,    42,    47,    37,    38,
     124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   132,   133,   134,   134,   135,   135,   135,   135,   135,
     135,   135,   135,   135,   136,   136,   137,   138,   138,   139,
     139,   141,   140,   143,   142,   144,   144,   145,   145,   145,
     145,   145,   145,   147,   146,   148,   146,   146,   146,   146,
     149,   151,   150,   152,   152,   153,   155,   156,   157,   154,
     158,   158,   158,   160,   159,   161,   161,   162,   162,   163,
     164,   164,   165,   165,   165,   166,   166,   166,   166,   166,
     167,   167,   169,   170,   171,   168,   173,   172,   174,   174,
     175,   175,   176,   176,   177,   177,   178,   178,   178,   178,
     178,   178,   178,   178,   178,   179,   179,   179,   179,   179,
     179,   179,   180,   180,   181,   182,   182,   183,   184,   183,
     185,   185,   186,   186,   186,   186,   186,   187,   187,   188,
     188,   190,   189,   189,   191,   191,   191,   192,   194,   193,
     195,   193,   196,   196,   196,   196,   196,   197,   197,   198,
     199,   199,   199,   199,   200,   200,   201,   201,   202,   203,
     204,   204,   205,   205,   205,   205,   206,   205,   205,   207,
     205,   205,   208,   205,   205,   205,   205,   205,   205,   205,
     205,   205,   209,   209,   209,   209,   209,   209,   210,   211,
     211,   211,   211,   211,   211,   211,   211,   211,   211,   211,
     211,   211,   211,   211,   211,   211,   211,   211,   211,   211,
     211,   211,   211,   211,   211,   211,   211,   211,   211,   211,
     211,   211,   211,   211,   211,   211,   211,   211,   211,   211,
     211,   212,   211,   211,   211,   211,   211,   214,   213,   215,
     215,   215,   215,   215,   215,   215,   215,   215,   215,   215,
     215,   215,   216,   217,   217,   217,   217,   217,   217,   218,
     218,   220,   219,   221,   221,   221,   221,   221,   222,   223,
     223,   224,   224,   224,   225,   226,   226,   226,   226,   226,
     227,   227,   227,   227,   227,   227,   227,   227,   228,   228,
     228,   228,   228,   228,   229,   229,   230,   230,   231,   231,
     232,   232,   233,   233,   234,   234,   235,   235,   236,   236,
     237,   237,   239,   238,   240,   240,   241,   240,   242,   242,
     242,   242,   243,   243,   243,   243,   243,   244,   244,   244,
     244,   245,   245
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     3,     2,     2,     4,     4,     3,
       5,     0,     6,     0,     6,     1,     2,     3,     2,     1,
       1,     1,     1,     0,     3,     0,     4,     2,     4,     0,
       1,     0,     4,     0,     1,     4,     0,     0,     0,    10,
       0,     1,     3,     0,     3,     3,     4,     0,     1,     4,
       4,     4,     0,     3,     1,     1,     1,     1,     1,     1,
       0,     1,     0,     0,     0,    10,     0,     9,     0,     2,
       0,     3,     0,     1,     1,     3,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     5,     3,     3,     3,     3,
       5,     5,     0,     3,     2,     0,     3,     3,     0,     4,
       0,     2,     1,     1,     1,     1,     4,     1,     1,     1,
       1,     0,     5,     1,     0,     2,     3,     3,     0,     5,
       0,     5,     0,     1,     3,     3,     5,     1,     2,     0,
       2,     2,     1,     1,     0,     1,     2,     1,     1,     3,
       1,     3,     1,     1,     2,     2,     0,     4,     4,     0,
       6,     1,     0,     6,     2,     2,     2,     2,     1,     1,
       1,     0,     1,     1,     1,     1,     1,     1,     1,     3,
       4,     4,     4,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     6,     6,     6,     7,
       4,     4,     6,     7,     4,     4,     4,     4,     6,     7,
       3,     0,     9,     1,     1,     1,     3,     0,     5,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     4,     1,     1,     1,     3,     3,     3,     1,
       1,     0,     5,     0,     3,     1,     5,     3,     2,     0,
       2,     1,     1,     4,     2,     3,     5,     1,     3,     0,
       6,     6,     5,     5,     4,     4,     4,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     0,     1,     3,     1,
       1,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     0,     2,     1,     3,     0,     4,     1,     3,
       2,     2,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
       0,    13,     0,     0,     0,     0,    46,    21,     0,    72,
      41,     0,     0,     2,     3,    12,     0,     7,     6,    10,
       5,     8,     9,     0,     0,     0,     0,   302,     0,     0,
     172,   173,   174,   175,   176,   178,     0,   177,     0,   144,
      11,     1,     4,    15,    16,    14,     0,     0,     0,     0,
     294,   293,   295,    47,   292,     0,    19,    73,    23,   148,
       0,    30,    29,    32,   144,    25,     0,    31,    33,   145,
     147,    17,    18,    45,     0,   312,   313,   314,   315,   316,
     319,   317,   318,   320,   284,   300,   308,   303,   304,   285,
     301,    82,     0,     0,    82,     0,    28,    26,    42,     0,
       0,    35,     0,     0,   146,   310,   311,   306,     0,    87,
      86,    88,    89,    91,    90,     0,    92,     0,    93,    94,
       0,    57,    84,     0,    20,     0,     0,    37,     0,    82,
      27,   286,   309,     0,   305,     0,    62,    48,    58,     0,
      22,    74,   296,   297,   298,     0,   299,     0,     0,    34,
     300,    40,   287,   289,   290,   307,     0,     0,    65,    66,
      68,    67,    69,     0,    64,    50,    85,    50,     0,    38,
      36,   302,     0,    61,    60,     0,    59,    51,   139,   139,
      24,     0,   288,    63,    53,     0,   143,   142,     0,     0,
     139,   144,   137,     0,   291,     0,   141,    52,    49,   138,
     171,   140,    75,    54,     0,     0,     0,     0,     0,     0,
       0,     0,   156,     0,   159,   162,     0,     0,     0,   227,
       0,   117,   118,   243,   244,   286,   161,   169,     0,   170,
     123,     0,   152,     0,   223,   224,   225,   251,   168,   153,
     245,   110,     0,   165,     0,     0,     0,     0,   167,     0,
     154,   155,     0,     0,     0,     0,   321,   322,     0,   128,
     164,   245,   130,     0,    76,   166,   121,   149,   269,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   250,   249,     0,   302,     0,    55,     0,
       0,     0,   278,   279,   280,   281,   282,   283,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     132,   132,   269,   102,   124,     0,   267,     0,   110,   253,
     229,   230,   231,   232,   235,   236,   237,   238,   234,   233,
     239,   240,   241,   226,     0,     0,     0,   319,   286,     0,
       0,     0,   220,   300,   179,     0,   247,   248,   246,   112,
     113,   114,   115,   111,    56,     0,   274,   276,     0,     0,
     275,   277,     0,   217,   150,   157,   158,     0,     0,   216,
     319,     0,   133,   259,     0,     0,    80,     0,     0,     0,
       0,   264,   319,     0,   255,   210,   211,   215,   214,   242,
     180,   181,   182,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   302,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   272,
       0,   273,     0,     0,   302,     0,     0,     0,     0,     0,
     129,   258,   131,   228,     0,     0,     0,     0,   125,     0,
     119,   120,   122,     0,   268,     0,   265,     0,     0,     0,
     252,     0,   302,     0,   302,   188,   197,   198,   202,   191,
     192,   193,   196,   194,   195,   186,   199,   200,   201,   190,
       0,   184,   205,   183,   185,   187,   189,   203,   204,     0,
       0,   270,   271,   218,     0,   151,   160,   163,   134,   319,
     135,   261,   262,   260,   104,     0,     0,     0,     0,    78,
     103,   259,   126,     0,     0,   257,   319,   254,   208,     0,
     212,     0,   206,   207,   116,   219,     0,     0,    81,     0,
       0,     0,     0,   105,     0,   127,   266,   253,     0,   209,
     213,   136,     0,    96,     0,    97,    99,     0,    98,     0,
       0,    79,     0,   256,   263,     0,     0,     0,   108,     0,
      77,     0,   222,    95,   101,   100,     0,   110,   106,     0,
     107,   109
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    12,    13,    14,    15,    24,    16,    17,    18,    29,
      63,    95,    64,    65,   102,   103,   129,   149,    19,    39,
      66,    20,    21,    28,    91,   165,   178,   188,   195,   203,
     139,   118,   119,   163,   164,   189,    22,    38,    94,   167,
     227,   313,   523,   436,   120,   121,   122,   499,   376,   437,
     540,   551,   556,   288,   353,   228,   442,   229,   314,   377,
     443,   230,   310,   311,   371,   190,   191,   192,    68,    69,
      70,   201,   365,   231,   252,   254,   255,    36,    37,   232,
     233,   234,   263,   235,   236,   237,   287,   238,   269,   383,
     372,   431,   493,   316,   317,   239,   299,    85,   151,   152,
     153,    53,    54,   144,   154,   373,    48,    49,    87,   133,
      88,    89,    90,   258
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -314
static const short int yypact[] =
{
      14,  -314,    30,   -72,   -67,   -64,  -314,  -314,    -4,  -314,
    -314,   110,    69,    14,  -314,  -314,   119,  -314,  -314,  -314,
    -314,  -314,  -314,    17,   128,    71,    74,  -314,    84,    -4,
    -314,  -314,  -314,  -314,  -314,  -314,    79,  -314,    81,    65,
    -314,  -314,  -314,  -314,  -314,  -314,    61,    82,    83,   169,
    -314,  -314,  -314,  -314,  -314,    94,    97,  -314,  -314,  -314,
     212,  -314,  -314,  -314,    75,  -314,   120,  -314,     7,   124,
    -314,  -314,  -314,  -314,   489,  -314,  -314,  -314,  -314,  -314,
    -314,  -314,  -314,  -314,  -314,  -314,   148,   -57,  -314,  -314,
    -314,   213,   123,   104,   213,   151,  -314,  -314,  -314,   489,
     153,  -314,   251,   161,  -314,  -314,   489,  -314,   169,  -314,
    -314,  -314,  -314,  -314,  -314,   143,  -314,   154,  -314,  -314,
     269,     6,  -314,   104,  -314,   275,   339,  -314,   216,   213,
    -314,   339,  -314,   169,  -314,   -36,   -23,  -314,  -314,   213,
    -314,  -314,  -314,  -314,  -314,   173,  -314,   189,   198,  -314,
     191,  -314,   236,  -314,  -314,  -314,   197,   209,  -314,  -314,
    -314,  -314,  -314,   -19,  -314,   327,  -314,   327,   228,  -314,
    -314,  -314,   339,  -314,  -314,   -23,  -314,  -314,     3,     3,
    -314,   219,  -314,  -314,  -314,   335,  -314,  -314,   336,   268,
      72,   124,  -314,   270,  -314,    -4,  -314,  -314,  -314,  -314,
     401,  -314,  -314,  -314,    49,   -58,    27,    41,   489,   415,
     240,   242,  -314,   239,   241,  -314,   -49,   226,   227,  -314,
     345,  -314,  -314,  -314,  -314,   339,  -314,  -314,   361,  -314,
    -314,   377,  -314,   263,  -314,  -314,  -314,  -314,  -314,  -314,
     277,  -314,   368,  -314,   489,   149,   489,   190,  -314,   318,
    -314,  -314,    -4,   325,    -4,    -4,  -314,  -314,   281,  -314,
    -314,    42,  -314,   286,  -314,  -314,  -314,  -314,   183,   289,
     489,   489,   489,   489,   489,   489,   489,   489,   489,   489,
     489,   489,   489,  -314,  -314,   430,  -314,   276,   235,   314,
     407,   -58,  -314,  -314,  -314,  -314,  -314,  -314,   -58,   489,
     408,   -58,   -58,   489,   489,   317,   415,   319,   323,   489,
     503,   503,   183,  -314,  -314,   400,  -314,   -12,  -314,   534,
    -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,
    -314,  -314,  -314,  -314,   475,   -49,   324,   307,   339,   489,
     489,   489,  -314,    77,   501,   313,  -314,  -314,  -314,  -314,
    -314,  -314,   332,  -314,  -314,   -58,  -314,  -314,   424,   -58,
    -314,  -314,   433,   -56,  -314,   383,  -314,   343,   348,  -314,
     442,    -8,  -314,  -314,    -1,     0,     8,    26,   415,   358,
     353,   235,   451,    40,  -314,   -34,   -13,  -314,  -314,  -314,
    -314,  -314,  -314,   489,   489,   489,   489,   489,   489,   489,
     489,   489,   489,   489,   489,   489,   489,   489,  -314,   489,
     489,   489,   489,   489,   489,   489,   489,   355,   369,  -314,
     -58,  -314,   -58,   489,  -314,   372,   104,   104,   489,   548,
    -314,   180,  -314,  -314,   489,   489,    91,   473,  -314,   489,
    -314,  -314,  -314,   474,  -314,   459,  -314,   301,   489,   562,
    -314,   489,  -314,   489,  -314,  -314,  -314,  -314,  -314,  -314,
    -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,
     362,  -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,   489,
     363,  -314,  -314,  -314,   364,  -314,  -314,  -314,  -314,   466,
    -314,  -314,   367,  -314,  -314,   484,   489,   489,   576,   124,
    -314,  -314,  -314,   415,   370,  -314,   469,  -314,  -314,   376,
    -314,   378,  -314,  -314,  -314,  -314,   489,   392,  -314,     5,
     502,     9,    10,  -314,   504,   180,  -314,   534,   489,  -314,
    -314,  -314,   384,  -314,   489,  -314,  -314,   489,  -314,   489,
      -3,  -314,    59,  -314,  -314,   505,   506,   513,  -314,   415,
    -314,   515,  -314,  -314,  -314,  -314,    -4,  -314,  -314,   418,
     235,  -314
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -314,  -314,  -314,   509,  -314,  -314,  -314,  -314,  -314,  -314,
     334,  -314,  -314,   460,  -314,  -314,  -314,   185,  -314,  -314,
    -314,   -14,  -314,  -314,  -314,  -314,   379,  -314,  -314,  -314,
    -314,  -314,  -314,  -314,   350,   356,  -314,  -314,  -314,  -314,
    -314,  -314,  -314,  -314,   -61,  -314,   404,  -314,  -314,  -314,
    -314,  -314,  -314,  -313,  -314,  -314,  -314,  -314,  -314,  -314,
    -314,  -314,  -314,  -314,   233,  -314,  -314,   357,   354,  -314,
     -68,  -314,  -314,  -314,  -314,  -314,  -314,   -29,   217,  -314,
    -314,  -314,  -314,  -314,  -314,   103,  -314,  -205,  -314,    35,
    -312,    62,  -314,   186,   252,  -314,   320,  -114,   341,  -314,
     396,  -314,   292,  -202,   454,   -43,  -167,  -314,  -314,  -314,
     -66,  -314,   -91,   250
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -246
static const short int yytable[] =
{
      55,   104,   124,   243,   181,   381,    86,   384,   184,   533,
     -83,   -39,   260,   536,   538,   107,   423,   150,     1,   434,
       2,    99,     3,     4,   548,    67,   158,   159,   160,   161,
     438,   105,   140,   125,    25,   100,     5,    23,   451,     6,
      26,   244,   134,     7,   142,    30,    31,    32,    33,    34,
      67,   256,   143,   175,    27,   246,   127,   257,   150,   453,
     379,   549,   424,   132,   429,    86,   156,   155,   148,    41,
     157,   429,   379,   550,   108,     8,   -70,   534,   138,   162,
     342,   537,   539,   146,   452,   101,   240,     5,   146,   356,
      86,   439,     9,   435,    58,   249,   357,     5,    35,   360,
     361,   -83,   176,   261,    58,   454,   440,   185,   441,   380,
      10,   150,   449,   430,    40,   186,   187,   490,    11,   345,
     432,   433,   494,    43,    44,    75,    76,    77,    78,   146,
      79,   449,    45,    80,    81,    82,    83,   507,    84,    75,
      76,    77,    78,    46,    79,   -71,    47,    80,    81,    82,
      83,   241,    84,   419,   318,   242,   283,   421,   284,   291,
      59,   450,   -43,   245,   247,   248,   204,    71,   496,    60,
      59,   343,   -44,   347,   497,   498,   185,    61,    62,    60,
     552,    56,   146,    57,   186,   187,    50,    61,    62,    72,
      51,   283,   366,   284,    52,   491,    92,  -245,   318,   492,
     301,   290,    73,   300,   292,   293,   294,   295,   296,   297,
      80,    81,    82,    83,    93,   384,    96,    98,   481,    59,
     482,   298,   106,   305,   150,   307,   308,   320,   321,   322,
     323,   324,   325,   326,   327,   328,   329,   330,   331,   332,
     123,   470,   344,    74,   560,   292,   293,   294,   295,   296,
     297,   349,   350,   351,   352,   130,   358,   484,   126,   128,
     362,   363,   302,   135,   444,   318,   369,    75,    76,    77,
      78,   131,    79,   137,   136,    80,    81,    82,    83,   141,
      84,    75,    76,    77,    78,   509,    79,   511,   147,   315,
     168,   386,   169,   170,    84,   146,   390,   391,   392,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   172,   171,
     270,   271,   272,   273,   274,   275,   276,   277,   173,   278,
     279,   280,   281,   282,    75,    76,    77,    78,   223,    79,
     174,   177,   224,   261,   180,   486,   487,    84,   194,   196,
     197,   198,   250,   202,   251,   253,   259,   262,   -23,   264,
     455,   456,   457,   458,   459,   460,   461,   462,   463,   464,
     465,   466,   467,   468,   469,   266,   471,   472,   473,   474,
     475,   476,   477,   478,    75,    76,    77,    78,    50,    79,
     483,   267,   346,   268,   522,   488,    52,    84,   289,   526,
     304,   283,   495,   284,   285,   286,   501,   306,   309,    75,
      76,    77,    78,   223,    79,   505,   312,   224,   508,   319,
     510,   205,    84,   206,   207,   208,   354,   355,   359,   364,
     378,   367,   209,   210,   211,   368,   388,  -244,   212,   213,
     214,   524,   417,   215,   420,   557,   513,    75,    76,    77,
      78,   142,    79,   422,   333,    80,    81,    82,    83,   143,
      84,   334,   418,   519,   520,   425,    75,    76,    77,    78,
     426,    79,   428,   216,   445,   427,   217,   218,   219,    84,
     447,   448,   479,   531,   485,   480,   220,   500,   502,   503,
     221,   512,   222,   515,   514,   543,   516,   517,   518,   528,
     527,   545,   335,   336,   546,   529,   547,   530,   532,    75,
      76,    77,    78,   223,    79,   544,   535,   224,   541,   553,
     554,   225,    84,    75,    76,    77,    78,   555,    79,   558,
     561,  -221,    42,   389,    97,   183,    84,   559,    75,    76,
      77,    78,   223,    79,   226,   193,   337,    81,    82,    83,
     338,    84,   393,   166,   374,   200,   179,   199,   394,   395,
     504,   385,   339,   340,   341,   396,   397,   398,   399,   400,
     401,   402,   542,   525,   375,   446,   265,   303,   182,   403,
     404,   405,   406,    75,    76,    77,    78,    35,    79,   348,
     145,    80,    81,    82,    83,   387,    84,    75,    76,    77,
      78,     0,    79,     0,     0,    80,    81,    82,    83,     0,
      84,    75,    76,    77,    78,     0,    79,     0,     0,   370,
      81,    82,    83,     0,    84,     0,   407,     0,     0,   408,
       0,     0,     0,     0,   409,   410,   411,   412,   413,   414,
     415,   416,    75,    76,    77,    78,     0,    79,     0,     0,
     382,    81,    82,    83,     0,    84,    75,    76,    77,    78,
       0,    79,     0,     0,   489,    81,    82,    83,     0,    84,
      75,    76,    77,    78,     0,    79,     0,     0,   506,    81,
      82,    83,     0,    84,    75,    76,    77,    78,     0,    79,
       0,     0,   521,     0,     0,     0,     0,    84
};

static const short int yycheck[] =
{
      29,    69,    93,   205,   171,   318,    49,   319,     5,     4,
       4,     4,   217,     4,     4,    72,    72,   131,     4,    11,
       6,    14,     8,     9,    27,    39,    49,    50,    51,    52,
       4,    74,   123,    94,   106,    28,    22,     7,    72,    25,
     107,    14,   108,    29,   102,    49,    50,    51,    52,    53,
      64,   100,   110,    72,   118,    14,    99,   106,   172,    72,
      72,    64,   118,   106,    72,   108,   102,   133,   129,     0,
     106,    72,    72,    76,   131,    61,    73,    72,    72,   102,
     285,    72,    72,   126,   118,    78,   200,    22,   131,   291,
     133,    65,    78,    85,    29,   209,   298,    22,   102,   301,
     302,    95,   121,   217,    29,   118,    80,   104,    82,   121,
      96,   225,    72,   121,     4,   112,   113,   429,   104,   286,
     121,   121,   434,     4,   107,    98,    99,   100,   101,   172,
     103,    72,     4,   106,   107,   108,   109,   449,   111,    98,
      99,   100,   101,    72,   103,    73,    72,   106,   107,   108,
     109,   102,   111,   355,   268,   106,   114,   359,   116,    10,
      95,   121,    97,   206,   207,   208,   195,   106,    77,   104,
      95,   285,    97,   287,    83,    84,   104,   112,   113,   104,
     121,   102,   225,   102,   112,   113,   102,   112,   113,   107,
     106,   114,   306,   116,   110,    15,   102,   120,   312,    19,
      10,   244,   119,   246,    55,    56,    57,    58,    59,    60,
     106,   107,   108,   109,   117,   527,     4,    97,   420,    95,
     422,    72,    74,   252,   338,   254,   255,   270,   271,   272,
     273,   274,   275,   276,   277,   278,   279,   280,   281,   282,
     117,   408,   285,    74,   557,    55,    56,    57,    58,    59,
      60,    16,    17,    18,    19,     4,   299,   424,   107,   106,
     303,   304,    72,   120,   378,   379,   309,    98,    99,   100,
     101,   110,   103,     4,   120,   106,   107,   108,   109,     4,
     111,    98,    99,   100,   101,   452,   103,   454,    72,   106,
     117,   334,   103,    95,   111,   338,   339,   340,   341,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    72,   118,
      33,    34,    35,    36,    37,    38,    39,    40,   121,    42,
      43,    44,    45,    46,    98,    99,   100,   101,   102,   103,
     121,     4,   106,   447,   106,   426,   427,   111,   119,     4,
       4,    73,   102,    73,   102,   106,   120,   120,   107,     4,
     393,   394,   395,   396,   397,   398,   399,   400,   401,   402,
     403,   404,   405,   406,   407,     4,   409,   410,   411,   412,
     413,   414,   415,   416,    98,    99,   100,   101,   102,   103,
     423,     4,   106,   120,   498,   428,   110,   111,    20,   503,
      72,   114,   435,   116,   117,   118,   439,    72,   117,    98,
      99,   100,   101,   102,   103,   448,   120,   106,   451,   120,
     453,    10,   111,    12,    13,    14,   102,    10,    10,   102,
      20,   102,    21,    22,    23,   102,   102,   120,    27,    28,
      29,   499,   119,    32,    10,   549,   479,    98,    99,   100,
     101,   102,   103,    10,    14,   106,   107,   108,   109,   110,
     111,    21,   120,   496,   497,    72,    98,    99,   100,   101,
     117,   103,    20,    62,   106,   117,    65,    66,    67,   111,
     117,    20,   117,   516,   102,   106,    75,     4,     4,    20,
      79,   119,    81,   119,   121,   528,    20,   120,     4,    20,
     120,   534,    62,    63,   537,   119,   539,   119,   106,    98,
      99,   100,   101,   102,   103,   121,     4,   106,     4,     4,
       4,   110,   111,    98,    99,   100,   101,     4,   103,     4,
     102,   120,    13,   338,    64,   175,   111,   556,    98,    99,
     100,   101,   102,   103,   200,   179,   106,   107,   108,   109,
     110,   111,    41,   139,   311,   191,   167,   190,    47,    48,
     447,   334,   122,   123,   124,    54,    55,    56,    57,    58,
      59,    60,   527,   501,   312,   379,   225,   247,   172,    68,
      69,    70,    71,    98,    99,   100,   101,   102,   103,   287,
     126,   106,   107,   108,   109,   335,   111,    98,    99,   100,
     101,    -1,   103,    -1,    -1,   106,   107,   108,   109,    -1,
     111,    98,    99,   100,   101,    -1,   103,    -1,    -1,   106,
     107,   108,   109,    -1,   111,    -1,   115,    -1,    -1,   118,
      -1,    -1,    -1,    -1,   123,   124,   125,   126,   127,   128,
     129,   130,    98,    99,   100,   101,    -1,   103,    -1,    -1,
     106,   107,   108,   109,    -1,   111,    98,    99,   100,   101,
      -1,   103,    -1,    -1,   106,   107,   108,   109,    -1,   111,
      98,    99,   100,   101,    -1,   103,    -1,    -1,   106,   107,
     108,   109,    -1,   111,    98,    99,   100,   101,    -1,   103,
      -1,    -1,   106,    -1,    -1,    -1,    -1,   111
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,     9,    22,    25,    29,    61,    78,
      96,   104,   133,   134,   135,   136,   138,   139,   140,   150,
     153,   154,   168,     7,   137,   106,   107,   118,   155,   141,
      49,    50,    51,    52,    53,   102,   209,   210,   169,   151,
       4,     0,   135,     4,   107,     4,    72,    72,   238,   239,
     102,   106,   110,   233,   234,   209,   102,   102,    29,    95,
     104,   112,   113,   142,   144,   145,   152,   153,   200,   201,
     202,   106,   107,   119,    74,    98,    99,   100,   101,   103,
     106,   107,   108,   109,   111,   229,   237,   240,   242,   243,
     244,   156,   102,   117,   170,   143,     4,   145,    97,    14,
      28,    78,   146,   147,   202,   237,    74,    72,   131,    86,
      87,    88,    89,    90,    91,    92,    93,    94,   163,   164,
     176,   177,   178,   117,   244,   176,   107,   237,   106,   148,
       4,   110,   237,   241,   242,   120,   120,     4,    72,   162,
     244,     4,   102,   110,   235,   236,   237,    72,   176,   149,
     229,   230,   231,   232,   236,   242,   102,   106,    49,    50,
      51,    52,   102,   165,   166,   157,   178,   171,   117,   103,
      95,   118,    72,   121,   121,    72,   121,     4,   158,   158,
     106,   238,   232,   166,     5,   104,   112,   113,   159,   167,
     197,   198,   199,   167,   119,   160,     4,     4,    73,   199,
     200,   203,    73,   161,   209,    10,    12,    13,    14,    21,
      22,    23,    27,    28,    29,    32,    62,    65,    66,    67,
      75,    79,    81,   102,   106,   110,   142,   172,   187,   189,
     193,   205,   211,   212,   213,   215,   216,   217,   219,   227,
     229,   102,   106,   235,    14,   237,    14,   237,   237,   229,
     102,   102,   206,   106,   207,   208,   100,   106,   245,   120,
     219,   229,   120,   214,     4,   230,     4,     4,   120,   220,
      33,    34,    35,    36,    37,    38,    39,    40,    42,    43,
      44,    45,    46,   114,   116,   117,   118,   218,   185,    20,
     237,    10,    55,    56,    57,    58,    59,    60,    72,   228,
     237,    10,    72,   228,    72,   209,    72,   209,   209,   117,
     194,   195,   120,   173,   190,   106,   225,   226,   229,   120,
     237,   237,   237,   237,   237,   237,   237,   237,   237,   237,
     237,   237,   237,    14,    21,    62,    63,   106,   110,   122,
     123,   124,   219,   229,   237,   238,   106,   229,   234,    16,
      17,    18,    19,   186,   102,    10,   235,   235,   237,    10,
     235,   235,   237,   237,   102,   204,   229,   102,   102,   237,
     106,   196,   222,   237,   196,   226,   180,   191,    20,    72,
     121,   185,   106,   221,   222,   210,   237,   245,   102,   149,
     237,   237,   237,    41,    47,    48,    54,    55,    56,    57,
      58,    59,    60,    68,    69,    70,    71,   115,   118,   123,
     124,   125,   126,   127,   128,   129,   130,   119,   120,   235,
      10,   235,    10,    72,   118,    72,   117,   117,    20,    72,
     121,   223,   121,   121,    11,    85,   175,   181,     4,    65,
      80,    82,   188,   192,   229,   106,   225,   117,    20,    72,
     121,    72,   118,    72,   118,   237,   237,   237,   237,   237,
     237,   237,   237,   237,   237,   237,   237,   237,   237,   237,
     238,   237,   237,   237,   237,   237,   237,   237,   237,   117,
     106,   235,   235,   237,   238,   102,   244,   244,   237,   106,
     222,    15,    19,   224,   222,   237,    77,    83,    84,   179,
       4,   237,     4,    20,   217,   237,   106,   222,   237,   238,
     237,   238,   119,   237,   121,   119,    20,   120,     4,   237,
     237,   106,   229,   174,   202,   223,   229,   120,    20,   119,
     119,   237,   106,     4,    72,     4,     4,    72,     4,    72,
     182,     4,   221,   237,   121,   237,   237,   237,    27,    64,
      76,   183,   121,     4,     4,     4,   184,   229,     4,   209,
     185,   102
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
    { 								\
      yyerror ("syntax error: cannot back up");\
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

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)		\
do {								\
  if (yydebug)							\
    {								\
      YYFPRINTF (stderr, "%s ", Title);				\
      yysymprint (stderr, 					\
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
  unsigned int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %u), ",
             yyrule - 1, yylno);
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
   SIZE_MAX < YYSTACK_BYTES (YYMAXDEPTH)
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
int yyparse (void);
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
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  /* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;

  register int yystate;
  register int yyn;
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
  register short int *yyssp;

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


  yyvsp[0] = yylval;

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
	short int *yyss1 = yyss;
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
#line 442 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 5:
#line 451 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 6:
#line 452 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 7:
#line 453 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 8:
#line 454 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 455 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 456 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 457 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 12:
#line 458 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 13:
#line 459 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 14:
#line 462 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 15:
#line 463 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 16:
#line 467 "compilers/imcc/imcc.y"
    { if ((yyvsp[0].s))
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 17:
#line 475 "compilers/imcc/imcc.y"
    {
            STRING *hll_name, *hll_lib;
            hll_name = string_unescape_cstring(interp, (yyvsp[-2].s) + 1, '"', NULL);
            hll_lib =  string_unescape_cstring(interp, (yyvsp[0].s) + 1, '"', NULL);
            IMCC_INFO(interp)->HLL_id =
                Parrot_register_HLL(interp, hll_name, hll_lib);
            (yyval.t) = 0;
         }
    break;

  case 18:
#line 484 "compilers/imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                IMCC_INFO(interp)->HLL_id, atoi((yyvsp[-2].s)), atoi((yyvsp[0].s)));
             (yyval.t) = 0;
         }
    break;

  case 19:
#line 493 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 20:
#line 499 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 21:
#line 507 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 22:
#line 508 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1);is_def=0; }
    break;

  case 23:
#line 512 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 24:
#line 513 "compilers/imcc/imcc.y"
    { (yyval.i) = mk_pmc_const(interp, cur_unit, (yyvsp[-3].s), (yyvsp[-2].sr), (yyvsp[0].s));is_def=0; }
    break;

  case 27:
#line 521 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 28:
#line 522 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 29:
#line 523 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 30:
#line 524 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 31:
#line 525 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 33:
#line 529 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 34:
#line 531 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, cur_unit, (yyvsp[-1].s),0,regs,nargs,keyvec,1);
                     free((yyvsp[-1].s)); }
    break;

  case 35:
#line 534 "compilers/imcc/imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                    }
    break;

  case 36:
#line 539 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, (yyvsp[0].s)));
                     cur_call->pcc_sub->pragma = (yyvsp[-1].t);
                   }
    break;

  case 37:
#line 545 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[0].sr)); }
    break;

  case 38:
#line 547 "compilers/imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, (yyvsp[0].s));
                       set_lexical(interp, r, (yyvsp[-2].s)); (yyval.i) = 0;
                   }
    break;

  case 39:
#line 551 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 41:
#line 559 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 42:
#line 561 "compilers/imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     (yyval.i)=0; }
    break;

  case 45:
#line 576 "compilers/imcc/imcc.y"
    {
                    int re_open = 0;
                    (yyval.i)=0;
                    if (IMCC_INFO(interp)->state->pasm_file && cur_namespace) {
                        imc_close_unit(interp, cur_unit);
                        re_open = 1;
                    }
                    IMCC_INFO(interp)->cur_namespace = (yyvsp[-1].sr);
                    cur_namespace = (yyvsp[-1].sr);
                    if (re_open)
                        cur_unit = imc_open_unit(interp, IMC_PASM);
                }
    break;

  case 46:
#line 592 "compilers/imcc/imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 47:
#line 596 "compilers/imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, (yyvsp[0].sr));
        }
    break;

  case 48:
#line 599 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = (yyvsp[-1].t); }
    break;

  case 49:
#line 601 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; }
    break;

  case 50:
#line 605 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 51:
#line 606 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 52:
#line 607 "compilers/imcc/imcc.y"
    { 
         if (adv_named_id) {
             add_pcc_named_param(interp,cur_call,adv_named_id,(yyvsp[-1].sr));
             adv_named_id = NULL;
         } else add_pcc_param(cur_call, (yyvsp[-1].sr));
   }
    break;

  case 53:
#line 616 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 54:
#line 616 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[0].sr); is_def=0; }
    break;

  case 55:
#line 620 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_ident(interp, (yyvsp[-1].s), (yyvsp[-2].t));
                                         (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 56:
#line 622 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_ident(interp, (yyvsp[0].s), (yyvsp[-3].t));
                                         adv_named_id = (yyvsp[-2].s);}
    break;

  case 57:
#line 627 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  }
    break;

  case 59:
#line 632 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 60:
#line 636 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; cur_unit->outer =
                     mk_sub_address_fromc(interp, (yyvsp[-1].s)); }
    break;

  case 61:
#line 639 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; cur_unit->outer =
                     mk_const(interp, (yyvsp[-1].s), 'S'); }
    break;

  case 62:
#line 644 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 63:
#line 645 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; add_pcc_multi(cur_call, (yyvsp[0].sr)); }
    break;

  case 64:
#line 646 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  add_pcc_multi(cur_call, (yyvsp[0].sr));}
    break;

  case 65:
#line 650 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 66:
#line 651 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 67:
#line 652 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 68:
#line 653 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 69:
#line 654 "compilers/imcc/imcc.y"
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

  case 72:
#line 672 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 73:
#line 674 "compilers/imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, (yyvsp[0].s)));

         }
    break;

  case 74:
#line 678 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = (yyvsp[-1].t); }
    break;

  case 75:
#line 680 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; }
    break;

  case 76:
#line 685 "compilers/imcc/imcc.y"
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

  case 77:
#line 712 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; }
    break;

  case 78:
#line 716 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 79:
#line 717 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 80:
#line 721 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; }
    break;

  case 81:
#line 723 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->object = (yyvsp[-1].sr); }
    break;

  case 82:
#line 727 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 84:
#line 732 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[0].t); }
    break;

  case 85:
#line 733 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[-2].t) | (yyvsp[0].t); }
    break;

  case 86:
#line 737 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_LOAD; }
    break;

  case 87:
#line 738 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_MAIN; }
    break;

  case 88:
#line 739 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_IMMEDIATE; }
    break;

  case 89:
#line 740 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_POSTCOMP; }
    break;

  case 90:
#line 741 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_ANON; }
    break;

  case 91:
#line 742 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_METHOD; }
    break;

  case 92:
#line 743 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_NEED_LEX; }
    break;

  case 95:
#line 750 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, (yyvsp[-3].sr));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         }
    break;

  case 96:
#line 755 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-1].sr)); }
    break;

  case 97:
#line 757 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, (yyvsp[-1].sr));
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 98:
#line 762 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-1].sr)); }
    break;

  case 99:
#line 764 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, (yyvsp[-1].s),'S')); }
    break;

  case 100:
#line 766 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-3].sr));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         }
    break;

  case 101:
#line 770 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, (yyvsp[-3].s),'S'));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         }
    break;

  case 102:
#line 777 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 103:
#line 778 "compilers/imcc/imcc.y"
    {  add_pcc_arg(cur_call, (yyvsp[-1].sr)); }
    break;

  case 104:
#line 782 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 105:
#line 787 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 106:
#line 788 "compilers/imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_result(cur_call, (yyvsp[-1].sr)); }
    break;

  case 107:
#line 792 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 108:
#line 793 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 109:
#line 794 "compilers/imcc/imcc.y"
    {  mk_ident(interp, (yyvsp[0].s), (yyvsp[-1].t)); is_def=0; (yyval.sr)=0; }
    break;

  case 110:
#line 798 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 111:
#line 799 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); }
    break;

  case 112:
#line 803 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_FLAT;   }
    break;

  case 113:
#line 804 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPTIONAL; }
    break;

  case 114:
#line 805 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPT_FLAG; }
    break;

  case 115:
#line 806 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_NAMED; }
    break;

  case 116:
#line 807 "compilers/imcc/imcc.y"
    {  adv_named_id = (yyvsp[-1].s); (yyval.t) = 0; }
    break;

  case 117:
#line 812 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 118:
#line 813 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; }
    break;

  case 121:
#line 823 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, (yyvsp[-1].t)); }
    break;

  case 122:
#line 826 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 123:
#line 827 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.i) = 0;  }
    break;

  case 124:
#line 833 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 125:
#line 834 "compilers/imcc/imcc.y"
    {
       if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); 
   }
    break;

  case 126:
#line 837 "compilers/imcc/imcc.y"
    {
       if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); 
   }
    break;

  case 127:
#line 843 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 128:
#line 848 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 129:
#line 853 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 130:
#line 855 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 131:
#line 860 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 132:
#line 864 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 133:
#line 865 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id, (yyvsp[0].sr));
          adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr)); }
    break;

  case 134:
#line 871 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[-2].s),(yyvsp[0].sr));}
    break;

  case 135:
#line 873 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id,(yyvsp[0].sr));
           adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr));    }
    break;

  case 136:
#line 879 "compilers/imcc/imcc.y"
    {  
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,(yyvsp[-2].s),(yyvsp[0].sr));}
    break;

  case 139:
#line 898 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 140:
#line 903 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[0].i); }
    break;

  case 141:
#line 904 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 142:
#line 905 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 143:
#line 906 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 144:
#line 910 "compilers/imcc/imcc.y"
    {  (yyval.i) = NULL; }
    break;

  case 148:
#line 920 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iLABEL(cur_unit, mk_local_label(interp, (yyvsp[0].s)));
                   }
    break;

  case 149:
#line 927 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[-1].i); }
    break;

  case 150:
#line 931 "compilers/imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = (yyvsp[0].s);
            (yyval.idlist) = l;
         }
    break;

  case 151:
#line 939 "compilers/imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = (yyvsp[0].s);
           l->next = (yyvsp[-2].idlist);
           (yyval.idlist) = l;
        }
    break;

  case 154:
#line 949 "compilers/imcc/imcc.y"
    { push_namespace((yyvsp[0].s)); }
    break;

  case 155:
#line 950 "compilers/imcc/imcc.y"
    { pop_namespace((yyvsp[0].s)); }
    break;

  case 156:
#line 951 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 157:
#line 952 "compilers/imcc/imcc.y"
    {
        IdList* l = (yyvsp[0].idlist);
         while(l) {
             IdList* l1;
             mk_ident(interp, l->id, (yyvsp[-1].t));
             l1 = l;
             l = l->next;
             free(l1);
     }
    is_def=0; (yyval.i)=0;

   }
    break;

  case 158:
#line 965 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, (yyvsp[0].sr), (yyvsp[-2].s)); (yyval.i) = 0;
                    }
    break;

  case 159:
#line 968 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 160:
#line 969 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 0);is_def=0; }
    break;

  case 162:
#line 971 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 163:
#line 972 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1);is_def=0; }
    break;

  case 164:
#line 973 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 165:
#line 977 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "branch",1, (yyvsp[0].sr)); }
    break;

  case 166:
#line 979 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, cur_unit, (yyvsp[-1].s), 0, regs, nargs, keyvec, 1);
                                          free((yyvsp[-1].s)); }
    break;

  case 167:
#line 982 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[0].sr)); }
    break;

  case 168:
#line 983 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; cur_call = NULL; }
    break;

  case 169:
#line 984 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 171:
#line 986 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 172:
#line 990 "compilers/imcc/imcc.y"
    { (yyval.t) = 'I'; }
    break;

  case 173:
#line 991 "compilers/imcc/imcc.y"
    { (yyval.t) = 'N'; }
    break;

  case 174:
#line 992 "compilers/imcc/imcc.y"
    { (yyval.t) = 'S'; }
    break;

  case 175:
#line 993 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 176:
#line 994 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 177:
#line 995 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; free((yyvsp[0].s)); }
    break;

  case 178:
#line 1000 "compilers/imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, (yyvsp[0].s), 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", (yyvsp[0].s));
            }
         }
    break;

  case 179:
#line 1010 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "set", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 180:
#line 1011 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "not", 2, (yyvsp[-3].sr), (yyvsp[0].sr));}
    break;

  case 181:
#line 1012 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "neg", 2, (yyvsp[-3].sr), (yyvsp[0].sr));}
    break;

  case 182:
#line 1013 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bnot", 2, (yyvsp[-3].sr), (yyvsp[0].sr));}
    break;

  case 183:
#line 1014 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "add", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 184:
#line 1015 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "sub", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 185:
#line 1016 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mul", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 186:
#line 1017 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "pow", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 187:
#line 1018 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "div", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 188:
#line 1019 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "fdiv", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 189:
#line 1020 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mod", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 190:
#line 1021 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "concat", 3, (yyvsp[-4].sr),(yyvsp[-2].sr),(yyvsp[0].sr)); }
    break;

  case 191:
#line 1022 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "iseq", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 192:
#line 1023 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isne", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 193:
#line 1024 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isgt", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 194:
#line 1025 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "islt", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 195:
#line 1026 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isle", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 196:
#line 1027 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isge", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 197:
#line 1029 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shl", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 198:
#line 1031 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 199:
#line 1033 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "lsr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 200:
#line 1035 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "and", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 201:
#line 1037 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "or", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 202:
#line 1039 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "xor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 203:
#line 1041 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "band", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 204:
#line 1043 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 205:
#line 1045 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bxor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 206:
#line 1047 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); }
    break;

  case 207:
#line 1049 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[0].sr)); }
    break;

  case 208:
#line 1051 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-2].s), (yyvsp[0].sr), 1); }
    break;

  case 209:
#line 1053 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-6].sr), (yyvsp[-3].s), (yyvsp[-1].sr), 1); }
    break;

  case 210:
#line 1055 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-3].sr), (yyvsp[0].s), NULL, 1); }
    break;

  case 211:
#line 1057 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[-3].sr), (yyvsp[0].sr)); }
    break;

  case 212:
#line 1059 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 213:
#line 1061 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-6].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); }
    break;

  case 214:
#line 1063 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "set_addr",
                            2, (yyvsp[-3].sr), mk_label_address(interp, (yyvsp[0].s))); }
    break;

  case 215:
#line 1066 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "find_global",2,(yyvsp[-3].sr),(yyvsp[0].sr));}
    break;

  case 216:
#line 1068 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "store_global",2, (yyvsp[-2].sr),(yyvsp[0].sr)); }
    break;

  case 217:
#line 1072 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 218:
#line 1074 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 219:
#line 1076 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); }
    break;

  case 220:
#line 1079 "compilers/imcc/imcc.y"
    {
            add_pcc_result((yyvsp[0].i)->r[0], (yyvsp[-2].sr));
            cur_call = NULL;
            (yyval.i) = 0;
         }
    break;

  case 221:
#line 1085 "compilers/imcc/imcc.y"
    {
            (yyval.i) = IMCC_create_itcall_label(interp);
         }
    break;

  case 222:
#line 1089 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[-3].sr));
           cur_call = NULL;
         }
    break;

  case 226:
#line 1097 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[-2].sr)); }
    break;

  case 227:
#line 1100 "compilers/imcc/imcc.y"
    { (yyval.i) = IMCC_create_itcall_label(interp);
                           (yyval.i)->type &= ~ITCALL; (yyval.i)->type |= ITRESULT; }
    break;

  case 228:
#line 1102 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 229:
#line 1107 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "add", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 230:
#line 1109 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "sub", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 231:
#line 1111 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mul", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 232:
#line 1113 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "div", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 233:
#line 1115 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mod", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 234:
#line 1117 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "fdiv", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 235:
#line 1119 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "concat", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 236:
#line 1121 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "band", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 237:
#line 1123 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 238:
#line 1125 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bxor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 239:
#line 1127 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 240:
#line 1129 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shl", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 241:
#line 1131 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "lsr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 242:
#line 1136 "compilers/imcc/imcc.y"
    { (yyval.i) = func_ins(interp, cur_unit, (yyvsp[-3].sr), (yyvsp[-1].s),
                                   regs,nargs,keyvec,1);
                     free((yyvsp[-1].s));
                   }
    break;

  case 243:
#line 1142 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); }
    break;

  case 244:
#line 1143 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); }
    break;

  case 245:
#line 1144 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[0].sr);
                       if ((yyvsp[0].sr)->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 246:
#line 1149 "compilers/imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 247:
#line 1150 "compilers/imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); }
    break;

  case 248:
#line 1151 "compilers/imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 249:
#line 1154 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 250:
#line 1155 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 251:
#line 1160 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[0].sr));
        }
    break;

  case 252:
#line 1165 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[-3].i); }
    break;

  case 253:
#line 1169 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 254:
#line 1170 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call, adv_named_id, (yyvsp[0].sr));
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, (yyvsp[0].sr)); 
   }
    break;

  case 255:
#line 1176 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call,adv_named_id,(yyvsp[0].sr));
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, (yyvsp[0].sr));
   }
    break;

  case 256:
#line 1182 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0;
                                     add_pcc_named_arg(interp,cur_call,(yyvsp[-2].s),(yyvsp[0].sr));}
    break;

  case 257:
#line 1184 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_named_arg(interp,cur_call,(yyvsp[-2].s),(yyvsp[0].sr));}
    break;

  case 258:
#line 1188 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 259:
#line 1192 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 260:
#line 1193 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); }
    break;

  case 261:
#line 1197 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT; }
    break;

  case 262:
#line 1198 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_NAMED; }
    break;

  case 263:
#line 1199 "compilers/imcc/imcc.y"
    { adv_named_id = (yyvsp[-1].s); (yyval.t) = 0; }
    break;

  case 264:
#line 1202 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 265:
#line 1206 "compilers/imcc/imcc.y"
    { 
         (yyval.sr) = 0;
         if (adv_named_id) {
             add_pcc_named_result(interp,cur_call,adv_named_id,(yyvsp[0].sr));
             adv_named_id = NULL;
         } else add_pcc_result(cur_call, (yyvsp[0].sr)); }
    break;

  case 266:
#line 1212 "compilers/imcc/imcc.y"
    { 
        add_pcc_named_result(interp,cur_call,(yyvsp[-2].s),(yyvsp[0].sr)); }
    break;

  case 267:
#line 1214 "compilers/imcc/imcc.y"
    { 
       (yyval.sr) = 0;
       if (adv_named_id) {
           add_pcc_named_result(interp,cur_call,adv_named_id,(yyvsp[0].sr));
           adv_named_id = NULL;
       } else add_pcc_result(cur_call, (yyvsp[0].sr)); }
    break;

  case 268:
#line 1220 "compilers/imcc/imcc.y"
    { add_pcc_named_result(interp,cur_call,(yyvsp[-2].s),(yyvsp[0].sr)); }
    break;

  case 269:
#line 1221 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 270:
#line 1226 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, (yyvsp[-3].s), 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 271:
#line 1228 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, inv_op((yyvsp[-3].s)), 3, (yyvsp[-4].sr),(yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 272:
#line 1230 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 273:
#line 1232 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 274:
#line 1234 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 275:
#line 1236 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless",2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 276:
#line 1238 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 277:
#line 1240 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 278:
#line 1244 "compilers/imcc/imcc.y"
    {  (yyval.s) = "eq"; }
    break;

  case 279:
#line 1245 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ne"; }
    break;

  case 280:
#line 1246 "compilers/imcc/imcc.y"
    {  (yyval.s) = "gt"; }
    break;

  case 281:
#line 1247 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ge"; }
    break;

  case 282:
#line 1248 "compilers/imcc/imcc.y"
    {  (yyval.s) = "lt"; }
    break;

  case 283:
#line 1249 "compilers/imcc/imcc.y"
    {  (yyval.s) = "le"; }
    break;

  case 286:
#line 1258 "compilers/imcc/imcc.y"
    {  (yyval.sr) = NULL; }
    break;

  case 287:
#line 1259 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 288:
#line 1263 "compilers/imcc/imcc.y"
    { (yyval.sr) = regs[0]; }
    break;

  case 290:
#line 1268 "compilers/imcc/imcc.y"
    {  regs[nargs++] = (yyvsp[0].sr); }
    break;

  case 291:
#line 1270 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = (yyvsp[-3].sr);
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = (yyvsp[-1].sr); (yyval.sr) = (yyvsp[-3].sr);
                   }
    break;

  case 293:
#line 1278 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); }
    break;

  case 294:
#line 1282 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); }
    break;

  case 295:
#line 1283 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); }
    break;

  case 296:
#line 1287 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); }
    break;

  case 297:
#line 1288 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); }
    break;

  case 302:
#line 1301 "compilers/imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 303:
#line 1302 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp, nkeys, keys); }
    break;

  case 304:
#line 1306 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[0].sr); }
    break;

  case 305:
#line 1308 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[0].sr); (yyval.sr) =  keys[0]; }
    break;

  case 306:
#line 1309 "compilers/imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 307:
#line 1310 "compilers/imcc/imcc.y"
    { keys[nkeys++] = (yyvsp[0].sr); (yyval.sr) =  keys[0]; }
    break;

  case 308:
#line 1314 "compilers/imcc/imcc.y"
    { if (in_slice) {
                         (yyvsp[0].sr)->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     (yyval.sr) = (yyvsp[0].sr);
                   }
    break;

  case 309:
#line 1320 "compilers/imcc/imcc.y"
    { (yyvsp[-2].sr)->type |= VT_START_SLICE;  (yyvsp[0].sr)->type |= VT_END_SLICE;
                     keys[nkeys++] = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 310:
#line 1322 "compilers/imcc/imcc.y"
    { (yyvsp[0].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 311:
#line 1323 "compilers/imcc/imcc.y"
    { (yyvsp[-1].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[-1].sr); }
    break;

  case 312:
#line 1327 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'I'); }
    break;

  case 313:
#line 1328 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'N'); }
    break;

  case 314:
#line 1329 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); }
    break;

  case 315:
#line 1330 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'P'); }
    break;

  case 316:
#line 1331 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_pasm_reg(interp, (yyvsp[0].s)); }
    break;

  case 317:
#line 1335 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'I'); }
    break;

  case 318:
#line 1336 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'N'); }
    break;

  case 319:
#line 1337 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); }
    break;

  case 320:
#line 1338 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'U'); }
    break;

  case 321:
#line 1342 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); }
    break;

  case 322:
#line 1343 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); }
    break;


    }

/* Line 1037 of yacc.c.  */
#line 3844 "compilers/imcc/imcparser.c"

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
	  const char* yyprefix;
	  char *yymsg;
	  int yyx;

	  /* Start YYX at -YYN if negative to avoid negative indexes in
	     YYCHECK.  */
	  int yyxbegin = yyn < 0 ? -yyn : 0;

	  /* Stay within bounds of both yycheck and yytname.  */
	  int yychecklim = YYLAST - yyn;
	  int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
	  int yycount = 0;

	  yyprefix = ", expecting ";
	  for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	      {
		yysize += yystrlen (yyprefix) + yystrlen (yytname [yyx]);
		yycount += 1;
		if (yycount == 5)
		  {
		    yysize = 0;
		    break;
		  }
	      }
	  yysize += (sizeof ("syntax error, unexpected ")
		     + yystrlen (yytname[yytype]));
	  yymsg = (char *) YYSTACK_ALLOC (yysize);
	  if (yymsg != 0)
	    {
	      char *yyp = yystpcpy (yymsg, "syntax error, unexpected ");
	      yyp = yystpcpy (yyp, yytname[yytype]);

	      if (yycount < 5)
		{
		  yyprefix = ", expecting ";
		  for (yyx = yyxbegin; yyx < yyxend; ++yyx)
		    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
		      {
			yyp = yystpcpy (yyp, yyprefix);
			yyp = yystpcpy (yyp, yytname[yyx]);
			yyprefix = " or ";
		      }
		}
	      yyerror (yymsg);
	      YYSTACK_FREE (yymsg);
	    }
	  else
	    yyerror ("syntax error; also virtual memory exhausted");
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror ("syntax error");
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* If at end of input, pop the error token,
	     then the rest of the stack, then return failure.  */
	  if (yychar == YYEOF)
	     for (;;)
	       {

		 YYPOPSTACK;
		 if (yyssp == yyss)
		   YYABORT;
		 yydestruct ("Error: popping",
                             yystos[*yyssp], yyvsp);
	       }
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

#ifdef __GNUC__
  /* Pacify GCC when the user code never invokes YYERROR and the label
     yyerrorlab therefore never appears in user code.  */
  if (0)
     goto yyerrorlab;
#endif

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
  yydestruct ("Error: discarding lookahead",
              yytoken, &yylval);
  yychar = YYEMPTY;
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*----------------------------------------------.
| yyoverflowlab -- parser overflow comes here.  |
`----------------------------------------------*/
yyoverflowlab:
  yyerror ("parser stack overflow");
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


#line 1348 "compilers/imcc/imcc.y"



/* XXX how to get an Interp* here */
int yyerror(char * s)
{
    /* support bison 1.75, convert 'parse error to syntax error' */
    if (!memcmp(s, "parse", 5))
        IMCC_fataly(NULL, E_SyntaxError, "syntax%s", s+5);
    else
        IMCC_fataly(NULL, E_SyntaxError, s);
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

