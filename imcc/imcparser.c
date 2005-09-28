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
     FASTCALL = 261,
     N_OPERATORS = 262,
     HLL = 263,
     CALL = 264,
     GOTO = 265,
     ARG = 266,
     IF = 267,
     UNLESS = 268,
     END = 269,
     SAVEALL = 270,
     RESTOREALL = 271,
     ADV_FLAT = 272,
     ADV_SLURPY = 273,
     ADV_OPTIONAL = 274,
     ADV_OPT_FLAG = 275,
     NEW = 276,
     NEWSUB = 277,
     NEWCLOSURE = 278,
     NEWCOR = 279,
     NEWCONT = 280,
     NAMESPACE = 281,
     ENDNAMESPACE = 282,
     CLASS = 283,
     ENDCLASS = 284,
     FIELD = 285,
     DOT_METHOD = 286,
     SUB = 287,
     SYM = 288,
     LOCAL = 289,
     CONST = 290,
     INC = 291,
     DEC = 292,
     GLOBAL_CONST = 293,
     PLUS_ASSIGN = 294,
     MINUS_ASSIGN = 295,
     MUL_ASSIGN = 296,
     DIV_ASSIGN = 297,
     CONCAT_ASSIGN = 298,
     BAND_ASSIGN = 299,
     BOR_ASSIGN = 300,
     BXOR_ASSIGN = 301,
     FDIV = 302,
     FDIV_ASSIGN = 303,
     MOD_ASSIGN = 304,
     SHR_ASSIGN = 305,
     SHL_ASSIGN = 306,
     SHR_U_ASSIGN = 307,
     SHIFT_LEFT = 308,
     SHIFT_RIGHT = 309,
     INTV = 310,
     FLOATV = 311,
     STRINGV = 312,
     PMCV = 313,
     OBJECTV = 314,
     LOG_XOR = 315,
     RELOP_EQ = 316,
     RELOP_NE = 317,
     RELOP_GT = 318,
     RELOP_GTE = 319,
     RELOP_LT = 320,
     RELOP_LTE = 321,
     GLOBAL = 322,
     GLOBALOP = 323,
     ADDR = 324,
     RESULT = 325,
     RETURN = 326,
     YIELDT = 327,
     POW = 328,
     SHIFT_RIGHT_U = 329,
     LOG_AND = 330,
     LOG_OR = 331,
     COMMA = 332,
     ESUB = 333,
     DOTDOT = 334,
     PCC_BEGIN = 335,
     PCC_END = 336,
     PCC_CALL = 337,
     PCC_SUB = 338,
     PCC_BEGIN_RETURN = 339,
     PCC_END_RETURN = 340,
     PCC_BEGIN_YIELD = 341,
     PCC_END_YIELD = 342,
     NCI_CALL = 343,
     METH_CALL = 344,
     INVOCANT = 345,
     MAIN = 346,
     LOAD = 347,
     IMMEDIATE = 348,
     POSTCOMP = 349,
     METHOD = 350,
     ANON = 351,
     MULTI = 352,
     LABEL = 353,
     EMIT = 354,
     EOM = 355,
     IREG = 356,
     NREG = 357,
     SREG = 358,
     PREG = 359,
     IDENTIFIER = 360,
     REG = 361,
     MACRO = 362,
     ENDM = 363,
     STRINGC = 364,
     INTC = 365,
     FLOATC = 366,
     USTRINGC = 367,
     PARROT_OP = 368,
     VAR = 369,
     LINECOMMENT = 370,
     FILECOMMENT = 371,
     DOT = 372,
     CONCAT = 373,
     POINTY = 374
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define FASTCALL 261
#define N_OPERATORS 262
#define HLL 263
#define CALL 264
#define GOTO 265
#define ARG 266
#define IF 267
#define UNLESS 268
#define END 269
#define SAVEALL 270
#define RESTOREALL 271
#define ADV_FLAT 272
#define ADV_SLURPY 273
#define ADV_OPTIONAL 274
#define ADV_OPT_FLAG 275
#define NEW 276
#define NEWSUB 277
#define NEWCLOSURE 278
#define NEWCOR 279
#define NEWCONT 280
#define NAMESPACE 281
#define ENDNAMESPACE 282
#define CLASS 283
#define ENDCLASS 284
#define FIELD 285
#define DOT_METHOD 286
#define SUB 287
#define SYM 288
#define LOCAL 289
#define CONST 290
#define INC 291
#define DEC 292
#define GLOBAL_CONST 293
#define PLUS_ASSIGN 294
#define MINUS_ASSIGN 295
#define MUL_ASSIGN 296
#define DIV_ASSIGN 297
#define CONCAT_ASSIGN 298
#define BAND_ASSIGN 299
#define BOR_ASSIGN 300
#define BXOR_ASSIGN 301
#define FDIV 302
#define FDIV_ASSIGN 303
#define MOD_ASSIGN 304
#define SHR_ASSIGN 305
#define SHL_ASSIGN 306
#define SHR_U_ASSIGN 307
#define SHIFT_LEFT 308
#define SHIFT_RIGHT 309
#define INTV 310
#define FLOATV 311
#define STRINGV 312
#define PMCV 313
#define OBJECTV 314
#define LOG_XOR 315
#define RELOP_EQ 316
#define RELOP_NE 317
#define RELOP_GT 318
#define RELOP_GTE 319
#define RELOP_LT 320
#define RELOP_LTE 321
#define GLOBAL 322
#define GLOBALOP 323
#define ADDR 324
#define RESULT 325
#define RETURN 326
#define YIELDT 327
#define POW 328
#define SHIFT_RIGHT_U 329
#define LOG_AND 330
#define LOG_OR 331
#define COMMA 332
#define ESUB 333
#define DOTDOT 334
#define PCC_BEGIN 335
#define PCC_END 336
#define PCC_CALL 337
#define PCC_SUB 338
#define PCC_BEGIN_RETURN 339
#define PCC_END_RETURN 340
#define PCC_BEGIN_YIELD 341
#define PCC_END_YIELD 342
#define NCI_CALL 343
#define METH_CALL 344
#define INVOCANT 345
#define MAIN 346
#define LOAD 347
#define IMMEDIATE 348
#define POSTCOMP 349
#define METHOD 350
#define ANON 351
#define MULTI 352
#define LABEL 353
#define EMIT 354
#define EOM 355
#define IREG 356
#define NREG 357
#define SREG 358
#define PREG 359
#define IDENTIFIER 360
#define REG 361
#define MACRO 362
#define ENDM 363
#define STRINGC 364
#define INTC 365
#define FLOATC 366
#define USTRINGC 367
#define PARROT_OP 368
#define VAR 369
#define LINECOMMENT 370
#define FILECOMMENT 371
#define DOT 372
#define CONCAT 373
#define POINTY 374




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
 * Symbol tables and lists
 * This won't scale to multiple namespaces, for now we just keep
 * one symbol table per compilation file.
 */
SymbolTable global_sym_tab;

/*
 * No nested classes for now.
 */
static Class * current_class;
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
#line 315 "imcc/imcc.y"
typedef union {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
    Symbol * sym;
    SymbolList * symlist;
    SymbolTable * symtab;
} yystype;
/* Line 193 of /usr/share/bison/yacc.c.  */
#line 636 "imcc/imcparser.c"
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
#line 657 "imcc/imcparser.c"

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
#define YYFINAL  43
#define YYLAST   575

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  136
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  118
/* YYNRULES -- Number of rules. */
#define YYNRULES  314
/* YYNRULES -- Number of states. */
#define YYNSTATES  523

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   374

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   126,     2,     2,     2,   132,   133,     2,
     124,   125,   130,   129,     2,   127,     2,   131,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   135,
       2,   121,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   122,     2,   123,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   134,     2,   128,     2,     2,     2,
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
     116,   117,   118,   119,   120
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    24,    27,    29,    31,    35,    38,    40,    43,
      48,    52,    58,    59,    66,    67,    74,    76,    79,    83,
      86,    88,    90,    92,    94,    95,    99,   103,   104,   106,
     107,   112,   113,   115,   120,   121,   128,   130,   131,   133,
     136,   138,   140,   142,   147,   152,   153,   154,   155,   166,
     167,   169,   173,   174,   180,   181,   183,   188,   189,   193,
     195,   197,   199,   201,   203,   205,   206,   208,   209,   210,
     211,   222,   223,   233,   234,   237,   238,   242,   243,   245,
     247,   251,   253,   255,   257,   259,   261,   263,   265,   271,
     275,   279,   283,   287,   293,   299,   300,   304,   307,   308,
     312,   316,   317,   322,   323,   326,   328,   330,   332,   334,
     336,   338,   340,   341,   347,   349,   350,   353,   357,   361,
     362,   368,   369,   375,   376,   378,   382,   384,   387,   388,
     391,   394,   396,   398,   399,   401,   404,   406,   408,   412,
     414,   418,   420,   422,   425,   428,   429,   434,   435,   442,
     444,   445,   452,   453,   458,   461,   464,   467,   470,   473,
     476,   479,   480,   484,   487,   489,   491,   493,   494,   496,
     498,   500,   502,   504,   506,   508,   510,   512,   514,   516,
     520,   525,   530,   535,   541,   547,   553,   559,   565,   571,
     577,   583,   589,   595,   601,   607,   613,   619,   625,   631,
     637,   644,   651,   658,   666,   671,   676,   683,   691,   696,
     703,   708,   713,   718,   723,   730,   738,   742,   743,   753,
     755,   757,   761,   765,   769,   773,   777,   781,   785,   789,
     793,   797,   801,   805,   809,   814,   816,   818,   820,   824,
     828,   832,   834,   836,   837,   843,   844,   848,   850,   853,
     854,   857,   859,   863,   865,   872,   879,   884,   889,   894,
     899,   901,   903,   905,   907,   909,   911,   913,   915,   916,
     918,   922,   924,   926,   931,   933,   935,   937,   939,   941,
     943,   945,   947,   949,   951,   952,   955,   957,   961,   962,
     967,   969,   973,   976,   979,   981,   983,   985,   987,   989,
     991,   993,   995,   997,   999
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     137,     0,    -1,   138,    -1,   139,    -1,   138,   139,    -1,
     157,    -1,   156,    -1,   144,    -1,   143,    -1,   164,    -1,
     176,    -1,   153,    -1,   108,     4,    -1,   140,    -1,     4,
      -1,     6,   141,     4,    -1,   142,     4,    -1,     7,    -1,
       8,   111,    -1,     9,   110,    78,   110,    -1,    68,   220,
     106,    -1,    68,   220,   106,   121,   252,    -1,    -1,    36,
     145,   220,   106,   121,   252,    -1,    -1,    36,   147,   111,
     244,   121,   110,    -1,   149,    -1,   148,   149,    -1,   208,
     150,     4,    -1,   108,     4,    -1,   117,    -1,   116,    -1,
     156,    -1,   146,    -1,    -1,   151,   114,   152,    -1,    84,
     184,    99,    -1,    -1,   238,    -1,    -1,   100,   154,   155,
     101,    -1,    -1,   148,    -1,    27,   122,   246,   123,    -1,
      -1,    29,   106,   158,     4,   159,    30,    -1,   160,    -1,
      -1,   161,    -1,   160,   161,    -1,   162,    -1,   163,    -1,
       4,    -1,    31,   220,   106,     4,    -1,    32,   106,   106,
       4,    -1,    -1,    -1,    -1,    33,   165,   241,   166,   184,
       4,   167,   168,   175,    79,    -1,    -1,     4,    -1,   168,
     169,     4,    -1,    -1,     5,   170,   220,   106,   193,    -1,
      -1,    78,    -1,    98,   124,   173,   125,    -1,    -1,   173,
      78,   174,    -1,   174,    -1,    56,    -1,    57,    -1,    59,
      -1,    58,    -1,   106,    -1,    -1,   205,    -1,    -1,    -1,
      -1,    84,   177,   106,   178,   184,     4,   179,   168,   175,
      79,    -1,    -1,    81,     4,   181,   188,   183,   187,   182,
     190,    82,    -1,    -1,   210,     4,    -1,    -1,    91,   245,
       4,    -1,    -1,   185,    -1,   186,    -1,   185,   171,   186,
      -1,    93,    -1,    92,    -1,    94,    -1,    95,    -1,    97,
      -1,    96,    -1,   172,    -1,    83,   245,    78,   245,     4,
      -1,    83,   245,     4,    -1,    89,   245,     4,    -1,    90,
     237,     4,    -1,    90,   110,     4,    -1,    90,   237,    78,
     245,     4,    -1,    90,   110,    78,   245,     4,    -1,    -1,
     188,   189,     4,    -1,    12,   231,    -1,    -1,   190,   191,
       4,    -1,    71,   237,   193,    -1,    -1,    35,   192,   220,
     106,    -1,    -1,   193,   194,    -1,    19,    -1,    20,    -1,
      21,    -1,    85,    -1,    87,    -1,    86,    -1,    88,    -1,
      -1,   195,     4,   198,   199,   196,    -1,   201,    -1,    -1,
     199,     4,    -1,   199,   200,     4,    -1,    72,   245,   232,
      -1,    -1,    72,   124,   202,   204,   125,    -1,    -1,    73,
     124,   203,   204,   125,    -1,    -1,   245,    -1,   204,    78,
     245,    -1,   207,    -1,   205,   207,    -1,    -1,   206,   211,
      -1,   108,     4,    -1,   117,    -1,   116,    -1,    -1,   209,
      -1,   209,   210,    -1,   210,    -1,    99,    -1,   208,   213,
       4,    -1,   106,    -1,   212,    78,   106,    -1,   222,    -1,
     235,    -1,    27,   106,    -1,    28,   106,    -1,    -1,    35,
     214,   220,   212,    -1,    -1,    36,   215,   220,   106,   121,
     252,    -1,   146,    -1,    -1,    39,   216,   220,   106,   121,
     252,    -1,    -1,     5,   217,   220,   106,    -1,     5,   251,
      -1,    71,   245,    -1,    12,   231,    -1,    72,   245,    -1,
      72,   228,    -1,    10,   243,    -1,    11,   243,    -1,    -1,
      23,   218,   152,    -1,   114,   238,    -1,   228,    -1,   180,
      -1,   197,    -1,    -1,    23,    -1,    24,    -1,    25,    -1,
      26,    -1,    56,    -1,    57,    -1,    58,    -1,    59,    -1,
      60,    -1,   221,    -1,   106,    -1,   237,   121,   245,    -1,
     237,   121,   126,   245,    -1,   237,   121,   127,   245,    -1,
     237,   121,   128,   245,    -1,   237,   121,   245,   129,   245,
      -1,   237,   121,   245,   127,   245,    -1,   237,   121,   245,
     130,   245,    -1,   237,   121,   245,    74,   245,    -1,   237,
     121,   245,   131,   245,    -1,   237,   121,   245,    48,   245,
      -1,   237,   121,   245,   132,   245,    -1,   237,   121,   245,
     119,   245,    -1,   237,   121,   245,    54,   245,    -1,   237,
     121,   245,    55,   245,    -1,   237,   121,   245,    75,   245,
      -1,   237,   121,   245,    76,   245,    -1,   237,   121,   245,
      77,   245,    -1,   237,   121,   245,    61,   245,    -1,   237,
     121,   245,   133,   245,    -1,   237,   121,   245,   134,   245,
      -1,   237,   121,   245,   128,   245,    -1,   237,   121,   245,
     122,   246,   123,    -1,   237,   122,   246,   123,   121,   245,
      -1,   237,   121,    22,   221,    78,   245,    -1,   237,   121,
      22,   221,   122,   246,   123,    -1,   237,   121,    22,   221,
      -1,   237,   121,    22,   245,    -1,   237,   121,    22,   245,
      78,   245,    -1,   237,   121,    22,   245,   122,   246,   123,
      -1,   237,   121,   219,   106,    -1,   237,   121,   219,   106,
      78,   106,    -1,   237,   121,    70,   106,    -1,   237,   121,
      69,   253,    -1,    69,   253,   121,   245,    -1,    22,   237,
      78,   245,    -1,    22,   237,    78,   245,    78,   245,    -1,
      22,   237,    78,   245,   122,   246,   123,    -1,   237,   121,
     228,    -1,    -1,   223,   124,   234,   125,   121,   226,   124,
     230,   125,    -1,   224,    -1,   225,    -1,   237,    40,   245,
      -1,   237,    41,   245,    -1,   237,    42,   245,    -1,   237,
      43,   245,    -1,   237,    50,   245,    -1,   237,    49,   245,
      -1,   237,    44,   245,    -1,   237,    45,   245,    -1,   237,
      46,   245,    -1,   237,    47,   245,    -1,   237,    51,   245,
      -1,   237,    52,   245,    -1,   237,    53,   245,    -1,   237,
     121,   114,   152,    -1,   106,    -1,   110,    -1,   237,    -1,
     237,   227,   242,    -1,   237,   227,   110,    -1,   237,   227,
     237,    -1,   120,    -1,   118,    -1,    -1,   226,   229,   124,
     230,   125,    -1,    -1,   230,    78,   231,    -1,   231,    -1,
     245,   232,    -1,    -1,   232,   233,    -1,    18,    -1,   234,
      78,   237,    -1,   237,    -1,    13,   245,   236,   245,    11,
     243,    -1,    14,   245,   236,   245,    11,   243,    -1,    13,
     245,    11,   243,    -1,    14,   245,    11,   243,    -1,    13,
     245,    78,   243,    -1,    14,   245,    78,   243,    -1,    62,
      -1,    63,    -1,    64,    -1,    65,    -1,    66,    -1,    67,
      -1,   115,    -1,   251,    -1,    -1,   239,    -1,   239,    78,
     240,    -1,   240,    -1,   244,    -1,   237,   122,   246,   123,
      -1,   242,    -1,   110,    -1,   106,    -1,   114,    -1,   106,
      -1,   114,    -1,   243,    -1,   245,    -1,   237,    -1,   252,
      -1,    -1,   247,   248,    -1,   250,    -1,   248,   135,   250,
      -1,    -1,   248,    78,   249,   250,    -1,   245,    -1,   245,
      80,   245,    -1,    80,   245,    -1,   245,    80,    -1,   102,
      -1,   103,    -1,   104,    -1,   105,    -1,   107,    -1,   111,
      -1,   112,    -1,   110,    -1,   113,    -1,   104,    -1,   110,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   398,   398,   402,   404,   407,   409,   410,   411,   412,
     413,   414,   415,   416,   417,   420,   421,   424,   425,   433,
     444,   451,   460,   459,   465,   464,   468,   470,   473,   475,
     476,   477,   478,   479,   482,   482,   486,   492,   495,   500,
     499,   510,   512,   515,   533,   531,   547,   549,   552,   554,
     557,   559,   560,   563,   577,   595,   601,   604,   593,   609,
     611,   612,   616,   615,   621,   623,   627,   630,   632,   633,
     636,   638,   639,   640,   641,   653,   655,   659,   661,   665,
     658,   672,   670,   702,   704,   707,   709,   713,   715,   718,
     720,   723,   725,   726,   727,   728,   729,   730,   733,   739,
     741,   746,   748,   750,   754,   761,   763,   766,   771,   773,
     776,   778,   778,   782,   784,   787,   789,   790,   794,   796,
     799,   801,   806,   804,   810,   815,   817,   819,   823,   829,
     827,   836,   835,   844,   846,   847,   851,   853,   864,   868,
     871,   872,   873,   876,   878,   881,   883,   886,   892,   897,
     905,   913,   915,   916,   917,   918,   918,   931,   931,   933,
     934,   934,   936,   936,   939,   940,   941,   942,   943,   947,
     948,   949,   949,   952,   955,   956,   957,   958,   961,   963,
     964,   965,   968,   970,   971,   972,   973,   974,   977,   988,
     990,   991,   992,   993,   994,   995,   996,   997,   998,   999,
    1000,  1001,  1003,  1005,  1007,  1009,  1011,  1013,  1015,  1017,
    1019,  1021,  1023,  1025,  1027,  1029,  1031,  1033,  1035,  1038,
    1045,  1048,  1050,  1054,  1056,  1058,  1061,  1068,  1067,  1076,
    1077,  1080,  1083,  1085,  1087,  1089,  1091,  1093,  1095,  1097,
    1099,  1101,  1103,  1105,  1109,  1117,  1118,  1119,  1124,  1125,
    1126,  1129,  1130,  1135,  1133,  1143,  1145,  1146,  1149,  1153,
    1155,  1158,  1162,  1164,  1167,  1170,  1172,  1174,  1176,  1178,
    1182,  1184,  1185,  1186,  1187,  1188,  1191,  1193,  1196,  1198,
    1201,  1203,  1206,  1208,  1215,  1217,  1220,  1222,  1225,  1227,
    1230,  1232,  1235,  1237,  1240,  1240,  1244,  1246,  1248,  1248,
    1252,  1258,  1261,  1262,  1265,  1267,  1268,  1269,  1270,  1273,
    1275,  1276,  1277,  1280,  1282
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "PRAGMA", 
  "FASTCALL", "N_OPERATORS", "HLL", "CALL", "GOTO", "ARG", "IF", "UNLESS", 
  "END", "SAVEALL", "RESTOREALL", "ADV_FLAT", "ADV_SLURPY", 
  "ADV_OPTIONAL", "ADV_OPT_FLAG", "NEW", "NEWSUB", "NEWCLOSURE", "NEWCOR", 
  "NEWCONT", "NAMESPACE", "ENDNAMESPACE", "CLASS", "ENDCLASS", "FIELD", 
  "DOT_METHOD", "SUB", "SYM", "LOCAL", "CONST", "INC", "DEC", 
  "GLOBAL_CONST", "PLUS_ASSIGN", "MINUS_ASSIGN", "MUL_ASSIGN", 
  "DIV_ASSIGN", "CONCAT_ASSIGN", "BAND_ASSIGN", "BOR_ASSIGN", 
  "BXOR_ASSIGN", "FDIV", "FDIV_ASSIGN", "MOD_ASSIGN", "SHR_ASSIGN", 
  "SHL_ASSIGN", "SHR_U_ASSIGN", "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", 
  "FLOATV", "STRINGV", "PMCV", "OBJECTV", "LOG_XOR", "RELOP_EQ", 
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
  "opt_pasmcode", "class_namespace", "class", "@5", "class_body", 
  "member_decls", "member_decl", "field_decl", "method_decl", "sub", "@6", 
  "@7", "@8", "sub_params", "sub_param", "@9", "opt_comma", "multi", 
  "multi_types", "multi_type", "sub_body", "pcc_sub", "@10", "@11", "@12", 
  "pcc_sub_call", "@13", "opt_label", "opt_invocant", "sub_proto", 
  "sub_proto_list", "proto", "pcc_call", "pcc_args", "pcc_arg", 
  "pcc_results", "pcc_result", "@14", "paramtype_list", "paramtype", 
  "begin_ret_or_yield", "end_ret_or_yield", "pcc_ret", "@15", 
  "pcc_returns", "pcc_return", "pcc_return_many", "@16", "@17", 
  "var_returns", "statements", "helper_clear_state", "statement", 
  "labels", "_labels", "label", "instruction", "id_list", "labeled_inst", 
  "@18", "@19", "@20", "@21", "@22", "newsub", "type", "classname", 
  "assignment", "@23", "op_assign", "func_assign", "the_sub", "ptr", 
  "sub_call", "@24", "arglist", "arg", "argtype_list", "argtype", 
  "targetlist", "if_statement", "relop", "target", "vars", "_vars", 
  "_var_or_i", "sub_label_op_c", "sub_label_op", "label_op", "var_or_i", 
  "var", "keylist", "@25", "_keylist", "@26", "key", "reg", "const", 
  "string", 0
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
     364,   365,   366,   367,   368,   369,   370,   371,   372,   373,
     374,    61,    91,    93,    40,    41,    33,    45,   126,    43,
      42,    47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   136,   137,   138,   138,   139,   139,   139,   139,   139,
     139,   139,   139,   139,   139,   140,   140,   141,   141,   142,
     143,   143,   145,   144,   147,   146,   148,   148,   149,   149,
     149,   149,   149,   149,   151,   150,   150,   150,   152,   154,
     153,   155,   155,   156,   158,   157,   159,   159,   160,   160,
     161,   161,   161,   162,   163,   165,   166,   167,   164,   168,
     168,   168,   170,   169,   171,   171,   172,   173,   173,   173,
     174,   174,   174,   174,   174,   175,   175,   177,   178,   179,
     176,   181,   180,   182,   182,   183,   183,   184,   184,   185,
     185,   186,   186,   186,   186,   186,   186,   186,   187,   187,
     187,   187,   187,   187,   187,   188,   188,   189,   190,   190,
     191,   192,   191,   193,   193,   194,   194,   194,   195,   195,
     196,   196,   198,   197,   197,   199,   199,   199,   200,   202,
     201,   203,   201,   204,   204,   204,   205,   205,   206,   207,
     207,   207,   207,   208,   208,   209,   209,   210,   211,   212,
     212,   213,   213,   213,   213,   214,   213,   215,   213,   213,
     216,   213,   217,   213,   213,   213,   213,   213,   213,   213,
     213,   218,   213,   213,   213,   213,   213,   213,   219,   219,
     219,   219,   220,   220,   220,   220,   220,   220,   221,   222,
     222,   222,   222,   222,   222,   222,   222,   222,   222,   222,
     222,   222,   222,   222,   222,   222,   222,   222,   222,   222,
     222,   222,   222,   222,   222,   222,   222,   222,   222,   222,
     222,   222,   222,   222,   222,   222,   222,   223,   222,   222,
     222,   224,   224,   224,   224,   224,   224,   224,   224,   224,
     224,   224,   224,   224,   225,   226,   226,   226,   226,   226,
     226,   227,   227,   229,   228,   230,   230,   230,   231,   232,
     232,   233,   234,   234,   235,   235,   235,   235,   235,   235,
     236,   236,   236,   236,   236,   236,   237,   237,   238,   238,
     239,   239,   240,   240,   241,   241,   242,   242,   243,   243,
     244,   244,   245,   245,   247,   246,   248,   248,   249,   248,
     250,   250,   250,   250,   251,   251,   251,   251,   251,   252,
     252,   252,   252,   253,   253
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     2,     1,     1,     3,     2,     1,     2,     4,
       3,     5,     0,     6,     0,     6,     1,     2,     3,     2,
       1,     1,     1,     1,     0,     3,     3,     0,     1,     0,
       4,     0,     1,     4,     0,     6,     1,     0,     1,     2,
       1,     1,     1,     4,     4,     0,     0,     0,    10,     0,
       1,     3,     0,     5,     0,     1,     4,     0,     3,     1,
       1,     1,     1,     1,     1,     0,     1,     0,     0,     0,
      10,     0,     9,     0,     2,     0,     3,     0,     1,     1,
       3,     1,     1,     1,     1,     1,     1,     1,     5,     3,
       3,     3,     3,     5,     5,     0,     3,     2,     0,     3,
       3,     0,     4,     0,     2,     1,     1,     1,     1,     1,
       1,     1,     0,     5,     1,     0,     2,     3,     3,     0,
       5,     0,     5,     0,     1,     3,     1,     2,     0,     2,
       2,     1,     1,     0,     1,     2,     1,     1,     3,     1,
       3,     1,     1,     2,     2,     0,     4,     0,     6,     1,
       0,     6,     0,     4,     2,     2,     2,     2,     2,     2,
       2,     0,     3,     2,     1,     1,     1,     0,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     3,
       4,     4,     4,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       6,     6,     6,     7,     4,     4,     6,     7,     4,     6,
       4,     4,     4,     4,     6,     7,     3,     0,     9,     1,
       1,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     4,     1,     1,     1,     3,     3,
       3,     1,     1,     0,     5,     0,     3,     1,     2,     0,
       2,     1,     3,     1,     6,     6,     4,     4,     4,     4,
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
       0,    14,     0,     0,     0,     0,    55,    22,     0,    77,
      39,     0,     0,     2,     3,    13,     0,     8,     7,    11,
       6,     5,     9,    10,    17,     0,     0,     0,   294,    44,
       0,     0,   182,   183,   184,   185,   186,   188,     0,   187,
       0,   143,    12,     1,     4,    16,    18,    15,     0,     0,
       0,     0,   286,   285,   287,    56,   284,     0,    20,    78,
      24,   147,     0,    31,    30,    33,   143,    26,     0,    32,
      34,   144,   146,    19,    43,     0,   304,   305,   306,   307,
     308,   311,   309,   310,   312,   276,   292,   300,   295,   296,
     277,   293,    47,    87,     0,     0,    87,     0,    29,    27,
      40,    87,     0,     0,   145,   302,   303,   298,     0,    52,
       0,     0,     0,    46,    48,    50,    51,    92,    91,    93,
      94,    96,    95,     0,    97,     0,    64,    89,     0,    21,
       0,     0,     0,    28,   278,   301,     0,   297,     0,     0,
      45,    49,    67,    57,    65,     0,    23,    79,   288,   289,
     290,     0,   291,    36,    35,   292,    38,   279,   281,   282,
     299,     0,     0,    70,    71,    73,    72,    74,     0,    69,
      59,    90,    59,     0,   294,     0,    53,    54,     0,    66,
      60,   138,   138,    25,     0,   280,    68,    62,     0,   142,
     141,     0,     0,   138,   143,   136,     0,   283,     0,   140,
      61,    58,   137,   177,   139,    80,     0,   162,     0,     0,
       0,     0,     0,     0,   171,     0,     0,   155,   157,   160,
       0,     0,     0,     0,     0,   118,   119,   245,   246,   278,
     159,   175,     0,   176,   124,     0,   151,     0,   229,   230,
     253,   174,   152,   247,   113,     0,   164,   169,   170,   166,
     259,     0,     0,     0,   278,   153,   154,     0,     0,     0,
     313,   314,     0,   165,   311,   129,   168,   292,   167,   131,
      81,   173,   122,   148,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   252,
     251,     0,   294,     0,    63,     0,   258,     0,   270,   271,
     272,   273,   274,   275,     0,     0,     0,     0,     0,     0,
     172,     0,     0,     0,     0,   133,   133,   105,   125,     0,
     263,   255,   231,   232,   233,   234,   237,   238,   239,   240,
     236,   235,   241,   242,   243,     0,   178,   179,   180,   181,
       0,     0,   278,     0,     0,     0,     0,   226,   189,     0,
     249,   250,   248,   115,   116,   117,   114,   163,   261,   260,
     266,   268,     0,   267,   269,     0,   223,   149,   156,     0,
       0,   222,     0,   134,     0,    85,     0,     0,     0,     0,
     257,   214,   215,   221,   220,   244,   190,   191,   192,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   294,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   294,     0,     0,     0,     0,   130,   132,     0,
       0,     0,     0,   126,     0,   120,   121,   123,     0,   262,
       0,     0,   254,     0,   294,     0,   294,     0,   198,   201,
     202,   206,   196,   203,   204,   205,   200,     0,   194,   209,
     193,   195,   197,   199,   207,   208,     0,   264,   265,   224,
       0,   150,   158,   161,   135,   107,     0,     0,     0,     0,
      83,   106,   259,   127,     0,   247,   256,   212,     0,   216,
       0,   219,   210,   211,   225,    86,     0,     0,     0,     0,
     108,     0,   128,   255,   213,   217,    99,     0,   100,   102,
       0,   101,     0,     0,    84,     0,     0,     0,     0,   111,
       0,    82,     0,   228,    98,   104,   103,     0,   113,   109,
       0,   110,   112
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    12,    13,    14,    15,    26,    16,    17,    18,    31,
      65,    97,    66,    67,   102,   103,   154,    19,    41,    68,
      20,    21,    51,   112,   113,   114,   115,   116,    22,    30,
      93,   170,   181,   191,   198,   145,   124,   168,   169,   192,
      23,    40,    96,   172,   231,   317,   490,   421,   125,   126,
     127,   470,   375,   422,   503,   512,   517,   294,   356,   232,
     427,   233,   318,   376,   428,   234,   315,   316,   372,   193,
     194,   195,    70,    71,    72,   204,   368,   235,   257,   258,
     259,   245,   254,   346,    38,    39,   236,   237,   238,   239,
     240,   293,   241,   275,   379,   380,   296,   359,   319,   242,
     305,    86,   156,   157,   158,    55,    56,   150,   159,   152,
      49,    50,    88,   136,    89,    90,    91,   262
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -243
static const short yypact[] =
{
       7,  -243,    49,   -90,   -69,   -21,  -243,  -243,     8,  -243,
    -243,    83,   145,     7,  -243,  -243,   143,  -243,  -243,  -243,
    -243,  -243,  -243,  -243,  -243,    55,   157,    93,  -243,  -243,
      66,     8,  -243,  -243,  -243,  -243,  -243,  -243,    88,  -243,
      89,   -18,  -243,  -243,  -243,  -243,  -243,  -243,    98,    82,
     213,   205,  -243,  -243,  -243,  -243,  -243,   104,    90,  -243,
    -243,  -243,   208,  -243,  -243,  -243,    61,  -243,   119,  -243,
      18,   123,  -243,  -243,  -243,   446,  -243,  -243,  -243,  -243,
    -243,  -243,  -243,  -243,  -243,  -243,  -243,   144,   -64,  -243,
    -243,  -243,    41,    95,   102,    45,    95,   132,  -243,  -243,
    -243,    95,   241,   140,  -243,  -243,   446,  -243,   213,  -243,
       8,   150,   216,    41,  -243,  -243,  -243,  -243,  -243,  -243,
    -243,  -243,  -243,   133,  -243,   255,     6,  -243,    45,  -243,
     256,   227,   166,  -243,   227,  -243,   213,  -243,   160,   170,
    -243,  -243,   -32,  -243,  -243,    95,  -243,  -243,  -243,  -243,
    -243,   142,  -243,  -243,  -243,   158,  -243,   203,  -243,  -243,
    -243,   280,   281,  -243,  -243,  -243,  -243,  -243,   -63,  -243,
     282,  -243,   282,   177,  -243,   227,  -243,  -243,   -32,  -243,
    -243,     3,     3,  -243,   167,  -243,  -243,  -243,   285,  -243,
    -243,   287,   215,    65,   123,  -243,   220,  -243,     8,  -243,
    -243,  -243,  -243,   391,  -243,  -243,   189,   114,   -59,   -59,
     446,   446,   446,   377,  -243,   202,   221,  -243,   181,  -243,
     -50,   446,   330,   190,   315,  -243,  -243,  -243,  -243,   227,
    -243,  -243,   332,  -243,  -243,   348,  -243,   237,  -243,  -243,
    -243,  -243,  -243,   260,  -243,     8,  -243,  -243,  -243,  -243,
    -243,   137,   186,   284,   227,  -243,  -243,     8,     8,     8,
    -243,  -243,   242,  -243,   243,  -243,  -243,   -87,  -243,  -243,
    -243,  -243,  -243,  -243,   377,   244,   446,   446,   446,   446,
     446,   446,   446,   446,   446,   446,   446,   446,   446,  -243,
    -243,    26,  -243,   423,   164,   259,   352,   -59,  -243,  -243,
    -243,  -243,  -243,  -243,   -59,   446,   -59,   -59,   446,   446,
    -243,   265,   269,   270,   446,   446,   446,  -243,  -243,   -49,
    -243,   446,  -243,  -243,  -243,  -243,  -243,  -243,  -243,  -243,
    -243,  -243,  -243,  -243,  -243,   406,  -243,  -243,  -243,  -243,
     -50,   273,   227,   446,   446,   446,   277,  -243,   413,   262,
    -243,  -243,  -243,  -243,  -243,  -243,  -243,  -243,  -243,  -243,
    -243,  -243,   355,  -243,  -243,   376,     0,  -243,   311,   271,
     272,  -243,   -15,  -243,    -9,    -5,    37,   377,   274,    -8,
    -243,    48,    64,  -243,  -243,  -243,  -243,  -243,  -243,   312,
     446,   446,   446,   446,   446,   446,   446,   446,   446,  -243,
     446,   446,   446,   446,   446,   446,   446,   446,   276,   -59,
     -59,   446,  -243,   288,    45,    45,   446,  -243,  -243,   446,
     446,    60,   387,  -243,   446,  -243,  -243,  -243,   394,  -243,
     460,   446,  -243,   446,  -243,   446,  -243,   293,  -243,  -243,
    -243,  -243,  -243,  -243,  -243,  -243,  -243,   283,  -243,  -243,
    -243,  -243,  -243,  -243,  -243,  -243,   446,  -243,  -243,  -243,
     289,  -243,  -243,  -243,  -243,  -243,   403,   446,   446,   168,
     123,  -243,  -243,  -243,   286,   -76,  -243,  -243,   294,  -243,
     299,  -243,  -243,  -243,  -243,  -243,    15,   404,    28,    34,
    -243,   407,   352,   446,  -243,  -243,  -243,   446,  -243,  -243,
     446,  -243,   446,    42,  -243,    43,   412,   419,   420,  -243,
     377,  -243,   421,  -243,  -243,  -243,  -243,     8,  -243,  -243,
     322,   164,  -243
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -243,  -243,  -243,   416,  -243,  -243,  -243,  -243,  -243,  -243,
     228,  -243,  -243,   372,  -243,  -243,  -242,  -243,  -243,  -243,
     -20,  -243,  -243,  -243,  -243,   326,  -243,  -243,  -243,  -243,
    -243,  -243,   275,  -243,  -243,  -243,  -243,  -243,   266,   267,
    -243,  -243,  -243,  -243,  -243,  -243,  -243,  -243,    50,  -243,
     303,  -243,  -243,  -243,  -243,  -243,  -243,   -67,  -243,  -243,
    -243,  -243,  -243,  -243,  -243,  -243,  -243,  -243,   136,  -243,
    -243,   263,   264,  -243,   -70,  -243,  -243,  -243,  -243,  -243,
    -243,  -243,  -243,  -243,   -31,   122,  -243,  -243,  -243,  -243,
      29,  -243,  -199,  -243,   -28,  -206,    -6,  -243,  -243,  -243,
     217,   -95,   246,  -243,   295,  -243,   178,  -203,   342,   -47,
    -157,  -243,  -243,  -243,   -78,   278,   -93,   151
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -248
static const short yytable[] =
{
      57,   104,   129,    87,   249,   247,   248,   419,   187,     4,
     -88,     1,   310,     2,   107,   178,     3,   184,    60,   496,
      27,    69,   -37,   266,   163,   164,   165,   166,   105,   377,
     137,   289,   499,   290,     4,   146,     5,  -247,   501,   155,
       6,   423,   289,     7,   290,   109,    69,   148,   335,   336,
     337,   338,   339,    28,   260,   149,    24,    25,   160,   135,
     261,    87,   179,   416,    32,    33,    34,    35,    36,   416,
     431,   108,   110,   111,   167,     8,   378,   509,   411,   138,
     155,    61,   -75,   -41,   144,    29,   420,    42,     4,    87,
      62,     9,   347,   497,   360,   340,   341,    60,    63,    64,
     385,   361,   101,   363,   364,   -88,   500,    10,   243,   424,
     417,   188,   502,   510,    37,    11,   418,   432,   253,   189,
     190,   431,   412,   425,   511,   426,   433,   267,    76,    77,
      78,    79,   227,    80,   155,   349,   264,    82,    83,    84,
     342,    85,   435,   467,   -76,    43,   130,    45,   297,   468,
     469,   132,   343,   344,   345,    81,    82,    83,    84,   155,
      61,    47,   -42,   250,   251,   252,    46,   206,   513,    62,
     434,    48,    52,   188,   263,   268,    53,    63,    64,   320,
      54,   189,   190,   353,   354,   355,   436,   117,   118,   119,
     120,   121,   122,   123,    58,    59,   267,   306,   351,   298,
     299,   300,   301,   302,   303,    74,   457,   458,    73,    92,
      94,    95,    98,   465,   295,   304,    76,    77,    78,    79,
     100,    80,    61,   128,   106,   476,   311,   312,   313,   322,
     323,   324,   325,   326,   327,   328,   329,   330,   331,   332,
     333,   334,   447,   131,   348,   133,   140,   155,   298,   299,
     300,   301,   302,   303,   134,   460,   139,   142,   362,   143,
     147,   365,   366,   173,   307,   153,   161,   371,   373,   373,
      76,    77,    78,    79,   250,    80,   162,   478,   488,   480,
     174,   175,   429,    85,   176,   177,   180,   183,   382,   199,
     197,   200,   -24,    75,   201,   244,   386,   387,   388,   205,
     276,   277,   278,   279,   280,   281,   282,   283,   255,   284,
     285,   286,   287,   288,   269,    76,    77,    78,    79,   270,
      80,   462,   463,    81,    82,    83,    84,   256,    85,    76,
      77,    78,    79,   148,    80,   475,   272,    81,    82,    83,
      84,   149,    85,   438,   439,   440,   441,   442,   443,   444,
     445,   446,   273,   448,   449,   450,   451,   452,   453,   454,
     455,   274,   309,   314,   459,   357,   409,  -246,   321,   464,
     358,   367,   250,   466,   489,   369,   370,   472,   289,   384,
     290,   291,   292,   389,   250,   408,   477,   410,   479,   413,
     437,   471,   414,   415,   461,   430,   207,   456,   473,   481,
     491,   208,   209,   210,   211,   212,   482,   485,   498,   483,
     493,   504,   484,   213,   214,   518,   514,   494,   215,   216,
     486,   487,   495,   515,   516,   519,   217,   218,   522,    44,
     219,   230,    76,    77,    78,    79,   227,    80,    99,   141,
     264,    82,    83,    84,   186,    85,   250,   182,   171,   196,
     506,   521,   374,   507,   265,   508,   202,   381,   203,   474,
     220,   390,   221,   222,   223,   505,   492,   391,   392,   308,
     185,   352,   224,   151,   393,   271,   225,     0,   226,    76,
      77,    78,    79,     0,    80,   246,   520,   394,   395,   396,
     397,   383,    85,    76,    77,    78,    79,   227,    80,     0,
       0,   228,     0,     0,     0,   229,    85,     0,    76,    77,
      78,    79,    37,    80,     0,  -227,    81,    82,    83,    84,
       0,    85,     0,     0,     0,    76,    77,    78,    79,    52,
      80,     0,   398,   350,     0,   399,     0,    54,    85,     0,
     400,   401,   402,   403,   404,   405,   406,   407,    76,    77,
      78,    79,     0,    80,     0,     0,    81,    82,    83,    84,
       0,    85,    76,    77,    78,    79,   227,    80,     0,     0,
     228,     0,     0,     0,     0,    85
};

static const short yycheck[] =
{
      31,    71,    95,    50,   210,   208,   209,    12,     5,    27,
       4,     4,   254,     6,    78,    78,     9,   174,    36,     4,
     110,    41,     4,   222,    56,    57,    58,    59,    75,    78,
     108,   118,     4,   120,    27,   128,    29,   124,     4,   134,
      33,     4,   118,    36,   120,     4,    66,   106,    22,    23,
      24,    25,    26,   122,   104,   114,     7,     8,   136,   106,
     110,   108,   125,    78,    56,    57,    58,    59,    60,    78,
      78,   135,    31,    32,   106,    68,   125,    35,    78,   110,
     175,    99,    79,   101,    78,   106,    91,     4,    27,   136,
     108,    84,   291,    78,   297,    69,    70,    36,   116,   117,
     342,   304,    84,   306,   307,    99,    78,   100,   203,    72,
     125,   108,    78,    71,   106,   108,   125,   125,   213,   116,
     117,    78,   122,    86,    82,    88,    78,   222,   102,   103,
     104,   105,   106,   107,   229,   292,   110,   111,   112,   113,
     114,   115,    78,    83,    79,     0,    96,     4,    11,    89,
      90,   101,   126,   127,   128,   110,   111,   112,   113,   254,
      99,     4,   101,   210,   211,   212,   111,   198,   125,   108,
     122,    78,   106,   108,   221,   222,   110,   116,   117,   274,
     114,   116,   117,    19,    20,    21,   122,    92,    93,    94,
      95,    96,    97,    98,   106,   106,   291,    11,   293,    62,
      63,    64,    65,    66,    67,   123,   409,   410,   110,     4,
     106,   121,     4,   419,   245,    78,   102,   103,   104,   105,
     101,   107,    99,   121,    80,   431,   257,   258,   259,   276,
     277,   278,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   399,   111,   291,     4,    30,   342,    62,    63,
      64,    65,    66,    67,   114,   412,   106,   124,   305,     4,
       4,   308,   309,   121,    78,    99,   106,   314,   315,   316,
     102,   103,   104,   105,   321,   107,   106,   434,   110,   436,
     122,    78,   377,   115,     4,     4,     4,   110,   335,     4,
     123,     4,   111,    80,    79,   106,   343,   344,   345,    79,
      40,    41,    42,    43,    44,    45,    46,    47,   106,    49,
      50,    51,    52,    53,   124,   102,   103,   104,   105,     4,
     107,   414,   415,   110,   111,   112,   113,   106,   115,   102,
     103,   104,   105,   106,   107,   430,     4,   110,   111,   112,
     113,   114,   115,   390,   391,   392,   393,   394,   395,   396,
     397,   398,     4,   400,   401,   402,   403,   404,   405,   406,
     407,   124,    78,   121,   411,   106,    11,   124,   124,   416,
      18,   106,   419,   420,   469,   106,   106,   424,   118,   106,
     120,   121,   122,   106,   431,   123,   433,    11,   435,    78,
      78,     4,   121,   121,   106,   121,     5,   121,     4,   106,
     470,    10,    11,    12,    13,    14,   123,     4,     4,   456,
     124,     4,   123,    22,    23,   510,     4,   123,    27,    28,
     467,   468,   123,     4,     4,     4,    35,    36,   106,    13,
      39,   203,   102,   103,   104,   105,   106,   107,    66,   113,
     110,   111,   112,   113,   178,   115,   493,   172,   145,   182,
     497,   518,   316,   500,   124,   502,   193,   335,   194,   430,
      69,    48,    71,    72,    73,   493,   472,    54,    55,   252,
     175,   293,    81,   131,    61,   229,    85,    -1,    87,   102,
     103,   104,   105,    -1,   107,   207,   517,    74,    75,    76,
      77,   340,   115,   102,   103,   104,   105,   106,   107,    -1,
      -1,   110,    -1,    -1,    -1,   114,   115,    -1,   102,   103,
     104,   105,   106,   107,    -1,   124,   110,   111,   112,   113,
      -1,   115,    -1,    -1,    -1,   102,   103,   104,   105,   106,
     107,    -1,   119,   110,    -1,   122,    -1,   114,   115,    -1,
     127,   128,   129,   130,   131,   132,   133,   134,   102,   103,
     104,   105,    -1,   107,    -1,    -1,   110,   111,   112,   113,
      -1,   115,   102,   103,   104,   105,   106,   107,    -1,    -1,
     110,    -1,    -1,    -1,    -1,   115
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     9,    27,    29,    33,    36,    68,    84,
     100,   108,   137,   138,   139,   140,   142,   143,   144,   153,
     156,   157,   164,   176,     7,     8,   141,   110,   122,   106,
     165,   145,    56,    57,    58,    59,    60,   106,   220,   221,
     177,   154,     4,     0,   139,     4,   111,     4,    78,   246,
     247,   158,   106,   110,   114,   241,   242,   220,   106,   106,
      36,    99,   108,   116,   117,   146,   148,   149,   155,   156,
     208,   209,   210,   110,   123,    80,   102,   103,   104,   105,
     107,   110,   111,   112,   113,   115,   237,   245,   248,   250,
     251,   252,     4,   166,   106,   121,   178,   147,     4,   149,
     101,    84,   150,   151,   210,   245,    80,    78,   135,     4,
      31,    32,   159,   160,   161,   162,   163,    92,    93,    94,
      95,    96,    97,    98,   172,   184,   185,   186,   121,   252,
     184,   111,   184,     4,   114,   245,   249,   250,   220,   106,
      30,   161,   124,     4,    78,   171,   252,     4,   106,   114,
     243,   244,   245,    99,   152,   237,   238,   239,   240,   244,
     250,   106,   106,    56,    57,    58,    59,   106,   173,   174,
     167,   186,   179,   121,   122,    78,     4,     4,    78,   125,
       4,   168,   168,   110,   246,   240,   174,     5,   108,   116,
     117,   169,   175,   205,   206,   207,   175,   123,   170,     4,
       4,    79,   207,   208,   211,    79,   220,     5,    10,    11,
      12,    13,    14,    22,    23,    27,    28,    35,    36,    39,
      69,    71,    72,    73,    81,    85,    87,   106,   110,   114,
     146,   180,   195,   197,   201,   213,   222,   223,   224,   225,
     226,   228,   235,   237,   106,   217,   251,   243,   243,   231,
     245,   245,   245,   237,   218,   106,   106,   214,   215,   216,
     104,   110,   253,   245,   110,   124,   228,   237,   245,   124,
       4,   238,     4,     4,   124,   229,    40,    41,    42,    43,
      44,    45,    46,    47,    49,    50,    51,    52,    53,   118,
     120,   121,   122,   227,   193,   220,   232,    11,    62,    63,
      64,    65,    66,    67,    78,   236,    11,    78,   236,    78,
     152,   220,   220,   220,   121,   202,   203,   181,   198,   234,
     237,   124,   245,   245,   245,   245,   245,   245,   245,   245,
     245,   245,   245,   245,   245,    22,    23,    24,    25,    26,
      69,    70,   114,   126,   127,   128,   219,   228,   245,   246,
     110,   237,   242,    19,    20,    21,   194,   106,    18,   233,
     243,   243,   245,   243,   243,   245,   245,   106,   212,   106,
     106,   245,   204,   245,   204,   188,   199,    78,   125,   230,
     231,   221,   245,   253,   106,   152,   245,   245,   245,   106,
      48,    54,    55,    61,    74,    75,    76,    77,   119,   122,
     127,   128,   129,   130,   131,   132,   133,   134,   123,    11,
      11,    78,   122,    78,   121,   121,    78,   125,   125,    12,
      91,   183,   189,     4,    72,    86,    88,   196,   200,   237,
     121,    78,   125,    78,   122,    78,   122,    78,   245,   245,
     245,   245,   245,   245,   245,   245,   245,   246,   245,   245,
     245,   245,   245,   245,   245,   245,   121,   243,   243,   245,
     246,   106,   252,   252,   245,   231,   245,    83,    89,    90,
     187,     4,   245,     4,   226,   237,   231,   245,   246,   245,
     246,   106,   123,   245,   123,     4,   245,   245,   110,   237,
     182,   210,   232,   124,   123,   123,     4,    78,     4,     4,
      78,     4,    78,   190,     4,   230,   245,   245,   245,    35,
      71,    82,   191,   125,     4,     4,     4,   192,   237,     4,
     220,   193,   106
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
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
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
    { yyval.i = yyvsp[0].i; }
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
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
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
#line 417 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 420 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 421 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 17:
#line 424 "imcc/imcc.y"
    { IMCC_INFO(interp)->state->pragmas |= PR_FASTCALL; }
    break;

  case 18:
#line 426 "imcc/imcc.y"
    { if (yyvsp[0].s)
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 19:
#line 434 "imcc/imcc.y"
    {
            STRING *hll_name, *hll_lib;
            hll_name = string_unescape_cstring(interp, yyvsp[-2].s + 1, '"', NULL);
            hll_lib =  string_unescape_cstring(interp, yyvsp[0].s + 1, '"', NULL);
            IMCC_INFO(interp)->HLL_id =
                Parrot_register_HLL(interp, hll_name, hll_lib);
            yyval.t = 0;
         }
    break;

  case 20:
#line 446 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 21:
#line 452 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 22:
#line 460 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 23:
#line 461 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 24:
#line 465 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 25:
#line 466 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 28:
#line 474 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 29:
#line 475 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 30:
#line 476 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 31:
#line 477 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 32:
#line 478 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 34:
#line 482 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 35:
#line 484 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 36:
#line 487 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, yyvsp[0].s));
                     cur_call->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 37:
#line 492 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 39:
#line 500 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 40:
#line 502 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 43:
#line 517 "imcc/imcc.y"
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
#line 533 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 45:
#line 540 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 47:
#line 549 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 52:
#line 560 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 565 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[-1].s);
                      if(lookup_field_symbol(current_class, yyvsp[-1].s)) {
                        IMCC_fataly(interp, E_SyntaxError,
                            "field '%s' previously declared in class '%s'\n",
                            yyvsp[-1].s, current_class->sym->name);
                      }
                      sym->type = yyvsp[-2].t;
                      store_field_symbol(current_class, sym);
                      yyval.i = 0; }
    break;

  case 54:
#line 579 "imcc/imcc.y"
    {
           Method * meth;
           Symbol * sym = new_symbol(yyvsp[-2].s);
           if(lookup_method_symbol(current_class, yyvsp[-2].s)) {
                IMCC_fataly(interp, E_SyntaxError,
                 "method '%s' previously declared in class '%s'\n",
                    yyvsp[-2].s, current_class->sym->name);
           }
           meth = new_method(sym, new_symbol(yyvsp[-1].s));
           store_method_symbol(current_class, sym);
           yyval.i = 0;
        }
    break;

  case 55:
#line 595 "imcc/imcc.y"
    {
           cur_unit = (IMCC_INFO(interp)->state->pragmas & PR_FASTCALL ?
                  imc_open_unit(interp, IMC_FASTSUB)
                : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 56:
#line 601 "imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, yyvsp[0].sr);
        }
    break;

  case 57:
#line 604 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 58:
#line 606 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 59:
#line 610 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 60:
#line 611 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 61:
#line 612 "imcc/imcc.y"
    { add_pcc_param(cur_call, yyvsp[-1].sr);}
    break;

  case 62:
#line 616 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 63:
#line 617 "imcc/imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-2].t);
                                         is_def=0; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 64:
#line 622 "imcc/imcc.y"
    { yyval.t = 0;  }
    break;

  case 66:
#line 627 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 67:
#line 631 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 68:
#line 632 "imcc/imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); }
    break;

  case 69:
#line 633 "imcc/imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);}
    break;

  case 70:
#line 637 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 71:
#line 638 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 72:
#line 639 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 73:
#line 640 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 74:
#line 641 "imcc/imcc.y"
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

  case 77:
#line 659 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 78:
#line 661 "imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, yyvsp[0].s));

         }
    break;

  case 79:
#line 665 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 80:
#line 667 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 81:
#line 672 "imcc/imcc.y"
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

  case 82:
#line 699 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 83:
#line 703 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 84:
#line 704 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 85:
#line 708 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 86:
#line 710 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 87:
#line 714 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 89:
#line 719 "imcc/imcc.y"
    { yyval.t = yyvsp[0].t; }
    break;

  case 90:
#line 720 "imcc/imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; }
    break;

  case 91:
#line 724 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 92:
#line 725 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 93:
#line 726 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 94:
#line 727 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 95:
#line 728 "imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 96:
#line 729 "imcc/imcc.y"
    {  yyval.t = P_METHOD; }
    break;

  case 98:
#line 735 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 99:
#line 740 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 100:
#line 742 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-1].sr);
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 101:
#line 747 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 102:
#line 749 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 103:
#line 751 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 104:
#line 755 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 105:
#line 762 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 106:
#line 763 "imcc/imcc.y"
    {  add_pcc_arg(cur_call, yyvsp[-1].sr); }
    break;

  case 107:
#line 767 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 108:
#line 772 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 109:
#line 773 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(cur_call, yyvsp[-1].sr); }
    break;

  case 110:
#line 777 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 111:
#line 778 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 112:
#line 779 "imcc/imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 113:
#line 783 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 114:
#line 784 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 115:
#line 788 "imcc/imcc.y"
    {  yyval.t = VT_FLAT;   }
    break;

  case 116:
#line 789 "imcc/imcc.y"
    {  yyval.t = VT_OPTIONAL; }
    break;

  case 117:
#line 790 "imcc/imcc.y"
    {  yyval.t = VT_OPT_FLAG; }
    break;

  case 118:
#line 795 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 119:
#line 796 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 122:
#line 806 "imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 123:
#line 809 "imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 124:
#line 810 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 125:
#line 816 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 126:
#line 818 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 127:
#line 820 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 128:
#line 824 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 129:
#line 829 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 130:
#line 834 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 131:
#line 836 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 132:
#line 841 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 133:
#line 845 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 134:
#line 846 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 135:
#line 847 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 138:
#line 865 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 139:
#line 870 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 140:
#line 871 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 141:
#line 872 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 142:
#line 873 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 143:
#line 877 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 147:
#line 887 "imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 148:
#line 894 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 149:
#line 898 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 150:
#line 906 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 153:
#line 916 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 154:
#line 917 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 155:
#line 918 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 156:
#line 919 "imcc/imcc.y"
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

  case 157:
#line 931 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 158:
#line 932 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 160:
#line 934 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 161:
#line 935 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 162:
#line 936 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 163:
#line 937 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
                                1, mk_ident(interp, yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 164:
#line 939 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 165:
#line 940 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 166:
#line 941 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 167:
#line 942 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 168:
#line 943 "imcc/imcc.y"
    { yyval.i = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 169:
#line 947 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 170:
#line 948 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 171:
#line 949 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 172:
#line 951 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 173:
#line 953 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 174:
#line 955 "imcc/imcc.y"
    {  yyval.i = 0; cur_call = NULL; }
    break;

  case 175:
#line 956 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 177:
#line 958 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 178:
#line 962 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 179:
#line 963 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 180:
#line 964 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 181:
#line 965 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 182:
#line 969 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 183:
#line 970 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 184:
#line 971 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 185:
#line 972 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 186:
#line 973 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 187:
#line 974 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 188:
#line 979 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 189:
#line 989 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 990 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 191:
#line 991 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 192:
#line 992 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 193:
#line 993 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 994 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 195:
#line 995 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 996 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 997 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 998 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 999 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 1000 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 201:
#line 1002 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 1004 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 1006 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 1008 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 1010 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 1012 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 1014 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 208:
#line 1016 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 1018 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 210:
#line 1020 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 211:
#line 1022 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 1024 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 213:
#line 1026 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 214:
#line 1028 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 215:
#line 1030 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 216:
#line 1032 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 1034 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 218:
#line 1036 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                  mk_sub_address(interp, yyvsp[0].s), NULL, 1); }
    break;

  case 219:
#line 1039 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(interp, yyvsp[-2].s),
                                           mk_sub_address(interp, yyvsp[0].s), 1); }
    break;

  case 220:
#line 1046 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 221:
#line 1049 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 222:
#line 1051 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 223:
#line 1055 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 1057 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 1059 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 226:
#line 1062 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            cur_call = NULL;
            yyval.i = 0;
         }
    break;

  case 227:
#line 1068 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 228:
#line 1072 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           cur_call = NULL;
         }
    break;

  case 231:
#line 1082 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 232:
#line 1084 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 233:
#line 1086 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 234:
#line 1088 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 235:
#line 1090 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 236:
#line 1092 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 237:
#line 1094 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 238:
#line 1096 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 239:
#line 1098 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 240:
#line 1100 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 241:
#line 1102 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 242:
#line 1104 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 243:
#line 1106 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 244:
#line 1111 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 245:
#line 1117 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 246:
#line 1118 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 247:
#line 1119 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 248:
#line 1124 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 249:
#line 1125 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 250:
#line 1126 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 251:
#line 1129 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 252:
#line 1130 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 253:
#line 1135 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 254:
#line 1140 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 255:
#line 1144 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 256:
#line 1145 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 257:
#line 1146 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 258:
#line 1150 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 259:
#line 1154 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 260:
#line 1155 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 261:
#line 1159 "imcc/imcc.y"
    {  yyval.t = VT_FLAT; }
    break;

  case 262:
#line 1163 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 263:
#line 1164 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 264:
#line 1169 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 265:
#line 1171 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 266:
#line 1173 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 267:
#line 1175 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 268:
#line 1177 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 269:
#line 1179 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 270:
#line 1183 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 271:
#line 1184 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 272:
#line 1185 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 273:
#line 1186 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 274:
#line 1187 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 275:
#line 1188 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 278:
#line 1197 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 279:
#line 1198 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 280:
#line 1202 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 282:
#line 1207 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 283:
#line 1209 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 285:
#line 1217 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 286:
#line 1221 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 287:
#line 1222 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 288:
#line 1226 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 289:
#line 1227 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 294:
#line 1240 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 295:
#line 1241 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 296:
#line 1245 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 297:
#line 1247 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 298:
#line 1248 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 299:
#line 1249 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 300:
#line 1253 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 301:
#line 1259 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 302:
#line 1261 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 303:
#line 1262 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 304:
#line 1266 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 305:
#line 1267 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 306:
#line 1268 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 307:
#line 1269 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 308:
#line 1270 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 309:
#line 1274 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 310:
#line 1275 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 311:
#line 1276 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 312:
#line 1277 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 313:
#line 1281 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 314:
#line 1282 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3606 "imcc/imcparser.c"

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


#line 1287 "imcc/imcc.y"



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

