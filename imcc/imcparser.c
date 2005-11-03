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
     ADV_FLAT = 268,
     ADV_SLURPY = 269,
     ADV_OPTIONAL = 270,
     ADV_OPT_FLAG = 271,
     NEW = 272,
     NAMESPACE = 273,
     ENDNAMESPACE = 274,
     CLASS = 275,
     ENDCLASS = 276,
     FIELD = 277,
     DOT_METHOD = 278,
     SUB = 279,
     SYM = 280,
     LOCAL = 281,
     CONST = 282,
     INC = 283,
     DEC = 284,
     GLOBAL_CONST = 285,
     PLUS_ASSIGN = 286,
     MINUS_ASSIGN = 287,
     MUL_ASSIGN = 288,
     DIV_ASSIGN = 289,
     CONCAT_ASSIGN = 290,
     BAND_ASSIGN = 291,
     BOR_ASSIGN = 292,
     BXOR_ASSIGN = 293,
     FDIV = 294,
     FDIV_ASSIGN = 295,
     MOD_ASSIGN = 296,
     SHR_ASSIGN = 297,
     SHL_ASSIGN = 298,
     SHR_U_ASSIGN = 299,
     SHIFT_LEFT = 300,
     SHIFT_RIGHT = 301,
     INTV = 302,
     FLOATV = 303,
     STRINGV = 304,
     PMCV = 305,
     OBJECTV = 306,
     LOG_XOR = 307,
     RELOP_EQ = 308,
     RELOP_NE = 309,
     RELOP_GT = 310,
     RELOP_GTE = 311,
     RELOP_LT = 312,
     RELOP_LTE = 313,
     GLOBAL = 314,
     GLOBALOP = 315,
     ADDR = 316,
     RESULT = 317,
     RETURN = 318,
     YIELDT = 319,
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
#define FASTCALL 261
#define N_OPERATORS 262
#define HLL 263
#define GOTO 264
#define ARG 265
#define IF 266
#define UNLESS 267
#define ADV_FLAT 268
#define ADV_SLURPY 269
#define ADV_OPTIONAL 270
#define ADV_OPT_FLAG 271
#define NEW 272
#define NAMESPACE 273
#define ENDNAMESPACE 274
#define CLASS 275
#define ENDCLASS 276
#define FIELD 277
#define DOT_METHOD 278
#define SUB 279
#define SYM 280
#define LOCAL 281
#define CONST 282
#define INC 283
#define DEC 284
#define GLOBAL_CONST 285
#define PLUS_ASSIGN 286
#define MINUS_ASSIGN 287
#define MUL_ASSIGN 288
#define DIV_ASSIGN 289
#define CONCAT_ASSIGN 290
#define BAND_ASSIGN 291
#define BOR_ASSIGN 292
#define BXOR_ASSIGN 293
#define FDIV 294
#define FDIV_ASSIGN 295
#define MOD_ASSIGN 296
#define SHR_ASSIGN 297
#define SHL_ASSIGN 298
#define SHR_U_ASSIGN 299
#define SHIFT_LEFT 300
#define SHIFT_RIGHT 301
#define INTV 302
#define FLOATV 303
#define STRINGV 304
#define PMCV 305
#define OBJECTV 306
#define LOG_XOR 307
#define RELOP_EQ 308
#define RELOP_NE 309
#define RELOP_GT 310
#define RELOP_GTE 311
#define RELOP_LT 312
#define RELOP_LTE 313
#define GLOBAL 314
#define GLOBALOP 315
#define ADDR 316
#define RESULT 317
#define RETURN 318
#define YIELDT 319
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
#line 620 "imcc/imcparser.c"
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
#line 641 "imcc/imcparser.c"

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
#define YYLAST   535

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  128
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  116
/* YYNRULES -- Number of rules. */
#define YYNRULES  300
/* YYNRULES -- Number of states. */
#define YYNSTATES  502

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
     444,   445,   452,   455,   458,   461,   463,   465,   467,   468,
     470,   472,   474,   476,   478,   480,   482,   486,   491,   496,
     501,   507,   513,   519,   525,   531,   537,   543,   549,   555,
     561,   567,   573,   579,   585,   591,   597,   603,   610,   617,
     624,   632,   637,   642,   649,   657,   662,   667,   672,   677,
     684,   692,   696,   697,   707,   709,   711,   715,   719,   723,
     727,   731,   735,   739,   743,   747,   751,   755,   759,   763,
     768,   770,   772,   774,   778,   782,   786,   788,   790,   791,
     797,   798,   802,   804,   807,   808,   811,   813,   816,   820,
     822,   829,   836,   841,   846,   851,   856,   858,   860,   862,
     864,   866,   868,   870,   872,   873,   875,   879,   881,   883,
     888,   890,   892,   894,   896,   898,   900,   902,   904,   906,
     908,   909,   912,   914,   918,   919,   924,   926,   930,   933,
     936,   938,   940,   942,   944,   946,   948,   950,   952,   954,
     956
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     129,     0,    -1,   130,    -1,   131,    -1,   130,   131,    -1,
     149,    -1,   148,    -1,   136,    -1,   135,    -1,   156,    -1,
     168,    -1,   145,    -1,   100,     4,    -1,   132,    -1,     4,
      -1,     6,   133,     4,    -1,   134,     4,    -1,     7,    -1,
       8,   103,    -1,     9,   102,    70,   102,    -1,    60,   209,
      98,    -1,    60,   209,    98,   113,   242,    -1,    -1,    28,
     137,   209,    98,   113,   242,    -1,    -1,    28,   139,   103,
     234,   113,   102,    -1,   141,    -1,   140,   141,    -1,   200,
     142,     4,    -1,   100,     4,    -1,   109,    -1,   108,    -1,
     148,    -1,   138,    -1,    -1,   143,   106,   144,    -1,    76,
     176,    91,    -1,    -1,   228,    -1,    -1,    92,   146,   147,
      93,    -1,    -1,   140,    -1,    19,   114,   236,   115,    -1,
      -1,    21,    98,   150,     4,   151,    22,    -1,   152,    -1,
      -1,   153,    -1,   152,   153,    -1,   154,    -1,   155,    -1,
       4,    -1,    23,   209,    98,     4,    -1,    24,    98,    98,
       4,    -1,    -1,    -1,    -1,    25,   157,   231,   158,   176,
       4,   159,   160,   167,    71,    -1,    -1,     4,    -1,   160,
     161,     4,    -1,    -1,     5,   162,   209,    98,   185,    -1,
      -1,    70,    -1,    90,   116,   165,   117,    -1,    -1,   165,
      70,   166,    -1,   166,    -1,    48,    -1,    49,    -1,    51,
      -1,    50,    -1,    98,    -1,    -1,   197,    -1,    -1,    -1,
      -1,    76,   169,    98,   170,   176,     4,   171,   160,   167,
      71,    -1,    -1,    73,     4,   173,   180,   175,   179,   174,
     182,    74,    -1,    -1,   202,     4,    -1,    -1,    83,   235,
       4,    -1,    -1,   177,    -1,   178,    -1,   177,   163,   178,
      -1,    85,    -1,    84,    -1,    86,    -1,    87,    -1,    89,
      -1,    88,    -1,   164,    -1,    75,   235,    70,   235,     4,
      -1,    75,   235,     4,    -1,    81,   235,     4,    -1,    82,
     227,     4,    -1,    82,   102,     4,    -1,    82,   227,    70,
     235,     4,    -1,    82,   102,    70,   235,     4,    -1,    -1,
     180,   181,     4,    -1,    11,   220,    -1,    -1,   182,   183,
       4,    -1,    63,   227,   185,    -1,    -1,    27,   184,   209,
      98,    -1,    -1,   185,   186,    -1,    15,    -1,    16,    -1,
      17,    -1,    77,    -1,    79,    -1,    78,    -1,    80,    -1,
      -1,   187,     4,   190,   191,   188,    -1,   193,    -1,    -1,
     191,     4,    -1,   191,   192,     4,    -1,    64,   235,   221,
      -1,    -1,    64,   116,   194,   196,   117,    -1,    -1,    65,
     116,   195,   196,   117,    -1,    -1,   220,    -1,   196,    70,
     220,    -1,   199,    -1,   197,   199,    -1,    -1,   198,   203,
      -1,   100,     4,    -1,   109,    -1,   108,    -1,    -1,   201,
      -1,   201,   202,    -1,   202,    -1,    91,    -1,   200,   205,
       4,    -1,    98,    -1,   204,    70,    98,    -1,   211,    -1,
     225,    -1,    19,    98,    -1,    20,    98,    -1,    -1,    27,
     206,   209,   204,    -1,    -1,    28,   207,   209,    98,   113,
     242,    -1,   138,    -1,    -1,    31,   208,   209,    98,   113,
     242,    -1,    64,   217,    -1,    10,   233,    -1,   106,   228,
      -1,   217,    -1,   172,    -1,   189,    -1,    -1,    48,    -1,
      49,    -1,    50,    -1,    51,    -1,    52,    -1,   210,    -1,
      98,    -1,   227,   113,   235,    -1,   227,   113,   118,   235,
      -1,   227,   113,   119,   235,    -1,   227,   113,   120,   235,
      -1,   227,   113,   235,   121,   235,    -1,   227,   113,   235,
     119,   235,    -1,   227,   113,   235,   122,   235,    -1,   227,
     113,   235,    66,   235,    -1,   227,   113,   235,   123,   235,
      -1,   227,   113,   235,    40,   235,    -1,   227,   113,   235,
     124,   235,    -1,   227,   113,   235,   111,   235,    -1,   227,
     113,   235,    46,   235,    -1,   227,   113,   235,    47,   235,
      -1,   227,   113,   235,    67,   235,    -1,   227,   113,   235,
      68,   235,    -1,   227,   113,   235,    69,   235,    -1,   227,
     113,   235,    53,   235,    -1,   227,   113,   235,   125,   235,
      -1,   227,   113,   235,   126,   235,    -1,   227,   113,   235,
     120,   235,    -1,   227,   113,   235,   114,   236,   115,    -1,
     227,   114,   236,   115,   113,   235,    -1,   227,   113,    18,
     210,    70,   235,    -1,   227,   113,    18,   210,   114,   236,
     115,    -1,   227,   113,    18,   210,    -1,   227,   113,    18,
     235,    -1,   227,   113,    18,   235,    70,   235,    -1,   227,
     113,    18,   235,   114,   236,   115,    -1,   227,   113,    62,
      98,    -1,   227,   113,    61,   243,    -1,    61,   243,   113,
     235,    -1,    18,   227,    70,   235,    -1,    18,   227,    70,
     235,    70,   235,    -1,    18,   227,    70,   235,   114,   236,
     115,    -1,   227,   113,   217,    -1,    -1,   212,   116,   224,
     117,   113,   215,   116,   219,   117,    -1,   213,    -1,   214,
      -1,   227,    32,   235,    -1,   227,    33,   235,    -1,   227,
      34,   235,    -1,   227,    35,   235,    -1,   227,    42,   235,
      -1,   227,    41,   235,    -1,   227,    36,   235,    -1,   227,
      37,   235,    -1,   227,    38,   235,    -1,   227,    39,   235,
      -1,   227,    43,   235,    -1,   227,    44,   235,    -1,   227,
      45,   235,    -1,   227,   113,   106,   144,    -1,    98,    -1,
     102,    -1,   227,    -1,   227,   216,   232,    -1,   227,   216,
     102,    -1,   227,   216,   227,    -1,   112,    -1,   110,    -1,
      -1,   215,   218,   116,   219,   117,    -1,    -1,   219,    70,
     220,    -1,   220,    -1,   235,   221,    -1,    -1,   221,   222,
      -1,    14,    -1,   227,   185,    -1,   224,    70,   223,    -1,
     223,    -1,    12,   235,   226,   235,    10,   233,    -1,    13,
     235,   226,   235,    10,   233,    -1,    12,   235,    10,   233,
      -1,    13,   235,    10,   233,    -1,    12,   235,    70,   233,
      -1,    13,   235,    70,   233,    -1,    54,    -1,    55,    -1,
      56,    -1,    57,    -1,    58,    -1,    59,    -1,   107,    -1,
     241,    -1,    -1,   229,    -1,   229,    70,   230,    -1,   230,
      -1,   234,    -1,   227,   114,   236,   115,    -1,   232,    -1,
     102,    -1,    98,    -1,   106,    -1,    98,    -1,   106,    -1,
     233,    -1,   235,    -1,   227,    -1,   242,    -1,    -1,   237,
     238,    -1,   240,    -1,   238,   127,   240,    -1,    -1,   238,
      70,   239,   240,    -1,   235,    -1,   235,    72,   235,    -1,
      72,   235,    -1,   235,    72,    -1,    94,    -1,    95,    -1,
      96,    -1,    97,    -1,    99,    -1,   103,    -1,   104,    -1,
     102,    -1,   105,    -1,    96,    -1,   102,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   398,   398,   402,   404,   407,   409,   410,   411,   412,
     413,   414,   415,   416,   417,   420,   421,   424,   425,   433,
     444,   451,   460,   459,   465,   464,   468,   470,   473,   475,
     476,   477,   478,   479,   482,   482,   486,   494,   497,   502,
     501,   512,   514,   517,   535,   533,   549,   551,   554,   556,
     559,   561,   562,   565,   579,   597,   603,   606,   595,   611,
     613,   614,   618,   617,   623,   625,   629,   632,   634,   635,
     638,   640,   641,   642,   643,   655,   657,   661,   663,   667,
     660,   674,   672,   704,   706,   709,   711,   715,   717,   720,
     722,   725,   727,   728,   729,   730,   731,   732,   735,   741,
     743,   748,   750,   752,   756,   763,   765,   768,   773,   775,
     778,   780,   780,   784,   786,   789,   791,   792,   796,   798,
     801,   803,   808,   806,   812,   817,   819,   821,   825,   831,
     829,   838,   837,   846,   848,   849,   853,   855,   866,   870,
     873,   874,   875,   878,   880,   883,   885,   888,   894,   899,
     907,   915,   917,   918,   919,   920,   920,   933,   933,   935,
     936,   936,   938,   942,   943,   946,   947,   948,   949,   952,
     954,   955,   956,   957,   958,   961,   972,   974,   975,   976,
     977,   978,   979,   980,   981,   982,   983,   984,   985,   987,
     989,   991,   993,   995,   997,   999,  1001,  1003,  1005,  1007,
    1009,  1011,  1013,  1015,  1017,  1019,  1022,  1024,  1028,  1030,
    1032,  1035,  1042,  1041,  1050,  1051,  1054,  1057,  1059,  1061,
    1063,  1065,  1067,  1069,  1071,  1073,  1075,  1077,  1079,  1083,
    1091,  1092,  1093,  1098,  1099,  1100,  1103,  1104,  1109,  1107,
    1117,  1119,  1120,  1123,  1127,  1129,  1132,  1136,  1139,  1141,
    1144,  1147,  1149,  1151,  1153,  1155,  1159,  1161,  1162,  1163,
    1164,  1165,  1168,  1170,  1173,  1175,  1178,  1180,  1183,  1185,
    1192,  1194,  1197,  1199,  1202,  1204,  1207,  1209,  1212,  1214,
    1217,  1217,  1221,  1223,  1225,  1225,  1229,  1235,  1238,  1239,
    1242,  1244,  1245,  1246,  1247,  1250,  1252,  1253,  1254,  1257,
    1259
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "PRAGMA", 
  "FASTCALL", "N_OPERATORS", "HLL", "GOTO", "ARG", "IF", "UNLESS", 
  "ADV_FLAT", "ADV_SLURPY", "ADV_OPTIONAL", "ADV_OPT_FLAG", "NEW", 
  "NAMESPACE", "ENDNAMESPACE", "CLASS", "ENDCLASS", "FIELD", "DOT_METHOD", 
  "SUB", "SYM", "LOCAL", "CONST", "INC", "DEC", "GLOBAL_CONST", 
  "PLUS_ASSIGN", "MINUS_ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", 
  "CONCAT_ASSIGN", "BAND_ASSIGN", "BOR_ASSIGN", "BXOR_ASSIGN", "FDIV", 
  "FDIV_ASSIGN", "MOD_ASSIGN", "SHR_ASSIGN", "SHL_ASSIGN", "SHR_U_ASSIGN", 
  "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV", 
  "OBJECTV", "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", 
  "RELOP_LT", "RELOP_LTE", "GLOBAL", "GLOBALOP", "ADDR", "RESULT", 
  "RETURN", "YIELDT", "POW", "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", 
  "COMMA", "ESUB", "DOTDOT", "PCC_BEGIN", "PCC_END", "PCC_CALL", 
  "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD", 
  "PCC_END_YIELD", "NCI_CALL", "METH_CALL", "INVOCANT", "MAIN", "LOAD", 
  "IMMEDIATE", "POSTCOMP", "METHOD", "ANON", "MULTI", "LABEL", "EMIT", 
  "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "REG", "MACRO", 
  "ENDM", "STRINGC", "INTC", "FLOATC", "USTRINGC", "PARROT_OP", "VAR", 
  "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", "POINTY", "'='", "'['", 
  "']'", "'('", "')'", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", 
  "'&'", "'|'", "';'", "$accept", "program", "compilation_units", 
  "compilation_unit", "pragma", "pragma_1", "hll_def", "global", 
  "constdef", "@1", "pmc_const", "@2", "pasmcode", "pasmline", 
  "pasm_inst", "@3", "pasm_args", "emit", "@4", "opt_pasmcode", 
  "class_namespace", "class", "@5", "class_body", "member_decls", 
  "member_decl", "field_decl", "method_decl", "sub", "@6", "@7", "@8", 
  "sub_params", "sub_param", "@9", "opt_comma", "multi", "multi_types", 
  "multi_type", "sub_body", "pcc_sub", "@10", "@11", "@12", 
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
     364,   365,   366,    61,    91,    93,    40,    41,    33,    45,
     126,    43,    42,    47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   128,   129,   130,   130,   131,   131,   131,   131,   131,
     131,   131,   131,   131,   131,   132,   132,   133,   133,   134,
     135,   135,   137,   136,   139,   138,   140,   140,   141,   141,
     141,   141,   141,   141,   143,   142,   142,   142,   144,   146,
     145,   147,   147,   148,   150,   149,   151,   151,   152,   152,
     153,   153,   153,   154,   155,   157,   158,   159,   156,   160,
     160,   160,   162,   161,   163,   163,   164,   165,   165,   165,
     166,   166,   166,   166,   166,   167,   167,   169,   170,   171,
     168,   173,   172,   174,   174,   175,   175,   176,   176,   177,
     177,   178,   178,   178,   178,   178,   178,   178,   179,   179,
     179,   179,   179,   179,   179,   180,   180,   181,   182,   182,
     183,   184,   183,   185,   185,   186,   186,   186,   187,   187,
     188,   188,   190,   189,   189,   191,   191,   191,   192,   194,
     193,   195,   193,   196,   196,   196,   197,   197,   198,   199,
     199,   199,   199,   200,   200,   201,   201,   202,   203,   204,
     204,   205,   205,   205,   205,   206,   205,   207,   205,   205,
     208,   205,   205,   205,   205,   205,   205,   205,   205,   209,
     209,   209,   209,   209,   209,   210,   211,   211,   211,   211,
     211,   211,   211,   211,   211,   211,   211,   211,   211,   211,
     211,   211,   211,   211,   211,   211,   211,   211,   211,   211,
     211,   211,   211,   211,   211,   211,   211,   211,   211,   211,
     211,   211,   212,   211,   211,   211,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   214,
     215,   215,   215,   215,   215,   215,   216,   216,   218,   217,
     219,   219,   219,   220,   221,   221,   222,   223,   224,   224,
     225,   225,   225,   225,   225,   225,   226,   226,   226,   226,
     226,   226,   227,   227,   228,   228,   229,   229,   230,   230,
     231,   231,   232,   232,   233,   233,   234,   234,   235,   235,
     237,   236,   238,   238,   239,   238,   240,   240,   240,   240,
     241,   241,   241,   241,   241,   242,   242,   242,   242,   243,
     243
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
       0,     6,     2,     2,     2,     1,     1,     1,     0,     1,
       1,     1,     1,     1,     1,     1,     3,     4,     4,     4,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     6,     6,     6,
       7,     4,     4,     6,     7,     4,     4,     4,     4,     6,
       7,     3,     0,     9,     1,     1,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     4,
       1,     1,     1,     3,     3,     3,     1,     1,     0,     5,
       0,     3,     1,     2,     0,     2,     1,     2,     3,     1,
       6,     6,     4,     4,     4,     4,     1,     1,     1,     1,
       1,     1,     1,     1,     0,     1,     3,     1,     1,     4,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       0,     2,     1,     3,     0,     4,     1,     3,     2,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    14,     0,     0,     0,     0,    55,    22,     0,    77,
      39,     0,     0,     2,     3,    13,     0,     8,     7,    11,
       6,     5,     9,    10,    17,     0,     0,     0,   280,    44,
       0,     0,   169,   170,   171,   172,   173,   175,     0,   174,
       0,   143,    12,     1,     4,    16,    18,    15,     0,     0,
       0,     0,   272,   271,   273,    56,   270,     0,    20,    78,
      24,   147,     0,    31,    30,    33,   143,    26,     0,    32,
      34,   144,   146,    19,    43,     0,   290,   291,   292,   293,
     294,   297,   295,   296,   298,   262,   278,   286,   281,   282,
     263,   279,    47,    87,     0,     0,    87,     0,    29,    27,
      40,    87,     0,     0,   145,   288,   289,   284,     0,    52,
       0,     0,     0,    46,    48,    50,    51,    92,    91,    93,
      94,    96,    95,     0,    97,     0,    64,    89,     0,    21,
       0,     0,     0,    28,   264,   287,     0,   283,     0,     0,
      45,    49,    67,    57,    65,     0,    23,    79,   274,   275,
     276,     0,   277,    36,    35,   278,    38,   265,   267,   268,
     285,     0,     0,    70,    71,    73,    72,    74,     0,    69,
      59,    90,    59,     0,   280,     0,    53,    54,     0,    66,
      60,   138,   138,    25,     0,   266,    68,    62,     0,   142,
     141,     0,     0,   138,   143,   136,     0,   269,     0,   140,
      61,    58,   137,   168,   139,    80,     0,     0,     0,     0,
       0,     0,     0,   155,   157,   160,     0,     0,     0,     0,
     118,   119,   230,   231,   264,   159,   166,     0,   167,   124,
       0,   151,     0,   214,   215,   238,   165,   152,   232,   113,
     163,     0,     0,     0,   153,   154,     0,     0,     0,   299,
     300,     0,   129,   162,   232,   131,    81,   164,   122,   148,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   237,   236,     0,   280,     0,
      63,     0,   256,   257,   258,   259,   260,   261,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   133,   133,
     105,   125,   249,     0,   113,   240,   216,   217,   218,   219,
     222,   223,   224,   225,   221,   220,   226,   227,   228,     0,
       0,     0,   297,   264,     0,     0,     0,   211,   278,   176,
       0,   234,   235,   233,   115,   116,   117,   114,   252,   254,
       0,   253,   255,     0,   208,   149,   156,     0,     0,   207,
       0,   134,   244,     0,    85,     0,     0,     0,   247,     0,
     242,   201,   202,   206,   205,   229,   177,   178,   179,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   280,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   280,     0,     0,     0,     0,   130,   243,   132,     0,
       0,     0,     0,   126,     0,   120,   121,   123,     0,   248,
       0,     0,   239,     0,   280,     0,   280,   185,   188,   189,
     193,   183,   190,   191,   192,   187,     0,   181,   196,   180,
     182,   184,   186,   194,   195,     0,   250,   251,   209,     0,
     150,   158,   161,   135,   246,   245,   107,     0,     0,     0,
       0,    83,   106,   244,   127,     0,   241,   199,     0,   203,
       0,   197,   198,   210,    86,     0,     0,     0,     0,   108,
       0,   128,   240,   200,   204,    99,     0,   100,   102,     0,
     101,     0,     0,    84,     0,     0,     0,     0,   111,     0,
      82,     0,   213,    98,   104,   103,     0,   113,   109,     0,
     110,   112
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    12,    13,    14,    15,    26,    16,    17,    18,    31,
      65,    97,    66,    67,   102,   103,   154,    19,    41,    68,
      20,    21,    51,   112,   113,   114,   115,   116,    22,    30,
      93,   170,   181,   191,   198,   145,   124,   168,   169,   192,
      23,    40,    96,   172,   226,   300,   469,   401,   125,   126,
     127,   451,   354,   402,   482,   491,   496,   280,   337,   227,
     407,   228,   301,   355,   408,   229,   298,   299,   350,   193,
     194,   195,    70,    71,    72,   204,   346,   230,   246,   247,
     248,    38,    39,   231,   232,   233,   234,   235,   279,   236,
     261,   359,   351,   397,   445,   302,   303,   237,   289,    86,
     156,   157,   158,    55,    56,   150,   159,   352,    49,    50,
      88,   136,    89,    90,    91,   251
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -302
static const short yypact[] =
{
      20,  -302,   150,   -88,   -64,   -62,  -302,  -302,     6,  -302,
    -302,    40,   119,    20,  -302,  -302,   123,  -302,  -302,  -302,
    -302,  -302,  -302,  -302,  -302,    27,   158,    53,  -302,  -302,
     -81,     6,  -302,  -302,  -302,  -302,  -302,  -302,    78,  -302,
      83,    33,  -302,  -302,  -302,  -302,  -302,  -302,    88,    74,
     304,   189,  -302,  -302,  -302,  -302,  -302,   111,    97,  -302,
    -302,  -302,   210,  -302,  -302,  -302,    86,  -302,   139,  -302,
       1,   153,  -302,  -302,  -302,   428,  -302,  -302,  -302,  -302,
    -302,  -302,  -302,  -302,  -302,  -302,  -302,   178,   -52,  -302,
    -302,  -302,    23,   328,   141,   163,   328,   149,  -302,  -302,
    -302,   328,   257,   156,  -302,  -302,   428,  -302,   304,  -302,
       6,   165,   247,    23,  -302,  -302,  -302,  -302,  -302,  -302,
    -302,  -302,  -302,   157,  -302,   270,     4,  -302,   163,  -302,
     272,   380,   186,  -302,   380,  -302,   304,  -302,   180,   193,
    -302,  -302,    17,  -302,  -302,   328,  -302,  -302,  -302,  -302,
    -302,   184,  -302,  -302,  -302,   185,  -302,   228,  -302,  -302,
    -302,   305,   307,  -302,  -302,  -302,  -302,  -302,   -48,  -302,
     308,  -302,   308,   206,  -302,   380,  -302,  -302,    17,  -302,
    -302,    -1,    -1,  -302,   198,  -302,  -302,  -302,   310,  -302,
    -302,   312,   246,    98,   153,  -302,   248,  -302,     6,  -302,
    -302,  -302,  -302,   365,  -302,  -302,   222,   -78,   428,   428,
     255,   223,   224,  -302,   231,  -302,   -59,   208,   207,   339,
    -302,  -302,  -302,  -302,   380,  -302,  -302,   340,  -302,  -302,
     341,  -302,   232,  -302,  -302,  -302,  -302,  -302,   251,  -302,
    -302,    96,   201,   277,  -302,  -302,     6,     6,     6,  -302,
    -302,   240,  -302,  -302,    87,  -302,  -302,  -302,  -302,  -302,
     255,   239,   428,   428,   428,   428,   428,   428,   428,   428,
     428,   428,   428,   428,   428,  -302,  -302,    41,  -302,   106,
     220,   -78,  -302,  -302,  -302,  -302,  -302,  -302,   -78,   428,
     -78,   -78,   428,   428,   259,   261,   268,   428,   428,   428,
    -302,  -302,  -302,   -19,  -302,   428,  -302,  -302,  -302,  -302,
    -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,   414,
     -59,   269,   252,   380,   428,   428,   428,  -302,    72,   381,
     258,  -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,
     360,  -302,  -302,   362,   -38,  -302,   309,   267,   273,  -302,
     -17,  -302,  -302,    -7,    -2,     8,   255,   274,   220,    39,
    -302,   -36,     3,  -302,  -302,  -302,  -302,  -302,  -302,   428,
     428,   428,   428,   428,   428,   428,   428,   428,  -302,   428,
     428,   428,   428,   428,   428,   428,   428,   275,   -78,   -78,
     428,  -302,   276,   163,   163,   428,  -302,   368,  -302,   428,
     428,    47,   385,  -302,   428,  -302,  -302,  -302,   386,  -302,
     144,   428,  -302,   428,  -302,   428,  -302,  -302,  -302,  -302,
    -302,  -302,  -302,  -302,  -302,  -302,   279,  -302,  -302,  -302,
    -302,  -302,  -302,  -302,  -302,   428,  -302,  -302,  -302,   280,
    -302,  -302,  -302,  -302,  -302,  -302,  -302,   398,   428,   428,
      76,   153,  -302,  -302,  -302,   294,  -302,  -302,   316,  -302,
     318,  -302,  -302,  -302,  -302,    12,   415,    15,    19,  -302,
     416,   368,   428,  -302,  -302,  -302,   428,  -302,  -302,   428,
    -302,   428,   -14,  -302,    46,   418,   419,   420,  -302,   255,
    -302,   421,  -302,  -302,  -302,  -302,     6,  -302,  -302,   338,
     220,  -302
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -302,  -302,  -302,   426,  -302,  -302,  -302,  -302,  -302,  -302,
     237,  -302,  -302,   375,  -302,  -302,   120,  -302,  -302,  -302,
     -26,  -302,  -302,  -302,  -302,   332,  -302,  -302,  -302,  -302,
    -302,  -302,   281,  -302,  -302,  -302,  -302,  -302,   278,   264,
    -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,   -63,  -302,
     306,  -302,  -302,  -302,  -302,  -302,  -302,  -301,  -302,  -302,
    -302,  -302,  -302,  -302,  -302,  -302,  -302,  -302,   155,  -302,
    -302,   262,   263,  -302,   -70,  -302,  -302,  -302,  -302,  -302,
    -302,   -31,   133,  -302,  -302,  -302,  -302,    48,  -302,  -206,
    -302,    -6,  -298,    16,  -302,   112,  -302,  -302,   238,   -92,
     249,  -302,   295,  -302,   209,  -197,   358,   -44,  -144,  -302,
    -302,  -302,    13,  -302,   -93,   170
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -233
static const short yytable[] =
{
      57,   104,   129,   358,   187,   -37,    87,   360,   -88,   399,
     240,   253,   403,   488,    27,    69,   475,    52,   107,   478,
     148,    53,   178,   480,     1,    54,     2,   109,   149,     3,
     184,   105,   390,   130,   413,   146,    29,   249,   132,     4,
      69,     5,   155,   250,    42,     6,   110,   111,     7,   489,
      28,   356,     4,   395,    32,    33,    34,    35,    36,   319,
     490,    60,   135,   395,    87,   163,   164,   165,   166,   179,
     -75,   327,   404,   415,   144,   108,   391,   101,   414,   138,
       8,   400,   476,   155,   338,   479,   405,   152,   406,   481,
     152,   339,    87,   341,   342,   -88,     9,   443,   357,   188,
     396,   446,   320,   321,    37,     4,   281,   189,   190,   411,
     398,   238,    10,   456,    60,   167,   411,   416,   243,    43,
      11,   137,   448,    48,    61,   254,   -41,    45,   449,   450,
      46,   152,   155,    62,   330,    76,    77,    78,    79,   222,
      80,    63,    64,   322,    82,    83,    84,   323,    85,   160,
     282,   283,   284,   285,   286,   287,   412,    24,    25,   324,
     325,   326,    47,   492,   241,   242,   288,   206,   304,   -76,
      76,    77,    78,    79,   360,    80,    58,    61,   467,   -42,
     152,    59,   275,    85,   276,   328,    62,   332,  -232,    74,
      73,   436,   437,    92,    63,    64,   500,   275,   188,   276,
      76,    77,    78,    79,    52,    80,   189,   190,   331,    94,
      95,   290,    54,    85,    98,   294,   295,   296,   306,   307,
     308,   309,   310,   311,   312,   313,   314,   315,   316,   317,
     318,   155,   100,   329,   426,   334,   335,   336,    76,    77,
      78,    79,   222,    80,    61,   340,   223,   439,   343,   344,
     106,    85,   131,   349,   128,   282,   283,   284,   285,   286,
     287,   133,   134,   139,   304,    81,    82,    83,    84,   140,
     458,   291,   460,   142,   143,   362,   147,   153,   161,   152,
     366,   367,   368,   262,   263,   264,   265,   266,   267,   268,
     269,   162,   270,   271,   272,   273,   274,   173,   175,   174,
     441,   442,    76,    77,    78,    79,   222,    80,   183,   176,
     223,   177,   180,   197,   199,    85,   200,   201,   254,   205,
     239,   244,   245,   255,   252,   417,   418,   419,   420,   421,
     422,   423,   424,   425,   -24,   427,   428,   429,   430,   431,
     432,   433,   434,   256,   258,   259,   438,   293,   260,    76,
      77,    78,    79,   297,    80,   305,   447,   345,   468,   347,
     453,   275,    85,   276,   277,   278,   348,   364,  -231,   457,
     388,   459,   389,   387,   440,   207,    75,   208,   209,   392,
     393,   470,   444,   210,   211,   212,   394,   410,   435,   452,
     454,   462,   213,   214,   461,   463,   215,   497,    76,    77,
      78,    79,   464,    80,   465,   466,    81,    82,    83,    84,
     472,    85,   117,   118,   119,   120,   121,   122,   123,   477,
     483,   369,   493,   494,   495,   498,   216,   370,   371,   217,
     218,   473,   485,   474,   372,   486,   501,   487,   219,    44,
     225,    99,   220,   365,   221,   141,   196,   373,   374,   375,
     376,   171,   361,   182,   353,   202,   186,   203,   455,    76,
      77,    78,    79,   222,    80,   499,   484,   223,   409,   471,
     185,   224,    85,   257,    76,    77,    78,    79,   148,    80,
     292,  -212,    81,    82,    83,    84,   149,    85,   333,   151,
     363,     0,   377,     0,     0,   378,     0,     0,     0,     0,
     379,   380,   381,   382,   383,   384,   385,   386,    76,    77,
      78,    79,    37,    80,     0,     0,    81,    82,    83,    84,
       0,    85,    76,    77,    78,    79,     0,    80,     0,     0,
      81,    82,    83,    84,     0,    85
};

static const short yycheck[] =
{
      31,    71,    95,   304,     5,     4,    50,   305,     4,    11,
     207,   217,     4,    27,   102,    41,     4,    98,    70,     4,
      98,   102,    70,     4,     4,   106,     6,     4,   106,     9,
     174,    75,    70,    96,    70,   128,    98,    96,   101,    19,
      66,    21,   134,   102,     4,    25,    23,    24,    28,    63,
     114,    70,    19,    70,    48,    49,    50,    51,    52,    18,
      74,    28,   106,    70,   108,    48,    49,    50,    51,   117,
      71,   277,    64,    70,    70,   127,   114,    76,   114,   110,
      60,    83,    70,   175,   281,    70,    78,   131,    80,    70,
     134,   288,   136,   290,   291,    91,    76,   395,   117,   100,
     117,   399,    61,    62,    98,    19,    10,   108,   109,    70,
     117,   203,    92,   411,    28,    98,    70,   114,   210,     0,
     100,   108,    75,    70,    91,   217,    93,     4,    81,    82,
     103,   175,   224,   100,   278,    94,    95,    96,    97,    98,
      99,   108,   109,   102,   103,   104,   105,   106,   107,   136,
      54,    55,    56,    57,    58,    59,   117,     7,     8,   118,
     119,   120,     4,   117,   208,   209,    70,   198,   260,    71,
      94,    95,    96,    97,   472,    99,    98,    91,   102,    93,
     224,    98,   110,   107,   112,   277,   100,   279,   116,   115,
     102,   388,   389,     4,   108,   109,   497,   110,   100,   112,
      94,    95,    96,    97,    98,    99,   108,   109,   102,    98,
     113,    10,   106,   107,     4,   246,   247,   248,   262,   263,
     264,   265,   266,   267,   268,   269,   270,   271,   272,   273,
     274,   323,    93,   277,   378,    15,    16,    17,    94,    95,
      96,    97,    98,    99,    91,   289,   102,   391,   292,   293,
      72,   107,   103,   297,   113,    54,    55,    56,    57,    58,
      59,     4,   106,    98,   356,   102,   103,   104,   105,    22,
     414,    70,   416,   116,     4,   319,     4,    91,    98,   323,
     324,   325,   326,    32,    33,    34,    35,    36,    37,    38,
      39,    98,    41,    42,    43,    44,    45,   113,    70,   114,
     393,   394,    94,    95,    96,    97,    98,    99,   102,     4,
     102,     4,     4,   115,     4,   107,     4,    71,   410,    71,
      98,    98,    98,   116,   116,   369,   370,   371,   372,   373,
     374,   375,   376,   377,   103,   379,   380,   381,   382,   383,
     384,   385,   386,     4,     4,     4,   390,    70,   116,    94,
      95,    96,    97,   113,    99,   116,   400,    98,   450,    98,
     404,   110,   107,   112,   113,   114,    98,    98,   116,   413,
      10,   415,    10,   115,    98,    10,    72,    12,    13,    70,
     113,   451,    14,    18,    19,    20,   113,   113,   113,     4,
       4,   435,    27,    28,   115,   115,    31,   489,    94,    95,
      96,    97,     4,    99,   448,   449,   102,   103,   104,   105,
     116,   107,    84,    85,    86,    87,    88,    89,    90,     4,
       4,    40,     4,     4,     4,     4,    61,    46,    47,    64,
      65,   115,   476,   115,    53,   479,    98,   481,    73,    13,
     203,    66,    77,   323,    79,   113,   182,    66,    67,    68,
      69,   145,   319,   172,   299,   193,   178,   194,   410,    94,
      95,    96,    97,    98,    99,   496,   472,   102,   356,   453,
     175,   106,   107,   224,    94,    95,    96,    97,    98,    99,
     242,   116,   102,   103,   104,   105,   106,   107,   279,   131,
     320,    -1,   111,    -1,    -1,   114,    -1,    -1,    -1,    -1,
     119,   120,   121,   122,   123,   124,   125,   126,    94,    95,
      96,    97,    98,    99,    -1,    -1,   102,   103,   104,   105,
      -1,   107,    94,    95,    96,    97,    -1,    99,    -1,    -1,
     102,   103,   104,   105,    -1,   107
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     9,    19,    21,    25,    28,    60,    76,
      92,   100,   129,   130,   131,   132,   134,   135,   136,   145,
     148,   149,   156,   168,     7,     8,   133,   102,   114,    98,
     157,   137,    48,    49,    50,    51,    52,    98,   209,   210,
     169,   146,     4,     0,   131,     4,   103,     4,    70,   236,
     237,   150,    98,   102,   106,   231,   232,   209,    98,    98,
      28,    91,   100,   108,   109,   138,   140,   141,   147,   148,
     200,   201,   202,   102,   115,    72,    94,    95,    96,    97,
      99,   102,   103,   104,   105,   107,   227,   235,   238,   240,
     241,   242,     4,   158,    98,   113,   170,   139,     4,   141,
      93,    76,   142,   143,   202,   235,    72,    70,   127,     4,
      23,    24,   151,   152,   153,   154,   155,    84,    85,    86,
      87,    88,    89,    90,   164,   176,   177,   178,   113,   242,
     176,   103,   176,     4,   106,   235,   239,   240,   209,    98,
      22,   153,   116,     4,    70,   163,   242,     4,    98,   106,
     233,   234,   235,    91,   144,   227,   228,   229,   230,   234,
     240,    98,    98,    48,    49,    50,    51,    98,   165,   166,
     159,   178,   171,   113,   114,    70,     4,     4,    70,   117,
       4,   160,   160,   102,   236,   230,   166,     5,   100,   108,
     109,   161,   167,   197,   198,   199,   167,   115,   162,     4,
       4,    71,   199,   200,   203,    71,   209,    10,    12,    13,
      18,    19,    20,    27,    28,    31,    61,    64,    65,    73,
      77,    79,    98,   102,   106,   138,   172,   187,   189,   193,
     205,   211,   212,   213,   214,   215,   217,   225,   227,    98,
     233,   235,   235,   227,    98,    98,   206,   207,   208,    96,
     102,   243,   116,   217,   227,   116,     4,   228,     4,     4,
     116,   218,    32,    33,    34,    35,    36,    37,    38,    39,
      41,    42,    43,    44,    45,   110,   112,   113,   114,   216,
     185,    10,    54,    55,    56,    57,    58,    59,    70,   226,
      10,    70,   226,    70,   209,   209,   209,   113,   194,   195,
     173,   190,   223,   224,   227,   116,   235,   235,   235,   235,
     235,   235,   235,   235,   235,   235,   235,   235,   235,    18,
      61,    62,   102,   106,   118,   119,   120,   217,   227,   235,
     236,   102,   227,   232,    15,    16,    17,   186,   233,   233,
     235,   233,   233,   235,   235,    98,   204,    98,    98,   235,
     196,   220,   235,   196,   180,   191,    70,   117,   185,   219,
     220,   210,   235,   243,    98,   144,   235,   235,   235,    40,
      46,    47,    53,    66,    67,    68,    69,   111,   114,   119,
     120,   121,   122,   123,   124,   125,   126,   115,    10,    10,
      70,   114,    70,   113,   113,    70,   117,   221,   117,    11,
      83,   175,   181,     4,    64,    78,    80,   188,   192,   223,
     113,    70,   117,    70,   114,    70,   114,   235,   235,   235,
     235,   235,   235,   235,   235,   235,   236,   235,   235,   235,
     235,   235,   235,   235,   235,   113,   233,   233,   235,   236,
      98,   242,   242,   220,    14,   222,   220,   235,    75,    81,
      82,   179,     4,   235,     4,   215,   220,   235,   236,   235,
     236,   115,   235,   115,     4,   235,   235,   102,   227,   174,
     202,   221,   116,   115,   115,     4,    70,     4,     4,    70,
       4,    70,   182,     4,   219,   235,   235,   235,    27,    63,
      74,   183,   117,     4,     4,     4,   184,   227,     4,   209,
     185,    98
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
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                     yyval.i = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, yyvsp[0].s));
                     cur_call->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 37:
#line 494 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 39:
#line 502 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 40:
#line 504 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 43:
#line 519 "imcc/imcc.y"
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
#line 535 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 45:
#line 542 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 47:
#line 551 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 52:
#line 562 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 567 "imcc/imcc.y"
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
#line 581 "imcc/imcc.y"
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
#line 597 "imcc/imcc.y"
    {
           cur_unit = (IMCC_INFO(interp)->state->pragmas & PR_FASTCALL ?
                  imc_open_unit(interp, IMC_FASTSUB)
                : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 56:
#line 603 "imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, yyvsp[0].sr);
        }
    break;

  case 57:
#line 606 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 58:
#line 608 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 59:
#line 612 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 60:
#line 613 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 61:
#line 614 "imcc/imcc.y"
    { add_pcc_param(cur_call, yyvsp[-1].sr);}
    break;

  case 62:
#line 618 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 63:
#line 619 "imcc/imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-2].t);
                                         is_def=0; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 64:
#line 624 "imcc/imcc.y"
    { yyval.t = 0;  }
    break;

  case 66:
#line 629 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 67:
#line 633 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 68:
#line 634 "imcc/imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); }
    break;

  case 69:
#line 635 "imcc/imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);}
    break;

  case 70:
#line 639 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 71:
#line 640 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 72:
#line 641 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 73:
#line 642 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 74:
#line 643 "imcc/imcc.y"
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
#line 661 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 78:
#line 663 "imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, yyvsp[0].s));

         }
    break;

  case 79:
#line 667 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 80:
#line 669 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 81:
#line 674 "imcc/imcc.y"
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
#line 701 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 83:
#line 705 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 84:
#line 706 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 85:
#line 710 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 86:
#line 712 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 87:
#line 716 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 89:
#line 721 "imcc/imcc.y"
    { yyval.t = yyvsp[0].t; }
    break;

  case 90:
#line 722 "imcc/imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; }
    break;

  case 91:
#line 726 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 92:
#line 727 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 93:
#line 728 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 94:
#line 729 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 95:
#line 730 "imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 96:
#line 731 "imcc/imcc.y"
    {  yyval.t = P_METHOD; }
    break;

  case 98:
#line 737 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 99:
#line 742 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 100:
#line 744 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-1].sr);
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 101:
#line 749 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 102:
#line 751 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 103:
#line 753 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 104:
#line 757 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 105:
#line 764 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 106:
#line 765 "imcc/imcc.y"
    {  add_pcc_arg(cur_call, yyvsp[-1].sr); }
    break;

  case 107:
#line 769 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 108:
#line 774 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 109:
#line 775 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(cur_call, yyvsp[-1].sr); }
    break;

  case 110:
#line 779 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 111:
#line 780 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 112:
#line 781 "imcc/imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 113:
#line 785 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 114:
#line 786 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 115:
#line 790 "imcc/imcc.y"
    {  yyval.t = VT_FLAT;   }
    break;

  case 116:
#line 791 "imcc/imcc.y"
    {  yyval.t = VT_OPTIONAL; }
    break;

  case 117:
#line 792 "imcc/imcc.y"
    {  yyval.t = VT_OPT_FLAG; }
    break;

  case 118:
#line 797 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 119:
#line 798 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 122:
#line 808 "imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 123:
#line 811 "imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 124:
#line 812 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 125:
#line 818 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 126:
#line 820 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 127:
#line 822 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 128:
#line 826 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 129:
#line 831 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 130:
#line 836 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 131:
#line 838 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 132:
#line 843 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 133:
#line 847 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 134:
#line 848 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 135:
#line 849 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 138:
#line 867 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 139:
#line 872 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 140:
#line 873 "imcc/imcc.y"
    {  yyval.i = 0; }
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
#line 879 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 147:
#line 889 "imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 148:
#line 896 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 149:
#line 900 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 150:
#line 908 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 153:
#line 918 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 154:
#line 919 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 155:
#line 920 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 156:
#line 921 "imcc/imcc.y"
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
#line 933 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 158:
#line 934 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 160:
#line 936 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 161:
#line 937 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 162:
#line 938 "imcc/imcc.y"
    { yyval.i = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 163:
#line 942 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 164:
#line 944 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 165:
#line 946 "imcc/imcc.y"
    {  yyval.i = 0; cur_call = NULL; }
    break;

  case 166:
#line 947 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 168:
#line 949 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 169:
#line 953 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 170:
#line 954 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 171:
#line 955 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 172:
#line 956 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 173:
#line 957 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 174:
#line 958 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 175:
#line 963 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 176:
#line 973 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 177:
#line 974 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 178:
#line 975 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 179:
#line 976 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 180:
#line 977 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 181:
#line 978 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 182:
#line 979 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 183:
#line 980 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 981 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 185:
#line 982 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 983 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 187:
#line 984 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 188:
#line 986 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 189:
#line 988 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 990 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 191:
#line 992 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 994 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 193:
#line 996 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 998 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 195:
#line 1000 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 1002 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 1004 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 198:
#line 1006 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 1008 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 200:
#line 1010 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 201:
#line 1012 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 202:
#line 1014 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 1016 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 1018 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 205:
#line 1020 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 206:
#line 1023 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 207:
#line 1025 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 208:
#line 1029 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 1031 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 210:
#line 1033 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 211:
#line 1036 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            cur_call = NULL;
            yyval.i = 0;
         }
    break;

  case 212:
#line 1042 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 213:
#line 1046 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           cur_call = NULL;
         }
    break;

  case 216:
#line 1056 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 1058 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 218:
#line 1060 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1062 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 220:
#line 1064 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 221:
#line 1066 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 222:
#line 1068 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 223:
#line 1070 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 1072 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 1074 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 226:
#line 1076 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 227:
#line 1078 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 228:
#line 1080 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 229:
#line 1085 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 230:
#line 1091 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 231:
#line 1092 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 232:
#line 1093 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 233:
#line 1098 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 234:
#line 1099 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 235:
#line 1100 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 236:
#line 1103 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 237:
#line 1104 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 238:
#line 1109 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 239:
#line 1114 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 240:
#line 1118 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 241:
#line 1119 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 242:
#line 1120 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 243:
#line 1124 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 244:
#line 1128 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 245:
#line 1129 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 246:
#line 1133 "imcc/imcc.y"
    {  yyval.t = VT_FLAT; }
    break;

  case 247:
#line 1136 "imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 248:
#line 1140 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 249:
#line 1141 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 250:
#line 1146 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 251:
#line 1148 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 252:
#line 1150 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 253:
#line 1152 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 254:
#line 1154 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 255:
#line 1156 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 256:
#line 1160 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 257:
#line 1161 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 258:
#line 1162 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 259:
#line 1163 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 260:
#line 1164 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 261:
#line 1165 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 264:
#line 1174 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 265:
#line 1175 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 266:
#line 1179 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 268:
#line 1184 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 269:
#line 1186 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 271:
#line 1194 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 272:
#line 1198 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 273:
#line 1199 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 274:
#line 1203 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 275:
#line 1204 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 280:
#line 1217 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 281:
#line 1218 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 282:
#line 1222 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 283:
#line 1224 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 284:
#line 1225 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 285:
#line 1226 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 286:
#line 1230 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 287:
#line 1236 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 288:
#line 1238 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 289:
#line 1239 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 290:
#line 1243 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 291:
#line 1244 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 292:
#line 1245 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 293:
#line 1246 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 294:
#line 1247 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 295:
#line 1251 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 296:
#line 1252 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 297:
#line 1253 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 298:
#line 1254 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 299:
#line 1258 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 300:
#line 1259 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3488 "imcc/imcparser.c"

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


#line 1264 "imcc/imcc.y"



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

