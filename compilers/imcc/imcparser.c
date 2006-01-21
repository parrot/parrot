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
#line 319 "compilers/imcc/imcc.y"
typedef union YYSTYPE {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} YYSTYPE;
/* Line 190 of yacc.c.  */
#line 632 "compilers/imcc/imcparser.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 213 of yacc.c.  */
#line 644 "compilers/imcc/imcparser.c"

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
#define YYLAST   615

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  132
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  113
/* YYNRULES -- Number of rules. */
#define YYNRULES  312
/* YYNRULES -- Number of states. */
#define YYNSTATES  540

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
     145,   146,   148,   152,   153,   159,   160,   162,   167,   172,
     177,   178,   182,   184,   186,   188,   190,   192,   194,   195,
     197,   198,   199,   200,   211,   212,   222,   223,   226,   227,
     231,   232,   234,   236,   240,   242,   244,   246,   248,   250,
     252,   254,   256,   258,   264,   268,   272,   276,   280,   286,
     292,   293,   297,   300,   301,   305,   309,   310,   315,   316,
     319,   321,   323,   325,   330,   332,   334,   336,   338,   339,
     345,   347,   348,   351,   355,   359,   360,   366,   367,   373,
     374,   376,   380,   382,   385,   386,   389,   392,   394,   396,
     397,   399,   402,   404,   406,   410,   412,   416,   418,   420,
     423,   426,   427,   432,   437,   438,   445,   447,   448,   455,
     458,   461,   464,   467,   469,   471,   473,   474,   476,   478,
     480,   482,   484,   486,   488,   492,   497,   502,   507,   513,
     519,   525,   531,   537,   543,   549,   555,   561,   567,   573,
     579,   585,   591,   597,   603,   609,   615,   621,   627,   633,
     639,   645,   652,   659,   666,   674,   679,   684,   691,   699,
     704,   709,   714,   719,   726,   734,   738,   739,   749,   751,
     753,   755,   759,   760,   766,   770,   774,   778,   782,   786,
     790,   794,   798,   802,   806,   810,   814,   818,   823,   825,
     827,   829,   833,   837,   841,   843,   845,   846,   852,   853,
     857,   859,   862,   863,   866,   868,   873,   876,   880,   882,
     883,   890,   897,   903,   909,   914,   919,   924,   929,   931,
     933,   935,   937,   939,   941,   943,   945,   946,   948,   952,
     954,   956,   961,   963,   965,   967,   969,   971,   973,   975,
     977,   979,   981,   982,   985,   987,   991,   992,   997,   999,
    1003,  1006,  1009,  1011,  1013,  1015,  1017,  1019,  1021,  1023,
    1025,  1027,  1029
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     133,     0,    -1,   134,    -1,   135,    -1,   134,   135,    -1,
     153,    -1,   140,    -1,   139,    -1,   154,    -1,   167,    -1,
     150,    -1,   104,     4,    -1,   136,    -1,     4,    -1,     6,
     137,     4,    -1,   138,     4,    -1,     7,   107,    -1,     8,
     106,    72,   106,    -1,     9,   107,    72,   107,    -1,    61,
     208,   102,    -1,    61,   208,   102,   117,   243,    -1,    -1,
      29,   141,   208,   102,   117,   243,    -1,    -1,    29,   143,
     107,   235,   117,   106,    -1,   145,    -1,   144,   145,    -1,
     199,   146,     4,    -1,   104,     4,    -1,   113,    -1,   112,
      -1,   153,    -1,   142,    -1,    -1,   147,   110,   149,    -1,
      -1,    78,   148,   175,    95,    -1,    14,   236,    -1,    28,
     106,    72,   103,    -1,    -1,   229,    -1,    -1,    96,   151,
     152,    97,    -1,    -1,   144,    -1,    22,   118,   237,   119,
      -1,    -1,    -1,    -1,    25,   155,   232,   156,   175,     4,
     157,   158,   166,    73,    -1,    -1,     4,    -1,   158,   159,
       4,    -1,    -1,     5,   160,   208,   102,   184,    -1,    -1,
      72,    -1,    94,   120,   164,   121,    -1,    92,   120,   106,
     121,    -1,    92,   120,   102,   121,    -1,    -1,   164,    72,
     165,    -1,   165,    -1,    49,    -1,    50,    -1,    52,    -1,
      51,    -1,   102,    -1,    -1,   196,    -1,    -1,    -1,    -1,
      78,   168,   102,   169,   175,     4,   170,   158,   166,    73,
      -1,    -1,    75,     4,   172,   179,   174,   178,   173,   181,
      76,    -1,    -1,   201,     4,    -1,    -1,    85,   236,     4,
      -1,    -1,   176,    -1,   177,    -1,   176,   161,   177,    -1,
      87,    -1,    86,    -1,    88,    -1,    89,    -1,    91,    -1,
      90,    -1,    93,    -1,   162,    -1,   163,    -1,    77,   236,
      72,   236,     4,    -1,    77,   236,     4,    -1,    83,   236,
       4,    -1,    84,   228,     4,    -1,    84,   106,     4,    -1,
      84,   228,    72,   236,     4,    -1,    84,   106,    72,   236,
       4,    -1,    -1,   179,   180,     4,    -1,    11,   221,    -1,
      -1,   181,   182,     4,    -1,    64,   228,   184,    -1,    -1,
      27,   183,   208,   102,    -1,    -1,   184,   185,    -1,    16,
      -1,    17,    -1,    18,    -1,    19,   120,   106,   121,    -1,
      79,    -1,    81,    -1,    80,    -1,    82,    -1,    -1,   186,
       4,   189,   190,   187,    -1,   192,    -1,    -1,   190,     4,
      -1,   190,   191,     4,    -1,    65,   236,   222,    -1,    -1,
      65,   120,   193,   195,   121,    -1,    -1,    66,   120,   194,
     195,   121,    -1,    -1,   221,    -1,   195,    72,   221,    -1,
     198,    -1,   196,   198,    -1,    -1,   197,   202,    -1,   104,
       4,    -1,   113,    -1,   112,    -1,    -1,   200,    -1,   200,
     201,    -1,   201,    -1,    95,    -1,   199,   204,     4,    -1,
     102,    -1,   203,    72,   102,    -1,   210,    -1,   226,    -1,
      22,   102,    -1,    23,   102,    -1,    -1,    27,   205,   208,
     203,    -1,    28,   106,    72,   228,    -1,    -1,    29,   206,
     208,   102,   117,   243,    -1,   142,    -1,    -1,    32,   207,
     208,   102,   117,   243,    -1,    65,   218,    -1,    10,   234,
      -1,   110,   229,    -1,    14,   236,    -1,   218,    -1,   171,
      -1,   188,    -1,    -1,    49,    -1,    50,    -1,    51,    -1,
      52,    -1,    53,    -1,   209,    -1,   102,    -1,   228,   117,
     236,    -1,   228,   117,   122,   236,    -1,   228,   117,   123,
     236,    -1,   228,   117,   124,   236,    -1,   228,   117,   236,
     125,   236,    -1,   228,   117,   236,   123,   236,    -1,   228,
     117,   236,   126,   236,    -1,   228,   117,   236,    68,   236,
      -1,   228,   117,   236,   127,   236,    -1,   228,   117,   236,
      41,   236,    -1,   228,   117,   236,   128,   236,    -1,   228,
     117,   236,   115,   236,    -1,   228,   117,   236,    55,   236,
      -1,   228,   117,   236,    56,   236,    -1,   228,   117,   236,
      57,   236,    -1,   228,   117,   236,    59,   236,    -1,   228,
     117,   236,    60,   236,    -1,   228,   117,   236,    58,   236,
      -1,   228,   117,   236,    47,   236,    -1,   228,   117,   236,
      48,   236,    -1,   228,   117,   236,    69,   236,    -1,   228,
     117,   236,    70,   236,    -1,   228,   117,   236,    71,   236,
      -1,   228,   117,   236,    54,   236,    -1,   228,   117,   236,
     129,   236,    -1,   228,   117,   236,   130,   236,    -1,   228,
     117,   236,   124,   236,    -1,   228,   117,   236,   118,   237,
     119,    -1,   228,   118,   237,   119,   117,   236,    -1,   228,
     117,    21,   209,    72,   236,    -1,   228,   117,    21,   209,
     118,   237,   119,    -1,   228,   117,    21,   209,    -1,   228,
     117,    21,   236,    -1,   228,   117,    21,   236,    72,   236,
      -1,   228,   117,    21,   236,   118,   237,   119,    -1,   228,
     117,    63,   102,    -1,   228,   117,    62,   244,    -1,    62,
     244,   117,   236,    -1,    21,   228,    72,   236,    -1,    21,
     228,    72,   236,    72,   236,    -1,    21,   228,    72,   236,
     118,   237,   119,    -1,   228,   117,   218,    -1,    -1,   211,
     120,   225,   121,   117,   216,   120,   220,   121,    -1,   212,
      -1,   214,    -1,   215,    -1,   228,   117,    14,    -1,    -1,
      67,   213,   120,   225,   121,    -1,   228,    33,   236,    -1,
     228,    34,   236,    -1,   228,    35,   236,    -1,   228,    36,
     236,    -1,   228,    43,   236,    -1,   228,    42,   236,    -1,
     228,    37,   236,    -1,   228,    38,   236,    -1,   228,    39,
     236,    -1,   228,    40,   236,    -1,   228,    44,   236,    -1,
     228,    45,   236,    -1,   228,    46,   236,    -1,   228,   117,
     110,   149,    -1,   102,    -1,   106,    -1,   228,    -1,   228,
     217,   233,    -1,   228,   217,   106,    -1,   228,   217,   228,
      -1,   116,    -1,   114,    -1,    -1,   216,   219,   120,   220,
     121,    -1,    -1,   220,    72,   221,    -1,   221,    -1,   236,
     222,    -1,    -1,   222,   223,    -1,    15,    -1,    19,   120,
     106,   121,    -1,   228,   184,    -1,   225,    72,   224,    -1,
     224,    -1,    -1,    12,   236,   227,   236,    10,   234,    -1,
      13,   236,   227,   236,    10,   234,    -1,    12,    14,   236,
      10,   234,    -1,    13,    14,   236,    10,   234,    -1,    12,
     236,    10,   234,    -1,    13,   236,    10,   234,    -1,    12,
     236,    72,   234,    -1,    13,   236,    72,   234,    -1,    55,
      -1,    56,    -1,    57,    -1,    58,    -1,    59,    -1,    60,
      -1,   111,    -1,   242,    -1,    -1,   230,    -1,   230,    72,
     231,    -1,   231,    -1,   235,    -1,   228,   118,   237,   119,
      -1,   233,    -1,   106,    -1,   102,    -1,   110,    -1,   102,
      -1,   110,    -1,   234,    -1,   236,    -1,   228,    -1,   243,
      -1,    -1,   238,   239,    -1,   241,    -1,   239,   131,   241,
      -1,    -1,   239,    72,   240,   241,    -1,   236,    -1,   236,
      74,   236,    -1,    74,   236,    -1,   236,    74,    -1,    98,
      -1,    99,    -1,   100,    -1,   101,    -1,   103,    -1,   107,
      -1,   108,    -1,   106,    -1,   109,    -1,   100,    -1,   106,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   399,   399,   403,   404,   408,   409,   410,   411,   412,
     413,   414,   415,   416,   419,   420,   423,   431,   440,   449,
     455,   464,   464,   469,   469,   473,   474,   478,   479,   480,
     481,   482,   483,   486,   486,   491,   490,   501,   503,   508,
     512,   516,   516,   526,   528,   532,   549,   553,   556,   548,
     562,   563,   564,   577,   577,   583,   584,   588,   591,   594,
     600,   601,   602,   606,   607,   608,   609,   610,   622,   624,
     628,   630,   634,   628,   641,   640,   672,   673,   677,   678,
     683,   684,   688,   689,   693,   694,   695,   696,   697,   698,
     699,   700,   701,   705,   710,   712,   717,   719,   721,   725,
     733,   734,   738,   743,   744,   748,   749,   749,   754,   755,
     759,   760,   761,   762,   767,   768,   772,   773,   778,   777,
     782,   788,   789,   791,   796,   801,   800,   808,   807,   817,
     818,   819,   824,   825,   837,   841,   843,   844,   845,   849,
     850,   854,   855,   859,   865,   869,   877,   886,   887,   888,
     889,   890,   890,   903,   907,   907,   909,   910,   910,   912,
     916,   917,   920,   922,   923,   924,   925,   929,   930,   931,
     932,   933,   934,   938,   949,   950,   951,   952,   953,   954,
     955,   956,   957,   958,   959,   960,   961,   962,   963,   964,
     965,   966,   967,   969,   971,   973,   975,   977,   979,   981,
     983,   985,   987,   989,   991,   993,   995,   997,   999,  1001,
    1004,  1006,  1010,  1012,  1014,  1017,  1024,  1024,  1032,  1033,
    1034,  1035,  1039,  1039,  1045,  1047,  1049,  1051,  1053,  1055,
    1057,  1059,  1061,  1063,  1065,  1067,  1069,  1074,  1081,  1082,
    1083,  1088,  1089,  1090,  1093,  1094,  1099,  1098,  1108,  1109,
    1119,  1132,  1136,  1137,  1141,  1142,  1145,  1149,  1150,  1151,
    1155,  1157,  1159,  1161,  1163,  1165,  1167,  1169,  1174,  1175,
    1176,  1177,  1178,  1179,  1183,  1184,  1188,  1189,  1193,  1194,
    1198,  1199,  1207,  1208,  1212,  1213,  1217,  1218,  1222,  1223,
    1227,  1228,  1231,  1231,  1236,  1237,  1239,  1239,  1244,  1249,
    1252,  1253,  1257,  1258,  1259,  1260,  1261,  1265,  1266,  1267,
    1268,  1272,  1273
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
  "@9", "opt_comma", "multi", "outer", "multi_types", "multi_type",
  "sub_body", "pcc_sub", "@10", "@11", "@12", "pcc_sub_call", "@13",
  "opt_label", "opt_invocant", "sub_proto", "sub_proto_list", "proto",
  "pcc_call", "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@14",
  "paramtype_list", "paramtype", "begin_ret_or_yield", "end_ret_or_yield",
  "pcc_ret", "@15", "pcc_returns", "pcc_return", "pcc_return_many", "@16",
  "@17", "var_returns", "statements", "helper_clear_state", "statement",
  "labels", "_labels", "label", "instruction", "id_list", "labeled_inst",
  "@18", "@19", "@20", "type", "classname", "assignment", "@21",
  "get_results", "@22", "op_assign", "func_assign", "the_sub", "ptr",
  "sub_call", "@23", "arglist", "arg", "argtype_list", "argtype", "result",
  "targetlist", "if_statement", "relop", "target", "vars", "_vars",
  "_var_or_i", "sub_label_op_c", "sub_label_op", "label_op", "var_or_i",
  "var", "keylist", "@24", "_keylist", "@25", "key", "reg", "const",
  "string", 0
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
     158,   158,   158,   160,   159,   161,   161,   162,   163,   163,
     164,   164,   164,   165,   165,   165,   165,   165,   166,   166,
     168,   169,   170,   167,   172,   171,   173,   173,   174,   174,
     175,   175,   176,   176,   177,   177,   177,   177,   177,   177,
     177,   177,   177,   178,   178,   178,   178,   178,   178,   178,
     179,   179,   180,   181,   181,   182,   183,   182,   184,   184,
     185,   185,   185,   185,   186,   186,   187,   187,   189,   188,
     188,   190,   190,   190,   191,   193,   192,   194,   192,   195,
     195,   195,   196,   196,   197,   198,   198,   198,   198,   199,
     199,   200,   200,   201,   202,   203,   203,   204,   204,   204,
     204,   205,   204,   204,   206,   204,   204,   207,   204,   204,
     204,   204,   204,   204,   204,   204,   204,   208,   208,   208,
     208,   208,   208,   209,   210,   210,   210,   210,   210,   210,
     210,   210,   210,   210,   210,   210,   210,   210,   210,   210,
     210,   210,   210,   210,   210,   210,   210,   210,   210,   210,
     210,   210,   210,   210,   210,   210,   210,   210,   210,   210,
     210,   210,   210,   210,   210,   210,   211,   210,   210,   210,
     210,   210,   213,   212,   214,   214,   214,   214,   214,   214,
     214,   214,   214,   214,   214,   214,   214,   215,   216,   216,
     216,   216,   216,   216,   217,   217,   219,   218,   220,   220,
     220,   221,   222,   222,   223,   223,   224,   225,   225,   225,
     226,   226,   226,   226,   226,   226,   226,   226,   227,   227,
     227,   227,   227,   227,   228,   228,   229,   229,   230,   230,
     231,   231,   232,   232,   233,   233,   234,   234,   235,   235,
     236,   236,   238,   237,   239,   239,   240,   239,   241,   241,
     241,   241,   242,   242,   242,   242,   242,   243,   243,   243,
     243,   244,   244
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     3,     2,     2,     4,     4,     3,
       5,     0,     6,     0,     6,     1,     2,     3,     2,     1,
       1,     1,     1,     0,     3,     0,     4,     2,     4,     0,
       1,     0,     4,     0,     1,     4,     0,     0,     0,    10,
       0,     1,     3,     0,     5,     0,     1,     4,     4,     4,
       0,     3,     1,     1,     1,     1,     1,     1,     0,     1,
       0,     0,     0,    10,     0,     9,     0,     2,     0,     3,
       0,     1,     1,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     5,     3,     3,     3,     3,     5,     5,
       0,     3,     2,     0,     3,     3,     0,     4,     0,     2,
       1,     1,     1,     4,     1,     1,     1,     1,     0,     5,
       1,     0,     2,     3,     3,     0,     5,     0,     5,     0,
       1,     3,     1,     2,     0,     2,     2,     1,     1,     0,
       1,     2,     1,     1,     3,     1,     3,     1,     1,     2,
       2,     0,     4,     4,     0,     6,     1,     0,     6,     2,
       2,     2,     2,     1,     1,     1,     0,     1,     1,     1,
       1,     1,     1,     1,     3,     4,     4,     4,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     6,     6,     6,     7,     4,     4,     6,     7,     4,
       4,     4,     4,     6,     7,     3,     0,     9,     1,     1,
       1,     3,     0,     5,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     4,     1,     1,
       1,     3,     3,     3,     1,     1,     0,     5,     0,     3,
       1,     2,     0,     2,     1,     4,     2,     3,     1,     0,
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
       0,    13,     0,     0,     0,     0,    46,    21,     0,    70,
      41,     0,     0,     2,     3,    12,     0,     7,     6,    10,
       5,     8,     9,     0,     0,     0,     0,   292,     0,     0,
     167,   168,   169,   170,   171,   173,     0,   172,     0,   139,
      11,     1,     4,    15,    16,    14,     0,     0,     0,     0,
     284,   283,   285,    47,   282,     0,    19,    71,    23,   143,
       0,    30,    29,    32,   139,    25,     0,    31,    33,   140,
     142,    17,    18,    45,     0,   302,   303,   304,   305,   306,
     309,   307,   308,   310,   274,   290,   298,   293,   294,   275,
     291,    80,     0,     0,    80,     0,    28,    26,    42,     0,
       0,    35,     0,     0,   141,   300,   301,   296,     0,    85,
      84,    86,    87,    89,    88,     0,    90,     0,    91,    92,
       0,    55,    82,     0,    20,     0,     0,    37,     0,    80,
      27,   276,   299,     0,   295,     0,    60,    48,    56,     0,
      22,    72,   286,   287,   288,     0,   289,     0,     0,    34,
     290,    40,   277,   279,   280,   297,     0,     0,    63,    64,
      66,    65,    67,     0,    62,    50,    83,    50,     0,    38,
      36,   292,     0,    59,    58,     0,    57,    51,   134,   134,
      24,     0,   278,    61,    53,     0,   138,   137,     0,     0,
     134,   139,   132,     0,   281,     0,   136,    52,    49,   133,
     166,   135,    73,     0,     0,     0,     0,     0,     0,     0,
       0,   151,     0,   154,   157,     0,     0,     0,   222,     0,
     114,   115,   238,   239,   276,   156,   164,     0,   165,   120,
       0,   147,     0,   218,   219,   220,   246,   163,   148,   240,
     108,   160,     0,     0,     0,     0,   162,     0,   149,   150,
       0,     0,     0,     0,   311,   312,     0,   125,   159,   240,
     127,     0,    74,   161,   118,   144,   259,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   245,   244,     0,   292,     0,    54,     0,     0,   268,
     269,   270,   271,   272,   273,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   129,   129,   259,
     100,   121,   258,     0,   108,   248,   224,   225,   226,   227,
     230,   231,   232,   233,   229,   228,   234,   235,   236,   221,
       0,     0,     0,   309,   276,     0,     0,     0,   215,   290,
     174,     0,   242,   243,   241,   110,   111,   112,     0,   109,
       0,   264,   266,     0,     0,   265,   267,     0,   212,   145,
     152,   153,     0,     0,   211,     0,   130,   252,     0,     0,
      78,     0,     0,     0,   256,     0,   250,   205,   206,   210,
     209,   237,   175,   176,   177,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     292,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   262,     0,   263,     0,     0,   292,     0,     0,     0,
       0,   126,   251,   128,   223,     0,     0,     0,     0,   122,
       0,   116,   117,   119,     0,   257,     0,     0,   247,     0,
     292,     0,   292,   183,   192,   193,   197,   186,   187,   188,
     191,   189,   190,   181,   194,   195,   196,   185,     0,   179,
     200,   178,   180,   182,   184,   198,   199,     0,     0,   260,
     261,   213,     0,   146,   155,   158,   131,   254,     0,   253,
     102,     0,     0,     0,     0,    76,   101,   252,   123,     0,
     249,   203,     0,   207,     0,   201,   202,   113,   214,     0,
      79,     0,     0,     0,     0,   103,     0,   124,   248,   204,
     208,     0,    94,     0,    95,    97,     0,    96,     0,     0,
      77,     0,   255,     0,     0,     0,   106,     0,    75,     0,
     217,    93,    99,    98,     0,   108,   104,     0,   105,   107
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    12,    13,    14,    15,    24,    16,    17,    18,    29,
      63,    95,    64,    65,   102,   103,   129,   149,    19,    39,
      66,    20,    21,    28,    91,   165,   178,   188,   195,   139,
     118,   119,   163,   164,   189,    22,    38,    94,   167,   226,
     310,   505,   427,   120,   121,   122,   485,   370,   428,   519,
     529,   534,   286,   349,   227,   433,   228,   311,   371,   434,
     229,   307,   308,   365,   190,   191,   192,    68,    69,    70,
     201,   360,   230,   250,   252,   253,    36,    37,   231,   232,
     233,   261,   234,   235,   236,   285,   237,   267,   375,   366,
     422,   479,   312,   313,   238,   296,    85,   151,   152,   153,
      53,    54,   144,   154,   367,    48,    49,    87,   133,    88,
      89,    90,   256
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -313
static const short int yypact[] =
{
       8,  -313,    27,   -71,   -65,   -66,  -313,  -313,   120,  -313,
    -313,    49,    72,     8,  -313,  -313,    90,  -313,  -313,  -313,
    -313,  -313,  -313,     7,   126,    59,    77,  -313,    18,   120,
    -313,  -313,  -313,  -313,  -313,  -313,    52,  -313,    53,    14,
    -313,  -313,  -313,  -313,  -313,  -313,    54,    58,    42,   197,
    -313,  -313,  -313,  -313,  -313,    73,    57,  -313,  -313,  -313,
     173,  -313,  -313,  -313,    55,  -313,    81,  -313,     1,    85,
    -313,  -313,  -313,  -313,   472,  -313,  -313,  -313,  -313,  -313,
    -313,  -313,  -313,  -313,  -313,  -313,   109,   -49,  -313,  -313,
    -313,   406,    71,   105,   406,    83,  -313,  -313,  -313,   472,
      92,  -313,   187,    98,  -313,  -313,   472,  -313,   197,  -313,
    -313,  -313,  -313,  -313,  -313,    89,  -313,    96,  -313,  -313,
     196,    15,  -313,   105,  -313,   242,   444,  -313,   183,   406,
    -313,   444,  -313,   197,  -313,   -51,   154,  -313,  -313,   406,
    -313,  -313,  -313,  -313,  -313,   142,  -313,   157,   166,  -313,
     144,  -313,   204,  -313,  -313,  -313,   158,   160,  -313,  -313,
    -313,  -313,  -313,   -50,  -313,   279,  -313,   279,   178,  -313,
    -313,  -313,   444,  -313,  -313,   154,  -313,  -313,     3,     3,
    -313,   167,  -313,  -313,  -313,   284,  -313,  -313,   285,   217,
     106,    85,  -313,   226,  -313,   120,  -313,  -313,  -313,  -313,
     309,  -313,  -313,   199,   -61,    34,    86,   472,   174,   200,
     205,  -313,   212,   203,  -313,    17,   214,   191,  -313,   320,
    -313,  -313,  -313,  -313,   444,  -313,  -313,   322,  -313,  -313,
     325,  -313,   213,  -313,  -313,  -313,  -313,  -313,  -313,   495,
    -313,  -313,   472,   192,   472,   210,  -313,   263,  -313,  -313,
     120,   267,   120,   120,  -313,  -313,   223,  -313,  -313,    32,
    -313,   246,  -313,  -313,  -313,  -313,   174,   247,   472,   472,
     472,   472,   472,   472,   472,   472,   472,   472,   472,   472,
     472,  -313,  -313,   380,  -313,   408,   225,   358,   -61,  -313,
    -313,  -313,  -313,  -313,  -313,   -61,   472,   359,   -61,   -61,
     472,   472,   268,   174,   271,   275,   472,   472,   472,   174,
    -313,  -313,  -313,   -46,  -313,   472,  -313,  -313,  -313,  -313,
    -313,  -313,  -313,  -313,  -313,  -313,  -313,  -313,  -313,  -313,
     458,    17,   276,   259,   444,   472,   472,   472,  -313,   -76,
     397,   261,  -313,  -313,  -313,  -313,  -313,  -313,   262,  -313,
     -61,  -313,  -313,   371,   -61,  -313,  -313,   375,   -52,  -313,
     314,  -313,   272,   274,  -313,   -26,  -313,  -313,   -25,   -22,
       0,    56,   174,   278,   225,   -18,  -313,   -44,   -13,  -313,
    -313,  -313,  -313,  -313,  -313,   472,   472,   472,   472,   472,
     472,   472,   472,   472,   472,   472,   472,   472,   472,   472,
    -313,   472,   472,   472,   472,   472,   472,   472,   472,   280,
     286,  -313,   -61,  -313,   -61,   472,  -313,   291,   105,   105,
     472,  -313,   132,  -313,  -313,   472,   472,   -16,   395,  -313,
     472,  -313,  -313,  -313,   398,  -313,   486,   472,  -313,   472,
    -313,   472,  -313,  -313,  -313,  -313,  -313,  -313,  -313,  -313,
    -313,  -313,  -313,  -313,  -313,  -313,  -313,  -313,   287,  -313,
    -313,  -313,  -313,  -313,  -313,  -313,  -313,   472,   282,  -313,
    -313,  -313,   294,  -313,  -313,  -313,  -313,  -313,   296,  -313,
    -313,   400,   472,   472,   504,    85,  -313,  -313,  -313,   298,
    -313,  -313,   295,  -313,   302,  -313,  -313,  -313,  -313,   299,
    -313,     6,   418,    20,    21,  -313,   419,   132,   472,  -313,
    -313,   304,  -313,   472,  -313,  -313,   472,  -313,   472,    -6,
    -313,   -15,  -313,   422,   423,   424,  -313,   174,  -313,   426,
    -313,  -313,  -313,  -313,   120,  -313,  -313,   329,   225,  -313
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -313,  -313,  -313,   420,  -313,  -313,  -313,  -313,  -313,  -313,
     232,  -313,  -313,   370,  -313,  -313,  -313,   101,  -313,  -313,
    -313,    80,  -313,  -313,  -313,  -313,   269,  -313,  -313,  -313,
    -313,  -313,  -313,   266,   258,  -313,  -313,  -313,  -313,  -313,
    -313,  -313,  -313,   -67,  -313,   307,  -313,  -313,  -313,  -313,
    -313,  -313,  -296,  -313,  -313,  -313,  -313,  -313,  -313,  -313,
    -313,  -313,  -313,   139,  -313,  -313,   260,   257,  -313,   -68,
    -313,  -313,  -313,  -313,  -313,  -313,   -29,   119,  -313,  -313,
    -313,  -313,  -313,  -313,    22,  -313,  -203,  -313,   -48,  -312,
     -28,  -313,    91,   152,  -313,   219,  -127,   238,  -313,   297,
    -313,   186,  -197,   346,   -43,  -162,  -313,  -313,  -313,   -69,
    -313,   -91,   143
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -241
static const short int yytable[] =
{
      55,   104,   124,   376,   150,   -39,    86,   241,   184,   181,
     512,   425,     1,   258,     2,    99,     3,     4,   374,   -81,
     415,   526,   175,   107,   515,   517,   372,   125,   439,   100,
       5,   105,   140,     6,    23,    25,     5,     7,   281,   134,
     282,   142,    26,    58,  -240,   150,   420,   420,   242,   143,
     372,   156,    27,    40,   437,   157,   127,   437,   527,   441,
     429,   482,   148,   132,   155,    86,   416,   483,   484,     8,
     528,   176,    41,   239,   440,   373,   -68,     5,   513,   101,
     338,   247,   108,   146,    58,   426,     9,   138,   146,   259,
      86,   351,   516,   518,    43,   421,   423,   150,   352,   424,
     244,   355,   356,   438,    10,   442,   530,   185,   476,    59,
     -81,   -43,    11,   480,    44,   186,   187,   254,    60,    67,
      50,   430,   341,   255,    51,   490,    61,    62,    52,   146,
      45,    46,    75,    76,    77,    78,   431,    79,   432,   314,
      80,    81,    82,    83,    67,    84,   281,   477,   282,    47,
      59,   478,   -44,   411,    56,    57,   339,   413,   343,    60,
      71,    73,   243,   245,   246,    72,   203,    61,    62,    30,
      31,    32,    33,    34,    93,    92,   361,    96,    98,   -69,
      59,   146,   314,   106,    75,    76,    77,    78,   123,    79,
     126,   130,    80,    81,    82,    83,   376,    84,   128,   287,
     137,   297,   288,   158,   159,   160,   161,   150,   131,   135,
     185,    80,    81,    82,    83,   469,   136,   470,   186,   187,
     298,   302,    35,   304,   305,   316,   317,   318,   319,   320,
     321,   322,   323,   324,   325,   326,   327,   328,   458,   538,
     340,   345,   346,   347,   348,   314,   141,   289,   290,   291,
     292,   293,   294,   353,   472,   147,   162,   357,   358,   168,
     169,   170,   171,   364,   295,   289,   290,   291,   292,   293,
     294,    74,    75,    76,    77,    78,   172,    79,   492,   173,
     494,   174,   299,   177,   180,    84,   194,   378,   196,   197,
     198,   146,   382,   383,   384,    75,    76,    77,    78,   202,
      79,   240,   248,    80,    81,    82,    83,   249,    84,   259,
     -23,   260,    75,    76,    77,    78,   222,    79,   251,   204,
     223,   205,   206,   207,   262,    84,   264,   474,   475,   265,
     208,   209,   210,   266,   257,   301,   211,   212,   213,   303,
     306,   214,   443,   444,   445,   446,   447,   448,   449,   450,
     451,   452,   453,   454,   455,   456,   457,   504,   459,   460,
     461,   462,   463,   464,   465,   466,   309,   315,   350,   354,
     359,   215,   471,   362,   216,   217,   218,   363,   380,  -239,
     409,   412,   410,   481,   219,   414,   417,   487,   220,   418,
     221,   419,   468,   473,   329,   436,   491,   467,   493,   486,
     535,   330,   488,   497,   500,   511,   495,    75,    76,    77,
      78,   222,    79,   498,   509,   223,   499,   506,   508,   224,
      84,   510,   514,   520,   496,   522,   531,   532,   533,  -216,
     536,   539,   225,    42,    97,   381,   179,   193,   385,   501,
     502,   183,   331,   332,   386,   387,   166,   368,   200,   377,
     199,   388,   389,   390,   391,   392,   393,   394,   489,   507,
     521,   369,   263,   435,   300,   395,   396,   397,   398,   182,
     523,   344,   145,   524,   379,   525,     0,     0,    75,    76,
      77,    78,   222,    79,     0,     0,   333,    81,    82,    83,
     334,    84,   109,   110,   111,   112,   113,   114,   115,   116,
     117,     0,   335,   336,   337,   537,    75,    76,    77,    78,
      50,    79,   399,     0,   342,   400,     0,     0,    52,    84,
     401,   402,   403,   404,   405,   406,   407,   408,   268,   269,
     270,   271,   272,   273,   274,   275,     0,   276,   277,   278,
     279,   280,    75,    76,    77,    78,   142,    79,     0,     0,
      80,    81,    82,    83,   143,    84,    75,    76,    77,    78,
      35,    79,     0,     0,    80,    81,    82,    83,     0,    84,
      75,    76,    77,    78,     0,    79,     0,     0,    80,    81,
      82,    83,     0,    84,    75,    76,    77,    78,   222,    79,
       0,     0,   223,     0,     0,     0,     0,    84,     0,     0,
       0,     0,    75,    76,    77,    78,     0,    79,     0,   281,
     503,   282,   283,   284,     0,    84
};

static const short int yycheck[] =
{
      29,    69,    93,   315,   131,     4,    49,   204,     5,   171,
       4,    11,     4,   216,     6,    14,     8,     9,   314,     4,
      72,    27,    72,    72,     4,     4,    72,    94,    72,    28,
      22,    74,   123,    25,     7,   106,    22,    29,   114,   108,
     116,   102,   107,    29,   120,   172,    72,    72,    14,   110,
      72,   102,   118,     4,    72,   106,    99,    72,    64,    72,
       4,    77,   129,   106,   133,   108,   118,    83,    84,    61,
      76,   121,     0,   200,   118,   121,    73,    22,    72,    78,
     283,   208,   131,   126,    29,    85,    78,    72,   131,   216,
     133,   288,    72,    72,     4,   121,   121,   224,   295,   121,
      14,   298,   299,   121,    96,   118,   121,   104,   420,    95,
      95,    97,   104,   425,   107,   112,   113,   100,   104,    39,
     102,    65,   284,   106,   106,   437,   112,   113,   110,   172,
       4,    72,    98,    99,   100,   101,    80,   103,    82,   266,
     106,   107,   108,   109,    64,   111,   114,    15,   116,    72,
      95,    19,    97,   350,   102,   102,   283,   354,   285,   104,
     106,   119,   205,   206,   207,   107,   195,   112,   113,    49,
      50,    51,    52,    53,   117,   102,   303,     4,    97,    73,
      95,   224,   309,    74,    98,    99,   100,   101,   117,   103,
     107,     4,   106,   107,   108,   109,   508,   111,   106,   242,
       4,   244,    10,    49,    50,    51,    52,   334,   110,   120,
     104,   106,   107,   108,   109,   412,   120,   414,   112,   113,
      10,   250,   102,   252,   253,   268,   269,   270,   271,   272,
     273,   274,   275,   276,   277,   278,   279,   280,   400,   535,
     283,    16,    17,    18,    19,   372,     4,    55,    56,    57,
      58,    59,    60,   296,   416,    72,   102,   300,   301,   117,
     103,    95,   118,   306,    72,    55,    56,    57,    58,    59,
      60,    74,    98,    99,   100,   101,    72,   103,   440,   121,
     442,   121,    72,     4,   106,   111,   119,   330,     4,     4,
      73,   334,   335,   336,   337,    98,    99,   100,   101,    73,
     103,   102,   102,   106,   107,   108,   109,   102,   111,   436,
     107,   120,    98,    99,   100,   101,   102,   103,   106,    10,
     106,    12,    13,    14,     4,   111,     4,   418,   419,     4,
      21,    22,    23,   120,   120,    72,    27,    28,    29,    72,
     117,    32,   385,   386,   387,   388,   389,   390,   391,   392,
     393,   394,   395,   396,   397,   398,   399,   484,   401,   402,
     403,   404,   405,   406,   407,   408,   120,   120,    10,    10,
     102,    62,   415,   102,    65,    66,    67,   102,   102,   120,
     119,    10,   120,   426,    75,    10,    72,   430,    79,   117,
      81,   117,   106,   102,    14,   117,   439,   117,   441,     4,
     527,    21,     4,   121,     4,   106,   119,    98,    99,   100,
     101,   102,   103,   119,   119,   106,   120,   485,   120,   110,
     111,   119,     4,     4,   467,   121,     4,     4,     4,   120,
       4,   102,   200,    13,    64,   334,   167,   179,    41,   482,
     483,   175,    62,    63,    47,    48,   139,   308,   191,   330,
     190,    54,    55,    56,    57,    58,    59,    60,   436,   487,
     508,   309,   224,   372,   245,    68,    69,    70,    71,   172,
     513,   285,   126,   516,   331,   518,    -1,    -1,    98,    99,
     100,   101,   102,   103,    -1,    -1,   106,   107,   108,   109,
     110,   111,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    -1,   122,   123,   124,   534,    98,    99,   100,   101,
     102,   103,   115,    -1,   106,   118,    -1,    -1,   110,   111,
     123,   124,   125,   126,   127,   128,   129,   130,    33,    34,
      35,    36,    37,    38,    39,    40,    -1,    42,    43,    44,
      45,    46,    98,    99,   100,   101,   102,   103,    -1,    -1,
     106,   107,   108,   109,   110,   111,    98,    99,   100,   101,
     102,   103,    -1,    -1,   106,   107,   108,   109,    -1,   111,
      98,    99,   100,   101,    -1,   103,    -1,    -1,   106,   107,
     108,   109,    -1,   111,    98,    99,   100,   101,   102,   103,
      -1,    -1,   106,    -1,    -1,    -1,    -1,   111,    -1,    -1,
      -1,    -1,    98,    99,   100,   101,    -1,   103,    -1,   114,
     106,   116,   117,   118,    -1,   111
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,     9,    22,    25,    29,    61,    78,
      96,   104,   133,   134,   135,   136,   138,   139,   140,   150,
     153,   154,   167,     7,   137,   106,   107,   118,   155,   141,
      49,    50,    51,    52,    53,   102,   208,   209,   168,   151,
       4,     0,   135,     4,   107,     4,    72,    72,   237,   238,
     102,   106,   110,   232,   233,   208,   102,   102,    29,    95,
     104,   112,   113,   142,   144,   145,   152,   153,   199,   200,
     201,   106,   107,   119,    74,    98,    99,   100,   101,   103,
     106,   107,   108,   109,   111,   228,   236,   239,   241,   242,
     243,   156,   102,   117,   169,   143,     4,   145,    97,    14,
      28,    78,   146,   147,   201,   236,    74,    72,   131,    86,
      87,    88,    89,    90,    91,    92,    93,    94,   162,   163,
     175,   176,   177,   117,   243,   175,   107,   236,   106,   148,
       4,   110,   236,   240,   241,   120,   120,     4,    72,   161,
     243,     4,   102,   110,   234,   235,   236,    72,   175,   149,
     228,   229,   230,   231,   235,   241,   102,   106,    49,    50,
      51,    52,   102,   164,   165,   157,   177,   170,   117,   103,
      95,   118,    72,   121,   121,    72,   121,     4,   158,   158,
     106,   237,   231,   165,     5,   104,   112,   113,   159,   166,
     196,   197,   198,   166,   119,   160,     4,     4,    73,   198,
     199,   202,    73,   208,    10,    12,    13,    14,    21,    22,
      23,    27,    28,    29,    32,    62,    65,    66,    67,    75,
      79,    81,   102,   106,   110,   142,   171,   186,   188,   192,
     204,   210,   211,   212,   214,   215,   216,   218,   226,   228,
     102,   234,    14,   236,    14,   236,   236,   228,   102,   102,
     205,   106,   206,   207,   100,   106,   244,   120,   218,   228,
     120,   213,     4,   229,     4,     4,   120,   219,    33,    34,
      35,    36,    37,    38,    39,    40,    42,    43,    44,    45,
      46,   114,   116,   117,   118,   217,   184,   236,    10,    55,
      56,    57,    58,    59,    60,    72,   227,   236,    10,    72,
     227,    72,   208,    72,   208,   208,   117,   193,   194,   120,
     172,   189,   224,   225,   228,   120,   236,   236,   236,   236,
     236,   236,   236,   236,   236,   236,   236,   236,   236,    14,
      21,    62,    63,   106,   110,   122,   123,   124,   218,   228,
     236,   237,   106,   228,   233,    16,    17,    18,    19,   185,
      10,   234,   234,   236,    10,   234,   234,   236,   236,   102,
     203,   228,   102,   102,   236,   195,   221,   236,   195,   225,
     179,   190,    72,   121,   184,   220,   221,   209,   236,   244,
     102,   149,   236,   236,   236,    41,    47,    48,    54,    55,
      56,    57,    58,    59,    60,    68,    69,    70,    71,   115,
     118,   123,   124,   125,   126,   127,   128,   129,   130,   119,
     120,   234,    10,   234,    10,    72,   118,    72,   117,   117,
      72,   121,   222,   121,   121,    11,    85,   174,   180,     4,
      65,    80,    82,   187,   191,   224,   117,    72,   121,    72,
     118,    72,   118,   236,   236,   236,   236,   236,   236,   236,
     236,   236,   236,   236,   236,   236,   236,   236,   237,   236,
     236,   236,   236,   236,   236,   236,   236,   117,   106,   234,
     234,   236,   237,   102,   243,   243,   221,    15,    19,   223,
     221,   236,    77,    83,    84,   178,     4,   236,     4,   216,
     221,   236,   237,   236,   237,   119,   236,   121,   119,   120,
       4,   236,   236,   106,   228,   173,   201,   222,   120,   119,
     119,   106,     4,    72,     4,     4,    72,     4,    72,   181,
       4,   220,   121,   236,   236,   236,    27,    64,    76,   182,
     121,     4,     4,     4,   183,   228,     4,   208,   184,   102
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
#line 399 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 5:
#line 408 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 6:
#line 409 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 7:
#line 410 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 8:
#line 411 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 412 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 413 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 414 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 12:
#line 415 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 13:
#line 416 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 14:
#line 419 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 15:
#line 420 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 16:
#line 424 "compilers/imcc/imcc.y"
    { if ((yyvsp[0].s))
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 17:
#line 432 "compilers/imcc/imcc.y"
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
#line 441 "compilers/imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                IMCC_INFO(interp)->HLL_id, atoi((yyvsp[-2].s)), atoi((yyvsp[0].s)));
             (yyval.t) = 0;
         }
    break;

  case 19:
#line 450 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 20:
#line 456 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 21:
#line 464 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 22:
#line 465 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1);is_def=0; }
    break;

  case 23:
#line 469 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 24:
#line 470 "compilers/imcc/imcc.y"
    { (yyval.i) = mk_pmc_const(interp, cur_unit, (yyvsp[-3].s), (yyvsp[-2].sr), (yyvsp[0].s));is_def=0; }
    break;

  case 27:
#line 478 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 28:
#line 479 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 29:
#line 480 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 30:
#line 481 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 31:
#line 482 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 33:
#line 486 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 34:
#line 488 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, cur_unit, (yyvsp[-1].s),0,regs,nargs,keyvec,1);
                     free((yyvsp[-1].s)); }
    break;

  case 35:
#line 491 "compilers/imcc/imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                    }
    break;

  case 36:
#line 496 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, (yyvsp[0].s)));
                     cur_call->pcc_sub->pragma = (yyvsp[-1].t);
                   }
    break;

  case 37:
#line 502 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[0].sr)); }
    break;

  case 38:
#line 504 "compilers/imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, (yyvsp[0].s));
                       set_lexical(interp, r, (yyvsp[-2].s)); (yyval.i) = 0;
                   }
    break;

  case 39:
#line 508 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 41:
#line 516 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 42:
#line 518 "compilers/imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     (yyval.i)=0; }
    break;

  case 45:
#line 533 "compilers/imcc/imcc.y"
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
#line 549 "compilers/imcc/imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 47:
#line 553 "compilers/imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, (yyvsp[0].sr));
        }
    break;

  case 48:
#line 556 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = (yyvsp[-1].t); }
    break;

  case 49:
#line 558 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; }
    break;

  case 50:
#line 562 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 51:
#line 563 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 52:
#line 564 "compilers/imcc/imcc.y"
    { 
         if (adv_named_id) {
             SymReg *r;
             r = mk_const(interp, adv_named_id, 'S');
             r->type |= VT_NAMED; 
             add_pcc_param(cur_call, r);
             adv_named_id = NULL;
         }
         add_pcc_param(cur_call, (yyvsp[-1].sr));
   }
    break;

  case 53:
#line 577 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 54:
#line 578 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_ident(interp, (yyvsp[-1].s), (yyvsp[-2].t));
                                         is_def=0; (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 55:
#line 583 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  }
    break;

  case 57:
#line 588 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 58:
#line 592 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; cur_unit->outer =
                     mk_sub_address_fromc(interp, (yyvsp[-1].s)); }
    break;

  case 59:
#line 595 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; cur_unit->outer =
                     mk_const(interp, (yyvsp[-1].s), 'S'); }
    break;

  case 60:
#line 600 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 61:
#line 601 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; add_pcc_multi(cur_call, (yyvsp[0].sr)); }
    break;

  case 62:
#line 602 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  add_pcc_multi(cur_call, (yyvsp[0].sr));}
    break;

  case 63:
#line 606 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 64:
#line 607 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 65:
#line 608 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 66:
#line 609 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 67:
#line 610 "compilers/imcc/imcc.y"
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

  case 70:
#line 628 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 71:
#line 630 "compilers/imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, (yyvsp[0].s)));

         }
    break;

  case 72:
#line 634 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = (yyvsp[-1].t); }
    break;

  case 73:
#line 636 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; }
    break;

  case 74:
#line 641 "compilers/imcc/imcc.y"
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

  case 75:
#line 668 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; }
    break;

  case 76:
#line 672 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 77:
#line 673 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 78:
#line 677 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; }
    break;

  case 79:
#line 679 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->object = (yyvsp[-1].sr); }
    break;

  case 80:
#line 683 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 82:
#line 688 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[0].t); }
    break;

  case 83:
#line 689 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[-2].t) | (yyvsp[0].t); }
    break;

  case 84:
#line 693 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_LOAD; }
    break;

  case 85:
#line 694 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_MAIN; }
    break;

  case 86:
#line 695 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_IMMEDIATE; }
    break;

  case 87:
#line 696 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_POSTCOMP; }
    break;

  case 88:
#line 697 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_ANON; }
    break;

  case 89:
#line 698 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_METHOD; }
    break;

  case 90:
#line 699 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_NEED_LEX; }
    break;

  case 93:
#line 706 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, (yyvsp[-3].sr));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         }
    break;

  case 94:
#line 711 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-1].sr)); }
    break;

  case 95:
#line 713 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, (yyvsp[-1].sr));
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 96:
#line 718 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-1].sr)); }
    break;

  case 97:
#line 720 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, (yyvsp[-1].s),'S')); }
    break;

  case 98:
#line 722 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-3].sr));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         }
    break;

  case 99:
#line 726 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, (yyvsp[-3].s),'S'));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         }
    break;

  case 100:
#line 733 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 101:
#line 734 "compilers/imcc/imcc.y"
    {  add_pcc_arg(cur_call, (yyvsp[-1].sr)); }
    break;

  case 102:
#line 738 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 103:
#line 743 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 104:
#line 744 "compilers/imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_result(cur_call, (yyvsp[-1].sr)); }
    break;

  case 105:
#line 748 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 106:
#line 749 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 107:
#line 750 "compilers/imcc/imcc.y"
    {  mk_ident(interp, (yyvsp[0].s), (yyvsp[-1].t)); is_def=0; (yyval.sr)=0; }
    break;

  case 108:
#line 754 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 109:
#line 755 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); }
    break;

  case 110:
#line 759 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_FLAT;   }
    break;

  case 111:
#line 760 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPTIONAL; }
    break;

  case 112:
#line 761 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPT_FLAG; }
    break;

  case 113:
#line 762 "compilers/imcc/imcc.y"
    {  adv_named_id = (yyvsp[-1].s); (yyval.t) = 0; }
    break;

  case 114:
#line 767 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 115:
#line 768 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; }
    break;

  case 118:
#line 778 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, (yyvsp[-1].t)); }
    break;

  case 119:
#line 781 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 120:
#line 782 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.i) = 0;  }
    break;

  case 121:
#line 788 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 122:
#line 790 "compilers/imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); }
    break;

  case 123:
#line 792 "compilers/imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); }
    break;

  case 124:
#line 796 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 125:
#line 801 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 126:
#line 806 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 127:
#line 808 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 128:
#line 813 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 129:
#line 817 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 130:
#line 818 "compilers/imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr));    }
    break;

  case 131:
#line 819 "compilers/imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr));    }
    break;

  case 134:
#line 837 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 135:
#line 842 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[0].i); }
    break;

  case 136:
#line 843 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 137:
#line 844 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 138:
#line 845 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 139:
#line 849 "compilers/imcc/imcc.y"
    {  (yyval.i) = NULL; }
    break;

  case 143:
#line 859 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iLABEL(cur_unit, mk_local_label(interp, (yyvsp[0].s)));
                   }
    break;

  case 144:
#line 866 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[-1].i); }
    break;

  case 145:
#line 870 "compilers/imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = (yyvsp[0].s);
            (yyval.idlist) = l;
         }
    break;

  case 146:
#line 878 "compilers/imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = (yyvsp[0].s);
           l->next = (yyvsp[-2].idlist);
           (yyval.idlist) = l;
        }
    break;

  case 149:
#line 888 "compilers/imcc/imcc.y"
    { push_namespace((yyvsp[0].s)); }
    break;

  case 150:
#line 889 "compilers/imcc/imcc.y"
    { pop_namespace((yyvsp[0].s)); }
    break;

  case 151:
#line 890 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 152:
#line 891 "compilers/imcc/imcc.y"
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

  case 153:
#line 904 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, (yyvsp[0].sr), (yyvsp[-2].s)); (yyval.i) = 0;
                    }
    break;

  case 154:
#line 907 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 155:
#line 908 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 0);is_def=0; }
    break;

  case 157:
#line 910 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 158:
#line 911 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1);is_def=0; }
    break;

  case 159:
#line 912 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 160:
#line 916 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "branch",1, (yyvsp[0].sr)); }
    break;

  case 161:
#line 918 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, cur_unit, (yyvsp[-1].s), 0, regs, nargs, keyvec, 1);
                                          free((yyvsp[-1].s)); }
    break;

  case 162:
#line 921 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[0].sr)); }
    break;

  case 163:
#line 922 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; cur_call = NULL; }
    break;

  case 164:
#line 923 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 166:
#line 925 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 167:
#line 929 "compilers/imcc/imcc.y"
    { (yyval.t) = 'I'; }
    break;

  case 168:
#line 930 "compilers/imcc/imcc.y"
    { (yyval.t) = 'N'; }
    break;

  case 169:
#line 931 "compilers/imcc/imcc.y"
    { (yyval.t) = 'S'; }
    break;

  case 170:
#line 932 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 171:
#line 933 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 172:
#line 934 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; free((yyvsp[0].s)); }
    break;

  case 173:
#line 939 "compilers/imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, (yyvsp[0].s), 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", (yyvsp[0].s));
            }
         }
    break;

  case 174:
#line 949 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "set", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 175:
#line 950 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "not", 2, (yyvsp[-3].sr), (yyvsp[0].sr));}
    break;

  case 176:
#line 951 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "neg", 2, (yyvsp[-3].sr), (yyvsp[0].sr));}
    break;

  case 177:
#line 952 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bnot", 2, (yyvsp[-3].sr), (yyvsp[0].sr));}
    break;

  case 178:
#line 953 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "add", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 179:
#line 954 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "sub", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 180:
#line 955 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mul", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 181:
#line 956 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "pow", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 182:
#line 957 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "div", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 183:
#line 958 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "fdiv", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 184:
#line 959 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mod", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 185:
#line 960 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "concat", 3, (yyvsp[-4].sr),(yyvsp[-2].sr),(yyvsp[0].sr)); }
    break;

  case 186:
#line 961 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "iseq", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 187:
#line 962 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isne", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 188:
#line 963 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isgt", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 189:
#line 964 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "islt", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 190:
#line 965 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isle", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 191:
#line 966 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isge", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 192:
#line 968 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shl", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 193:
#line 970 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 194:
#line 972 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "lsr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 195:
#line 974 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "and", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 196:
#line 976 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "or", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 197:
#line 978 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "xor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 198:
#line 980 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "band", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 199:
#line 982 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 200:
#line 984 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bxor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 201:
#line 986 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); }
    break;

  case 202:
#line 988 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[0].sr)); }
    break;

  case 203:
#line 990 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-2].s), (yyvsp[0].sr), 1); }
    break;

  case 204:
#line 992 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-6].sr), (yyvsp[-3].s), (yyvsp[-1].sr), 1); }
    break;

  case 205:
#line 994 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-3].sr), (yyvsp[0].s), NULL, 1); }
    break;

  case 206:
#line 996 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[-3].sr), (yyvsp[0].sr)); }
    break;

  case 207:
#line 998 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 208:
#line 1000 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-6].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); }
    break;

  case 209:
#line 1002 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "set_addr",
                            2, (yyvsp[-3].sr), mk_label_address(interp, (yyvsp[0].s))); }
    break;

  case 210:
#line 1005 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "find_global",2,(yyvsp[-3].sr),(yyvsp[0].sr));}
    break;

  case 211:
#line 1007 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "store_global",2, (yyvsp[-2].sr),(yyvsp[0].sr)); }
    break;

  case 212:
#line 1011 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 213:
#line 1013 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 214:
#line 1015 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); }
    break;

  case 215:
#line 1018 "compilers/imcc/imcc.y"
    {
            add_pcc_result((yyvsp[0].i)->r[0], (yyvsp[-2].sr));
            cur_call = NULL;
            (yyval.i) = 0;
         }
    break;

  case 216:
#line 1024 "compilers/imcc/imcc.y"
    {
            (yyval.i) = IMCC_create_itcall_label(interp);
         }
    break;

  case 217:
#line 1028 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[-3].sr));
           cur_call = NULL;
         }
    break;

  case 221:
#line 1036 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[-2].sr)); }
    break;

  case 222:
#line 1039 "compilers/imcc/imcc.y"
    { (yyval.i) = IMCC_create_itcall_label(interp);
                           (yyval.i)->type &= ~ITCALL; (yyval.i)->type |= ITRESULT; }
    break;

  case 223:
#line 1041 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 224:
#line 1046 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "add", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 225:
#line 1048 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "sub", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 226:
#line 1050 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mul", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 227:
#line 1052 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "div", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 228:
#line 1054 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mod", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 229:
#line 1056 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "fdiv", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 230:
#line 1058 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "concat", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 231:
#line 1060 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "band", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 232:
#line 1062 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 233:
#line 1064 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bxor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 234:
#line 1066 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 235:
#line 1068 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shl", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 236:
#line 1070 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "lsr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 237:
#line 1075 "compilers/imcc/imcc.y"
    { (yyval.i) = func_ins(interp, cur_unit, (yyvsp[-3].sr), (yyvsp[-1].s),
                                   regs,nargs,keyvec,1);
                     free((yyvsp[-1].s));
                   }
    break;

  case 238:
#line 1081 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); }
    break;

  case 239:
#line 1082 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); }
    break;

  case 240:
#line 1083 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[0].sr);
                       if ((yyvsp[0].sr)->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 241:
#line 1088 "compilers/imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 242:
#line 1089 "compilers/imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); }
    break;

  case 243:
#line 1090 "compilers/imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 244:
#line 1093 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 245:
#line 1094 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 246:
#line 1099 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[0].sr));
        }
    break;

  case 247:
#line 1104 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[-3].i); }
    break;

  case 248:
#line 1108 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 249:
#line 1109 "compilers/imcc/imcc.y"
    {
       (yyval.sr) = 0; 
       if (adv_named_id) {
           SymReg *r;
           r = mk_const(interp, adv_named_id, 'S');
           r->type |= VT_NAMED; 
           add_pcc_arg(cur_call, r);
           adv_named_id = NULL;
       }
       add_pcc_arg(cur_call, (yyvsp[0].sr)); }
    break;

  case 250:
#line 1119 "compilers/imcc/imcc.y"
    {  
       (yyval.sr) = 0; 
       if (adv_named_id) {
           SymReg *r;
           r = mk_const(interp, adv_named_id, 'S');
           r->type |= VT_NAMED; 
           add_pcc_arg(cur_call, r);
           adv_named_id = NULL;
       }
       add_pcc_arg(cur_call, (yyvsp[0].sr)); }
    break;

  case 251:
#line 1132 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 252:
#line 1136 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 253:
#line 1137 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); }
    break;

  case 254:
#line 1141 "compilers/imcc/imcc.y"
    { (yyval.t) = VT_FLAT; }
    break;

  case 255:
#line 1142 "compilers/imcc/imcc.y"
    { adv_named_id = (yyvsp[-1].s); (yyval.t) = 0; }
    break;

  case 256:
#line 1145 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 257:
#line 1149 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_result(cur_call, (yyvsp[0].sr)); }
    break;

  case 258:
#line 1150 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_result(cur_call, (yyvsp[0].sr)); }
    break;

  case 259:
#line 1151 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 260:
#line 1156 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, (yyvsp[-3].s), 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 261:
#line 1158 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, inv_op((yyvsp[-3].s)), 3, (yyvsp[-4].sr),(yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 262:
#line 1160 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 263:
#line 1162 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 264:
#line 1164 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 265:
#line 1166 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless",2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 266:
#line 1168 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 267:
#line 1170 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 268:
#line 1174 "compilers/imcc/imcc.y"
    {  (yyval.s) = "eq"; }
    break;

  case 269:
#line 1175 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ne"; }
    break;

  case 270:
#line 1176 "compilers/imcc/imcc.y"
    {  (yyval.s) = "gt"; }
    break;

  case 271:
#line 1177 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ge"; }
    break;

  case 272:
#line 1178 "compilers/imcc/imcc.y"
    {  (yyval.s) = "lt"; }
    break;

  case 273:
#line 1179 "compilers/imcc/imcc.y"
    {  (yyval.s) = "le"; }
    break;

  case 276:
#line 1188 "compilers/imcc/imcc.y"
    {  (yyval.sr) = NULL; }
    break;

  case 277:
#line 1189 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 278:
#line 1193 "compilers/imcc/imcc.y"
    { (yyval.sr) = regs[0]; }
    break;

  case 280:
#line 1198 "compilers/imcc/imcc.y"
    {  regs[nargs++] = (yyvsp[0].sr); }
    break;

  case 281:
#line 1200 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = (yyvsp[-3].sr);
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = (yyvsp[-1].sr); (yyval.sr) = (yyvsp[-3].sr);
                   }
    break;

  case 283:
#line 1208 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); }
    break;

  case 284:
#line 1212 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); }
    break;

  case 285:
#line 1213 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); }
    break;

  case 286:
#line 1217 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); }
    break;

  case 287:
#line 1218 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); }
    break;

  case 292:
#line 1231 "compilers/imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 293:
#line 1232 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp, nkeys, keys); }
    break;

  case 294:
#line 1236 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[0].sr); }
    break;

  case 295:
#line 1238 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[0].sr); (yyval.sr) =  keys[0]; }
    break;

  case 296:
#line 1239 "compilers/imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 297:
#line 1240 "compilers/imcc/imcc.y"
    { keys[nkeys++] = (yyvsp[0].sr); (yyval.sr) =  keys[0]; }
    break;

  case 298:
#line 1244 "compilers/imcc/imcc.y"
    { if (in_slice) {
                         (yyvsp[0].sr)->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     (yyval.sr) = (yyvsp[0].sr);
                   }
    break;

  case 299:
#line 1250 "compilers/imcc/imcc.y"
    { (yyvsp[-2].sr)->type |= VT_START_SLICE;  (yyvsp[0].sr)->type |= VT_END_SLICE;
                     keys[nkeys++] = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 300:
#line 1252 "compilers/imcc/imcc.y"
    { (yyvsp[0].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 301:
#line 1253 "compilers/imcc/imcc.y"
    { (yyvsp[-1].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[-1].sr); }
    break;

  case 302:
#line 1257 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'I'); }
    break;

  case 303:
#line 1258 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'N'); }
    break;

  case 304:
#line 1259 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); }
    break;

  case 305:
#line 1260 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'P'); }
    break;

  case 306:
#line 1261 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_pasm_reg(interp, (yyvsp[0].s)); }
    break;

  case 307:
#line 1265 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'I'); }
    break;

  case 308:
#line 1266 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'N'); }
    break;

  case 309:
#line 1267 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); }
    break;

  case 310:
#line 1268 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'U'); }
    break;

  case 311:
#line 1272 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); }
    break;

  case 312:
#line 1273 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); }
    break;


    }

/* Line 1037 of yacc.c.  */
#line 3703 "compilers/imcc/imcparser.c"

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


#line 1278 "compilers/imcc/imcc.y"



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

