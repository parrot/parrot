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
     CLASS = 276,
     ENDCLASS = 277,
     FIELD = 278,
     DOT_METHOD = 279,
     SUB = 280,
     SYM = 281,
     LOCAL = 282,
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
     POW = 321,
     SHIFT_RIGHT_U = 322,
     LOG_AND = 323,
     LOG_OR = 324,
     COMMA = 325,
     ESUB = 326,
     DOTDOT = 327,
     PCC_BEGIN = 328,
     PCC_END = 329,
     PCC_CALL = 330,
     PCC_SUB = 331,
     PCC_BEGIN_RETURN = 332,
     PCC_END_RETURN = 333,
     PCC_BEGIN_YIELD = 334,
     PCC_END_YIELD = 335,
     NCI_CALL = 336,
     METH_CALL = 337,
     INVOCANT = 338,
     MAIN = 339,
     LOAD = 340,
     IMMEDIATE = 341,
     POSTCOMP = 342,
     METHOD = 343,
     ANON = 344,
     MULTI = 345,
     LABEL = 346,
     EMIT = 347,
     EOM = 348,
     IREG = 349,
     NREG = 350,
     SREG = 351,
     PREG = 352,
     IDENTIFIER = 353,
     REG = 354,
     MACRO = 355,
     ENDM = 356,
     STRINGC = 357,
     INTC = 358,
     FLOATC = 359,
     USTRINGC = 360,
     PARROT_OP = 361,
     VAR = 362,
     LINECOMMENT = 363,
     FILECOMMENT = 364,
     DOT = 365,
     CONCAT = 366,
     POINTY = 367
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define FASTCALL 261
#define N_OPERATORS 262
#define HLL 263
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
#define CLASS 276
#define ENDCLASS 277
#define FIELD 278
#define DOT_METHOD 279
#define SUB 280
#define SYM 281
#define LOCAL 282
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
#define POW 321
#define SHIFT_RIGHT_U 322
#define LOG_AND 323
#define LOG_OR 324
#define COMMA 325
#define ESUB 326
#define DOTDOT 327
#define PCC_BEGIN 328
#define PCC_END 329
#define PCC_CALL 330
#define PCC_SUB 331
#define PCC_BEGIN_RETURN 332
#define PCC_END_RETURN 333
#define PCC_BEGIN_YIELD 334
#define PCC_END_YIELD 335
#define NCI_CALL 336
#define METH_CALL 337
#define INVOCANT 338
#define MAIN 339
#define LOAD 340
#define IMMEDIATE 341
#define POSTCOMP 342
#define METHOD 343
#define ANON 344
#define MULTI 345
#define LABEL 346
#define EMIT 347
#define EOM 348
#define IREG 349
#define NREG 350
#define SREG 351
#define PREG 352
#define IDENTIFIER 353
#define REG 354
#define MACRO 355
#define ENDM 356
#define STRINGC 357
#define INTC 358
#define FLOATC 359
#define USTRINGC 360
#define PARROT_OP 361
#define VAR 362
#define LINECOMMENT 363
#define FILECOMMENT 364
#define DOT 365
#define CONCAT 366
#define POINTY 367




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
#line 622 "imcc/imcparser.c"
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
#line 643 "imcc/imcparser.c"

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
#define YYLAST   590

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  129
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  116
/* YYNRULES -- Number of rules. */
#define YYNRULES  305
/* YYNRULES -- Number of states. */
#define YYNSTATES  515

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   367

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   119,     2,     2,     2,   125,   126,     2,
     117,   118,   123,   122,     2,   120,     2,   124,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   128,
       2,   114,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   115,     2,   116,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   127,     2,   121,     2,     2,     2,
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
     106,   107,   108,   109,   110,   111,   112,   113
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    24,    27,    29,    31,    35,    38,    40,    43,
      48,    52,    58,    59,    66,    67,    74,    76,    79,    83,
      86,    88,    90,    92,    94,    95,    99,   103,   106,   107,
     109,   110,   115,   116,   118,   123,   124,   131,   133,   134,
     136,   139,   141,   143,   145,   150,   155,   156,   157,   158,
     169,   170,   172,   176,   177,   183,   184,   186,   191,   192,
     196,   198,   200,   202,   204,   206,   208,   209,   211,   212,
     213,   214,   225,   226,   236,   237,   240,   241,   245,   246,
     248,   250,   254,   256,   258,   260,   262,   264,   266,   268,
     274,   278,   282,   286,   290,   296,   302,   303,   307,   310,
     311,   315,   319,   320,   325,   326,   329,   331,   333,   335,
     337,   339,   341,   343,   344,   350,   352,   353,   356,   360,
     364,   365,   371,   372,   378,   379,   381,   385,   387,   390,
     391,   394,   397,   399,   401,   402,   404,   407,   409,   411,
     415,   417,   421,   423,   425,   428,   431,   432,   437,   438,
     445,   447,   448,   455,   458,   461,   464,   467,   469,   471,
     473,   474,   476,   478,   480,   482,   484,   486,   488,   492,
     497,   502,   507,   513,   519,   525,   531,   537,   543,   549,
     555,   561,   567,   573,   579,   585,   591,   597,   603,   609,
     616,   623,   630,   638,   643,   648,   655,   663,   668,   673,
     678,   683,   690,   698,   702,   703,   713,   715,   717,   721,
     725,   729,   733,   737,   741,   745,   749,   753,   757,   761,
     765,   769,   773,   778,   780,   782,   784,   788,   792,   796,
     798,   800,   801,   807,   808,   812,   814,   817,   818,   821,
     823,   826,   830,   832,   839,   846,   852,   858,   863,   868,
     873,   878,   880,   882,   884,   886,   888,   890,   892,   894,
     895,   897,   901,   903,   905,   910,   912,   914,   916,   918,
     920,   922,   924,   926,   928,   930,   931,   934,   936,   940,
     941,   946,   948,   952,   955,   958,   960,   962,   964,   966,
     968,   970,   972,   974,   976,   978
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     130,     0,    -1,   131,    -1,   132,    -1,   131,   132,    -1,
     150,    -1,   149,    -1,   137,    -1,   136,    -1,   157,    -1,
     169,    -1,   146,    -1,   101,     4,    -1,   133,    -1,     4,
      -1,     6,   134,     4,    -1,   135,     4,    -1,     7,    -1,
       8,   104,    -1,     9,   103,    71,   103,    -1,    61,   210,
      99,    -1,    61,   210,    99,   114,   243,    -1,    -1,    29,
     138,   210,    99,   114,   243,    -1,    -1,    29,   140,   104,
     235,   114,   103,    -1,   142,    -1,   141,   142,    -1,   201,
     143,     4,    -1,   101,     4,    -1,   110,    -1,   109,    -1,
     149,    -1,   139,    -1,    -1,   144,   107,   145,    -1,    77,
     177,    92,    -1,    14,   236,    -1,    -1,   229,    -1,    -1,
      93,   147,   148,    94,    -1,    -1,   141,    -1,    20,   115,
     237,   116,    -1,    -1,    22,    99,   151,     4,   152,    23,
      -1,   153,    -1,    -1,   154,    -1,   153,   154,    -1,   155,
      -1,   156,    -1,     4,    -1,    24,   210,    99,     4,    -1,
      25,    99,    99,     4,    -1,    -1,    -1,    -1,    26,   158,
     232,   159,   177,     4,   160,   161,   168,    72,    -1,    -1,
       4,    -1,   161,   162,     4,    -1,    -1,     5,   163,   210,
      99,   186,    -1,    -1,    71,    -1,    91,   117,   166,   118,
      -1,    -1,   166,    71,   167,    -1,   167,    -1,    49,    -1,
      50,    -1,    52,    -1,    51,    -1,    99,    -1,    -1,   198,
      -1,    -1,    -1,    -1,    77,   170,    99,   171,   177,     4,
     172,   161,   168,    72,    -1,    -1,    74,     4,   174,   181,
     176,   180,   175,   183,    75,    -1,    -1,   203,     4,    -1,
      -1,    84,   236,     4,    -1,    -1,   178,    -1,   179,    -1,
     178,   164,   179,    -1,    86,    -1,    85,    -1,    87,    -1,
      88,    -1,    90,    -1,    89,    -1,   165,    -1,    76,   236,
      71,   236,     4,    -1,    76,   236,     4,    -1,    82,   236,
       4,    -1,    83,   228,     4,    -1,    83,   103,     4,    -1,
      83,   228,    71,   236,     4,    -1,    83,   103,    71,   236,
       4,    -1,    -1,   181,   182,     4,    -1,    11,   221,    -1,
      -1,   183,   184,     4,    -1,    64,   228,   186,    -1,    -1,
      28,   185,   210,    99,    -1,    -1,   186,   187,    -1,    16,
      -1,    17,    -1,    18,    -1,    78,    -1,    80,    -1,    79,
      -1,    81,    -1,    -1,   188,     4,   191,   192,   189,    -1,
     194,    -1,    -1,   192,     4,    -1,   192,   193,     4,    -1,
      65,   236,   222,    -1,    -1,    65,   117,   195,   197,   118,
      -1,    -1,    66,   117,   196,   197,   118,    -1,    -1,   221,
      -1,   197,    71,   221,    -1,   200,    -1,   198,   200,    -1,
      -1,   199,   204,    -1,   101,     4,    -1,   110,    -1,   109,
      -1,    -1,   202,    -1,   202,   203,    -1,   203,    -1,    92,
      -1,   201,   206,     4,    -1,    99,    -1,   205,    71,    99,
      -1,   212,    -1,   226,    -1,    20,    99,    -1,    21,    99,
      -1,    -1,    28,   207,   210,   205,    -1,    -1,    29,   208,
     210,    99,   114,   243,    -1,   139,    -1,    -1,    32,   209,
     210,    99,   114,   243,    -1,    65,   218,    -1,    10,   234,
      -1,   107,   229,    -1,    14,   236,    -1,   218,    -1,   173,
      -1,   190,    -1,    -1,    49,    -1,    50,    -1,    51,    -1,
      52,    -1,    53,    -1,   211,    -1,    99,    -1,   228,   114,
     236,    -1,   228,   114,   119,   236,    -1,   228,   114,   120,
     236,    -1,   228,   114,   121,   236,    -1,   228,   114,   236,
     122,   236,    -1,   228,   114,   236,   120,   236,    -1,   228,
     114,   236,   123,   236,    -1,   228,   114,   236,    67,   236,
      -1,   228,   114,   236,   124,   236,    -1,   228,   114,   236,
      41,   236,    -1,   228,   114,   236,   125,   236,    -1,   228,
     114,   236,   112,   236,    -1,   228,   114,   236,    47,   236,
      -1,   228,   114,   236,    48,   236,    -1,   228,   114,   236,
      68,   236,    -1,   228,   114,   236,    69,   236,    -1,   228,
     114,   236,    70,   236,    -1,   228,   114,   236,    54,   236,
      -1,   228,   114,   236,   126,   236,    -1,   228,   114,   236,
     127,   236,    -1,   228,   114,   236,   121,   236,    -1,   228,
     114,   236,   115,   237,   116,    -1,   228,   115,   237,   116,
     114,   236,    -1,   228,   114,    19,   211,    71,   236,    -1,
     228,   114,    19,   211,   115,   237,   116,    -1,   228,   114,
      19,   211,    -1,   228,   114,    19,   236,    -1,   228,   114,
      19,   236,    71,   236,    -1,   228,   114,    19,   236,   115,
     237,   116,    -1,   228,   114,    63,    99,    -1,   228,   114,
      62,   244,    -1,    62,   244,   114,   236,    -1,    19,   228,
      71,   236,    -1,    19,   228,    71,   236,    71,   236,    -1,
      19,   228,    71,   236,   115,   237,   116,    -1,   228,   114,
     218,    -1,    -1,   213,   117,   225,   118,   114,   216,   117,
     220,   118,    -1,   214,    -1,   215,    -1,   228,   114,    14,
      -1,   228,    33,   236,    -1,   228,    34,   236,    -1,   228,
      35,   236,    -1,   228,    36,   236,    -1,   228,    43,   236,
      -1,   228,    42,   236,    -1,   228,    37,   236,    -1,   228,
      38,   236,    -1,   228,    39,   236,    -1,   228,    40,   236,
      -1,   228,    44,   236,    -1,   228,    45,   236,    -1,   228,
      46,   236,    -1,   228,   114,   107,   145,    -1,    99,    -1,
     103,    -1,   228,    -1,   228,   217,   233,    -1,   228,   217,
     103,    -1,   228,   217,   228,    -1,   113,    -1,   111,    -1,
      -1,   216,   219,   117,   220,   118,    -1,    -1,   220,    71,
     221,    -1,   221,    -1,   236,   222,    -1,    -1,   222,   223,
      -1,    15,    -1,   228,   186,    -1,   225,    71,   224,    -1,
     224,    -1,    12,   236,   227,   236,    10,   234,    -1,    13,
     236,   227,   236,    10,   234,    -1,    12,    14,   236,    10,
     234,    -1,    13,    14,   236,    10,   234,    -1,    12,   236,
      10,   234,    -1,    13,   236,    10,   234,    -1,    12,   236,
      71,   234,    -1,    13,   236,    71,   234,    -1,    55,    -1,
      56,    -1,    57,    -1,    58,    -1,    59,    -1,    60,    -1,
     108,    -1,   242,    -1,    -1,   230,    -1,   230,    71,   231,
      -1,   231,    -1,   235,    -1,   228,   115,   237,   116,    -1,
     233,    -1,   103,    -1,    99,    -1,   107,    -1,    99,    -1,
     107,    -1,   234,    -1,   236,    -1,   228,    -1,   243,    -1,
      -1,   238,   239,    -1,   241,    -1,   239,   128,   241,    -1,
      -1,   239,    71,   240,   241,    -1,   236,    -1,   236,    73,
     236,    -1,    73,   236,    -1,   236,    73,    -1,    95,    -1,
      96,    -1,    97,    -1,    98,    -1,   100,    -1,   104,    -1,
     105,    -1,   103,    -1,   106,    -1,    97,    -1,   103,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   397,   397,   401,   403,   406,   408,   409,   410,   411,
     412,   413,   414,   415,   416,   419,   420,   423,   424,   432,
     443,   450,   459,   458,   464,   463,   467,   469,   472,   474,
     475,   476,   477,   478,   481,   481,   485,   493,   495,   498,
     503,   502,   513,   515,   518,   536,   534,   550,   552,   555,
     557,   560,   562,   563,   566,   580,   598,   604,   607,   596,
     612,   614,   615,   619,   618,   624,   626,   630,   633,   635,
     636,   639,   641,   642,   643,   644,   656,   658,   662,   664,
     668,   661,   675,   673,   705,   707,   710,   712,   716,   718,
     721,   723,   726,   728,   729,   730,   731,   732,   733,   736,
     742,   744,   749,   751,   753,   757,   764,   766,   769,   774,
     776,   779,   781,   781,   785,   787,   790,   792,   793,   797,
     799,   802,   804,   809,   807,   813,   818,   820,   822,   826,
     832,   830,   839,   838,   847,   849,   850,   854,   856,   867,
     871,   874,   875,   876,   879,   881,   884,   886,   889,   895,
     900,   908,   916,   918,   919,   920,   921,   921,   934,   934,
     936,   937,   937,   939,   943,   944,   947,   949,   950,   951,
     952,   955,   957,   958,   959,   960,   961,   964,   975,   977,
     978,   979,   980,   981,   982,   983,   984,   985,   986,   987,
     988,   990,   992,   994,   996,   998,  1000,  1002,  1004,  1006,
    1008,  1010,  1012,  1014,  1016,  1018,  1020,  1022,  1025,  1027,
    1031,  1033,  1035,  1038,  1045,  1044,  1053,  1054,  1055,  1059,
    1062,  1064,  1066,  1068,  1070,  1072,  1074,  1076,  1078,  1080,
    1082,  1084,  1088,  1096,  1097,  1098,  1103,  1104,  1105,  1108,
    1109,  1114,  1112,  1122,  1124,  1125,  1128,  1132,  1134,  1137,
    1141,  1144,  1146,  1149,  1152,  1154,  1156,  1158,  1160,  1162,
    1164,  1168,  1170,  1171,  1172,  1173,  1174,  1177,  1179,  1182,
    1184,  1187,  1189,  1192,  1194,  1201,  1203,  1206,  1208,  1211,
    1213,  1216,  1218,  1221,  1223,  1226,  1226,  1230,  1232,  1234,
    1234,  1238,  1244,  1247,  1248,  1251,  1253,  1254,  1255,  1256,
    1259,  1261,  1262,  1263,  1266,  1268
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "PRAGMA", 
  "FASTCALL", "N_OPERATORS", "HLL", "GOTO", "ARG", "IF", "UNLESS", 
  "PNULL", "ADV_FLAT", "ADV_SLURPY", "ADV_OPTIONAL", "ADV_OPT_FLAG", 
  "NEW", "NAMESPACE", "ENDNAMESPACE", "CLASS", "ENDCLASS", "FIELD", 
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
  "@18", "@19", "@20", "type", "classname", "assignment", "@21", 
  "op_assign", "func_assign", "the_sub", "ptr", "sub_call", "@22", 
  "arglist", "arg", "argtype_list", "argtype", "result", "targetlist", 
  "if_statement", "relop", "target", "vars", "_vars", "_var_or_i", 
  "sub_label_op_c", "sub_label_op", "label_op", "var_or_i", "var", 
  "keylist", "@23", "_keylist", "@24", "key", "reg", "const", "string", 0
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
     364,   365,   366,   367,    61,    91,    93,    40,    41,    33,
      45,   126,    43,    42,    47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   129,   130,   131,   131,   132,   132,   132,   132,   132,
     132,   132,   132,   132,   132,   133,   133,   134,   134,   135,
     136,   136,   138,   137,   140,   139,   141,   141,   142,   142,
     142,   142,   142,   142,   144,   143,   143,   143,   143,   145,
     147,   146,   148,   148,   149,   151,   150,   152,   152,   153,
     153,   154,   154,   154,   155,   156,   158,   159,   160,   157,
     161,   161,   161,   163,   162,   164,   164,   165,   166,   166,
     166,   167,   167,   167,   167,   167,   168,   168,   170,   171,
     172,   169,   174,   173,   175,   175,   176,   176,   177,   177,
     178,   178,   179,   179,   179,   179,   179,   179,   179,   180,
     180,   180,   180,   180,   180,   180,   181,   181,   182,   183,
     183,   184,   185,   184,   186,   186,   187,   187,   187,   188,
     188,   189,   189,   191,   190,   190,   192,   192,   192,   193,
     195,   194,   196,   194,   197,   197,   197,   198,   198,   199,
     200,   200,   200,   200,   201,   201,   202,   202,   203,   204,
     205,   205,   206,   206,   206,   206,   207,   206,   208,   206,
     206,   209,   206,   206,   206,   206,   206,   206,   206,   206,
     206,   210,   210,   210,   210,   210,   210,   211,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   213,   212,   212,   212,   212,   214,
     214,   214,   214,   214,   214,   214,   214,   214,   214,   214,
     214,   214,   215,   216,   216,   216,   216,   216,   216,   217,
     217,   219,   218,   220,   220,   220,   221,   222,   222,   223,
     224,   225,   225,   226,   226,   226,   226,   226,   226,   226,
     226,   227,   227,   227,   227,   227,   227,   228,   228,   229,
     229,   230,   230,   231,   231,   232,   232,   233,   233,   234,
     234,   235,   235,   236,   236,   238,   237,   239,   239,   240,
     239,   241,   241,   241,   241,   242,   242,   242,   242,   242,
     243,   243,   243,   243,   244,   244
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     2,     1,     1,     3,     2,     1,     2,     4,
       3,     5,     0,     6,     0,     6,     1,     2,     3,     2,
       1,     1,     1,     1,     0,     3,     3,     2,     0,     1,
       0,     4,     0,     1,     4,     0,     6,     1,     0,     1,
       2,     1,     1,     1,     4,     4,     0,     0,     0,    10,
       0,     1,     3,     0,     5,     0,     1,     4,     0,     3,
       1,     1,     1,     1,     1,     1,     0,     1,     0,     0,
       0,    10,     0,     9,     0,     2,     0,     3,     0,     1,
       1,     3,     1,     1,     1,     1,     1,     1,     1,     5,
       3,     3,     3,     3,     5,     5,     0,     3,     2,     0,
       3,     3,     0,     4,     0,     2,     1,     1,     1,     1,
       1,     1,     1,     0,     5,     1,     0,     2,     3,     3,
       0,     5,     0,     5,     0,     1,     3,     1,     2,     0,
       2,     2,     1,     1,     0,     1,     2,     1,     1,     3,
       1,     3,     1,     1,     2,     2,     0,     4,     0,     6,
       1,     0,     6,     2,     2,     2,     2,     1,     1,     1,
       0,     1,     1,     1,     1,     1,     1,     1,     3,     4,
       4,     4,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     6,
       6,     6,     7,     4,     4,     6,     7,     4,     4,     4,
       4,     6,     7,     3,     0,     9,     1,     1,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     4,     1,     1,     1,     3,     3,     3,     1,
       1,     0,     5,     0,     3,     1,     2,     0,     2,     1,
       2,     3,     1,     6,     6,     5,     5,     4,     4,     4,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     0,
       1,     3,     1,     1,     4,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     0,     2,     1,     3,     0,
       4,     1,     3,     2,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    14,     0,     0,     0,     0,    56,    22,     0,    78,
      40,     0,     0,     2,     3,    13,     0,     8,     7,    11,
       6,     5,     9,    10,    17,     0,     0,     0,   285,    45,
       0,     0,   171,   172,   173,   174,   175,   177,     0,   176,
       0,   144,    12,     1,     4,    16,    18,    15,     0,     0,
       0,     0,   277,   276,   278,    57,   275,     0,    20,    79,
      24,   148,     0,    31,    30,    33,   144,    26,     0,    32,
      34,   145,   147,    19,    44,     0,   295,   296,   297,   298,
     299,   302,   300,   301,   303,   267,   283,   291,   286,   287,
     268,   284,    48,    88,     0,     0,    88,     0,    29,    27,
      41,     0,    88,     0,     0,   146,   293,   294,   289,     0,
      53,     0,     0,     0,    47,    49,    51,    52,    93,    92,
      94,    95,    97,    96,     0,    98,     0,    65,    90,     0,
      21,     0,     0,    37,     0,    28,   269,   292,     0,   288,
       0,     0,    46,    50,    68,    58,    66,     0,    23,    80,
     279,   280,   281,     0,   282,    36,    35,   283,    39,   270,
     272,   273,   290,     0,     0,    71,    72,    74,    73,    75,
       0,    70,    60,    91,    60,     0,   285,     0,    54,    55,
       0,    67,    61,   139,   139,    25,     0,   271,    69,    63,
       0,   143,   142,     0,     0,   139,   144,   137,     0,   274,
       0,   141,    62,    59,   138,   170,   140,    81,     0,     0,
       0,     0,     0,     0,     0,     0,   156,   158,   161,     0,
       0,     0,     0,   119,   120,   233,   234,   269,   160,   168,
       0,   169,   125,     0,   152,     0,   216,   217,   241,   167,
     153,   235,   114,   164,     0,     0,     0,     0,   166,     0,
     154,   155,     0,     0,     0,   304,   305,     0,   130,   163,
     235,   132,    82,   165,   123,   149,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   240,   239,     0,   285,     0,    64,     0,     0,   261,
     262,   263,   264,   265,   266,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   134,   134,   106,   126,
     252,     0,   114,   243,   219,   220,   221,   222,   225,   226,
     227,   228,   224,   223,   229,   230,   231,   218,     0,     0,
       0,   302,   269,     0,     0,     0,   213,   283,   178,     0,
     237,   238,   236,   116,   117,   118,   115,     0,   257,   259,
       0,     0,   258,   260,     0,   210,   150,   157,     0,     0,
     209,     0,   135,   247,     0,    86,     0,     0,     0,   250,
       0,   245,   203,   204,   208,   207,   232,   179,   180,   181,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   285,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   255,
       0,   256,     0,     0,   285,     0,     0,     0,     0,   131,
     246,   133,     0,     0,     0,     0,   127,     0,   121,   122,
     124,     0,   251,     0,     0,   242,     0,   285,     0,   285,
     187,   190,   191,   195,   185,   192,   193,   194,   189,     0,
     183,   198,   182,   184,   186,   188,   196,   197,     0,   253,
     254,   211,     0,   151,   159,   162,   136,   249,   248,   108,
       0,     0,     0,     0,    84,   107,   247,   128,     0,   244,
     201,     0,   205,     0,   199,   200,   212,    87,     0,     0,
       0,     0,   109,     0,   129,   243,   202,   206,   100,     0,
     101,   103,     0,   102,     0,     0,    85,     0,     0,     0,
       0,   112,     0,    83,     0,   215,    99,   105,   104,     0,
     114,   110,     0,   111,   113
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    12,    13,    14,    15,    26,    16,    17,    18,    31,
      65,    97,    66,    67,   103,   104,   156,    19,    41,    68,
      20,    21,    51,   113,   114,   115,   116,   117,    22,    30,
      93,   172,   183,   193,   200,   147,   125,   170,   171,   194,
      23,    40,    96,   174,   229,   308,   482,   414,   126,   127,
     128,   464,   365,   415,   495,   504,   509,   286,   346,   230,
     420,   231,   309,   366,   421,   232,   306,   307,   361,   195,
     196,   197,    70,    71,    72,   206,   357,   233,   252,   253,
     254,    38,    39,   234,   235,   236,   237,   238,   285,   239,
     267,   370,   362,   410,   458,   310,   311,   240,   296,    86,
     158,   159,   160,    55,    56,   152,   161,   363,    49,    50,
      88,   138,    89,    90,    91,   257
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -310
static const short yypact[] =
{
     354,  -310,   104,   -53,   -63,   -35,  -310,  -310,    -6,  -310,
    -310,    93,   120,   354,  -310,  -310,   119,  -310,  -310,  -310,
    -310,  -310,  -310,  -310,  -310,    43,   138,    74,  -310,  -310,
     -74,    -6,  -310,  -310,  -310,  -310,  -310,  -310,    53,  -310,
      57,    88,  -310,  -310,  -310,  -310,  -310,  -310,    67,    62,
     379,   175,  -310,  -310,  -310,  -310,  -310,    76,    70,  -310,
    -310,  -310,   177,  -310,  -310,  -310,   278,  -310,    92,  -310,
       0,    95,  -310,  -310,  -310,   445,  -310,  -310,  -310,  -310,
    -310,  -310,  -310,  -310,  -310,  -310,  -310,   126,   -56,  -310,
    -310,  -310,    34,   498,    90,    59,   498,   102,  -310,  -310,
    -310,   445,   498,   204,   103,  -310,  -310,   445,  -310,   379,
    -310,    -6,   110,   189,    34,  -310,  -310,  -310,  -310,  -310,
    -310,  -310,  -310,  -310,    96,  -310,   210,     3,  -310,    59,
    -310,   211,   417,  -310,   125,  -310,   417,  -310,   379,  -310,
     121,   139,  -310,  -310,    77,  -310,  -310,   498,  -310,  -310,
    -310,  -310,  -310,   105,  -310,  -310,  -310,   127,  -310,   147,
    -310,  -310,  -310,   239,   240,  -310,  -310,  -310,  -310,  -310,
     -52,  -310,   247,  -310,   247,   151,  -310,   417,  -310,  -310,
      77,  -310,  -310,     4,     4,  -310,   146,  -310,  -310,  -310,
     259,  -310,  -310,   260,   193,    50,    95,  -310,   198,  -310,
      -6,  -310,  -310,  -310,  -310,    41,  -310,  -310,   174,   -77,
     171,   227,   445,   482,   182,   183,  -310,   179,  -310,   -79,
     394,   168,   282,  -310,  -310,  -310,  -310,   417,  -310,  -310,
     283,  -310,  -310,   295,  -310,   191,  -310,  -310,  -310,  -310,
    -310,   390,  -310,  -310,   445,   136,   445,   383,  -310,   235,
    -310,  -310,    -6,    -6,    -6,  -310,  -310,   195,  -310,  -310,
     -76,  -310,  -310,  -310,  -310,  -310,   482,   194,   445,   445,
     445,   445,   445,   445,   445,   445,   445,   445,   445,   445,
     445,  -310,  -310,   197,  -310,   459,   156,   300,   -77,  -310,
    -310,  -310,  -310,  -310,  -310,   -77,   445,   302,   -77,   -77,
     445,   445,   216,   220,   221,   445,   445,   445,  -310,  -310,
    -310,   -50,  -310,   445,  -310,  -310,  -310,  -310,  -310,  -310,
    -310,  -310,  -310,  -310,  -310,  -310,  -310,  -310,   431,   -79,
     222,   209,   417,   445,   445,   445,  -310,    44,   344,   213,
    -310,  -310,  -310,  -310,  -310,  -310,  -310,   -77,  -310,  -310,
     324,   -77,  -310,  -310,   335,    19,  -310,   284,   242,   243,
    -310,   -43,  -310,  -310,   -39,    -3,     6,   482,   248,   156,
     -32,  -310,    28,    38,  -310,  -310,  -310,  -310,  -310,  -310,
     445,   445,   445,   445,   445,   445,   445,   445,   445,  -310,
     445,   445,   445,   445,   445,   445,   445,   445,   250,  -310,
     -77,  -310,   -77,   445,  -310,   255,    59,    59,   445,  -310,
     346,  -310,   445,   445,    48,   361,  -310,   445,  -310,  -310,
    -310,   362,  -310,   150,   445,  -310,   445,  -310,   445,  -310,
    -310,  -310,  -310,  -310,  -310,  -310,  -310,  -310,  -310,   251,
    -310,  -310,  -310,  -310,  -310,  -310,  -310,  -310,   445,  -310,
    -310,  -310,   261,  -310,  -310,  -310,  -310,  -310,  -310,  -310,
     367,   445,   445,   473,    95,  -310,  -310,  -310,   258,  -310,
    -310,   262,  -310,   265,  -310,  -310,  -310,  -310,     7,   382,
      12,    13,  -310,   385,   346,   445,  -310,  -310,  -310,   445,
    -310,  -310,   445,  -310,   445,    -8,  -310,   -22,   386,   391,
     392,  -310,   482,  -310,   393,  -310,  -310,  -310,  -310,    -6,
    -310,  -310,   301,   156,  -310
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -310,  -310,  -310,   388,  -310,  -310,  -310,  -310,  -310,  -310,
     200,  -310,  -310,   333,  -310,  -310,    71,  -310,  -310,  -310,
     -18,  -310,  -310,  -310,  -310,   288,  -310,  -310,  -310,  -310,
    -310,  -310,   232,  -310,  -310,  -310,  -310,  -310,   228,   225,
    -310,  -310,  -310,  -310,  -310,  -310,  -310,  -310,   -62,  -310,
     263,  -310,  -310,  -310,  -310,  -310,  -310,  -309,  -310,  -310,
    -310,  -310,  -310,  -310,  -310,  -310,  -310,  -310,   109,  -310,
    -310,   224,   226,  -310,   -70,  -310,  -310,  -310,  -310,  -310,
    -310,   -31,   116,  -310,  -310,  -310,  -310,    -2,  -310,  -194,
    -310,   -65,  -308,   -29,  -310,    79,  -310,  -310,   202,   -95,
     230,  -310,   274,  -310,   173,  -197,   321,   -44,  -149,  -310,
    -310,  -310,   -96,  -310,   -93,   131
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -236
static const short yytable[] =
{
      57,   105,   130,   369,   -38,   371,    87,   -89,   412,   189,
     416,   488,   243,   139,   101,   108,   491,   493,   255,   180,
     501,   367,   150,    69,   256,    52,   259,   186,   408,    53,
     151,   106,   408,    54,   131,   281,   148,   282,   110,   424,
     134,   157,   162,    32,    33,    34,    35,    36,    69,   424,
      27,   209,    28,   210,   211,   212,   502,   133,   111,   112,
     213,   214,   215,   137,    29,    87,   181,   503,   368,   216,
     217,   417,   109,   218,   146,   409,   -76,   102,   489,   411,
     140,   413,   157,   492,   494,   418,   425,   419,   154,   336,
     403,   348,   154,    37,    87,   -89,   505,    42,   349,   426,
     456,   352,   353,   219,   459,   190,   220,   221,     4,   428,
     241,    24,    25,   191,   192,   222,   469,    60,   249,   223,
      43,   224,   -77,    45,   461,   260,   165,   166,   167,   168,
     462,   463,   157,   154,   404,   339,    76,    77,    78,    79,
     225,    80,    47,   427,   226,    48,   288,    46,   227,    85,
     399,   190,    58,   429,   401,   281,    59,   282,  -214,   191,
     192,  -235,    81,    82,    83,    84,   245,   247,   248,   208,
      73,   312,   343,   344,   345,    94,   169,   371,    74,    92,
      61,    98,   -42,   154,    95,   244,   100,    61,   337,    62,
     341,   289,   290,   291,   292,   293,   294,    63,    64,   107,
     287,   513,   297,   449,   129,   450,   132,   295,   135,   141,
     136,   327,   142,   144,   145,   149,   328,   155,   177,   175,
     163,   302,   303,   304,   314,   315,   316,   317,   318,   319,
     320,   321,   322,   323,   324,   325,   326,   157,   164,   338,
     439,   246,   176,   178,   179,    76,    77,    78,    79,   225,
      80,   182,   350,   226,   185,   452,   354,   355,    85,   329,
     330,   360,   199,   201,   202,   203,    76,    77,    78,    79,
     207,    80,   312,   242,    81,    82,    83,    84,   471,    85,
     473,   250,   251,   -24,   373,   261,   262,   264,   154,   377,
     378,   379,    76,    77,    78,    79,   225,    80,     4,   265,
     331,    82,    83,    84,   332,    85,   301,    60,   266,   305,
     347,   313,   351,   454,   455,   356,   333,   334,   335,   358,
     359,   375,    76,    77,    78,    79,  -234,    80,   260,   398,
      81,    82,    83,    84,   400,    85,   430,   431,   432,   433,
     434,   435,   436,   437,   438,   402,   440,   441,   442,   443,
     444,   445,   446,   447,   453,   405,   406,   407,     1,   451,
       2,   457,   423,     3,   448,   465,   467,   474,   481,   460,
      61,   477,   -43,   466,     4,   485,     5,   476,   486,    62,
       6,   487,   470,     7,   472,   380,   490,    63,    64,   496,
     506,   381,   382,   298,   483,   507,   508,   511,   383,    99,
     514,    44,   143,   376,   475,   228,   184,   510,   188,   198,
     173,   384,   385,   386,   387,     8,   364,   478,   479,   204,
     497,   468,   205,   268,   269,   270,   271,   272,   273,   274,
     275,     9,   276,   277,   278,   279,   280,   484,   289,   290,
     291,   292,   293,   294,   372,   498,   422,    10,   499,   300,
     500,   187,    75,   153,   299,    11,   388,   263,   342,   389,
     374,     0,     0,     0,   390,   391,   392,   393,   394,   395,
     396,   397,     0,     0,    76,    77,    78,    79,   512,    80,
       0,     0,    81,    82,    83,    84,     0,    85,     0,    76,
      77,    78,    79,   225,    80,     0,     0,   226,     0,     0,
       0,   281,    85,   282,   283,   284,     0,     0,     0,     0,
       0,   258,    76,    77,    78,    79,   150,    80,     0,     0,
      81,    82,    83,    84,   151,    85,    76,    77,    78,    79,
      37,    80,     0,     0,    81,    82,    83,    84,     0,    85,
      76,    77,    78,    79,     0,    80,     0,     0,    81,    82,
      83,    84,     0,    85,    76,    77,    78,    79,    52,    80,
       0,     0,   340,     0,     0,     0,    54,    85,    76,    77,
      78,    79,     0,    80,     0,     0,   480,    76,    77,    78,
      79,    85,    80,   118,   119,   120,   121,   122,   123,   124,
      85
};

static const short yycheck[] =
{
      31,    71,    95,   312,     4,   313,    50,     4,    11,     5,
       4,     4,   209,   109,    14,    71,     4,     4,    97,    71,
      28,    71,    99,    41,   103,    99,   220,   176,    71,   103,
     107,    75,    71,   107,    96,   111,   129,   113,     4,    71,
     102,   136,   138,    49,    50,    51,    52,    53,    66,    71,
     103,    10,   115,    12,    13,    14,    64,   101,    24,    25,
      19,    20,    21,   107,    99,   109,   118,    75,   118,    28,
      29,    65,   128,    32,    71,   118,    72,    77,    71,   118,
     111,    84,   177,    71,    71,    79,   118,    81,   132,   283,
      71,   288,   136,    99,   138,    92,   118,     4,   295,    71,
     408,   298,   299,    62,   412,   101,    65,    66,    20,    71,
     205,     7,     8,   109,   110,    74,   424,    29,   213,    78,
       0,    80,    72,     4,    76,   220,    49,    50,    51,    52,
      82,    83,   227,   177,   115,   284,    95,    96,    97,    98,
      99,   100,     4,   115,   103,    71,    10,   104,   107,   108,
     347,   101,    99,   115,   351,   111,    99,   113,   117,   109,
     110,   117,   103,   104,   105,   106,   210,   211,   212,   200,
     103,   266,    16,    17,    18,    99,    99,   485,   116,     4,
      92,     4,    94,   227,   114,    14,    94,    92,   283,   101,
     285,    55,    56,    57,    58,    59,    60,   109,   110,    73,
     244,   510,   246,   400,   114,   402,   104,    71,     4,    99,
     107,    14,    23,   117,     4,     4,    19,    92,    71,   114,
      99,   252,   253,   254,   268,   269,   270,   271,   272,   273,
     274,   275,   276,   277,   278,   279,   280,   332,    99,   283,
     389,    14,   115,     4,     4,    95,    96,    97,    98,    99,
     100,     4,   296,   103,   103,   404,   300,   301,   108,    62,
      63,   305,   116,     4,     4,    72,    95,    96,    97,    98,
      72,   100,   367,    99,   103,   104,   105,   106,   427,   108,
     429,    99,    99,   104,   328,   117,     4,     4,   332,   333,
     334,   335,    95,    96,    97,    98,    99,   100,    20,     4,
     103,   104,   105,   106,   107,   108,    71,    29,   117,   114,
      10,   117,    10,   406,   407,    99,   119,   120,   121,    99,
      99,    99,    95,    96,    97,    98,   117,   100,   423,   116,
     103,   104,   105,   106,    10,   108,   380,   381,   382,   383,
     384,   385,   386,   387,   388,    10,   390,   391,   392,   393,
     394,   395,   396,   397,    99,    71,   114,   114,     4,   403,
       6,    15,   114,     9,   114,     4,     4,   116,   463,   413,
      92,     4,    94,   417,    20,   117,    22,   116,   116,   101,
      26,   116,   426,    29,   428,    41,     4,   109,   110,     4,
       4,    47,    48,    10,   464,     4,     4,     4,    54,    66,
      99,    13,   114,   332,   448,   205,   174,   502,   180,   184,
     147,    67,    68,    69,    70,    61,   307,   461,   462,   195,
     485,   423,   196,    33,    34,    35,    36,    37,    38,    39,
      40,    77,    42,    43,    44,    45,    46,   466,    55,    56,
      57,    58,    59,    60,   328,   489,   367,    93,   492,   247,
     494,   177,    73,   132,    71,   101,   112,   227,   285,   115,
     329,    -1,    -1,    -1,   120,   121,   122,   123,   124,   125,
     126,   127,    -1,    -1,    95,    96,    97,    98,   509,   100,
      -1,    -1,   103,   104,   105,   106,    -1,   108,    -1,    95,
      96,    97,    98,    99,   100,    -1,    -1,   103,    -1,    -1,
      -1,   111,   108,   113,   114,   115,    -1,    -1,    -1,    -1,
      -1,   117,    95,    96,    97,    98,    99,   100,    -1,    -1,
     103,   104,   105,   106,   107,   108,    95,    96,    97,    98,
      99,   100,    -1,    -1,   103,   104,   105,   106,    -1,   108,
      95,    96,    97,    98,    -1,   100,    -1,    -1,   103,   104,
     105,   106,    -1,   108,    95,    96,    97,    98,    99,   100,
      -1,    -1,   103,    -1,    -1,    -1,   107,   108,    95,    96,
      97,    98,    -1,   100,    -1,    -1,   103,    95,    96,    97,
      98,   108,   100,    85,    86,    87,    88,    89,    90,    91,
     108
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     9,    20,    22,    26,    29,    61,    77,
      93,   101,   130,   131,   132,   133,   135,   136,   137,   146,
     149,   150,   157,   169,     7,     8,   134,   103,   115,    99,
     158,   138,    49,    50,    51,    52,    53,    99,   210,   211,
     170,   147,     4,     0,   132,     4,   104,     4,    71,   237,
     238,   151,    99,   103,   107,   232,   233,   210,    99,    99,
      29,    92,   101,   109,   110,   139,   141,   142,   148,   149,
     201,   202,   203,   103,   116,    73,    95,    96,    97,    98,
     100,   103,   104,   105,   106,   108,   228,   236,   239,   241,
     242,   243,     4,   159,    99,   114,   171,   140,     4,   142,
      94,    14,    77,   143,   144,   203,   236,    73,    71,   128,
       4,    24,    25,   152,   153,   154,   155,   156,    85,    86,
      87,    88,    89,    90,    91,   165,   177,   178,   179,   114,
     243,   177,   104,   236,   177,     4,   107,   236,   240,   241,
     210,    99,    23,   154,   117,     4,    71,   164,   243,     4,
      99,   107,   234,   235,   236,    92,   145,   228,   229,   230,
     231,   235,   241,    99,    99,    49,    50,    51,    52,    99,
     166,   167,   160,   179,   172,   114,   115,    71,     4,     4,
      71,   118,     4,   161,   161,   103,   237,   231,   167,     5,
     101,   109,   110,   162,   168,   198,   199,   200,   168,   116,
     163,     4,     4,    72,   200,   201,   204,    72,   210,    10,
      12,    13,    14,    19,    20,    21,    28,    29,    32,    62,
      65,    66,    74,    78,    80,    99,   103,   107,   139,   173,
     188,   190,   194,   206,   212,   213,   214,   215,   216,   218,
     226,   228,    99,   234,    14,   236,    14,   236,   236,   228,
      99,    99,   207,   208,   209,    97,   103,   244,   117,   218,
     228,   117,     4,   229,     4,     4,   117,   219,    33,    34,
      35,    36,    37,    38,    39,    40,    42,    43,    44,    45,
      46,   111,   113,   114,   115,   217,   186,   236,    10,    55,
      56,    57,    58,    59,    60,    71,   227,   236,    10,    71,
     227,    71,   210,   210,   210,   114,   195,   196,   174,   191,
     224,   225,   228,   117,   236,   236,   236,   236,   236,   236,
     236,   236,   236,   236,   236,   236,   236,    14,    19,    62,
      63,   103,   107,   119,   120,   121,   218,   228,   236,   237,
     103,   228,   233,    16,    17,    18,   187,    10,   234,   234,
     236,    10,   234,   234,   236,   236,    99,   205,    99,    99,
     236,   197,   221,   236,   197,   181,   192,    71,   118,   186,
     220,   221,   211,   236,   244,    99,   145,   236,   236,   236,
      41,    47,    48,    54,    67,    68,    69,    70,   112,   115,
     120,   121,   122,   123,   124,   125,   126,   127,   116,   234,
      10,   234,    10,    71,   115,    71,   114,   114,    71,   118,
     222,   118,    11,    84,   176,   182,     4,    65,    79,    81,
     189,   193,   224,   114,    71,   118,    71,   115,    71,   115,
     236,   236,   236,   236,   236,   236,   236,   236,   236,   237,
     236,   236,   236,   236,   236,   236,   236,   236,   114,   234,
     234,   236,   237,    99,   243,   243,   221,    15,   223,   221,
     236,    76,    82,    83,   180,     4,   236,     4,   216,   221,
     236,   237,   236,   237,   116,   236,   116,     4,   236,   236,
     103,   228,   175,   203,   222,   117,   116,   116,     4,    71,
       4,     4,    71,     4,    71,   183,     4,   220,   236,   236,
     236,    28,    64,    75,   184,   118,     4,     4,     4,   185,
     228,     4,   210,   186,    99
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
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
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
    { yyval.i = yyvsp[0].i; }
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
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
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
#line 416 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 419 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 420 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 17:
#line 423 "imcc/imcc.y"
    { IMCC_INFO(interp)->state->pragmas |= PR_FASTCALL; }
    break;

  case 18:
#line 425 "imcc/imcc.y"
    { if (yyvsp[0].s)
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 19:
#line 433 "imcc/imcc.y"
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
#line 445 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 21:
#line 451 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 22:
#line 459 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 23:
#line 460 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 24:
#line 464 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 25:
#line 465 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
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
    { yyval.i = 0; }
    break;

  case 31:
#line 476 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 32:
#line 477 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 34:
#line 481 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 35:
#line 483 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 36:
#line 486 "imcc/imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                     yyval.i = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, yyvsp[0].s));
                     cur_call->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 37:
#line 494 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 38:
#line 495 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 40:
#line 503 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 41:
#line 505 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 44:
#line 520 "imcc/imcc.y"
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

  case 45:
#line 536 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 46:
#line 543 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 48:
#line 552 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 563 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 54:
#line 568 "imcc/imcc.y"
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

  case 55:
#line 582 "imcc/imcc.y"
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

  case 56:
#line 598 "imcc/imcc.y"
    {
           cur_unit = (IMCC_INFO(interp)->state->pragmas & PR_FASTCALL ?
                  imc_open_unit(interp, IMC_FASTSUB)
                : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 57:
#line 604 "imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, yyvsp[0].sr);
        }
    break;

  case 58:
#line 607 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 59:
#line 609 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 60:
#line 613 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 61:
#line 614 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 62:
#line 615 "imcc/imcc.y"
    { add_pcc_param(cur_call, yyvsp[-1].sr);}
    break;

  case 63:
#line 619 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 64:
#line 620 "imcc/imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-2].t);
                                         is_def=0; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 65:
#line 625 "imcc/imcc.y"
    { yyval.t = 0;  }
    break;

  case 67:
#line 630 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 68:
#line 634 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 69:
#line 635 "imcc/imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); }
    break;

  case 70:
#line 636 "imcc/imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);}
    break;

  case 71:
#line 640 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 72:
#line 641 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 73:
#line 642 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 74:
#line 643 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 75:
#line 644 "imcc/imcc.y"
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

  case 78:
#line 662 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 79:
#line 664 "imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, yyvsp[0].s));

         }
    break;

  case 80:
#line 668 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 81:
#line 670 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 82:
#line 675 "imcc/imcc.y"
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

  case 83:
#line 702 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 84:
#line 706 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 85:
#line 707 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 86:
#line 711 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 87:
#line 713 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 88:
#line 717 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 90:
#line 722 "imcc/imcc.y"
    { yyval.t = yyvsp[0].t; }
    break;

  case 91:
#line 723 "imcc/imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; }
    break;

  case 92:
#line 727 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 93:
#line 728 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 94:
#line 729 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 95:
#line 730 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 96:
#line 731 "imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 97:
#line 732 "imcc/imcc.y"
    {  yyval.t = P_METHOD; }
    break;

  case 99:
#line 738 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 100:
#line 743 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 101:
#line 745 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-1].sr);
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 102:
#line 750 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 103:
#line 752 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 104:
#line 754 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 105:
#line 758 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 106:
#line 765 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 107:
#line 766 "imcc/imcc.y"
    {  add_pcc_arg(cur_call, yyvsp[-1].sr); }
    break;

  case 108:
#line 770 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 109:
#line 775 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 110:
#line 776 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(cur_call, yyvsp[-1].sr); }
    break;

  case 111:
#line 780 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 112:
#line 781 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 113:
#line 782 "imcc/imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 114:
#line 786 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 115:
#line 787 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 116:
#line 791 "imcc/imcc.y"
    {  yyval.t = VT_FLAT;   }
    break;

  case 117:
#line 792 "imcc/imcc.y"
    {  yyval.t = VT_OPTIONAL; }
    break;

  case 118:
#line 793 "imcc/imcc.y"
    {  yyval.t = VT_OPT_FLAG; }
    break;

  case 119:
#line 798 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 120:
#line 799 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 123:
#line 809 "imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 124:
#line 812 "imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 125:
#line 813 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 126:
#line 819 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 127:
#line 821 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 128:
#line 823 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 129:
#line 827 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 130:
#line 832 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 131:
#line 837 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 132:
#line 839 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 133:
#line 844 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 134:
#line 848 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 135:
#line 849 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 136:
#line 850 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 139:
#line 868 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 140:
#line 873 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 141:
#line 874 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 142:
#line 875 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 143:
#line 876 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 144:
#line 880 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 148:
#line 890 "imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 149:
#line 897 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 150:
#line 901 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 151:
#line 909 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 154:
#line 919 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 155:
#line 920 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 156:
#line 921 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 157:
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

  case 158:
#line 934 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 159:
#line 935 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 161:
#line 937 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 162:
#line 938 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 163:
#line 939 "imcc/imcc.y"
    { yyval.i = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 164:
#line 943 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 165:
#line 945 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 166:
#line 948 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 167:
#line 949 "imcc/imcc.y"
    {  yyval.i = 0; cur_call = NULL; }
    break;

  case 168:
#line 950 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 170:
#line 952 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 171:
#line 956 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 172:
#line 957 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 173:
#line 958 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 174:
#line 959 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 175:
#line 960 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 176:
#line 961 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 177:
#line 966 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 178:
#line 976 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 179:
#line 977 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 180:
#line 978 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 181:
#line 979 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 182:
#line 980 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 183:
#line 981 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 982 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 185:
#line 983 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 984 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 187:
#line 985 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 986 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 189:
#line 987 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 190:
#line 989 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 191:
#line 991 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 993 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 193:
#line 995 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 997 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 195:
#line 999 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 1001 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 1003 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 1005 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 1007 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 200:
#line 1009 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 1011 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 202:
#line 1013 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 203:
#line 1015 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 204:
#line 1017 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 1019 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 1021 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 207:
#line 1023 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 208:
#line 1026 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 209:
#line 1028 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 210:
#line 1032 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 211:
#line 1034 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 1036 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 213:
#line 1039 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            cur_call = NULL;
            yyval.i = 0;
         }
    break;

  case 214:
#line 1045 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 215:
#line 1049 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           cur_call = NULL;
         }
    break;

  case 218:
#line 1056 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[-2].sr); }
    break;

  case 219:
#line 1061 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 220:
#line 1063 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 221:
#line 1065 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 222:
#line 1067 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 223:
#line 1069 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 1071 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 1073 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 226:
#line 1075 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 227:
#line 1077 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 228:
#line 1079 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 229:
#line 1081 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 230:
#line 1083 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 231:
#line 1085 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 232:
#line 1090 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 233:
#line 1096 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 234:
#line 1097 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 235:
#line 1098 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 236:
#line 1103 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 237:
#line 1104 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 238:
#line 1105 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 239:
#line 1108 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 240:
#line 1109 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 241:
#line 1114 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 242:
#line 1119 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 243:
#line 1123 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 244:
#line 1124 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 245:
#line 1125 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 246:
#line 1129 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 247:
#line 1133 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 248:
#line 1134 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 249:
#line 1138 "imcc/imcc.y"
    {  yyval.t = VT_FLAT; }
    break;

  case 250:
#line 1141 "imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 251:
#line 1145 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 252:
#line 1146 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 253:
#line 1151 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 254:
#line 1153 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 255:
#line 1155 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 256:
#line 1157 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 257:
#line 1159 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 258:
#line 1161 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 259:
#line 1163 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 260:
#line 1165 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 261:
#line 1169 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 262:
#line 1170 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 263:
#line 1171 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 264:
#line 1172 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 265:
#line 1173 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 266:
#line 1174 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 269:
#line 1183 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 270:
#line 1184 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 271:
#line 1188 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 273:
#line 1193 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 274:
#line 1195 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 276:
#line 1203 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 277:
#line 1207 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 278:
#line 1208 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 279:
#line 1212 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 280:
#line 1213 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 285:
#line 1226 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 286:
#line 1227 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 287:
#line 1231 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 288:
#line 1233 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 289:
#line 1234 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 290:
#line 1235 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 291:
#line 1239 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 292:
#line 1245 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 293:
#line 1247 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 294:
#line 1248 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 295:
#line 1252 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 296:
#line 1253 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 297:
#line 1254 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 298:
#line 1255 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 299:
#line 1256 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 300:
#line 1260 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 301:
#line 1261 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 302:
#line 1262 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 303:
#line 1263 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 304:
#line 1267 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 305:
#line 1268 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3532 "imcc/imcparser.c"

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


#line 1273 "imcc/imcc.y"



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

