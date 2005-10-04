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
     ADV_FLAT = 269,
     ADV_SLURPY = 270,
     ADV_OPTIONAL = 271,
     ADV_OPT_FLAG = 272,
     NEW = 273,
     NEWSUB = 274,
     NEWCLOSURE = 275,
     NEWCOR = 276,
     NEWCONT = 277,
     NAMESPACE = 278,
     ENDNAMESPACE = 279,
     CLASS = 280,
     ENDCLASS = 281,
     FIELD = 282,
     DOT_METHOD = 283,
     SUB = 284,
     SYM = 285,
     LOCAL = 286,
     CONST = 287,
     INC = 288,
     DEC = 289,
     GLOBAL_CONST = 290,
     PLUS_ASSIGN = 291,
     MINUS_ASSIGN = 292,
     MUL_ASSIGN = 293,
     DIV_ASSIGN = 294,
     CONCAT_ASSIGN = 295,
     BAND_ASSIGN = 296,
     BOR_ASSIGN = 297,
     BXOR_ASSIGN = 298,
     FDIV = 299,
     FDIV_ASSIGN = 300,
     MOD_ASSIGN = 301,
     SHR_ASSIGN = 302,
     SHL_ASSIGN = 303,
     SHR_U_ASSIGN = 304,
     SHIFT_LEFT = 305,
     SHIFT_RIGHT = 306,
     INTV = 307,
     FLOATV = 308,
     STRINGV = 309,
     PMCV = 310,
     OBJECTV = 311,
     LOG_XOR = 312,
     RELOP_EQ = 313,
     RELOP_NE = 314,
     RELOP_GT = 315,
     RELOP_GTE = 316,
     RELOP_LT = 317,
     RELOP_LTE = 318,
     GLOBAL = 319,
     GLOBALOP = 320,
     ADDR = 321,
     RESULT = 322,
     RETURN = 323,
     YIELDT = 324,
     POW = 325,
     SHIFT_RIGHT_U = 326,
     LOG_AND = 327,
     LOG_OR = 328,
     COMMA = 329,
     ESUB = 330,
     DOTDOT = 331,
     PCC_BEGIN = 332,
     PCC_END = 333,
     PCC_CALL = 334,
     PCC_SUB = 335,
     PCC_BEGIN_RETURN = 336,
     PCC_END_RETURN = 337,
     PCC_BEGIN_YIELD = 338,
     PCC_END_YIELD = 339,
     NCI_CALL = 340,
     METH_CALL = 341,
     INVOCANT = 342,
     MAIN = 343,
     LOAD = 344,
     IMMEDIATE = 345,
     POSTCOMP = 346,
     METHOD = 347,
     ANON = 348,
     MULTI = 349,
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
#define FASTCALL 261
#define N_OPERATORS 262
#define HLL 263
#define CALL 264
#define GOTO 265
#define ARG 266
#define IF 267
#define UNLESS 268
#define ADV_FLAT 269
#define ADV_SLURPY 270
#define ADV_OPTIONAL 271
#define ADV_OPT_FLAG 272
#define NEW 273
#define NEWSUB 274
#define NEWCLOSURE 275
#define NEWCOR 276
#define NEWCONT 277
#define NAMESPACE 278
#define ENDNAMESPACE 279
#define CLASS 280
#define ENDCLASS 281
#define FIELD 282
#define DOT_METHOD 283
#define SUB 284
#define SYM 285
#define LOCAL 286
#define CONST 287
#define INC 288
#define DEC 289
#define GLOBAL_CONST 290
#define PLUS_ASSIGN 291
#define MINUS_ASSIGN 292
#define MUL_ASSIGN 293
#define DIV_ASSIGN 294
#define CONCAT_ASSIGN 295
#define BAND_ASSIGN 296
#define BOR_ASSIGN 297
#define BXOR_ASSIGN 298
#define FDIV 299
#define FDIV_ASSIGN 300
#define MOD_ASSIGN 301
#define SHR_ASSIGN 302
#define SHL_ASSIGN 303
#define SHR_U_ASSIGN 304
#define SHIFT_LEFT 305
#define SHIFT_RIGHT 306
#define INTV 307
#define FLOATV 308
#define STRINGV 309
#define PMCV 310
#define OBJECTV 311
#define LOG_XOR 312
#define RELOP_EQ 313
#define RELOP_NE 314
#define RELOP_GT 315
#define RELOP_GTE 316
#define RELOP_LT 317
#define RELOP_LTE 318
#define GLOBAL 319
#define GLOBALOP 320
#define ADDR 321
#define RESULT 322
#define RETURN 323
#define YIELDT 324
#define POW 325
#define SHIFT_RIGHT_U 326
#define LOG_AND 327
#define LOG_OR 328
#define COMMA 329
#define ESUB 330
#define DOTDOT 331
#define PCC_BEGIN 332
#define PCC_END 333
#define PCC_CALL 334
#define PCC_SUB 335
#define PCC_BEGIN_RETURN 336
#define PCC_END_RETURN 337
#define PCC_BEGIN_YIELD 338
#define PCC_END_YIELD 339
#define NCI_CALL 340
#define METH_CALL 341
#define INVOCANT 342
#define MAIN 343
#define LOAD 344
#define IMMEDIATE 345
#define POSTCOMP 346
#define METHOD 347
#define ANON 348
#define MULTI 349
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
#line 630 "imcc/imcparser.c"
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
#line 651 "imcc/imcparser.c"

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
#define YYLAST   544

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  133
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  117
/* YYNRULES -- Number of rules. */
#define YYNRULES  307
/* YYNRULES -- Number of states. */
#define YYNSTATES  511

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   371

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

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
     444,   445,   452,   455,   458,   459,   463,   466,   468,   470,
     472,   473,   475,   477,   479,   481,   483,   485,   487,   489,
     491,   493,   495,   499,   504,   509,   514,   520,   526,   532,
     538,   544,   550,   556,   562,   568,   574,   580,   586,   592,
     598,   604,   610,   616,   623,   630,   637,   645,   650,   655,
     662,   670,   675,   682,   687,   692,   697,   702,   709,   717,
     721,   722,   732,   734,   736,   740,   744,   748,   752,   756,
     760,   764,   768,   772,   776,   780,   784,   788,   793,   795,
     797,   799,   803,   807,   811,   813,   815,   816,   822,   823,
     827,   829,   832,   833,   836,   838,   842,   844,   851,   858,
     863,   868,   873,   878,   880,   882,   884,   886,   888,   890,
     892,   894,   895,   897,   901,   903,   905,   910,   912,   914,
     916,   918,   920,   922,   924,   926,   928,   930,   931,   934,
     936,   940,   941,   946,   948,   952,   955,   958,   960,   962,
     964,   966,   968,   970,   972,   974,   976,   978
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     134,     0,    -1,   135,    -1,   136,    -1,   135,   136,    -1,
     154,    -1,   153,    -1,   141,    -1,   140,    -1,   161,    -1,
     173,    -1,   150,    -1,   105,     4,    -1,   137,    -1,     4,
      -1,     6,   138,     4,    -1,   139,     4,    -1,     7,    -1,
       8,   108,    -1,     9,   107,    75,   107,    -1,    65,   216,
     103,    -1,    65,   216,   103,   118,   248,    -1,    -1,    33,
     142,   216,   103,   118,   248,    -1,    -1,    33,   144,   108,
     240,   118,   107,    -1,   146,    -1,   145,   146,    -1,   205,
     147,     4,    -1,   105,     4,    -1,   114,    -1,   113,    -1,
     153,    -1,   143,    -1,    -1,   148,   111,   149,    -1,    81,
     181,    96,    -1,    -1,   234,    -1,    -1,    97,   151,   152,
      98,    -1,    -1,   145,    -1,    24,   119,   242,   120,    -1,
      -1,    26,   103,   155,     4,   156,    27,    -1,   157,    -1,
      -1,   158,    -1,   157,   158,    -1,   159,    -1,   160,    -1,
       4,    -1,    28,   216,   103,     4,    -1,    29,   103,   103,
       4,    -1,    -1,    -1,    -1,    30,   162,   237,   163,   181,
       4,   164,   165,   172,    76,    -1,    -1,     4,    -1,   165,
     166,     4,    -1,    -1,     5,   167,   216,   103,   190,    -1,
      -1,    75,    -1,    95,   121,   170,   122,    -1,    -1,   170,
      75,   171,    -1,   171,    -1,    53,    -1,    54,    -1,    56,
      -1,    55,    -1,   103,    -1,    -1,   202,    -1,    -1,    -1,
      -1,    81,   174,   103,   175,   181,     4,   176,   165,   172,
      76,    -1,    -1,    78,     4,   178,   185,   180,   184,   179,
     187,    79,    -1,    -1,   207,     4,    -1,    -1,    88,   241,
       4,    -1,    -1,   182,    -1,   183,    -1,   182,   168,   183,
      -1,    90,    -1,    89,    -1,    91,    -1,    92,    -1,    94,
      -1,    93,    -1,   169,    -1,    80,   241,    75,   241,     4,
      -1,    80,   241,     4,    -1,    86,   241,     4,    -1,    87,
     233,     4,    -1,    87,   107,     4,    -1,    87,   233,    75,
     241,     4,    -1,    87,   107,    75,   241,     4,    -1,    -1,
     185,   186,     4,    -1,    12,   227,    -1,    -1,   187,   188,
       4,    -1,    68,   233,   190,    -1,    -1,    32,   189,   216,
     103,    -1,    -1,   190,   191,    -1,    16,    -1,    17,    -1,
      18,    -1,    82,    -1,    84,    -1,    83,    -1,    85,    -1,
      -1,   192,     4,   195,   196,   193,    -1,   198,    -1,    -1,
     196,     4,    -1,   196,   197,     4,    -1,    69,   241,   228,
      -1,    -1,    69,   121,   199,   201,   122,    -1,    -1,    70,
     121,   200,   201,   122,    -1,    -1,   241,    -1,   201,    75,
     241,    -1,   204,    -1,   202,   204,    -1,    -1,   203,   208,
      -1,   105,     4,    -1,   114,    -1,   113,    -1,    -1,   206,
      -1,   206,   207,    -1,   207,    -1,    96,    -1,   205,   210,
       4,    -1,   103,    -1,   209,    75,   103,    -1,   218,    -1,
     231,    -1,    24,   103,    -1,    25,   103,    -1,    -1,    32,
     211,   216,   209,    -1,    -1,    33,   212,   216,   103,   118,
     248,    -1,   143,    -1,    -1,    36,   213,   216,   103,   118,
     248,    -1,    69,   224,    -1,    11,   239,    -1,    -1,    20,
     214,   149,    -1,   111,   234,    -1,   224,    -1,   177,    -1,
     194,    -1,    -1,    20,    -1,    21,    -1,    22,    -1,    23,
      -1,    53,    -1,    54,    -1,    55,    -1,    56,    -1,    57,
      -1,   217,    -1,   103,    -1,   233,   118,   241,    -1,   233,
     118,   123,   241,    -1,   233,   118,   124,   241,    -1,   233,
     118,   125,   241,    -1,   233,   118,   241,   126,   241,    -1,
     233,   118,   241,   124,   241,    -1,   233,   118,   241,   127,
     241,    -1,   233,   118,   241,    71,   241,    -1,   233,   118,
     241,   128,   241,    -1,   233,   118,   241,    45,   241,    -1,
     233,   118,   241,   129,   241,    -1,   233,   118,   241,   116,
     241,    -1,   233,   118,   241,    51,   241,    -1,   233,   118,
     241,    52,   241,    -1,   233,   118,   241,    72,   241,    -1,
     233,   118,   241,    73,   241,    -1,   233,   118,   241,    74,
     241,    -1,   233,   118,   241,    58,   241,    -1,   233,   118,
     241,   130,   241,    -1,   233,   118,   241,   131,   241,    -1,
     233,   118,   241,   125,   241,    -1,   233,   118,   241,   119,
     242,   120,    -1,   233,   119,   242,   120,   118,   241,    -1,
     233,   118,    19,   217,    75,   241,    -1,   233,   118,    19,
     217,   119,   242,   120,    -1,   233,   118,    19,   217,    -1,
     233,   118,    19,   241,    -1,   233,   118,    19,   241,    75,
     241,    -1,   233,   118,    19,   241,   119,   242,   120,    -1,
     233,   118,   215,   103,    -1,   233,   118,   215,   103,    75,
     103,    -1,   233,   118,    67,   103,    -1,   233,   118,    66,
     249,    -1,    66,   249,   118,   241,    -1,    19,   233,    75,
     241,    -1,    19,   233,    75,   241,    75,   241,    -1,    19,
     233,    75,   241,   119,   242,   120,    -1,   233,   118,   224,
      -1,    -1,   219,   121,   230,   122,   118,   222,   121,   226,
     122,    -1,   220,    -1,   221,    -1,   233,    37,   241,    -1,
     233,    38,   241,    -1,   233,    39,   241,    -1,   233,    40,
     241,    -1,   233,    47,   241,    -1,   233,    46,   241,    -1,
     233,    41,   241,    -1,   233,    42,   241,    -1,   233,    43,
     241,    -1,   233,    44,   241,    -1,   233,    48,   241,    -1,
     233,    49,   241,    -1,   233,    50,   241,    -1,   233,   118,
     111,   149,    -1,   103,    -1,   107,    -1,   233,    -1,   233,
     223,   238,    -1,   233,   223,   107,    -1,   233,   223,   233,
      -1,   117,    -1,   115,    -1,    -1,   222,   225,   121,   226,
     122,    -1,    -1,   226,    75,   227,    -1,   227,    -1,   241,
     228,    -1,    -1,   228,   229,    -1,    15,    -1,   230,    75,
     233,    -1,   233,    -1,    13,   241,   232,   241,    11,   239,
      -1,    14,   241,   232,   241,    11,   239,    -1,    13,   241,
      11,   239,    -1,    14,   241,    11,   239,    -1,    13,   241,
      75,   239,    -1,    14,   241,    75,   239,    -1,    59,    -1,
      60,    -1,    61,    -1,    62,    -1,    63,    -1,    64,    -1,
     112,    -1,   247,    -1,    -1,   235,    -1,   235,    75,   236,
      -1,   236,    -1,   240,    -1,   233,   119,   242,   120,    -1,
     238,    -1,   107,    -1,   103,    -1,   111,    -1,   103,    -1,
     111,    -1,   239,    -1,   241,    -1,   233,    -1,   248,    -1,
      -1,   243,   244,    -1,   246,    -1,   244,   132,   246,    -1,
      -1,   244,    75,   245,   246,    -1,   241,    -1,   241,    77,
     241,    -1,    77,   241,    -1,   241,    77,    -1,    99,    -1,
     100,    -1,   101,    -1,   102,    -1,   104,    -1,   108,    -1,
     109,    -1,   107,    -1,   110,    -1,   101,    -1,   107,    -1
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
     934,   934,   936,   940,   941,   941,   944,   947,   948,   949,
     950,   953,   955,   956,   957,   960,   962,   963,   964,   965,
     966,   969,   980,   982,   983,   984,   985,   986,   987,   988,
     989,   990,   991,   992,   993,   995,   997,   999,  1001,  1003,
    1005,  1007,  1009,  1011,  1013,  1015,  1017,  1019,  1021,  1023,
    1025,  1027,  1030,  1037,  1040,  1042,  1046,  1048,  1050,  1053,
    1060,  1059,  1068,  1069,  1072,  1075,  1077,  1079,  1081,  1083,
    1085,  1087,  1089,  1091,  1093,  1095,  1097,  1101,  1109,  1110,
    1111,  1116,  1117,  1118,  1121,  1122,  1127,  1125,  1135,  1137,
    1138,  1141,  1145,  1147,  1150,  1154,  1156,  1159,  1162,  1164,
    1166,  1168,  1170,  1174,  1176,  1177,  1178,  1179,  1180,  1183,
    1185,  1188,  1190,  1193,  1195,  1198,  1200,  1207,  1209,  1212,
    1214,  1217,  1219,  1222,  1224,  1227,  1229,  1232,  1232,  1236,
    1238,  1240,  1240,  1244,  1250,  1253,  1254,  1257,  1259,  1260,
    1261,  1262,  1265,  1267,  1268,  1269,  1272,  1274
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "PRAGMA", 
  "FASTCALL", "N_OPERATORS", "HLL", "CALL", "GOTO", "ARG", "IF", "UNLESS", 
  "ADV_FLAT", "ADV_SLURPY", "ADV_OPTIONAL", "ADV_OPT_FLAG", "NEW", 
  "NEWSUB", "NEWCLOSURE", "NEWCOR", "NEWCONT", "NAMESPACE", 
  "ENDNAMESPACE", "CLASS", "ENDCLASS", "FIELD", "DOT_METHOD", "SUB", 
  "SYM", "LOCAL", "CONST", "INC", "DEC", "GLOBAL_CONST", "PLUS_ASSIGN", 
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
  "@18", "@19", "@20", "@21", "newsub", "type", "classname", "assignment", 
  "@22", "op_assign", "func_assign", "the_sub", "ptr", "sub_call", "@23", 
  "arglist", "arg", "argtype_list", "argtype", "targetlist", 
  "if_statement", "relop", "target", "vars", "_vars", "_var_or_i", 
  "sub_label_op_c", "sub_label_op", "label_op", "var_or_i", "var", 
  "keylist", "@24", "_keylist", "@25", "key", "reg", "const", "string", 0
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
     136,   136,   136,   136,   136,   137,   137,   138,   138,   139,
     140,   140,   142,   141,   144,   143,   145,   145,   146,   146,
     146,   146,   146,   146,   148,   147,   147,   147,   149,   151,
     150,   152,   152,   153,   155,   154,   156,   156,   157,   157,
     158,   158,   158,   159,   160,   162,   163,   164,   161,   165,
     165,   165,   167,   166,   168,   168,   169,   170,   170,   170,
     171,   171,   171,   171,   171,   172,   172,   174,   175,   176,
     173,   178,   177,   179,   179,   180,   180,   181,   181,   182,
     182,   183,   183,   183,   183,   183,   183,   183,   184,   184,
     184,   184,   184,   184,   184,   185,   185,   186,   187,   187,
     188,   189,   188,   190,   190,   191,   191,   191,   192,   192,
     193,   193,   195,   194,   194,   196,   196,   196,   197,   199,
     198,   200,   198,   201,   201,   201,   202,   202,   203,   204,
     204,   204,   204,   205,   205,   206,   206,   207,   208,   209,
     209,   210,   210,   210,   210,   211,   210,   212,   210,   210,
     213,   210,   210,   210,   214,   210,   210,   210,   210,   210,
     210,   215,   215,   215,   215,   216,   216,   216,   216,   216,
     216,   217,   218,   218,   218,   218,   218,   218,   218,   218,
     218,   218,   218,   218,   218,   218,   218,   218,   218,   218,
     218,   218,   218,   218,   218,   218,   218,   218,   218,   218,
     218,   218,   218,   218,   218,   218,   218,   218,   218,   218,
     219,   218,   218,   218,   220,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   220,   220,   221,   222,   222,
     222,   222,   222,   222,   223,   223,   225,   224,   226,   226,
     226,   227,   228,   228,   229,   230,   230,   231,   231,   231,
     231,   231,   231,   232,   232,   232,   232,   232,   232,   233,
     233,   234,   234,   235,   235,   236,   236,   237,   237,   238,
     238,   239,   239,   240,   240,   241,   241,   243,   242,   244,
     244,   245,   244,   246,   246,   246,   246,   247,   247,   247,
     247,   247,   248,   248,   248,   248,   249,   249
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
       0,     6,     2,     2,     0,     3,     2,     1,     1,     1,
       0,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     3,     4,     4,     4,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     6,     6,     6,     7,     4,     4,     6,
       7,     4,     6,     4,     4,     4,     4,     6,     7,     3,
       0,     9,     1,     1,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     4,     1,     1,
       1,     3,     3,     3,     1,     1,     0,     5,     0,     3,
       1,     2,     0,     2,     1,     3,     1,     6,     6,     4,
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
       0,    14,     0,     0,     0,     0,    55,    22,     0,    77,
      39,     0,     0,     2,     3,    13,     0,     8,     7,    11,
       6,     5,     9,    10,    17,     0,     0,     0,   287,    44,
       0,     0,   175,   176,   177,   178,   179,   181,     0,   180,
       0,   143,    12,     1,     4,    16,    18,    15,     0,     0,
       0,     0,   279,   278,   280,    56,   277,     0,    20,    78,
      24,   147,     0,    31,    30,    33,   143,    26,     0,    32,
      34,   144,   146,    19,    43,     0,   297,   298,   299,   300,
     301,   304,   302,   303,   305,   269,   285,   293,   288,   289,
     270,   286,    47,    87,     0,     0,    87,     0,    29,    27,
      40,    87,     0,     0,   145,   295,   296,   291,     0,    52,
       0,     0,     0,    46,    48,    50,    51,    92,    91,    93,
      94,    96,    95,     0,    97,     0,    64,    89,     0,    21,
       0,     0,     0,    28,   271,   294,     0,   290,     0,     0,
      45,    49,    67,    57,    65,     0,    23,    79,   281,   282,
     283,     0,   284,    36,    35,   285,    38,   272,   274,   275,
     292,     0,     0,    70,    71,    73,    72,    74,     0,    69,
      59,    90,    59,     0,   287,     0,    53,    54,     0,    66,
      60,   138,   138,    25,     0,   273,    68,    62,     0,   142,
     141,     0,     0,   138,   143,   136,     0,   276,     0,   140,
      61,    58,   137,   170,   139,    80,     0,     0,     0,     0,
       0,   164,     0,     0,   155,   157,   160,     0,     0,     0,
       0,   118,   119,   238,   239,   271,   159,   168,     0,   169,
     124,     0,   151,     0,   222,   223,   246,   167,   152,   240,
     113,   163,     0,     0,     0,   271,   153,   154,     0,     0,
       0,   306,   307,     0,   129,   162,   240,   131,    81,   166,
     122,   148,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   245,   244,     0,
     287,     0,    63,     0,   263,   264,   265,   266,   267,   268,
       0,     0,     0,     0,     0,     0,   165,     0,     0,     0,
       0,   133,   133,   105,   125,     0,   256,   248,   224,   225,
     226,   227,   230,   231,   232,   233,   229,   228,   234,   235,
     236,     0,   171,   172,   173,   174,     0,     0,   304,   271,
       0,     0,     0,     0,   219,   285,   182,     0,   242,   243,
     241,   115,   116,   117,   114,   259,   261,     0,   260,   262,
       0,   216,   149,   156,     0,     0,   215,     0,   134,     0,
      85,     0,     0,     0,     0,   250,   252,   207,   208,   214,
     213,   237,   183,   184,   185,   211,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   287,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   287,     0,
       0,     0,     0,   130,   132,     0,     0,     0,     0,   126,
       0,   120,   121,   123,     0,   255,     0,     0,   247,   251,
       0,   287,     0,   287,     0,   191,   194,   195,   199,   189,
     196,   197,   198,   193,     0,   187,   202,   186,   188,   190,
     192,   200,   201,     0,   257,   258,   217,     0,   150,   158,
     161,   135,   107,     0,     0,     0,     0,    83,   106,   252,
     127,     0,   249,   254,   253,   205,     0,   209,     0,   212,
     203,   204,   218,    86,     0,     0,     0,     0,   108,     0,
     128,   248,   206,   210,    99,     0,   100,   102,     0,   101,
       0,     0,    84,     0,     0,     0,     0,   111,     0,    82,
       0,   221,    98,   104,   103,     0,   113,   109,     0,   110,
     112
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    12,    13,    14,    15,    26,    16,    17,    18,    31,
      65,    97,    66,    67,   102,   103,   154,    19,    41,    68,
      20,    21,    51,   112,   113,   114,   115,   116,    22,    30,
      93,   170,   181,   191,   198,   145,   124,   168,   169,   192,
      23,    40,    96,   172,   227,   303,   478,   407,   125,   126,
     127,   457,   360,   408,   491,   500,   505,   282,   344,   228,
     413,   229,   304,   361,   414,   230,   301,   302,   357,   193,
     194,   195,    70,    71,    72,   204,   353,   231,   248,   249,
     250,   245,   333,    38,    39,   232,   233,   234,   235,   236,
     281,   237,   263,   364,   365,   419,   464,   305,   238,   291,
      86,   156,   157,   158,    55,    56,   150,   159,   152,    49,
      50,    88,   136,    89,    90,    91,   253
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -381
static const short yypact[] =
{
      43,  -381,    25,   -89,  -109,   -61,  -381,  -381,     4,  -381,
    -381,    42,    45,    43,  -381,  -381,    59,  -381,  -381,  -381,
    -381,  -381,  -381,  -381,  -381,    30,   114,    93,  -381,  -381,
     -63,     4,  -381,  -381,  -381,  -381,  -381,  -381,    39,  -381,
      76,    32,  -381,  -381,  -381,  -381,  -381,  -381,    77,    29,
     356,   183,  -381,  -381,  -381,  -381,  -381,    86,    82,  -381,
    -381,  -381,   207,  -381,  -381,  -381,    57,  -381,   135,  -381,
      10,   138,  -381,  -381,  -381,   404,  -381,  -381,  -381,  -381,
    -381,  -381,  -381,  -381,  -381,  -381,  -381,   160,   -55,  -381,
    -381,  -381,   122,   190,   120,   100,   190,   131,  -381,  -381,
    -381,   190,   244,   141,  -381,  -381,   404,  -381,   356,  -381,
       4,   152,   234,   122,  -381,  -381,  -381,  -381,  -381,  -381,
    -381,  -381,  -381,   143,  -381,   261,     0,  -381,   100,  -381,
     262,   376,   171,  -381,   376,  -381,   356,  -381,   165,   168,
    -381,  -381,   103,  -381,  -381,   190,  -381,  -381,  -381,  -381,
    -381,   172,  -381,  -381,  -381,   156,  -381,   214,  -381,  -381,
    -381,   287,   294,  -381,  -381,  -381,  -381,  -381,   -67,  -381,
     295,  -381,   295,   199,  -381,   376,  -381,  -381,   103,  -381,
    -381,     7,     7,  -381,   187,  -381,  -381,  -381,   315,  -381,
    -381,   316,   245,    67,   138,  -381,   246,  -381,     4,  -381,
    -381,  -381,  -381,     2,  -381,  -381,   221,    16,   404,   404,
     255,  -381,   222,   224,  -381,   220,  -381,    40,   319,   208,
     326,  -381,  -381,  -381,  -381,   376,  -381,  -381,   327,  -381,
    -381,   337,  -381,   229,  -381,  -381,  -381,  -381,  -381,   155,
    -381,  -381,   251,   353,   276,   376,  -381,  -381,     4,     4,
       4,  -381,  -381,   242,  -381,  -381,    68,  -381,  -381,  -381,
    -381,  -381,   255,   231,   404,   404,   404,   404,   404,   404,
     404,   404,   404,   404,   404,   404,   404,  -381,  -381,   193,
    -381,   418,   157,    16,  -381,  -381,  -381,  -381,  -381,  -381,
      16,   404,    16,    16,   404,   404,  -381,   266,   267,   268,
     404,   404,   404,  -381,  -381,   -56,  -381,   404,  -381,  -381,
    -381,  -381,  -381,  -381,  -381,  -381,  -381,  -381,  -381,  -381,
    -381,   390,  -381,  -381,  -381,  -381,    40,   269,   256,   376,
     404,   404,   404,   277,  -381,    61,   323,   259,  -381,  -381,
    -381,  -381,  -381,  -381,  -381,  -381,  -381,   354,  -381,  -381,
     371,   -45,  -381,   308,   270,   271,  -381,   -24,  -381,   -22,
       5,    46,   255,   272,    22,  -381,  -381,    47,    58,  -381,
    -381,  -381,  -381,  -381,  -381,   309,   404,   404,   404,   404,
     404,   404,   404,   404,   404,  -381,   404,   404,   404,   404,
     404,   404,   404,   404,   273,    16,    16,   404,  -381,   282,
     100,   100,   404,  -381,  -381,   404,   404,    74,   382,  -381,
     404,  -381,  -381,  -381,   388,  -381,   142,   404,  -381,   378,
     404,  -381,   404,  -381,   297,  -381,  -381,  -381,  -381,  -381,
    -381,  -381,  -381,  -381,   278,  -381,  -381,  -381,  -381,  -381,
    -381,  -381,  -381,   404,  -381,  -381,  -381,   281,  -381,  -381,
    -381,  -381,  -381,   398,   404,   404,   432,   138,  -381,  -381,
    -381,   283,  -381,  -381,  -381,  -381,   286,  -381,   288,  -381,
    -381,  -381,  -381,  -381,    19,   399,    20,    24,  -381,   403,
     378,   404,  -381,  -381,  -381,   404,  -381,  -381,   404,  -381,
     404,   -25,  -381,    41,   405,   420,   421,  -381,   255,  -381,
     423,  -381,  -381,  -381,  -381,     4,  -381,  -381,   329,   157,
    -381
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -381,  -381,  -381,   416,  -381,  -381,  -381,  -381,  -381,  -381,
     227,  -381,  -381,   368,  -381,  -381,  -240,  -381,  -381,  -381,
      70,  -381,  -381,  -381,  -381,   322,  -381,  -381,  -381,  -381,
    -381,  -381,   264,  -381,  -381,  -381,  -381,  -381,   260,   263,
    -381,  -381,  -381,  -381,  -381,  -381,  -381,  -381,    38,  -381,
     298,  -381,  -381,  -381,  -381,  -381,  -381,   -47,  -381,  -381,
    -381,  -381,  -381,  -381,  -381,  -381,  -381,  -381,   159,  -381,
    -381,   274,   275,  -381,   -70,  -381,  -381,  -381,  -381,  -381,
    -381,  -381,  -381,   -31,   149,  -381,  -381,  -381,  -381,    55,
    -381,  -209,  -381,   -19,  -380,    13,  -381,  -381,  -381,   230,
     -93,   257,  -381,   306,  -381,   215,  -205,   364,   -44,  -145,
    -381,  -381,  -381,   -97,  -381,   -92,   175
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -241
static const short yytable[] =
{
      57,   104,   241,   129,   -88,   296,    87,   497,   178,   255,
      28,   137,   187,   207,   -37,   208,   209,   405,    27,   362,
     107,   210,   211,   484,   487,   452,   212,   213,   489,   184,
     397,   105,    24,    25,   214,   215,   146,   462,   216,   160,
      52,   155,    29,   498,    53,    43,    42,     1,    54,     2,
     409,   402,     3,   402,   499,   179,     4,    32,    33,    34,
      35,    36,   135,    45,    87,    60,   363,     4,   217,     5,
     334,   218,   219,     6,   398,   144,     7,   108,   345,   138,
     220,     4,   155,   -75,   221,   346,   222,   348,   349,   371,
      60,   101,    87,   406,   485,   488,   -88,   417,   403,   490,
     404,    76,    77,    78,    79,   223,    80,    37,     8,   224,
     239,    69,   188,   225,    85,   410,   417,   244,    47,   148,
     189,   190,   420,  -220,     9,   256,   109,   149,    61,   411,
     -41,   412,   155,   422,   130,   337,    69,    62,    46,   132,
      10,   251,    58,   -76,   418,    63,    64,   252,    11,    74,
     110,   111,   155,    61,   454,   -42,   163,   164,   165,   166,
     455,   456,    62,   501,   242,   243,   421,   206,    48,   306,
      63,    64,   188,   341,   342,   343,   277,   423,   278,    59,
     189,   190,  -240,   277,    73,   278,   335,    92,   339,    94,
     444,   445,   264,   265,   266,   267,   268,   269,   270,   271,
      95,   272,   273,   274,   275,   276,   167,    81,    82,    83,
      84,    98,   321,   322,   323,   324,   325,   297,   298,   299,
     308,   309,   310,   311,   312,   313,   314,   315,   316,   317,
     318,   319,   320,   100,    61,   336,   155,   106,   128,   131,
     434,    76,    77,    78,    79,   223,    80,   347,   133,   224,
     350,   351,   134,   447,    85,   139,   356,   358,   358,   326,
     327,   140,   283,   366,   142,   143,   147,   153,   161,   415,
     277,   162,   278,   279,   280,   174,   466,   368,   468,   117,
     118,   119,   120,   121,   122,   123,   372,   373,   374,   175,
     173,   176,    76,    77,    78,    79,   223,    80,   177,   180,
     328,    82,    83,    84,   329,    85,   183,   197,   449,   450,
     284,   285,   286,   287,   288,   289,   330,   331,   332,   199,
     200,   201,   205,   256,   240,   246,   290,   247,   -24,   257,
     258,   260,   425,   426,   427,   428,   429,   430,   431,   432,
     433,   261,   435,   436,   437,   438,   439,   440,   441,   442,
     262,   295,   307,   446,    76,    77,    78,    79,   451,    80,
     300,   366,   453,   477,   292,   395,   459,    85,   376,   352,
     354,   355,   370,   366,   377,   378,   465,  -239,   467,   394,
     375,   379,   396,   399,   424,   448,   458,   479,   400,   401,
     416,   443,   460,   463,   380,   381,   382,   383,   470,   471,
     469,   472,   473,   486,   481,   506,   482,   492,   483,   502,
     474,   475,   284,   285,   286,   287,   288,   289,    76,    77,
      78,    79,   223,    80,   503,   504,   224,   507,   293,    44,
     226,    85,   510,    75,    99,   141,   182,   366,   186,   384,
     254,   494,   385,   171,   495,   196,   496,   386,   387,   388,
     389,   390,   391,   392,   393,    76,    77,    78,    79,   509,
      80,   359,   493,    81,    82,    83,    84,   202,    85,   203,
     367,   461,   480,   294,   508,    76,    77,    78,    79,   148,
      80,   185,   259,    81,    82,    83,    84,   149,    85,    76,
      77,    78,    79,    37,    80,   151,   340,    81,    82,    83,
      84,   369,    85,    76,    77,    78,    79,     0,    80,     0,
       0,    81,    82,    83,    84,     0,    85,    76,    77,    78,
      79,    52,    80,     0,     0,   338,     0,     0,     0,    54,
      85,    76,    77,    78,    79,     0,    80,     0,     0,   476,
       0,     0,     0,     0,    85
};

static const short yycheck[] =
{
      31,    71,   207,    95,     4,   245,    50,    32,    75,   218,
     119,   108,     5,    11,     4,    13,    14,    12,   107,    75,
      75,    19,    20,     4,     4,   405,    24,    25,     4,   174,
      75,    75,     7,     8,    32,    33,   128,   417,    36,   136,
     103,   134,   103,    68,   107,     0,     4,     4,   111,     6,
       4,    75,     9,    75,    79,   122,    24,    53,    54,    55,
      56,    57,   106,     4,   108,    33,   122,    24,    66,    26,
     279,    69,    70,    30,   119,    75,    33,   132,   283,   110,
      78,    24,   175,    76,    82,   290,    84,   292,   293,   329,
      33,    81,   136,    88,    75,    75,    96,    75,   122,    75,
     122,    99,   100,   101,   102,   103,   104,   103,    65,   107,
     203,    41,   105,   111,   112,    69,    75,   210,     4,   103,
     113,   114,    75,   121,    81,   218,     4,   111,    96,    83,
      98,    85,   225,    75,    96,   280,    66,   105,   108,   101,
      97,   101,   103,    76,   122,   113,   114,   107,   105,   120,
      28,    29,   245,    96,    80,    98,    53,    54,    55,    56,
      86,    87,   105,   122,   208,   209,   119,   198,    75,   262,
     113,   114,   105,    16,    17,    18,   115,   119,   117,   103,
     113,   114,   121,   115,   107,   117,   279,     4,   281,   103,
     395,   396,    37,    38,    39,    40,    41,    42,    43,    44,
     118,    46,    47,    48,    49,    50,   103,   107,   108,   109,
     110,     4,    19,    20,    21,    22,    23,   248,   249,   250,
     264,   265,   266,   267,   268,   269,   270,   271,   272,   273,
     274,   275,   276,    98,    96,   279,   329,    77,   118,   108,
     385,    99,   100,   101,   102,   103,   104,   291,     4,   107,
     294,   295,   111,   398,   112,   103,   300,   301,   302,    66,
      67,    27,    11,   307,   121,     4,     4,    96,   103,   362,
     115,   103,   117,   118,   119,   119,   421,   321,   423,    89,
      90,    91,    92,    93,    94,    95,   330,   331,   332,    75,
     118,     4,    99,   100,   101,   102,   103,   104,     4,     4,
     107,   108,   109,   110,   111,   112,   107,   120,   400,   401,
      59,    60,    61,    62,    63,    64,   123,   124,   125,     4,
       4,    76,    76,   416,   103,   103,    75,   103,   108,   121,
       4,     4,   376,   377,   378,   379,   380,   381,   382,   383,
     384,     4,   386,   387,   388,   389,   390,   391,   392,   393,
     121,    75,   121,   397,    99,   100,   101,   102,   402,   104,
     118,   405,   406,   456,    11,    11,   410,   112,    45,   103,
     103,   103,   103,   417,    51,    52,   420,   121,   422,   120,
     103,    58,    11,    75,    75,   103,     4,   457,   118,   118,
     118,   118,     4,    15,    71,    72,    73,    74,   120,   443,
     103,   120,     4,     4,   121,   498,   120,     4,   120,     4,
     454,   455,    59,    60,    61,    62,    63,    64,    99,   100,
     101,   102,   103,   104,     4,     4,   107,     4,    75,    13,
     203,   112,   103,    77,    66,   113,   172,   481,   178,   116,
     121,   485,   119,   145,   488,   182,   490,   124,   125,   126,
     127,   128,   129,   130,   131,    99,   100,   101,   102,   506,
     104,   302,   481,   107,   108,   109,   110,   193,   112,   194,
     321,   416,   459,   243,   505,    99,   100,   101,   102,   103,
     104,   175,   225,   107,   108,   109,   110,   111,   112,    99,
     100,   101,   102,   103,   104,   131,   281,   107,   108,   109,
     110,   326,   112,    99,   100,   101,   102,    -1,   104,    -1,
      -1,   107,   108,   109,   110,    -1,   112,    99,   100,   101,
     102,   103,   104,    -1,    -1,   107,    -1,    -1,    -1,   111,
     112,    99,   100,   101,   102,    -1,   104,    -1,    -1,   107,
      -1,    -1,    -1,    -1,   112
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     9,    24,    26,    30,    33,    65,    81,
      97,   105,   134,   135,   136,   137,   139,   140,   141,   150,
     153,   154,   161,   173,     7,     8,   138,   107,   119,   103,
     162,   142,    53,    54,    55,    56,    57,   103,   216,   217,
     174,   151,     4,     0,   136,     4,   108,     4,    75,   242,
     243,   155,   103,   107,   111,   237,   238,   216,   103,   103,
      33,    96,   105,   113,   114,   143,   145,   146,   152,   153,
     205,   206,   207,   107,   120,    77,    99,   100,   101,   102,
     104,   107,   108,   109,   110,   112,   233,   241,   244,   246,
     247,   248,     4,   163,   103,   118,   175,   144,     4,   146,
      98,    81,   147,   148,   207,   241,    77,    75,   132,     4,
      28,    29,   156,   157,   158,   159,   160,    89,    90,    91,
      92,    93,    94,    95,   169,   181,   182,   183,   118,   248,
     181,   108,   181,     4,   111,   241,   245,   246,   216,   103,
      27,   158,   121,     4,    75,   168,   248,     4,   103,   111,
     239,   240,   241,    96,   149,   233,   234,   235,   236,   240,
     246,   103,   103,    53,    54,    55,    56,   103,   170,   171,
     164,   183,   176,   118,   119,    75,     4,     4,    75,   122,
       4,   165,   165,   107,   242,   236,   171,     5,   105,   113,
     114,   166,   172,   202,   203,   204,   172,   120,   167,     4,
       4,    76,   204,   205,   208,    76,   216,    11,    13,    14,
      19,    20,    24,    25,    32,    33,    36,    66,    69,    70,
      78,    82,    84,   103,   107,   111,   143,   177,   192,   194,
     198,   210,   218,   219,   220,   221,   222,   224,   231,   233,
     103,   239,   241,   241,   233,   214,   103,   103,   211,   212,
     213,   101,   107,   249,   121,   224,   233,   121,     4,   234,
       4,     4,   121,   225,    37,    38,    39,    40,    41,    42,
      43,    44,    46,    47,    48,    49,    50,   115,   117,   118,
     119,   223,   190,    11,    59,    60,    61,    62,    63,    64,
      75,   232,    11,    75,   232,    75,   149,   216,   216,   216,
     118,   199,   200,   178,   195,   230,   233,   121,   241,   241,
     241,   241,   241,   241,   241,   241,   241,   241,   241,   241,
     241,    19,    20,    21,    22,    23,    66,    67,   107,   111,
     123,   124,   125,   215,   224,   233,   241,   242,   107,   233,
     238,    16,    17,    18,   191,   239,   239,   241,   239,   239,
     241,   241,   103,   209,   103,   103,   241,   201,   241,   201,
     185,   196,    75,   122,   226,   227,   241,   217,   241,   249,
     103,   149,   241,   241,   241,   103,    45,    51,    52,    58,
      71,    72,    73,    74,   116,   119,   124,   125,   126,   127,
     128,   129,   130,   131,   120,    11,    11,    75,   119,    75,
     118,   118,    75,   122,   122,    12,    88,   180,   186,     4,
      69,    83,    85,   193,   197,   233,   118,    75,   122,   228,
      75,   119,    75,   119,    75,   241,   241,   241,   241,   241,
     241,   241,   241,   241,   242,   241,   241,   241,   241,   241,
     241,   241,   241,   118,   239,   239,   241,   242,   103,   248,
     248,   241,   227,   241,    80,    86,    87,   184,     4,   241,
       4,   222,   227,    15,   229,   241,   242,   241,   242,   103,
     120,   241,   120,     4,   241,   241,   107,   233,   179,   207,
     228,   121,   120,   120,     4,    75,     4,     4,    75,     4,
      75,   187,     4,   226,   241,   241,   241,    32,    68,    79,
     188,   122,     4,     4,     4,   189,   233,     4,   216,   190,
     103
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
    { yyval.i = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 163:
#line 940 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 164:
#line 941 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 165:
#line 943 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 166:
#line 945 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 167:
#line 947 "imcc/imcc.y"
    {  yyval.i = 0; cur_call = NULL; }
    break;

  case 168:
#line 948 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 170:
#line 950 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 171:
#line 954 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 172:
#line 955 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 173:
#line 956 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 174:
#line 957 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 175:
#line 961 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 176:
#line 962 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 177:
#line 963 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 178:
#line 964 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 179:
#line 965 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 180:
#line 966 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 181:
#line 971 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 182:
#line 981 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 183:
#line 982 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 184:
#line 983 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 185:
#line 984 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 186:
#line 985 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 187:
#line 986 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 987 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 189:
#line 988 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 989 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 191:
#line 990 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 991 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 193:
#line 992 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 194:
#line 994 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 195:
#line 996 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 998 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 1000 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 1002 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 1004 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 1006 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 1008 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 1010 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 1012 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 204:
#line 1014 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 1016 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 206:
#line 1018 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 207:
#line 1020 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 208:
#line 1022 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 1024 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 210:
#line 1026 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 211:
#line 1028 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                  mk_sub_address(interp, yyvsp[0].s), NULL, 1); }
    break;

  case 212:
#line 1031 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(interp, yyvsp[-2].s),
                                           mk_sub_address(interp, yyvsp[0].s), 1); }
    break;

  case 213:
#line 1038 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 214:
#line 1041 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 215:
#line 1043 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 216:
#line 1047 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 1049 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 218:
#line 1051 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 219:
#line 1054 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            cur_call = NULL;
            yyval.i = 0;
         }
    break;

  case 220:
#line 1060 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 221:
#line 1064 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           cur_call = NULL;
         }
    break;

  case 224:
#line 1074 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 1076 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 226:
#line 1078 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 227:
#line 1080 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 228:
#line 1082 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 229:
#line 1084 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 230:
#line 1086 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 231:
#line 1088 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 232:
#line 1090 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 233:
#line 1092 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 234:
#line 1094 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 235:
#line 1096 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 236:
#line 1098 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 237:
#line 1103 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 238:
#line 1109 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 239:
#line 1110 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 240:
#line 1111 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 241:
#line 1116 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 242:
#line 1117 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 243:
#line 1118 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 244:
#line 1121 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 245:
#line 1122 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 246:
#line 1127 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 247:
#line 1132 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 248:
#line 1136 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 249:
#line 1137 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 250:
#line 1138 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 251:
#line 1142 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 252:
#line 1146 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 253:
#line 1147 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 254:
#line 1151 "imcc/imcc.y"
    {  yyval.t = VT_FLAT; }
    break;

  case 255:
#line 1155 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 256:
#line 1156 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 257:
#line 1161 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 258:
#line 1163 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 259:
#line 1165 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 260:
#line 1167 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 261:
#line 1169 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 262:
#line 1171 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 263:
#line 1175 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 264:
#line 1176 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 265:
#line 1177 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 266:
#line 1178 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 267:
#line 1179 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 268:
#line 1180 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 271:
#line 1189 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 272:
#line 1190 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 273:
#line 1194 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 275:
#line 1199 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 276:
#line 1201 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 278:
#line 1209 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 279:
#line 1213 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 280:
#line 1214 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 281:
#line 1218 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 282:
#line 1219 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 287:
#line 1232 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 288:
#line 1233 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 289:
#line 1237 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 290:
#line 1239 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 291:
#line 1240 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 292:
#line 1241 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 293:
#line 1245 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 294:
#line 1251 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 295:
#line 1253 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 296:
#line 1254 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 297:
#line 1258 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 298:
#line 1259 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 299:
#line 1260 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 300:
#line 1261 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 301:
#line 1262 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 302:
#line 1266 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 303:
#line 1267 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 304:
#line 1268 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 305:
#line 1269 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 306:
#line 1273 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 307:
#line 1274 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3546 "imcc/imcparser.c"

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


#line 1279 "imcc/imcc.y"



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

