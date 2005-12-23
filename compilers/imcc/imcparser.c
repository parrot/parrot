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
     NEW = 273,
     NAMESPACE = 274,
     ENDNAMESPACE = 275,
     DOT_METHOD = 276,
     SUB = 277,
     SYM = 278,
     LOCAL = 279,
     LEXICAL = 280,
     CONST = 281,
     INC = 282,
     DEC = 283,
     GLOBAL_CONST = 284,
     PLUS_ASSIGN = 285,
     MINUS_ASSIGN = 286,
     MUL_ASSIGN = 287,
     DIV_ASSIGN = 288,
     CONCAT_ASSIGN = 289,
     BAND_ASSIGN = 290,
     BOR_ASSIGN = 291,
     BXOR_ASSIGN = 292,
     FDIV = 293,
     FDIV_ASSIGN = 294,
     MOD_ASSIGN = 295,
     SHR_ASSIGN = 296,
     SHL_ASSIGN = 297,
     SHR_U_ASSIGN = 298,
     SHIFT_LEFT = 299,
     SHIFT_RIGHT = 300,
     INTV = 301,
     FLOATV = 302,
     STRINGV = 303,
     PMCV = 304,
     OBJECTV = 305,
     LOG_XOR = 306,
     RELOP_EQ = 307,
     RELOP_NE = 308,
     RELOP_GT = 309,
     RELOP_GTE = 310,
     RELOP_LT = 311,
     RELOP_LTE = 312,
     GLOBAL = 313,
     GLOBALOP = 314,
     ADDR = 315,
     RESULT = 316,
     RETURN = 317,
     YIELDT = 318,
     GET_RESULTS = 319,
     POW = 320,
     SHIFT_RIGHT_U = 321,
     LOG_AND = 322,
     LOG_OR = 323,
     COMMA = 324,
     ESUB = 325,
     DOTDOT = 326,
     PCC_BEGIN = 327,
     PCC_END = 328,
     PCC_CALL = 329,
     PCC_SUB = 330,
     PCC_BEGIN_RETURN = 331,
     PCC_END_RETURN = 332,
     PCC_BEGIN_YIELD = 333,
     PCC_END_YIELD = 334,
     NCI_CALL = 335,
     METH_CALL = 336,
     INVOCANT = 337,
     MAIN = 338,
     LOAD = 339,
     IMMEDIATE = 340,
     POSTCOMP = 341,
     METHOD = 342,
     ANON = 343,
     OUTER = 344,
     NEED_LEX = 345,
     MULTI = 346,
     LABEL = 347,
     EMIT = 348,
     EOM = 349,
     IREG = 350,
     NREG = 351,
     SREG = 352,
     PREG = 353,
     IDENTIFIER = 354,
     REG = 355,
     MACRO = 356,
     ENDM = 357,
     STRINGC = 358,
     INTC = 359,
     FLOATC = 360,
     USTRINGC = 361,
     PARROT_OP = 362,
     VAR = 363,
     LINECOMMENT = 364,
     FILECOMMENT = 365,
     DOT = 366,
     CONCAT = 367,
     POINTY = 368
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
#define NEW 273
#define NAMESPACE 274
#define ENDNAMESPACE 275
#define DOT_METHOD 276
#define SUB 277
#define SYM 278
#define LOCAL 279
#define LEXICAL 280
#define CONST 281
#define INC 282
#define DEC 283
#define GLOBAL_CONST 284
#define PLUS_ASSIGN 285
#define MINUS_ASSIGN 286
#define MUL_ASSIGN 287
#define DIV_ASSIGN 288
#define CONCAT_ASSIGN 289
#define BAND_ASSIGN 290
#define BOR_ASSIGN 291
#define BXOR_ASSIGN 292
#define FDIV 293
#define FDIV_ASSIGN 294
#define MOD_ASSIGN 295
#define SHR_ASSIGN 296
#define SHL_ASSIGN 297
#define SHR_U_ASSIGN 298
#define SHIFT_LEFT 299
#define SHIFT_RIGHT 300
#define INTV 301
#define FLOATV 302
#define STRINGV 303
#define PMCV 304
#define OBJECTV 305
#define LOG_XOR 306
#define RELOP_EQ 307
#define RELOP_NE 308
#define RELOP_GT 309
#define RELOP_GTE 310
#define RELOP_LT 311
#define RELOP_LTE 312
#define GLOBAL 313
#define GLOBALOP 314
#define ADDR 315
#define RESULT 316
#define RETURN 317
#define YIELDT 318
#define GET_RESULTS 319
#define POW 320
#define SHIFT_RIGHT_U 321
#define LOG_AND 322
#define LOG_OR 323
#define COMMA 324
#define ESUB 325
#define DOTDOT 326
#define PCC_BEGIN 327
#define PCC_END 328
#define PCC_CALL 329
#define PCC_SUB 330
#define PCC_BEGIN_RETURN 331
#define PCC_END_RETURN 332
#define PCC_BEGIN_YIELD 333
#define PCC_END_YIELD 334
#define NCI_CALL 335
#define METH_CALL 336
#define INVOCANT 337
#define MAIN 338
#define LOAD 339
#define IMMEDIATE 340
#define POSTCOMP 341
#define METHOD 342
#define ANON 343
#define OUTER 344
#define NEED_LEX 345
#define MULTI 346
#define LABEL 347
#define EMIT 348
#define EOM 349
#define IREG 350
#define NREG 351
#define SREG 352
#define PREG 353
#define IDENTIFIER 354
#define REG 355
#define MACRO 356
#define ENDM 357
#define STRINGC 358
#define INTC 359
#define FLOATC 360
#define USTRINGC 361
#define PARROT_OP 362
#define VAR 363
#define LINECOMMENT 364
#define FILECOMMENT 365
#define DOT 366
#define CONCAT 367
#define POINTY 368




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
#line 318 "compilers/imcc/imcc.y"
typedef union YYSTYPE {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} YYSTYPE;
/* Line 190 of yacc.c.  */
#line 627 "compilers/imcc/imcparser.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 213 of yacc.c.  */
#line 639 "compilers/imcc/imcparser.c"

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
#define YYLAST   611

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  130
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  113
/* YYNRULES -- Number of rules. */
#define YYNRULES  310
/* YYNRULES -- Number of states. */
#define YYNSTATES  532

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   368

#define YYTRANSLATE(YYX) 						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   120,     2,     2,     2,   126,   127,     2,
     118,   119,   124,   123,     2,   121,     2,   125,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   129,
       2,   115,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   116,     2,   117,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   128,     2,   122,     2,     2,     2,
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
     106,   107,   108,   109,   110,   111,   112,   113,   114
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
     319,   321,   323,   325,   327,   329,   331,   333,   334,   340,
     342,   343,   346,   350,   354,   355,   361,   362,   368,   369,
     371,   375,   377,   380,   381,   384,   387,   389,   391,   392,
     394,   397,   399,   401,   405,   407,   411,   413,   415,   418,
     421,   422,   427,   432,   433,   440,   442,   443,   450,   453,
     456,   459,   462,   464,   466,   468,   469,   471,   473,   475,
     477,   479,   481,   483,   487,   492,   497,   502,   508,   514,
     520,   526,   532,   538,   544,   550,   556,   562,   568,   574,
     580,   586,   592,   598,   604,   610,   616,   622,   628,   634,
     640,   647,   654,   661,   669,   674,   679,   686,   694,   699,
     704,   709,   714,   721,   729,   733,   734,   744,   746,   748,
     750,   754,   755,   761,   765,   769,   773,   777,   781,   785,
     789,   793,   797,   801,   805,   809,   813,   818,   820,   822,
     824,   828,   832,   836,   838,   840,   841,   847,   848,   852,
     854,   857,   858,   861,   863,   866,   870,   872,   873,   880,
     887,   893,   899,   904,   909,   914,   919,   921,   923,   925,
     927,   929,   931,   933,   935,   936,   938,   942,   944,   946,
     951,   953,   955,   957,   959,   961,   963,   965,   967,   969,
     971,   972,   975,   977,   981,   982,   987,   989,   993,   996,
     999,  1001,  1003,  1005,  1007,  1009,  1011,  1013,  1015,  1017,
    1019
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     131,     0,    -1,   132,    -1,   133,    -1,   132,   133,    -1,
     151,    -1,   138,    -1,   137,    -1,   152,    -1,   165,    -1,
     148,    -1,   102,     4,    -1,   134,    -1,     4,    -1,     6,
     135,     4,    -1,   136,     4,    -1,     7,   105,    -1,     8,
     104,    70,   104,    -1,     9,   105,    70,   105,    -1,    59,
     206,   100,    -1,    59,   206,   100,   115,   241,    -1,    -1,
      27,   139,   206,   100,   115,   241,    -1,    -1,    27,   141,
     105,   233,   115,   104,    -1,   143,    -1,   142,   143,    -1,
     197,   144,     4,    -1,   102,     4,    -1,   111,    -1,   110,
      -1,   151,    -1,   140,    -1,    -1,   145,   108,   147,    -1,
      -1,    76,   146,   173,    93,    -1,    14,   234,    -1,    26,
     104,    70,   101,    -1,    -1,   227,    -1,    -1,    94,   149,
     150,    95,    -1,    -1,   142,    -1,    20,   116,   235,   117,
      -1,    -1,    -1,    -1,    23,   153,   230,   154,   173,     4,
     155,   156,   164,    71,    -1,    -1,     4,    -1,   156,   157,
       4,    -1,    -1,     5,   158,   206,   100,   182,    -1,    -1,
      70,    -1,    92,   118,   162,   119,    -1,    90,   118,   104,
     119,    -1,    90,   118,   100,   119,    -1,    -1,   162,    70,
     163,    -1,   163,    -1,    47,    -1,    48,    -1,    50,    -1,
      49,    -1,   100,    -1,    -1,   194,    -1,    -1,    -1,    -1,
      76,   166,   100,   167,   173,     4,   168,   156,   164,    71,
      -1,    -1,    73,     4,   170,   177,   172,   176,   171,   179,
      74,    -1,    -1,   199,     4,    -1,    -1,    83,   234,     4,
      -1,    -1,   174,    -1,   175,    -1,   174,   159,   175,    -1,
      85,    -1,    84,    -1,    86,    -1,    87,    -1,    89,    -1,
      88,    -1,    91,    -1,   160,    -1,   161,    -1,    75,   234,
      70,   234,     4,    -1,    75,   234,     4,    -1,    81,   234,
       4,    -1,    82,   226,     4,    -1,    82,   104,     4,    -1,
      82,   226,    70,   234,     4,    -1,    82,   104,    70,   234,
       4,    -1,    -1,   177,   178,     4,    -1,    11,   219,    -1,
      -1,   179,   180,     4,    -1,    62,   226,   182,    -1,    -1,
      25,   181,   206,   100,    -1,    -1,   182,   183,    -1,    16,
      -1,    17,    -1,    18,    -1,    77,    -1,    79,    -1,    78,
      -1,    80,    -1,    -1,   184,     4,   187,   188,   185,    -1,
     190,    -1,    -1,   188,     4,    -1,   188,   189,     4,    -1,
      63,   234,   220,    -1,    -1,    63,   118,   191,   193,   119,
      -1,    -1,    64,   118,   192,   193,   119,    -1,    -1,   219,
      -1,   193,    70,   219,    -1,   196,    -1,   194,   196,    -1,
      -1,   195,   200,    -1,   102,     4,    -1,   111,    -1,   110,
      -1,    -1,   198,    -1,   198,   199,    -1,   199,    -1,    93,
      -1,   197,   202,     4,    -1,   100,    -1,   201,    70,   100,
      -1,   208,    -1,   224,    -1,    20,   100,    -1,    21,   100,
      -1,    -1,    25,   203,   206,   201,    -1,    26,   104,    70,
     226,    -1,    -1,    27,   204,   206,   100,   115,   241,    -1,
     140,    -1,    -1,    30,   205,   206,   100,   115,   241,    -1,
      63,   216,    -1,    10,   232,    -1,   108,   227,    -1,    14,
     234,    -1,   216,    -1,   169,    -1,   186,    -1,    -1,    47,
      -1,    48,    -1,    49,    -1,    50,    -1,    51,    -1,   207,
      -1,   100,    -1,   226,   115,   234,    -1,   226,   115,   120,
     234,    -1,   226,   115,   121,   234,    -1,   226,   115,   122,
     234,    -1,   226,   115,   234,   123,   234,    -1,   226,   115,
     234,   121,   234,    -1,   226,   115,   234,   124,   234,    -1,
     226,   115,   234,    66,   234,    -1,   226,   115,   234,   125,
     234,    -1,   226,   115,   234,    39,   234,    -1,   226,   115,
     234,   126,   234,    -1,   226,   115,   234,   113,   234,    -1,
     226,   115,   234,    53,   234,    -1,   226,   115,   234,    54,
     234,    -1,   226,   115,   234,    55,   234,    -1,   226,   115,
     234,    57,   234,    -1,   226,   115,   234,    58,   234,    -1,
     226,   115,   234,    56,   234,    -1,   226,   115,   234,    45,
     234,    -1,   226,   115,   234,    46,   234,    -1,   226,   115,
     234,    67,   234,    -1,   226,   115,   234,    68,   234,    -1,
     226,   115,   234,    69,   234,    -1,   226,   115,   234,    52,
     234,    -1,   226,   115,   234,   127,   234,    -1,   226,   115,
     234,   128,   234,    -1,   226,   115,   234,   122,   234,    -1,
     226,   115,   234,   116,   235,   117,    -1,   226,   116,   235,
     117,   115,   234,    -1,   226,   115,    19,   207,    70,   234,
      -1,   226,   115,    19,   207,   116,   235,   117,    -1,   226,
     115,    19,   207,    -1,   226,   115,    19,   234,    -1,   226,
     115,    19,   234,    70,   234,    -1,   226,   115,    19,   234,
     116,   235,   117,    -1,   226,   115,    61,   100,    -1,   226,
     115,    60,   242,    -1,    60,   242,   115,   234,    -1,    19,
     226,    70,   234,    -1,    19,   226,    70,   234,    70,   234,
      -1,    19,   226,    70,   234,   116,   235,   117,    -1,   226,
     115,   216,    -1,    -1,   209,   118,   223,   119,   115,   214,
     118,   218,   119,    -1,   210,    -1,   212,    -1,   213,    -1,
     226,   115,    14,    -1,    -1,    65,   211,   118,   223,   119,
      -1,   226,    31,   234,    -1,   226,    32,   234,    -1,   226,
      33,   234,    -1,   226,    34,   234,    -1,   226,    41,   234,
      -1,   226,    40,   234,    -1,   226,    35,   234,    -1,   226,
      36,   234,    -1,   226,    37,   234,    -1,   226,    38,   234,
      -1,   226,    42,   234,    -1,   226,    43,   234,    -1,   226,
      44,   234,    -1,   226,   115,   108,   147,    -1,   100,    -1,
     104,    -1,   226,    -1,   226,   215,   231,    -1,   226,   215,
     104,    -1,   226,   215,   226,    -1,   114,    -1,   112,    -1,
      -1,   214,   217,   118,   218,   119,    -1,    -1,   218,    70,
     219,    -1,   219,    -1,   234,   220,    -1,    -1,   220,   221,
      -1,    15,    -1,   226,   182,    -1,   223,    70,   222,    -1,
     222,    -1,    -1,    12,   234,   225,   234,    10,   232,    -1,
      13,   234,   225,   234,    10,   232,    -1,    12,    14,   234,
      10,   232,    -1,    13,    14,   234,    10,   232,    -1,    12,
     234,    10,   232,    -1,    13,   234,    10,   232,    -1,    12,
     234,    70,   232,    -1,    13,   234,    70,   232,    -1,    53,
      -1,    54,    -1,    55,    -1,    56,    -1,    57,    -1,    58,
      -1,   109,    -1,   240,    -1,    -1,   228,    -1,   228,    70,
     229,    -1,   229,    -1,   233,    -1,   226,   116,   235,   117,
      -1,   231,    -1,   104,    -1,   100,    -1,   108,    -1,   100,
      -1,   108,    -1,   232,    -1,   234,    -1,   226,    -1,   241,
      -1,    -1,   236,   237,    -1,   239,    -1,   237,   129,   239,
      -1,    -1,   237,    70,   238,   239,    -1,   234,    -1,   234,
      72,   234,    -1,    72,   234,    -1,   234,    72,    -1,    96,
      -1,    97,    -1,    98,    -1,    99,    -1,   101,    -1,   105,
      -1,   106,    -1,   104,    -1,   107,    -1,    98,    -1,   104,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   398,   398,   402,   403,   407,   408,   409,   410,   411,
     412,   413,   414,   415,   418,   419,   422,   430,   439,   448,
     454,   463,   463,   468,   468,   472,   473,   477,   478,   479,
     480,   481,   482,   485,   485,   490,   489,   500,   502,   507,
     511,   515,   515,   525,   527,   531,   548,   552,   555,   547,
     561,   562,   563,   567,   567,   573,   574,   578,   581,   584,
     590,   591,   592,   596,   597,   598,   599,   600,   612,   614,
     618,   620,   624,   618,   631,   630,   662,   663,   667,   668,
     673,   674,   678,   679,   683,   684,   685,   686,   687,   688,
     689,   690,   691,   695,   700,   702,   707,   709,   711,   715,
     723,   724,   728,   733,   734,   738,   739,   739,   744,   745,
     749,   750,   751,   756,   757,   761,   762,   767,   766,   771,
     777,   778,   780,   785,   790,   789,   797,   796,   806,   807,
     808,   813,   814,   826,   830,   832,   833,   834,   838,   839,
     843,   844,   848,   854,   858,   866,   875,   876,   877,   878,
     879,   879,   892,   896,   896,   898,   899,   899,   901,   905,
     906,   909,   911,   912,   913,   914,   918,   919,   920,   921,
     922,   923,   927,   938,   939,   940,   941,   942,   943,   944,
     945,   946,   947,   948,   949,   950,   951,   952,   953,   954,
     955,   956,   958,   960,   962,   964,   966,   968,   970,   972,
     974,   976,   978,   980,   982,   984,   986,   988,   990,   993,
     995,   999,  1001,  1003,  1006,  1013,  1013,  1021,  1022,  1023,
    1024,  1028,  1028,  1034,  1036,  1038,  1040,  1042,  1044,  1046,
    1048,  1050,  1052,  1054,  1056,  1058,  1063,  1070,  1071,  1072,
    1077,  1078,  1079,  1082,  1083,  1088,  1087,  1097,  1098,  1099,
    1103,  1107,  1108,  1112,  1115,  1119,  1120,  1121,  1125,  1127,
    1129,  1131,  1133,  1135,  1137,  1139,  1144,  1145,  1146,  1147,
    1148,  1149,  1153,  1154,  1158,  1159,  1163,  1164,  1168,  1169,
    1177,  1178,  1182,  1183,  1187,  1188,  1192,  1193,  1197,  1198,
    1201,  1201,  1206,  1207,  1209,  1209,  1214,  1219,  1222,  1223,
    1227,  1228,  1229,  1230,  1231,  1235,  1236,  1237,  1238,  1242,
    1243
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "PRAGMA",
  "N_OPERATORS", "HLL", "HLL_MAP", "GOTO", "ARG", "IF", "UNLESS", "PNULL",
  "ADV_FLAT", "ADV_SLURPY", "ADV_OPTIONAL", "ADV_OPT_FLAG", "NEW",
  "NAMESPACE", "ENDNAMESPACE", "DOT_METHOD", "SUB", "SYM", "LOCAL",
  "LEXICAL", "CONST", "INC", "DEC", "GLOBAL_CONST", "PLUS_ASSIGN",
  "MINUS_ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", "CONCAT_ASSIGN",
  "BAND_ASSIGN", "BOR_ASSIGN", "BXOR_ASSIGN", "FDIV", "FDIV_ASSIGN",
  "MOD_ASSIGN", "SHR_ASSIGN", "SHL_ASSIGN", "SHR_U_ASSIGN", "SHIFT_LEFT",
  "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV", "OBJECTV", "LOG_XOR",
  "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", "RELOP_LTE",
  "GLOBAL", "GLOBALOP", "ADDR", "RESULT", "RETURN", "YIELDT",
  "GET_RESULTS", "POW", "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA",
  "ESUB", "DOTDOT", "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB",
  "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD", "PCC_END_YIELD",
  "NCI_CALL", "METH_CALL", "INVOCANT", "MAIN", "LOAD", "IMMEDIATE",
  "POSTCOMP", "METHOD", "ANON", "OUTER", "NEED_LEX", "MULTI", "LABEL",
  "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "REG",
  "MACRO", "ENDM", "STRINGC", "INTC", "FLOATC", "USTRINGC", "PARROT_OP",
  "VAR", "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", "POINTY", "'='",
  "'['", "']'", "'('", "')'", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'",
  "'%'", "'&'", "'|'", "';'", "$accept", "program", "compilation_units",
  "compilation_unit", "pragma", "pragma_1", "hll_def", "global",
  "constdef", "@1", "pmc_const", "@2", "pasmcode", "pasmline", "pasm_inst",
  "@3", "@4", "pasm_args", "emit", "@5", "opt_pasmcode", "class_namespace",
  "sub", "@6", "@7", "@8", "sub_params", "sub_param", "@9", "opt_comma",
  "multi", "outer", "multi_types", "multi_type", "sub_body", "pcc_sub",
  "@10", "@11", "@12", "pcc_sub_call", "@13", "opt_label", "opt_invocant",
  "sub_proto", "sub_proto_list", "proto", "pcc_call", "pcc_args",
  "pcc_arg", "pcc_results", "pcc_result", "@14", "paramtype_list",
  "paramtype", "begin_ret_or_yield", "end_ret_or_yield", "pcc_ret", "@15",
  "pcc_returns", "pcc_return", "pcc_return_many", "@16", "@17",
  "var_returns", "statements", "helper_clear_state", "statement", "labels",
  "_labels", "label", "instruction", "id_list", "labeled_inst", "@18",
  "@19", "@20", "type", "classname", "assignment", "@21", "get_results",
  "@22", "op_assign", "func_assign", "the_sub", "ptr", "sub_call", "@23",
  "arglist", "arg", "argtype_list", "argtype", "result", "targetlist",
  "if_statement", "relop", "target", "vars", "_vars", "_var_or_i",
  "sub_label_op_c", "sub_label_op", "label_op", "var_or_i", "var",
  "keylist", "@24", "_keylist", "@25", "key", "reg", "const", "string", 0
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
     364,   365,   366,   367,   368,    61,    91,    93,    40,    41,
      33,    45,   126,    43,    42,    47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   130,   131,   132,   132,   133,   133,   133,   133,   133,
     133,   133,   133,   133,   134,   134,   135,   136,   136,   137,
     137,   139,   138,   141,   140,   142,   142,   143,   143,   143,
     143,   143,   143,   145,   144,   146,   144,   144,   144,   144,
     147,   149,   148,   150,   150,   151,   153,   154,   155,   152,
     156,   156,   156,   158,   157,   159,   159,   160,   161,   161,
     162,   162,   162,   163,   163,   163,   163,   163,   164,   164,
     166,   167,   168,   165,   170,   169,   171,   171,   172,   172,
     173,   173,   174,   174,   175,   175,   175,   175,   175,   175,
     175,   175,   175,   176,   176,   176,   176,   176,   176,   176,
     177,   177,   178,   179,   179,   180,   181,   180,   182,   182,
     183,   183,   183,   184,   184,   185,   185,   187,   186,   186,
     188,   188,   188,   189,   191,   190,   192,   190,   193,   193,
     193,   194,   194,   195,   196,   196,   196,   196,   197,   197,
     198,   198,   199,   200,   201,   201,   202,   202,   202,   202,
     203,   202,   202,   204,   202,   202,   205,   202,   202,   202,
     202,   202,   202,   202,   202,   202,   206,   206,   206,   206,
     206,   206,   207,   208,   208,   208,   208,   208,   208,   208,
     208,   208,   208,   208,   208,   208,   208,   208,   208,   208,
     208,   208,   208,   208,   208,   208,   208,   208,   208,   208,
     208,   208,   208,   208,   208,   208,   208,   208,   208,   208,
     208,   208,   208,   208,   208,   209,   208,   208,   208,   208,
     208,   211,   210,   212,   212,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   213,   214,   214,   214,
     214,   214,   214,   215,   215,   217,   216,   218,   218,   218,
     219,   220,   220,   221,   222,   223,   223,   223,   224,   224,
     224,   224,   224,   224,   224,   224,   225,   225,   225,   225,
     225,   225,   226,   226,   227,   227,   228,   228,   229,   229,
     230,   230,   231,   231,   232,   232,   233,   233,   234,   234,
     236,   235,   237,   237,   238,   237,   239,   239,   239,   239,
     240,   240,   240,   240,   240,   241,   241,   241,   241,   242,
     242
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
       1,     1,     1,     1,     1,     1,     1,     0,     5,     1,
       0,     2,     3,     3,     0,     5,     0,     5,     0,     1,
       3,     1,     2,     0,     2,     2,     1,     1,     0,     1,
       2,     1,     1,     3,     1,     3,     1,     1,     2,     2,
       0,     4,     4,     0,     6,     1,     0,     6,     2,     2,
       2,     2,     1,     1,     1,     0,     1,     1,     1,     1,
       1,     1,     1,     3,     4,     4,     4,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       6,     6,     6,     7,     4,     4,     6,     7,     4,     4,
       4,     4,     6,     7,     3,     0,     9,     1,     1,     1,
       3,     0,     5,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     4,     1,     1,     1,
       3,     3,     3,     1,     1,     0,     5,     0,     3,     1,
       2,     0,     2,     1,     2,     3,     1,     0,     6,     6,
       5,     5,     4,     4,     4,     4,     1,     1,     1,     1,
       1,     1,     1,     1,     0,     1,     3,     1,     1,     4,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       0,     2,     1,     3,     0,     4,     1,     3,     2,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
       0,    13,     0,     0,     0,     0,    46,    21,     0,    70,
      41,     0,     0,     2,     3,    12,     0,     7,     6,    10,
       5,     8,     9,     0,     0,     0,     0,   290,     0,     0,
     166,   167,   168,   169,   170,   172,     0,   171,     0,   138,
      11,     1,     4,    15,    16,    14,     0,     0,     0,     0,
     282,   281,   283,    47,   280,     0,    19,    71,    23,   142,
       0,    30,    29,    32,   138,    25,     0,    31,    33,   139,
     141,    17,    18,    45,     0,   300,   301,   302,   303,   304,
     307,   305,   306,   308,   272,   288,   296,   291,   292,   273,
     289,    80,     0,     0,    80,     0,    28,    26,    42,     0,
       0,    35,     0,     0,   140,   298,   299,   294,     0,    85,
      84,    86,    87,    89,    88,     0,    90,     0,    91,    92,
       0,    55,    82,     0,    20,     0,     0,    37,     0,    80,
      27,   274,   297,     0,   293,     0,    60,    48,    56,     0,
      22,    72,   284,   285,   286,     0,   287,     0,     0,    34,
     288,    40,   275,   277,   278,   295,     0,     0,    63,    64,
      66,    65,    67,     0,    62,    50,    83,    50,     0,    38,
      36,   290,     0,    59,    58,     0,    57,    51,   133,   133,
      24,     0,   276,    61,    53,     0,   137,   136,     0,     0,
     133,   138,   131,     0,   279,     0,   135,    52,    49,   132,
     165,   134,    73,     0,     0,     0,     0,     0,     0,     0,
       0,   150,     0,   153,   156,     0,     0,     0,   221,     0,
     113,   114,   237,   238,   274,   155,   163,     0,   164,   119,
       0,   146,     0,   217,   218,   219,   245,   162,   147,   239,
     108,   159,     0,     0,     0,     0,   161,     0,   148,   149,
       0,     0,     0,     0,   309,   310,     0,   124,   158,   239,
     126,     0,    74,   160,   117,   143,   257,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   244,   243,     0,   290,     0,    54,     0,     0,   266,
     267,   268,   269,   270,   271,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   128,   128,   257,
     100,   120,   256,     0,   108,   247,   223,   224,   225,   226,
     229,   230,   231,   232,   228,   227,   233,   234,   235,   220,
       0,     0,     0,   307,   274,     0,     0,     0,   214,   288,
     173,     0,   241,   242,   240,   110,   111,   112,   109,     0,
     262,   264,     0,     0,   263,   265,     0,   211,   144,   151,
     152,     0,     0,   210,     0,   129,   251,     0,     0,    78,
       0,     0,     0,   254,     0,   249,   204,   205,   209,   208,
     236,   174,   175,   176,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   290,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   260,
       0,   261,     0,     0,   290,     0,     0,     0,     0,   125,
     250,   127,   222,     0,     0,     0,     0,   121,     0,   115,
     116,   118,     0,   255,     0,     0,   246,     0,   290,     0,
     290,   182,   191,   192,   196,   185,   186,   187,   190,   188,
     189,   180,   193,   194,   195,   184,     0,   178,   199,   177,
     179,   181,   183,   197,   198,     0,   258,   259,   212,     0,
     145,   154,   157,   130,   253,   252,   102,     0,     0,     0,
       0,    76,   101,   251,   122,     0,   248,   202,     0,   206,
       0,   200,   201,   213,    79,     0,     0,     0,     0,   103,
       0,   123,   247,   203,   207,    94,     0,    95,    97,     0,
      96,     0,     0,    77,     0,     0,     0,     0,   106,     0,
      75,     0,   216,    93,    99,    98,     0,   108,   104,     0,
     105,   107
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    12,    13,    14,    15,    24,    16,    17,    18,    29,
      63,    95,    64,    65,   102,   103,   129,   149,    19,    39,
      66,    20,    21,    28,    91,   165,   178,   188,   195,   139,
     118,   119,   163,   164,   189,    22,    38,    94,   167,   226,
     310,   499,   425,   120,   121,   122,   481,   369,   426,   512,
     521,   526,   286,   348,   227,   431,   228,   311,   370,   432,
     229,   307,   308,   364,   190,   191,   192,    68,    69,    70,
     201,   359,   230,   250,   252,   253,    36,    37,   231,   232,
     233,   261,   234,   235,   236,   285,   237,   267,   374,   365,
     420,   475,   312,   313,   238,   296,    85,   151,   152,   153,
      53,    54,   144,   154,   366,    48,    49,    87,   133,    88,
      89,    90,   256
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -312
static const short int yypact[] =
{
      58,  -312,    11,   -75,   -58,   -66,  -312,  -312,    -7,  -312,
    -312,    53,    60,    58,  -312,  -312,    57,  -312,  -312,  -312,
    -312,  -312,  -312,   -34,   110,    45,    56,  -312,   -70,    -7,
    -312,  -312,  -312,  -312,  -312,  -312,    30,  -312,    33,   149,
    -312,  -312,  -312,  -312,  -312,  -312,    51,    62,    41,   421,
    -312,  -312,  -312,  -312,  -312,    50,    63,  -312,  -312,  -312,
     164,  -312,  -312,  -312,   171,  -312,    93,  -312,    10,   100,
    -312,  -312,  -312,  -312,   479,  -312,  -312,  -312,  -312,  -312,
    -312,  -312,  -312,  -312,  -312,  -312,   122,   -61,  -312,  -312,
    -312,   519,    82,   170,   519,   103,  -312,  -312,  -312,   479,
     114,  -312,   218,   133,  -312,  -312,   479,  -312,   421,  -312,
    -312,  -312,  -312,  -312,  -312,   128,  -312,   134,  -312,  -312,
     251,    19,  -312,   170,  -312,   252,   435,  -312,   191,   519,
    -312,   435,  -312,   421,  -312,   -31,   -28,  -312,  -312,   519,
    -312,  -312,  -312,  -312,  -312,   147,  -312,   168,   177,  -312,
     156,  -312,   209,  -312,  -312,  -312,   165,   166,  -312,  -312,
    -312,  -312,  -312,   -42,  -312,   279,  -312,   279,   182,  -312,
    -312,  -312,   435,  -312,  -312,   -28,  -312,  -312,    -1,    -1,
    -312,   172,  -312,  -312,  -312,   284,  -312,  -312,   286,   238,
     109,   100,  -312,   247,  -312,    -7,  -312,  -312,  -312,  -312,
     378,  -312,  -312,   203,   -54,    39,   108,   479,   493,   229,
     230,  -312,   231,   228,  -312,   -49,   319,   216,  -312,   332,
    -312,  -312,  -312,  -312,   435,  -312,  -312,   333,  -312,  -312,
     334,  -312,   221,  -312,  -312,  -312,  -312,  -312,  -312,   264,
    -312,  -312,   479,   117,   479,   258,  -312,   270,  -312,  -312,
      -7,   295,    -7,    -7,  -312,  -312,   253,  -312,  -312,   153,
    -312,   248,  -312,  -312,  -312,  -312,   493,   249,   479,   479,
     479,   479,   479,   479,   479,   479,   479,   479,   479,   479,
     479,  -312,  -312,    -2,  -312,   223,   232,   359,   -54,  -312,
    -312,  -312,  -312,  -312,  -312,   -54,   479,   361,   -54,   -54,
     479,   479,   272,   493,   273,   274,   479,   479,   479,   493,
    -312,  -312,  -312,    46,  -312,   479,  -312,  -312,  -312,  -312,
    -312,  -312,  -312,  -312,  -312,  -312,  -312,  -312,  -312,  -312,
     449,   -49,   275,   259,   435,   479,   479,   479,  -312,   -79,
     446,   265,  -312,  -312,  -312,  -312,  -312,  -312,  -312,   -54,
    -312,  -312,   373,   -54,  -312,  -312,   374,    79,  -312,   316,
    -312,   278,   285,  -312,    71,  -312,  -312,    77,    81,     4,
      76,   493,   287,   232,    83,  -312,    87,   201,  -312,  -312,
    -312,  -312,  -312,  -312,   479,   479,   479,   479,   479,   479,
     479,   479,   479,   479,   479,   479,   479,   479,   479,  -312,
     479,   479,   479,   479,   479,   479,   479,   479,   291,  -312,
     -54,  -312,   -54,   479,  -312,   289,   170,   170,   479,  -312,
     372,  -312,  -312,   479,   479,   102,   397,  -312,   479,  -312,
    -312,  -312,   403,  -312,   349,   479,  -312,   479,  -312,   479,
    -312,  -312,  -312,  -312,  -312,  -312,  -312,  -312,  -312,  -312,
    -312,  -312,  -312,  -312,  -312,  -312,   292,  -312,  -312,  -312,
    -312,  -312,  -312,  -312,  -312,   479,  -312,  -312,  -312,   293,
    -312,  -312,  -312,  -312,  -312,  -312,  -312,   407,   479,   479,
     363,   100,  -312,  -312,  -312,   294,  -312,  -312,   297,  -312,
     304,  -312,  -312,  -312,  -312,     9,   420,    12,    21,  -312,
     422,   372,   479,  -312,  -312,  -312,   479,  -312,  -312,   479,
    -312,   479,    49,  -312,   119,   423,   425,   426,  -312,   493,
    -312,   427,  -312,  -312,  -312,  -312,    -7,  -312,  -312,   325,
     232,  -312
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -312,  -312,  -312,   419,  -312,  -312,  -312,  -312,  -312,  -312,
     233,  -312,  -312,   370,  -312,  -312,  -312,   105,  -312,  -312,
    -312,   -13,  -312,  -312,  -312,  -312,   277,  -312,  -312,  -312,
    -312,  -312,  -312,   281,   261,  -312,  -312,  -312,  -312,  -312,
    -312,  -312,  -312,   -84,  -312,   313,  -312,  -312,  -312,  -312,
    -312,  -312,  -311,  -312,  -312,  -312,  -312,  -312,  -312,  -312,
    -312,  -312,  -312,   146,  -312,  -312,   280,   282,  -312,   -68,
    -312,  -312,  -312,  -312,  -312,  -312,   -29,   135,  -312,  -312,
    -312,  -312,  -312,  -312,    35,  -312,  -208,  -312,   -22,  -310,
     -12,  -312,   112,   175,  -312,   236,  -124,   266,  -312,   317,
    -312,   210,  -167,   362,   -43,  -160,  -312,  -312,  -312,   -81,
    -312,   -91,   163
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -240
static const short int yytable[] =
{
      55,   104,   124,   373,   184,   375,    86,   150,   258,   107,
     125,   181,   329,   505,   -39,   423,   508,   330,    23,   158,
     159,   160,   161,   -81,    99,   510,    67,   134,   175,    25,
      50,   105,   140,   281,    51,   282,   100,   241,    52,  -239,
      30,    31,    32,    33,    34,   148,   142,    26,   150,   254,
      27,    67,   155,   242,   143,   255,   127,    40,   331,   332,
      41,    43,     1,   132,     2,    86,     3,     4,   108,   156,
     -68,    44,   162,   157,   518,   338,   239,   176,     5,   506,
     427,     6,   509,   146,   247,     7,   101,   424,   146,   138,
      86,   511,   259,    35,    75,    76,    77,    78,   222,    79,
     150,   185,   333,    81,    82,    83,   334,    84,   473,   186,
     187,   519,   -81,   476,    45,    46,   371,     8,   335,   336,
     337,   350,   244,   520,   341,   486,    47,   288,   351,   146,
      56,   354,   355,    57,     9,    75,    76,    77,    78,   428,
      79,   418,   314,    80,    81,    82,    83,   418,    84,   413,
      92,   371,    10,   435,   429,    71,   430,   437,    73,   339,
      11,   343,   243,   245,   246,   372,   203,    72,    96,     5,
     289,   290,   291,   292,   293,   294,    58,   478,    93,   360,
     -69,   146,   409,   479,   480,   314,   411,   295,    98,   435,
     419,     5,   375,    59,   106,   414,   421,   123,    58,   287,
     422,   297,   436,   438,    75,    76,    77,    78,   126,    79,
     150,   185,    80,    81,    82,    83,   530,    84,   128,   186,
     187,   302,   130,   304,   305,   316,   317,   318,   319,   320,
     321,   322,   323,   324,   325,   326,   327,   328,   522,   456,
     340,   131,    59,   466,   -43,   467,   135,   314,   345,   346,
     347,    60,   136,   352,   469,   137,   141,   356,   357,    61,
      62,   147,   168,   363,    59,   281,   -44,   282,   298,   169,
     170,   439,   171,    60,    80,    81,    82,    83,   488,   172,
     490,    61,    62,   177,   173,   174,   180,   377,   196,   194,
     197,   146,   381,   382,   383,   268,   269,   270,   271,   272,
     273,   274,   275,   240,   276,   277,   278,   279,   280,   198,
     259,   289,   290,   291,   292,   293,   294,   440,   202,    75,
      76,    77,    78,    50,    79,   471,   472,   342,   299,   248,
     249,    52,    84,   -23,   260,   251,   262,   264,   265,   266,
     301,   441,   442,   443,   444,   445,   446,   447,   448,   449,
     450,   451,   452,   453,   454,   455,   498,   457,   458,   459,
     460,   461,   462,   463,   464,   303,   309,   315,   306,   349,
     468,   353,   358,   361,   362,   379,   281,  -238,   282,   283,
     284,   477,   408,   410,   412,   483,   415,   474,   204,   470,
     205,   206,   207,   416,   487,   527,   489,   208,   209,   210,
     417,   482,   434,   211,   212,   213,   465,   484,   214,   491,
     493,   494,   502,   500,   503,    75,    76,    77,    78,   222,
      79,   504,   492,   223,   507,   531,   513,   523,    84,   524,
     525,   528,    42,   225,    97,   495,   496,   257,   215,   380,
     193,   216,   217,   218,   179,    75,    76,    77,    78,   222,
      79,   219,   166,   223,   367,   220,   183,   221,    84,    75,
      76,    77,    78,   515,    79,   376,   516,   497,   517,   485,
     199,   501,    84,   200,    75,    76,    77,    78,   222,    79,
     514,   300,   223,   433,   368,   384,   224,    84,   145,   182,
     263,   385,   386,    74,   378,   344,  -215,   529,   387,   388,
     389,   390,   391,   392,   393,     0,     0,     0,     0,     0,
       0,     0,   394,   395,   396,   397,     0,    75,    76,    77,
      78,     0,    79,     0,     0,    80,    81,    82,    83,     0,
      84,    75,    76,    77,    78,   142,    79,     0,     0,    80,
      81,    82,    83,   143,    84,    75,    76,    77,    78,    35,
      79,     0,     0,    80,    81,    82,    83,     0,    84,   398,
       0,     0,   399,     0,     0,     0,     0,   400,   401,   402,
     403,   404,   405,   406,   407,    75,    76,    77,    78,     0,
      79,     0,     0,    80,    81,    82,    83,     0,    84,    75,
      76,    77,    78,     0,    79,     0,     0,     0,     0,     0,
       0,     0,    84,   109,   110,   111,   112,   113,   114,   115,
     116,   117
};

static const short int yycheck[] =
{
      29,    69,    93,   314,     5,   315,    49,   131,   216,    70,
      94,   171,    14,     4,     4,    11,     4,    19,     7,    47,
      48,    49,    50,     4,    14,     4,    39,   108,    70,   104,
     100,    74,   123,   112,   104,   114,    26,   204,   108,   118,
      47,    48,    49,    50,    51,   129,   100,   105,   172,    98,
     116,    64,   133,    14,   108,   104,    99,     4,    60,    61,
       0,     4,     4,   106,     6,   108,     8,     9,   129,   100,
      71,   105,   100,   104,    25,   283,   200,   119,    20,    70,
       4,    23,    70,   126,   208,    27,    76,    83,   131,    70,
     133,    70,   216,   100,    96,    97,    98,    99,   100,   101,
     224,   102,   104,   105,   106,   107,   108,   109,   418,   110,
     111,    62,    93,   423,     4,    70,    70,    59,   120,   121,
     122,   288,    14,    74,   284,   435,    70,    10,   295,   172,
     100,   298,   299,   100,    76,    96,    97,    98,    99,    63,
     101,    70,   266,   104,   105,   106,   107,    70,   109,    70,
     100,    70,    94,    70,    78,   104,    80,    70,   117,   283,
     102,   285,   205,   206,   207,   119,   195,   105,     4,    20,
      53,    54,    55,    56,    57,    58,    27,    75,   115,   303,
      71,   224,   349,    81,    82,   309,   353,    70,    95,    70,
     119,    20,   502,    93,    72,   116,   119,   115,    27,   242,
     119,   244,   119,   116,    96,    97,    98,    99,   105,   101,
     334,   102,   104,   105,   106,   107,   527,   109,   104,   110,
     111,   250,     4,   252,   253,   268,   269,   270,   271,   272,
     273,   274,   275,   276,   277,   278,   279,   280,   119,   399,
     283,   108,    93,   410,    95,   412,   118,   371,    16,    17,
      18,   102,   118,   296,   414,     4,     4,   300,   301,   110,
     111,    70,   115,   306,    93,   112,    95,   114,    10,   101,
      93,    70,   116,   102,   104,   105,   106,   107,   438,    70,
     440,   110,   111,     4,   119,   119,   104,   330,     4,   117,
       4,   334,   335,   336,   337,    31,    32,    33,    34,    35,
      36,    37,    38,   100,    40,    41,    42,    43,    44,    71,
     434,    53,    54,    55,    56,    57,    58,   116,    71,    96,
      97,    98,    99,   100,   101,   416,   417,   104,    70,   100,
     100,   108,   109,   105,   118,   104,     4,     4,     4,   118,
      70,   384,   385,   386,   387,   388,   389,   390,   391,   392,
     393,   394,   395,   396,   397,   398,   480,   400,   401,   402,
     403,   404,   405,   406,   407,    70,   118,   118,   115,    10,
     413,    10,   100,   100,   100,   100,   112,   118,   114,   115,
     116,   424,   117,    10,    10,   428,    70,    15,    10,   100,
      12,    13,    14,   115,   437,   519,   439,    19,    20,    21,
     115,     4,   115,    25,    26,    27,   115,     4,    30,   117,
     117,     4,   118,   481,   117,    96,    97,    98,    99,   100,
     101,   117,   465,   104,     4,   100,     4,     4,   109,     4,
       4,     4,    13,   200,    64,   478,   479,   118,    60,   334,
     179,    63,    64,    65,   167,    96,    97,    98,    99,   100,
     101,    73,   139,   104,   308,    77,   175,    79,   109,    96,
      97,    98,    99,   506,   101,   330,   509,   104,   511,   434,
     190,   483,   109,   191,    96,    97,    98,    99,   100,   101,
     502,   245,   104,   371,   309,    39,   108,   109,   126,   172,
     224,    45,    46,    72,   331,   285,   118,   526,    52,    53,
      54,    55,    56,    57,    58,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    67,    68,    69,    -1,    96,    97,    98,
      99,    -1,   101,    -1,    -1,   104,   105,   106,   107,    -1,
     109,    96,    97,    98,    99,   100,   101,    -1,    -1,   104,
     105,   106,   107,   108,   109,    96,    97,    98,    99,   100,
     101,    -1,    -1,   104,   105,   106,   107,    -1,   109,   113,
      -1,    -1,   116,    -1,    -1,    -1,    -1,   121,   122,   123,
     124,   125,   126,   127,   128,    96,    97,    98,    99,    -1,
     101,    -1,    -1,   104,   105,   106,   107,    -1,   109,    96,
      97,    98,    99,    -1,   101,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    84,    85,    86,    87,    88,    89,    90,
      91,    92
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,     9,    20,    23,    27,    59,    76,
      94,   102,   131,   132,   133,   134,   136,   137,   138,   148,
     151,   152,   165,     7,   135,   104,   105,   116,   153,   139,
      47,    48,    49,    50,    51,   100,   206,   207,   166,   149,
       4,     0,   133,     4,   105,     4,    70,    70,   235,   236,
     100,   104,   108,   230,   231,   206,   100,   100,    27,    93,
     102,   110,   111,   140,   142,   143,   150,   151,   197,   198,
     199,   104,   105,   117,    72,    96,    97,    98,    99,   101,
     104,   105,   106,   107,   109,   226,   234,   237,   239,   240,
     241,   154,   100,   115,   167,   141,     4,   143,    95,    14,
      26,    76,   144,   145,   199,   234,    72,    70,   129,    84,
      85,    86,    87,    88,    89,    90,    91,    92,   160,   161,
     173,   174,   175,   115,   241,   173,   105,   234,   104,   146,
       4,   108,   234,   238,   239,   118,   118,     4,    70,   159,
     241,     4,   100,   108,   232,   233,   234,    70,   173,   147,
     226,   227,   228,   229,   233,   239,   100,   104,    47,    48,
      49,    50,   100,   162,   163,   155,   175,   168,   115,   101,
      93,   116,    70,   119,   119,    70,   119,     4,   156,   156,
     104,   235,   229,   163,     5,   102,   110,   111,   157,   164,
     194,   195,   196,   164,   117,   158,     4,     4,    71,   196,
     197,   200,    71,   206,    10,    12,    13,    14,    19,    20,
      21,    25,    26,    27,    30,    60,    63,    64,    65,    73,
      77,    79,   100,   104,   108,   140,   169,   184,   186,   190,
     202,   208,   209,   210,   212,   213,   214,   216,   224,   226,
     100,   232,    14,   234,    14,   234,   234,   226,   100,   100,
     203,   104,   204,   205,    98,   104,   242,   118,   216,   226,
     118,   211,     4,   227,     4,     4,   118,   217,    31,    32,
      33,    34,    35,    36,    37,    38,    40,    41,    42,    43,
      44,   112,   114,   115,   116,   215,   182,   234,    10,    53,
      54,    55,    56,    57,    58,    70,   225,   234,    10,    70,
     225,    70,   206,    70,   206,   206,   115,   191,   192,   118,
     170,   187,   222,   223,   226,   118,   234,   234,   234,   234,
     234,   234,   234,   234,   234,   234,   234,   234,   234,    14,
      19,    60,    61,   104,   108,   120,   121,   122,   216,   226,
     234,   235,   104,   226,   231,    16,    17,    18,   183,    10,
     232,   232,   234,    10,   232,   232,   234,   234,   100,   201,
     226,   100,   100,   234,   193,   219,   234,   193,   223,   177,
     188,    70,   119,   182,   218,   219,   207,   234,   242,   100,
     147,   234,   234,   234,    39,    45,    46,    52,    53,    54,
      55,    56,    57,    58,    66,    67,    68,    69,   113,   116,
     121,   122,   123,   124,   125,   126,   127,   128,   117,   232,
      10,   232,    10,    70,   116,    70,   115,   115,    70,   119,
     220,   119,   119,    11,    83,   172,   178,     4,    63,    78,
      80,   185,   189,   222,   115,    70,   119,    70,   116,    70,
     116,   234,   234,   234,   234,   234,   234,   234,   234,   234,
     234,   234,   234,   234,   234,   234,   235,   234,   234,   234,
     234,   234,   234,   234,   234,   115,   232,   232,   234,   235,
     100,   241,   241,   219,    15,   221,   219,   234,    75,    81,
      82,   176,     4,   234,     4,   214,   219,   234,   235,   234,
     235,   117,   234,   117,     4,   234,   234,   104,   226,   171,
     199,   220,   118,   117,   117,     4,    70,     4,     4,    70,
       4,    70,   179,     4,   218,   234,   234,   234,    25,    62,
      74,   180,   119,     4,     4,     4,   181,   226,     4,   206,
     182,   100
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
#line 398 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 5:
#line 407 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 6:
#line 408 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 7:
#line 409 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 8:
#line 410 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 411 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 412 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 413 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 12:
#line 414 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 13:
#line 415 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 14:
#line 418 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 15:
#line 419 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 16:
#line 423 "compilers/imcc/imcc.y"
    { if ((yyvsp[0].s))
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 17:
#line 431 "compilers/imcc/imcc.y"
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
#line 440 "compilers/imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                IMCC_INFO(interp)->HLL_id, atoi((yyvsp[-2].s)), atoi((yyvsp[0].s)));
             (yyval.t) = 0;
         }
    break;

  case 19:
#line 449 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 20:
#line 455 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         }
    break;

  case 21:
#line 463 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 22:
#line 464 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1);is_def=0; }
    break;

  case 23:
#line 468 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 24:
#line 469 "compilers/imcc/imcc.y"
    { (yyval.i) = mk_pmc_const(interp, cur_unit, (yyvsp[-3].s), (yyvsp[-2].sr), (yyvsp[0].s));is_def=0; }
    break;

  case 27:
#line 477 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 28:
#line 478 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 29:
#line 479 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 30:
#line 480 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 31:
#line 481 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); }
    break;

  case 33:
#line 485 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 34:
#line 487 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, cur_unit, (yyvsp[-1].s),0,regs,nargs,keyvec,1);
                     free((yyvsp[-1].s)); }
    break;

  case 35:
#line 490 "compilers/imcc/imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                    }
    break;

  case 36:
#line 495 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, (yyvsp[0].s)));
                     cur_call->pcc_sub->pragma = (yyvsp[-1].t);
                   }
    break;

  case 37:
#line 501 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[0].sr)); }
    break;

  case 38:
#line 503 "compilers/imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, (yyvsp[0].s));
                       set_lexical(interp, r, (yyvsp[-2].s)); (yyval.i) = 0;
                   }
    break;

  case 39:
#line 507 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 41:
#line 515 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 42:
#line 517 "compilers/imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     (yyval.i)=0; }
    break;

  case 45:
#line 532 "compilers/imcc/imcc.y"
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
#line 548 "compilers/imcc/imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 47:
#line 552 "compilers/imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, (yyvsp[0].sr));
        }
    break;

  case 48:
#line 555 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = (yyvsp[-1].t); }
    break;

  case 49:
#line 557 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; }
    break;

  case 50:
#line 561 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 51:
#line 562 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; }
    break;

  case 52:
#line 563 "compilers/imcc/imcc.y"
    { add_pcc_param(cur_call, (yyvsp[-1].sr));}
    break;

  case 53:
#line 567 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 54:
#line 568 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_ident(interp, (yyvsp[-1].s), (yyvsp[-2].t));
                                         is_def=0; (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 55:
#line 573 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  }
    break;

  case 57:
#line 578 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 58:
#line 582 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; cur_unit->outer =
                     mk_sub_address_fromc(interp, (yyvsp[-1].s)); }
    break;

  case 59:
#line 585 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; cur_unit->outer =
                     mk_const(interp, (yyvsp[-1].s), 'S'); }
    break;

  case 60:
#line 590 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 61:
#line 591 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; add_pcc_multi(cur_call, (yyvsp[0].sr)); }
    break;

  case 62:
#line 592 "compilers/imcc/imcc.y"
    { (yyval.t) = 0;  add_pcc_multi(cur_call, (yyvsp[0].sr));}
    break;

  case 63:
#line 596 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 64:
#line 597 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 65:
#line 598 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 66:
#line 599 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 67:
#line 600 "compilers/imcc/imcc.y"
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
#line 618 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 71:
#line 620 "compilers/imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, (yyvsp[0].s)));

         }
    break;

  case 72:
#line 624 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = (yyvsp[-1].t); }
    break;

  case 73:
#line 626 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; }
    break;

  case 74:
#line 631 "compilers/imcc/imcc.y"
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
#line 658 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; }
    break;

  case 76:
#line 662 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 77:
#line 663 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 78:
#line 667 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL; }
    break;

  case 79:
#line 669 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->object = (yyvsp[-1].sr); }
    break;

  case 80:
#line 673 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 82:
#line 678 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[0].t); }
    break;

  case 83:
#line 679 "compilers/imcc/imcc.y"
    { (yyval.t) = (yyvsp[-2].t) | (yyvsp[0].t); }
    break;

  case 84:
#line 683 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_LOAD; }
    break;

  case 85:
#line 684 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_MAIN; }
    break;

  case 86:
#line 685 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_IMMEDIATE; }
    break;

  case 87:
#line 686 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_POSTCOMP; }
    break;

  case 88:
#line 687 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_ANON; }
    break;

  case 89:
#line 688 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_METHOD; }
    break;

  case 90:
#line 689 "compilers/imcc/imcc.y"
    {  (yyval.t) = P_NEED_LEX; }
    break;

  case 93:
#line 696 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, (yyvsp[-3].sr));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         }
    break;

  case 94:
#line 701 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-1].sr)); }
    break;

  case 95:
#line 703 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, (yyvsp[-1].sr));
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 96:
#line 708 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-1].sr)); }
    break;

  case 97:
#line 710 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, (yyvsp[-1].s),'S')); }
    break;

  case 98:
#line 712 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-3].sr));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         }
    break;

  case 99:
#line 716 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, (yyvsp[-3].s),'S'));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         }
    break;

  case 100:
#line 723 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 101:
#line 724 "compilers/imcc/imcc.y"
    {  add_pcc_arg(cur_call, (yyvsp[-1].sr)); }
    break;

  case 102:
#line 728 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 103:
#line 733 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 104:
#line 734 "compilers/imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_result(cur_call, (yyvsp[-1].sr)); }
    break;

  case 105:
#line 738 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 106:
#line 739 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 107:
#line 740 "compilers/imcc/imcc.y"
    {  mk_ident(interp, (yyvsp[0].s), (yyvsp[-1].t)); is_def=0; (yyval.sr)=0; }
    break;

  case 108:
#line 744 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 109:
#line 745 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); }
    break;

  case 110:
#line 749 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_FLAT;   }
    break;

  case 111:
#line 750 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPTIONAL; }
    break;

  case 112:
#line 751 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_OPT_FLAG; }
    break;

  case 113:
#line 756 "compilers/imcc/imcc.y"
    { (yyval.t) = 0; }
    break;

  case 114:
#line 757 "compilers/imcc/imcc.y"
    { (yyval.t) = 1; }
    break;

  case 117:
#line 767 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, (yyvsp[-1].t)); }
    break;

  case 118:
#line 770 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 119:
#line 771 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.i) = 0;  }
    break;

  case 120:
#line 777 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 121:
#line 779 "compilers/imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); }
    break;

  case 122:
#line 781 "compilers/imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); }
    break;

  case 123:
#line 785 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 124:
#line 790 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 125:
#line 795 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 126:
#line 797 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 127:
#line 802 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  }
    break;

  case 128:
#line 806 "compilers/imcc/imcc.y"
    { (yyval.i) = 0; }
    break;

  case 129:
#line 807 "compilers/imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr));    }
    break;

  case 130:
#line 808 "compilers/imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr));    }
    break;

  case 133:
#line 826 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 134:
#line 831 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[0].i); }
    break;

  case 135:
#line 832 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 136:
#line 833 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 137:
#line 834 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 138:
#line 838 "compilers/imcc/imcc.y"
    {  (yyval.i) = NULL; }
    break;

  case 142:
#line 848 "compilers/imcc/imcc.y"
    {
                     (yyval.i) = iLABEL(cur_unit, mk_local_label(interp, (yyvsp[0].s)));
                   }
    break;

  case 143:
#line 855 "compilers/imcc/imcc.y"
    { (yyval.i) = (yyvsp[-1].i); }
    break;

  case 144:
#line 859 "compilers/imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = (yyvsp[0].s);
            (yyval.idlist) = l;
         }
    break;

  case 145:
#line 867 "compilers/imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = (yyvsp[0].s);
           l->next = (yyvsp[-2].idlist);
           (yyval.idlist) = l;
        }
    break;

  case 148:
#line 877 "compilers/imcc/imcc.y"
    { push_namespace((yyvsp[0].s)); }
    break;

  case 149:
#line 878 "compilers/imcc/imcc.y"
    { pop_namespace((yyvsp[0].s)); }
    break;

  case 150:
#line 879 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 151:
#line 880 "compilers/imcc/imcc.y"
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

  case 152:
#line 893 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, (yyvsp[0].sr), (yyvsp[-2].s)); (yyval.i) = 0;
                    }
    break;

  case 153:
#line 896 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 154:
#line 897 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 0);is_def=0; }
    break;

  case 156:
#line 899 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 157:
#line 900 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1);is_def=0; }
    break;

  case 158:
#line 901 "compilers/imcc/imcc.y"
    { (yyval.i) = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 159:
#line 905 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "branch",1, (yyvsp[0].sr)); }
    break;

  case 160:
#line 907 "compilers/imcc/imcc.y"
    { (yyval.i) = INS(interp, cur_unit, (yyvsp[-1].s), 0, regs, nargs, keyvec, 1);
                                          free((yyvsp[-1].s)); }
    break;

  case 161:
#line 910 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[0].sr)); }
    break;

  case 162:
#line 911 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; cur_call = NULL; }
    break;

  case 163:
#line 912 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 165:
#line 914 "compilers/imcc/imcc.y"
    { (yyval.i) = 0;}
    break;

  case 166:
#line 918 "compilers/imcc/imcc.y"
    { (yyval.t) = 'I'; }
    break;

  case 167:
#line 919 "compilers/imcc/imcc.y"
    { (yyval.t) = 'N'; }
    break;

  case 168:
#line 920 "compilers/imcc/imcc.y"
    { (yyval.t) = 'S'; }
    break;

  case 169:
#line 921 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 170:
#line 922 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; }
    break;

  case 171:
#line 923 "compilers/imcc/imcc.y"
    { (yyval.t) = 'P'; free((yyvsp[0].s)); }
    break;

  case 172:
#line 928 "compilers/imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, (yyvsp[0].s), 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", (yyvsp[0].s));
            }
         }
    break;

  case 173:
#line 938 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "set", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 174:
#line 939 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "not", 2, (yyvsp[-3].sr), (yyvsp[0].sr));}
    break;

  case 175:
#line 940 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "neg", 2, (yyvsp[-3].sr), (yyvsp[0].sr));}
    break;

  case 176:
#line 941 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bnot", 2, (yyvsp[-3].sr), (yyvsp[0].sr));}
    break;

  case 177:
#line 942 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "add", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 178:
#line 943 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "sub", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 179:
#line 944 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mul", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 180:
#line 945 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "pow", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 181:
#line 946 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "div", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 182:
#line 947 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "fdiv", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 183:
#line 948 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mod", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr));  }
    break;

  case 184:
#line 949 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "concat", 3, (yyvsp[-4].sr),(yyvsp[-2].sr),(yyvsp[0].sr)); }
    break;

  case 185:
#line 950 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "iseq", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 186:
#line 951 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isne", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 187:
#line 952 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isgt", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 188:
#line 953 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "islt", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 189:
#line 954 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isle", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 190:
#line 955 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "isge", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 191:
#line 957 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shl", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 192:
#line 959 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 193:
#line 961 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "lsr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 194:
#line 963 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "and", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 195:
#line 965 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "or", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 196:
#line 967 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "xor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 197:
#line 969 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "band", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 198:
#line 971 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 199:
#line 973 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bxor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 200:
#line 975 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); }
    break;

  case 201:
#line 977 "compilers/imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[0].sr)); }
    break;

  case 202:
#line 979 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-2].s), (yyvsp[0].sr), 1); }
    break;

  case 203:
#line 981 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-6].sr), (yyvsp[-3].s), (yyvsp[-1].sr), 1); }
    break;

  case 204:
#line 983 "compilers/imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-3].sr), (yyvsp[0].s), NULL, 1); }
    break;

  case 205:
#line 985 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[-3].sr), (yyvsp[0].sr)); }
    break;

  case 206:
#line 987 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 207:
#line 989 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-6].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); }
    break;

  case 208:
#line 991 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "set_addr",
                            2, (yyvsp[-3].sr), mk_label_address(interp, (yyvsp[0].s))); }
    break;

  case 209:
#line 994 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "find_global",2,(yyvsp[-3].sr),(yyvsp[0].sr));}
    break;

  case 210:
#line 996 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "store_global",2, (yyvsp[-2].sr),(yyvsp[0].sr)); }
    break;

  case 211:
#line 1000 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 212:
#line 1002 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 213:
#line 1004 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); }
    break;

  case 214:
#line 1007 "compilers/imcc/imcc.y"
    {
            add_pcc_result((yyvsp[0].i)->r[0], (yyvsp[-2].sr));
            cur_call = NULL;
            (yyval.i) = 0;
         }
    break;

  case 215:
#line 1013 "compilers/imcc/imcc.y"
    {
            (yyval.i) = IMCC_create_itcall_label(interp);
         }
    break;

  case 216:
#line 1017 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[-3].sr));
           cur_call = NULL;
         }
    break;

  case 220:
#line 1025 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[-2].sr)); }
    break;

  case 221:
#line 1028 "compilers/imcc/imcc.y"
    { (yyval.i) = IMCC_create_itcall_label(interp);
                           (yyval.i)->type &= ~ITCALL; (yyval.i)->type |= ITRESULT; }
    break;

  case 222:
#line 1030 "compilers/imcc/imcc.y"
    {  (yyval.i) = 0; }
    break;

  case 223:
#line 1035 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "add", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 224:
#line 1037 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "sub", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 225:
#line 1039 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mul", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 226:
#line 1041 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "div", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 227:
#line 1043 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mod", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 228:
#line 1045 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "fdiv", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 229:
#line 1047 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "concat", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 230:
#line 1049 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "band", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 231:
#line 1051 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 232:
#line 1053 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bxor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 233:
#line 1055 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 234:
#line 1057 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shl", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 235:
#line 1059 "compilers/imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "lsr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 236:
#line 1064 "compilers/imcc/imcc.y"
    { (yyval.i) = func_ins(interp, cur_unit, (yyvsp[-3].sr), (yyvsp[-1].s),
                                   regs,nargs,keyvec,1);
                     free((yyvsp[-1].s));
                   }
    break;

  case 237:
#line 1070 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); }
    break;

  case 238:
#line 1071 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); }
    break;

  case 239:
#line 1072 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[0].sr);
                       if ((yyvsp[0].sr)->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 240:
#line 1077 "compilers/imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 241:
#line 1078 "compilers/imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); }
    break;

  case 242:
#line 1079 "compilers/imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 243:
#line 1082 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 244:
#line 1083 "compilers/imcc/imcc.y"
    { (yyval.t)=0; }
    break;

  case 245:
#line 1088 "compilers/imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[0].sr));
        }
    break;

  case 246:
#line 1093 "compilers/imcc/imcc.y"
    {  (yyval.i) = (yyvsp[-3].i); }
    break;

  case 247:
#line 1097 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 248:
#line 1098 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; add_pcc_arg(cur_call, (yyvsp[0].sr)); }
    break;

  case 249:
#line 1099 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; add_pcc_arg(cur_call, (yyvsp[0].sr)); }
    break;

  case 250:
#line 1103 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 251:
#line 1107 "compilers/imcc/imcc.y"
    {  (yyval.t) = 0; }
    break;

  case 252:
#line 1108 "compilers/imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); }
    break;

  case 253:
#line 1112 "compilers/imcc/imcc.y"
    {  (yyval.t) = VT_FLAT; }
    break;

  case 254:
#line 1115 "compilers/imcc/imcc.y"
    { (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); }
    break;

  case 255:
#line 1119 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_result(cur_call, (yyvsp[0].sr)); }
    break;

  case 256:
#line 1120 "compilers/imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_result(cur_call, (yyvsp[0].sr)); }
    break;

  case 257:
#line 1121 "compilers/imcc/imcc.y"
    {  (yyval.sr) = 0; }
    break;

  case 258:
#line 1126 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, (yyvsp[-3].s), 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 259:
#line 1128 "compilers/imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, inv_op((yyvsp[-3].s)), 3, (yyvsp[-4].sr),(yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 260:
#line 1130 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 261:
#line 1132 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 262:
#line 1134 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 263:
#line 1136 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless",2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 264:
#line 1138 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 265:
#line 1140 "compilers/imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); }
    break;

  case 266:
#line 1144 "compilers/imcc/imcc.y"
    {  (yyval.s) = "eq"; }
    break;

  case 267:
#line 1145 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ne"; }
    break;

  case 268:
#line 1146 "compilers/imcc/imcc.y"
    {  (yyval.s) = "gt"; }
    break;

  case 269:
#line 1147 "compilers/imcc/imcc.y"
    {  (yyval.s) = "ge"; }
    break;

  case 270:
#line 1148 "compilers/imcc/imcc.y"
    {  (yyval.s) = "lt"; }
    break;

  case 271:
#line 1149 "compilers/imcc/imcc.y"
    {  (yyval.s) = "le"; }
    break;

  case 274:
#line 1158 "compilers/imcc/imcc.y"
    {  (yyval.sr) = NULL; }
    break;

  case 275:
#line 1159 "compilers/imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 276:
#line 1163 "compilers/imcc/imcc.y"
    { (yyval.sr) = regs[0]; }
    break;

  case 278:
#line 1168 "compilers/imcc/imcc.y"
    {  regs[nargs++] = (yyvsp[0].sr); }
    break;

  case 279:
#line 1170 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = (yyvsp[-3].sr);
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = (yyvsp[-1].sr); (yyval.sr) = (yyvsp[-3].sr);
                   }
    break;

  case 281:
#line 1178 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); }
    break;

  case 282:
#line 1182 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); }
    break;

  case 283:
#line 1183 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); }
    break;

  case 284:
#line 1187 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); }
    break;

  case 285:
#line 1188 "compilers/imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); }
    break;

  case 290:
#line 1201 "compilers/imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 291:
#line 1202 "compilers/imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp, nkeys, keys); }
    break;

  case 292:
#line 1206 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[0].sr); }
    break;

  case 293:
#line 1208 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[0].sr); (yyval.sr) =  keys[0]; }
    break;

  case 294:
#line 1209 "compilers/imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 295:
#line 1210 "compilers/imcc/imcc.y"
    { keys[nkeys++] = (yyvsp[0].sr); (yyval.sr) =  keys[0]; }
    break;

  case 296:
#line 1214 "compilers/imcc/imcc.y"
    { if (in_slice) {
                         (yyvsp[0].sr)->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     (yyval.sr) = (yyvsp[0].sr);
                   }
    break;

  case 297:
#line 1220 "compilers/imcc/imcc.y"
    { (yyvsp[-2].sr)->type |= VT_START_SLICE;  (yyvsp[0].sr)->type |= VT_END_SLICE;
                     keys[nkeys++] = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 298:
#line 1222 "compilers/imcc/imcc.y"
    { (yyvsp[0].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[0].sr); }
    break;

  case 299:
#line 1223 "compilers/imcc/imcc.y"
    { (yyvsp[-1].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[-1].sr); }
    break;

  case 300:
#line 1227 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'I'); }
    break;

  case 301:
#line 1228 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'N'); }
    break;

  case 302:
#line 1229 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); }
    break;

  case 303:
#line 1230 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'P'); }
    break;

  case 304:
#line 1231 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_pasm_reg(interp, (yyvsp[0].s)); }
    break;

  case 305:
#line 1235 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'I'); }
    break;

  case 306:
#line 1236 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'N'); }
    break;

  case 307:
#line 1237 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); }
    break;

  case 308:
#line 1238 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'U'); }
    break;

  case 309:
#line 1242 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); }
    break;

  case 310:
#line 1243 "compilers/imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); }
    break;


    }

/* Line 1037 of yacc.c.  */
#line 3657 "compilers/imcc/imcparser.c"

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


#line 1248 "compilers/imcc/imcc.y"



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

