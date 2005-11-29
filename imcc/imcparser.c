/* A Bison parser, made from imcc/imcc.y, by GNU bison 1.75.  */

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
#define YYBISON	1

/* Pure parsers.  */
#define YYPURE	1

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
#line 1 "imcc/imcc.y"

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
 * substr or X = Pkey
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
 * substr or Pkey = X
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
    if (r->usage & U_LEXICAL) {
        IMCC_fataly(interp, E_SyntaxError,
            "variable '%s' is already lexical for %s",
            r->name, r->reg->name);
    }
    r->usage |= U_LEXICAL;
    r->reg = mk_const(interp, name, 'S');
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

#ifndef YYSTYPE
#line 319 "imcc/imcc.y"
typedef union {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 193 of /usr/share/bison/yacc.c.  */
#line 625 "imcc/imcparser.c"
# define YYSTYPE yystype
# define YYSTYPE_IS_TRIVIAL 1
#endif

#ifndef YYLTYPE
typedef struct yyltype
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
} yyltype;
# define YYLTYPE yyltype
# define YYLTYPE_IS_TRIVIAL 1
#endif

/* Copy the second part of user declarations.  */


/* Line 213 of /usr/share/bison/yacc.c.  */
#line 646 "imcc/imcparser.c"

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
	 || (YYLTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  short yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAX (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short) + sizeof (YYSTYPE))				\
      + YYSTACK_GAP_MAX)

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
	    (To)[yyi] = (From)[yyi];	\
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
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAX;	\
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
#define YYLAST   588

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  130
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  113
/* YYNRULES -- Number of rules. */
#define YYNRULES  303
/* YYNRULES -- Number of states. */
#define YYNSTATES  520

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   368

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

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
static const unsigned short yyprhs[] =
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
     580,   586,   592,   598,   604,   611,   618,   625,   633,   638,
     643,   650,   658,   663,   668,   673,   678,   685,   693,   697,
     698,   708,   710,   712,   714,   718,   719,   725,   729,   733,
     737,   741,   745,   749,   753,   757,   761,   765,   769,   773,
     777,   782,   784,   786,   788,   792,   796,   800,   802,   804,
     805,   811,   812,   816,   818,   821,   822,   825,   827,   830,
     834,   836,   843,   850,   856,   862,   867,   872,   877,   882,
     884,   886,   888,   890,   892,   894,   896,   898,   899,   901,
     905,   907,   909,   914,   916,   918,   920,   922,   924,   926,
     928,   930,   932,   934,   935,   938,   940,   944,   945,   950,
     952,   956,   959,   962,   964,   966,   968,   970,   972,   974,
     976,   978,   980,   982
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
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
     226,   115,   234,    45,   234,    -1,   226,   115,   234,    46,
     234,    -1,   226,   115,   234,    67,   234,    -1,   226,   115,
     234,    68,   234,    -1,   226,   115,   234,    69,   234,    -1,
     226,   115,   234,    52,   234,    -1,   226,   115,   234,   127,
     234,    -1,   226,   115,   234,   128,   234,    -1,   226,   115,
     234,   122,   234,    -1,   226,   115,   234,   116,   235,   117,
      -1,   226,   116,   235,   117,   115,   234,    -1,   226,   115,
      19,   207,    70,   234,    -1,   226,   115,    19,   207,   116,
     235,   117,    -1,   226,   115,    19,   207,    -1,   226,   115,
      19,   234,    -1,   226,   115,    19,   234,    70,   234,    -1,
     226,   115,    19,   234,   116,   235,   117,    -1,   226,   115,
      61,   100,    -1,   226,   115,    60,   242,    -1,    60,   242,
     115,   234,    -1,    19,   226,    70,   234,    -1,    19,   226,
      70,   234,    70,   234,    -1,    19,   226,    70,   234,   116,
     235,   117,    -1,   226,   115,   216,    -1,    -1,   209,   118,
     223,   119,   115,   214,   118,   218,   119,    -1,   210,    -1,
     212,    -1,   213,    -1,   226,   115,    14,    -1,    -1,    65,
     211,   118,   223,   119,    -1,   226,    31,   234,    -1,   226,
      32,   234,    -1,   226,    33,   234,    -1,   226,    34,   234,
      -1,   226,    41,   234,    -1,   226,    40,   234,    -1,   226,
      35,   234,    -1,   226,    36,   234,    -1,   226,    37,   234,
      -1,   226,    38,   234,    -1,   226,    42,   234,    -1,   226,
      43,   234,    -1,   226,    44,   234,    -1,   226,   115,   108,
     147,    -1,   100,    -1,   104,    -1,   226,    -1,   226,   215,
     231,    -1,   226,   215,   104,    -1,   226,   215,   226,    -1,
     114,    -1,   112,    -1,    -1,   214,   217,   118,   218,   119,
      -1,    -1,   218,    70,   219,    -1,   219,    -1,   234,   220,
      -1,    -1,   220,   221,    -1,    15,    -1,   226,   182,    -1,
     223,    70,   222,    -1,   222,    -1,    12,   234,   225,   234,
      10,   232,    -1,    13,   234,   225,   234,    10,   232,    -1,
      12,    14,   234,    10,   232,    -1,    13,    14,   234,    10,
     232,    -1,    12,   234,    10,   232,    -1,    13,   234,    10,
     232,    -1,    12,   234,    70,   232,    -1,    13,   234,    70,
     232,    -1,    53,    -1,    54,    -1,    55,    -1,    56,    -1,
      57,    -1,    58,    -1,   109,    -1,   240,    -1,    -1,   228,
      -1,   228,    70,   229,    -1,   229,    -1,   233,    -1,   226,
     116,   235,   117,    -1,   231,    -1,   104,    -1,   100,    -1,
     108,    -1,   100,    -1,   108,    -1,   232,    -1,   234,    -1,
     226,    -1,   241,    -1,    -1,   236,   237,    -1,   239,    -1,
     237,   129,   239,    -1,    -1,   237,    70,   238,   239,    -1,
     234,    -1,   234,    72,   234,    -1,    72,   234,    -1,   234,
      72,    -1,    96,    -1,    97,    -1,    98,    -1,    99,    -1,
     101,    -1,   105,    -1,   106,    -1,   104,    -1,   107,    -1,
      98,    -1,   104,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   398,   398,   402,   404,   407,   409,   410,   411,   412,
     413,   414,   415,   416,   419,   420,   423,   431,   440,   448,
     455,   464,   463,   469,   468,   472,   474,   477,   479,   480,
     481,   482,   483,   486,   486,   491,   490,   501,   503,   508,
     511,   516,   515,   526,   528,   531,   549,   553,   556,   547,
     561,   563,   564,   568,   567,   573,   575,   579,   582,   585,
     590,   592,   593,   596,   598,   599,   600,   601,   613,   615,
     619,   621,   625,   618,   632,   630,   662,   664,   667,   669,
     673,   675,   678,   680,   683,   685,   686,   687,   688,   689,
     690,   691,   692,   695,   701,   703,   708,   710,   712,   716,
     723,   725,   728,   733,   735,   738,   740,   740,   744,   746,
     749,   751,   752,   756,   758,   761,   763,   768,   766,   772,
     777,   779,   781,   785,   791,   789,   798,   797,   806,   808,
     809,   813,   815,   826,   830,   833,   834,   835,   838,   840,
     843,   845,   848,   854,   859,   867,   875,   877,   878,   879,
     880,   880,   893,   897,   897,   899,   900,   900,   902,   906,
     907,   910,   912,   913,   914,   915,   918,   920,   921,   922,
     923,   924,   927,   938,   940,   941,   942,   943,   944,   945,
     946,   947,   948,   949,   950,   951,   953,   955,   957,   959,
     961,   963,   965,   967,   969,   971,   973,   975,   977,   979,
     981,   983,   985,   988,   990,   994,   996,   998,  1001,  1008,
    1007,  1016,  1017,  1018,  1019,  1023,  1023,  1028,  1031,  1033,
    1035,  1037,  1039,  1041,  1043,  1045,  1047,  1049,  1051,  1053,
    1057,  1065,  1066,  1067,  1072,  1073,  1074,  1077,  1078,  1083,
    1081,  1091,  1093,  1094,  1097,  1101,  1103,  1106,  1110,  1113,
    1115,  1118,  1121,  1123,  1125,  1127,  1129,  1131,  1133,  1137,
    1139,  1140,  1141,  1142,  1143,  1146,  1148,  1151,  1153,  1156,
    1158,  1161,  1163,  1170,  1172,  1175,  1177,  1180,  1182,  1185,
    1187,  1190,  1192,  1195,  1195,  1199,  1201,  1203,  1203,  1207,
    1213,  1216,  1217,  1220,  1222,  1223,  1224,  1225,  1228,  1230,
    1231,  1232,  1235,  1237
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
  "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV", "OBJECTV", 
  "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", 
  "RELOP_LTE", "GLOBAL", "GLOBALOP", "ADDR", "RESULT", "RETURN", "YIELDT", 
  "GET_RESULTS", "POW", "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", 
  "ESUB", "DOTDOT", "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB", 
  "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD", 
  "PCC_END_YIELD", "NCI_CALL", "METH_CALL", "INVOCANT", "MAIN", "LOAD", 
  "IMMEDIATE", "POSTCOMP", "METHOD", "ANON", "OUTER", "NEED_LEX", "MULTI", 
  "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", 
  "REG", "MACRO", "ENDM", "STRINGC", "INTC", "FLOATC", "USTRINGC", 
  "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", 
  "POINTY", "'='", "'['", "']'", "'('", "')'", "'!'", "'-'", "'~'", "'+'", 
  "'*'", "'/'", "'%'", "'&'", "'|'", "';'", "$accept", "program", 
  "compilation_units", "compilation_unit", "pragma", "pragma_1", 
  "hll_def", "global", "constdef", "@1", "pmc_const", "@2", "pasmcode", 
  "pasmline", "pasm_inst", "@3", "@4", "pasm_args", "emit", "@5", 
  "opt_pasmcode", "class_namespace", "sub", "@6", "@7", "@8", 
  "sub_params", "sub_param", "@9", "opt_comma", "multi", "outer", 
  "multi_types", "multi_type", "sub_body", "pcc_sub", "@10", "@11", "@12", 
  "pcc_sub_call", "@13", "opt_label", "opt_invocant", "sub_proto", 
  "sub_proto_list", "proto", "pcc_call", "pcc_args", "pcc_arg", 
  "pcc_results", "pcc_result", "@14", "paramtype_list", "paramtype", 
  "begin_ret_or_yield", "end_ret_or_yield", "pcc_ret", "@15", 
  "pcc_returns", "pcc_return", "pcc_return_many", "@16", "@17", 
  "var_returns", "statements", "helper_clear_state", "statement", 
  "labels", "_labels", "label", "instruction", "id_list", "labeled_inst", 
  "@18", "@19", "@20", "type", "classname", "assignment", "@21", 
  "get_results", "@22", "op_assign", "func_assign", "the_sub", "ptr", 
  "sub_call", "@23", "arglist", "arg", "argtype_list", "argtype", 
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
     208,   208,   208,   208,   208,   208,   208,   208,   208,   209,
     208,   208,   208,   208,   208,   211,   210,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     213,   214,   214,   214,   214,   214,   214,   215,   215,   217,
     216,   218,   218,   218,   219,   220,   220,   221,   222,   223,
     223,   224,   224,   224,   224,   224,   224,   224,   224,   225,
     225,   225,   225,   225,   225,   226,   226,   227,   227,   228,
     228,   229,   229,   230,   230,   231,   231,   232,   232,   233,
     233,   234,   234,   236,   235,   237,   237,   238,   237,   239,
     239,   239,   239,   240,   240,   240,   240,   240,   241,   241,
     241,   241,   242,   242
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
       5,     5,     5,     5,     6,     6,     6,     7,     4,     4,
       6,     7,     4,     4,     4,     4,     6,     7,     3,     0,
       9,     1,     1,     1,     3,     0,     5,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       4,     1,     1,     1,     3,     3,     3,     1,     1,     0,
       5,     0,     3,     1,     2,     0,     2,     1,     2,     3,
       1,     6,     6,     5,     5,     4,     4,     4,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     0,     1,     3,
       1,     1,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     0,     2,     1,     3,     0,     4,     1,
       3,     2,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,     0,     0,    46,    21,     0,    70,
      41,     0,     0,     2,     3,    12,     0,     7,     6,    10,
       5,     8,     9,     0,     0,     0,     0,   283,     0,     0,
     166,   167,   168,   169,   170,   172,     0,   171,     0,   138,
      11,     1,     4,    15,    16,    14,     0,     0,     0,     0,
     275,   274,   276,    47,   273,     0,    19,    71,    23,   142,
       0,    30,    29,    32,   138,    25,     0,    31,    33,   139,
     141,    17,    18,    45,     0,   293,   294,   295,   296,   297,
     300,   298,   299,   301,   265,   281,   289,   284,   285,   266,
     282,    80,     0,     0,    80,     0,    28,    26,    42,     0,
       0,    35,     0,     0,   140,   291,   292,   287,     0,    85,
      84,    86,    87,    89,    88,     0,    90,     0,    91,    92,
       0,    55,    82,     0,    20,     0,     0,    37,     0,    80,
      27,   267,   290,     0,   286,     0,    60,    48,    56,     0,
      22,    72,   277,   278,   279,     0,   280,     0,     0,    34,
     281,    40,   268,   270,   271,   288,     0,     0,    63,    64,
      66,    65,    67,     0,    62,    50,    83,    50,     0,    38,
      36,   283,     0,    59,    58,     0,    57,    51,   133,   133,
      24,     0,   269,    61,    53,     0,   137,   136,     0,     0,
     133,   138,   131,     0,   272,     0,   135,    52,    49,   132,
     165,   134,    73,     0,     0,     0,     0,     0,     0,     0,
       0,   150,     0,   153,   156,     0,     0,     0,   215,     0,
     113,   114,   231,   232,   267,   155,   163,     0,   164,   119,
       0,   146,     0,   211,   212,   213,   239,   162,   147,   233,
     108,   159,     0,     0,     0,     0,   161,     0,   148,   149,
       0,     0,     0,     0,   302,   303,     0,   124,   158,   233,
     126,     0,    74,   160,   117,   143,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   238,   237,     0,   283,     0,    54,     0,     0,   259,
     260,   261,   262,   263,   264,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   128,   128,     0,
     100,   120,   250,     0,   108,   241,   217,   218,   219,   220,
     223,   224,   225,   226,   222,   221,   227,   228,   229,   214,
       0,     0,     0,   300,   267,     0,     0,     0,   208,   281,
     173,     0,   235,   236,   234,   110,   111,   112,   109,     0,
     255,   257,     0,     0,   256,   258,     0,   205,   144,   151,
     152,     0,     0,   204,     0,   129,   245,     0,     0,    78,
       0,     0,     0,   248,     0,   243,   198,   199,   203,   202,
     230,   174,   175,   176,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   283,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   253,     0,   254,     0,     0,   283,     0,
       0,     0,     0,   125,   244,   127,   216,     0,     0,     0,
       0,   121,     0,   115,   116,   118,     0,   249,     0,     0,
     240,     0,   283,     0,   283,   182,   185,   186,   190,   180,
     187,   188,   189,   184,     0,   178,   193,   177,   179,   181,
     183,   191,   192,     0,   251,   252,   206,     0,   145,   154,
     157,   130,   247,   246,   102,     0,     0,     0,     0,    76,
     101,   245,   122,     0,   242,   196,     0,   200,     0,   194,
     195,   207,    79,     0,     0,     0,     0,   103,     0,   123,
     241,   197,   201,    94,     0,    95,    97,     0,    96,     0,
       0,    77,     0,     0,     0,     0,   106,     0,    75,     0,
     210,    93,    99,    98,     0,   108,   104,     0,   105,   107
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    12,    13,    14,    15,    24,    16,    17,    18,    29,
      63,    95,    64,    65,   102,   103,   129,   149,    19,    39,
      66,    20,    21,    28,    91,   165,   178,   188,   195,   139,
     118,   119,   163,   164,   189,    22,    38,    94,   167,   226,
     310,   487,   419,   120,   121,   122,   469,   369,   420,   500,
     509,   514,   286,   348,   227,   425,   228,   311,   370,   426,
     229,   307,   308,   364,   190,   191,   192,    68,    69,    70,
     201,   359,   230,   250,   252,   253,    36,    37,   231,   232,
     233,   261,   234,   235,   236,   285,   237,   267,   374,   365,
     414,   463,   312,   313,   238,   296,    85,   151,   152,   153,
      53,    54,   144,   154,   366,    48,    49,    87,   133,    88,
      89,    90,   256
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -312
static const short yypact[] =
{
      15,  -312,    37,   -82,   -71,    -5,  -312,  -312,   122,  -312,
    -312,    68,   114,    15,  -312,  -312,   116,  -312,  -312,  -312,
    -312,  -312,  -312,    17,   123,    75,    76,  -312,    78,   122,
    -312,  -312,  -312,  -312,  -312,  -312,    38,  -312,    55,     5,
    -312,  -312,  -312,  -312,  -312,  -312,    47,    60,    58,   204,
    -312,  -312,  -312,  -312,  -312,    87,    73,  -312,  -312,  -312,
     199,  -312,  -312,  -312,    66,  -312,   125,  -312,    32,   118,
    -312,  -312,  -312,  -312,   227,  -312,  -312,  -312,  -312,  -312,
    -312,  -312,  -312,  -312,  -312,  -312,   135,   -59,  -312,  -312,
    -312,   496,    94,   112,   496,   136,  -312,  -312,  -312,   227,
     148,  -312,   246,   153,  -312,  -312,   227,  -312,   204,  -312,
    -312,  -312,  -312,  -312,  -312,   138,  -312,   147,  -312,  -312,
     260,    12,  -312,   112,  -312,   262,   410,  -312,   205,   496,
    -312,   410,  -312,   204,  -312,    93,    19,  -312,  -312,   496,
    -312,  -312,  -312,  -312,  -312,   162,  -312,   187,   186,  -312,
     173,  -312,   220,  -312,  -312,  -312,   176,   177,  -312,  -312,
    -312,  -312,  -312,   -55,  -312,   293,  -312,   293,   200,  -312,
    -312,  -312,   410,  -312,  -312,    19,  -312,  -312,     2,     2,
    -312,   189,  -312,  -312,  -312,   303,  -312,  -312,   310,   241,
     -51,   118,  -312,   244,  -312,   122,  -312,  -312,  -312,  -312,
     373,  -312,  -312,   216,   -63,    27,    43,   227,   264,   217,
     218,  -312,   215,   224,  -312,   -49,   344,   212,  -312,   331,
    -312,  -312,  -312,  -312,   410,  -312,  -312,   333,  -312,  -312,
     334,  -312,   222,  -312,  -312,  -312,  -312,  -312,  -312,   461,
    -312,  -312,   227,   190,   227,   228,  -312,   280,  -312,  -312,
     122,   289,   122,   122,  -312,  -312,   251,  -312,  -312,    90,
    -312,   249,  -312,  -312,  -312,  -312,   264,   252,   227,   227,
     227,   227,   227,   227,   227,   227,   227,   227,   227,   227,
     227,  -312,  -312,   308,  -312,   438,   178,   361,   -63,  -312,
    -312,  -312,  -312,  -312,  -312,   -63,   227,   362,   -63,   -63,
     227,   227,   274,   264,   276,   277,   227,   227,   227,   264,
    -312,  -312,  -312,   -44,  -312,   227,  -312,  -312,  -312,  -312,
    -312,  -312,  -312,  -312,  -312,  -312,  -312,  -312,  -312,  -312,
     424,   -49,   281,   266,   410,   227,   227,   227,  -312,   137,
     146,   263,  -312,  -312,  -312,  -312,  -312,  -312,  -312,   -63,
    -312,  -312,   372,   -63,  -312,  -312,   379,   -40,  -312,   321,
    -312,   282,   287,  -312,   -30,  -312,  -312,   -23,   -22,    -2,
      80,   264,   296,   178,    -9,  -312,   -31,    51,  -312,  -312,
    -312,  -312,  -312,  -312,   227,   227,   227,   227,   227,   227,
     227,   227,   227,  -312,   227,   227,   227,   227,   227,   227,
     227,   227,   304,  -312,   -63,  -312,   -63,   227,  -312,   295,
     112,   112,   227,  -312,   381,  -312,  -312,   227,   227,   108,
     414,  -312,   227,  -312,  -312,  -312,   416,  -312,   452,   227,
    -312,   227,  -312,   227,  -312,  -312,  -312,  -312,  -312,  -312,
    -312,  -312,  -312,  -312,   305,  -312,  -312,  -312,  -312,  -312,
    -312,  -312,  -312,   227,  -312,  -312,  -312,   309,  -312,  -312,
    -312,  -312,  -312,  -312,  -312,   417,   227,   227,   470,   118,
    -312,  -312,  -312,   307,  -312,  -312,   314,  -312,   315,  -312,
    -312,  -312,  -312,     8,   423,    10,    24,  -312,   430,   381,
     227,  -312,  -312,  -312,   227,  -312,  -312,   227,  -312,   227,
     -12,  -312,    65,   431,   435,   443,  -312,   264,  -312,   445,
    -312,  -312,  -312,  -312,   122,  -312,  -312,   355,   178,  -312
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -312,  -312,  -312,   444,  -312,  -312,  -312,  -312,  -312,  -312,
     258,  -312,  -312,   395,  -312,  -312,  -312,   126,  -312,  -312,
    -312,   -10,  -312,  -312,  -312,  -312,   294,  -312,  -312,  -312,
    -312,  -312,  -312,   288,   285,  -312,  -312,  -312,  -312,  -312,
    -312,  -312,  -312,   -76,  -312,   326,  -312,  -312,  -312,  -312,
    -312,  -312,  -309,  -312,  -312,  -312,  -312,  -312,  -312,  -312,
    -312,  -312,  -312,   158,  -312,  -312,   278,   284,  -312,   -68,
    -312,  -312,  -312,  -312,  -312,  -312,   -29,   149,  -312,  -312,
    -312,  -312,  -312,  -312,    39,  -312,  -206,  -312,   -14,  -311,
       7,  -312,   109,   174,  -312,   239,  -129,   265,  -312,   316,
    -312,   201,  -196,   364,   -43,  -154,  -312,  -312,  -312,   -81,
    -312,   -90,   156
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -234
static const short yytable[] =
{
      55,   104,   150,   124,   375,   373,    86,   184,   241,   417,
     258,   107,   493,   506,   496,   175,   -81,   181,   125,     1,
     -69,     2,    25,     3,     4,     5,   371,   134,   498,    67,
     407,   105,    58,   140,    26,     5,   -39,   142,     6,   431,
     412,   242,     7,   150,    23,   143,    99,   412,   371,   254,
     507,   185,   155,   148,    67,   255,   127,   244,   100,   186,
     187,   429,   508,   132,   176,    86,   158,   159,   160,   161,
     108,   239,    40,   -68,     8,   372,   408,   338,   494,   247,
     497,   418,   138,   146,   421,   432,     5,   259,   146,   413,
      86,     9,   350,    58,   499,   150,   415,   416,    59,   351,
     -43,   461,   354,   355,   185,   -81,   464,    60,   101,    10,
     430,    27,   186,   187,    41,    61,    62,    11,   474,   162,
      43,   433,    44,    75,    76,    77,    78,    45,    79,   146,
     341,    80,    81,    82,    83,   429,    84,   314,    56,    75,
      76,    77,    78,   422,    79,    46,    47,    80,    81,    82,
      83,    71,    84,   403,   339,    57,   343,   405,   423,    59,
     424,   -44,   243,   245,   246,    72,   203,   434,    60,    30,
      31,    32,    33,    34,   360,    73,    61,    62,    50,   375,
     314,   146,    51,   466,   510,   384,    52,    92,    93,   467,
     468,   385,   386,   156,   345,   346,   347,   157,   387,   287,
     288,   297,   281,    96,   282,   150,   518,   106,   454,   123,
     455,    59,   388,   389,   390,   391,    80,    81,    82,    83,
      98,   302,    35,   304,   305,   316,   317,   318,   319,   320,
     321,   322,   323,   324,   325,   326,   327,   328,   298,   444,
     340,   126,   314,   289,   290,   291,   292,   293,   294,   281,
     130,   282,   128,   352,   457,  -233,   135,   356,   357,   392,
     295,   131,   393,   363,   137,   136,   141,   394,   395,   396,
     397,   398,   399,   400,   401,   147,    74,   168,   476,   170,
     478,   289,   290,   291,   292,   293,   294,   377,   169,   171,
     172,   146,   381,   382,   383,   173,   174,   177,   299,   259,
      75,    76,    77,    78,   180,    79,   194,   196,    80,    81,
      82,    83,   198,    84,   197,   202,   240,   248,   249,   251,
     459,   460,   329,    75,    76,    77,    78,   330,    79,   -23,
     260,    80,    81,    82,    83,   262,    84,   264,   265,   486,
     266,   435,   436,   437,   438,   439,   440,   441,   442,   443,
     301,   445,   446,   447,   448,   449,   450,   451,   452,   303,
      75,    76,    77,    78,   456,    79,   306,   309,   331,   332,
     315,   349,   353,    84,   358,   465,   361,   362,   515,   471,
     402,   379,   404,   204,  -232,   205,   206,   207,   475,   406,
     477,   409,   208,   209,   210,   458,   462,   410,   211,   212,
     213,   488,   411,   214,    75,    76,    77,    78,   222,    79,
     480,   428,   333,    81,    82,    83,   334,    84,   470,   453,
     472,   482,   479,   483,   484,   490,   481,   495,   335,   336,
     337,   491,   492,   215,   501,   511,   216,   217,   218,   512,
      75,    76,    77,    78,   222,    79,   219,   513,   223,   516,
     220,   503,   221,    84,   504,   519,   505,    42,   225,    97,
     380,   179,   257,   183,   193,   166,   367,   473,   199,    75,
      76,    77,    78,   222,    79,   200,   502,   223,   489,   376,
     427,   224,    84,   368,   300,   517,   344,   378,   182,   263,
     145,  -209,   268,   269,   270,   271,   272,   273,   274,   275,
       0,   276,   277,   278,   279,   280,    75,    76,    77,    78,
     142,    79,     0,     0,    80,    81,    82,    83,   143,    84,
      75,    76,    77,    78,    35,    79,     0,     0,    80,    81,
      82,    83,     0,    84,    75,    76,    77,    78,    50,    79,
       0,     0,   342,     0,     0,     0,    52,    84,    75,    76,
      77,    78,   222,    79,     0,     0,   223,     0,     0,     0,
       0,    84,     0,     0,     0,     0,    75,    76,    77,    78,
       0,    79,     0,   281,   485,   282,   283,   284,     0,    84,
     109,   110,   111,   112,   113,   114,   115,   116,   117
};

static const short yycheck[] =
{
      29,    69,   131,    93,   315,   314,    49,     5,   204,    11,
     216,    70,     4,    25,     4,    70,     4,   171,    94,     4,
      71,     6,   104,     8,     9,    20,    70,   108,     4,    39,
      70,    74,    27,   123,   105,    20,     4,   100,    23,    70,
      70,    14,    27,   172,     7,   108,    14,    70,    70,    98,
      62,   102,   133,   129,    64,   104,    99,    14,    26,   110,
     111,    70,    74,   106,   119,   108,    47,    48,    49,    50,
     129,   200,     4,    71,    59,   119,   116,   283,    70,   208,
      70,    83,    70,   126,     4,   116,    20,   216,   131,   119,
     133,    76,   288,    27,    70,   224,   119,   119,    93,   295,
      95,   412,   298,   299,   102,    93,   417,   102,    76,    94,
     119,   116,   110,   111,     0,   110,   111,   102,   429,   100,
       4,    70,   105,    96,    97,    98,    99,     4,   101,   172,
     284,   104,   105,   106,   107,    70,   109,   266,   100,    96,
      97,    98,    99,    63,   101,    70,    70,   104,   105,   106,
     107,   104,   109,   349,   283,   100,   285,   353,    78,    93,
      80,    95,   205,   206,   207,   105,   195,   116,   102,    47,
      48,    49,    50,    51,   303,   117,   110,   111,   100,   490,
     309,   224,   104,    75,   119,    39,   108,   100,   115,    81,
      82,    45,    46,   100,    16,    17,    18,   104,    52,   242,
      10,   244,   112,     4,   114,   334,   515,    72,   404,   115,
     406,    93,    66,    67,    68,    69,   104,   105,   106,   107,
      95,   250,   100,   252,   253,   268,   269,   270,   271,   272,
     273,   274,   275,   276,   277,   278,   279,   280,    10,   393,
     283,   105,   371,    53,    54,    55,    56,    57,    58,   112,
       4,   114,   104,   296,   408,   118,   118,   300,   301,   113,
      70,   108,   116,   306,     4,   118,     4,   121,   122,   123,
     124,   125,   126,   127,   128,    70,    72,   115,   432,    93,
     434,    53,    54,    55,    56,    57,    58,   330,   101,   116,
      70,   334,   335,   336,   337,   119,   119,     4,    70,   428,
      96,    97,    98,    99,   104,   101,   117,     4,   104,   105,
     106,   107,    71,   109,     4,    71,   100,   100,   100,   104,
     410,   411,    14,    96,    97,    98,    99,    19,   101,   105,
     118,   104,   105,   106,   107,     4,   109,     4,     4,   468,
     118,   384,   385,   386,   387,   388,   389,   390,   391,   392,
      70,   394,   395,   396,   397,   398,   399,   400,   401,    70,
      96,    97,    98,    99,   407,   101,   115,   118,    60,    61,
     118,    10,    10,   109,   100,   418,   100,   100,   507,   422,
     117,   100,    10,    10,   118,    12,    13,    14,   431,    10,
     433,    70,    19,    20,    21,   100,    15,   115,    25,    26,
      27,   469,   115,    30,    96,    97,    98,    99,   100,   101,
     453,   115,   104,   105,   106,   107,   108,   109,     4,   115,
       4,     4,   117,   466,   467,   118,   117,     4,   120,   121,
     122,   117,   117,    60,     4,     4,    63,    64,    65,     4,
      96,    97,    98,    99,   100,   101,    73,     4,   104,     4,
      77,   494,    79,   109,   497,   100,   499,    13,   200,    64,
     334,   167,   118,   175,   179,   139,   308,   428,   190,    96,
      97,    98,    99,   100,   101,   191,   490,   104,   471,   330,
     371,   108,   109,   309,   245,   514,   285,   331,   172,   224,
     126,   118,    31,    32,    33,    34,    35,    36,    37,    38,
      -1,    40,    41,    42,    43,    44,    96,    97,    98,    99,
     100,   101,    -1,    -1,   104,   105,   106,   107,   108,   109,
      96,    97,    98,    99,   100,   101,    -1,    -1,   104,   105,
     106,   107,    -1,   109,    96,    97,    98,    99,   100,   101,
      -1,    -1,   104,    -1,    -1,    -1,   108,   109,    96,    97,
      98,    99,   100,   101,    -1,    -1,   104,    -1,    -1,    -1,
      -1,   109,    -1,    -1,    -1,    -1,    96,    97,    98,    99,
      -1,   101,    -1,   112,   104,   114,   115,   116,    -1,   109,
      84,    85,    86,    87,    88,    89,    90,    91,    92
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
     147,   234,   234,   234,    39,    45,    46,    52,    66,    67,
      68,    69,   113,   116,   121,   122,   123,   124,   125,   126,
     127,   128,   117,   232,    10,   232,    10,    70,   116,    70,
     115,   115,    70,   119,   220,   119,   119,    11,    83,   172,
     178,     4,    63,    78,    80,   185,   189,   222,   115,    70,
     119,    70,   116,    70,   116,   234,   234,   234,   234,   234,
     234,   234,   234,   234,   235,   234,   234,   234,   234,   234,
     234,   234,   234,   115,   232,   232,   234,   235,   100,   241,
     241,   219,    15,   221,   219,   234,    75,    81,    82,   176,
       4,   234,     4,   214,   219,   234,   235,   234,   235,   117,
     234,   117,     4,   234,   234,   104,   226,   171,   199,   220,
     118,   117,   117,     4,    70,     4,     4,    70,     4,    70,
     179,     4,   218,   234,   234,   234,    25,    62,    74,   180,
     119,     4,     4,     4,   181,   226,     4,   206,   182,   100
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
#define YYEMPTY		-2
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
      yychar1 = YYTRANSLATE (yychar);				\
      YYPOPSTACK;						\
      goto yybackup;						\
    }								\
  else								\
    { 								\
      yyerror ("syntax error: cannot back up");			\
      YYERROR;							\
    }								\
while (0)

#define YYTERROR	1
#define YYERRCODE	256

/* YYLLOC_DEFAULT -- Compute the default location (before the actions
   are run).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)           \
  Current.first_line   = Rhs[1].first_line;      \
  Current.first_column = Rhs[1].first_column;    \
  Current.last_line    = Rhs[N].last_line;       \
  Current.last_column  = Rhs[N].last_column;
#endif

/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX	yylex (&yylval, YYLEX_PARAM)
#else
# define YYLEX	yylex (&yylval)
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
/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YYDSYMPRINT(Args)
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
/*-----------------------------.
| Print this symbol on YYOUT.  |
`-----------------------------*/

static void
#if defined (__STDC__) || defined (__cplusplus)
yysymprint (FILE* yyout, int yytype, YYSTYPE yyvalue)
#else
yysymprint (yyout, yytype, yyvalue)
    FILE* yyout;
    int yytype;
    YYSTYPE yyvalue;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvalue;

  if (yytype < YYNTOKENS)
    {
      YYFPRINTF (yyout, "token %s (", yytname[yytype]);
# ifdef YYPRINT
      YYPRINT (yyout, yytoknum[yytype], yyvalue);
# endif
    }
  else
    YYFPRINTF (yyout, "nterm %s (", yytname[yytype]);

  switch (yytype)
    {
      default:
        break;
    }
  YYFPRINTF (yyout, ")");
}
#endif /* YYDEBUG. */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
#if defined (__STDC__) || defined (__cplusplus)
yydestruct (int yytype, YYSTYPE yyvalue)
#else
yydestruct (yytype, yyvalue)
    int yytype;
    YYSTYPE yyvalue;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvalue;

  switch (yytype)
    {
      default:
        break;
    }
}



/* The user can define YYPARSE_PARAM as the name of an argument to be passed
   into yyparse.  The argument should have type void *.
   It should actually point to an object.
   Grammar actions can access the variable by casting it
   to the proper pointer type.  */

#ifdef YYPARSE_PARAM
# if defined (__STDC__) || defined (__cplusplus)
#  define YYPARSE_PARAM_ARG void *YYPARSE_PARAM
#  define YYPARSE_PARAM_DECL
# else
#  define YYPARSE_PARAM_ARG YYPARSE_PARAM
#  define YYPARSE_PARAM_DECL void *YYPARSE_PARAM;
# endif
#else /* !YYPARSE_PARAM */
# define YYPARSE_PARAM_ARG
# define YYPARSE_PARAM_DECL
#endif /* !YYPARSE_PARAM */

/* Prevent warning if -Wstrict-prototypes.  */
#ifdef __GNUC__
# ifdef YYPARSE_PARAM
int yyparse (void *);
# else
int yyparse (void);
# endif
#endif




int
yyparse (YYPARSE_PARAM_ARG)
     YYPARSE_PARAM_DECL
{
  /* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of parse errors so far.  */
int yynerrs;

  register int yystate;
  register int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Lookahead token as an internal (translated) token number.  */
  int yychar1 = 0;

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

  if (yyssp >= yyss + yystacksize - 1)
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
      if (yystacksize >= YYMAXDEPTH)
	goto yyoverflowlab;
      yystacksize *= 2;
      if (yystacksize > YYMAXDEPTH)
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

      if (yyssp >= yyss + yystacksize - 1)
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

  /* yychar is either YYEMPTY or YYEOF
     or a valid token in external form.  */

  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  /* Convert token to internal form (in yychar1) for indexing tables with.  */

  if (yychar <= 0)		/* This means end of input.  */
    {
      yychar1 = 0;
      yychar = YYEOF;		/* Don't call YYLEX any more.  */

      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yychar1 = YYTRANSLATE (yychar);

      /* We have to keep this `#if YYDEBUG', since we use variables
	 which are defined only if `YYDEBUG' is set.  */
      YYDPRINTF ((stderr, "Next token is "));
      YYDSYMPRINT ((stderr, yychar1, yylval));
      YYDPRINTF ((stderr, "\n"));
    }

  /* If the proper action on seeing token YYCHAR1 is to reduce or to
     detect an error, take that action.  */
  yyn += yychar1;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yychar1)
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
  YYDPRINTF ((stderr, "Shifting token %d (%s), ",
	      yychar, yytname[yychar1]));

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



#if YYDEBUG
  /* We have to keep this `#if YYDEBUG', since we use variables which
     are defined only if `YYDEBUG' is set.  */
  if (yydebug)
    {
      int yyi;

      YYFPRINTF (stderr, "Reducing via rule %d (line %d), ",
		 yyn - 1, yyrline[yyn]);

      /* Print the symbols being reduced, and their result.  */
      for (yyi = yyprhs[yyn]; yyrhs[yyi] >= 0; yyi++)
	YYFPRINTF (stderr, "%s ", yytname[yyrhs[yyi]]);
      YYFPRINTF (stderr, " -> %s\n", yytname[yyr1[yyn]]);
    }
#endif
  switch (yyn)
    {
        case 2:
#line 399 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 408 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 6:
#line 409 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 410 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 411 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 412 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 413 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 414 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 12:
#line 415 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 416 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 419 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 420 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 424 "imcc/imcc.y"
    { if (yyvsp[0].s)
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 17:
#line 432 "imcc/imcc.y"
    {
            STRING *hll_name, *hll_lib;
            hll_name = string_unescape_cstring(interp, yyvsp[-2].s + 1, '"', NULL);
            hll_lib =  string_unescape_cstring(interp, yyvsp[0].s + 1, '"', NULL);
            IMCC_INFO(interp)->HLL_id =
                Parrot_register_HLL(interp, hll_name, hll_lib);
            yyval.t = 0;
         }
    break;

  case 18:
#line 441 "imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                IMCC_INFO(interp)->HLL_id, atoi(yyvsp[-2].s), atoi(yyvsp[0].s));
             yyval.t = 0;
         }
    break;

  case 19:
#line 450 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 20:
#line 456 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 21:
#line 464 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 22:
#line 465 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 23:
#line 469 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 24:
#line 470 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 27:
#line 478 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 28:
#line 479 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 29:
#line 480 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 30:
#line 481 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 31:
#line 482 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 33:
#line 486 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 34:
#line 488 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 35:
#line 491 "imcc/imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                    }
    break;

  case 36:
#line 496 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, yyvsp[0].s));
                     cur_call->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 37:
#line 502 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 38:
#line 504 "imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, yyvsp[0].s);
                       set_lexical(interp, r, yyvsp[-2].s); yyval.i = 0;
                   }
    break;

  case 39:
#line 508 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 41:
#line 516 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 42:
#line 518 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 45:
#line 533 "imcc/imcc.y"
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
#line 549 "imcc/imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 47:
#line 553 "imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, yyvsp[0].sr);
        }
    break;

  case 48:
#line 556 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 49:
#line 558 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 50:
#line 562 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 51:
#line 563 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 52:
#line 564 "imcc/imcc.y"
    { add_pcc_param(cur_call, yyvsp[-1].sr);}
    break;

  case 53:
#line 568 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 54:
#line 569 "imcc/imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-2].t);
                                         is_def=0; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 55:
#line 574 "imcc/imcc.y"
    { yyval.t = 0;  }
    break;

  case 57:
#line 579 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 58:
#line 583 "imcc/imcc.y"
    { yyval.t = 0; cur_unit->outer =
                     mk_sub_address_fromc(interp, yyvsp[-1].s); }
    break;

  case 59:
#line 586 "imcc/imcc.y"
    { yyval.t = 0; cur_unit->outer =
                     mk_const(interp, yyvsp[-1].s, 'S'); }
    break;

  case 60:
#line 591 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 61:
#line 592 "imcc/imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); }
    break;

  case 62:
#line 593 "imcc/imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);}
    break;

  case 63:
#line 597 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 64:
#line 598 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 65:
#line 599 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 66:
#line 600 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 67:
#line 601 "imcc/imcc.y"
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
#line 619 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 71:
#line 621 "imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, yyvsp[0].s));

         }
    break;

  case 72:
#line 625 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 73:
#line 627 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 74:
#line 632 "imcc/imcc.y"
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
             * sub call; the sub is in r0 of the first ins
             */
            r1 = cur_unit->instructions->r[0];
            if (r1 && r1->pcc_sub)
                r1->pcc_sub->calls_a_sub |= 1;
         }
    break;

  case 75:
#line 659 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 76:
#line 663 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 77:
#line 664 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 78:
#line 668 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 79:
#line 670 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 80:
#line 674 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 82:
#line 679 "imcc/imcc.y"
    { yyval.t = yyvsp[0].t; }
    break;

  case 83:
#line 680 "imcc/imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; }
    break;

  case 84:
#line 684 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 85:
#line 685 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 86:
#line 686 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 87:
#line 687 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 88:
#line 688 "imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 89:
#line 689 "imcc/imcc.y"
    {  yyval.t = P_METHOD; }
    break;

  case 90:
#line 690 "imcc/imcc.y"
    {  yyval.t = P_NEED_LEX; }
    break;

  case 93:
#line 697 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 94:
#line 702 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 95:
#line 704 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-1].sr);
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 96:
#line 709 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 97:
#line 711 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 98:
#line 713 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 99:
#line 717 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 100:
#line 724 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 101:
#line 725 "imcc/imcc.y"
    {  add_pcc_arg(cur_call, yyvsp[-1].sr); }
    break;

  case 102:
#line 729 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 103:
#line 734 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 104:
#line 735 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(cur_call, yyvsp[-1].sr); }
    break;

  case 105:
#line 739 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 106:
#line 740 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 107:
#line 741 "imcc/imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 108:
#line 745 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 109:
#line 746 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 110:
#line 750 "imcc/imcc.y"
    {  yyval.t = VT_FLAT;   }
    break;

  case 111:
#line 751 "imcc/imcc.y"
    {  yyval.t = VT_OPTIONAL; }
    break;

  case 112:
#line 752 "imcc/imcc.y"
    {  yyval.t = VT_OPT_FLAG; }
    break;

  case 113:
#line 757 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 114:
#line 758 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 117:
#line 768 "imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 118:
#line 771 "imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 119:
#line 772 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 120:
#line 778 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 121:
#line 780 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 122:
#line 782 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 123:
#line 786 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 124:
#line 791 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 125:
#line 796 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 126:
#line 798 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 127:
#line 803 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 128:
#line 807 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 129:
#line 808 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 130:
#line 809 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 133:
#line 827 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 134:
#line 832 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 135:
#line 833 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 136:
#line 834 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 137:
#line 835 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 138:
#line 839 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 142:
#line 849 "imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 143:
#line 856 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 144:
#line 860 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 145:
#line 868 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 148:
#line 878 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 149:
#line 879 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 150:
#line 880 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 151:
#line 881 "imcc/imcc.y"
    {
        IdList* l = yyvsp[0].idlist;
         while(l) {
             IdList* l1;
             mk_ident(interp, l->id, yyvsp[-1].t);
             l1 = l;
             l = l->next;
             free(l1);
     }
    is_def=0; yyval.i=0;

   }
    break;

  case 152:
#line 894 "imcc/imcc.y"
    {
                       set_lexical(interp, yyvsp[0].sr, yyvsp[-2].s); yyval.i = 0;
                    }
    break;

  case 153:
#line 897 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 154:
#line 898 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 156:
#line 900 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 157:
#line 901 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 158:
#line 902 "imcc/imcc.y"
    { yyval.i = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 159:
#line 906 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 160:
#line 908 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 161:
#line 911 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 162:
#line 912 "imcc/imcc.y"
    {  yyval.i = 0; cur_call = NULL; }
    break;

  case 163:
#line 913 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 165:
#line 915 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 166:
#line 919 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 167:
#line 920 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 168:
#line 921 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 169:
#line 922 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 170:
#line 923 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 171:
#line 924 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 172:
#line 929 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 173:
#line 939 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 174:
#line 940 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 175:
#line 941 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 176:
#line 942 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 177:
#line 943 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 178:
#line 944 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 179:
#line 945 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 180:
#line 946 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 181:
#line 947 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 182:
#line 948 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 183:
#line 949 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 950 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 185:
#line 952 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 954 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 187:
#line 956 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 958 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 189:
#line 960 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 962 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 191:
#line 964 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 966 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 193:
#line 968 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 970 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 195:
#line 972 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 974 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 197:
#line 976 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 198:
#line 978 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 199:
#line 980 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 982 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 984 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 202:
#line 986 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 203:
#line 989 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 204:
#line 991 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 205:
#line 995 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 997 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 999 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 208:
#line 1002 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            cur_call = NULL;
            yyval.i = 0;
         }
    break;

  case 209:
#line 1008 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 210:
#line 1012 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           cur_call = NULL;
         }
    break;

  case 214:
#line 1020 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[-2].sr); }
    break;

  case 215:
#line 1023 "imcc/imcc.y"
    { yyval.i = IMCC_create_itcall_label(interp);
                           yyval.i->type &= ~ITCALL; yyval.i->type |= ITRESULT; }
    break;

  case 216:
#line 1025 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 217:
#line 1030 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 218:
#line 1032 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1034 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 220:
#line 1036 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 221:
#line 1038 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 222:
#line 1040 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 223:
#line 1042 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 1044 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 1046 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 226:
#line 1048 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 227:
#line 1050 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 228:
#line 1052 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 229:
#line 1054 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 230:
#line 1059 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 231:
#line 1065 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 232:
#line 1066 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 233:
#line 1067 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 234:
#line 1072 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 235:
#line 1073 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 236:
#line 1074 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 237:
#line 1077 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 238:
#line 1078 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 239:
#line 1083 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 240:
#line 1088 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 241:
#line 1092 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 242:
#line 1093 "imcc/imcc.y"
    {  yyval.sr = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 243:
#line 1094 "imcc/imcc.y"
    {  yyval.sr = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 244:
#line 1098 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 245:
#line 1102 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 246:
#line 1103 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 247:
#line 1107 "imcc/imcc.y"
    {  yyval.t = VT_FLAT; }
    break;

  case 248:
#line 1110 "imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 249:
#line 1114 "imcc/imcc.y"
    { yyval.sr = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 250:
#line 1115 "imcc/imcc.y"
    { yyval.sr = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 251:
#line 1120 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 252:
#line 1122 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 253:
#line 1124 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 254:
#line 1126 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 255:
#line 1128 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 256:
#line 1130 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 257:
#line 1132 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 258:
#line 1134 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 259:
#line 1138 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 260:
#line 1139 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 261:
#line 1140 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 262:
#line 1141 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 263:
#line 1142 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 264:
#line 1143 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 267:
#line 1152 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 268:
#line 1153 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 269:
#line 1157 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 271:
#line 1162 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 272:
#line 1164 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 274:
#line 1172 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 275:
#line 1176 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 276:
#line 1177 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 277:
#line 1181 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 278:
#line 1182 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 283:
#line 1195 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 284:
#line 1196 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 285:
#line 1200 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 286:
#line 1202 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 287:
#line 1203 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 288:
#line 1204 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 289:
#line 1208 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 290:
#line 1214 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 291:
#line 1216 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 292:
#line 1217 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 293:
#line 1221 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 294:
#line 1222 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 295:
#line 1223 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 296:
#line 1224 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 297:
#line 1225 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 298:
#line 1229 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 299:
#line 1230 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 300:
#line 1231 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 301:
#line 1232 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 302:
#line 1236 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 303:
#line 1237 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3521 "imcc/imcparser.c"

  yyvsp -= yylen;
  yyssp -= yylen;


#if YYDEBUG
  if (yydebug)
    {
      short *yyssp1 = yyss - 1;
      YYFPRINTF (stderr, "state stack now");
      while (yyssp1 != yyssp)
	YYFPRINTF (stderr, " %d", *++yyssp1);
      YYFPRINTF (stderr, "\n");
    }
#endif

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
	  yysize += yystrlen ("parse error, unexpected ") + 1;
	  yysize += yystrlen (yytname[yytype]);
	  yymsg = (char *) YYSTACK_ALLOC (yysize);
	  if (yymsg != 0)
	    {
	      char *yyp = yystpcpy (yymsg, "parse error, unexpected ");
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
	      yyerror (yymsg);
	      YYSTACK_FREE (yymsg);
	    }
	  else
	    yyerror ("parse error; also virtual memory exhausted");
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror ("parse error");
    }
  goto yyerrlab1;


/*----------------------------------------------------.
| yyerrlab1 -- error raised explicitly by an action.  |
`----------------------------------------------------*/
yyerrlab1:
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
	  while (yyssp > yyss)
	    {
	      YYDPRINTF ((stderr, "Error: popping "));
	      YYDSYMPRINT ((stderr,
			    yystos[*yyssp],
			    *yyvsp));
	      YYDPRINTF ((stderr, "\n"));
	      yydestruct (yystos[*yyssp], *yyvsp);
	      YYPOPSTACK;
	    }
	  YYABORT;
        }

      YYDPRINTF ((stderr, "Discarding token %d (%s).\n",
		  yychar, yytname[yychar1]));
      yydestruct (yychar1, yylval);
      yychar = YYEMPTY;
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */

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

      YYDPRINTF ((stderr, "Error: popping "));
      YYDSYMPRINT ((stderr,
		    yystos[*yyssp], *yyvsp));
      YYDPRINTF ((stderr, "\n"));

      yydestruct (yystos[yystate], *yyvsp);
      yyvsp--;
      yystate = *--yyssp;


#if YYDEBUG
      if (yydebug)
	{
	  short *yyssp1 = yyss - 1;
	  YYFPRINTF (stderr, "Error: state stack now");
	  while (yyssp1 != yyssp)
	    YYFPRINTF (stderr, " %d", *++yyssp1);
	  YYFPRINTF (stderr, "\n");
	}
#endif
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


#line 1242 "imcc/imcc.y"



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

