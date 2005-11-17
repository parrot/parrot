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
     NEED_LEX = 343,
     MULTI = 344,
     LABEL = 345,
     EMIT = 346,
     EOM = 347,
     IREG = 348,
     NREG = 349,
     SREG = 350,
     PREG = 351,
     IDENTIFIER = 352,
     REG = 353,
     MACRO = 354,
     ENDM = 355,
     STRINGC = 356,
     INTC = 357,
     FLOATC = 358,
     USTRINGC = 359,
     PARROT_OP = 360,
     VAR = 361,
     LINECOMMENT = 362,
     FILECOMMENT = 363,
     DOT = 364,
     CONCAT = 365,
     POINTY = 366
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
#define NEED_LEX 343
#define MULTI 344
#define LABEL 345
#define EMIT 346
#define EOM 347
#define IREG 348
#define NREG 349
#define SREG 350
#define PREG 351
#define IDENTIFIER 352
#define REG 353
#define MACRO 354
#define ENDM 355
#define STRINGC 356
#define INTC 357
#define FLOATC 358
#define USTRINGC 359
#define PARROT_OP 360
#define VAR 361
#define LINECOMMENT 362
#define FILECOMMENT 363
#define DOT 364
#define CONCAT 365
#define POINTY 366




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
#line 621 "imcc/imcparser.c"
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
#line 642 "imcc/imcparser.c"

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
#define YYLAST   581

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  128
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  110
/* YYNRULES -- Number of rules. */
#define YYNRULES  298
/* YYNRULES -- Number of states. */
#define YYNSTATES  509

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   366

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   118,     2,     2,     2,   124,   125,     2,
     116,   117,   122,   121,     2,   119,     2,   123,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   127,
       2,   113,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   114,     2,   115,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   126,     2,   120,     2,     2,     2,
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
     106,   107,   108,   109,   110,   111,   112
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
     249,   251,   257,   261,   265,   269,   273,   279,   285,   286,
     290,   293,   294,   298,   302,   303,   308,   309,   312,   314,
     316,   318,   320,   322,   324,   326,   327,   333,   335,   336,
     339,   343,   347,   348,   354,   355,   361,   362,   364,   368,
     370,   373,   374,   377,   380,   382,   384,   385,   387,   390,
     392,   394,   398,   400,   404,   406,   408,   411,   414,   415,
     420,   425,   426,   433,   435,   436,   443,   446,   449,   452,
     455,   457,   459,   461,   462,   464,   466,   468,   470,   472,
     474,   476,   480,   485,   490,   495,   501,   507,   513,   519,
     525,   531,   537,   543,   549,   555,   561,   567,   573,   579,
     585,   591,   597,   604,   611,   618,   626,   631,   636,   643,
     651,   656,   661,   666,   671,   678,   686,   690,   691,   701,
     703,   705,   709,   713,   717,   721,   725,   729,   733,   737,
     741,   745,   749,   753,   757,   761,   766,   768,   770,   772,
     776,   780,   784,   786,   788,   789,   795,   796,   800,   802,
     805,   806,   809,   811,   814,   818,   820,   827,   834,   840,
     846,   851,   856,   861,   866,   868,   870,   872,   874,   876,
     878,   880,   882,   883,   885,   889,   891,   893,   898,   900,
     902,   904,   906,   908,   910,   912,   914,   916,   918,   919,
     922,   924,   928,   929,   934,   936,   940,   943,   946,   948,
     950,   952,   954,   956,   958,   960,   962,   964,   966
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     129,     0,    -1,   130,    -1,   131,    -1,   130,   131,    -1,
     148,    -1,   136,    -1,   135,    -1,   149,    -1,   162,    -1,
     145,    -1,   100,     4,    -1,   132,    -1,     4,    -1,     6,
     133,     4,    -1,   134,     4,    -1,     7,   103,    -1,     8,
     102,    68,   102,    -1,    58,   203,    98,    -1,    58,   203,
      98,   113,   236,    -1,    -1,    26,   137,   203,    98,   113,
     236,    -1,    -1,    26,   139,   103,   228,   113,   102,    -1,
     141,    -1,   140,   141,    -1,   194,   142,     4,    -1,   100,
       4,    -1,   109,    -1,   108,    -1,   148,    -1,   138,    -1,
      -1,   143,   106,   144,    -1,    74,   170,    91,    -1,    13,
     229,    -1,    25,   102,    68,    99,    -1,    -1,   222,    -1,
      -1,    92,   146,   147,    93,    -1,    -1,   140,    -1,    19,
     114,   230,   115,    -1,    -1,    -1,    -1,    22,   150,   225,
     151,   170,     4,   152,   153,   161,    69,    -1,    -1,     4,
      -1,   153,   154,     4,    -1,    -1,     5,   155,   203,    98,
     179,    -1,    -1,    68,    -1,    90,   116,   159,   117,    -1,
      88,   116,   102,   117,    -1,    88,   116,    98,   117,    -1,
      -1,   159,    68,   160,    -1,   160,    -1,    46,    -1,    47,
      -1,    49,    -1,    48,    -1,    98,    -1,    -1,   191,    -1,
      -1,    -1,    -1,    74,   163,    98,   164,   170,     4,   165,
     153,   161,    69,    -1,    -1,    71,     4,   167,   174,   169,
     173,   168,   176,    72,    -1,    -1,   196,     4,    -1,    -1,
      81,   229,     4,    -1,    -1,   171,    -1,   172,    -1,   171,
     156,   172,    -1,    83,    -1,    82,    -1,    84,    -1,    85,
      -1,    87,    -1,    86,    -1,    89,    -1,   157,    -1,   158,
      -1,    73,   229,    68,   229,     4,    -1,    73,   229,     4,
      -1,    79,   229,     4,    -1,    80,   221,     4,    -1,    80,
     102,     4,    -1,    80,   221,    68,   229,     4,    -1,    80,
     102,    68,   229,     4,    -1,    -1,   174,   175,     4,    -1,
      10,   214,    -1,    -1,   176,   177,     4,    -1,    61,   221,
     179,    -1,    -1,    24,   178,   203,    98,    -1,    -1,   179,
     180,    -1,    15,    -1,    16,    -1,    17,    -1,    75,    -1,
      77,    -1,    76,    -1,    78,    -1,    -1,   181,     4,   184,
     185,   182,    -1,   187,    -1,    -1,   185,     4,    -1,   185,
     186,     4,    -1,    62,   229,   215,    -1,    -1,    62,   116,
     188,   190,   117,    -1,    -1,    63,   116,   189,   190,   117,
      -1,    -1,   214,    -1,   190,    68,   214,    -1,   193,    -1,
     191,   193,    -1,    -1,   192,   197,    -1,   100,     4,    -1,
     109,    -1,   108,    -1,    -1,   195,    -1,   195,   196,    -1,
     196,    -1,    91,    -1,   194,   199,     4,    -1,    98,    -1,
     198,    68,    98,    -1,   205,    -1,   219,    -1,    19,    98,
      -1,    20,    98,    -1,    -1,    24,   200,   203,   198,    -1,
      25,   102,    68,   221,    -1,    -1,    26,   201,   203,    98,
     113,   236,    -1,   138,    -1,    -1,    29,   202,   203,    98,
     113,   236,    -1,    62,   211,    -1,     9,   227,    -1,   106,
     222,    -1,    13,   229,    -1,   211,    -1,   166,    -1,   183,
      -1,    -1,    46,    -1,    47,    -1,    48,    -1,    49,    -1,
      50,    -1,   204,    -1,    98,    -1,   221,   113,   229,    -1,
     221,   113,   118,   229,    -1,   221,   113,   119,   229,    -1,
     221,   113,   120,   229,    -1,   221,   113,   229,   121,   229,
      -1,   221,   113,   229,   119,   229,    -1,   221,   113,   229,
     122,   229,    -1,   221,   113,   229,    64,   229,    -1,   221,
     113,   229,   123,   229,    -1,   221,   113,   229,    38,   229,
      -1,   221,   113,   229,   124,   229,    -1,   221,   113,   229,
     111,   229,    -1,   221,   113,   229,    44,   229,    -1,   221,
     113,   229,    45,   229,    -1,   221,   113,   229,    65,   229,
      -1,   221,   113,   229,    66,   229,    -1,   221,   113,   229,
      67,   229,    -1,   221,   113,   229,    51,   229,    -1,   221,
     113,   229,   125,   229,    -1,   221,   113,   229,   126,   229,
      -1,   221,   113,   229,   120,   229,    -1,   221,   113,   229,
     114,   230,   115,    -1,   221,   114,   230,   115,   113,   229,
      -1,   221,   113,    18,   204,    68,   229,    -1,   221,   113,
      18,   204,   114,   230,   115,    -1,   221,   113,    18,   204,
      -1,   221,   113,    18,   229,    -1,   221,   113,    18,   229,
      68,   229,    -1,   221,   113,    18,   229,   114,   230,   115,
      -1,   221,   113,    60,    98,    -1,   221,   113,    59,   237,
      -1,    59,   237,   113,   229,    -1,    18,   221,    68,   229,
      -1,    18,   221,    68,   229,    68,   229,    -1,    18,   221,
      68,   229,   114,   230,   115,    -1,   221,   113,   211,    -1,
      -1,   206,   116,   218,   117,   113,   209,   116,   213,   117,
      -1,   207,    -1,   208,    -1,   221,   113,    13,    -1,   221,
      30,   229,    -1,   221,    31,   229,    -1,   221,    32,   229,
      -1,   221,    33,   229,    -1,   221,    40,   229,    -1,   221,
      39,   229,    -1,   221,    34,   229,    -1,   221,    35,   229,
      -1,   221,    36,   229,    -1,   221,    37,   229,    -1,   221,
      41,   229,    -1,   221,    42,   229,    -1,   221,    43,   229,
      -1,   221,   113,   106,   144,    -1,    98,    -1,   102,    -1,
     221,    -1,   221,   210,   226,    -1,   221,   210,   102,    -1,
     221,   210,   221,    -1,   112,    -1,   110,    -1,    -1,   209,
     212,   116,   213,   117,    -1,    -1,   213,    68,   214,    -1,
     214,    -1,   229,   215,    -1,    -1,   215,   216,    -1,    14,
      -1,   221,   179,    -1,   218,    68,   217,    -1,   217,    -1,
      11,   229,   220,   229,     9,   227,    -1,    12,   229,   220,
     229,     9,   227,    -1,    11,    13,   229,     9,   227,    -1,
      12,    13,   229,     9,   227,    -1,    11,   229,     9,   227,
      -1,    12,   229,     9,   227,    -1,    11,   229,    68,   227,
      -1,    12,   229,    68,   227,    -1,    52,    -1,    53,    -1,
      54,    -1,    55,    -1,    56,    -1,    57,    -1,   107,    -1,
     235,    -1,    -1,   223,    -1,   223,    68,   224,    -1,   224,
      -1,   228,    -1,   221,   114,   230,   115,    -1,   226,    -1,
     102,    -1,    98,    -1,   106,    -1,    98,    -1,   106,    -1,
     227,    -1,   229,    -1,   221,    -1,   236,    -1,    -1,   231,
     232,    -1,   234,    -1,   232,   127,   234,    -1,    -1,   232,
      68,   233,   234,    -1,   229,    -1,   229,    70,   229,    -1,
      70,   229,    -1,   229,    70,    -1,    94,    -1,    95,    -1,
      96,    -1,    97,    -1,    99,    -1,   103,    -1,   104,    -1,
     102,    -1,   105,    -1,    96,    -1,   102,    -1
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
     682,   685,   691,   693,   698,   700,   702,   706,   713,   715,
     718,   723,   725,   728,   730,   730,   734,   736,   739,   741,
     742,   746,   748,   751,   753,   758,   756,   762,   767,   769,
     771,   775,   781,   779,   788,   787,   796,   798,   799,   803,
     805,   816,   820,   823,   824,   825,   828,   830,   833,   835,
     838,   844,   849,   857,   865,   867,   868,   869,   870,   870,
     883,   887,   887,   889,   890,   890,   892,   896,   897,   900,
     902,   903,   904,   905,   908,   910,   911,   912,   913,   914,
     917,   928,   930,   931,   932,   933,   934,   935,   936,   937,
     938,   939,   940,   941,   943,   945,   947,   949,   951,   953,
     955,   957,   959,   961,   963,   965,   967,   969,   971,   973,
     975,   978,   980,   984,   986,   988,   991,   998,   997,  1006,
    1007,  1008,  1012,  1015,  1017,  1019,  1021,  1023,  1025,  1027,
    1029,  1031,  1033,  1035,  1037,  1041,  1049,  1050,  1051,  1056,
    1057,  1058,  1061,  1062,  1067,  1065,  1075,  1077,  1078,  1081,
    1085,  1087,  1090,  1094,  1097,  1099,  1102,  1105,  1107,  1109,
    1111,  1113,  1115,  1117,  1121,  1123,  1124,  1125,  1126,  1127,
    1130,  1132,  1135,  1137,  1140,  1142,  1145,  1147,  1154,  1156,
    1159,  1161,  1164,  1166,  1169,  1171,  1174,  1176,  1179,  1179,
    1183,  1185,  1187,  1187,  1191,  1197,  1200,  1201,  1204,  1206,
    1207,  1208,  1209,  1212,  1214,  1215,  1216,  1219,  1221
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
  "METHOD", "ANON", "OUTER", "NEED_LEX", "MULTI", "LABEL", "EMIT", "EOM", 
  "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "REG", "MACRO", "ENDM", 
  "STRINGC", "INTC", "FLOATC", "USTRINGC", "PARROT_OP", "VAR", 
  "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", "POINTY", "'='", "'['", 
  "']'", "'('", "')'", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", 
  "'&'", "'|'", "';'", "$accept", "program", "compilation_units", 
  "compilation_unit", "pragma", "pragma_1", "hll_def", "global", 
  "constdef", "@1", "pmc_const", "@2", "pasmcode", "pasmline", 
  "pasm_inst", "@3", "pasm_args", "emit", "@4", "opt_pasmcode", 
  "class_namespace", "sub", "@5", "@6", "@7", "sub_params", "sub_param", 
  "@8", "opt_comma", "multi", "outer", "multi_types", "multi_type", 
  "sub_body", "pcc_sub", "@9", "@10", "@11", "pcc_sub_call", "@12", 
  "opt_label", "opt_invocant", "sub_proto", "sub_proto_list", "proto", 
  "pcc_call", "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@13", 
  "paramtype_list", "paramtype", "begin_ret_or_yield", "end_ret_or_yield", 
  "pcc_ret", "@14", "pcc_returns", "pcc_return", "pcc_return_many", "@15", 
  "@16", "var_returns", "statements", "helper_clear_state", "statement", 
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
     364,   365,   366,    61,    91,    93,    40,    41,    33,    45,
     126,    43,    42,    47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   128,   129,   130,   130,   131,   131,   131,   131,   131,
     131,   131,   131,   131,   132,   132,   133,   134,   135,   135,
     137,   136,   139,   138,   140,   140,   141,   141,   141,   141,
     141,   141,   143,   142,   142,   142,   142,   142,   144,   146,
     145,   147,   147,   148,   150,   151,   152,   149,   153,   153,
     153,   155,   154,   156,   156,   157,   158,   158,   159,   159,
     159,   160,   160,   160,   160,   160,   161,   161,   163,   164,
     165,   162,   167,   166,   168,   168,   169,   169,   170,   170,
     171,   171,   172,   172,   172,   172,   172,   172,   172,   172,
     172,   173,   173,   173,   173,   173,   173,   173,   174,   174,
     175,   176,   176,   177,   178,   177,   179,   179,   180,   180,
     180,   181,   181,   182,   182,   184,   183,   183,   185,   185,
     185,   186,   188,   187,   189,   187,   190,   190,   190,   191,
     191,   192,   193,   193,   193,   193,   194,   194,   195,   195,
     196,   197,   198,   198,   199,   199,   199,   199,   200,   199,
     199,   201,   199,   199,   202,   199,   199,   199,   199,   199,
     199,   199,   199,   199,   203,   203,   203,   203,   203,   203,
     204,   205,   205,   205,   205,   205,   205,   205,   205,   205,
     205,   205,   205,   205,   205,   205,   205,   205,   205,   205,
     205,   205,   205,   205,   205,   205,   205,   205,   205,   205,
     205,   205,   205,   205,   205,   205,   205,   206,   205,   205,
     205,   205,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   208,   209,   209,   209,   209,
     209,   209,   210,   210,   212,   211,   213,   213,   213,   214,
     215,   215,   216,   217,   218,   218,   219,   219,   219,   219,
     219,   219,   219,   219,   220,   220,   220,   220,   220,   220,
     221,   221,   222,   222,   223,   223,   224,   224,   225,   225,
     226,   226,   227,   227,   228,   228,   229,   229,   231,   230,
     232,   232,   233,   232,   234,   234,   234,   234,   235,   235,
     235,   235,   235,   236,   236,   236,   236,   237,   237
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
       1,     5,     3,     3,     3,     3,     5,     5,     0,     3,
       2,     0,     3,     3,     0,     4,     0,     2,     1,     1,
       1,     1,     1,     1,     1,     0,     5,     1,     0,     2,
       3,     3,     0,     5,     0,     5,     0,     1,     3,     1,
       2,     0,     2,     2,     1,     1,     0,     1,     2,     1,
       1,     3,     1,     3,     1,     1,     2,     2,     0,     4,
       4,     0,     6,     1,     0,     6,     2,     2,     2,     2,
       1,     1,     1,     0,     1,     1,     1,     1,     1,     1,
       1,     3,     4,     4,     4,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     6,     6,     6,     7,     4,     4,     6,     7,
       4,     4,     4,     4,     6,     7,     3,     0,     9,     1,
       1,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     4,     1,     1,     1,     3,
       3,     3,     1,     1,     0,     5,     0,     3,     1,     2,
       0,     2,     1,     2,     3,     1,     6,     6,     5,     5,
       4,     4,     4,     4,     1,     1,     1,     1,     1,     1,
       1,     1,     0,     1,     3,     1,     1,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     0,     2,
       1,     3,     0,     4,     1,     3,     2,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,     0,    44,    20,     0,    68,    39,
       0,     0,     2,     3,    12,     0,     7,     6,    10,     5,
       8,     9,     0,     0,     0,   278,     0,     0,   164,   165,
     166,   167,   168,   170,     0,   169,     0,   136,    11,     1,
       4,    15,    16,    14,     0,     0,     0,   270,   269,   271,
      45,   268,     0,    18,    69,    22,   140,     0,    29,    28,
      31,   136,    24,     0,    30,    32,   137,   139,    17,    43,
       0,   288,   289,   290,   291,   292,   295,   293,   294,   296,
     260,   276,   284,   279,   280,   261,   277,    78,     0,     0,
      78,     0,    27,    25,    40,     0,     0,    78,     0,     0,
     138,   286,   287,   282,     0,    83,    82,    84,    85,    87,
      86,     0,    88,     0,    89,    90,     0,    53,    80,     0,
      19,     0,     0,    35,     0,     0,    26,   262,   285,     0,
     281,     0,    58,    46,    54,     0,    21,    70,   272,   273,
     274,     0,   275,     0,    34,    33,   276,    38,   263,   265,
     266,   283,     0,     0,    61,    62,    64,    63,    65,     0,
      60,    48,    81,    48,     0,    36,   278,     0,    57,    56,
       0,    55,    49,   131,   131,    23,     0,   264,    59,    51,
       0,   135,   134,     0,     0,   131,   136,   129,     0,   267,
       0,   133,    50,    47,   130,   163,   132,    71,     0,     0,
       0,     0,     0,     0,     0,     0,   148,     0,   151,   154,
       0,     0,     0,     0,   111,   112,   226,   227,   262,   153,
     161,     0,   162,   117,     0,   144,     0,   209,   210,   234,
     160,   145,   228,   106,   157,     0,     0,     0,     0,   159,
       0,   146,   147,     0,     0,     0,     0,   297,   298,     0,
     122,   156,   228,   124,    72,   158,   115,   141,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   233,   232,     0,   278,     0,    52,     0,
       0,   254,   255,   256,   257,   258,   259,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   126,
     126,    98,   118,   245,     0,   106,   236,   212,   213,   214,
     215,   218,   219,   220,   221,   217,   216,   222,   223,   224,
     211,     0,     0,     0,   295,   262,     0,     0,     0,   206,
     276,   171,     0,   230,   231,   229,   108,   109,   110,   107,
       0,   250,   252,     0,     0,   251,   253,     0,   203,   142,
     149,   150,     0,     0,   202,     0,   127,   240,     0,    76,
       0,     0,     0,   243,     0,   238,   196,   197,   201,   200,
     225,   172,   173,   174,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   248,     0,   249,     0,     0,   278,     0,
       0,     0,     0,   123,   239,   125,     0,     0,     0,     0,
     119,     0,   113,   114,   116,     0,   244,     0,     0,   235,
       0,   278,     0,   278,   180,   183,   184,   188,   178,   185,
     186,   187,   182,     0,   176,   191,   175,   177,   179,   181,
     189,   190,     0,   246,   247,   204,     0,   143,   152,   155,
     128,   242,   241,   100,     0,     0,     0,     0,    74,    99,
     240,   120,     0,   237,   194,     0,   198,     0,   192,   193,
     205,    77,     0,     0,     0,     0,   101,     0,   121,   236,
     195,   199,    92,     0,    93,    95,     0,    94,     0,     0,
      75,     0,     0,     0,     0,   104,     0,    73,     0,   208,
      91,    97,    96,     0,   106,   102,     0,   103,   105
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    11,    12,    13,    14,    23,    15,    16,    17,    27,
      60,    91,    61,    62,    98,    99,   145,    18,    37,    63,
      19,    20,    26,    87,   161,   173,   183,   190,   135,   114,
     115,   159,   160,   184,    21,    36,    90,   163,   220,   301,
     476,   408,   116,   117,   118,   458,   359,   409,   489,   498,
     503,   278,   339,   221,   414,   222,   302,   360,   415,   223,
     299,   300,   355,   185,   186,   187,    65,    66,    67,   196,
     350,   224,   243,   245,   246,    34,    35,   225,   226,   227,
     228,   229,   277,   230,   259,   364,   356,   404,   452,   303,
     304,   231,   288,    81,   147,   148,   149,    50,    51,   140,
     150,   357,    45,    46,    83,   129,    84,    85,    86,   249
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -303
static const short yypact[] =
{
       7,  -303,    15,   -84,   -75,  -303,  -303,    20,  -303,  -303,
      54,   101,     7,  -303,  -303,    55,  -303,  -303,  -303,  -303,
    -303,  -303,   -63,   130,   116,  -303,    73,    20,  -303,  -303,
    -303,  -303,  -303,  -303,    19,  -303,    46,    64,  -303,  -303,
    -303,  -303,  -303,  -303,    63,    41,   403,  -303,  -303,  -303,
    -303,  -303,    71,    75,  -303,  -303,  -303,   190,  -303,  -303,
    -303,    96,  -303,   118,  -303,    12,   121,  -303,  -303,  -303,
     259,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,   139,   -34,  -303,  -303,  -303,   367,   100,    49,
     367,   111,  -303,  -303,  -303,   259,   115,   367,   230,   132,
    -303,  -303,   259,  -303,   403,  -303,  -303,  -303,  -303,  -303,
    -303,   123,  -303,   124,  -303,  -303,   237,     3,  -303,    49,
    -303,   239,   432,  -303,   176,   154,  -303,   432,  -303,   403,
    -303,   -81,   144,  -303,  -303,   367,  -303,  -303,  -303,  -303,
    -303,   133,  -303,   148,  -303,  -303,   135,  -303,   182,  -303,
    -303,  -303,   137,   138,  -303,  -303,  -303,  -303,  -303,   -45,
    -303,   261,  -303,   261,   164,  -303,  -303,   432,  -303,  -303,
     144,  -303,  -303,     5,     5,  -303,   153,  -303,  -303,  -303,
     266,  -303,  -303,   267,   204,    59,   121,  -303,   206,  -303,
      20,  -303,  -303,  -303,  -303,   365,  -303,  -303,   185,   -70,
      36,   224,   259,   183,   186,   199,  -303,   187,   195,  -303,
      40,   417,   189,   308,  -303,  -303,  -303,  -303,   432,  -303,
    -303,   320,  -303,  -303,   326,  -303,   216,  -303,  -303,  -303,
    -303,  -303,    11,  -303,  -303,   259,   254,   259,   343,  -303,
     265,  -303,  -303,    20,   275,    20,    20,  -303,  -303,   246,
    -303,  -303,    88,  -303,  -303,  -303,  -303,  -303,   183,   244,
     259,   259,   259,   259,   259,   259,   259,   259,   259,   259,
     259,   259,   259,  -303,  -303,   197,  -303,   460,   191,   359,
     -70,  -303,  -303,  -303,  -303,  -303,  -303,   -70,   259,   360,
     -70,   -70,   259,   259,   272,   183,   274,   277,   259,   259,
     259,  -303,  -303,  -303,   -11,  -303,   259,  -303,  -303,  -303,
    -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,   446,    40,   281,   257,   432,   259,   259,   259,  -303,
      70,   368,   271,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
     -70,  -303,  -303,   372,   -70,  -303,  -303,   378,   -41,  -303,
     324,  -303,   288,   290,  -303,    -8,  -303,  -303,    -7,    -1,
       1,   183,   292,   191,    29,  -303,   -12,    44,  -303,  -303,
    -303,  -303,  -303,  -303,   259,   259,   259,   259,   259,   259,
     259,   259,   259,  -303,   259,   259,   259,   259,   259,   259,
     259,   259,   294,  -303,   -70,  -303,   -70,   259,  -303,   310,
      49,    49,   259,  -303,   374,  -303,   259,   259,    97,   405,
    -303,   259,  -303,  -303,  -303,   406,  -303,   474,   259,  -303,
     259,  -303,   259,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,  -303,   299,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,   259,  -303,  -303,  -303,   302,  -303,  -303,  -303,
    -303,  -303,  -303,  -303,   414,   259,   259,   165,   121,  -303,
    -303,  -303,   304,  -303,  -303,   306,  -303,   307,  -303,  -303,
    -303,  -303,     8,   419,    10,    16,  -303,   421,   374,   259,
    -303,  -303,  -303,   259,  -303,  -303,   259,  -303,   259,    76,
    -303,    30,   422,   425,   426,  -303,   183,  -303,   427,  -303,
    -303,  -303,  -303,    20,  -303,  -303,   339,   191,  -303
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -303,  -303,  -303,   429,  -303,  -303,  -303,  -303,  -303,  -303,
     243,  -303,  -303,   383,  -303,  -303,   114,  -303,  -303,  -303,
     113,  -303,  -303,  -303,  -303,   282,  -303,  -303,  -303,  -303,
    -303,  -303,   295,   273,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,   -59,  -303,   323,  -303,  -303,  -303,  -303,  -303,
    -303,  -302,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,   166,  -303,  -303,   283,   284,  -303,   -65,  -303,
    -303,  -303,  -303,  -303,  -303,   -27,   156,  -303,  -303,  -303,
    -303,    52,  -303,  -187,  -303,    -5,  -298,    18,  -303,   119,
    -303,  -303,   245,   -92,   268,  -303,   317,  -303,   198,  -195,
     363,   -40,  -147,  -303,  -303,  -303,   -13,  -303,   -87,   173
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -229
static const short yytable[] =
{
      52,   100,   120,   363,   234,   410,    82,   -79,   365,   406,
     179,     1,   482,     2,   485,     3,   -37,   152,    24,   176,
     487,   153,    22,   170,   251,    95,     4,   397,   138,     5,
     101,   121,   136,     6,   103,   146,   139,    96,   125,    25,
      42,   260,   261,   262,   263,   264,   265,   266,   267,   235,
     268,   269,   270,   271,   272,   123,   420,   361,    38,    41,
     402,   402,   128,   411,    82,     7,    28,    29,    30,    31,
      32,   134,   171,   398,   -66,   146,   483,   412,   486,   413,
     407,     8,   142,     4,   488,   341,    97,   142,   329,    82,
      55,   130,   342,   104,   -79,   345,   346,   418,   418,     9,
     495,    39,   421,   232,   450,   180,   362,    10,   453,   403,
     405,   240,   422,   181,   182,     4,   151,    53,    33,   252,
     463,   273,    55,   274,   275,   276,   146,   142,   -67,   332,
      71,    72,    73,    74,    43,    75,   247,   496,    76,    77,
      78,    79,   248,    80,    54,   393,   419,   499,   497,   395,
      64,    76,    77,    78,    79,    56,    69,   -41,   423,   180,
     236,   238,   239,   198,    57,    68,   305,   181,   182,    88,
     455,    47,    58,    59,    64,    48,   456,   457,   142,    49,
     273,   365,   274,   330,    44,   334,  -228,    56,    89,   -42,
     154,   155,   156,   157,    92,   279,    57,   289,   273,   443,
     274,   444,   507,   351,    58,    59,   336,   337,   338,   102,
     320,    94,    56,   119,   122,   321,   294,   124,   296,   297,
     307,   308,   309,   310,   311,   312,   313,   314,   315,   316,
     317,   318,   319,   146,   126,   331,   433,   237,   127,   131,
     132,   133,   158,   137,   143,   144,   164,   165,   343,   166,
     167,   446,   347,   348,   168,   169,   322,   323,   354,    71,
      72,    73,    74,   280,    75,   172,   175,   474,   189,   305,
     191,   192,    80,   193,   465,   197,   467,    71,    72,    73,
      74,   367,    75,   233,   241,   142,   371,   372,   373,   244,
      80,    71,    72,    73,    74,   216,    75,   242,   -22,   324,
      77,    78,    79,   325,    80,   253,   281,   282,   283,   284,
     285,   286,   254,   448,   449,   326,   327,   328,    71,    72,
      73,    74,   287,    75,   256,   252,    76,    77,    78,    79,
     257,    80,   258,   293,   424,   425,   426,   427,   428,   429,
     430,   431,   432,   295,   434,   435,   436,   437,   438,   439,
     440,   441,   290,    71,    72,    73,    74,   445,    75,   298,
     306,    76,    77,    78,    79,   475,    80,   454,   340,   344,
     349,   460,   352,  -227,   199,   353,   200,   201,   202,   369,
     464,   394,   466,   203,   204,   205,   392,   396,   451,   206,
     207,   208,   399,   477,   209,   281,   282,   283,   284,   285,
     286,   400,   469,   401,   504,   417,   374,   442,   447,   459,
     461,   291,   375,   376,   468,   472,   473,   470,   471,   377,
     479,   480,   481,   484,   210,   490,   500,   211,   212,   501,
     502,   505,   378,   379,   380,   381,   213,   508,   219,   370,
     214,    40,   215,   492,    93,   174,   493,   188,   494,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   162,    71,
      72,    73,    74,   216,    75,   178,   358,   217,   194,   462,
     195,   218,    80,    70,   491,   335,   506,   366,   478,   382,
     416,  -207,   383,   292,   177,   141,   255,   384,   385,   386,
     387,   388,   389,   390,   391,   368,     0,    71,    72,    73,
      74,     0,    75,     0,     0,    76,    77,    78,    79,     0,
      80,    71,    72,    73,    74,   216,    75,     0,     0,   217,
       0,     0,     0,     0,    80,     0,    71,    72,    73,    74,
     138,    75,     0,   250,    76,    77,    78,    79,   139,    80,
      71,    72,    73,    74,    33,    75,     0,     0,    76,    77,
      78,    79,     0,    80,    71,    72,    73,    74,    47,    75,
       0,     0,   333,     0,     0,     0,    49,    80,    71,    72,
      73,    74,   216,    75,     0,     0,   217,     0,     0,     0,
       0,    80
};

static const short yycheck[] =
{
      27,    66,    89,   305,   199,     4,    46,     4,   306,    10,
       5,     4,     4,     6,     4,     8,     4,    98,   102,   166,
       4,   102,     7,    68,   211,    13,    19,    68,    98,    22,
      70,    90,   119,    26,    68,   127,   106,    25,    97,   114,
     103,    30,    31,    32,    33,    34,    35,    36,    37,    13,
      39,    40,    41,    42,    43,    95,    68,    68,     4,     4,
      68,    68,   102,    62,   104,    58,    46,    47,    48,    49,
      50,    68,   117,   114,    69,   167,    68,    76,    68,    78,
      81,    74,   122,    19,    68,   280,    74,   127,   275,   129,
      26,   104,   287,   127,    91,   290,   291,    68,    68,    92,
      24,     0,   114,   195,   402,   100,   117,   100,   406,   117,
     117,   203,    68,   108,   109,    19,   129,    98,    98,   211,
     418,   110,    26,   112,   113,   114,   218,   167,    69,   276,
      94,    95,    96,    97,     4,    99,    96,    61,   102,   103,
     104,   105,   102,   107,    98,   340,   117,   117,    72,   344,
      37,   102,   103,   104,   105,    91,   115,    93,   114,   100,
     200,   201,   202,   190,   100,   102,   258,   108,   109,    98,
      73,    98,   108,   109,    61,   102,    79,    80,   218,   106,
     110,   479,   112,   275,    68,   277,   116,    91,   113,    93,
      46,    47,    48,    49,     4,   235,   100,   237,   110,   394,
     112,   396,   504,   295,   108,   109,    15,    16,    17,    70,
      13,    93,    91,   113,   103,    18,   243,   102,   245,   246,
     260,   261,   262,   263,   264,   265,   266,   267,   268,   269,
     270,   271,   272,   325,     4,   275,   383,    13,   106,   116,
     116,     4,    98,     4,    68,    91,   113,    99,   288,   114,
      68,   398,   292,   293,   117,   117,    59,    60,   298,    94,
      95,    96,    97,     9,    99,     4,   102,   102,   115,   361,
       4,     4,   107,    69,   421,    69,   423,    94,    95,    96,
      97,   321,    99,    98,    98,   325,   326,   327,   328,   102,
     107,    94,    95,    96,    97,    98,    99,    98,   103,   102,
     103,   104,   105,   106,   107,   116,    52,    53,    54,    55,
      56,    57,     4,   400,   401,   118,   119,   120,    94,    95,
      96,    97,    68,    99,     4,   417,   102,   103,   104,   105,
       4,   107,   116,    68,   374,   375,   376,   377,   378,   379,
     380,   381,   382,    68,   384,   385,   386,   387,   388,   389,
     390,   391,     9,    94,    95,    96,    97,   397,    99,   113,
     116,   102,   103,   104,   105,   457,   107,   407,     9,     9,
      98,   411,    98,   116,     9,    98,    11,    12,    13,    98,
     420,     9,   422,    18,    19,    20,   115,     9,    14,    24,
      25,    26,    68,   458,    29,    52,    53,    54,    55,    56,
      57,   113,   442,   113,   496,   113,    38,   113,    98,     4,
       4,    68,    44,    45,   115,   455,   456,   115,     4,    51,
     116,   115,   115,     4,    59,     4,     4,    62,    63,     4,
       4,     4,    64,    65,    66,    67,    71,    98,   195,   325,
      75,    12,    77,   483,    61,   163,   486,   174,   488,    82,
      83,    84,    85,    86,    87,    88,    89,    90,   135,    94,
      95,    96,    97,    98,    99,   170,   300,   102,   185,   417,
     186,   106,   107,    70,   479,   277,   503,   321,   460,   111,
     361,   116,   114,   238,   167,   122,   218,   119,   120,   121,
     122,   123,   124,   125,   126,   322,    -1,    94,    95,    96,
      97,    -1,    99,    -1,    -1,   102,   103,   104,   105,    -1,
     107,    94,    95,    96,    97,    98,    99,    -1,    -1,   102,
      -1,    -1,    -1,    -1,   107,    -1,    94,    95,    96,    97,
      98,    99,    -1,   116,   102,   103,   104,   105,   106,   107,
      94,    95,    96,    97,    98,    99,    -1,    -1,   102,   103,
     104,   105,    -1,   107,    94,    95,    96,    97,    98,    99,
      -1,    -1,   102,    -1,    -1,    -1,   106,   107,    94,    95,
      96,    97,    98,    99,    -1,    -1,   102,    -1,    -1,    -1,
      -1,   107
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,    19,    22,    26,    58,    74,    92,
     100,   129,   130,   131,   132,   134,   135,   136,   145,   148,
     149,   162,     7,   133,   102,   114,   150,   137,    46,    47,
      48,    49,    50,    98,   203,   204,   163,   146,     4,     0,
     131,     4,   103,     4,    68,   230,   231,    98,   102,   106,
     225,   226,   203,    98,    98,    26,    91,   100,   108,   109,
     138,   140,   141,   147,   148,   194,   195,   196,   102,   115,
      70,    94,    95,    96,    97,    99,   102,   103,   104,   105,
     107,   221,   229,   232,   234,   235,   236,   151,    98,   113,
     164,   139,     4,   141,    93,    13,    25,    74,   142,   143,
     196,   229,    70,    68,   127,    82,    83,    84,    85,    86,
      87,    88,    89,    90,   157,   158,   170,   171,   172,   113,
     236,   170,   103,   229,   102,   170,     4,   106,   229,   233,
     234,   116,   116,     4,    68,   156,   236,     4,    98,   106,
     227,   228,   229,    68,    91,   144,   221,   222,   223,   224,
     228,   234,    98,   102,    46,    47,    48,    49,    98,   159,
     160,   152,   172,   165,   113,    99,   114,    68,   117,   117,
      68,   117,     4,   153,   153,   102,   230,   224,   160,     5,
     100,   108,   109,   154,   161,   191,   192,   193,   161,   115,
     155,     4,     4,    69,   193,   194,   197,    69,   203,     9,
      11,    12,    13,    18,    19,    20,    24,    25,    26,    29,
      59,    62,    63,    71,    75,    77,    98,   102,   106,   138,
     166,   181,   183,   187,   199,   205,   206,   207,   208,   209,
     211,   219,   221,    98,   227,    13,   229,    13,   229,   229,
     221,    98,    98,   200,   102,   201,   202,    96,   102,   237,
     116,   211,   221,   116,     4,   222,     4,     4,   116,   212,
      30,    31,    32,    33,    34,    35,    36,    37,    39,    40,
      41,    42,    43,   110,   112,   113,   114,   210,   179,   229,
       9,    52,    53,    54,    55,    56,    57,    68,   220,   229,
       9,    68,   220,    68,   203,    68,   203,   203,   113,   188,
     189,   167,   184,   217,   218,   221,   116,   229,   229,   229,
     229,   229,   229,   229,   229,   229,   229,   229,   229,   229,
      13,    18,    59,    60,   102,   106,   118,   119,   120,   211,
     221,   229,   230,   102,   221,   226,    15,    16,    17,   180,
       9,   227,   227,   229,     9,   227,   227,   229,   229,    98,
     198,   221,    98,    98,   229,   190,   214,   229,   190,   174,
     185,    68,   117,   179,   213,   214,   204,   229,   237,    98,
     144,   229,   229,   229,    38,    44,    45,    51,    64,    65,
      66,    67,   111,   114,   119,   120,   121,   122,   123,   124,
     125,   126,   115,   227,     9,   227,     9,    68,   114,    68,
     113,   113,    68,   117,   215,   117,    10,    81,   169,   175,
       4,    62,    76,    78,   182,   186,   217,   113,    68,   117,
      68,   114,    68,   114,   229,   229,   229,   229,   229,   229,
     229,   229,   229,   230,   229,   229,   229,   229,   229,   229,
     229,   229,   113,   227,   227,   229,   230,    98,   236,   236,
     214,    14,   216,   214,   229,    73,    79,    80,   173,     4,
     229,     4,   209,   214,   229,   230,   229,   230,   115,   229,
     115,     4,   229,   229,   102,   221,   168,   196,   215,   116,
     115,   115,     4,    68,     4,     4,    68,     4,    68,   176,
       4,   213,   229,   229,   229,    24,    61,    72,   177,   117,
       4,     4,     4,   178,   221,     4,   203,   179,    98
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

  case 88:
#line 680 "imcc/imcc.y"
    {  yyval.t = P_NEED_LEX; }
    break;

  case 91:
#line 687 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 92:
#line 692 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 93:
#line 694 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-1].sr);
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 94:
#line 699 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 95:
#line 701 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 96:
#line 703 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 97:
#line 707 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 98:
#line 714 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 99:
#line 715 "imcc/imcc.y"
    {  add_pcc_arg(cur_call, yyvsp[-1].sr); }
    break;

  case 100:
#line 719 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 101:
#line 724 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 102:
#line 725 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(cur_call, yyvsp[-1].sr); }
    break;

  case 103:
#line 729 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 104:
#line 730 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 105:
#line 731 "imcc/imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 106:
#line 735 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 107:
#line 736 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 108:
#line 740 "imcc/imcc.y"
    {  yyval.t = VT_FLAT;   }
    break;

  case 109:
#line 741 "imcc/imcc.y"
    {  yyval.t = VT_OPTIONAL; }
    break;

  case 110:
#line 742 "imcc/imcc.y"
    {  yyval.t = VT_OPT_FLAG; }
    break;

  case 111:
#line 747 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 112:
#line 748 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 115:
#line 758 "imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 116:
#line 761 "imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 117:
#line 762 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 118:
#line 768 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 119:
#line 770 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 120:
#line 772 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 121:
#line 776 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 122:
#line 781 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 123:
#line 786 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 124:
#line 788 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 125:
#line 793 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 126:
#line 797 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 127:
#line 798 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 128:
#line 799 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 131:
#line 817 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 132:
#line 822 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
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
#line 825 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 136:
#line 829 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 140:
#line 839 "imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 141:
#line 846 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 142:
#line 850 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 143:
#line 858 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 146:
#line 868 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 147:
#line 869 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 148:
#line 870 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 149:
#line 871 "imcc/imcc.y"
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

  case 150:
#line 884 "imcc/imcc.y"
    {
                       set_lexical(interp, yyvsp[0].sr, yyvsp[-2].s); yyval.i = 0;
                    }
    break;

  case 151:
#line 887 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 152:
#line 888 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 154:
#line 890 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 155:
#line 891 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 156:
#line 892 "imcc/imcc.y"
    { yyval.i = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 157:
#line 896 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 158:
#line 898 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 159:
#line 901 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 160:
#line 902 "imcc/imcc.y"
    {  yyval.i = 0; cur_call = NULL; }
    break;

  case 161:
#line 903 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 163:
#line 905 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 164:
#line 909 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 165:
#line 910 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 166:
#line 911 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 167:
#line 912 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 168:
#line 913 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 169:
#line 914 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 170:
#line 919 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 171:
#line 929 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 172:
#line 930 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 173:
#line 931 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 174:
#line 932 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 175:
#line 933 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 176:
#line 934 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 177:
#line 935 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 178:
#line 936 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 179:
#line 937 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 180:
#line 938 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 181:
#line 939 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 182:
#line 940 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 183:
#line 942 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 944 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 185:
#line 946 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 948 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 187:
#line 950 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 952 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 189:
#line 954 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 956 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 191:
#line 958 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 960 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 193:
#line 962 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 964 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 195:
#line 966 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 196:
#line 968 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 197:
#line 970 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 972 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 974 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 200:
#line 976 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 201:
#line 979 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 202:
#line 981 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 203:
#line 985 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 987 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 989 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 206:
#line 992 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            cur_call = NULL;
            yyval.i = 0;
         }
    break;

  case 207:
#line 998 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 208:
#line 1002 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           cur_call = NULL;
         }
    break;

  case 211:
#line 1009 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[-2].sr); }
    break;

  case 212:
#line 1014 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 213:
#line 1016 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 214:
#line 1018 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 215:
#line 1020 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 216:
#line 1022 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 1024 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 218:
#line 1026 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1028 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 220:
#line 1030 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 221:
#line 1032 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 222:
#line 1034 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 223:
#line 1036 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 1038 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 1043 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 226:
#line 1049 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 227:
#line 1050 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 228:
#line 1051 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 229:
#line 1056 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 230:
#line 1057 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 231:
#line 1058 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 232:
#line 1061 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 233:
#line 1062 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 234:
#line 1067 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 235:
#line 1072 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 236:
#line 1076 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 237:
#line 1077 "imcc/imcc.y"
    {  yyval.sr = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 238:
#line 1078 "imcc/imcc.y"
    {  yyval.sr = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 239:
#line 1082 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 240:
#line 1086 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 241:
#line 1087 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 242:
#line 1091 "imcc/imcc.y"
    {  yyval.t = VT_FLAT; }
    break;

  case 243:
#line 1094 "imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 244:
#line 1098 "imcc/imcc.y"
    { yyval.sr = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 245:
#line 1099 "imcc/imcc.y"
    { yyval.sr = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 246:
#line 1104 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 247:
#line 1106 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 248:
#line 1108 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 249:
#line 1110 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 250:
#line 1112 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 251:
#line 1114 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 252:
#line 1116 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 253:
#line 1118 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 254:
#line 1122 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 255:
#line 1123 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 256:
#line 1124 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 257:
#line 1125 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 258:
#line 1126 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 259:
#line 1127 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 262:
#line 1136 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 263:
#line 1137 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 264:
#line 1141 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 266:
#line 1146 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 267:
#line 1148 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 269:
#line 1156 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 270:
#line 1160 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 271:
#line 1161 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 272:
#line 1165 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 273:
#line 1166 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 278:
#line 1179 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 279:
#line 1180 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 280:
#line 1184 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 281:
#line 1186 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 282:
#line 1187 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 283:
#line 1188 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 284:
#line 1192 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 285:
#line 1198 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 286:
#line 1200 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 287:
#line 1201 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 288:
#line 1205 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 289:
#line 1206 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 290:
#line 1207 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 291:
#line 1208 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 292:
#line 1209 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 293:
#line 1213 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 294:
#line 1214 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 295:
#line 1215 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 296:
#line 1216 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 297:
#line 1220 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 298:
#line 1221 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3478 "imcc/imcparser.c"

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


#line 1226 "imcc/imcc.y"



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

