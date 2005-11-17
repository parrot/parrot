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
#line 619 "imcc/imcparser.c"
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
#line 640 "imcc/imcparser.c"

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
#define YYLAST   583

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  127
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  110
/* YYNRULES -- Number of rules. */
#define YYNRULES  297
/* YYNRULES -- Number of states. */
#define YYNSTATES  508

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
     141,   145,   146,   152,   153,   155,   160,   165,   170,   171,
     175,   177,   179,   181,   183,   185,   187,   188,   190,   191,
     192,   193,   204,   205,   215,   216,   219,   220,   224,   225,
     227,   229,   233,   235,   237,   239,   241,   243,   245,   247,
     249,   255,   259,   263,   267,   271,   277,   283,   284,   288,
     291,   292,   296,   300,   301,   306,   307,   310,   312,   314,
     316,   318,   320,   322,   324,   325,   331,   333,   334,   337,
     341,   345,   346,   352,   353,   359,   360,   362,   366,   368,
     371,   372,   375,   378,   380,   382,   383,   385,   388,   390,
     392,   396,   398,   402,   404,   406,   409,   412,   413,   418,
     423,   424,   431,   433,   434,   441,   444,   447,   450,   453,
     455,   457,   459,   460,   462,   464,   466,   468,   470,   472,
     474,   478,   483,   488,   493,   499,   505,   511,   517,   523,
     529,   535,   541,   547,   553,   559,   565,   571,   577,   583,
     589,   595,   602,   609,   616,   624,   629,   634,   641,   649,
     654,   659,   664,   669,   676,   684,   688,   689,   699,   701,
     703,   707,   711,   715,   719,   723,   727,   731,   735,   739,
     743,   747,   751,   755,   759,   764,   766,   768,   770,   774,
     778,   782,   784,   786,   787,   793,   794,   798,   800,   803,
     804,   807,   809,   812,   816,   818,   825,   832,   838,   844,
     849,   854,   859,   864,   866,   868,   870,   872,   874,   876,
     878,   880,   881,   883,   887,   889,   891,   896,   898,   900,
     902,   904,   906,   908,   910,   912,   914,   916,   917,   920,
     922,   926,   927,   932,   934,   938,   941,   944,   946,   948,
     950,   952,   954,   956,   958,   960,   962,   964
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     128,     0,    -1,   129,    -1,   130,    -1,   129,   130,    -1,
     147,    -1,   135,    -1,   134,    -1,   148,    -1,   161,    -1,
     144,    -1,    99,     4,    -1,   131,    -1,     4,    -1,     6,
     132,     4,    -1,   133,     4,    -1,     7,   102,    -1,     8,
     101,    68,   101,    -1,    58,   202,    97,    -1,    58,   202,
      97,   112,   235,    -1,    -1,    26,   136,   202,    97,   112,
     235,    -1,    -1,    26,   138,   102,   227,   112,   101,    -1,
     140,    -1,   139,   140,    -1,   193,   141,     4,    -1,    99,
       4,    -1,   108,    -1,   107,    -1,   147,    -1,   137,    -1,
      -1,   142,   105,   143,    -1,    74,   169,    90,    -1,    13,
     228,    -1,    25,   101,    68,    98,    -1,    -1,   221,    -1,
      -1,    91,   145,   146,    92,    -1,    -1,   139,    -1,    19,
     113,   229,   114,    -1,    -1,    -1,    -1,    22,   149,   224,
     150,   169,     4,   151,   152,   160,    69,    -1,    -1,     4,
      -1,   152,   153,     4,    -1,    -1,     5,   154,   202,    97,
     178,    -1,    -1,    68,    -1,    89,   115,   158,   116,    -1,
      88,   115,   101,   116,    -1,    88,   115,    97,   116,    -1,
      -1,   158,    68,   159,    -1,   159,    -1,    46,    -1,    47,
      -1,    49,    -1,    48,    -1,    97,    -1,    -1,   190,    -1,
      -1,    -1,    -1,    74,   162,    97,   163,   169,     4,   164,
     152,   160,    69,    -1,    -1,    71,     4,   166,   173,   168,
     172,   167,   175,    72,    -1,    -1,   195,     4,    -1,    -1,
      81,   228,     4,    -1,    -1,   170,    -1,   171,    -1,   170,
     155,   171,    -1,    83,    -1,    82,    -1,    84,    -1,    85,
      -1,    87,    -1,    86,    -1,   156,    -1,   157,    -1,    73,
     228,    68,   228,     4,    -1,    73,   228,     4,    -1,    79,
     228,     4,    -1,    80,   220,     4,    -1,    80,   101,     4,
      -1,    80,   220,    68,   228,     4,    -1,    80,   101,    68,
     228,     4,    -1,    -1,   173,   174,     4,    -1,    10,   213,
      -1,    -1,   175,   176,     4,    -1,    61,   220,   178,    -1,
      -1,    24,   177,   202,    97,    -1,    -1,   178,   179,    -1,
      15,    -1,    16,    -1,    17,    -1,    75,    -1,    77,    -1,
      76,    -1,    78,    -1,    -1,   180,     4,   183,   184,   181,
      -1,   186,    -1,    -1,   184,     4,    -1,   184,   185,     4,
      -1,    62,   228,   214,    -1,    -1,    62,   115,   187,   189,
     116,    -1,    -1,    63,   115,   188,   189,   116,    -1,    -1,
     213,    -1,   189,    68,   213,    -1,   192,    -1,   190,   192,
      -1,    -1,   191,   196,    -1,    99,     4,    -1,   108,    -1,
     107,    -1,    -1,   194,    -1,   194,   195,    -1,   195,    -1,
      90,    -1,   193,   198,     4,    -1,    97,    -1,   197,    68,
      97,    -1,   204,    -1,   218,    -1,    19,    97,    -1,    20,
      97,    -1,    -1,    24,   199,   202,   197,    -1,    25,   101,
      68,   220,    -1,    -1,    26,   200,   202,    97,   112,   235,
      -1,   137,    -1,    -1,    29,   201,   202,    97,   112,   235,
      -1,    62,   210,    -1,     9,   226,    -1,   105,   221,    -1,
      13,   228,    -1,   210,    -1,   165,    -1,   182,    -1,    -1,
      46,    -1,    47,    -1,    48,    -1,    49,    -1,    50,    -1,
     203,    -1,    97,    -1,   220,   112,   228,    -1,   220,   112,
     117,   228,    -1,   220,   112,   118,   228,    -1,   220,   112,
     119,   228,    -1,   220,   112,   228,   120,   228,    -1,   220,
     112,   228,   118,   228,    -1,   220,   112,   228,   121,   228,
      -1,   220,   112,   228,    64,   228,    -1,   220,   112,   228,
     122,   228,    -1,   220,   112,   228,    38,   228,    -1,   220,
     112,   228,   123,   228,    -1,   220,   112,   228,   110,   228,
      -1,   220,   112,   228,    44,   228,    -1,   220,   112,   228,
      45,   228,    -1,   220,   112,   228,    65,   228,    -1,   220,
     112,   228,    66,   228,    -1,   220,   112,   228,    67,   228,
      -1,   220,   112,   228,    51,   228,    -1,   220,   112,   228,
     124,   228,    -1,   220,   112,   228,   125,   228,    -1,   220,
     112,   228,   119,   228,    -1,   220,   112,   228,   113,   229,
     114,    -1,   220,   113,   229,   114,   112,   228,    -1,   220,
     112,    18,   203,    68,   228,    -1,   220,   112,    18,   203,
     113,   229,   114,    -1,   220,   112,    18,   203,    -1,   220,
     112,    18,   228,    -1,   220,   112,    18,   228,    68,   228,
      -1,   220,   112,    18,   228,   113,   229,   114,    -1,   220,
     112,    60,    97,    -1,   220,   112,    59,   236,    -1,    59,
     236,   112,   228,    -1,    18,   220,    68,   228,    -1,    18,
     220,    68,   228,    68,   228,    -1,    18,   220,    68,   228,
     113,   229,   114,    -1,   220,   112,   210,    -1,    -1,   205,
     115,   217,   116,   112,   208,   115,   212,   116,    -1,   206,
      -1,   207,    -1,   220,   112,    13,    -1,   220,    30,   228,
      -1,   220,    31,   228,    -1,   220,    32,   228,    -1,   220,
      33,   228,    -1,   220,    40,   228,    -1,   220,    39,   228,
      -1,   220,    34,   228,    -1,   220,    35,   228,    -1,   220,
      36,   228,    -1,   220,    37,   228,    -1,   220,    41,   228,
      -1,   220,    42,   228,    -1,   220,    43,   228,    -1,   220,
     112,   105,   143,    -1,    97,    -1,   101,    -1,   220,    -1,
     220,   209,   225,    -1,   220,   209,   101,    -1,   220,   209,
     220,    -1,   111,    -1,   109,    -1,    -1,   208,   211,   115,
     212,   116,    -1,    -1,   212,    68,   213,    -1,   213,    -1,
     228,   214,    -1,    -1,   214,   215,    -1,    14,    -1,   220,
     178,    -1,   217,    68,   216,    -1,   216,    -1,    11,   228,
     219,   228,     9,   226,    -1,    12,   228,   219,   228,     9,
     226,    -1,    11,    13,   228,     9,   226,    -1,    12,    13,
     228,     9,   226,    -1,    11,   228,     9,   226,    -1,    12,
     228,     9,   226,    -1,    11,   228,    68,   226,    -1,    12,
     228,    68,   226,    -1,    52,    -1,    53,    -1,    54,    -1,
      55,    -1,    56,    -1,    57,    -1,   106,    -1,   234,    -1,
      -1,   222,    -1,   222,    68,   223,    -1,   223,    -1,   227,
      -1,   220,   113,   229,   114,    -1,   225,    -1,   101,    -1,
      97,    -1,   105,    -1,    97,    -1,   105,    -1,   226,    -1,
     228,    -1,   220,    -1,   235,    -1,    -1,   230,   231,    -1,
     233,    -1,   231,   126,   233,    -1,    -1,   231,    68,   232,
     233,    -1,   228,    -1,   228,    70,   228,    -1,    70,   228,
      -1,   228,    70,    -1,    93,    -1,    94,    -1,    95,    -1,
      96,    -1,    98,    -1,   102,    -1,   103,    -1,   101,    -1,
     104,    -1,    95,    -1,   101,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   397,   397,   401,   403,   406,   408,   409,   410,   411,
     412,   413,   414,   415,   418,   419,   422,   430,   441,   448,
     457,   456,   462,   461,   465,   467,   470,   472,   473,   474,
     475,   476,   479,   479,   483,   491,   493,   498,   501,   506,
     505,   516,   518,   521,   539,   543,   546,   537,   551,   553,
     554,   558,   557,   563,   565,   569,   572,   575,   580,   582,
     583,   586,   588,   589,   590,   591,   603,   605,   609,   611,
     615,   608,   622,   620,   652,   654,   657,   659,   663,   665,
     668,   670,   673,   675,   676,   677,   678,   679,   680,   681,
     684,   690,   692,   697,   699,   701,   705,   712,   714,   717,
     722,   724,   727,   729,   729,   733,   735,   738,   740,   741,
     745,   747,   750,   752,   757,   755,   761,   766,   768,   770,
     774,   780,   778,   787,   786,   795,   797,   798,   802,   804,
     815,   819,   822,   823,   824,   827,   829,   832,   834,   837,
     843,   848,   856,   864,   866,   867,   868,   869,   869,   882,
     886,   886,   888,   889,   889,   891,   895,   896,   899,   901,
     902,   903,   904,   907,   909,   910,   911,   912,   913,   916,
     927,   929,   930,   931,   932,   933,   934,   935,   936,   937,
     938,   939,   940,   942,   944,   946,   948,   950,   952,   954,
     956,   958,   960,   962,   964,   966,   968,   970,   972,   974,
     977,   979,   983,   985,   987,   990,   997,   996,  1005,  1006,
    1007,  1011,  1014,  1016,  1018,  1020,  1022,  1024,  1026,  1028,
    1030,  1032,  1034,  1036,  1040,  1048,  1049,  1050,  1055,  1056,
    1057,  1060,  1061,  1066,  1064,  1074,  1076,  1077,  1080,  1084,
    1086,  1089,  1093,  1096,  1098,  1101,  1104,  1106,  1108,  1110,
    1112,  1114,  1116,  1120,  1122,  1123,  1124,  1125,  1126,  1129,
    1131,  1134,  1136,  1139,  1141,  1144,  1146,  1153,  1155,  1158,
    1160,  1163,  1165,  1168,  1170,  1173,  1175,  1178,  1178,  1182,
    1184,  1186,  1186,  1190,  1196,  1199,  1200,  1203,  1205,  1206,
    1207,  1208,  1211,  1213,  1214,  1215,  1218,  1220
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
  "outer", "multi_types", "multi_type", "sub_body", "pcc_sub", "@9", 
  "@10", "@11", "pcc_sub_call", "@12", "opt_label", "opt_invocant", 
  "sub_proto", "sub_proto_list", "proto", "pcc_call", "pcc_args", 
  "pcc_arg", "pcc_results", "pcc_result", "@13", "paramtype_list", 
  "paramtype", "begin_ret_or_yield", "end_ret_or_yield", "pcc_ret", "@14", 
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
     152,   154,   153,   155,   155,   156,   157,   157,   158,   158,
     158,   159,   159,   159,   159,   159,   160,   160,   162,   163,
     164,   161,   166,   165,   167,   167,   168,   168,   169,   169,
     170,   170,   171,   171,   171,   171,   171,   171,   171,   171,
     172,   172,   172,   172,   172,   172,   172,   173,   173,   174,
     175,   175,   176,   177,   176,   178,   178,   179,   179,   179,
     180,   180,   181,   181,   183,   182,   182,   184,   184,   184,
     185,   187,   186,   188,   186,   189,   189,   189,   190,   190,
     191,   192,   192,   192,   192,   193,   193,   194,   194,   195,
     196,   197,   197,   198,   198,   198,   198,   199,   198,   198,
     200,   198,   198,   201,   198,   198,   198,   198,   198,   198,
     198,   198,   198,   202,   202,   202,   202,   202,   202,   203,
     204,   204,   204,   204,   204,   204,   204,   204,   204,   204,
     204,   204,   204,   204,   204,   204,   204,   204,   204,   204,
     204,   204,   204,   204,   204,   204,   204,   204,   204,   204,
     204,   204,   204,   204,   204,   204,   205,   204,   204,   204,
     204,   206,   206,   206,   206,   206,   206,   206,   206,   206,
     206,   206,   206,   206,   207,   208,   208,   208,   208,   208,
     208,   209,   209,   211,   210,   212,   212,   212,   213,   214,
     214,   215,   216,   217,   217,   218,   218,   218,   218,   218,
     218,   218,   218,   219,   219,   219,   219,   219,   219,   220,
     220,   221,   221,   222,   222,   223,   223,   224,   224,   225,
     225,   226,   226,   227,   227,   228,   228,   230,   229,   231,
     231,   232,   231,   233,   233,   233,   233,   234,   234,   234,
     234,   234,   235,   235,   235,   235,   236,   236
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     3,     2,     2,     4,     3,     5,
       0,     6,     0,     6,     1,     2,     3,     2,     1,     1,
       1,     1,     0,     3,     3,     2,     4,     0,     1,     0,
       4,     0,     1,     4,     0,     0,     0,    10,     0,     1,
       3,     0,     5,     0,     1,     4,     4,     4,     0,     3,
       1,     1,     1,     1,     1,     1,     0,     1,     0,     0,
       0,    10,     0,     9,     0,     2,     0,     3,     0,     1,
       1,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       5,     3,     3,     3,     3,     5,     5,     0,     3,     2,
       0,     3,     3,     0,     4,     0,     2,     1,     1,     1,
       1,     1,     1,     1,     0,     5,     1,     0,     2,     3,
       3,     0,     5,     0,     5,     0,     1,     3,     1,     2,
       0,     2,     2,     1,     1,     0,     1,     2,     1,     1,
       3,     1,     3,     1,     1,     2,     2,     0,     4,     4,
       0,     6,     1,     0,     6,     2,     2,     2,     2,     1,
       1,     1,     0,     1,     1,     1,     1,     1,     1,     1,
       3,     4,     4,     4,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     6,     6,     6,     7,     4,     4,     6,     7,     4,
       4,     4,     4,     6,     7,     3,     0,     9,     1,     1,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     4,     1,     1,     1,     3,     3,
       3,     1,     1,     0,     5,     0,     3,     1,     2,     0,
       2,     1,     2,     3,     1,     6,     6,     5,     5,     4,
       4,     4,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     0,     1,     3,     1,     1,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     0,     2,     1,
       3,     0,     4,     1,     3,     2,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,     0,    44,    20,     0,    68,    39,
       0,     0,     2,     3,    12,     0,     7,     6,    10,     5,
       8,     9,     0,     0,     0,   277,     0,     0,   163,   164,
     165,   166,   167,   169,     0,   168,     0,   135,    11,     1,
       4,    15,    16,    14,     0,     0,     0,   269,   268,   270,
      45,   267,     0,    18,    69,    22,   139,     0,    29,    28,
      31,   135,    24,     0,    30,    32,   136,   138,    17,    43,
       0,   287,   288,   289,   290,   291,   294,   292,   293,   295,
     259,   275,   283,   278,   279,   260,   276,    78,     0,     0,
      78,     0,    27,    25,    40,     0,     0,    78,     0,     0,
     137,   285,   286,   281,     0,    83,    82,    84,    85,    87,
      86,     0,     0,    88,    89,     0,    53,    80,     0,    19,
       0,     0,    35,     0,     0,    26,   261,   284,     0,   280,
       0,    58,    46,    54,     0,    21,    70,   271,   272,   273,
       0,   274,     0,    34,    33,   275,    38,   262,   264,   265,
     282,     0,     0,    61,    62,    64,    63,    65,     0,    60,
      48,    81,    48,     0,    36,   277,     0,    57,    56,     0,
      55,    49,   130,   130,    23,     0,   263,    59,    51,     0,
     134,   133,     0,     0,   130,   135,   128,     0,   266,     0,
     132,    50,    47,   129,   162,   131,    71,     0,     0,     0,
       0,     0,     0,     0,     0,   147,     0,   150,   153,     0,
       0,     0,     0,   110,   111,   225,   226,   261,   152,   160,
       0,   161,   116,     0,   143,     0,   208,   209,   233,   159,
     144,   227,   105,   156,     0,     0,     0,     0,   158,     0,
     145,   146,     0,     0,     0,     0,   296,   297,     0,   121,
     155,   227,   123,    72,   157,   114,   140,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   232,   231,     0,   277,     0,    52,     0,     0,
     253,   254,   255,   256,   257,   258,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   125,   125,
      97,   117,   244,     0,   105,   235,   211,   212,   213,   214,
     217,   218,   219,   220,   216,   215,   221,   222,   223,   210,
       0,     0,     0,   294,   261,     0,     0,     0,   205,   275,
     170,     0,   229,   230,   228,   107,   108,   109,   106,     0,
     249,   251,     0,     0,   250,   252,     0,   202,   141,   148,
     149,     0,     0,   201,     0,   126,   239,     0,    76,     0,
       0,     0,   242,     0,   237,   195,   196,   200,   199,   224,
     171,   172,   173,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   277,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   247,     0,   248,     0,     0,   277,     0,     0,
       0,     0,   122,   238,   124,     0,     0,     0,     0,   118,
       0,   112,   113,   115,     0,   243,     0,     0,   234,     0,
     277,     0,   277,   179,   182,   183,   187,   177,   184,   185,
     186,   181,     0,   175,   190,   174,   176,   178,   180,   188,
     189,     0,   245,   246,   203,     0,   142,   151,   154,   127,
     241,   240,    99,     0,     0,     0,     0,    74,    98,   239,
     119,     0,   236,   193,     0,   197,     0,   191,   192,   204,
      77,     0,     0,     0,     0,   100,     0,   120,   235,   194,
     198,    91,     0,    92,    94,     0,    93,     0,     0,    75,
       0,     0,     0,     0,   103,     0,    73,     0,   207,    90,
      96,    95,     0,   105,   101,     0,   102,   104
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    11,    12,    13,    14,    23,    15,    16,    17,    27,
      60,    91,    61,    62,    98,    99,   144,    18,    37,    63,
      19,    20,    26,    87,   160,   172,   182,   189,   134,   113,
     114,   158,   159,   183,    21,    36,    90,   162,   219,   300,
     475,   407,   115,   116,   117,   457,   358,   408,   488,   497,
     502,   277,   338,   220,   413,   221,   301,   359,   414,   222,
     298,   299,   354,   184,   185,   186,    65,    66,    67,   195,
     349,   223,   242,   244,   245,    34,    35,   224,   225,   226,
     227,   228,   276,   229,   258,   363,   355,   403,   451,   302,
     303,   230,   287,    81,   146,   147,   148,    50,    51,   139,
     149,   356,    45,    46,    83,   128,    84,    85,    86,   248
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -301
static const short yypact[] =
{
      13,  -301,    20,   -45,   -46,  -301,  -301,   162,  -301,  -301,
      66,    79,    13,  -301,  -301,    92,  -301,  -301,  -301,  -301,
    -301,  -301,    -1,   129,    68,  -301,    71,   162,  -301,  -301,
    -301,  -301,  -301,  -301,    50,  -301,    53,   -10,  -301,  -301,
    -301,  -301,  -301,  -301,    73,    55,   204,  -301,  -301,  -301,
    -301,  -301,    74,    75,  -301,  -301,  -301,   174,  -301,  -301,
    -301,    59,  -301,    94,  -301,    96,   105,  -301,  -301,  -301,
     259,  -301,  -301,  -301,  -301,  -301,  -301,  -301,  -301,  -301,
    -301,  -301,   127,   -58,  -301,  -301,  -301,   428,    87,   175,
     428,    99,  -301,  -301,  -301,   259,   115,   428,   202,   102,
    -301,  -301,   259,  -301,   204,  -301,  -301,  -301,  -301,  -301,
    -301,   118,   128,  -301,  -301,   238,     9,  -301,   175,  -301,
     242,   224,  -301,   199,   170,  -301,   224,  -301,   204,  -301,
     -61,   -24,  -301,  -301,   428,  -301,  -301,  -301,  -301,  -301,
     157,  -301,   172,  -301,  -301,   181,  -301,   227,  -301,  -301,
    -301,   180,   185,  -301,  -301,  -301,  -301,  -301,   -56,  -301,
     299,  -301,   299,   208,  -301,  -301,   224,  -301,  -301,   -24,
    -301,  -301,     6,     6,  -301,   197,  -301,  -301,  -301,   310,
    -301,  -301,   311,   247,   106,   105,  -301,   254,  -301,   162,
    -301,  -301,  -301,  -301,   364,  -301,  -301,   234,   -39,    36,
     160,   259,   338,   235,   245,  -301,   250,   256,  -301,    16,
     315,   244,   363,  -301,  -301,  -301,  -301,   224,  -301,  -301,
     365,  -301,  -301,   367,  -301,   253,  -301,  -301,  -301,  -301,
    -301,    11,  -301,  -301,   259,   136,   259,   236,  -301,   304,
    -301,  -301,   162,   306,   162,   162,  -301,  -301,   268,  -301,
    -301,    46,  -301,  -301,  -301,  -301,  -301,   338,   263,   259,
     259,   259,   259,   259,   259,   259,   259,   259,   259,   259,
     259,   259,  -301,  -301,   389,  -301,   143,   266,   376,   -39,
    -301,  -301,  -301,  -301,  -301,  -301,   -39,   259,   377,   -39,
     -39,   259,   259,   290,   338,   294,   297,   259,   259,   259,
    -301,  -301,  -301,   -53,  -301,   259,  -301,  -301,  -301,  -301,
    -301,  -301,  -301,  -301,  -301,  -301,  -301,  -301,  -301,  -301,
     433,    16,   298,   281,   224,   259,   259,   259,  -301,    70,
     458,   283,  -301,  -301,  -301,  -301,  -301,  -301,  -301,   -39,
    -301,  -301,   390,   -39,  -301,  -301,   391,   -54,  -301,   330,
    -301,   292,   293,  -301,    38,  -301,  -301,    40,    -5,    65,
     338,   305,   266,    48,  -301,   -48,   -30,  -301,  -301,  -301,
    -301,  -301,  -301,   259,   259,   259,   259,   259,   259,   259,
     259,   259,  -301,   259,   259,   259,   259,   259,   259,   259,
     259,   307,  -301,   -39,  -301,   -39,   259,  -301,   309,   175,
     175,   259,  -301,   404,  -301,   259,   259,   192,   416,  -301,
     259,  -301,  -301,  -301,   418,  -301,   447,   259,  -301,   259,
    -301,   259,  -301,  -301,  -301,  -301,  -301,  -301,  -301,  -301,
    -301,  -301,   314,  -301,  -301,  -301,  -301,  -301,  -301,  -301,
    -301,   259,  -301,  -301,  -301,   323,  -301,  -301,  -301,  -301,
    -301,  -301,  -301,   420,   259,   259,   456,   105,  -301,  -301,
    -301,   325,  -301,  -301,   324,  -301,   329,  -301,  -301,  -301,
    -301,     4,   421,    22,    24,  -301,   425,   404,   259,  -301,
    -301,  -301,   259,  -301,  -301,   259,  -301,   259,    91,  -301,
      67,   442,   446,   448,  -301,   338,  -301,   449,  -301,  -301,
    -301,  -301,   162,  -301,  -301,   354,   266,  -301
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -301,  -301,  -301,   443,  -301,  -301,  -301,  -301,  -301,  -301,
     260,  -301,  -301,   395,  -301,  -301,   139,  -301,  -301,  -301,
      -4,  -301,  -301,  -301,  -301,   302,  -301,  -301,  -301,  -301,
    -301,  -301,   303,   295,  -301,  -301,  -301,  -301,  -301,  -301,
    -301,  -301,    56,  -301,   332,  -301,  -301,  -301,  -301,  -301,
    -301,  -300,  -301,  -301,  -301,  -301,  -301,  -301,  -301,  -301,
    -301,  -301,   168,  -301,  -301,   287,   288,  -301,   -65,  -301,
    -301,  -301,  -301,  -301,  -301,   -27,   154,  -301,  -301,  -301,
    -301,    60,  -301,  -181,  -301,     0,  -298,    18,  -301,   120,
    -301,  -301,   251,   -92,   264,  -301,   331,  -301,   213,  -195,
     378,   -40,  -147,  -301,  -301,  -301,   -67,  -301,   -87,   177
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -228
static const short yytable[] =
{
      52,   100,   119,   233,   362,   405,    82,   364,   481,     4,
     103,   178,   169,   -79,   396,   360,    55,     1,   175,     2,
     419,     3,   153,   154,   155,   156,   484,    22,   486,   250,
     101,   135,     4,    64,   145,     5,   151,   129,   421,     6,
     152,   259,   260,   261,   262,   263,   264,   265,   266,   234,
     267,   268,   269,   270,   271,   122,    24,    64,   137,   397,
     170,   150,   127,   361,    82,   420,   138,    25,   104,   409,
      38,     7,   482,   157,   145,   -66,   406,   133,     4,    39,
      56,   141,   -41,   422,   340,    55,   141,     8,    82,    57,
     485,   341,   487,   328,   344,   345,    41,    58,    59,   -79,
     -37,    42,   231,   449,     9,   179,   401,   452,   401,    95,
     239,   246,    10,   180,   181,   494,   417,   247,   251,   462,
     272,    96,   273,   274,   275,   145,   141,   410,   331,    71,
      72,    73,    74,    43,    75,   417,    44,    76,    77,    78,
      79,   411,    80,   412,   392,   279,   120,    53,   394,    56,
      54,   -42,   495,   124,   402,   272,   404,   273,    57,   235,
     237,   238,   197,   496,   418,   304,    58,    59,    47,    69,
      97,    88,    48,   236,    68,   -67,    49,   141,    92,   272,
     364,   273,   329,   498,   333,  -227,    94,    89,   280,   281,
     282,   283,   284,   285,   278,    56,   288,   102,   442,   118,
     443,   121,   350,   506,   286,   179,   125,   126,    28,    29,
      30,    31,    32,   180,   181,   293,   123,   295,   296,   306,
     307,   308,   309,   310,   311,   312,   313,   314,   315,   316,
     317,   318,   145,   130,   330,   432,    71,    72,    73,    74,
      47,    75,   132,   131,   332,   289,   136,   342,    49,    80,
     445,   346,   347,    71,    72,    73,    74,   353,    75,    33,
     143,    76,    77,    78,    79,   454,    80,   142,   304,   163,
     164,   455,   456,   464,    70,   466,    76,    77,    78,    79,
     366,   335,   336,   337,   141,   370,   371,   372,   280,   281,
     282,   283,   284,   285,   165,   166,   167,    71,    72,    73,
      74,   168,    75,   171,   290,    76,    77,    78,    79,   174,
      80,   188,   447,   448,   190,   191,   192,    71,    72,    73,
      74,   137,    75,   196,   251,    76,    77,    78,    79,   138,
      80,   232,   240,   423,   424,   425,   426,   427,   428,   429,
     430,   431,   241,   433,   434,   435,   436,   437,   438,   439,
     440,   243,    71,    72,    73,    74,   444,    75,   -22,   252,
      76,    77,    78,    79,   474,    80,   453,   253,   257,   255,
     459,   256,   292,   198,   294,   199,   200,   201,   305,   463,
     297,   465,   202,   203,   204,   339,   343,   348,   205,   206,
     207,   351,   476,   208,   352,   368,  -226,   391,   398,   393,
     395,   468,   319,   503,   399,   400,   446,   320,    71,    72,
      73,    74,   215,    75,   471,   472,   216,   416,   450,   441,
     458,    80,   460,   209,   470,   483,   210,   211,   467,   489,
     249,    71,    72,    73,    74,   212,    75,   469,   479,   213,
     478,   214,   491,   480,    80,   492,   499,   493,   321,   322,
     500,   507,   501,   504,   218,    40,    93,    71,    72,    73,
      74,   215,    75,   369,   173,   216,   161,   357,   187,   217,
      80,   193,   177,   194,   365,   505,   461,   477,   490,  -206,
     415,   254,    71,    72,    73,    74,   215,    75,   291,   334,
     323,    77,    78,    79,   324,    80,   373,   176,   367,   140,
       0,     0,   374,   375,     0,     0,   325,   326,   327,   376,
     105,   106,   107,   108,   109,   110,   111,   112,     0,     0,
       0,     0,   377,   378,   379,   380,    71,    72,    73,    74,
      33,    75,     0,     0,    76,    77,    78,    79,     0,    80,
      71,    72,    73,    74,   215,    75,     0,     0,   216,    71,
      72,    73,    74,    80,    75,     0,     0,   473,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,   381,     0,
       0,   382,     0,     0,     0,     0,   383,   384,   385,   386,
     387,   388,   389,   390
};

static const short yycheck[] =
{
      27,    66,    89,   198,   304,    10,    46,   305,     4,    19,
      68,     5,    68,     4,    68,    68,    26,     4,   165,     6,
      68,     8,    46,    47,    48,    49,     4,     7,     4,   210,
      70,   118,    19,    37,   126,    22,    97,   104,    68,    26,
     101,    30,    31,    32,    33,    34,    35,    36,    37,    13,
      39,    40,    41,    42,    43,    95,   101,    61,    97,   113,
     116,   128,   102,   116,   104,   113,   105,   113,   126,     4,
       4,    58,    68,    97,   166,    69,    81,    68,    19,     0,
      90,   121,    92,   113,   279,    26,   126,    74,   128,    99,
      68,   286,    68,   274,   289,   290,     4,   107,   108,    90,
       4,   102,   194,   401,    91,    99,    68,   405,    68,    13,
     202,    95,    99,   107,   108,    24,    68,   101,   210,   417,
     109,    25,   111,   112,   113,   217,   166,    62,   275,    93,
      94,    95,    96,     4,    98,    68,    68,   101,   102,   103,
     104,    76,   106,    78,   339,     9,    90,    97,   343,    90,
      97,    92,    61,    97,   116,   109,   116,   111,    99,   199,
     200,   201,   189,    72,   116,   257,   107,   108,    97,   114,
      74,    97,   101,    13,   101,    69,   105,   217,     4,   109,
     478,   111,   274,   116,   276,   115,    92,   112,    52,    53,
      54,    55,    56,    57,   234,    90,   236,    70,   393,   112,
     395,   102,   294,   503,    68,    99,     4,   105,    46,    47,
      48,    49,    50,   107,   108,   242,   101,   244,   245,   259,
     260,   261,   262,   263,   264,   265,   266,   267,   268,   269,
     270,   271,   324,   115,   274,   382,    93,    94,    95,    96,
      97,    98,     4,   115,   101,     9,     4,   287,   105,   106,
     397,   291,   292,    93,    94,    95,    96,   297,    98,    97,
      90,   101,   102,   103,   104,    73,   106,    68,   360,   112,
      98,    79,    80,   420,    70,   422,   101,   102,   103,   104,
     320,    15,    16,    17,   324,   325,   326,   327,    52,    53,
      54,    55,    56,    57,   113,    68,   116,    93,    94,    95,
      96,   116,    98,     4,    68,   101,   102,   103,   104,   101,
     106,   114,   399,   400,     4,     4,    69,    93,    94,    95,
      96,    97,    98,    69,   416,   101,   102,   103,   104,   105,
     106,    97,    97,   373,   374,   375,   376,   377,   378,   379,
     380,   381,    97,   383,   384,   385,   386,   387,   388,   389,
     390,   101,    93,    94,    95,    96,   396,    98,   102,   115,
     101,   102,   103,   104,   456,   106,   406,     4,   115,     4,
     410,     4,    68,     9,    68,    11,    12,    13,   115,   419,
     112,   421,    18,    19,    20,     9,     9,    97,    24,    25,
      26,    97,   457,    29,    97,    97,   115,   114,    68,     9,
       9,   441,    13,   495,   112,   112,    97,    18,    93,    94,
      95,    96,    97,    98,   454,   455,   101,   112,    14,   112,
       4,   106,     4,    59,     4,     4,    62,    63,   114,     4,
     115,    93,    94,    95,    96,    71,    98,   114,   114,    75,
     115,    77,   482,   114,   106,   485,     4,   487,    59,    60,
       4,    97,     4,     4,   194,    12,    61,    93,    94,    95,
      96,    97,    98,   324,   162,   101,   134,   299,   173,   105,
     106,   184,   169,   185,   320,   502,   416,   459,   478,   115,
     360,   217,    93,    94,    95,    96,    97,    98,   237,   276,
     101,   102,   103,   104,   105,   106,    38,   166,   321,   121,
      -1,    -1,    44,    45,    -1,    -1,   117,   118,   119,    51,
      82,    83,    84,    85,    86,    87,    88,    89,    -1,    -1,
      -1,    -1,    64,    65,    66,    67,    93,    94,    95,    96,
      97,    98,    -1,    -1,   101,   102,   103,   104,    -1,   106,
      93,    94,    95,    96,    97,    98,    -1,    -1,   101,    93,
      94,    95,    96,   106,    98,    -1,    -1,   101,    -1,    -1,
      -1,    -1,   106,    -1,    -1,    -1,    -1,    -1,   110,    -1,
      -1,   113,    -1,    -1,    -1,    -1,   118,   119,   120,   121,
     122,   123,   124,   125
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,    19,    22,    26,    58,    74,    91,
      99,   128,   129,   130,   131,   133,   134,   135,   144,   147,
     148,   161,     7,   132,   101,   113,   149,   136,    46,    47,
      48,    49,    50,    97,   202,   203,   162,   145,     4,     0,
     130,     4,   102,     4,    68,   229,   230,    97,   101,   105,
     224,   225,   202,    97,    97,    26,    90,    99,   107,   108,
     137,   139,   140,   146,   147,   193,   194,   195,   101,   114,
      70,    93,    94,    95,    96,    98,   101,   102,   103,   104,
     106,   220,   228,   231,   233,   234,   235,   150,    97,   112,
     163,   138,     4,   140,    92,    13,    25,    74,   141,   142,
     195,   228,    70,    68,   126,    82,    83,    84,    85,    86,
      87,    88,    89,   156,   157,   169,   170,   171,   112,   235,
     169,   102,   228,   101,   169,     4,   105,   228,   232,   233,
     115,   115,     4,    68,   155,   235,     4,    97,   105,   226,
     227,   228,    68,    90,   143,   220,   221,   222,   223,   227,
     233,    97,   101,    46,    47,    48,    49,    97,   158,   159,
     151,   171,   164,   112,    98,   113,    68,   116,   116,    68,
     116,     4,   152,   152,   101,   229,   223,   159,     5,    99,
     107,   108,   153,   160,   190,   191,   192,   160,   114,   154,
       4,     4,    69,   192,   193,   196,    69,   202,     9,    11,
      12,    13,    18,    19,    20,    24,    25,    26,    29,    59,
      62,    63,    71,    75,    77,    97,   101,   105,   137,   165,
     180,   182,   186,   198,   204,   205,   206,   207,   208,   210,
     218,   220,    97,   226,    13,   228,    13,   228,   228,   220,
      97,    97,   199,   101,   200,   201,    95,   101,   236,   115,
     210,   220,   115,     4,   221,     4,     4,   115,   211,    30,
      31,    32,    33,    34,    35,    36,    37,    39,    40,    41,
      42,    43,   109,   111,   112,   113,   209,   178,   228,     9,
      52,    53,    54,    55,    56,    57,    68,   219,   228,     9,
      68,   219,    68,   202,    68,   202,   202,   112,   187,   188,
     166,   183,   216,   217,   220,   115,   228,   228,   228,   228,
     228,   228,   228,   228,   228,   228,   228,   228,   228,    13,
      18,    59,    60,   101,   105,   117,   118,   119,   210,   220,
     228,   229,   101,   220,   225,    15,    16,    17,   179,     9,
     226,   226,   228,     9,   226,   226,   228,   228,    97,   197,
     220,    97,    97,   228,   189,   213,   228,   189,   173,   184,
      68,   116,   178,   212,   213,   203,   228,   236,    97,   143,
     228,   228,   228,    38,    44,    45,    51,    64,    65,    66,
      67,   110,   113,   118,   119,   120,   121,   122,   123,   124,
     125,   114,   226,     9,   226,     9,    68,   113,    68,   112,
     112,    68,   116,   214,   116,    10,    81,   168,   174,     4,
      62,    76,    78,   181,   185,   216,   112,    68,   116,    68,
     113,    68,   113,   228,   228,   228,   228,   228,   228,   228,
     228,   228,   229,   228,   228,   228,   228,   228,   228,   228,
     228,   112,   226,   226,   228,   229,    97,   235,   235,   213,
      14,   215,   213,   228,    73,    79,    80,   172,     4,   228,
       4,   208,   213,   228,   229,   228,   229,   114,   228,   114,
       4,   228,   228,   101,   220,   167,   195,   214,   115,   114,
     114,     4,    68,     4,     4,    68,     4,    68,   175,     4,
     212,   228,   228,   228,    24,    61,    72,   176,   116,     4,
       4,     4,   177,   220,     4,   202,   178,    97
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
#line 398 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 407 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 6:
#line 408 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 409 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 410 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 411 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 412 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 413 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 12:
#line 414 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 415 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 418 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 419 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 423 "imcc/imcc.y"
    { if (yyvsp[0].s)
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 17:
#line 431 "imcc/imcc.y"
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
#line 443 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 19:
#line 449 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 20:
#line 457 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 21:
#line 458 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 22:
#line 462 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 23:
#line 463 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 26:
#line 471 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 27:
#line 472 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 28:
#line 473 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 29:
#line 474 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 30:
#line 475 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 32:
#line 479 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 33:
#line 481 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 34:
#line 484 "imcc/imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                     yyval.i = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, yyvsp[0].s));
                     cur_call->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 35:
#line 492 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 36:
#line 494 "imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, yyvsp[0].s);
                       set_lexical(interp, r, yyvsp[-2].s); yyval.i = 0;
                   }
    break;

  case 37:
#line 498 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 39:
#line 506 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 40:
#line 508 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 43:
#line 523 "imcc/imcc.y"
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
#line 539 "imcc/imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 45:
#line 543 "imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, yyvsp[0].sr);
        }
    break;

  case 46:
#line 546 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 47:
#line 548 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 48:
#line 552 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 49:
#line 553 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 50:
#line 554 "imcc/imcc.y"
    { add_pcc_param(cur_call, yyvsp[-1].sr);}
    break;

  case 51:
#line 558 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 52:
#line 559 "imcc/imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-2].t);
                                         is_def=0; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 53:
#line 564 "imcc/imcc.y"
    { yyval.t = 0;  }
    break;

  case 55:
#line 569 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 56:
#line 573 "imcc/imcc.y"
    { yyval.t = 0; cur_unit->outer =
                     mk_sub_address_fromc(interp, yyvsp[-1].s); }
    break;

  case 57:
#line 576 "imcc/imcc.y"
    { yyval.t = 0; cur_unit->outer =
                     mk_const(interp, yyvsp[-1].s, 'S'); }
    break;

  case 58:
#line 581 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 59:
#line 582 "imcc/imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); }
    break;

  case 60:
#line 583 "imcc/imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);}
    break;

  case 61:
#line 587 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 62:
#line 588 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 63:
#line 589 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 64:
#line 590 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 65:
#line 591 "imcc/imcc.y"
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

  case 68:
#line 609 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 69:
#line 611 "imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, yyvsp[0].s));

         }
    break;

  case 70:
#line 615 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 71:
#line 617 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 72:
#line 622 "imcc/imcc.y"
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

  case 73:
#line 649 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 74:
#line 653 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 75:
#line 654 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 76:
#line 658 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 77:
#line 660 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 78:
#line 664 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 80:
#line 669 "imcc/imcc.y"
    { yyval.t = yyvsp[0].t; }
    break;

  case 81:
#line 670 "imcc/imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; }
    break;

  case 82:
#line 674 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 83:
#line 675 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 84:
#line 676 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 85:
#line 677 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 86:
#line 678 "imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 87:
#line 679 "imcc/imcc.y"
    {  yyval.t = P_METHOD; }
    break;

  case 90:
#line 686 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 91:
#line 691 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 92:
#line 693 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-1].sr);
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 93:
#line 698 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 94:
#line 700 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 95:
#line 702 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 96:
#line 706 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 97:
#line 713 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 98:
#line 714 "imcc/imcc.y"
    {  add_pcc_arg(cur_call, yyvsp[-1].sr); }
    break;

  case 99:
#line 718 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 100:
#line 723 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 101:
#line 724 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(cur_call, yyvsp[-1].sr); }
    break;

  case 102:
#line 728 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 103:
#line 729 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 104:
#line 730 "imcc/imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 105:
#line 734 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 106:
#line 735 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 107:
#line 739 "imcc/imcc.y"
    {  yyval.t = VT_FLAT;   }
    break;

  case 108:
#line 740 "imcc/imcc.y"
    {  yyval.t = VT_OPTIONAL; }
    break;

  case 109:
#line 741 "imcc/imcc.y"
    {  yyval.t = VT_OPT_FLAG; }
    break;

  case 110:
#line 746 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 111:
#line 747 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 114:
#line 757 "imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 115:
#line 760 "imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 116:
#line 761 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 117:
#line 767 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 118:
#line 769 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 119:
#line 771 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 120:
#line 775 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 121:
#line 780 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 122:
#line 785 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 123:
#line 787 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 124:
#line 792 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 125:
#line 796 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 126:
#line 797 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 127:
#line 798 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 130:
#line 816 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 131:
#line 821 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 132:
#line 822 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 133:
#line 823 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 134:
#line 824 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 135:
#line 828 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 139:
#line 838 "imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 140:
#line 845 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 141:
#line 849 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 142:
#line 857 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 145:
#line 867 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 146:
#line 868 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 147:
#line 869 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 148:
#line 870 "imcc/imcc.y"
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

  case 149:
#line 883 "imcc/imcc.y"
    {
                       set_lexical(interp, yyvsp[0].sr, yyvsp[-2].s); yyval.i = 0;
                    }
    break;

  case 150:
#line 886 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 151:
#line 887 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 153:
#line 889 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 154:
#line 890 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 155:
#line 891 "imcc/imcc.y"
    { yyval.i = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 156:
#line 895 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 157:
#line 897 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 158:
#line 900 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 159:
#line 901 "imcc/imcc.y"
    {  yyval.i = 0; cur_call = NULL; }
    break;

  case 160:
#line 902 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 162:
#line 904 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 163:
#line 908 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 164:
#line 909 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 165:
#line 910 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 166:
#line 911 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 167:
#line 912 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 168:
#line 913 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 169:
#line 918 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 170:
#line 928 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 171:
#line 929 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 172:
#line 930 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 173:
#line 931 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 174:
#line 932 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 175:
#line 933 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 176:
#line 934 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 177:
#line 935 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 178:
#line 936 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 179:
#line 937 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 180:
#line 938 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 181:
#line 939 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 182:
#line 941 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 183:
#line 943 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 945 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 185:
#line 947 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 949 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 187:
#line 951 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 953 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 189:
#line 955 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 957 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 191:
#line 959 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 192:
#line 961 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 193:
#line 963 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 194:
#line 965 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 195:
#line 967 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 196:
#line 969 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 971 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 973 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 199:
#line 975 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 200:
#line 978 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 201:
#line 980 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 202:
#line 984 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 986 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 988 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 205:
#line 991 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            cur_call = NULL;
            yyval.i = 0;
         }
    break;

  case 206:
#line 997 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 207:
#line 1001 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           cur_call = NULL;
         }
    break;

  case 210:
#line 1008 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[-2].sr); }
    break;

  case 211:
#line 1013 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 1015 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 213:
#line 1017 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 214:
#line 1019 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 215:
#line 1021 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 216:
#line 1023 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 1025 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 218:
#line 1027 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1029 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 220:
#line 1031 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 221:
#line 1033 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 222:
#line 1035 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 223:
#line 1037 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 1042 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 225:
#line 1048 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 226:
#line 1049 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 227:
#line 1050 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 228:
#line 1055 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 229:
#line 1056 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 230:
#line 1057 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 231:
#line 1060 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 232:
#line 1061 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 233:
#line 1066 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 234:
#line 1071 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 235:
#line 1075 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 236:
#line 1076 "imcc/imcc.y"
    {  yyval.sr = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 237:
#line 1077 "imcc/imcc.y"
    {  yyval.sr = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 238:
#line 1081 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 239:
#line 1085 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 240:
#line 1086 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 241:
#line 1090 "imcc/imcc.y"
    {  yyval.t = VT_FLAT; }
    break;

  case 242:
#line 1093 "imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 243:
#line 1097 "imcc/imcc.y"
    { yyval.sr = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 244:
#line 1098 "imcc/imcc.y"
    { yyval.sr = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 245:
#line 1103 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 246:
#line 1105 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 247:
#line 1107 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 248:
#line 1109 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 249:
#line 1111 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 250:
#line 1113 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 251:
#line 1115 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 252:
#line 1117 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 253:
#line 1121 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 254:
#line 1122 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 255:
#line 1123 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 256:
#line 1124 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 257:
#line 1125 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 258:
#line 1126 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 261:
#line 1135 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 262:
#line 1136 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 263:
#line 1140 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 265:
#line 1145 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 266:
#line 1147 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 268:
#line 1155 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 269:
#line 1159 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 270:
#line 1160 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 271:
#line 1164 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 272:
#line 1165 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 277:
#line 1178 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 278:
#line 1179 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 279:
#line 1183 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 280:
#line 1185 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 281:
#line 1186 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 282:
#line 1187 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 283:
#line 1191 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 284:
#line 1197 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 285:
#line 1199 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 286:
#line 1200 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 287:
#line 1204 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 288:
#line 1205 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 289:
#line 1206 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 290:
#line 1207 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 291:
#line 1208 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 292:
#line 1212 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 293:
#line 1213 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 294:
#line 1214 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 295:
#line 1215 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 296:
#line 1219 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 297:
#line 1220 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3471 "imcc/imcparser.c"

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


#line 1225 "imcc/imcc.y"



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

