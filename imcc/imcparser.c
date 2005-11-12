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
     GOTO = 263,
     ARG = 264,
     IF = 265,
     UNLESS = 266,
     PNULL = 267,
     ADV_FLAT = 268,
     ADV_SLURPY = 269,
     ADV_OPTIONAL = 270,
     ADV_OPT_FLAG = 271,
     NEW = 272,
     NAMESPACE = 273,
     ENDNAMESPACE = 274,
     DOT_METHOD = 275,
     SUB = 276,
     SYM = 277,
     LOCAL = 278,
     LEXICAL = 279,
     CONST = 280,
     INC = 281,
     DEC = 282,
     GLOBAL_CONST = 283,
     PLUS_ASSIGN = 284,
     MINUS_ASSIGN = 285,
     MUL_ASSIGN = 286,
     DIV_ASSIGN = 287,
     CONCAT_ASSIGN = 288,
     BAND_ASSIGN = 289,
     BOR_ASSIGN = 290,
     BXOR_ASSIGN = 291,
     FDIV = 292,
     FDIV_ASSIGN = 293,
     MOD_ASSIGN = 294,
     SHR_ASSIGN = 295,
     SHL_ASSIGN = 296,
     SHR_U_ASSIGN = 297,
     SHIFT_LEFT = 298,
     SHIFT_RIGHT = 299,
     INTV = 300,
     FLOATV = 301,
     STRINGV = 302,
     PMCV = 303,
     OBJECTV = 304,
     LOG_XOR = 305,
     RELOP_EQ = 306,
     RELOP_NE = 307,
     RELOP_GT = 308,
     RELOP_GTE = 309,
     RELOP_LT = 310,
     RELOP_LTE = 311,
     GLOBAL = 312,
     GLOBALOP = 313,
     ADDR = 314,
     RESULT = 315,
     RETURN = 316,
     YIELDT = 317,
     POW = 318,
     SHIFT_RIGHT_U = 319,
     LOG_AND = 320,
     LOG_OR = 321,
     COMMA = 322,
     ESUB = 323,
     DOTDOT = 324,
     PCC_BEGIN = 325,
     PCC_END = 326,
     PCC_CALL = 327,
     PCC_SUB = 328,
     PCC_BEGIN_RETURN = 329,
     PCC_END_RETURN = 330,
     PCC_BEGIN_YIELD = 331,
     PCC_END_YIELD = 332,
     NCI_CALL = 333,
     METH_CALL = 334,
     INVOCANT = 335,
     MAIN = 336,
     LOAD = 337,
     IMMEDIATE = 338,
     POSTCOMP = 339,
     METHOD = 340,
     ANON = 341,
     OUTER = 342,
     MULTI = 343,
     LABEL = 344,
     EMIT = 345,
     EOM = 346,
     IREG = 347,
     NREG = 348,
     SREG = 349,
     PREG = 350,
     IDENTIFIER = 351,
     REG = 352,
     MACRO = 353,
     ENDM = 354,
     STRINGC = 355,
     INTC = 356,
     FLOATC = 357,
     USTRINGC = 358,
     PARROT_OP = 359,
     VAR = 360,
     LINECOMMENT = 361,
     FILECOMMENT = 362,
     DOT = 363,
     CONCAT = 364,
     POINTY = 365
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define N_OPERATORS 261
#define HLL 262
#define GOTO 263
#define ARG 264
#define IF 265
#define UNLESS 266
#define PNULL 267
#define ADV_FLAT 268
#define ADV_SLURPY 269
#define ADV_OPTIONAL 270
#define ADV_OPT_FLAG 271
#define NEW 272
#define NAMESPACE 273
#define ENDNAMESPACE 274
#define DOT_METHOD 275
#define SUB 276
#define SYM 277
#define LOCAL 278
#define LEXICAL 279
#define CONST 280
#define INC 281
#define DEC 282
#define GLOBAL_CONST 283
#define PLUS_ASSIGN 284
#define MINUS_ASSIGN 285
#define MUL_ASSIGN 286
#define DIV_ASSIGN 287
#define CONCAT_ASSIGN 288
#define BAND_ASSIGN 289
#define BOR_ASSIGN 290
#define BXOR_ASSIGN 291
#define FDIV 292
#define FDIV_ASSIGN 293
#define MOD_ASSIGN 294
#define SHR_ASSIGN 295
#define SHL_ASSIGN 296
#define SHR_U_ASSIGN 297
#define SHIFT_LEFT 298
#define SHIFT_RIGHT 299
#define INTV 300
#define FLOATV 301
#define STRINGV 302
#define PMCV 303
#define OBJECTV 304
#define LOG_XOR 305
#define RELOP_EQ 306
#define RELOP_NE 307
#define RELOP_GT 308
#define RELOP_GTE 309
#define RELOP_LT 310
#define RELOP_LTE 311
#define GLOBAL 312
#define GLOBALOP 313
#define ADDR 314
#define RESULT 315
#define RETURN 316
#define YIELDT 317
#define POW 318
#define SHIFT_RIGHT_U 319
#define LOG_AND 320
#define LOG_OR 321
#define COMMA 322
#define ESUB 323
#define DOTDOT 324
#define PCC_BEGIN 325
#define PCC_END 326
#define PCC_CALL 327
#define PCC_SUB 328
#define PCC_BEGIN_RETURN 329
#define PCC_END_RETURN 330
#define PCC_BEGIN_YIELD 331
#define PCC_END_YIELD 332
#define NCI_CALL 333
#define METH_CALL 334
#define INVOCANT 335
#define MAIN 336
#define LOAD 337
#define IMMEDIATE 338
#define POSTCOMP 339
#define METHOD 340
#define ANON 341
#define OUTER 342
#define MULTI 343
#define LABEL 344
#define EMIT 345
#define EOM 346
#define IREG 347
#define NREG 348
#define SREG 349
#define PREG 350
#define IDENTIFIER 351
#define REG 352
#define MACRO 353
#define ENDM 354
#define STRINGC 355
#define INTC 356
#define FLOATC 357
#define USTRINGC 358
#define PARROT_OP 359
#define VAR 360
#define LINECOMMENT 361
#define FILECOMMENT 362
#define DOT 363
#define CONCAT 364
#define POINTY 365




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
#line 308 "imcc/imcc.y"
typedef union {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 193 of /usr/share/bison/yacc.c.  */
#line 608 "imcc/imcparser.c"
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
#line 629 "imcc/imcparser.c"

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
#define YYFINAL  39
#define YYLAST   598

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  127
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  109
/* YYNRULES -- Number of rules. */
#define YYNRULES  294
/* YYNRULES -- Number of states. */
#define YYNSTATES  501

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   365

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   117,     2,     2,     2,   123,   124,     2,
     115,   116,   121,   120,     2,   118,     2,   122,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   126,
       2,   112,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   113,     2,   114,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   125,     2,   119,     2,     2,     2,
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
     106,   107,   108,   109,   110,   111
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    25,    27,    29,    33,    36,    39,    44,    48,
      54,    55,    62,    63,    70,    72,    75,    79,    82,    84,
      86,    88,    90,    91,    95,    99,   102,   107,   108,   110,
     111,   116,   117,   119,   124,   125,   126,   127,   138,   139,
     141,   145,   146,   152,   153,   155,   160,   161,   165,   167,
     169,   171,   173,   175,   177,   178,   180,   181,   182,   183,
     194,   195,   205,   206,   209,   210,   214,   215,   217,   219,
     223,   225,   227,   229,   231,   233,   235,   237,   243,   247,
     251,   255,   259,   265,   271,   272,   276,   279,   280,   284,
     288,   289,   294,   295,   298,   300,   302,   304,   306,   308,
     310,   312,   313,   319,   321,   322,   325,   329,   333,   334,
     340,   341,   347,   348,   350,   354,   356,   359,   360,   363,
     366,   368,   370,   371,   373,   376,   378,   380,   384,   386,
     390,   392,   394,   397,   400,   401,   406,   411,   412,   419,
     421,   422,   429,   432,   435,   438,   441,   443,   445,   447,
     448,   450,   452,   454,   456,   458,   460,   462,   466,   471,
     476,   481,   487,   493,   499,   505,   511,   517,   523,   529,
     535,   541,   547,   553,   559,   565,   571,   577,   583,   590,
     597,   604,   612,   617,   622,   629,   637,   642,   647,   652,
     657,   664,   672,   676,   677,   687,   689,   691,   695,   699,
     703,   707,   711,   715,   719,   723,   727,   731,   735,   739,
     743,   747,   752,   754,   756,   758,   762,   766,   770,   772,
     774,   775,   781,   782,   786,   788,   791,   792,   795,   797,
     800,   804,   806,   813,   820,   826,   832,   837,   842,   847,
     852,   854,   856,   858,   860,   862,   864,   866,   868,   869,
     871,   875,   877,   879,   884,   886,   888,   890,   892,   894,
     896,   898,   900,   902,   904,   905,   908,   910,   914,   915,
     920,   922,   926,   929,   932,   934,   936,   938,   940,   942,
     944,   946,   948,   950,   952
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     128,     0,    -1,   129,    -1,   130,    -1,   129,   130,    -1,
     147,    -1,   135,    -1,   134,    -1,   148,    -1,   160,    -1,
     144,    -1,    99,     4,    -1,   131,    -1,     4,    -1,     6,
     132,     4,    -1,   133,     4,    -1,     7,   102,    -1,     8,
     101,    68,   101,    -1,    58,   201,    97,    -1,    58,   201,
      97,   112,   234,    -1,    -1,    26,   136,   201,    97,   112,
     234,    -1,    -1,    26,   138,   102,   226,   112,   101,    -1,
     140,    -1,   139,   140,    -1,   192,   141,     4,    -1,    99,
       4,    -1,   108,    -1,   107,    -1,   147,    -1,   137,    -1,
      -1,   142,   105,   143,    -1,    74,   168,    90,    -1,    13,
     227,    -1,    25,   101,    68,    98,    -1,    -1,   220,    -1,
      -1,    91,   145,   146,    92,    -1,    -1,   139,    -1,    19,
     113,   228,   114,    -1,    -1,    -1,    -1,    22,   149,   223,
     150,   168,     4,   151,   152,   159,    69,    -1,    -1,     4,
      -1,   152,   153,     4,    -1,    -1,     5,   154,   201,    97,
     177,    -1,    -1,    68,    -1,    89,   115,   157,   116,    -1,
      -1,   157,    68,   158,    -1,   158,    -1,    46,    -1,    47,
      -1,    49,    -1,    48,    -1,    97,    -1,    -1,   189,    -1,
      -1,    -1,    -1,    74,   161,    97,   162,   168,     4,   163,
     152,   159,    69,    -1,    -1,    71,     4,   165,   172,   167,
     171,   166,   174,    72,    -1,    -1,   194,     4,    -1,    -1,
      81,   227,     4,    -1,    -1,   169,    -1,   170,    -1,   169,
     155,   170,    -1,    83,    -1,    82,    -1,    84,    -1,    85,
      -1,    87,    -1,    86,    -1,   156,    -1,    73,   227,    68,
     227,     4,    -1,    73,   227,     4,    -1,    79,   227,     4,
      -1,    80,   219,     4,    -1,    80,   101,     4,    -1,    80,
     219,    68,   227,     4,    -1,    80,   101,    68,   227,     4,
      -1,    -1,   172,   173,     4,    -1,    10,   212,    -1,    -1,
     174,   175,     4,    -1,    61,   219,   177,    -1,    -1,    24,
     176,   201,    97,    -1,    -1,   177,   178,    -1,    15,    -1,
      16,    -1,    17,    -1,    75,    -1,    77,    -1,    76,    -1,
      78,    -1,    -1,   179,     4,   182,   183,   180,    -1,   185,
      -1,    -1,   183,     4,    -1,   183,   184,     4,    -1,    62,
     227,   213,    -1,    -1,    62,   115,   186,   188,   116,    -1,
      -1,    63,   115,   187,   188,   116,    -1,    -1,   212,    -1,
     188,    68,   212,    -1,   191,    -1,   189,   191,    -1,    -1,
     190,   195,    -1,    99,     4,    -1,   108,    -1,   107,    -1,
      -1,   193,    -1,   193,   194,    -1,   194,    -1,    90,    -1,
     192,   197,     4,    -1,    97,    -1,   196,    68,    97,    -1,
     203,    -1,   217,    -1,    19,    97,    -1,    20,    97,    -1,
      -1,    24,   198,   201,   196,    -1,    25,   101,    68,   233,
      -1,    -1,    26,   199,   201,    97,   112,   234,    -1,   137,
      -1,    -1,    29,   200,   201,    97,   112,   234,    -1,    62,
     209,    -1,     9,   225,    -1,   105,   220,    -1,    13,   227,
      -1,   209,    -1,   164,    -1,   181,    -1,    -1,    46,    -1,
      47,    -1,    48,    -1,    49,    -1,    50,    -1,   202,    -1,
      97,    -1,   219,   112,   227,    -1,   219,   112,   117,   227,
      -1,   219,   112,   118,   227,    -1,   219,   112,   119,   227,
      -1,   219,   112,   227,   120,   227,    -1,   219,   112,   227,
     118,   227,    -1,   219,   112,   227,   121,   227,    -1,   219,
     112,   227,    64,   227,    -1,   219,   112,   227,   122,   227,
      -1,   219,   112,   227,    38,   227,    -1,   219,   112,   227,
     123,   227,    -1,   219,   112,   227,   110,   227,    -1,   219,
     112,   227,    44,   227,    -1,   219,   112,   227,    45,   227,
      -1,   219,   112,   227,    65,   227,    -1,   219,   112,   227,
      66,   227,    -1,   219,   112,   227,    67,   227,    -1,   219,
     112,   227,    51,   227,    -1,   219,   112,   227,   124,   227,
      -1,   219,   112,   227,   125,   227,    -1,   219,   112,   227,
     119,   227,    -1,   219,   112,   227,   113,   228,   114,    -1,
     219,   113,   228,   114,   112,   227,    -1,   219,   112,    18,
     202,    68,   227,    -1,   219,   112,    18,   202,   113,   228,
     114,    -1,   219,   112,    18,   202,    -1,   219,   112,    18,
     227,    -1,   219,   112,    18,   227,    68,   227,    -1,   219,
     112,    18,   227,   113,   228,   114,    -1,   219,   112,    60,
      97,    -1,   219,   112,    59,   235,    -1,    59,   235,   112,
     227,    -1,    18,   219,    68,   227,    -1,    18,   219,    68,
     227,    68,   227,    -1,    18,   219,    68,   227,   113,   228,
     114,    -1,   219,   112,   209,    -1,    -1,   204,   115,   216,
     116,   112,   207,   115,   211,   116,    -1,   205,    -1,   206,
      -1,   219,   112,    13,    -1,   219,    30,   227,    -1,   219,
      31,   227,    -1,   219,    32,   227,    -1,   219,    33,   227,
      -1,   219,    40,   227,    -1,   219,    39,   227,    -1,   219,
      34,   227,    -1,   219,    35,   227,    -1,   219,    36,   227,
      -1,   219,    37,   227,    -1,   219,    41,   227,    -1,   219,
      42,   227,    -1,   219,    43,   227,    -1,   219,   112,   105,
     143,    -1,    97,    -1,   101,    -1,   219,    -1,   219,   208,
     224,    -1,   219,   208,   101,    -1,   219,   208,   219,    -1,
     111,    -1,   109,    -1,    -1,   207,   210,   115,   211,   116,
      -1,    -1,   211,    68,   212,    -1,   212,    -1,   227,   213,
      -1,    -1,   213,   214,    -1,    14,    -1,   219,   177,    -1,
     216,    68,   215,    -1,   215,    -1,    11,   227,   218,   227,
       9,   225,    -1,    12,   227,   218,   227,     9,   225,    -1,
      11,    13,   227,     9,   225,    -1,    12,    13,   227,     9,
     225,    -1,    11,   227,     9,   225,    -1,    12,   227,     9,
     225,    -1,    11,   227,    68,   225,    -1,    12,   227,    68,
     225,    -1,    52,    -1,    53,    -1,    54,    -1,    55,    -1,
      56,    -1,    57,    -1,   106,    -1,   233,    -1,    -1,   221,
      -1,   221,    68,   222,    -1,   222,    -1,   226,    -1,   219,
     113,   228,   114,    -1,   224,    -1,   101,    -1,    97,    -1,
     105,    -1,    97,    -1,   105,    -1,   225,    -1,   227,    -1,
     219,    -1,   234,    -1,    -1,   229,   230,    -1,   232,    -1,
     230,   126,   232,    -1,    -1,   230,    68,   231,   232,    -1,
     227,    -1,   227,    70,   227,    -1,    70,   227,    -1,   227,
      70,    -1,    93,    -1,    94,    -1,    95,    -1,    96,    -1,
      98,    -1,   102,    -1,   103,    -1,   101,    -1,   104,    -1,
      95,    -1,   101,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   386,   386,   390,   392,   395,   397,   398,   399,   400,
     401,   402,   403,   404,   407,   408,   411,   419,   430,   437,
     446,   445,   451,   450,   454,   456,   459,   461,   462,   463,
     464,   465,   468,   468,   472,   480,   482,   487,   490,   495,
     494,   505,   507,   510,   528,   532,   535,   526,   540,   542,
     543,   547,   546,   552,   554,   558,   561,   563,   564,   567,
     569,   570,   571,   572,   584,   586,   590,   592,   596,   589,
     603,   601,   633,   635,   638,   640,   644,   646,   649,   651,
     654,   656,   657,   658,   659,   660,   661,   664,   670,   672,
     677,   679,   681,   685,   692,   694,   697,   702,   704,   707,
     709,   709,   713,   715,   718,   720,   721,   725,   727,   730,
     732,   737,   735,   741,   746,   748,   750,   754,   760,   758,
     767,   766,   775,   777,   778,   782,   784,   795,   799,   802,
     803,   804,   807,   809,   812,   814,   817,   823,   828,   836,
     844,   846,   847,   848,   849,   849,   862,   863,   863,   865,
     866,   866,   868,   872,   873,   876,   878,   879,   880,   881,
     884,   886,   887,   888,   889,   890,   893,   904,   906,   907,
     908,   909,   910,   911,   912,   913,   914,   915,   916,   917,
     919,   921,   923,   925,   927,   929,   931,   933,   935,   937,
     939,   941,   943,   945,   947,   949,   951,   954,   956,   960,
     962,   964,   967,   974,   973,   982,   983,   984,   988,   991,
     993,   995,   997,   999,  1001,  1003,  1005,  1007,  1009,  1011,
    1013,  1017,  1025,  1026,  1027,  1032,  1033,  1034,  1037,  1038,
    1043,  1041,  1051,  1053,  1054,  1057,  1061,  1063,  1066,  1070,
    1073,  1075,  1078,  1081,  1083,  1085,  1087,  1089,  1091,  1093,
    1097,  1099,  1100,  1101,  1102,  1103,  1106,  1108,  1111,  1113,
    1116,  1118,  1121,  1123,  1130,  1132,  1135,  1137,  1140,  1142,
    1145,  1147,  1150,  1152,  1155,  1155,  1159,  1161,  1163,  1163,
    1167,  1173,  1176,  1177,  1180,  1182,  1183,  1184,  1185,  1188,
    1190,  1191,  1192,  1195,  1197
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "PRAGMA", 
  "N_OPERATORS", "HLL", "GOTO", "ARG", "IF", "UNLESS", "PNULL", 
  "ADV_FLAT", "ADV_SLURPY", "ADV_OPTIONAL", "ADV_OPT_FLAG", "NEW", 
  "NAMESPACE", "ENDNAMESPACE", "DOT_METHOD", "SUB", "SYM", "LOCAL", 
  "LEXICAL", "CONST", "INC", "DEC", "GLOBAL_CONST", "PLUS_ASSIGN", 
  "MINUS_ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", "CONCAT_ASSIGN", 
  "BAND_ASSIGN", "BOR_ASSIGN", "BXOR_ASSIGN", "FDIV", "FDIV_ASSIGN", 
  "MOD_ASSIGN", "SHR_ASSIGN", "SHL_ASSIGN", "SHR_U_ASSIGN", "SHIFT_LEFT", 
  "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV", "OBJECTV", 
  "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", 
  "RELOP_LTE", "GLOBAL", "GLOBALOP", "ADDR", "RESULT", "RETURN", "YIELDT", 
  "POW", "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", "DOTDOT", 
  "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB", "PCC_BEGIN_RETURN", 
  "PCC_END_RETURN", "PCC_BEGIN_YIELD", "PCC_END_YIELD", "NCI_CALL", 
  "METH_CALL", "INVOCANT", "MAIN", "LOAD", "IMMEDIATE", "POSTCOMP", 
  "METHOD", "ANON", "OUTER", "MULTI", "LABEL", "EMIT", "EOM", "IREG", 
  "NREG", "SREG", "PREG", "IDENTIFIER", "REG", "MACRO", "ENDM", "STRINGC", 
  "INTC", "FLOATC", "USTRINGC", "PARROT_OP", "VAR", "LINECOMMENT", 
  "FILECOMMENT", "DOT", "CONCAT", "POINTY", "'='", "'['", "']'", "'('", 
  "')'", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", "'&'", "'|'", 
  "';'", "$accept", "program", "compilation_units", "compilation_unit", 
  "pragma", "pragma_1", "hll_def", "global", "constdef", "@1", 
  "pmc_const", "@2", "pasmcode", "pasmline", "pasm_inst", "@3", 
  "pasm_args", "emit", "@4", "opt_pasmcode", "class_namespace", "sub", 
  "@5", "@6", "@7", "sub_params", "sub_param", "@8", "opt_comma", "multi", 
  "multi_types", "multi_type", "sub_body", "pcc_sub", "@9", "@10", "@11", 
  "pcc_sub_call", "@12", "opt_label", "opt_invocant", "sub_proto", 
  "sub_proto_list", "proto", "pcc_call", "pcc_args", "pcc_arg", 
  "pcc_results", "pcc_result", "@13", "paramtype_list", "paramtype", 
  "begin_ret_or_yield", "end_ret_or_yield", "pcc_ret", "@14", 
  "pcc_returns", "pcc_return", "pcc_return_many", "@15", "@16", 
  "var_returns", "statements", "helper_clear_state", "statement", 
  "labels", "_labels", "label", "instruction", "id_list", "labeled_inst", 
  "@17", "@18", "@19", "type", "classname", "assignment", "@20", 
  "op_assign", "func_assign", "the_sub", "ptr", "sub_call", "@21", 
  "arglist", "arg", "argtype_list", "argtype", "result", "targetlist", 
  "if_statement", "relop", "target", "vars", "_vars", "_var_or_i", 
  "sub_label_op_c", "sub_label_op", "label_op", "var_or_i", "var", 
  "keylist", "@22", "_keylist", "@23", "key", "reg", "const", "string", 0
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
     364,   365,    61,    91,    93,    40,    41,    33,    45,   126,
      43,    42,    47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   127,   128,   129,   129,   130,   130,   130,   130,   130,
     130,   130,   130,   130,   131,   131,   132,   133,   134,   134,
     136,   135,   138,   137,   139,   139,   140,   140,   140,   140,
     140,   140,   142,   141,   141,   141,   141,   141,   143,   145,
     144,   146,   146,   147,   149,   150,   151,   148,   152,   152,
     152,   154,   153,   155,   155,   156,   157,   157,   157,   158,
     158,   158,   158,   158,   159,   159,   161,   162,   163,   160,
     165,   164,   166,   166,   167,   167,   168,   168,   169,   169,
     170,   170,   170,   170,   170,   170,   170,   171,   171,   171,
     171,   171,   171,   171,   172,   172,   173,   174,   174,   175,
     176,   175,   177,   177,   178,   178,   178,   179,   179,   180,
     180,   182,   181,   181,   183,   183,   183,   184,   186,   185,
     187,   185,   188,   188,   188,   189,   189,   190,   191,   191,
     191,   191,   192,   192,   193,   193,   194,   195,   196,   196,
     197,   197,   197,   197,   198,   197,   197,   199,   197,   197,
     200,   197,   197,   197,   197,   197,   197,   197,   197,   197,
     201,   201,   201,   201,   201,   201,   202,   203,   203,   203,
     203,   203,   203,   203,   203,   203,   203,   203,   203,   203,
     203,   203,   203,   203,   203,   203,   203,   203,   203,   203,
     203,   203,   203,   203,   203,   203,   203,   203,   203,   203,
     203,   203,   203,   204,   203,   203,   203,   203,   205,   205,
     205,   205,   205,   205,   205,   205,   205,   205,   205,   205,
     205,   206,   207,   207,   207,   207,   207,   207,   208,   208,
     210,   209,   211,   211,   211,   212,   213,   213,   214,   215,
     216,   216,   217,   217,   217,   217,   217,   217,   217,   217,
     218,   218,   218,   218,   218,   218,   219,   219,   220,   220,
     221,   221,   222,   222,   223,   223,   224,   224,   225,   225,
     226,   226,   227,   227,   229,   228,   230,   230,   231,   230,
     232,   232,   232,   232,   233,   233,   233,   233,   233,   234,
     234,   234,   234,   235,   235
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     3,     2,     2,     4,     3,     5,
       0,     6,     0,     6,     1,     2,     3,     2,     1,     1,
       1,     1,     0,     3,     3,     2,     4,     0,     1,     0,
       4,     0,     1,     4,     0,     0,     0,    10,     0,     1,
       3,     0,     5,     0,     1,     4,     0,     3,     1,     1,
       1,     1,     1,     1,     0,     1,     0,     0,     0,    10,
       0,     9,     0,     2,     0,     3,     0,     1,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     5,     3,     3,
       3,     3,     5,     5,     0,     3,     2,     0,     3,     3,
       0,     4,     0,     2,     1,     1,     1,     1,     1,     1,
       1,     0,     5,     1,     0,     2,     3,     3,     0,     5,
       0,     5,     0,     1,     3,     1,     2,     0,     2,     2,
       1,     1,     0,     1,     2,     1,     1,     3,     1,     3,
       1,     1,     2,     2,     0,     4,     4,     0,     6,     1,
       0,     6,     2,     2,     2,     2,     1,     1,     1,     0,
       1,     1,     1,     1,     1,     1,     1,     3,     4,     4,
       4,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     6,     6,
       6,     7,     4,     4,     6,     7,     4,     4,     4,     4,
       6,     7,     3,     0,     9,     1,     1,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     4,     1,     1,     1,     3,     3,     3,     1,     1,
       0,     5,     0,     3,     1,     2,     0,     2,     1,     2,
       3,     1,     6,     6,     5,     5,     4,     4,     4,     4,
       1,     1,     1,     1,     1,     1,     1,     1,     0,     1,
       3,     1,     1,     4,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     0,     2,     1,     3,     0,     4,
       1,     3,     2,     2,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,     0,    44,    20,     0,    66,    39,
       0,     0,     2,     3,    12,     0,     7,     6,    10,     5,
       8,     9,     0,     0,     0,   274,     0,     0,   160,   161,
     162,   163,   164,   166,     0,   165,     0,   132,    11,     1,
       4,    15,    16,    14,     0,     0,     0,   266,   265,   267,
      45,   264,     0,    18,    67,    22,   136,     0,    29,    28,
      31,   132,    24,     0,    30,    32,   133,   135,    17,    43,
       0,   284,   285,   286,   287,   288,   291,   289,   290,   292,
     256,   272,   280,   275,   276,   257,   273,    76,     0,     0,
      76,     0,    27,    25,    40,     0,     0,    76,     0,     0,
     134,   282,   283,   278,     0,    81,    80,    82,    83,    85,
      84,     0,    86,     0,    53,    78,     0,    19,     0,     0,
      35,     0,     0,    26,   258,   281,     0,   277,    56,    46,
      54,     0,    21,    68,   268,   269,   270,     0,   271,     0,
      34,    33,   272,    38,   259,   261,   262,   279,    59,    60,
      62,    61,    63,     0,    58,    48,    79,    48,     0,    36,
     274,     0,     0,    55,    49,   127,   127,    23,     0,   260,
      57,    51,     0,   131,   130,     0,     0,   127,   132,   125,
       0,   263,     0,   129,    50,    47,   126,   159,   128,    69,
       0,     0,     0,     0,     0,     0,     0,     0,   144,     0,
     147,   150,     0,     0,     0,     0,   107,   108,   222,   223,
     258,   149,   157,     0,   158,   113,     0,   140,     0,   205,
     206,   230,   156,   141,   224,   102,   153,     0,     0,     0,
       0,   155,     0,   142,   143,     0,     0,     0,     0,   293,
     294,     0,   118,   152,   224,   120,    70,   154,   111,   137,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   229,   228,     0,   274,     0,
      52,     0,     0,   250,   251,   252,   253,   254,   255,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   122,   122,    94,   114,   241,     0,   102,   232,   208,
     209,   210,   211,   214,   215,   216,   217,   213,   212,   218,
     219,   220,   207,     0,     0,     0,   291,   258,     0,     0,
       0,   202,   272,   167,     0,   226,   227,   225,   104,   105,
     106,   103,     0,   246,   248,     0,     0,   247,   249,     0,
     199,   138,   145,   146,     0,     0,   198,     0,   123,   236,
       0,    74,     0,     0,     0,   239,     0,   234,   192,   193,
     197,   196,   221,   168,   169,   170,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   274,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   244,     0,   245,     0,     0,
     274,     0,     0,     0,     0,   119,   235,   121,     0,     0,
       0,     0,   115,     0,   109,   110,   112,     0,   240,     0,
       0,   231,     0,   274,     0,   274,   176,   179,   180,   184,
     174,   181,   182,   183,   178,     0,   172,   187,   171,   173,
     175,   177,   185,   186,     0,   242,   243,   200,     0,   139,
     148,   151,   124,   238,   237,    96,     0,     0,     0,     0,
      72,    95,   236,   116,     0,   233,   190,     0,   194,     0,
     188,   189,   201,    75,     0,     0,     0,     0,    97,     0,
     117,   232,   191,   195,    88,     0,    89,    91,     0,    90,
       0,     0,    73,     0,     0,     0,     0,   100,     0,    71,
       0,   204,    87,    93,    92,     0,   102,    98,     0,    99,
     101
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    11,    12,    13,    14,    23,    15,    16,    17,    27,
      60,    91,    61,    62,    98,    99,   141,    18,    37,    63,
      19,    20,    26,    87,   155,   165,   175,   182,   131,   112,
     153,   154,   176,    21,    36,    90,   157,   212,   293,   468,
     400,   113,   114,   115,   450,   351,   401,   481,   490,   495,
     270,   331,   213,   406,   214,   294,   352,   407,   215,   291,
     292,   347,   177,   178,   179,    65,    66,    67,   188,   342,
     216,   235,   237,   238,    34,    35,   217,   218,   219,   220,
     221,   269,   222,   251,   356,   348,   396,   444,   295,   296,
     223,   280,    81,   143,   144,   145,    50,    51,   136,   146,
     349,    45,    46,    83,   126,    84,    85,    86,   241
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -295
static const short yypact[] =
{
      34,  -295,    15,   -67,   -76,  -295,  -295,   -30,  -295,  -295,
      37,    50,    34,  -295,  -295,    54,  -295,  -295,  -295,  -295,
    -295,  -295,   -37,    68,    20,  -295,    62,   -30,  -295,  -295,
    -295,  -295,  -295,  -295,    -8,  -295,    16,    57,  -295,  -295,
    -295,  -295,  -295,  -295,    14,    -2,   308,  -295,  -295,  -295,
    -295,  -295,    48,   -15,  -295,  -295,  -295,   142,  -295,  -295,
    -295,   147,  -295,    56,  -295,    11,    60,  -295,  -295,  -295,
     252,  -295,  -295,  -295,  -295,  -295,  -295,  -295,  -295,  -295,
    -295,  -295,    81,   -56,  -295,  -295,  -295,   509,    45,   132,
     509,    58,  -295,  -295,  -295,   252,    70,   509,   157,    67,
    -295,  -295,   252,  -295,   308,  -295,  -295,  -295,  -295,  -295,
    -295,    64,  -295,   177,     3,  -295,   132,  -295,   184,   428,
    -295,   126,   106,  -295,   428,  -295,   308,  -295,    -3,  -295,
    -295,   509,  -295,  -295,  -295,  -295,  -295,    85,  -295,   130,
    -295,  -295,   116,  -295,   163,  -295,  -295,  -295,  -295,  -295,
    -295,  -295,  -295,   -41,  -295,   238,  -295,   238,   146,  -295,
    -295,   428,    -3,  -295,  -295,    -1,    -1,  -295,   129,  -295,
    -295,  -295,   245,  -295,  -295,   247,   183,    75,    60,  -295,
     187,  -295,   -30,  -295,  -295,  -295,  -295,   357,  -295,  -295,
     156,   -66,    36,    97,   252,   331,   166,   170,  -295,   167,
     172,  -295,    19,   413,   154,   267,  -295,  -295,  -295,  -295,
     428,  -295,  -295,   268,  -295,  -295,   271,  -295,   161,  -295,
    -295,  -295,  -295,  -295,   279,  -295,  -295,   252,   229,   252,
     239,  -295,   219,  -295,  -295,   -30,   220,   -30,   -30,  -295,
    -295,   178,  -295,  -295,    32,  -295,  -295,  -295,  -295,  -295,
     331,   174,   252,   252,   252,   252,   252,   252,   252,   252,
     252,   252,   252,   252,   252,  -295,  -295,   382,  -295,   457,
     169,   289,   -66,  -295,  -295,  -295,  -295,  -295,  -295,   -66,
     252,   290,   -66,   -66,   252,   252,   203,   111,   204,   205,
     252,   252,   252,  -295,  -295,  -295,   -20,  -295,   252,  -295,
    -295,  -295,  -295,  -295,  -295,  -295,  -295,  -295,  -295,  -295,
    -295,  -295,  -295,   442,    19,   206,   189,   428,   252,   252,
     252,  -295,    13,   451,   194,  -295,  -295,  -295,  -295,  -295,
    -295,  -295,   -66,  -295,  -295,   314,   -66,  -295,  -295,   315,
      -9,  -295,   257,  -295,   223,   232,  -295,   -17,  -295,  -295,
     -16,     0,     4,   331,   240,   169,   -14,  -295,    22,    23,
    -295,  -295,  -295,  -295,  -295,  -295,   252,   252,   252,   252,
     252,   252,   252,   252,   252,  -295,   252,   252,   252,   252,
     252,   252,   252,   252,   248,  -295,   -66,  -295,   -66,   252,
    -295,   254,   132,   132,   252,  -295,   347,  -295,   252,   252,
      89,   358,  -295,   252,  -295,  -295,  -295,   360,  -295,   484,
     252,  -295,   252,  -295,   252,  -295,  -295,  -295,  -295,  -295,
    -295,  -295,  -295,  -295,  -295,   251,  -295,  -295,  -295,  -295,
    -295,  -295,  -295,  -295,   252,  -295,  -295,  -295,   253,  -295,
    -295,  -295,  -295,  -295,  -295,  -295,   367,   252,   252,   164,
      60,  -295,  -295,  -295,   258,  -295,  -295,   265,  -295,   266,
    -295,  -295,  -295,  -295,     5,   380,     9,    10,  -295,   383,
     347,   252,  -295,  -295,  -295,   252,  -295,  -295,   252,  -295,
     252,     2,  -295,    -7,   385,   389,   393,  -295,   331,  -295,
     394,  -295,  -295,  -295,  -295,   -30,  -295,  -295,   302,   169,
    -295
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -295,  -295,  -295,   401,  -295,  -295,  -295,  -295,  -295,  -295,
     218,  -295,  -295,   354,  -295,  -295,   100,  -295,  -295,  -295,
      -4,  -295,  -295,  -295,  -295,   261,  -295,  -295,  -295,  -295,
    -295,   259,   256,  -295,  -295,  -295,  -295,  -295,  -295,  -295,
    -295,   -69,  -295,   292,  -295,  -295,  -295,  -295,  -295,  -295,
    -294,  -295,  -295,  -295,  -295,  -295,  -295,  -295,  -295,  -295,
    -295,   138,  -295,  -295,   262,   255,  -295,   -65,  -295,  -295,
    -295,  -295,  -295,  -295,   -27,   118,  -295,  -295,  -295,  -295,
      27,  -295,  -180,  -295,   -28,  -293,    -6,  -295,    91,  -295,
    -295,   215,   -92,   237,  -295,   287,  -295,   180,  -156,   337,
     -40,  -149,  -295,  -295,  -295,   -79,   173,   -87,   143
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -225
static const short yytable[] =
{
      52,   100,   117,   355,   171,   357,    82,   -77,   402,   474,
     398,   168,   103,   477,   479,   -37,    28,    29,    30,    31,
      32,   118,    22,   243,    95,   127,   487,   162,   122,   132,
     101,   134,   142,    64,    24,   226,    96,    25,     1,   135,
       2,    38,     3,   148,   149,   150,   151,   147,   353,   227,
      39,   394,   394,     4,   410,   120,     5,    64,    41,   389,
       6,   410,   125,   488,    82,    42,   403,    33,   -64,   142,
     104,   130,    43,   475,   489,   163,     4,   478,   480,   138,
     404,   399,   405,    55,   138,    97,    82,   321,    44,    53,
     412,   414,     7,   -77,   152,   224,   354,    89,   172,   395,
     397,   442,   411,   232,   390,   445,   173,   174,     8,   491,
     229,   244,    69,    54,   239,    68,   333,   455,   142,   324,
     240,   138,   265,   334,   266,     9,   337,   338,  -224,    71,
      72,    73,    74,    10,    75,   413,   415,    76,    77,    78,
      79,   265,    80,   266,   -65,    88,    92,    56,    94,   -41,
      56,   102,   228,   230,   231,   190,    57,   116,   297,    47,
     119,   123,   447,    48,    58,    59,     4,    49,   448,   449,
     138,   121,   124,    55,   172,   322,   385,   326,   357,   128,
     387,   129,   173,   174,   328,   329,   330,   271,   133,   281,
      71,    72,    73,    74,   139,    75,   140,   158,    76,    77,
      78,    79,   499,    80,    71,    72,    73,    74,   286,    75,
     288,   289,   299,   300,   301,   302,   303,   304,   305,   306,
     307,   308,   309,   310,   311,   142,   425,   323,   159,   160,
     435,   161,   436,    76,    77,    78,    79,    56,   272,   -42,
     335,   438,   164,   181,   339,   340,    57,   167,   282,   183,
     346,   184,   185,   225,    58,    59,   189,    71,    72,    73,
      74,   297,    75,   233,   457,   466,   459,   234,   236,   245,
      80,   246,   248,   359,   -22,   249,   250,   138,   363,   364,
     365,   273,   274,   275,   276,   277,   278,   285,   287,   298,
     290,   273,   274,   275,   276,   277,   278,   279,   332,   336,
     341,   344,   345,   361,  -223,   440,   441,   283,   384,   252,
     253,   254,   255,   256,   257,   258,   259,   244,   260,   261,
     262,   263,   264,   386,   388,   391,   416,   417,   418,   419,
     420,   421,   422,   423,   424,   392,   426,   427,   428,   429,
     430,   431,   432,   433,   393,    71,    72,    73,    74,   437,
      75,   439,   409,    76,    77,    78,    79,   467,    80,   446,
     434,   443,   451,   452,   453,   460,   191,   462,   192,   193,
     194,   463,   456,   471,   458,   195,   196,   197,    70,   472,
     473,   198,   199,   200,   476,   469,   201,   482,   265,   492,
     266,   267,   268,   493,   461,   312,   496,   494,   497,   500,
     313,    71,    72,    73,    74,   211,    75,   464,   465,    76,
      77,    78,    79,    40,    80,    93,   202,   362,   166,   203,
     204,   170,   180,   156,    71,    72,    73,    74,   205,    75,
     350,   358,   206,   187,   207,   484,   454,    80,   485,   186,
     486,   314,   315,   483,   408,   284,   470,   247,   169,   327,
      71,    72,    73,    74,   208,    75,   137,   360,   209,     0,
     343,     0,   210,    80,     0,     0,     0,     0,   498,     0,
       0,     0,  -203,     0,     0,    71,    72,    73,    74,   208,
      75,     0,     0,   316,    77,    78,    79,   317,    80,   366,
       0,     0,     0,     0,     0,   367,   368,     0,     0,   318,
     319,   320,   369,     0,     0,     0,    71,    72,    73,    74,
     208,    75,     0,     0,   209,   370,   371,   372,   373,    80,
       0,    71,    72,    73,    74,   134,    75,     0,   242,    76,
      77,    78,    79,   135,    80,    71,    72,    73,    74,    33,
      75,     0,     0,    76,    77,    78,    79,     0,    80,     0,
      71,    72,    73,    74,    47,    75,     0,     0,   325,     0,
       0,   374,    49,    80,   375,     0,     0,     0,     0,   376,
     377,   378,   379,   380,   381,   382,   383,    71,    72,    73,
      74,   208,    75,     0,     0,   209,     0,     0,     0,     0,
      80,   105,   106,   107,   108,   109,   110,     0,   111
};

static const short yycheck[] =
{
      27,    66,    89,   297,     5,   298,    46,     4,     4,     4,
      10,   160,    68,     4,     4,     4,    46,    47,    48,    49,
      50,    90,     7,   203,    13,   104,    24,    68,    97,   116,
      70,    97,   124,    37,   101,   191,    25,   113,     4,   105,
       6,     4,     8,    46,    47,    48,    49,   126,    68,    13,
       0,    68,    68,    19,    68,    95,    22,    61,     4,    68,
      26,    68,   102,    61,   104,   102,    62,    97,    69,   161,
     126,    68,     4,    68,    72,   116,    19,    68,    68,   119,
      76,    81,    78,    26,   124,    74,   126,   267,    68,    97,
      68,    68,    58,    90,    97,   187,   116,   112,    99,   116,
     116,   394,   116,   195,   113,   398,   107,   108,    74,   116,
      13,   203,   114,    97,    95,   101,   272,   410,   210,   268,
     101,   161,   109,   279,   111,    91,   282,   283,   115,    93,
      94,    95,    96,    99,    98,   113,   113,   101,   102,   103,
     104,   109,   106,   111,    69,    97,     4,    90,    92,    92,
      90,    70,   192,   193,   194,   182,    99,   112,   250,    97,
     102,     4,    73,   101,   107,   108,    19,   105,    79,    80,
     210,   101,   105,    26,    99,   267,   332,   269,   471,   115,
     336,     4,   107,   108,    15,    16,    17,   227,     4,   229,
      93,    94,    95,    96,    68,    98,    90,   112,   101,   102,
     103,   104,   496,   106,    93,    94,    95,    96,   235,    98,
     237,   238,   252,   253,   254,   255,   256,   257,   258,   259,
     260,   261,   262,   263,   264,   317,   375,   267,    98,   113,
     386,    68,   388,   101,   102,   103,   104,    90,     9,    92,
     280,   390,     4,   114,   284,   285,    99,   101,     9,     4,
     290,     4,    69,    97,   107,   108,    69,    93,    94,    95,
      96,   353,    98,    97,   413,   101,   415,    97,   101,   115,
     106,     4,     4,   313,   102,     4,   115,   317,   318,   319,
     320,    52,    53,    54,    55,    56,    57,    68,    68,   115,
     112,    52,    53,    54,    55,    56,    57,    68,     9,     9,
      97,    97,    97,    97,   115,   392,   393,    68,   114,    30,
      31,    32,    33,    34,    35,    36,    37,   409,    39,    40,
      41,    42,    43,     9,     9,    68,   366,   367,   368,   369,
     370,   371,   372,   373,   374,   112,   376,   377,   378,   379,
     380,   381,   382,   383,   112,    93,    94,    95,    96,   389,
      98,    97,   112,   101,   102,   103,   104,   449,   106,   399,
     112,    14,     4,   403,     4,   114,     9,   114,    11,    12,
      13,     4,   412,   115,   414,    18,    19,    20,    70,   114,
     114,    24,    25,    26,     4,   450,    29,     4,   109,     4,
     111,   112,   113,     4,   434,    13,   488,     4,     4,    97,
      18,    93,    94,    95,    96,   187,    98,   447,   448,   101,
     102,   103,   104,    12,   106,    61,    59,   317,   157,    62,
      63,   162,   166,   131,    93,    94,    95,    96,    71,    98,
     292,   313,    75,   178,    77,   475,   409,   106,   478,   177,
     480,    59,    60,   471,   353,   230,   452,   210,   161,   269,
      93,    94,    95,    96,    97,    98,   119,   314,   101,    -1,
     287,    -1,   105,   106,    -1,    -1,    -1,    -1,   495,    -1,
      -1,    -1,   115,    -1,    -1,    93,    94,    95,    96,    97,
      98,    -1,    -1,   101,   102,   103,   104,   105,   106,    38,
      -1,    -1,    -1,    -1,    -1,    44,    45,    -1,    -1,   117,
     118,   119,    51,    -1,    -1,    -1,    93,    94,    95,    96,
      97,    98,    -1,    -1,   101,    64,    65,    66,    67,   106,
      -1,    93,    94,    95,    96,    97,    98,    -1,   115,   101,
     102,   103,   104,   105,   106,    93,    94,    95,    96,    97,
      98,    -1,    -1,   101,   102,   103,   104,    -1,   106,    -1,
      93,    94,    95,    96,    97,    98,    -1,    -1,   101,    -1,
      -1,   110,   105,   106,   113,    -1,    -1,    -1,    -1,   118,
     119,   120,   121,   122,   123,   124,   125,    93,    94,    95,
      96,    97,    98,    -1,    -1,   101,    -1,    -1,    -1,    -1,
     106,    82,    83,    84,    85,    86,    87,    -1,    89
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,    19,    22,    26,    58,    74,    91,
      99,   128,   129,   130,   131,   133,   134,   135,   144,   147,
     148,   160,     7,   132,   101,   113,   149,   136,    46,    47,
      48,    49,    50,    97,   201,   202,   161,   145,     4,     0,
     130,     4,   102,     4,    68,   228,   229,    97,   101,   105,
     223,   224,   201,    97,    97,    26,    90,    99,   107,   108,
     137,   139,   140,   146,   147,   192,   193,   194,   101,   114,
      70,    93,    94,    95,    96,    98,   101,   102,   103,   104,
     106,   219,   227,   230,   232,   233,   234,   150,    97,   112,
     162,   138,     4,   140,    92,    13,    25,    74,   141,   142,
     194,   227,    70,    68,   126,    82,    83,    84,    85,    86,
      87,    89,   156,   168,   169,   170,   112,   234,   168,   102,
     227,   101,   168,     4,   105,   227,   231,   232,   115,     4,
      68,   155,   234,     4,    97,   105,   225,   226,   227,    68,
      90,   143,   219,   220,   221,   222,   226,   232,    46,    47,
      48,    49,    97,   157,   158,   151,   170,   163,   112,    98,
     113,    68,    68,   116,     4,   152,   152,   101,   228,   222,
     158,     5,    99,   107,   108,   153,   159,   189,   190,   191,
     159,   114,   154,     4,     4,    69,   191,   192,   195,    69,
     201,     9,    11,    12,    13,    18,    19,    20,    24,    25,
      26,    29,    59,    62,    63,    71,    75,    77,    97,   101,
     105,   137,   164,   179,   181,   185,   197,   203,   204,   205,
     206,   207,   209,   217,   219,    97,   225,    13,   227,    13,
     227,   227,   219,    97,    97,   198,   101,   199,   200,    95,
     101,   235,   115,   209,   219,   115,     4,   220,     4,     4,
     115,   210,    30,    31,    32,    33,    34,    35,    36,    37,
      39,    40,    41,    42,    43,   109,   111,   112,   113,   208,
     177,   227,     9,    52,    53,    54,    55,    56,    57,    68,
     218,   227,     9,    68,   218,    68,   201,    68,   201,   201,
     112,   186,   187,   165,   182,   215,   216,   219,   115,   227,
     227,   227,   227,   227,   227,   227,   227,   227,   227,   227,
     227,   227,    13,    18,    59,    60,   101,   105,   117,   118,
     119,   209,   219,   227,   228,   101,   219,   224,    15,    16,
      17,   178,     9,   225,   225,   227,     9,   225,   225,   227,
     227,    97,   196,   233,    97,    97,   227,   188,   212,   227,
     188,   172,   183,    68,   116,   177,   211,   212,   202,   227,
     235,    97,   143,   227,   227,   227,    38,    44,    45,    51,
      64,    65,    66,    67,   110,   113,   118,   119,   120,   121,
     122,   123,   124,   125,   114,   225,     9,   225,     9,    68,
     113,    68,   112,   112,    68,   116,   213,   116,    10,    81,
     167,   173,     4,    62,    76,    78,   180,   184,   215,   112,
      68,   116,    68,   113,    68,   113,   227,   227,   227,   227,
     227,   227,   227,   227,   227,   228,   227,   227,   227,   227,
     227,   227,   227,   227,   112,   225,   225,   227,   228,    97,
     234,   234,   212,    14,   214,   212,   227,    73,    79,    80,
     171,     4,   227,     4,   207,   212,   227,   228,   227,   228,
     114,   227,   114,     4,   227,   227,   101,   219,   166,   194,
     213,   115,   114,   114,     4,    68,     4,     4,    68,     4,
      68,   174,     4,   211,   227,   227,   227,    24,    61,    72,
     175,   116,     4,     4,     4,   176,   219,     4,   201,   177,
      97
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
#line 387 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 396 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 6:
#line 397 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 398 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 399 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 400 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 401 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 402 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 12:
#line 403 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 404 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 407 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 408 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 412 "imcc/imcc.y"
    { if (yyvsp[0].s)
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 17:
#line 420 "imcc/imcc.y"
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
#line 432 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 19:
#line 438 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 20:
#line 446 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 21:
#line 447 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 22:
#line 451 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 23:
#line 452 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 26:
#line 460 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 27:
#line 461 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 28:
#line 462 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 29:
#line 463 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 30:
#line 464 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 32:
#line 468 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 33:
#line 470 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 34:
#line 473 "imcc/imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                     yyval.i = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, yyvsp[0].s));
                     cur_call->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 35:
#line 481 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 36:
#line 483 "imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, yyvsp[0].s);
                       r->usage |= U_LEXICAL; yyval.i = 0;
                   }
    break;

  case 37:
#line 487 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 39:
#line 495 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 40:
#line 497 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 43:
#line 512 "imcc/imcc.y"
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

  case 44:
#line 528 "imcc/imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 45:
#line 532 "imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, yyvsp[0].sr);
        }
    break;

  case 46:
#line 535 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 47:
#line 537 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 48:
#line 541 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 49:
#line 542 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 50:
#line 543 "imcc/imcc.y"
    { add_pcc_param(cur_call, yyvsp[-1].sr);}
    break;

  case 51:
#line 547 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 52:
#line 548 "imcc/imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-2].t);
                                         is_def=0; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 53:
#line 553 "imcc/imcc.y"
    { yyval.t = 0;  }
    break;

  case 55:
#line 558 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 56:
#line 562 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 57:
#line 563 "imcc/imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); }
    break;

  case 58:
#line 564 "imcc/imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);}
    break;

  case 59:
#line 568 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 60:
#line 569 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 61:
#line 570 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 62:
#line 571 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 63:
#line 572 "imcc/imcc.y"
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

  case 66:
#line 590 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 67:
#line 592 "imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, yyvsp[0].s));

         }
    break;

  case 68:
#line 596 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 69:
#line 598 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 70:
#line 603 "imcc/imcc.y"
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

  case 71:
#line 630 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 72:
#line 634 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 73:
#line 635 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 74:
#line 639 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 75:
#line 641 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 76:
#line 645 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 78:
#line 650 "imcc/imcc.y"
    { yyval.t = yyvsp[0].t; }
    break;

  case 79:
#line 651 "imcc/imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; }
    break;

  case 80:
#line 655 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 81:
#line 656 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 82:
#line 657 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 83:
#line 658 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 84:
#line 659 "imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 85:
#line 660 "imcc/imcc.y"
    {  yyval.t = P_METHOD; }
    break;

  case 87:
#line 666 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 88:
#line 671 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 89:
#line 673 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-1].sr);
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 90:
#line 678 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 91:
#line 680 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 92:
#line 682 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 93:
#line 686 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 94:
#line 693 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 95:
#line 694 "imcc/imcc.y"
    {  add_pcc_arg(cur_call, yyvsp[-1].sr); }
    break;

  case 96:
#line 698 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 97:
#line 703 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 98:
#line 704 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(cur_call, yyvsp[-1].sr); }
    break;

  case 99:
#line 708 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 100:
#line 709 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 101:
#line 710 "imcc/imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 102:
#line 714 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 103:
#line 715 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 104:
#line 719 "imcc/imcc.y"
    {  yyval.t = VT_FLAT;   }
    break;

  case 105:
#line 720 "imcc/imcc.y"
    {  yyval.t = VT_OPTIONAL; }
    break;

  case 106:
#line 721 "imcc/imcc.y"
    {  yyval.t = VT_OPT_FLAG; }
    break;

  case 107:
#line 726 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 108:
#line 727 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 111:
#line 737 "imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 112:
#line 740 "imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 113:
#line 741 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 114:
#line 747 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 115:
#line 749 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 116:
#line 751 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 117:
#line 755 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 118:
#line 760 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 119:
#line 765 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 120:
#line 767 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 121:
#line 772 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 122:
#line 776 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 123:
#line 777 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 124:
#line 778 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 127:
#line 796 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 128:
#line 801 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 129:
#line 802 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 130:
#line 803 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 131:
#line 804 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 132:
#line 808 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 136:
#line 818 "imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 137:
#line 825 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 138:
#line 829 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 139:
#line 837 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 142:
#line 847 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 143:
#line 848 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 144:
#line 849 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 145:
#line 850 "imcc/imcc.y"
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

  case 146:
#line 862 "imcc/imcc.y"
    { yyvsp[0].sr->usage |= U_LEXICAL; yyval.i = 0; }
    break;

  case 147:
#line 863 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 148:
#line 864 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 150:
#line 866 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 151:
#line 867 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 152:
#line 868 "imcc/imcc.y"
    { yyval.i = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 153:
#line 872 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 154:
#line 874 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 155:
#line 877 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 156:
#line 878 "imcc/imcc.y"
    {  yyval.i = 0; cur_call = NULL; }
    break;

  case 157:
#line 879 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 159:
#line 881 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 160:
#line 885 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 161:
#line 886 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 162:
#line 887 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 163:
#line 888 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 164:
#line 889 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 165:
#line 890 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 166:
#line 895 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 167:
#line 905 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 168:
#line 906 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 169:
#line 907 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 170:
#line 908 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 171:
#line 909 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 172:
#line 910 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 173:
#line 911 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 174:
#line 912 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 175:
#line 913 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 176:
#line 914 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 177:
#line 915 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 178:
#line 916 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 179:
#line 918 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 180:
#line 920 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 181:
#line 922 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 182:
#line 924 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 183:
#line 926 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 928 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 185:
#line 930 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 932 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 187:
#line 934 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 936 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 189:
#line 938 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 940 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 191:
#line 942 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 192:
#line 944 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 193:
#line 946 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 948 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 195:
#line 950 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 196:
#line 952 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 197:
#line 955 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 198:
#line 957 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 199:
#line 961 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 963 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 965 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 202:
#line 968 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            cur_call = NULL;
            yyval.i = 0;
         }
    break;

  case 203:
#line 974 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 204:
#line 978 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           cur_call = NULL;
         }
    break;

  case 207:
#line 985 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[-2].sr); }
    break;

  case 208:
#line 990 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 992 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 210:
#line 994 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 211:
#line 996 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 998 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 213:
#line 1000 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 214:
#line 1002 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 215:
#line 1004 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 216:
#line 1006 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 1008 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 218:
#line 1010 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1012 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 220:
#line 1014 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 221:
#line 1019 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 222:
#line 1025 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 223:
#line 1026 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 224:
#line 1027 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 225:
#line 1032 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 226:
#line 1033 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 227:
#line 1034 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 228:
#line 1037 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 229:
#line 1038 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 230:
#line 1043 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 231:
#line 1048 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 232:
#line 1052 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 233:
#line 1053 "imcc/imcc.y"
    {  yyval.sr = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 234:
#line 1054 "imcc/imcc.y"
    {  yyval.sr = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 235:
#line 1058 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 236:
#line 1062 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 237:
#line 1063 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 238:
#line 1067 "imcc/imcc.y"
    {  yyval.t = VT_FLAT; }
    break;

  case 239:
#line 1070 "imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 240:
#line 1074 "imcc/imcc.y"
    { yyval.sr = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 241:
#line 1075 "imcc/imcc.y"
    { yyval.sr = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 242:
#line 1080 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 243:
#line 1082 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 244:
#line 1084 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 245:
#line 1086 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 246:
#line 1088 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 247:
#line 1090 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 248:
#line 1092 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 249:
#line 1094 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 250:
#line 1098 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 251:
#line 1099 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 252:
#line 1100 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 253:
#line 1101 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 254:
#line 1102 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 255:
#line 1103 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 258:
#line 1112 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 259:
#line 1113 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 260:
#line 1117 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 262:
#line 1122 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 263:
#line 1124 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 265:
#line 1132 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 266:
#line 1136 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 267:
#line 1137 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 268:
#line 1141 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 269:
#line 1142 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 274:
#line 1155 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 275:
#line 1156 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 276:
#line 1160 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 277:
#line 1162 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 278:
#line 1163 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 279:
#line 1164 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 280:
#line 1168 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 281:
#line 1174 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 282:
#line 1176 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 283:
#line 1177 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 284:
#line 1181 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 285:
#line 1182 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 286:
#line 1183 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 287:
#line 1184 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 288:
#line 1185 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 289:
#line 1189 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 290:
#line 1190 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 291:
#line 1191 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 292:
#line 1192 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 293:
#line 1196 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 294:
#line 1197 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3447 "imcc/imcparser.c"

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


#line 1202 "imcc/imcc.y"



int yyerror(char * s)
{
    /* XXX */
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

