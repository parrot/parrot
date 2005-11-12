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
     CONST = 279,
     INC = 280,
     DEC = 281,
     GLOBAL_CONST = 282,
     PLUS_ASSIGN = 283,
     MINUS_ASSIGN = 284,
     MUL_ASSIGN = 285,
     DIV_ASSIGN = 286,
     CONCAT_ASSIGN = 287,
     BAND_ASSIGN = 288,
     BOR_ASSIGN = 289,
     BXOR_ASSIGN = 290,
     FDIV = 291,
     FDIV_ASSIGN = 292,
     MOD_ASSIGN = 293,
     SHR_ASSIGN = 294,
     SHL_ASSIGN = 295,
     SHR_U_ASSIGN = 296,
     SHIFT_LEFT = 297,
     SHIFT_RIGHT = 298,
     INTV = 299,
     FLOATV = 300,
     STRINGV = 301,
     PMCV = 302,
     OBJECTV = 303,
     LOG_XOR = 304,
     RELOP_EQ = 305,
     RELOP_NE = 306,
     RELOP_GT = 307,
     RELOP_GTE = 308,
     RELOP_LT = 309,
     RELOP_LTE = 310,
     GLOBAL = 311,
     GLOBALOP = 312,
     ADDR = 313,
     RESULT = 314,
     RETURN = 315,
     YIELDT = 316,
     POW = 317,
     SHIFT_RIGHT_U = 318,
     LOG_AND = 319,
     LOG_OR = 320,
     COMMA = 321,
     ESUB = 322,
     DOTDOT = 323,
     PCC_BEGIN = 324,
     PCC_END = 325,
     PCC_CALL = 326,
     PCC_SUB = 327,
     PCC_BEGIN_RETURN = 328,
     PCC_END_RETURN = 329,
     PCC_BEGIN_YIELD = 330,
     PCC_END_YIELD = 331,
     NCI_CALL = 332,
     METH_CALL = 333,
     INVOCANT = 334,
     MAIN = 335,
     LOAD = 336,
     IMMEDIATE = 337,
     POSTCOMP = 338,
     METHOD = 339,
     ANON = 340,
     MULTI = 341,
     LABEL = 342,
     EMIT = 343,
     EOM = 344,
     IREG = 345,
     NREG = 346,
     SREG = 347,
     PREG = 348,
     IDENTIFIER = 349,
     REG = 350,
     MACRO = 351,
     ENDM = 352,
     STRINGC = 353,
     INTC = 354,
     FLOATC = 355,
     USTRINGC = 356,
     PARROT_OP = 357,
     VAR = 358,
     LINECOMMENT = 359,
     FILECOMMENT = 360,
     DOT = 361,
     CONCAT = 362,
     POINTY = 363
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
#define CONST 279
#define INC 280
#define DEC 281
#define GLOBAL_CONST 282
#define PLUS_ASSIGN 283
#define MINUS_ASSIGN 284
#define MUL_ASSIGN 285
#define DIV_ASSIGN 286
#define CONCAT_ASSIGN 287
#define BAND_ASSIGN 288
#define BOR_ASSIGN 289
#define BXOR_ASSIGN 290
#define FDIV 291
#define FDIV_ASSIGN 292
#define MOD_ASSIGN 293
#define SHR_ASSIGN 294
#define SHL_ASSIGN 295
#define SHR_U_ASSIGN 296
#define SHIFT_LEFT 297
#define SHIFT_RIGHT 298
#define INTV 299
#define FLOATV 300
#define STRINGV 301
#define PMCV 302
#define OBJECTV 303
#define LOG_XOR 304
#define RELOP_EQ 305
#define RELOP_NE 306
#define RELOP_GT 307
#define RELOP_GTE 308
#define RELOP_LT 309
#define RELOP_LTE 310
#define GLOBAL 311
#define GLOBALOP 312
#define ADDR 313
#define RESULT 314
#define RETURN 315
#define YIELDT 316
#define POW 317
#define SHIFT_RIGHT_U 318
#define LOG_AND 319
#define LOG_OR 320
#define COMMA 321
#define ESUB 322
#define DOTDOT 323
#define PCC_BEGIN 324
#define PCC_END 325
#define PCC_CALL 326
#define PCC_SUB 327
#define PCC_BEGIN_RETURN 328
#define PCC_END_RETURN 329
#define PCC_BEGIN_YIELD 330
#define PCC_END_YIELD 331
#define NCI_CALL 332
#define METH_CALL 333
#define INVOCANT 334
#define MAIN 335
#define LOAD 336
#define IMMEDIATE 337
#define POSTCOMP 338
#define METHOD 339
#define ANON 340
#define MULTI 341
#define LABEL 342
#define EMIT 343
#define EOM 344
#define IREG 345
#define NREG 346
#define SREG 347
#define PREG 348
#define IDENTIFIER 349
#define REG 350
#define MACRO 351
#define ENDM 352
#define STRINGC 353
#define INTC 354
#define FLOATC 355
#define USTRINGC 356
#define PARROT_OP 357
#define VAR 358
#define LINECOMMENT 359
#define FILECOMMENT 360
#define DOT 361
#define CONCAT 362
#define POINTY 363




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
#line 604 "imcc/imcparser.c"
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
#line 625 "imcc/imcparser.c"

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
#define YYLAST   585

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  125
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  109
/* YYNRULES -- Number of rules. */
#define YYNRULES  292
/* YYNRULES -- Number of states. */
#define YYNSTATES  493

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   363

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   115,     2,     2,     2,   121,   122,     2,
     113,   114,   119,   118,     2,   116,     2,   120,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   124,
       2,   110,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   111,     2,   112,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   123,     2,   117,     2,     2,     2,
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
     106,   107,   108,   109
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    25,    27,    29,    33,    36,    39,    44,    48,
      54,    55,    62,    63,    70,    72,    75,    79,    82,    84,
      86,    88,    90,    91,    95,    99,   102,   103,   105,   106,
     111,   112,   114,   119,   120,   121,   122,   133,   134,   136,
     140,   141,   147,   148,   150,   155,   156,   160,   162,   164,
     166,   168,   170,   172,   173,   175,   176,   177,   178,   189,
     190,   200,   201,   204,   205,   209,   210,   212,   214,   218,
     220,   222,   224,   226,   228,   230,   232,   238,   242,   246,
     250,   254,   260,   266,   267,   271,   274,   275,   279,   283,
     284,   289,   290,   293,   295,   297,   299,   301,   303,   305,
     307,   308,   314,   316,   317,   320,   324,   328,   329,   335,
     336,   342,   343,   345,   349,   351,   354,   355,   358,   361,
     363,   365,   366,   368,   371,   373,   375,   379,   381,   385,
     387,   389,   392,   395,   396,   401,   402,   409,   411,   412,
     419,   422,   425,   428,   431,   433,   435,   437,   438,   440,
     442,   444,   446,   448,   450,   452,   456,   461,   466,   471,
     477,   483,   489,   495,   501,   507,   513,   519,   525,   531,
     537,   543,   549,   555,   561,   567,   573,   580,   587,   594,
     602,   607,   612,   619,   627,   632,   637,   642,   647,   654,
     662,   666,   667,   677,   679,   681,   685,   689,   693,   697,
     701,   705,   709,   713,   717,   721,   725,   729,   733,   737,
     742,   744,   746,   748,   752,   756,   760,   762,   764,   765,
     771,   772,   776,   778,   781,   782,   785,   787,   790,   794,
     796,   803,   810,   816,   822,   827,   832,   837,   842,   844,
     846,   848,   850,   852,   854,   856,   858,   859,   861,   865,
     867,   869,   874,   876,   878,   880,   882,   884,   886,   888,
     890,   892,   894,   895,   898,   900,   904,   905,   910,   912,
     916,   919,   922,   924,   926,   928,   930,   932,   934,   936,
     938,   940,   942
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     126,     0,    -1,   127,    -1,   128,    -1,   127,   128,    -1,
     145,    -1,   133,    -1,   132,    -1,   146,    -1,   158,    -1,
     142,    -1,    97,     4,    -1,   129,    -1,     4,    -1,     6,
     130,     4,    -1,   131,     4,    -1,     7,   100,    -1,     8,
      99,    67,    99,    -1,    57,   199,    95,    -1,    57,   199,
      95,   110,   232,    -1,    -1,    25,   134,   199,    95,   110,
     232,    -1,    -1,    25,   136,   100,   224,   110,    99,    -1,
     138,    -1,   137,   138,    -1,   190,   139,     4,    -1,    97,
       4,    -1,   106,    -1,   105,    -1,   145,    -1,   135,    -1,
      -1,   140,   103,   141,    -1,    73,   166,    88,    -1,    13,
     225,    -1,    -1,   218,    -1,    -1,    89,   143,   144,    90,
      -1,    -1,   137,    -1,    19,   111,   226,   112,    -1,    -1,
      -1,    -1,    22,   147,   221,   148,   166,     4,   149,   150,
     157,    68,    -1,    -1,     4,    -1,   150,   151,     4,    -1,
      -1,     5,   152,   199,    95,   175,    -1,    -1,    67,    -1,
      87,   113,   155,   114,    -1,    -1,   155,    67,   156,    -1,
     156,    -1,    45,    -1,    46,    -1,    48,    -1,    47,    -1,
      95,    -1,    -1,   187,    -1,    -1,    -1,    -1,    73,   159,
      95,   160,   166,     4,   161,   150,   157,    68,    -1,    -1,
      70,     4,   163,   170,   165,   169,   164,   172,    71,    -1,
      -1,   192,     4,    -1,    -1,    80,   225,     4,    -1,    -1,
     167,    -1,   168,    -1,   167,   153,   168,    -1,    82,    -1,
      81,    -1,    83,    -1,    84,    -1,    86,    -1,    85,    -1,
     154,    -1,    72,   225,    67,   225,     4,    -1,    72,   225,
       4,    -1,    78,   225,     4,    -1,    79,   217,     4,    -1,
      79,    99,     4,    -1,    79,   217,    67,   225,     4,    -1,
      79,    99,    67,   225,     4,    -1,    -1,   170,   171,     4,
      -1,    10,   210,    -1,    -1,   172,   173,     4,    -1,    60,
     217,   175,    -1,    -1,    24,   174,   199,    95,    -1,    -1,
     175,   176,    -1,    15,    -1,    16,    -1,    17,    -1,    74,
      -1,    76,    -1,    75,    -1,    77,    -1,    -1,   177,     4,
     180,   181,   178,    -1,   183,    -1,    -1,   181,     4,    -1,
     181,   182,     4,    -1,    61,   225,   211,    -1,    -1,    61,
     113,   184,   186,   114,    -1,    -1,    62,   113,   185,   186,
     114,    -1,    -1,   210,    -1,   186,    67,   210,    -1,   189,
      -1,   187,   189,    -1,    -1,   188,   193,    -1,    97,     4,
      -1,   106,    -1,   105,    -1,    -1,   191,    -1,   191,   192,
      -1,   192,    -1,    88,    -1,   190,   195,     4,    -1,    95,
      -1,   194,    67,    95,    -1,   201,    -1,   215,    -1,    19,
      95,    -1,    20,    95,    -1,    -1,    24,   196,   199,   194,
      -1,    -1,    25,   197,   199,    95,   110,   232,    -1,   135,
      -1,    -1,    28,   198,   199,    95,   110,   232,    -1,    61,
     207,    -1,     9,   223,    -1,   103,   218,    -1,    13,   225,
      -1,   207,    -1,   162,    -1,   179,    -1,    -1,    45,    -1,
      46,    -1,    47,    -1,    48,    -1,    49,    -1,   200,    -1,
      95,    -1,   217,   110,   225,    -1,   217,   110,   115,   225,
      -1,   217,   110,   116,   225,    -1,   217,   110,   117,   225,
      -1,   217,   110,   225,   118,   225,    -1,   217,   110,   225,
     116,   225,    -1,   217,   110,   225,   119,   225,    -1,   217,
     110,   225,    63,   225,    -1,   217,   110,   225,   120,   225,
      -1,   217,   110,   225,    37,   225,    -1,   217,   110,   225,
     121,   225,    -1,   217,   110,   225,   108,   225,    -1,   217,
     110,   225,    43,   225,    -1,   217,   110,   225,    44,   225,
      -1,   217,   110,   225,    64,   225,    -1,   217,   110,   225,
      65,   225,    -1,   217,   110,   225,    66,   225,    -1,   217,
     110,   225,    50,   225,    -1,   217,   110,   225,   122,   225,
      -1,   217,   110,   225,   123,   225,    -1,   217,   110,   225,
     117,   225,    -1,   217,   110,   225,   111,   226,   112,    -1,
     217,   111,   226,   112,   110,   225,    -1,   217,   110,    18,
     200,    67,   225,    -1,   217,   110,    18,   200,   111,   226,
     112,    -1,   217,   110,    18,   200,    -1,   217,   110,    18,
     225,    -1,   217,   110,    18,   225,    67,   225,    -1,   217,
     110,    18,   225,   111,   226,   112,    -1,   217,   110,    59,
      95,    -1,   217,   110,    58,   233,    -1,    58,   233,   110,
     225,    -1,    18,   217,    67,   225,    -1,    18,   217,    67,
     225,    67,   225,    -1,    18,   217,    67,   225,   111,   226,
     112,    -1,   217,   110,   207,    -1,    -1,   202,   113,   214,
     114,   110,   205,   113,   209,   114,    -1,   203,    -1,   204,
      -1,   217,   110,    13,    -1,   217,    29,   225,    -1,   217,
      30,   225,    -1,   217,    31,   225,    -1,   217,    32,   225,
      -1,   217,    39,   225,    -1,   217,    38,   225,    -1,   217,
      33,   225,    -1,   217,    34,   225,    -1,   217,    35,   225,
      -1,   217,    36,   225,    -1,   217,    40,   225,    -1,   217,
      41,   225,    -1,   217,    42,   225,    -1,   217,   110,   103,
     141,    -1,    95,    -1,    99,    -1,   217,    -1,   217,   206,
     222,    -1,   217,   206,    99,    -1,   217,   206,   217,    -1,
     109,    -1,   107,    -1,    -1,   205,   208,   113,   209,   114,
      -1,    -1,   209,    67,   210,    -1,   210,    -1,   225,   211,
      -1,    -1,   211,   212,    -1,    14,    -1,   217,   175,    -1,
     214,    67,   213,    -1,   213,    -1,    11,   225,   216,   225,
       9,   223,    -1,    12,   225,   216,   225,     9,   223,    -1,
      11,    13,   225,     9,   223,    -1,    12,    13,   225,     9,
     223,    -1,    11,   225,     9,   223,    -1,    12,   225,     9,
     223,    -1,    11,   225,    67,   223,    -1,    12,   225,    67,
     223,    -1,    51,    -1,    52,    -1,    53,    -1,    54,    -1,
      55,    -1,    56,    -1,   104,    -1,   231,    -1,    -1,   219,
      -1,   219,    67,   220,    -1,   220,    -1,   224,    -1,   217,
     111,   226,   112,    -1,   222,    -1,    99,    -1,    95,    -1,
     103,    -1,    95,    -1,   103,    -1,   223,    -1,   225,    -1,
     217,    -1,   232,    -1,    -1,   227,   228,    -1,   230,    -1,
     228,   124,   230,    -1,    -1,   228,    67,   229,   230,    -1,
     225,    -1,   225,    69,   225,    -1,    69,   225,    -1,   225,
      69,    -1,    91,    -1,    92,    -1,    93,    -1,    94,    -1,
      96,    -1,   100,    -1,   101,    -1,    99,    -1,   102,    -1,
      93,    -1,    99,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   386,   386,   390,   392,   395,   397,   398,   399,   400,
     401,   402,   403,   404,   407,   408,   411,   419,   430,   437,
     446,   445,   451,   450,   454,   456,   459,   461,   462,   463,
     464,   465,   468,   468,   472,   480,   482,   485,   490,   489,
     500,   502,   505,   523,   527,   530,   521,   535,   537,   538,
     542,   541,   547,   549,   553,   556,   558,   559,   562,   564,
     565,   566,   567,   579,   581,   585,   587,   591,   584,   598,
     596,   628,   630,   633,   635,   639,   641,   644,   646,   649,
     651,   652,   653,   654,   655,   656,   659,   665,   667,   672,
     674,   676,   680,   687,   689,   692,   697,   699,   702,   704,
     704,   708,   710,   713,   715,   716,   720,   722,   725,   727,
     732,   730,   736,   741,   743,   745,   749,   755,   753,   762,
     761,   770,   772,   773,   777,   779,   790,   794,   797,   798,
     799,   802,   804,   807,   809,   812,   818,   823,   831,   839,
     841,   842,   843,   844,   844,   857,   857,   859,   860,   860,
     862,   866,   867,   870,   872,   873,   874,   875,   878,   880,
     881,   882,   883,   884,   887,   898,   900,   901,   902,   903,
     904,   905,   906,   907,   908,   909,   910,   911,   913,   915,
     917,   919,   921,   923,   925,   927,   929,   931,   933,   935,
     937,   939,   941,   943,   945,   948,   950,   954,   956,   958,
     961,   968,   967,   976,   977,   978,   982,   985,   987,   989,
     991,   993,   995,   997,   999,  1001,  1003,  1005,  1007,  1011,
    1019,  1020,  1021,  1026,  1027,  1028,  1031,  1032,  1037,  1035,
    1045,  1047,  1048,  1051,  1055,  1057,  1060,  1064,  1067,  1069,
    1072,  1075,  1077,  1079,  1081,  1083,  1085,  1087,  1091,  1093,
    1094,  1095,  1096,  1097,  1100,  1102,  1105,  1107,  1110,  1112,
    1115,  1117,  1124,  1126,  1129,  1131,  1134,  1136,  1139,  1141,
    1144,  1146,  1149,  1149,  1153,  1155,  1157,  1157,  1161,  1167,
    1170,  1171,  1174,  1176,  1177,  1178,  1179,  1182,  1184,  1185,
    1186,  1189,  1191
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
  "CONST", "INC", "DEC", "GLOBAL_CONST", "PLUS_ASSIGN", "MINUS_ASSIGN", 
  "MUL_ASSIGN", "DIV_ASSIGN", "CONCAT_ASSIGN", "BAND_ASSIGN", 
  "BOR_ASSIGN", "BXOR_ASSIGN", "FDIV", "FDIV_ASSIGN", "MOD_ASSIGN", 
  "SHR_ASSIGN", "SHL_ASSIGN", "SHR_U_ASSIGN", "SHIFT_LEFT", "SHIFT_RIGHT", 
  "INTV", "FLOATV", "STRINGV", "PMCV", "OBJECTV", "LOG_XOR", "RELOP_EQ", 
  "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", "RELOP_LTE", "GLOBAL", 
  "GLOBALOP", "ADDR", "RESULT", "RETURN", "YIELDT", "POW", 
  "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", "DOTDOT", 
  "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB", "PCC_BEGIN_RETURN", 
  "PCC_END_RETURN", "PCC_BEGIN_YIELD", "PCC_END_YIELD", "NCI_CALL", 
  "METH_CALL", "INVOCANT", "MAIN", "LOAD", "IMMEDIATE", "POSTCOMP", 
  "METHOD", "ANON", "MULTI", "LABEL", "EMIT", "EOM", "IREG", "NREG", 
  "SREG", "PREG", "IDENTIFIER", "REG", "MACRO", "ENDM", "STRINGC", "INTC", 
  "FLOATC", "USTRINGC", "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", 
  "DOT", "CONCAT", "POINTY", "'='", "'['", "']'", "'('", "')'", "'!'", 
  "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", "'&'", "'|'", "';'", 
  "$accept", "program", "compilation_units", "compilation_unit", "pragma", 
  "pragma_1", "hll_def", "global", "constdef", "@1", "pmc_const", "@2", 
  "pasmcode", "pasmline", "pasm_inst", "@3", "pasm_args", "emit", "@4", 
  "opt_pasmcode", "class_namespace", "sub", "@5", "@6", "@7", 
  "sub_params", "sub_param", "@8", "opt_comma", "multi", "multi_types", 
  "multi_type", "sub_body", "pcc_sub", "@9", "@10", "@11", "pcc_sub_call", 
  "@12", "opt_label", "opt_invocant", "sub_proto", "sub_proto_list", 
  "proto", "pcc_call", "pcc_args", "pcc_arg", "pcc_results", "pcc_result", 
  "@13", "paramtype_list", "paramtype", "begin_ret_or_yield", 
  "end_ret_or_yield", "pcc_ret", "@14", "pcc_returns", "pcc_return", 
  "pcc_return_many", "@15", "@16", "var_returns", "statements", 
  "helper_clear_state", "statement", "labels", "_labels", "label", 
  "instruction", "id_list", "labeled_inst", "@17", "@18", "@19", "type", 
  "classname", "assignment", "@20", "op_assign", "func_assign", "the_sub", 
  "ptr", "sub_call", "@21", "arglist", "arg", "argtype_list", "argtype", 
  "result", "targetlist", "if_statement", "relop", "target", "vars", 
  "_vars", "_var_or_i", "sub_label_op_c", "sub_label_op", "label_op", 
  "var_or_i", "var", "keylist", "@22", "_keylist", "@23", "key", "reg", 
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
      61,    91,    93,    40,    41,    33,    45,   126,    43,    42,
      47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   125,   126,   127,   127,   128,   128,   128,   128,   128,
     128,   128,   128,   128,   129,   129,   130,   131,   132,   132,
     134,   133,   136,   135,   137,   137,   138,   138,   138,   138,
     138,   138,   140,   139,   139,   139,   139,   141,   143,   142,
     144,   144,   145,   147,   148,   149,   146,   150,   150,   150,
     152,   151,   153,   153,   154,   155,   155,   155,   156,   156,
     156,   156,   156,   157,   157,   159,   160,   161,   158,   163,
     162,   164,   164,   165,   165,   166,   166,   167,   167,   168,
     168,   168,   168,   168,   168,   168,   169,   169,   169,   169,
     169,   169,   169,   170,   170,   171,   172,   172,   173,   174,
     173,   175,   175,   176,   176,   176,   177,   177,   178,   178,
     180,   179,   179,   181,   181,   181,   182,   184,   183,   185,
     183,   186,   186,   186,   187,   187,   188,   189,   189,   189,
     189,   190,   190,   191,   191,   192,   193,   194,   194,   195,
     195,   195,   195,   196,   195,   197,   195,   195,   198,   195,
     195,   195,   195,   195,   195,   195,   195,   195,   199,   199,
     199,   199,   199,   199,   200,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   201,   201,   201,   201,   201,
     201,   202,   201,   201,   201,   201,   203,   203,   203,   203,
     203,   203,   203,   203,   203,   203,   203,   203,   203,   204,
     205,   205,   205,   205,   205,   205,   206,   206,   208,   207,
     209,   209,   209,   210,   211,   211,   212,   213,   214,   214,
     215,   215,   215,   215,   215,   215,   215,   215,   216,   216,
     216,   216,   216,   216,   217,   217,   218,   218,   219,   219,
     220,   220,   221,   221,   222,   222,   223,   223,   224,   224,
     225,   225,   227,   226,   228,   228,   229,   228,   230,   230,
     230,   230,   231,   231,   231,   231,   231,   232,   232,   232,
     232,   233,   233
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     3,     2,     2,     4,     3,     5,
       0,     6,     0,     6,     1,     2,     3,     2,     1,     1,
       1,     1,     0,     3,     3,     2,     0,     1,     0,     4,
       0,     1,     4,     0,     0,     0,    10,     0,     1,     3,
       0,     5,     0,     1,     4,     0,     3,     1,     1,     1,
       1,     1,     1,     0,     1,     0,     0,     0,    10,     0,
       9,     0,     2,     0,     3,     0,     1,     1,     3,     1,
       1,     1,     1,     1,     1,     1,     5,     3,     3,     3,
       3,     5,     5,     0,     3,     2,     0,     3,     3,     0,
       4,     0,     2,     1,     1,     1,     1,     1,     1,     1,
       0,     5,     1,     0,     2,     3,     3,     0,     5,     0,
       5,     0,     1,     3,     1,     2,     0,     2,     2,     1,
       1,     0,     1,     2,     1,     1,     3,     1,     3,     1,
       1,     2,     2,     0,     4,     0,     6,     1,     0,     6,
       2,     2,     2,     2,     1,     1,     1,     0,     1,     1,
       1,     1,     1,     1,     1,     3,     4,     4,     4,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     6,     6,     6,     7,
       4,     4,     6,     7,     4,     4,     4,     4,     6,     7,
       3,     0,     9,     1,     1,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     4,
       1,     1,     1,     3,     3,     3,     1,     1,     0,     5,
       0,     3,     1,     2,     0,     2,     1,     2,     3,     1,
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
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,     0,    43,    20,     0,    65,    38,
       0,     0,     2,     3,    12,     0,     7,     6,    10,     5,
       8,     9,     0,     0,     0,   272,     0,     0,   158,   159,
     160,   161,   162,   164,     0,   163,     0,   131,    11,     1,
       4,    15,    16,    14,     0,     0,     0,   264,   263,   265,
      44,   262,     0,    18,    66,    22,   135,     0,    29,    28,
      31,   131,    24,     0,    30,    32,   132,   134,    17,    42,
       0,   282,   283,   284,   285,   286,   289,   287,   288,   290,
     254,   270,   278,   273,   274,   255,   271,    75,     0,     0,
      75,     0,    27,    25,    39,     0,    75,     0,     0,   133,
     280,   281,   276,     0,    80,    79,    81,    82,    84,    83,
       0,    85,     0,    52,    77,     0,    19,     0,     0,    35,
       0,    26,   256,   279,     0,   275,    55,    45,    53,     0,
      21,    67,   266,   267,   268,     0,   269,    34,    33,   270,
      37,   257,   259,   260,   277,    58,    59,    61,    60,    62,
       0,    57,    47,    78,    47,     0,   272,     0,     0,    54,
      48,   126,   126,    23,     0,   258,    56,    50,     0,   130,
     129,     0,     0,   126,   131,   124,     0,   261,     0,   128,
      49,    46,   125,   157,   127,    68,     0,     0,     0,     0,
       0,     0,     0,     0,   143,   145,   148,     0,     0,     0,
       0,   106,   107,   220,   221,   256,   147,   155,     0,   156,
     112,     0,   139,     0,   203,   204,   228,   154,   140,   222,
     101,   151,     0,     0,     0,     0,   153,     0,   141,   142,
       0,     0,     0,   291,   292,     0,   117,   150,   222,   119,
      69,   152,   110,   136,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   227,
     226,     0,   272,     0,    51,     0,     0,   248,   249,   250,
     251,   252,   253,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   121,   121,    93,   113,   239,     0,
     101,   230,   206,   207,   208,   209,   212,   213,   214,   215,
     211,   210,   216,   217,   218,   205,     0,     0,     0,   289,
     256,     0,     0,     0,   200,   270,   165,     0,   224,   225,
     223,   103,   104,   105,   102,     0,   244,   246,     0,     0,
     245,   247,     0,   197,   137,   144,     0,     0,   196,     0,
     122,   234,     0,    73,     0,     0,     0,   237,     0,   232,
     190,   191,   195,   194,   219,   166,   167,   168,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   242,     0,   243,
       0,     0,   272,     0,     0,     0,     0,   118,   233,   120,
       0,     0,     0,     0,   114,     0,   108,   109,   111,     0,
     238,     0,     0,   229,     0,   272,     0,   272,   174,   177,
     178,   182,   172,   179,   180,   181,   176,     0,   170,   185,
     169,   171,   173,   175,   183,   184,     0,   240,   241,   198,
       0,   138,   146,   149,   123,   236,   235,    95,     0,     0,
       0,     0,    71,    94,   234,   115,     0,   231,   188,     0,
     192,     0,   186,   187,   199,    74,     0,     0,     0,     0,
      96,     0,   116,   230,   189,   193,    87,     0,    88,    90,
       0,    89,     0,     0,    72,     0,     0,     0,     0,    99,
       0,    70,     0,   202,    86,    92,    91,     0,   101,    97,
       0,    98,   100
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    11,    12,    13,    14,    23,    15,    16,    17,    27,
      60,    91,    61,    62,    97,    98,   138,    18,    37,    63,
      19,    20,    26,    87,   152,   161,   171,   178,   129,   111,
     150,   151,   172,    21,    36,    90,   154,   207,   286,   460,
     392,   112,   113,   114,   442,   343,   393,   473,   482,   487,
     264,   324,   208,   398,   209,   287,   344,   399,   210,   284,
     285,   339,   173,   174,   175,    65,    66,    67,   184,   335,
     211,   230,   231,   232,    34,    35,   212,   213,   214,   215,
     216,   263,   217,   245,   348,   340,   388,   436,   288,   289,
     218,   274,    81,   140,   141,   142,    50,    51,   134,   143,
     341,    45,    46,    83,   124,    84,    85,    86,   235
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -288
static const short yypact[] =
{
     167,  -288,    20,   -57,   -77,  -288,  -288,   -25,  -288,  -288,
      47,    60,   167,  -288,  -288,    63,  -288,  -288,  -288,  -288,
    -288,  -288,    25,   101,   -20,  -288,   -50,   -25,  -288,  -288,
    -288,  -288,  -288,  -288,    14,  -288,    42,    -9,  -288,  -288,
    -288,  -288,  -288,  -288,    27,    29,   414,  -288,  -288,  -288,
    -288,  -288,    44,    54,  -288,  -288,  -288,   163,  -288,  -288,
    -288,    50,  -288,    79,  -288,     4,    92,  -288,  -288,  -288,
     467,  -288,  -288,  -288,  -288,  -288,  -288,  -288,  -288,  -288,
    -288,  -288,   121,   -53,  -288,  -288,  -288,   352,    84,   127,
     352,    98,  -288,  -288,  -288,   467,   352,   195,    97,  -288,
    -288,   467,  -288,   414,  -288,  -288,  -288,  -288,  -288,  -288,
      89,  -288,   219,     1,  -288,   127,  -288,   228,   428,  -288,
     145,  -288,   428,  -288,   414,  -288,    88,  -288,  -288,   352,
    -288,  -288,  -288,  -288,  -288,   126,  -288,  -288,  -288,   130,
    -288,   170,  -288,  -288,  -288,  -288,  -288,  -288,  -288,  -288,
     -49,  -288,   238,  -288,   238,   146,  -288,   428,    88,  -288,
    -288,     6,     6,  -288,   132,  -288,  -288,  -288,   242,  -288,
    -288,   243,   180,   125,    92,  -288,   189,  -288,   -25,  -288,
    -288,  -288,  -288,   350,  -288,  -288,   164,   -63,   183,   212,
     467,   159,   166,   172,  -288,   162,  -288,   -37,   398,   152,
     264,  -288,  -288,  -288,  -288,   428,  -288,  -288,   265,  -288,
    -288,   274,  -288,   168,  -288,  -288,  -288,  -288,  -288,   446,
    -288,  -288,   467,   107,   467,   240,  -288,   213,  -288,  -288,
     -25,   -25,   -25,  -288,  -288,   176,  -288,  -288,   -70,  -288,
    -288,  -288,  -288,  -288,   159,   175,   467,   467,   467,   467,
     467,   467,   467,   467,   467,   467,   467,   467,   467,  -288,
    -288,    28,  -288,   253,   161,   280,   -63,  -288,  -288,  -288,
    -288,  -288,  -288,   -63,   467,   281,   -63,   -63,   467,   467,
     204,   205,   206,   467,   467,   467,  -288,  -288,  -288,   -42,
    -288,   467,  -288,  -288,  -288,  -288,  -288,  -288,  -288,  -288,
    -288,  -288,  -288,  -288,  -288,  -288,   442,   -37,   207,   196,
     428,   467,   467,   467,  -288,   -55,   351,   203,  -288,  -288,
    -288,  -288,  -288,  -288,  -288,   -63,  -288,  -288,   308,   -63,
    -288,  -288,   318,    -3,  -288,   269,   227,   229,  -288,   -41,
    -288,  -288,   -34,     5,    91,   159,   230,   161,   -23,  -288,
      43,    46,  -288,  -288,  -288,  -288,  -288,  -288,   467,   467,
     467,   467,   467,   467,   467,   467,   467,  -288,   467,   467,
     467,   467,   467,   467,   467,   467,   232,  -288,   -63,  -288,
     -63,   467,  -288,   248,   127,   127,   467,  -288,   324,  -288,
     467,   467,   109,   349,  -288,   467,  -288,  -288,  -288,   354,
    -288,   288,   467,  -288,   467,  -288,   467,  -288,  -288,  -288,
    -288,  -288,  -288,  -288,  -288,  -288,  -288,   255,  -288,  -288,
    -288,  -288,  -288,  -288,  -288,  -288,   467,  -288,  -288,  -288,
     259,  -288,  -288,  -288,  -288,  -288,  -288,  -288,   356,   467,
     467,   481,    92,  -288,  -288,  -288,   241,  -288,  -288,   260,
    -288,   261,  -288,  -288,  -288,  -288,     9,   361,    31,    32,
    -288,   372,   324,   467,  -288,  -288,  -288,   467,  -288,  -288,
     467,  -288,   467,   -12,  -288,   -10,   381,   386,   387,  -288,
     159,  -288,   389,  -288,  -288,  -288,  -288,   -25,  -288,  -288,
     301,   161,  -288
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -288,  -288,  -288,   385,  -288,  -288,  -288,  -288,  -288,  -288,
     215,  -288,  -288,   341,  -288,  -288,    93,  -288,  -288,  -288,
     -18,  -288,  -288,  -288,  -288,   250,  -288,  -288,  -288,  -288,
    -288,   247,   244,  -288,  -288,  -288,  -288,  -288,  -288,  -288,
    -288,    95,  -288,   278,  -288,  -288,  -288,  -288,  -288,  -288,
    -287,  -288,  -288,  -288,  -288,  -288,  -288,  -288,  -288,  -288,
    -288,   124,  -288,  -288,   237,   239,  -288,   -65,  -288,  -288,
    -288,  -288,  -288,  -288,   -27,   112,  -288,  -288,  -288,  -288,
      18,  -288,  -160,  -288,   -38,  -284,   -22,  -288,    76,  -288,
    -288,   198,   -91,   223,  -288,   272,  -288,   177,  -183,   313,
     -40,  -147,  -288,  -288,  -288,   -74,  -288,   -87,   140
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -223
static const short yytable[] =
{
      52,    99,   116,   347,   221,   -76,    82,   349,   -36,   164,
       4,   167,   479,   466,   102,   390,    55,    95,   158,    64,
      28,    29,    30,    31,    32,   345,   386,    22,   130,   125,
     100,   139,   132,   386,    25,   469,   471,   259,   237,   260,
     133,   305,    24,    64,   402,    47,   306,    44,   480,    48,
     144,    38,   259,    49,   260,   119,   233,   402,  -222,   481,
      39,   123,   234,    82,   381,   159,   139,    41,   128,     4,
      33,   103,   346,   387,   -63,    55,   467,    96,   136,    56,
     389,   -40,   136,   326,    82,   391,   307,   308,    57,   -76,
     327,   403,   219,   330,   331,   394,    58,    59,   470,   472,
     227,   314,   434,   168,   483,    43,   437,   238,   382,    53,
     404,   169,   170,   406,   139,   317,   266,   136,   447,    71,
      72,    73,    74,   203,    75,    42,    68,   309,    77,    78,
      79,   310,    80,   145,   146,   147,   148,    54,    56,    88,
     -41,    69,   377,   311,   312,   313,   379,    57,   223,   225,
     226,   186,   395,   290,   405,    58,    59,   407,   267,   268,
     269,   270,   271,   272,    89,   136,   396,    92,   397,    94,
     315,     1,   319,     2,   273,     3,   321,   322,   323,   349,
      56,   439,   265,   149,   275,   117,     4,   440,   441,     5,
     101,   120,     6,   -64,   115,   427,   222,   428,   118,   121,
     122,   491,   126,   280,   281,   282,   292,   293,   294,   295,
     296,   297,   298,   299,   300,   301,   302,   303,   304,   139,
     417,   316,   168,   127,     7,   224,    76,    77,    78,    79,
     169,   170,   131,   137,   328,   430,   155,   157,   332,   333,
       8,   156,   160,   338,   177,   163,   179,   180,   181,   276,
      71,    72,    73,    74,   290,    75,     9,   185,   449,   220,
     451,   228,   -22,    80,    10,   239,   351,   229,   240,   242,
     136,   355,   356,   357,    71,    72,    73,    74,   243,    75,
     279,   244,    76,    77,    78,    79,   283,    80,   291,   325,
     329,   267,   268,   269,   270,   271,   272,   432,   433,   334,
     336,   337,   353,    71,    72,    73,    74,   277,    75,  -221,
     238,    76,    77,    78,    79,   376,    80,   378,   408,   409,
     410,   411,   412,   413,   414,   415,   416,   380,   418,   419,
     420,   421,   422,   423,   424,   425,   383,   384,   435,   385,
     401,   429,   426,   431,    71,    72,    73,    74,    47,    75,
     459,   438,   318,   443,   463,   444,    49,    80,   445,   187,
     455,   188,   189,   190,   448,   468,   450,   452,   191,   192,
     193,   454,   464,   465,   194,   195,   474,   461,   196,    71,
      72,    73,    74,   203,    75,   484,   453,   204,   358,   488,
     485,   486,    80,   489,   359,   360,   492,    40,   206,   456,
     457,   361,    93,   354,   162,   166,   176,   153,   197,   342,
     182,   198,   199,   183,   362,   363,   364,   365,   350,   446,
     200,   400,   462,   278,   201,   475,   202,   476,   241,   165,
     477,   135,   478,   104,   105,   106,   107,   108,   109,   110,
     320,    71,    72,    73,    74,   203,    75,   352,     0,   204,
       0,     0,     0,   205,    80,     0,     0,     0,     0,   366,
     490,     0,   367,  -201,     0,     0,     0,   368,   369,   370,
     371,   372,   373,   374,   375,   246,   247,   248,   249,   250,
     251,   252,   253,    70,   254,   255,   256,   257,   258,    71,
      72,    73,    74,   203,    75,     0,     0,   204,     0,     0,
       0,     0,    80,     0,     0,    71,    72,    73,    74,     0,
      75,   236,     0,    76,    77,    78,    79,     0,    80,    71,
      72,    73,    74,   132,    75,     0,     0,    76,    77,    78,
      79,   133,    80,    71,    72,    73,    74,    33,    75,     0,
       0,    76,    77,    78,    79,     0,    80,     0,     0,     0,
       0,     0,     0,   259,     0,   260,   261,   262,    71,    72,
      73,    74,     0,    75,     0,     0,    76,    77,    78,    79,
       0,    80,    71,    72,    73,    74,     0,    75,     0,     0,
     458,     0,     0,     0,     0,    80
};

static const short yycheck[] =
{
      27,    66,    89,   290,   187,     4,    46,   291,     4,   156,
      19,     5,    24,     4,    67,    10,    25,    13,    67,    37,
      45,    46,    47,    48,    49,    67,    67,     7,   115,   103,
      70,   122,    95,    67,   111,     4,     4,   107,   198,   109,
     103,    13,    99,    61,    67,    95,    18,    67,    60,    99,
     124,     4,   107,   103,   109,    95,    93,    67,   113,    71,
       0,   101,    99,   103,    67,   114,   157,     4,    67,    19,
      95,   124,   114,   114,    68,    25,    67,    73,   118,    88,
     114,    90,   122,   266,   124,    80,    58,    59,    97,    88,
     273,   114,   183,   276,   277,     4,   105,   106,    67,    67,
     191,   261,   386,    97,   114,     4,   390,   198,   111,    95,
      67,   105,   106,    67,   205,   262,     9,   157,   402,    91,
      92,    93,    94,    95,    96,   100,    99,    99,   100,   101,
     102,   103,   104,    45,    46,    47,    48,    95,    88,    95,
      90,   112,   325,   115,   116,   117,   329,    97,   188,   189,
     190,   178,    61,   244,   111,   105,   106,   111,    51,    52,
      53,    54,    55,    56,   110,   205,    75,     4,    77,    90,
     261,     4,   263,     6,    67,     8,    15,    16,    17,   463,
      88,    72,   222,    95,   224,    90,    19,    78,    79,    22,
      69,    96,    25,    68,   110,   378,    13,   380,   100,     4,
     103,   488,   113,   230,   231,   232,   246,   247,   248,   249,
     250,   251,   252,   253,   254,   255,   256,   257,   258,   310,
     367,   261,    97,     4,    57,    13,    99,   100,   101,   102,
     105,   106,     4,    88,   274,   382,   110,    67,   278,   279,
      73,   111,     4,   283,   112,    99,     4,     4,    68,     9,
      91,    92,    93,    94,   345,    96,    89,    68,   405,    95,
     407,    95,   100,   104,    97,   113,   306,    95,     4,     4,
     310,   311,   312,   313,    91,    92,    93,    94,     4,    96,
      67,   113,    99,   100,   101,   102,   110,   104,   113,     9,
       9,    51,    52,    53,    54,    55,    56,   384,   385,    95,
      95,    95,    95,    91,    92,    93,    94,    67,    96,   113,
     401,    99,   100,   101,   102,   112,   104,     9,   358,   359,
     360,   361,   362,   363,   364,   365,   366,     9,   368,   369,
     370,   371,   372,   373,   374,   375,    67,   110,    14,   110,
     110,   381,   110,    95,    91,    92,    93,    94,    95,    96,
     441,   391,    99,     4,   113,   395,   103,   104,     4,     9,
       4,    11,    12,    13,   404,     4,   406,   112,    18,    19,
      20,   112,   112,   112,    24,    25,     4,   442,    28,    91,
      92,    93,    94,    95,    96,     4,   426,    99,    37,   480,
       4,     4,   104,     4,    43,    44,    95,    12,   183,   439,
     440,    50,    61,   310,   154,   158,   162,   129,    58,   285,
     173,    61,    62,   174,    63,    64,    65,    66,   306,   401,
      70,   345,   444,   225,    74,   463,    76,   467,   205,   157,
     470,   118,   472,    81,    82,    83,    84,    85,    86,    87,
     263,    91,    92,    93,    94,    95,    96,   307,    -1,    99,
      -1,    -1,    -1,   103,   104,    -1,    -1,    -1,    -1,   108,
     487,    -1,   111,   113,    -1,    -1,    -1,   116,   117,   118,
     119,   120,   121,   122,   123,    29,    30,    31,    32,    33,
      34,    35,    36,    69,    38,    39,    40,    41,    42,    91,
      92,    93,    94,    95,    96,    -1,    -1,    99,    -1,    -1,
      -1,    -1,   104,    -1,    -1,    91,    92,    93,    94,    -1,
      96,   113,    -1,    99,   100,   101,   102,    -1,   104,    91,
      92,    93,    94,    95,    96,    -1,    -1,    99,   100,   101,
     102,   103,   104,    91,    92,    93,    94,    95,    96,    -1,
      -1,    99,   100,   101,   102,    -1,   104,    -1,    -1,    -1,
      -1,    -1,    -1,   107,    -1,   109,   110,   111,    91,    92,
      93,    94,    -1,    96,    -1,    -1,    99,   100,   101,   102,
      -1,   104,    91,    92,    93,    94,    -1,    96,    -1,    -1,
      99,    -1,    -1,    -1,    -1,   104
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,    19,    22,    25,    57,    73,    89,
      97,   126,   127,   128,   129,   131,   132,   133,   142,   145,
     146,   158,     7,   130,    99,   111,   147,   134,    45,    46,
      47,    48,    49,    95,   199,   200,   159,   143,     4,     0,
     128,     4,   100,     4,    67,   226,   227,    95,    99,   103,
     221,   222,   199,    95,    95,    25,    88,    97,   105,   106,
     135,   137,   138,   144,   145,   190,   191,   192,    99,   112,
      69,    91,    92,    93,    94,    96,    99,   100,   101,   102,
     104,   217,   225,   228,   230,   231,   232,   148,    95,   110,
     160,   136,     4,   138,    90,    13,    73,   139,   140,   192,
     225,    69,    67,   124,    81,    82,    83,    84,    85,    86,
      87,   154,   166,   167,   168,   110,   232,   166,   100,   225,
     166,     4,   103,   225,   229,   230,   113,     4,    67,   153,
     232,     4,    95,   103,   223,   224,   225,    88,   141,   217,
     218,   219,   220,   224,   230,    45,    46,    47,    48,    95,
     155,   156,   149,   168,   161,   110,   111,    67,    67,   114,
       4,   150,   150,    99,   226,   220,   156,     5,    97,   105,
     106,   151,   157,   187,   188,   189,   157,   112,   152,     4,
       4,    68,   189,   190,   193,    68,   199,     9,    11,    12,
      13,    18,    19,    20,    24,    25,    28,    58,    61,    62,
      70,    74,    76,    95,    99,   103,   135,   162,   177,   179,
     183,   195,   201,   202,   203,   204,   205,   207,   215,   217,
      95,   223,    13,   225,    13,   225,   225,   217,    95,    95,
     196,   197,   198,    93,    99,   233,   113,   207,   217,   113,
       4,   218,     4,     4,   113,   208,    29,    30,    31,    32,
      33,    34,    35,    36,    38,    39,    40,    41,    42,   107,
     109,   110,   111,   206,   175,   225,     9,    51,    52,    53,
      54,    55,    56,    67,   216,   225,     9,    67,   216,    67,
     199,   199,   199,   110,   184,   185,   163,   180,   213,   214,
     217,   113,   225,   225,   225,   225,   225,   225,   225,   225,
     225,   225,   225,   225,   225,    13,    18,    58,    59,    99,
     103,   115,   116,   117,   207,   217,   225,   226,    99,   217,
     222,    15,    16,    17,   176,     9,   223,   223,   225,     9,
     223,   223,   225,   225,    95,   194,    95,    95,   225,   186,
     210,   225,   186,   170,   181,    67,   114,   175,   209,   210,
     200,   225,   233,    95,   141,   225,   225,   225,    37,    43,
      44,    50,    63,    64,    65,    66,   108,   111,   116,   117,
     118,   119,   120,   121,   122,   123,   112,   223,     9,   223,
       9,    67,   111,    67,   110,   110,    67,   114,   211,   114,
      10,    80,   165,   171,     4,    61,    75,    77,   178,   182,
     213,   110,    67,   114,    67,   111,    67,   111,   225,   225,
     225,   225,   225,   225,   225,   225,   225,   226,   225,   225,
     225,   225,   225,   225,   225,   225,   110,   223,   223,   225,
     226,    95,   232,   232,   210,    14,   212,   210,   225,    72,
      78,    79,   169,     4,   225,     4,   205,   210,   225,   226,
     225,   226,   112,   225,   112,     4,   225,   225,    99,   217,
     164,   192,   211,   113,   112,   112,     4,    67,     4,     4,
      67,     4,    67,   172,     4,   209,   225,   225,   225,    24,
      60,    71,   173,   114,     4,     4,     4,   174,   217,     4,
     199,   175,    95
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
#line 482 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 38:
#line 490 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 39:
#line 492 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 42:
#line 507 "imcc/imcc.y"
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

  case 43:
#line 523 "imcc/imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 44:
#line 527 "imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, yyvsp[0].sr);
        }
    break;

  case 45:
#line 530 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 46:
#line 532 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 47:
#line 536 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 48:
#line 537 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 49:
#line 538 "imcc/imcc.y"
    { add_pcc_param(cur_call, yyvsp[-1].sr);}
    break;

  case 50:
#line 542 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 51:
#line 543 "imcc/imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-2].t);
                                         is_def=0; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 52:
#line 548 "imcc/imcc.y"
    { yyval.t = 0;  }
    break;

  case 54:
#line 553 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 55:
#line 557 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 56:
#line 558 "imcc/imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); }
    break;

  case 57:
#line 559 "imcc/imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);}
    break;

  case 58:
#line 563 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 59:
#line 564 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 60:
#line 565 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 61:
#line 566 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 62:
#line 567 "imcc/imcc.y"
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

  case 65:
#line 585 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 66:
#line 587 "imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, yyvsp[0].s));

         }
    break;

  case 67:
#line 591 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 68:
#line 593 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 69:
#line 598 "imcc/imcc.y"
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

  case 70:
#line 625 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 71:
#line 629 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 72:
#line 630 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 73:
#line 634 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 74:
#line 636 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 75:
#line 640 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 77:
#line 645 "imcc/imcc.y"
    { yyval.t = yyvsp[0].t; }
    break;

  case 78:
#line 646 "imcc/imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; }
    break;

  case 79:
#line 650 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 80:
#line 651 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 81:
#line 652 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 82:
#line 653 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 83:
#line 654 "imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 84:
#line 655 "imcc/imcc.y"
    {  yyval.t = P_METHOD; }
    break;

  case 86:
#line 661 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 87:
#line 666 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 88:
#line 668 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-1].sr);
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 89:
#line 673 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 90:
#line 675 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 91:
#line 677 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 92:
#line 681 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 93:
#line 688 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 94:
#line 689 "imcc/imcc.y"
    {  add_pcc_arg(cur_call, yyvsp[-1].sr); }
    break;

  case 95:
#line 693 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 96:
#line 698 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 97:
#line 699 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(cur_call, yyvsp[-1].sr); }
    break;

  case 98:
#line 703 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 99:
#line 704 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 100:
#line 705 "imcc/imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 101:
#line 709 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 102:
#line 710 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 103:
#line 714 "imcc/imcc.y"
    {  yyval.t = VT_FLAT;   }
    break;

  case 104:
#line 715 "imcc/imcc.y"
    {  yyval.t = VT_OPTIONAL; }
    break;

  case 105:
#line 716 "imcc/imcc.y"
    {  yyval.t = VT_OPT_FLAG; }
    break;

  case 106:
#line 721 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 107:
#line 722 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 110:
#line 732 "imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 111:
#line 735 "imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 112:
#line 736 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 113:
#line 742 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 114:
#line 744 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 115:
#line 746 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 116:
#line 750 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 117:
#line 755 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 118:
#line 760 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 119:
#line 762 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 120:
#line 767 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 121:
#line 771 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 122:
#line 772 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 123:
#line 773 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 126:
#line 791 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 127:
#line 796 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 128:
#line 797 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 129:
#line 798 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 130:
#line 799 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 131:
#line 803 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 135:
#line 813 "imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 136:
#line 820 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 137:
#line 824 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 138:
#line 832 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 141:
#line 842 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 142:
#line 843 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 143:
#line 844 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 144:
#line 845 "imcc/imcc.y"
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

  case 145:
#line 857 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 146:
#line 858 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 148:
#line 860 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 149:
#line 861 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 150:
#line 862 "imcc/imcc.y"
    { yyval.i = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 151:
#line 866 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 152:
#line 868 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 153:
#line 871 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 154:
#line 872 "imcc/imcc.y"
    {  yyval.i = 0; cur_call = NULL; }
    break;

  case 155:
#line 873 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 157:
#line 875 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 158:
#line 879 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 159:
#line 880 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 160:
#line 881 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 161:
#line 882 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 162:
#line 883 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 163:
#line 884 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 164:
#line 889 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 165:
#line 899 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 166:
#line 900 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 167:
#line 901 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 168:
#line 902 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 169:
#line 903 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 170:
#line 904 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 171:
#line 905 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 172:
#line 906 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 173:
#line 907 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 174:
#line 908 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 175:
#line 909 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 176:
#line 910 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 177:
#line 912 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 178:
#line 914 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 179:
#line 916 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 180:
#line 918 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 181:
#line 920 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 182:
#line 922 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 183:
#line 924 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 926 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 185:
#line 928 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 930 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 187:
#line 932 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 934 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 189:
#line 936 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 190:
#line 938 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 191:
#line 940 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 942 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 193:
#line 944 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 194:
#line 946 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 195:
#line 949 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 196:
#line 951 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 197:
#line 955 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 957 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 959 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 200:
#line 962 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            cur_call = NULL;
            yyval.i = 0;
         }
    break;

  case 201:
#line 968 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 202:
#line 972 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           cur_call = NULL;
         }
    break;

  case 205:
#line 979 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[-2].sr); }
    break;

  case 206:
#line 984 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 986 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 208:
#line 988 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 990 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 210:
#line 992 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 211:
#line 994 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 996 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 213:
#line 998 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 214:
#line 1000 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 215:
#line 1002 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 216:
#line 1004 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 1006 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 218:
#line 1008 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1013 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 220:
#line 1019 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 221:
#line 1020 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 222:
#line 1021 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 223:
#line 1026 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 224:
#line 1027 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 225:
#line 1028 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 226:
#line 1031 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 227:
#line 1032 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 228:
#line 1037 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 229:
#line 1042 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 230:
#line 1046 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 231:
#line 1047 "imcc/imcc.y"
    {  yyval.sr = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 232:
#line 1048 "imcc/imcc.y"
    {  yyval.sr = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 233:
#line 1052 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 234:
#line 1056 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 235:
#line 1057 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 236:
#line 1061 "imcc/imcc.y"
    {  yyval.t = VT_FLAT; }
    break;

  case 237:
#line 1064 "imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 238:
#line 1068 "imcc/imcc.y"
    { yyval.sr = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 239:
#line 1069 "imcc/imcc.y"
    { yyval.sr = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 240:
#line 1074 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 241:
#line 1076 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 242:
#line 1078 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 243:
#line 1080 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 244:
#line 1082 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 245:
#line 1084 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 246:
#line 1086 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 247:
#line 1088 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 248:
#line 1092 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 249:
#line 1093 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 250:
#line 1094 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 251:
#line 1095 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 252:
#line 1096 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 253:
#line 1097 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 256:
#line 1106 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 257:
#line 1107 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 258:
#line 1111 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 260:
#line 1116 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 261:
#line 1118 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 263:
#line 1126 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 264:
#line 1130 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 265:
#line 1131 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 266:
#line 1135 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 267:
#line 1136 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 272:
#line 1149 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 273:
#line 1150 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 274:
#line 1154 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 275:
#line 1156 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 276:
#line 1157 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 277:
#line 1158 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 278:
#line 1162 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 279:
#line 1168 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 280:
#line 1170 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 281:
#line 1171 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 282:
#line 1175 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 283:
#line 1176 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 284:
#line 1177 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 285:
#line 1178 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 286:
#line 1179 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 287:
#line 1183 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 288:
#line 1184 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 289:
#line 1185 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 290:
#line 1186 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 291:
#line 1190 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 292:
#line 1191 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3424 "imcc/imcparser.c"

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


#line 1196 "imcc/imcc.y"



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

