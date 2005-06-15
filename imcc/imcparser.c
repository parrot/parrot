/* A Bison parser, made by GNU Bison 1.875d.  */

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
     NEW = 275,
     NEWSUB = 276,
     NEWCLOSURE = 277,
     NEWCOR = 278,
     NEWCONT = 279,
     NAMESPACE = 280,
     ENDNAMESPACE = 281,
     CLASS = 282,
     ENDCLASS = 283,
     FIELD = 284,
     DOT_METHOD = 285,
     SUB = 286,
     SYM = 287,
     LOCAL = 288,
     CONST = 289,
     INC = 290,
     DEC = 291,
     GLOBAL_CONST = 292,
     PLUS_ASSIGN = 293,
     MINUS_ASSIGN = 294,
     MUL_ASSIGN = 295,
     DIV_ASSIGN = 296,
     CONCAT_ASSIGN = 297,
     BAND_ASSIGN = 298,
     BOR_ASSIGN = 299,
     BXOR_ASSIGN = 300,
     FDIV = 301,
     FDIV_ASSIGN = 302,
     MOD_ASSIGN = 303,
     SHR_ASSIGN = 304,
     SHL_ASSIGN = 305,
     SHR_U_ASSIGN = 306,
     SHIFT_LEFT = 307,
     SHIFT_RIGHT = 308,
     INTV = 309,
     FLOATV = 310,
     STRINGV = 311,
     PMCV = 312,
     OBJECTV = 313,
     LOG_XOR = 314,
     RELOP_EQ = 315,
     RELOP_NE = 316,
     RELOP_GT = 317,
     RELOP_GTE = 318,
     RELOP_LT = 319,
     RELOP_LTE = 320,
     GLOBAL = 321,
     GLOBALOP = 322,
     ADDR = 323,
     RESULT = 324,
     RETURN = 325,
     YIELDT = 326,
     POW = 327,
     SHIFT_RIGHT_U = 328,
     LOG_AND = 329,
     LOG_OR = 330,
     COMMA = 331,
     ESUB = 332,
     DOTDOT = 333,
     PCC_BEGIN = 334,
     PCC_END = 335,
     PCC_CALL = 336,
     PCC_SUB = 337,
     PCC_BEGIN_RETURN = 338,
     PCC_END_RETURN = 339,
     PCC_BEGIN_YIELD = 340,
     PCC_END_YIELD = 341,
     NCI_CALL = 342,
     METH_CALL = 343,
     INVOCANT = 344,
     MAIN = 345,
     LOAD = 346,
     IMMEDIATE = 347,
     POSTCOMP = 348,
     METHOD = 349,
     ANON = 350,
     MULTI = 351,
     LABEL = 352,
     EMIT = 353,
     EOM = 354,
     IREG = 355,
     NREG = 356,
     SREG = 357,
     PREG = 358,
     IDENTIFIER = 359,
     REG = 360,
     MACRO = 361,
     ENDM = 362,
     STRINGC = 363,
     INTC = 364,
     FLOATC = 365,
     USTRINGC = 366,
     PARROT_OP = 367,
     VAR = 368,
     LINECOMMENT = 369,
     FILECOMMENT = 370,
     DOT = 371,
     CONCAT = 372,
     POINTY = 373
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
#define NEW 275
#define NEWSUB 276
#define NEWCLOSURE 277
#define NEWCOR 278
#define NEWCONT 279
#define NAMESPACE 280
#define ENDNAMESPACE 281
#define CLASS 282
#define ENDCLASS 283
#define FIELD 284
#define DOT_METHOD 285
#define SUB 286
#define SYM 287
#define LOCAL 288
#define CONST 289
#define INC 290
#define DEC 291
#define GLOBAL_CONST 292
#define PLUS_ASSIGN 293
#define MINUS_ASSIGN 294
#define MUL_ASSIGN 295
#define DIV_ASSIGN 296
#define CONCAT_ASSIGN 297
#define BAND_ASSIGN 298
#define BOR_ASSIGN 299
#define BXOR_ASSIGN 300
#define FDIV 301
#define FDIV_ASSIGN 302
#define MOD_ASSIGN 303
#define SHR_ASSIGN 304
#define SHL_ASSIGN 305
#define SHR_U_ASSIGN 306
#define SHIFT_LEFT 307
#define SHIFT_RIGHT 308
#define INTV 309
#define FLOATV 310
#define STRINGV 311
#define PMCV 312
#define OBJECTV 313
#define LOG_XOR 314
#define RELOP_EQ 315
#define RELOP_NE 316
#define RELOP_GT 317
#define RELOP_GTE 318
#define RELOP_LT 319
#define RELOP_LTE 320
#define GLOBAL 321
#define GLOBALOP 322
#define ADDR 323
#define RESULT 324
#define RETURN 325
#define YIELDT 326
#define POW 327
#define SHIFT_RIGHT_U 328
#define LOG_AND 329
#define LOG_OR 330
#define COMMA 331
#define ESUB 332
#define DOTDOT 333
#define PCC_BEGIN 334
#define PCC_END 335
#define PCC_CALL 336
#define PCC_SUB 337
#define PCC_BEGIN_RETURN 338
#define PCC_END_RETURN 339
#define PCC_BEGIN_YIELD 340
#define PCC_END_YIELD 341
#define NCI_CALL 342
#define METH_CALL 343
#define INVOCANT 344
#define MAIN 345
#define LOAD 346
#define IMMEDIATE 347
#define POSTCOMP 348
#define METHOD 349
#define ANON 350
#define MULTI 351
#define LABEL 352
#define EMIT 353
#define EOM 354
#define IREG 355
#define NREG 356
#define SREG 357
#define PREG 358
#define IDENTIFIER 359
#define REG 360
#define MACRO 361
#define ENDM 362
#define STRINGC 363
#define INTC 364
#define FLOATC 365
#define USTRINGC 366
#define PARROT_OP 367
#define VAR 368
#define LINECOMMENT 369
#define FILECOMMENT 370
#define DOT 371
#define CONCAT 372
#define POINTY 373




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
static Instruction * current_call;
static SymReg *cur_obj, *cur_call;
int cur_pmc_type;      /* used in mk_ident */
IMC_Unit * cur_unit;
SymReg *cur_namespace; /* ugly hack for mk_address */

/*
 * these are used for constructing one INS
 */
static SymReg *keys[IMCC_MAX_REGS];
static int nkeys, in_slice;
static int keyvec;
static SymReg *regs[IMCC_MAX_REGS];
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
    SymReg *r[IMCC_MAX_REGS];
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
    while (i < n) {
	r[i++] = va_arg(ap, SymReg *);
    }
    va_end(ap);
    while (i < IMCC_MAX_REGS)
	r[i++] = NULL;
    return INS(interpreter, unit, opname, fmt, r, n, keyvec, 1);
}

static Instruction*
mk_pmc_const(Parrot_Interp interp, IMC_Unit *unit,
        char *type, SymReg *left, char *constant)
{
    int type_enum = atoi(type);
    SymReg *rhs;
    SymReg *r[IMCC_MAX_REGS];
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
    memset(regs, 0, sizeof(regs));
}

Instruction * INS_LABEL(IMC_Unit * unit, SymReg * r0, int emit)
{

    SymReg *r[IMCC_MAX_REGS];
    Instruction *ins;
    int i;

    r[0] = r0;
    i = 1;
    while (i < IMCC_MAX_REGS)
	r[i++] = NULL;
    ins = _mk_instruction("","%s:", r, 0);
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

static Instruction * iSUBROUTINE(IMC_Unit * unit, SymReg * r0) {
    Instruction *i;
    i =  iLABEL(unit, r0);
    i->line = line - 1;
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
    current_call = i = iLABEL(cur_unit, r);
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
    current_call->r[0]->pcc_sub->sub = sub;
    if (cur_obj) {
        if (cur_obj->set != 'P')
            IMCC_fataly(interp, E_SyntaxError, "object isn't a PMC");
        current_call->r[0]->pcc_sub->object = cur_obj;
        cur_obj = NULL;
    }
    if (current_call->r[0]->pcc_sub->sub->pmc_type == enum_class_NCI)
        current_call->r[0]->pcc_sub->flags |= isNCI;
    if (cur_unit->type == IMC_PCCSUB)
        cur_unit->instructions->r[1]->pcc_sub->calls_a_sub |= 1;
}

static void
begin_return_or_yield(Interp *interp, int yield)
{
    Instruction *i, *ins;
    char name[128];
    ins = cur_unit->instructions;
    if(!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
        IMCC_fataly(interp, E_SyntaxError,
              "yield or return directive outside pcc subroutine\n");
    if(yield)
       ins->r[1]->pcc_sub->calls_a_sub = 1 | ITPCCYIELD;
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

#if ! defined (YYSTYPE) && ! defined (YYSTYPE_IS_DECLARED)
#line 319 "imcc/imcc.y"
typedef union YYSTYPE {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
    Symbol * sym;
    SymbolList * symlist;
    SymbolTable * symtab;
} YYSTYPE;
/* Line 191 of yacc.c.  */
#line 641 "imcc/imcparser.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 214 of yacc.c.  */
#line 653 "imcc/imcparser.c"

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
#   define YYSTACK_ALLOC alloca
#  endif
# else
#  if defined (alloca) || defined (_ALLOCA_H)
#   define YYSTACK_ALLOC alloca
#  else
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
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
#define YYFINAL  43
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   580

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  135
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  117
/* YYNRULES -- Number of rules. */
#define YYNRULES  314
/* YYNRULES -- Number of states. */
#define YYNSTATES  523

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   373

#define YYTRANSLATE(YYX) 						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   125,     2,     2,     2,   131,   132,     2,
     123,   124,   129,   128,     2,   126,     2,   130,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   134,
       2,   120,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   121,     2,   122,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   133,     2,   127,     2,     2,     2,
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
     116,   117,   118,   119
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short int yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    24,    27,    29,    31,    35,    38,    40,    43,
      48,    52,    58,    59,    66,    67,    74,    76,    79,    83,
      86,    88,    90,    92,    94,    95,    99,   103,   104,   106,
     107,   112,   113,   115,   120,   121,   128,   130,   131,   133,
     136,   138,   140,   142,   147,   152,   153,   154,   155,   166,
     167,   169,   173,   174,   179,   180,   184,   188,   190,   192,
     197,   198,   202,   204,   206,   208,   210,   212,   214,   215,
     217,   218,   219,   220,   231,   232,   242,   243,   246,   247,
     251,   252,   254,   258,   260,   262,   264,   266,   268,   270,
     276,   280,   284,   288,   292,   298,   304,   305,   309,   312,
     313,   317,   321,   322,   327,   328,   331,   333,   335,   337,
     339,   341,   343,   344,   350,   352,   353,   356,   360,   364,
     365,   371,   372,   378,   379,   381,   385,   387,   390,   391,
     394,   397,   399,   401,   402,   404,   407,   409,   411,   415,
     417,   421,   423,   425,   428,   431,   432,   437,   438,   445,
     447,   448,   455,   456,   461,   464,   467,   470,   473,   476,
     479,   482,   483,   487,   490,   492,   494,   496,   497,   499,
     501,   503,   505,   507,   509,   511,   513,   515,   517,   519,
     523,   528,   533,   538,   544,   550,   556,   562,   568,   574,
     580,   586,   592,   598,   604,   610,   616,   622,   628,   634,
     640,   647,   654,   661,   669,   674,   679,   686,   694,   699,
     706,   711,   716,   721,   726,   733,   741,   745,   746,   756,
     758,   760,   764,   768,   772,   776,   780,   784,   788,   792,
     796,   800,   804,   808,   812,   817,   819,   821,   823,   827,
     831,   835,   837,   839,   840,   846,   847,   851,   853,   856,
     857,   860,   862,   866,   868,   875,   882,   887,   892,   897,
     902,   904,   906,   908,   910,   912,   914,   916,   918,   919,
     921,   925,   927,   929,   934,   936,   938,   940,   942,   944,
     946,   948,   950,   952,   954,   955,   958,   960,   964,   965,
     970,   972,   976,   979,   982,   984,   986,   988,   990,   992,
     994,   996,   998,  1000,  1002
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     136,     0,    -1,   137,    -1,   138,    -1,   137,   138,    -1,
     156,    -1,   155,    -1,   143,    -1,   142,    -1,   163,    -1,
     175,    -1,   152,    -1,   107,     4,    -1,   139,    -1,     4,
      -1,     6,   140,     4,    -1,   141,     4,    -1,     7,    -1,
       8,   110,    -1,     9,   109,    77,   109,    -1,    67,   218,
     105,    -1,    67,   218,   105,   120,   250,    -1,    -1,    35,
     144,   218,   105,   120,   250,    -1,    -1,    35,   146,   110,
     242,   120,   109,    -1,   148,    -1,   147,   148,    -1,   206,
     149,     4,    -1,   107,     4,    -1,   116,    -1,   115,    -1,
     155,    -1,   145,    -1,    -1,   150,   113,   151,    -1,    83,
     183,    98,    -1,    -1,   236,    -1,    -1,    99,   153,   154,
     100,    -1,    -1,   147,    -1,    26,   121,   244,   122,    -1,
      -1,    28,   105,   157,     4,   158,    29,    -1,   159,    -1,
      -1,   160,    -1,   159,   160,    -1,   161,    -1,   162,    -1,
       4,    -1,    30,   218,   105,     4,    -1,    31,   105,   105,
       4,    -1,    -1,    -1,    -1,    32,   164,   239,   165,   170,
       4,   166,   167,   174,    78,    -1,    -1,     4,    -1,   167,
     168,     4,    -1,    -1,     5,   169,   218,   105,    -1,    -1,
     170,    77,   184,    -1,   170,    77,   171,    -1,   184,    -1,
     171,    -1,    97,   123,   172,   124,    -1,    -1,   172,    77,
     173,    -1,   173,    -1,    55,    -1,    56,    -1,    58,    -1,
      57,    -1,   105,    -1,    -1,   203,    -1,    -1,    -1,    -1,
      83,   176,   105,   177,   170,     4,   178,   167,   174,    78,
      -1,    -1,    80,     4,   180,   186,   182,   185,   181,   188,
      81,    -1,    -1,   208,     4,    -1,    -1,    90,   243,     4,
      -1,    -1,   184,    -1,   183,    77,   184,    -1,    92,    -1,
      91,    -1,    93,    -1,    94,    -1,    96,    -1,    95,    -1,
      82,   243,    77,   243,     4,    -1,    82,   243,     4,    -1,
      88,   243,     4,    -1,    89,   235,     4,    -1,    89,   109,
       4,    -1,    89,   235,    77,   243,     4,    -1,    89,   109,
      77,   243,     4,    -1,    -1,   186,   187,     4,    -1,    12,
     229,    -1,    -1,   188,   189,     4,    -1,    70,   235,   191,
      -1,    -1,    34,   190,   218,   105,    -1,    -1,   191,   192,
      -1,    19,    -1,    20,    -1,    84,    -1,    86,    -1,    85,
      -1,    87,    -1,    -1,   193,     4,   196,   197,   194,    -1,
     199,    -1,    -1,   197,     4,    -1,   197,   198,     4,    -1,
      71,   243,   230,    -1,    -1,    71,   123,   200,   202,   124,
      -1,    -1,    72,   123,   201,   202,   124,    -1,    -1,   243,
      -1,   202,    77,   243,    -1,   205,    -1,   203,   205,    -1,
      -1,   204,   209,    -1,   107,     4,    -1,   116,    -1,   115,
      -1,    -1,   207,    -1,   207,   208,    -1,   208,    -1,    98,
      -1,   206,   211,     4,    -1,   105,    -1,   210,    77,   105,
      -1,   220,    -1,   233,    -1,    26,   105,    -1,    27,   105,
      -1,    -1,    34,   212,   218,   210,    -1,    -1,    35,   213,
     218,   105,   120,   250,    -1,   145,    -1,    -1,    38,   214,
     218,   105,   120,   250,    -1,    -1,     5,   215,   218,   105,
      -1,     5,   249,    -1,    70,   243,    -1,    12,   229,    -1,
      71,   243,    -1,    71,   226,    -1,    10,   241,    -1,    11,
     241,    -1,    -1,    22,   216,   151,    -1,   113,   236,    -1,
     226,    -1,   179,    -1,   195,    -1,    -1,    22,    -1,    23,
      -1,    24,    -1,    25,    -1,    55,    -1,    56,    -1,    57,
      -1,    58,    -1,    59,    -1,   219,    -1,   105,    -1,   235,
     120,   243,    -1,   235,   120,   125,   243,    -1,   235,   120,
     126,   243,    -1,   235,   120,   127,   243,    -1,   235,   120,
     243,   128,   243,    -1,   235,   120,   243,   126,   243,    -1,
     235,   120,   243,   129,   243,    -1,   235,   120,   243,    73,
     243,    -1,   235,   120,   243,   130,   243,    -1,   235,   120,
     243,    47,   243,    -1,   235,   120,   243,   131,   243,    -1,
     235,   120,   243,   118,   243,    -1,   235,   120,   243,    53,
     243,    -1,   235,   120,   243,    54,   243,    -1,   235,   120,
     243,    74,   243,    -1,   235,   120,   243,    75,   243,    -1,
     235,   120,   243,    76,   243,    -1,   235,   120,   243,    60,
     243,    -1,   235,   120,   243,   132,   243,    -1,   235,   120,
     243,   133,   243,    -1,   235,   120,   243,   127,   243,    -1,
     235,   120,   243,   121,   244,   122,    -1,   235,   121,   244,
     122,   120,   243,    -1,   235,   120,    21,   219,    77,   243,
      -1,   235,   120,    21,   219,   121,   244,   122,    -1,   235,
     120,    21,   219,    -1,   235,   120,    21,   243,    -1,   235,
     120,    21,   243,    77,   243,    -1,   235,   120,    21,   243,
     121,   244,   122,    -1,   235,   120,   217,   105,    -1,   235,
     120,   217,   105,    77,   105,    -1,   235,   120,    69,   105,
      -1,   235,   120,    68,   251,    -1,    68,   251,   120,   243,
      -1,    21,   235,    77,   243,    -1,    21,   235,    77,   243,
      77,   243,    -1,    21,   235,    77,   243,   121,   244,   122,
      -1,   235,   120,   226,    -1,    -1,   221,   123,   232,   124,
     120,   224,   123,   228,   124,    -1,   222,    -1,   223,    -1,
     235,    39,   243,    -1,   235,    40,   243,    -1,   235,    41,
     243,    -1,   235,    42,   243,    -1,   235,    49,   243,    -1,
     235,    48,   243,    -1,   235,    43,   243,    -1,   235,    44,
     243,    -1,   235,    45,   243,    -1,   235,    46,   243,    -1,
     235,    50,   243,    -1,   235,    51,   243,    -1,   235,    52,
     243,    -1,   235,   120,   113,   151,    -1,   105,    -1,   109,
      -1,   235,    -1,   235,   225,   240,    -1,   235,   225,   109,
      -1,   235,   225,   235,    -1,   119,    -1,   117,    -1,    -1,
     224,   227,   123,   228,   124,    -1,    -1,   228,    77,   229,
      -1,   229,    -1,   243,   230,    -1,    -1,   230,   231,    -1,
      18,    -1,   232,    77,   235,    -1,   235,    -1,    13,   243,
     234,   243,    11,   241,    -1,    14,   243,   234,   243,    11,
     241,    -1,    13,   243,    11,   241,    -1,    14,   243,    11,
     241,    -1,    13,   243,    77,   241,    -1,    14,   243,    77,
     241,    -1,    61,    -1,    62,    -1,    63,    -1,    64,    -1,
      65,    -1,    66,    -1,   114,    -1,   249,    -1,    -1,   237,
      -1,   237,    77,   238,    -1,   238,    -1,   242,    -1,   235,
     121,   244,   122,    -1,   240,    -1,   109,    -1,   105,    -1,
     113,    -1,   105,    -1,   113,    -1,   241,    -1,   243,    -1,
     235,    -1,   250,    -1,    -1,   245,   246,    -1,   248,    -1,
     246,   134,   248,    -1,    -1,   246,    77,   247,   248,    -1,
     243,    -1,   243,    79,   243,    -1,    79,   243,    -1,   243,
      79,    -1,   101,    -1,   102,    -1,   103,    -1,   104,    -1,
     106,    -1,   110,    -1,   111,    -1,   109,    -1,   112,    -1,
     103,    -1,   109,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   403,   403,   407,   408,   412,   413,   414,   415,   416,
     417,   418,   419,   420,   421,   424,   425,   428,   429,   437,
     449,   455,   464,   464,   469,   469,   473,   474,   478,   479,
     480,   481,   482,   483,   486,   486,   490,   497,   501,   505,
     505,   515,   517,   521,   538,   537,   553,   554,   558,   559,
     563,   564,   565,   569,   583,   600,   606,   611,   599,   617,
     618,   619,   623,   623,   628,   629,   630,   631,   632,   635,
     639,   640,   641,   645,   646,   647,   648,   649,   661,   663,
     667,   669,   675,   667,   682,   681,   712,   713,   717,   718,
     723,   724,   725,   729,   730,   731,   732,   733,   734,   738,
     743,   745,   750,   752,   754,   758,   766,   767,   771,   776,
     777,   781,   782,   782,   787,   788,   792,   793,   798,   799,
     803,   804,   809,   808,   813,   819,   820,   822,   827,   832,
     831,   839,   838,   848,   849,   850,   855,   856,   868,   872,
     874,   875,   876,   880,   881,   885,   886,   890,   896,   900,
     908,   917,   918,   919,   920,   921,   921,   934,   934,   936,
     937,   937,   939,   939,   942,   943,   944,   945,   946,   950,
     951,   952,   952,   955,   958,   959,   960,   961,   965,   966,
     967,   968,   972,   973,   974,   975,   976,   977,   981,   992,
     993,   994,   995,   996,   997,   998,   999,  1000,  1001,  1002,
    1003,  1004,  1006,  1008,  1010,  1012,  1014,  1016,  1018,  1020,
    1022,  1024,  1026,  1028,  1030,  1032,  1034,  1036,  1038,  1041,
    1048,  1051,  1053,  1057,  1059,  1061,  1064,  1071,  1071,  1079,
    1080,  1084,  1086,  1088,  1090,  1092,  1094,  1096,  1098,  1100,
    1102,  1104,  1106,  1108,  1113,  1120,  1121,  1122,  1127,  1128,
    1129,  1132,  1133,  1138,  1137,  1147,  1148,  1149,  1153,  1157,
    1158,  1162,  1166,  1167,  1171,  1173,  1175,  1177,  1179,  1181,
    1186,  1187,  1188,  1189,  1190,  1191,  1195,  1196,  1200,  1201,
    1205,  1206,  1210,  1211,  1219,  1220,  1224,  1225,  1229,  1230,
    1234,  1235,  1239,  1240,  1243,  1243,  1248,  1249,  1251,  1251,
    1256,  1261,  1264,  1265,  1269,  1270,  1271,  1272,  1273,  1277,
    1278,  1279,  1280,  1284,  1285
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "PRAGMA",
  "FASTCALL", "N_OPERATORS", "HLL", "CALL", "GOTO", "ARG", "IF", "UNLESS",
  "END", "SAVEALL", "RESTOREALL", "ADV_FLAT", "ADV_SLURPY", "ADV_OPTIONAL",
  "NEW", "NEWSUB", "NEWCLOSURE", "NEWCOR", "NEWCONT", "NAMESPACE",
  "ENDNAMESPACE", "CLASS", "ENDCLASS", "FIELD", "DOT_METHOD", "SUB", "SYM",
  "LOCAL", "CONST", "INC", "DEC", "GLOBAL_CONST", "PLUS_ASSIGN",
  "MINUS_ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", "CONCAT_ASSIGN",
  "BAND_ASSIGN", "BOR_ASSIGN", "BXOR_ASSIGN", "FDIV", "FDIV_ASSIGN",
  "MOD_ASSIGN", "SHR_ASSIGN", "SHL_ASSIGN", "SHR_U_ASSIGN", "SHIFT_LEFT",
  "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV", "OBJECTV", "LOG_XOR",
  "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", "RELOP_LTE",
  "GLOBAL", "GLOBALOP", "ADDR", "RESULT", "RETURN", "YIELDT", "POW",
  "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", "DOTDOT",
  "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB", "PCC_BEGIN_RETURN",
  "PCC_END_RETURN", "PCC_BEGIN_YIELD", "PCC_END_YIELD", "NCI_CALL",
  "METH_CALL", "INVOCANT", "MAIN", "LOAD", "IMMEDIATE", "POSTCOMP",
  "METHOD", "ANON", "MULTI", "LABEL", "EMIT", "EOM", "IREG", "NREG",
  "SREG", "PREG", "IDENTIFIER", "REG", "MACRO", "ENDM", "STRINGC", "INTC",
  "FLOATC", "USTRINGC", "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT",
  "DOT", "CONCAT", "POINTY", "'='", "'['", "']'", "'('", "')'", "'!'",
  "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", "'&'", "'|'", "';'", "$accept",
  "program", "compilation_units", "compilation_unit", "pragma", "pragma_1",
  "hll_def", "global", "constdef", "@1", "pmc_const", "@2", "pasmcode",
  "pasmline", "pasm_inst", "@3", "pasm_args", "emit", "@4", "opt_pasmcode",
  "class_namespace", "class", "@5", "class_body", "member_decls",
  "member_decl", "field_decl", "method_decl", "sub", "@6", "@7", "@8",
  "sub_params", "sub_param", "@9", "sub_proto", "multi", "multi_types",
  "multi_type", "sub_body", "pcc_sub", "@10", "@11", "@12", "pcc_sub_call",
  "@13", "opt_label", "opt_invocant", "pcc_sub_proto", "proto", "pcc_call",
  "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@14",
  "paramtype_list", "paramtype", "begin_ret_or_yield", "end_ret_or_yield",
  "pcc_ret", "@15", "pcc_returns", "pcc_return", "pcc_return_many", "@16",
  "@17", "var_returns", "statements", "helper_clear_state", "statement",
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
     364,   365,   366,   367,   368,   369,   370,   371,   372,   373,
      61,    91,    93,    40,    41,    33,    45,   126,    43,    42,
      47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   135,   136,   137,   137,   138,   138,   138,   138,   138,
     138,   138,   138,   138,   138,   139,   139,   140,   140,   141,
     142,   142,   144,   143,   146,   145,   147,   147,   148,   148,
     148,   148,   148,   148,   150,   149,   149,   149,   151,   153,
     152,   154,   154,   155,   157,   156,   158,   158,   159,   159,
     160,   160,   160,   161,   162,   164,   165,   166,   163,   167,
     167,   167,   169,   168,   170,   170,   170,   170,   170,   171,
     172,   172,   172,   173,   173,   173,   173,   173,   174,   174,
     176,   177,   178,   175,   180,   179,   181,   181,   182,   182,
     183,   183,   183,   184,   184,   184,   184,   184,   184,   185,
     185,   185,   185,   185,   185,   185,   186,   186,   187,   188,
     188,   189,   190,   189,   191,   191,   192,   192,   193,   193,
     194,   194,   196,   195,   195,   197,   197,   197,   198,   200,
     199,   201,   199,   202,   202,   202,   203,   203,   204,   205,
     205,   205,   205,   206,   206,   207,   207,   208,   209,   210,
     210,   211,   211,   211,   211,   212,   211,   213,   211,   211,
     214,   211,   215,   211,   211,   211,   211,   211,   211,   211,
     211,   216,   211,   211,   211,   211,   211,   211,   217,   217,
     217,   217,   218,   218,   218,   218,   218,   218,   219,   220,
     220,   220,   220,   220,   220,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   220,   220,   221,   220,   220,
     220,   222,   222,   222,   222,   222,   222,   222,   222,   222,
     222,   222,   222,   222,   223,   224,   224,   224,   224,   224,
     224,   225,   225,   227,   226,   228,   228,   228,   229,   230,
     230,   231,   232,   232,   233,   233,   233,   233,   233,   233,
     234,   234,   234,   234,   234,   234,   235,   235,   236,   236,
     237,   237,   238,   238,   239,   239,   240,   240,   241,   241,
     242,   242,   243,   243,   245,   244,   246,   246,   247,   246,
     248,   248,   248,   248,   249,   249,   249,   249,   249,   250,
     250,   250,   250,   251,   251
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
       1,     3,     0,     4,     0,     3,     3,     1,     1,     4,
       0,     3,     1,     1,     1,     1,     1,     1,     0,     1,
       0,     0,     0,    10,     0,     9,     0,     2,     0,     3,
       0,     1,     3,     1,     1,     1,     1,     1,     1,     5,
       3,     3,     3,     3,     5,     5,     0,     3,     2,     0,
       3,     3,     0,     4,     0,     2,     1,     1,     1,     1,
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
static const unsigned short int yydefact[] =
{
       0,    14,     0,     0,     0,     0,    55,    22,     0,    80,
      39,     0,     0,     2,     3,    13,     0,     8,     7,    11,
       6,     5,     9,    10,    17,     0,     0,     0,   294,    44,
       0,     0,   182,   183,   184,   185,   186,   188,     0,   187,
       0,   143,    12,     1,     4,    16,    18,    15,     0,     0,
       0,     0,   286,   285,   287,    56,   284,     0,    20,    81,
      24,   147,     0,    31,    30,    33,   143,    26,     0,    32,
      34,   144,   146,    19,    43,     0,   304,   305,   306,   307,
     308,   311,   309,   310,   312,   276,   292,   300,   295,   296,
     277,   293,    47,    64,     0,     0,    64,     0,    29,    27,
      40,    90,     0,     0,   145,   302,   303,   298,     0,    52,
       0,     0,     0,    46,    48,    50,    51,    94,    93,    95,
      96,    98,    97,     0,     0,    68,    67,     0,    21,     0,
       0,     0,    91,    28,   278,   301,     0,   297,     0,     0,
      45,    49,    70,    57,     0,    23,    82,   288,   289,   290,
       0,   291,     0,    36,    35,   292,    38,   279,   281,   282,
     299,     0,     0,    73,    74,    76,    75,    77,     0,    72,
      59,    66,    65,    59,     0,    92,   294,     0,    53,    54,
       0,    69,    60,   138,   138,    25,     0,   280,    71,    62,
       0,   142,   141,     0,     0,   138,   143,   136,     0,   283,
       0,   140,    61,    58,   137,   177,   139,    83,     0,   162,
       0,     0,     0,     0,     0,     0,   171,     0,     0,   155,
     157,   160,     0,     0,     0,     0,     0,   118,   119,   245,
     246,   278,   159,   175,     0,   176,   124,     0,   151,     0,
     229,   230,   253,   174,   152,   247,    63,     0,   164,   169,
     170,   166,   259,     0,     0,     0,   278,   153,   154,     0,
       0,     0,   313,   314,     0,   165,   311,   129,   168,   292,
     167,   131,    84,   173,   122,   148,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   252,   251,     0,   294,     0,     0,   258,     0,   270,
     271,   272,   273,   274,   275,     0,     0,     0,     0,     0,
       0,   172,     0,     0,     0,     0,   133,   133,   106,   125,
       0,   263,   255,   231,   232,   233,   234,   237,   238,   239,
     240,   236,   235,   241,   242,   243,     0,   178,   179,   180,
     181,     0,     0,   278,     0,     0,     0,     0,   226,   189,
       0,   249,   250,   248,   163,   261,   260,   266,   268,     0,
     267,   269,     0,   223,   149,   156,     0,     0,   222,     0,
     134,     0,    88,     0,     0,     0,     0,   257,   214,   215,
     221,   220,   244,   190,   191,   192,   218,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   294,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   294,
       0,     0,     0,     0,   130,   132,     0,     0,     0,     0,
     126,     0,   120,   121,   123,     0,   262,     0,     0,   254,
       0,   294,     0,   294,     0,   198,   201,   202,   206,   196,
     203,   204,   205,   200,     0,   194,   209,   193,   195,   197,
     199,   207,   208,     0,   264,   265,   224,     0,   150,   158,
     161,   135,   108,     0,     0,     0,     0,    86,   107,   259,
     127,     0,   247,   256,   212,     0,   216,     0,   219,   210,
     211,   225,    89,     0,     0,     0,     0,   109,     0,   128,
     255,   213,   217,   100,     0,   101,   103,     0,   102,     0,
       0,    87,     0,     0,     0,     0,   112,     0,    85,     0,
     228,    99,   105,   104,     0,   114,   110,     0,   111,   113,
     116,   117,   115
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    12,    13,    14,    15,    26,    16,    17,    18,    31,
      65,    97,    66,    67,   102,   103,   154,    19,    41,    68,
      20,    21,    51,   112,   113,   114,   115,   116,    22,    30,
      93,   170,   183,   193,   200,   124,   125,   168,   169,   194,
      23,    40,    96,   173,   233,   318,   487,   418,   131,   126,
     467,   372,   419,   500,   509,   514,   518,   522,   234,   424,
     235,   319,   373,   425,   236,   316,   317,   369,   195,   196,
     197,    70,    71,    72,   206,   365,   237,   259,   260,   261,
     247,   256,   347,    38,    39,   238,   239,   240,   241,   242,
     295,   243,   277,   376,   377,   297,   356,   320,   244,   306,
      86,   156,   157,   158,    55,    56,   149,   159,   151,    49,
      50,    88,   136,    89,    90,    91,   264
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -249
static const short int yypact[] =
{
       5,  -249,    34,   -74,   -61,   -27,  -249,  -249,    -4,  -249,
    -249,    77,   126,     5,  -249,  -249,   124,  -249,  -249,  -249,
    -249,  -249,  -249,  -249,  -249,    25,   133,    67,  -249,  -249,
      69,    -4,  -249,  -249,  -249,  -249,  -249,  -249,    47,  -249,
      48,    -8,  -249,  -249,  -249,  -249,  -249,  -249,    53,    46,
     182,   160,  -249,  -249,  -249,  -249,  -249,    70,    76,  -249,
    -249,  -249,   200,  -249,  -249,  -249,    23,  -249,   107,  -249,
       8,   116,  -249,  -249,  -249,   438,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,  -249,  -249,  -249,  -249,   136,   -60,  -249,
    -249,  -249,   111,   130,    97,   205,   130,   108,  -249,  -249,
    -249,   284,   215,   131,  -249,  -249,   438,  -249,   182,  -249,
      -4,   142,   220,   111,  -249,  -249,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,   127,     6,  -249,  -249,   205,  -249,     9,
     224,   -34,  -249,  -249,   224,  -249,   182,  -249,   152,   161,
    -249,  -249,   155,  -249,   130,  -249,  -249,  -249,  -249,  -249,
     135,  -249,   284,  -249,  -249,   144,  -249,   190,  -249,  -249,
    -249,   273,   274,  -249,  -249,  -249,  -249,  -249,   -51,  -249,
     277,  -249,  -249,   277,   178,  -249,  -249,   224,  -249,  -249,
     155,  -249,  -249,     2,     2,  -249,   168,  -249,  -249,  -249,
     291,  -249,  -249,   302,   229,   -59,   116,  -249,   234,  -249,
      -4,  -249,  -249,  -249,  -249,   388,  -249,  -249,   216,   170,
      84,    84,   438,   438,   438,   150,  -249,   218,   219,  -249,
     210,  -249,   -73,   438,   199,   208,   335,  -249,  -249,  -249,
    -249,   224,  -249,  -249,   345,  -249,  -249,   354,  -249,   236,
    -249,  -249,  -249,  -249,  -249,   436,  -249,    -4,  -249,  -249,
    -249,  -249,  -249,   122,   129,   283,   224,  -249,  -249,    -4,
      -4,    -4,  -249,  -249,   242,  -249,   240,  -249,  -249,    86,
    -249,  -249,  -249,  -249,  -249,  -249,   150,   241,   438,   438,
     438,   438,   438,   438,   438,   438,   438,   438,   438,   438,
     438,  -249,  -249,    45,  -249,   326,   260,   349,    84,  -249,
    -249,  -249,  -249,  -249,  -249,    84,   438,    84,    84,   438,
     438,  -249,   263,   267,   268,   438,   438,   438,  -249,  -249,
     -39,  -249,   438,  -249,  -249,  -249,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,  -249,  -249,  -249,   424,  -249,  -249,  -249,
    -249,   -73,   279,   224,   438,   438,   438,   281,  -249,   391,
     265,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,   371,
    -249,  -249,   377,   -15,  -249,   312,   270,   271,  -249,    -2,
    -249,     0,     4,    40,   150,   272,    10,  -249,    39,    42,
    -249,  -249,  -249,  -249,  -249,  -249,   317,   438,   438,   438,
     438,   438,   438,   438,   438,   438,  -249,   438,   438,   438,
     438,   438,   438,   438,   438,   275,    84,    84,   438,  -249,
     298,   205,   205,   438,  -249,  -249,   438,   438,    91,   392,
    -249,   438,  -249,  -249,  -249,   400,  -249,   457,   438,  -249,
     438,  -249,   438,  -249,   300,  -249,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,  -249,   285,  -249,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,   438,  -249,  -249,  -249,   286,  -249,  -249,
    -249,  -249,  -249,   407,   438,   438,   466,   116,  -249,  -249,
    -249,   290,   -72,  -249,  -249,   294,  -249,   297,  -249,  -249,
    -249,  -249,  -249,    19,   416,    20,    28,  -249,   417,   349,
     438,  -249,  -249,  -249,   438,  -249,  -249,   438,  -249,   438,
      -5,  -249,    21,   420,   421,   429,  -249,   150,  -249,   430,
    -249,  -249,  -249,  -249,    -4,  -249,  -249,   331,   112,  -249,
    -249,  -249,  -249
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -249,  -249,  -249,   428,  -249,  -249,  -249,  -249,  -249,  -249,
     232,  -249,  -249,   376,  -249,  -249,  -248,  -249,  -249,  -249,
     -20,  -249,  -249,  -249,  -249,   333,  -249,  -249,  -249,  -249,
    -249,  -249,   276,  -249,  -249,   352,   309,  -249,   282,   287,
    -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,   -81,
    -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,  -249,  -249,  -249,  -249,   137,  -249,  -249,
     262,   259,  -249,   -70,  -249,  -249,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,   -31,   125,  -249,  -249,  -249,  -249,    36,
    -249,  -209,  -249,   -21,  -208,     1,  -249,  -249,  -249,   244,
     -95,   264,  -249,   296,  -249,   201,  -205,   369,   -47,  -151,
    -249,  -249,  -249,   -86,   295,   -93,   159
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -248
static const short int yytable[] =
{
      57,   104,   128,    87,   251,   249,   250,   189,   311,     1,
     143,     2,   -37,   146,     3,   268,   416,   107,     4,   -79,
     132,    69,   137,   493,   496,   186,   180,    60,   105,   506,
     262,     4,   498,     5,   145,    27,   263,     6,   374,   155,
       7,    24,    25,   152,   420,   291,    69,   292,   190,     4,
     160,    32,    33,    34,    35,    36,   191,   192,    60,   135,
      28,    87,   408,   172,   153,   507,   336,   337,   338,   339,
     340,   175,     8,   181,   108,   413,   508,   413,    29,   138,
     -78,    42,   155,   144,   348,   375,   144,   428,     9,    87,
      61,   101,   -41,   357,   417,   382,   494,   497,   428,    62,
     358,    37,   360,   361,    10,   499,   409,    63,    64,   190,
     245,   421,    11,   341,   342,   109,   430,   191,   192,   432,
     255,    61,   414,   -42,   415,   422,    43,   423,    45,   269,
      62,   520,   521,   298,   429,    46,   155,    47,    63,    64,
     307,   110,   111,   350,    48,   510,    76,    77,    78,    79,
     229,    80,    58,    59,   266,    82,    83,    84,   343,    85,
     431,   155,    73,   433,    92,   252,   253,   254,    74,   208,
     344,   345,   346,   464,    52,    94,   265,   270,    53,   465,
     466,   321,    54,   299,   300,   301,   302,   303,   304,   147,
     299,   300,   301,   302,   303,   304,    95,   148,   269,   305,
     352,   454,   455,   291,    98,   292,   308,   100,   462,  -247,
     163,   164,   165,   166,    61,   106,   296,   127,   130,   133,
     473,   117,   118,   119,   120,   121,   122,   123,   312,   313,
     314,   323,   324,   325,   326,   327,   328,   329,   330,   331,
     332,   333,   334,   335,   134,   444,   349,   139,   155,   140,
     142,    76,    77,    78,    79,   174,    80,   161,   457,   359,
     167,    75,   362,   363,    85,   176,   162,   177,   368,   370,
     370,    76,    77,    78,    79,   252,    80,   178,   179,   426,
     475,   182,   477,    76,    77,    78,    79,   185,    80,   379,
     199,    81,    82,    83,    84,   201,    85,   383,   384,   385,
      76,    77,    78,    79,   229,    80,   202,   203,   266,    82,
      83,    84,   207,    85,    81,    82,    83,    84,   459,   460,
     -24,   246,   267,   257,   258,    76,    77,    78,    79,   147,
      80,   271,   472,    81,    82,    83,    84,   148,    85,   272,
     435,   436,   437,   438,   439,   440,   441,   442,   443,   274,
     445,   446,   447,   448,   449,   450,   451,   452,   275,   276,
     310,   456,   315,  -246,   322,   354,   461,   355,   364,   252,
     463,   486,   366,   367,   469,   117,   118,   119,   120,   121,
     122,   252,   406,   474,   381,   476,   386,   405,   407,   410,
     411,   412,   427,   209,   434,   453,   468,   488,   210,   211,
     212,   213,   214,   458,   470,   478,   480,   479,   481,   215,
     216,   482,   515,   490,   217,   218,   491,   483,   484,   492,
     495,   501,   219,   220,   511,   512,   221,    76,    77,    78,
      79,    52,    80,   513,   516,   351,   519,   232,   387,    54,
      85,    44,    99,   252,   388,   389,   141,   503,   129,   184,
     504,   390,   505,   171,   371,   205,   222,   204,   223,   224,
     225,   378,   188,   471,   391,   392,   393,   394,   226,   502,
     489,   198,   227,   187,   228,   278,   279,   280,   281,   282,
     283,   284,   285,   517,   286,   287,   288,   289,   290,    76,
      77,    78,    79,   229,    80,   273,   353,   230,   309,   150,
     380,   231,    85,     0,   248,     0,     0,     0,     0,   395,
       0,  -227,   396,     0,     0,     0,     0,   397,   398,   399,
     400,   401,   402,   403,   404,    76,    77,    78,    79,    37,
      80,     0,     0,    81,    82,    83,    84,     0,    85,    76,
      77,    78,    79,     0,    80,     0,     0,    81,    82,    83,
      84,     0,    85,   291,     0,   292,   293,   294,    76,    77,
      78,    79,   229,    80,     0,     0,   230,    76,    77,    78,
      79,    85,    80,     0,     0,   485,     0,     0,     0,     0,
      85
};

static const short int yycheck[] =
{
      31,    71,    95,    50,   212,   210,   211,     5,   256,     4,
       4,     6,     4,     4,     9,   224,    12,    77,    26,    78,
     101,    41,   108,     4,     4,   176,    77,    35,    75,    34,
     103,    26,     4,    28,   127,   109,   109,    32,    77,   134,
      35,     7,     8,    77,     4,   117,    66,   119,   107,    26,
     136,    55,    56,    57,    58,    59,   115,   116,    35,   106,
     121,   108,    77,   144,    98,    70,    21,    22,    23,    24,
      25,   152,    67,   124,   134,    77,    81,    77,   105,   110,
      78,     4,   177,    77,   293,   124,    77,    77,    83,   136,
      98,    83,   100,   298,    90,   343,    77,    77,    77,   107,
     305,   105,   307,   308,    99,    77,   121,   115,   116,   107,
     205,    71,   107,    68,    69,     4,    77,   115,   116,    77,
     215,    98,   124,   100,   124,    85,     0,    87,     4,   224,
     107,    19,    20,    11,   124,   110,   231,     4,   115,   116,
      11,    30,    31,   294,    77,   124,   101,   102,   103,   104,
     105,   106,   105,   105,   109,   110,   111,   112,   113,   114,
     121,   256,   109,   121,     4,   212,   213,   214,   122,   200,
     125,   126,   127,    82,   105,   105,   223,   224,   109,    88,
      89,   276,   113,    61,    62,    63,    64,    65,    66,   105,
      61,    62,    63,    64,    65,    66,   120,   113,   293,    77,
     295,   406,   407,   117,     4,   119,    77,   100,   416,   123,
      55,    56,    57,    58,    98,    79,   247,   120,   110,     4,
     428,    91,    92,    93,    94,    95,    96,    97,   259,   260,
     261,   278,   279,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   113,   396,   293,   105,   343,    29,
     123,   101,   102,   103,   104,   120,   106,   105,   409,   306,
     105,    79,   309,   310,   114,   121,   105,    77,   315,   316,
     317,   101,   102,   103,   104,   322,   106,     4,     4,   374,
     431,     4,   433,   101,   102,   103,   104,   109,   106,   336,
     122,   109,   110,   111,   112,     4,   114,   344,   345,   346,
     101,   102,   103,   104,   105,   106,     4,    78,   109,   110,
     111,   112,    78,   114,   109,   110,   111,   112,   411,   412,
     110,   105,   123,   105,   105,   101,   102,   103,   104,   105,
     106,   123,   427,   109,   110,   111,   112,   113,   114,     4,
     387,   388,   389,   390,   391,   392,   393,   394,   395,     4,
     397,   398,   399,   400,   401,   402,   403,   404,     4,   123,
      77,   408,   120,   123,   123,   105,   413,    18,   105,   416,
     417,   466,   105,   105,   421,    91,    92,    93,    94,    95,
      96,   428,    11,   430,   105,   432,   105,   122,    11,    77,
     120,   120,   120,     5,    77,   120,     4,   467,    10,    11,
      12,    13,    14,   105,     4,   105,   453,   122,   122,    21,
      22,     4,   507,   123,    26,    27,   122,   464,   465,   122,
       4,     4,    34,    35,     4,     4,    38,   101,   102,   103,
     104,   105,   106,     4,     4,   109,   105,   205,    47,   113,
     114,    13,    66,   490,    53,    54,   113,   494,    96,   173,
     497,    60,   499,   144,   317,   196,    68,   195,    70,    71,
      72,   336,   180,   427,    73,    74,    75,    76,    80,   490,
     469,   184,    84,   177,    86,    39,    40,    41,    42,    43,
      44,    45,    46,   514,    48,    49,    50,    51,    52,   101,
     102,   103,   104,   105,   106,   231,   295,   109,   254,   130,
     341,   113,   114,    -1,   209,    -1,    -1,    -1,    -1,   118,
      -1,   123,   121,    -1,    -1,    -1,    -1,   126,   127,   128,
     129,   130,   131,   132,   133,   101,   102,   103,   104,   105,
     106,    -1,    -1,   109,   110,   111,   112,    -1,   114,   101,
     102,   103,   104,    -1,   106,    -1,    -1,   109,   110,   111,
     112,    -1,   114,   117,    -1,   119,   120,   121,   101,   102,
     103,   104,   105,   106,    -1,    -1,   109,   101,   102,   103,
     104,   114,   106,    -1,    -1,   109,    -1,    -1,    -1,    -1,
     114
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     9,    26,    28,    32,    35,    67,    83,
      99,   107,   136,   137,   138,   139,   141,   142,   143,   152,
     155,   156,   163,   175,     7,     8,   140,   109,   121,   105,
     164,   144,    55,    56,    57,    58,    59,   105,   218,   219,
     176,   153,     4,     0,   138,     4,   110,     4,    77,   244,
     245,   157,   105,   109,   113,   239,   240,   218,   105,   105,
      35,    98,   107,   115,   116,   145,   147,   148,   154,   155,
     206,   207,   208,   109,   122,    79,   101,   102,   103,   104,
     106,   109,   110,   111,   112,   114,   235,   243,   246,   248,
     249,   250,     4,   165,   105,   120,   177,   146,     4,   148,
     100,    83,   149,   150,   208,   243,    79,    77,   134,     4,
      30,    31,   158,   159,   160,   161,   162,    91,    92,    93,
      94,    95,    96,    97,   170,   171,   184,   120,   250,   170,
     110,   183,   184,     4,   113,   243,   247,   248,   218,   105,
      29,   160,   123,     4,    77,   250,     4,   105,   113,   241,
     242,   243,    77,    98,   151,   235,   236,   237,   238,   242,
     248,   105,   105,    55,    56,    57,    58,   105,   172,   173,
     166,   171,   184,   178,   120,   184,   121,    77,     4,     4,
      77,   124,     4,   167,   167,   109,   244,   238,   173,     5,
     107,   115,   116,   168,   174,   203,   204,   205,   174,   122,
     169,     4,     4,    78,   205,   206,   209,    78,   218,     5,
      10,    11,    12,    13,    14,    21,    22,    26,    27,    34,
      35,    38,    68,    70,    71,    72,    80,    84,    86,   105,
     109,   113,   145,   179,   193,   195,   199,   211,   220,   221,
     222,   223,   224,   226,   233,   235,   105,   215,   249,   241,
     241,   229,   243,   243,   243,   235,   216,   105,   105,   212,
     213,   214,   103,   109,   251,   243,   109,   123,   226,   235,
     243,   123,     4,   236,     4,     4,   123,   227,    39,    40,
      41,    42,    43,    44,    45,    46,    48,    49,    50,    51,
      52,   117,   119,   120,   121,   225,   218,   230,    11,    61,
      62,    63,    64,    65,    66,    77,   234,    11,    77,   234,
      77,   151,   218,   218,   218,   120,   200,   201,   180,   196,
     232,   235,   123,   243,   243,   243,   243,   243,   243,   243,
     243,   243,   243,   243,   243,   243,    21,    22,    23,    24,
      25,    68,    69,   113,   125,   126,   127,   217,   226,   243,
     244,   109,   235,   240,   105,    18,   231,   241,   241,   243,
     241,   241,   243,   243,   105,   210,   105,   105,   243,   202,
     243,   202,   186,   197,    77,   124,   228,   229,   219,   243,
     251,   105,   151,   243,   243,   243,   105,    47,    53,    54,
      60,    73,    74,    75,    76,   118,   121,   126,   127,   128,
     129,   130,   131,   132,   133,   122,    11,    11,    77,   121,
      77,   120,   120,    77,   124,   124,    12,    90,   182,   187,
       4,    71,    85,    87,   194,   198,   235,   120,    77,   124,
      77,   121,    77,   121,    77,   243,   243,   243,   243,   243,
     243,   243,   243,   243,   244,   243,   243,   243,   243,   243,
     243,   243,   243,   120,   241,   241,   243,   244,   105,   250,
     250,   243,   229,   243,    82,    88,    89,   185,     4,   243,
       4,   224,   235,   229,   243,   244,   243,   244,   105,   122,
     243,   122,     4,   243,   243,   109,   235,   181,   208,   230,
     123,   122,   122,     4,    77,     4,     4,    77,     4,    77,
     188,     4,   228,   243,   243,   243,    34,    70,    81,   189,
     124,     4,     4,     4,   190,   235,     4,   218,   191,   105,
      19,    20,   192
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

/* YYLLOC_DEFAULT -- Compute the default location (before the actions
   are run).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)		\
   ((Current).first_line   = (Rhs)[1].first_line,	\
    (Current).first_column = (Rhs)[1].first_column,	\
    (Current).last_line    = (Rhs)[N].last_line,	\
    (Current).last_column  = (Rhs)[N].last_column)
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

# define YYDSYMPRINT(Args)			\
do {						\
  if (yydebug)					\
    yysymprint Args;				\
} while (0)

# define YYDSYMPRINTF(Title, Token, Value, Location)		\
do {								\
  if (yydebug)							\
    {								\
      YYFPRINTF (stderr, "%s ", Title);				\
      yysymprint (stderr, 					\
                  Token, Value);	\
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
# define YYDSYMPRINT(Args)
# define YYDSYMPRINTF(Title, Token, Value, Location)
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

#if defined (YYMAXDEPTH) && YYMAXDEPTH == 0
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
    {
      YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
# ifdef YYPRINT
      YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
    }
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

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
yydestruct (int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yytype, yyvaluep)
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvaluep;

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
  /* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;

  register int yystate;
  register int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Lookahead token as an internal (translated) token number.  */
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
/* Read a lookahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to lookahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
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
      YYDSYMPRINTF ("Next token is", yytoken, &yylval, &yylloc);
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

  /* Shift the lookahead token.  */
  YYDPRINTF ((stderr, "Shifting token %s, ", yytname[yytoken]));

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
#line 403 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 412 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 413 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 414 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 415 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 9:
#line 416 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 417 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 418 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 12:
#line 419 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 420 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 421 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 424 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 425 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 17:
#line 428 "imcc/imcc.y"
    { IMCC_INFO(interp)->state->pragmas |= PR_FASTCALL; }
    break;

  case 18:
#line 430 "imcc/imcc.y"
    { if (yyvsp[0].s)
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 19:
#line 438 "imcc/imcc.y"
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
#line 450 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 21:
#line 456 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 22:
#line 464 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 23:
#line 465 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 24:
#line 469 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 25:
#line 470 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 28:
#line 478 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 29:
#line 479 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 30:
#line 480 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 31:
#line 481 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 32:
#line 482 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 34:
#line 486 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 35:
#line 488 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 36:
#line 491 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(interp, yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(interp, str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, cur_unit);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 37:
#line 497 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 39:
#line 505 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 40:
#line 507 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 43:
#line 522 "imcc/imcc.y"
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
#line 538 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 45:
#line 545 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 47:
#line 554 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 52:
#line 565 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 570 "imcc/imcc.y"
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
#line 584 "imcc/imcc.y"
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
#line 600 "imcc/imcc.y"
    {
           cur_unit = (IMCC_INFO(interp)->state->pragmas & PR_FASTCALL ?
                  imc_open_unit(interp, IMC_FASTSUB)
                : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 56:
#line 606 "imcc/imcc.y"
    {
          Instruction *i = iSUBROUTINE(cur_unit, yyvsp[0].sr);
          i->r[1] = cur_call = mk_pcc_sub(interp, str_dup(i->r[0]->name), 0);
          add_namespace(interp, cur_unit);
        }
    break;

  case 57:
#line 611 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 58:
#line 613 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 59:
#line 617 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 60:
#line 618 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 61:
#line 619 "imcc/imcc.y"
    { add_pcc_param(cur_call, yyvsp[-1].sr);}
    break;

  case 62:
#line 623 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 63:
#line 624 "imcc/imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 64:
#line 628 "imcc/imcc.y"
    { yyval.t = 0;  }
    break;

  case 65:
#line 629 "imcc/imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; }
    break;

  case 66:
#line 630 "imcc/imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; }
    break;

  case 67:
#line 631 "imcc/imcc.y"
    { yyval.t = yyvsp[0].t; }
    break;

  case 68:
#line 632 "imcc/imcc.y"
    { yyval.t = yyvsp[0].t; }
    break;

  case 69:
#line 635 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 70:
#line 639 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 71:
#line 640 "imcc/imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); }
    break;

  case 72:
#line 641 "imcc/imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);}
    break;

  case 73:
#line 645 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 74:
#line 646 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 75:
#line 647 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 76:
#line 648 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 77:
#line 649 "imcc/imcc.y"
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

  case 80:
#line 667 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 81:
#line 669 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(interp, yyvsp[0].s));
            i->r[1] = cur_call = mk_pcc_sub(interp, str_dup(i->r[0]->name), 0);
            add_namespace(interp, cur_unit);

         }
    break;

  case 82:
#line 675 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 83:
#line 677 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 84:
#line 682 "imcc/imcc.y"
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
            current_call = i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB;
            /*
             * if we are inside a pcc_sub mark the sub as doing a
             * sub call; the sub is in r[1] of the first ins
             */
            r1 = cur_unit->instructions->r[1];
            if (r1 && r1->pcc_sub)
                r1->pcc_sub->calls_a_sub |= 1;
         }
    break;

  case 85:
#line 708 "imcc/imcc.y"
    { yyval.i = 0; current_call = NULL; }
    break;

  case 86:
#line 712 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 0; }
    break;

  case 87:
#line 713 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 1; }
    break;

  case 88:
#line 717 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 89:
#line 719 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 90:
#line 723 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 91:
#line 724 "imcc/imcc.y"
    { yyval.t = yyvsp[0].t; }
    break;

  case 92:
#line 725 "imcc/imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; }
    break;

  case 93:
#line 729 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 94:
#line 730 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 95:
#line 731 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 96:
#line 732 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 97:
#line 733 "imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 98:
#line 734 "imcc/imcc.y"
    {  yyval.t = P_METHOD; }
    break;

  case 99:
#line 739 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 100:
#line 744 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 101:
#line 746 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-1].sr);
            current_call->r[0]->pcc_sub->flags |= isNCI;
         }
    break;

  case 102:
#line 751 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 103:
#line 753 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 104:
#line 755 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 105:
#line 759 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 106:
#line 766 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 107:
#line 767 "imcc/imcc.y"
    {  add_pcc_arg(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 108:
#line 771 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 109:
#line 776 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 110:
#line 777 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 111:
#line 781 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 112:
#line 782 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 113:
#line 783 "imcc/imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 114:
#line 787 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 115:
#line 788 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 116:
#line 792 "imcc/imcc.y"
    {  yyval.t = VT_FLAT;   }
    break;

  case 117:
#line 793 "imcc/imcc.y"
    {  yyval.t = VT_OPTIONAL; }
    break;

  case 118:
#line 798 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 119:
#line 799 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 122:
#line 809 "imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 123:
#line 812 "imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 124:
#line 813 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 125:
#line 819 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 126:
#line 821 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 127:
#line 823 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 128:
#line 827 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 129:
#line 832 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 130:
#line 837 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 131:
#line 839 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 132:
#line 844 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 133:
#line 848 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 134:
#line 849 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 135:
#line 850 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 138:
#line 868 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 139:
#line 873 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 140:
#line 874 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 141:
#line 875 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 142:
#line 876 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 143:
#line 880 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 147:
#line 890 "imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 148:
#line 897 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 149:
#line 901 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 150:
#line 909 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 153:
#line 919 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 154:
#line 920 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 155:
#line 921 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 156:
#line 922 "imcc/imcc.y"
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
#line 934 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 158:
#line 935 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 160:
#line 937 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 161:
#line 938 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 162:
#line 939 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 163:
#line 940 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
                                1, mk_ident(interp, yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 164:
#line 942 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 165:
#line 943 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 166:
#line 944 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 167:
#line 945 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 168:
#line 946 "imcc/imcc.y"
    { yyval.i = NULL;
                           current_call->r[0]->pcc_sub->flags |= isTAIL_CALL;
                           current_call = NULL;
                        }
    break;

  case 169:
#line 950 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 170:
#line 951 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 171:
#line 952 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 172:
#line 954 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 173:
#line 956 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 174:
#line 958 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 175:
#line 959 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 177:
#line 961 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 178:
#line 965 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 179:
#line 966 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 180:
#line 967 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 181:
#line 968 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 182:
#line 972 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 183:
#line 973 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 184:
#line 974 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 185:
#line 975 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 186:
#line 976 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 187:
#line 977 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 188:
#line 982 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 189:
#line 992 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 993 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 191:
#line 994 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 192:
#line 995 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 193:
#line 996 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 997 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 195:
#line 998 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 999 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 1000 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 1001 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 1002 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 1003 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 201:
#line 1005 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 1007 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 1009 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 1011 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 1013 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 1015 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 1017 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 208:
#line 1019 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 1021 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 210:
#line 1023 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 211:
#line 1025 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 1027 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 213:
#line 1029 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 214:
#line 1031 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 215:
#line 1033 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 216:
#line 1035 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 1037 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 218:
#line 1039 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                  mk_sub_address(interp, yyvsp[0].s), NULL, 1); }
    break;

  case 219:
#line 1042 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use $1 instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(interp, yyvsp[-2].s),
                                           mk_sub_address(interp, yyvsp[0].s), 1); }
    break;

  case 220:
#line 1049 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 221:
#line 1052 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 222:
#line 1054 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 223:
#line 1058 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 1060 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 1062 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 226:
#line 1065 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 227:
#line 1071 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 228:
#line 1075 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 231:
#line 1085 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 232:
#line 1087 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 233:
#line 1089 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 234:
#line 1091 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 235:
#line 1093 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 236:
#line 1095 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 237:
#line 1097 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 238:
#line 1099 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 239:
#line 1101 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 240:
#line 1103 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 241:
#line 1105 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 242:
#line 1107 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 243:
#line 1109 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 244:
#line 1114 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 245:
#line 1120 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 246:
#line 1121 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 247:
#line 1122 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 248:
#line 1127 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 249:
#line 1128 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 250:
#line 1129 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 251:
#line 1132 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 252:
#line 1133 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 253:
#line 1138 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 254:
#line 1143 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 255:
#line 1147 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 256:
#line 1148 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 257:
#line 1149 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 258:
#line 1153 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 259:
#line 1157 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 260:
#line 1158 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 261:
#line 1162 "imcc/imcc.y"
    {  yyval.t = VT_FLAT; }
    break;

  case 262:
#line 1166 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 263:
#line 1167 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 264:
#line 1172 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 265:
#line 1174 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 266:
#line 1176 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 267:
#line 1178 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 268:
#line 1180 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 269:
#line 1182 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 270:
#line 1186 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 271:
#line 1187 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 272:
#line 1188 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 273:
#line 1189 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 274:
#line 1190 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 275:
#line 1191 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 278:
#line 1200 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 279:
#line 1201 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 280:
#line 1205 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 282:
#line 1210 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 283:
#line 1212 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 285:
#line 1220 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 286:
#line 1224 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 287:
#line 1225 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 288:
#line 1229 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 289:
#line 1230 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 294:
#line 1243 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 295:
#line 1244 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 296:
#line 1248 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 297:
#line 1250 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 298:
#line 1251 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 299:
#line 1252 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 300:
#line 1256 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 301:
#line 1262 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 302:
#line 1264 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 303:
#line 1265 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 304:
#line 1269 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 305:
#line 1270 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 306:
#line 1271 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 307:
#line 1272 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 308:
#line 1273 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 309:
#line 1277 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 310:
#line 1278 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 311:
#line 1279 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 312:
#line 1280 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 313:
#line 1284 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 314:
#line 1285 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1010 of yacc.c.  */
#line 3685 "imcc/imcparser.c"

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
      /* If just tried and failed to reuse lookahead token after an
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
		 YYDSYMPRINTF ("Error: popping", yystos[*yyssp], yyvsp, yylsp);
		 yydestruct (yystos[*yyssp], yyvsp);
	       }
        }
      else
	{
	  YYDSYMPRINTF ("Error: discarding", yytoken, &yylval, &yylloc);
	  yydestruct (yytoken, &yylval);
	  yychar = YYEMPTY;

	}
    }

  /* Else will try to reuse lookahead token after shifting the error
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

      YYDSYMPRINTF ("Error: popping", yystos[*yyssp], yyvsp, yylsp);
      yydestruct (yystos[yystate], yyvsp);
      YYPOPSTACK;
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
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


#line 1290 "imcc/imcc.y"



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

