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
     CALL = 261,
     GOTO = 262,
     ARG = 263,
     FLATTEN_ARG = 264,
     FLATTEN = 265,
     IF = 266,
     UNLESS = 267,
     END = 268,
     SAVEALL = 269,
     RESTOREALL = 270,
     NEW = 271,
     NEWSUB = 272,
     NEWCLOSURE = 273,
     NEWCOR = 274,
     NEWCONT = 275,
     NAMESPACE = 276,
     ENDNAMESPACE = 277,
     CLASS = 278,
     ENDCLASS = 279,
     FIELD = 280,
     DOT_METHOD = 281,
     SUB = 282,
     SYM = 283,
     LOCAL = 284,
     CONST = 285,
     INC = 286,
     DEC = 287,
     GLOBAL_CONST = 288,
     PLUS_ASSIGN = 289,
     MINUS_ASSIGN = 290,
     MUL_ASSIGN = 291,
     DIV_ASSIGN = 292,
     CONCAT_ASSIGN = 293,
     BAND_ASSIGN = 294,
     BOR_ASSIGN = 295,
     BXOR_ASSIGN = 296,
     FDIV = 297,
     FDIV_ASSIGN = 298,
     MOD_ASSIGN = 299,
     SHR_ASSIGN = 300,
     SHL_ASSIGN = 301,
     SHR_U_ASSIGN = 302,
     SHIFT_LEFT = 303,
     SHIFT_RIGHT = 304,
     INTV = 305,
     FLOATV = 306,
     STRINGV = 307,
     PMCV = 308,
     OBJECTV = 309,
     LOG_XOR = 310,
     RELOP_EQ = 311,
     RELOP_NE = 312,
     RELOP_GT = 313,
     RELOP_GTE = 314,
     RELOP_LT = 315,
     RELOP_LTE = 316,
     GLOBAL = 317,
     GLOBALOP = 318,
     ADDR = 319,
     RESULT = 320,
     RETURN = 321,
     YIELDT = 322,
     POW = 323,
     SHIFT_RIGHT_U = 324,
     LOG_AND = 325,
     LOG_OR = 326,
     COMMA = 327,
     ESUB = 328,
     DOTDOT = 329,
     PCC_BEGIN = 330,
     PCC_END = 331,
     PCC_CALL = 332,
     PCC_SUB = 333,
     PCC_BEGIN_RETURN = 334,
     PCC_END_RETURN = 335,
     PCC_BEGIN_YIELD = 336,
     PCC_END_YIELD = 337,
     NCI_CALL = 338,
     METH_CALL = 339,
     INVOCANT = 340,
     PROTOTYPED = 341,
     NON_PROTOTYPED = 342,
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
#define CALL 261
#define GOTO 262
#define ARG 263
#define FLATTEN_ARG 264
#define FLATTEN 265
#define IF 266
#define UNLESS 267
#define END 268
#define SAVEALL 269
#define RESTOREALL 270
#define NEW 271
#define NEWSUB 272
#define NEWCLOSURE 273
#define NEWCOR 274
#define NEWCONT 275
#define NAMESPACE 276
#define ENDNAMESPACE 277
#define CLASS 278
#define ENDCLASS 279
#define FIELD 280
#define DOT_METHOD 281
#define SUB 282
#define SYM 283
#define LOCAL 284
#define CONST 285
#define INC 286
#define DEC 287
#define GLOBAL_CONST 288
#define PLUS_ASSIGN 289
#define MINUS_ASSIGN 290
#define MUL_ASSIGN 291
#define DIV_ASSIGN 292
#define CONCAT_ASSIGN 293
#define BAND_ASSIGN 294
#define BOR_ASSIGN 295
#define BXOR_ASSIGN 296
#define FDIV 297
#define FDIV_ASSIGN 298
#define MOD_ASSIGN 299
#define SHR_ASSIGN 300
#define SHL_ASSIGN 301
#define SHR_U_ASSIGN 302
#define SHIFT_LEFT 303
#define SHIFT_RIGHT 304
#define INTV 305
#define FLOATV 306
#define STRINGV 307
#define PMCV 308
#define OBJECTV 309
#define LOG_XOR 310
#define RELOP_EQ 311
#define RELOP_NE 312
#define RELOP_GT 313
#define RELOP_GTE 314
#define RELOP_LT 315
#define RELOP_LTE 316
#define GLOBAL 317
#define GLOBALOP 318
#define ADDR 319
#define RESULT 320
#define RETURN 321
#define YIELDT 322
#define POW 323
#define SHIFT_RIGHT_U 324
#define LOG_AND 325
#define LOG_OR 326
#define COMMA 327
#define ESUB 328
#define DOTDOT 329
#define PCC_BEGIN 330
#define PCC_END 331
#define PCC_CALL 332
#define PCC_SUB 333
#define PCC_BEGIN_RETURN 334
#define PCC_END_RETURN 335
#define PCC_BEGIN_YIELD 336
#define PCC_END_YIELD 337
#define NCI_CALL 338
#define METH_CALL 339
#define INVOCANT 340
#define PROTOTYPED 341
#define NON_PROTOTYPED 342
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
static Instruction * current_call;
static SymReg *cur_obj;
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
    rhs = mk_const(interp, name, 'p');
    r[1] = rhs;
    switch (type_enum) {
        case enum_class_Sub:
            rhs->usage = U_FIXUP;
            return INS(interp, unit, "set_p_pc", "", r, 2, 0, 1);
    }
    IMCC_fataly(interp, E_SyntaxError,
        "Unknown PMC constant type %d", type_enum);
    return NULL;
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
   /* FIXME use the default settings from .pragma */
   current_call->r[0]->pcc_sub->pragma = P_PROTOTYPED;
   if (current_call->r[0]->pcc_sub->sub->pmc_type == enum_class_NCI)
       current_call->r[0]->pcc_sub->nci = 1;
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

#ifndef YYSTYPE
#line 318 "imcc/imcc.y"
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
#line 633 "imcc/imcparser.c"
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
#line 654 "imcc/imcparser.c"

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
#define YYFINAL  35
#define YYLAST   621

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  133
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  109
/* YYNRULES -- Number of rules. */
#define YYNRULES  300
/* YYNRULES -- Number of states. */
#define YYNSTATES  506

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
      20,    22,    24,    27,    29,    33,    39,    40,    47,    48,
      55,    57,    60,    64,    67,    69,    71,    73,    75,    76,
      80,    84,    85,    87,    88,    93,    94,    96,   101,   102,
     109,   111,   112,   114,   117,   119,   121,   123,   128,   133,
     134,   135,   136,   147,   148,   150,   154,   155,   160,   161,
     165,   169,   171,   173,   177,   178,   180,   181,   182,   183,
     194,   195,   206,   207,   210,   211,   215,   217,   219,   220,
     224,   226,   228,   230,   232,   234,   236,   238,   240,   246,
     250,   254,   258,   262,   268,   274,   275,   279,   282,   285,
     288,   289,   293,   296,   297,   302,   304,   306,   308,   310,
     311,   317,   319,   320,   323,   327,   330,   333,   334,   340,
     341,   347,   348,   350,   354,   356,   359,   360,   363,   366,
     368,   370,   371,   373,   376,   378,   380,   384,   386,   390,
     392,   394,   397,   400,   401,   406,   407,   414,   416,   417,
     424,   425,   430,   433,   436,   439,   442,   445,   448,   449,
     453,   456,   458,   460,   462,   463,   465,   467,   469,   471,
     473,   475,   477,   479,   481,   483,   485,   489,   494,   499,
     504,   510,   516,   522,   528,   534,   540,   546,   552,   558,
     564,   570,   576,   582,   588,   594,   600,   606,   613,   620,
     627,   635,   640,   645,   652,   660,   665,   672,   677,   682,
     687,   692,   699,   707,   711,   712,   722,   724,   726,   730,
     734,   738,   742,   746,   750,   754,   758,   762,   766,   770,
     774,   778,   783,   785,   787,   789,   793,   797,   801,   803,
     805,   806,   812,   813,   817,   819,   821,   824,   827,   831,
     833,   840,   847,   852,   857,   862,   867,   869,   871,   873,
     875,   877,   879,   881,   883,   884,   886,   890,   892,   894,
     899,   901,   903,   905,   907,   909,   911,   913,   915,   917,
     919,   920,   923,   925,   929,   930,   935,   937,   941,   944,
     947,   949,   951,   953,   955,   957,   959,   961,   963,   965,
     967
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     134,     0,    -1,   135,    -1,   136,    -1,   135,   136,    -1,
     151,    -1,   150,    -1,   138,    -1,   137,    -1,   158,    -1,
     168,    -1,   147,    -1,   105,     4,    -1,     4,    -1,    63,
     210,   103,    -1,    63,   210,   103,   118,   240,    -1,    -1,
      31,   139,   210,   103,   118,   240,    -1,    -1,    31,   141,
     108,   232,   118,   107,    -1,   143,    -1,   142,   143,    -1,
     198,   144,     4,    -1,   105,     4,    -1,   114,    -1,   113,
      -1,   150,    -1,   140,    -1,    -1,   145,   111,   146,    -1,
      79,   177,    96,    -1,    -1,   226,    -1,    -1,    97,   148,
     149,    98,    -1,    -1,   142,    -1,    22,   119,   234,   120,
      -1,    -1,    24,   103,   152,     4,   153,    25,    -1,   154,
      -1,    -1,   155,    -1,   154,   155,    -1,   156,    -1,   157,
      -1,     4,    -1,    26,   210,   103,     4,    -1,    27,   103,
     103,     4,    -1,    -1,    -1,    -1,    28,   159,   229,   160,
     165,     4,   161,   162,   167,    74,    -1,    -1,     4,    -1,
     162,   163,     4,    -1,    -1,     5,   164,   210,   103,    -1,
      -1,   165,    73,   178,    -1,   165,    73,   166,    -1,   178,
      -1,   166,    -1,    95,   121,   122,    -1,    -1,   195,    -1,
      -1,    -1,    -1,    79,   169,   103,   170,   165,     4,   171,
     162,   167,    74,    -1,    -1,    76,   176,     4,   173,   180,
     175,   179,   174,   182,    77,    -1,    -1,   200,     4,    -1,
      -1,    86,   233,     4,    -1,    87,    -1,    88,    -1,    -1,
     177,    73,   178,    -1,   178,    -1,   176,    -1,    90,    -1,
      89,    -1,    91,    -1,    92,    -1,    94,    -1,    93,    -1,
      78,   233,    73,   233,     4,    -1,    78,   233,     4,    -1,
      84,   233,     4,    -1,    85,   225,     4,    -1,    85,   107,
       4,    -1,    85,   225,    73,   233,     4,    -1,    85,   107,
      73,   233,     4,    -1,    -1,   180,   181,     4,    -1,     9,
     233,    -1,    11,   225,    -1,    10,   225,    -1,    -1,   182,
     183,     4,    -1,    66,   225,    -1,    -1,    30,   184,   210,
     103,    -1,    80,    -1,    82,    -1,    81,    -1,    83,    -1,
      -1,   185,     4,   188,   189,   186,    -1,   191,    -1,    -1,
     189,     4,    -1,   189,   190,     4,    -1,    67,   233,    -1,
      11,   225,    -1,    -1,    67,   121,   192,   194,   122,    -1,
      -1,    68,   121,   193,   194,   122,    -1,    -1,   233,    -1,
     194,    73,   233,    -1,   197,    -1,   195,   197,    -1,    -1,
     196,   201,    -1,   105,     4,    -1,   114,    -1,   113,    -1,
      -1,   199,    -1,   199,   200,    -1,   200,    -1,    96,    -1,
     198,   203,     4,    -1,   103,    -1,   202,    73,   103,    -1,
     212,    -1,   223,    -1,    22,   103,    -1,    23,   103,    -1,
      -1,    30,   204,   210,   202,    -1,    -1,    31,   205,   210,
     103,   118,   240,    -1,   140,    -1,    -1,    34,   206,   210,
     103,   118,   240,    -1,    -1,     5,   207,   210,   103,    -1,
       5,   239,    -1,    66,   233,    -1,     9,   233,    -1,    67,
     233,    -1,     7,   231,    -1,     8,   231,    -1,    -1,    18,
     208,   146,    -1,   111,   226,    -1,   218,    -1,   172,    -1,
     187,    -1,    -1,    18,    -1,    19,    -1,    20,    -1,    21,
      -1,    51,    -1,    52,    -1,    53,    -1,    54,    -1,    55,
      -1,   211,    -1,   103,    -1,   225,   118,   233,    -1,   225,
     118,   123,   233,    -1,   225,   118,   124,   233,    -1,   225,
     118,   125,   233,    -1,   225,   118,   233,   126,   233,    -1,
     225,   118,   233,   124,   233,    -1,   225,   118,   233,   127,
     233,    -1,   225,   118,   233,    69,   233,    -1,   225,   118,
     233,   128,   233,    -1,   225,   118,   233,    43,   233,    -1,
     225,   118,   233,   129,   233,    -1,   225,   118,   233,   116,
     233,    -1,   225,   118,   233,    49,   233,    -1,   225,   118,
     233,    50,   233,    -1,   225,   118,   233,    70,   233,    -1,
     225,   118,   233,    71,   233,    -1,   225,   118,   233,    72,
     233,    -1,   225,   118,   233,    56,   233,    -1,   225,   118,
     233,   130,   233,    -1,   225,   118,   233,   131,   233,    -1,
     225,   118,   233,   125,   233,    -1,   225,   118,   233,   119,
     234,   120,    -1,   225,   119,   234,   120,   118,   233,    -1,
     225,   118,    17,   211,    73,   233,    -1,   225,   118,    17,
     211,   119,   234,   120,    -1,   225,   118,    17,   211,    -1,
     225,   118,    17,   233,    -1,   225,   118,    17,   233,    73,
     233,    -1,   225,   118,    17,   233,   119,   234,   120,    -1,
     225,   118,   209,   103,    -1,   225,   118,   209,   103,    73,
     103,    -1,   225,   118,    65,   103,    -1,   225,   118,    64,
     241,    -1,    64,   241,   118,   233,    -1,    17,   225,    73,
     233,    -1,    17,   225,    73,   233,    73,   233,    -1,    17,
     225,    73,   233,   119,   234,   120,    -1,   225,   118,   218,
      -1,    -1,   213,   121,   222,   122,   118,   216,   121,   220,
     122,    -1,   214,    -1,   215,    -1,   225,    35,   233,    -1,
     225,    36,   233,    -1,   225,    37,   233,    -1,   225,    38,
     233,    -1,   225,    45,   233,    -1,   225,    44,   233,    -1,
     225,    39,   233,    -1,   225,    40,   233,    -1,   225,    41,
     233,    -1,   225,    42,   233,    -1,   225,    46,   233,    -1,
     225,    47,   233,    -1,   225,    48,   233,    -1,   225,   118,
     111,   146,    -1,   103,    -1,   107,    -1,   225,    -1,   225,
     217,   230,    -1,   225,   217,   107,    -1,   225,   217,   225,
      -1,   117,    -1,   115,    -1,    -1,   216,   219,   121,   220,
     122,    -1,    -1,   220,    73,   221,    -1,   221,    -1,   233,
      -1,    11,   225,    -1,    10,   225,    -1,   222,    73,   225,
      -1,   225,    -1,    12,   233,   224,   233,     8,   231,    -1,
      13,   233,   224,   233,     8,   231,    -1,    12,   233,     8,
     231,    -1,    13,   233,     8,   231,    -1,    12,   233,    73,
     231,    -1,    13,   233,    73,   231,    -1,    57,    -1,    58,
      -1,    59,    -1,    60,    -1,    61,    -1,    62,    -1,   112,
      -1,   239,    -1,    -1,   227,    -1,   227,    73,   228,    -1,
     228,    -1,   232,    -1,   225,   119,   234,   120,    -1,   230,
      -1,   107,    -1,   103,    -1,   111,    -1,   103,    -1,   111,
      -1,   231,    -1,   233,    -1,   225,    -1,   240,    -1,    -1,
     235,   236,    -1,   238,    -1,   236,   132,   238,    -1,    -1,
     236,    73,   237,   238,    -1,   233,    -1,   233,    75,   233,
      -1,    75,   233,    -1,   233,    75,    -1,    99,    -1,   100,
      -1,   101,    -1,   102,    -1,   104,    -1,   108,    -1,   109,
      -1,   107,    -1,   110,    -1,   101,    -1,   107,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   399,   399,   403,   405,   408,   410,   411,   412,   413,
     414,   415,   416,   417,   420,   427,   436,   435,   441,   440,
     444,   446,   449,   451,   452,   453,   454,   455,   458,   458,
     462,   469,   472,   477,   476,   487,   489,   492,   510,   508,
     524,   526,   529,   531,   534,   536,   537,   540,   554,   572,
     577,   585,   570,   590,   592,   593,   597,   596,   601,   603,
     604,   605,   606,   609,   612,   614,   618,   620,   626,   617,
     633,   631,   663,   665,   668,   670,   673,   675,   678,   680,
     681,   684,   685,   686,   687,   688,   689,   690,   693,   699,
     701,   706,   708,   710,   714,   720,   722,   725,   727,   730,
     733,   735,   738,   741,   741,   745,   747,   750,   752,   757,
     755,   761,   766,   768,   770,   774,   776,   781,   779,   788,
     787,   796,   798,   799,   803,   805,   816,   820,   823,   824,
     825,   828,   830,   833,   835,   838,   844,   849,   857,   865,
     867,   868,   869,   870,   870,   883,   883,   885,   886,   886,
     888,   888,   891,   892,   893,   894,   895,   896,   897,   897,
     900,   903,   904,   905,   906,   909,   911,   912,   913,   916,
     918,   919,   920,   921,   922,   925,   936,   938,   939,   940,
     941,   942,   943,   944,   945,   946,   947,   948,   949,   951,
     953,   955,   957,   959,   961,   963,   965,   967,   969,   971,
     973,   975,   977,   979,   981,   983,   986,   993,   996,   998,
    1002,  1004,  1006,  1009,  1016,  1015,  1024,  1025,  1028,  1031,
    1033,  1035,  1037,  1039,  1041,  1043,  1045,  1047,  1049,  1051,
    1053,  1057,  1065,  1066,  1067,  1072,  1073,  1074,  1077,  1078,
    1083,  1081,  1091,  1093,  1094,  1097,  1100,  1103,  1107,  1109,
    1112,  1115,  1117,  1119,  1121,  1123,  1127,  1129,  1130,  1131,
    1132,  1133,  1136,  1138,  1141,  1143,  1146,  1148,  1151,  1153,
    1160,  1162,  1165,  1167,  1170,  1172,  1175,  1177,  1180,  1182,
    1185,  1185,  1189,  1191,  1193,  1193,  1197,  1203,  1206,  1207,
    1210,  1212,  1213,  1214,  1215,  1218,  1220,  1221,  1222,  1225,
    1227
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "PRAGMA", 
  "CALL", "GOTO", "ARG", "FLATTEN_ARG", "FLATTEN", "IF", "UNLESS", "END", 
  "SAVEALL", "RESTOREALL", "NEW", "NEWSUB", "NEWCLOSURE", "NEWCOR", 
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
  "METH_CALL", "INVOCANT", "PROTOTYPED", "NON_PROTOTYPED", "MAIN", "LOAD", 
  "IMMEDIATE", "POSTCOMP", "METHOD", "ANON", "MULTI", "LABEL", "EMIT", 
  "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "REG", "MACRO", 
  "ENDM", "STRINGC", "INTC", "FLOATC", "USTRINGC", "PARROT_OP", "VAR", 
  "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", "POINTY", "'='", "'['", 
  "']'", "'('", "')'", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", 
  "'&'", "'|'", "';'", "$accept", "program", "compilation_units", 
  "compilation_unit", "global", "constdef", "@1", "pmc_const", "@2", 
  "pasmcode", "pasmline", "pasm_inst", "@3", "pasm_args", "emit", "@4", 
  "opt_pasmcode", "class_namespace", "class", "@5", "class_body", 
  "member_decls", "member_decl", "field_decl", "method_decl", "sub", "@6", 
  "@7", "@8", "sub_params", "sub_param", "@9", "sub_proto", "multi", 
  "sub_body", "pcc_sub", "@10", "@11", "@12", "pcc_sub_call", "@13", 
  "opt_label", "opt_invocant", "pcc_proto", "pcc_sub_proto", "proto", 
  "pcc_call", "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@14", 
  "begin_ret_or_yield", "end_ret_or_yield", "pcc_ret", "@15", 
  "pcc_returns", "pcc_return", "pcc_return_many", "@16", "@17", 
  "var_returns", "statements", "helper_clear_state", "statement", 
  "labels", "_labels", "label", "instruction", "id_list", "labeled_inst", 
  "@18", "@19", "@20", "@21", "@22", "newsub", "type", "classname", 
  "assignment", "@23", "op_assign", "func_assign", "the_sub", "ptr", 
  "sub_call", "@24", "arglist", "arg", "targetlist", "if_statement", 
  "relop", "target", "vars", "_vars", "_var_or_i", "sub_label_op_c", 
  "sub_label_op", "label_op", "var_or_i", "var", "keylist", "@25", 
  "_keylist", "@26", "key", "reg", "const", "string", 0
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
     136,   136,   136,   136,   137,   137,   139,   138,   141,   140,
     142,   142,   143,   143,   143,   143,   143,   143,   145,   144,
     144,   144,   146,   148,   147,   149,   149,   150,   152,   151,
     153,   153,   154,   154,   155,   155,   155,   156,   157,   159,
     160,   161,   158,   162,   162,   162,   164,   163,   165,   165,
     165,   165,   165,   166,   167,   167,   169,   170,   171,   168,
     173,   172,   174,   174,   175,   175,   176,   176,   177,   177,
     177,   178,   178,   178,   178,   178,   178,   178,   179,   179,
     179,   179,   179,   179,   179,   180,   180,   181,   181,   181,
     182,   182,   183,   184,   183,   185,   185,   186,   186,   188,
     187,   187,   189,   189,   189,   190,   190,   192,   191,   193,
     191,   194,   194,   194,   195,   195,   196,   197,   197,   197,
     197,   198,   198,   199,   199,   200,   201,   202,   202,   203,
     203,   203,   203,   204,   203,   205,   203,   203,   206,   203,
     207,   203,   203,   203,   203,   203,   203,   203,   208,   203,
     203,   203,   203,   203,   203,   209,   209,   209,   209,   210,
     210,   210,   210,   210,   210,   211,   212,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   213,   212,   212,   212,   214,   214,
     214,   214,   214,   214,   214,   214,   214,   214,   214,   214,
     214,   215,   216,   216,   216,   216,   216,   216,   217,   217,
     219,   218,   220,   220,   220,   221,   221,   221,   222,   222,
     223,   223,   223,   223,   223,   223,   224,   224,   224,   224,
     224,   224,   225,   225,   226,   226,   227,   227,   228,   228,
     229,   229,   230,   230,   231,   231,   232,   232,   233,   233,
     235,   234,   236,   236,   237,   236,   238,   238,   238,   238,
     239,   239,   239,   239,   239,   240,   240,   240,   240,   241,
     241
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     2,     1,     3,     5,     0,     6,     0,     6,
       1,     2,     3,     2,     1,     1,     1,     1,     0,     3,
       3,     0,     1,     0,     4,     0,     1,     4,     0,     6,
       1,     0,     1,     2,     1,     1,     1,     4,     4,     0,
       0,     0,    10,     0,     1,     3,     0,     4,     0,     3,
       3,     1,     1,     3,     0,     1,     0,     0,     0,    10,
       0,    10,     0,     2,     0,     3,     1,     1,     0,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     5,     3,
       3,     3,     3,     5,     5,     0,     3,     2,     2,     2,
       0,     3,     2,     0,     4,     1,     1,     1,     1,     0,
       5,     1,     0,     2,     3,     2,     2,     0,     5,     0,
       5,     0,     1,     3,     1,     2,     0,     2,     2,     1,
       1,     0,     1,     2,     1,     1,     3,     1,     3,     1,
       1,     2,     2,     0,     4,     0,     6,     1,     0,     6,
       0,     4,     2,     2,     2,     2,     2,     2,     0,     3,
       2,     1,     1,     1,     0,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     3,     4,     4,     4,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     6,     6,     6,
       7,     4,     4,     6,     7,     4,     6,     4,     4,     4,
       4,     6,     7,     3,     0,     9,     1,     1,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     4,     1,     1,     1,     3,     3,     3,     1,     1,
       0,     5,     0,     3,     1,     1,     2,     2,     3,     1,
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
       0,    13,     0,     0,    49,    16,     0,    66,    33,     0,
       0,     2,     3,     8,     7,    11,     6,     5,     9,    10,
     280,    38,     0,     0,   169,   170,   171,   172,   173,   175,
       0,   174,     0,   131,    12,     1,     4,     0,     0,     0,
     272,   271,   273,    50,   270,     0,    14,    67,    18,   135,
       0,    25,    24,    27,   131,    20,     0,    26,    28,   132,
     134,    37,     0,   290,   291,   292,   293,   294,   297,   295,
     296,   298,   262,   278,   286,   281,   282,   263,   279,    41,
      58,     0,     0,    58,     0,    23,    21,    34,    78,     0,
       0,   133,   288,   289,   284,     0,    46,     0,     0,     0,
      40,    42,    44,    45,    76,    77,    83,    82,    84,    85,
      87,    86,     0,     0,    62,    81,    61,     0,    15,     0,
       0,     0,    80,    22,   264,   287,     0,   283,     0,     0,
      39,    43,     0,    51,     0,    17,    68,   274,   275,   276,
       0,   277,     0,    30,    29,   278,    32,   265,   267,   268,
     285,     0,     0,    63,    53,    60,    59,    53,     0,    79,
     280,     0,    47,    48,    54,   126,   126,    19,     0,   266,
      56,     0,   130,   129,     0,     0,   126,   131,   124,     0,
     269,     0,   128,    55,    52,   125,   164,   127,    69,     0,
     150,     0,     0,     0,     0,     0,     0,   158,     0,     0,
     143,   145,   148,     0,     0,     0,     0,     0,   105,   106,
     232,   233,   264,   147,   162,     0,   163,   111,     0,   139,
       0,   216,   217,   240,   161,   140,   234,    57,     0,   152,
     156,   157,   154,     0,     0,     0,   264,   141,   142,     0,
       0,     0,   299,   300,     0,   153,   117,   155,   119,     0,
     160,   109,   136,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   239,   238,
       0,   280,     0,     0,     0,   256,   257,   258,   259,   260,
     261,     0,     0,     0,     0,     0,     0,   159,     0,     0,
       0,     0,   121,   121,    70,   112,     0,   249,   242,   218,
     219,   220,   221,   224,   225,   226,   227,   223,   222,   228,
     229,   230,     0,   165,   166,   167,   168,     0,     0,   297,
     264,     0,     0,     0,     0,   213,   278,   176,     0,   236,
     237,   235,   151,   252,   254,     0,   253,   255,     0,   210,
     137,   144,     0,     0,   209,     0,   122,     0,    95,     0,
       0,     0,     0,     0,     0,   244,   245,   201,   202,   208,
     207,   231,   177,   178,   179,   205,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   280,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   280,     0,
       0,     0,     0,   118,   120,    74,   113,     0,     0,   107,
     108,   110,     0,   248,     0,   247,   246,     0,   241,     0,
     280,     0,   280,     0,   185,   188,   189,   193,   183,   190,
     191,   192,   187,     0,   181,   196,   180,   182,   184,   186,
     194,   195,     0,   250,   251,   211,     0,   138,   146,   149,
     123,     0,     0,     0,     0,     0,     0,   116,   115,   114,
       0,   234,   243,   199,     0,   203,     0,   206,   197,   198,
     212,    97,    99,    98,     0,     0,     0,     0,    72,    96,
     242,   200,   204,    75,     0,     0,     0,     0,   100,     0,
       0,    89,     0,    90,    92,     0,    91,     0,     0,    73,
     215,     0,     0,     0,   103,     0,    71,     0,    88,    94,
      93,     0,   102,   101,     0,   104
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    10,    11,    12,    13,    14,    23,    53,    84,    54,
      55,    89,    90,   144,    15,    33,    56,    16,    17,    39,
      99,   100,   101,   102,   103,    18,    22,    80,   154,   165,
     174,   181,   113,   114,   175,    19,    32,    83,   157,   214,
     348,   478,   445,   115,   121,   116,   468,   395,   446,   488,
     497,   501,   215,   401,   216,   295,   349,   402,   217,   292,
     293,   345,   176,   177,   178,    58,    59,    60,   187,   341,
     218,   239,   240,   241,   228,   236,   324,    30,    31,   219,
     220,   221,   222,   223,   272,   224,   254,   354,   355,   296,
     225,   282,    73,   146,   147,   148,    43,    44,   139,   149,
     141,    37,    38,    75,   126,    76,    77,    78,   244
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -230
static const short yypact[] =
{
     106,  -230,  -103,   -61,  -230,  -230,   -20,  -230,  -230,    62,
     119,   106,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,
    -230,  -230,    11,   -20,  -230,  -230,  -230,  -230,  -230,  -230,
      26,  -230,    30,   188,  -230,  -230,  -230,    15,   419,   122,
    -230,  -230,  -230,  -230,  -230,    39,    33,  -230,  -230,  -230,
     149,  -230,  -230,  -230,   212,  -230,    56,  -230,     7,    67,
    -230,  -230,   461,  -230,  -230,  -230,  -230,  -230,  -230,  -230,
    -230,  -230,  -230,  -230,    90,   -50,  -230,  -230,  -230,    22,
     518,    49,   105,   518,    69,  -230,  -230,  -230,   527,   175,
      76,  -230,  -230,   461,  -230,   419,  -230,   -20,    77,   163,
      22,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,
    -230,  -230,    80,    -3,  -230,  -230,  -230,   105,  -230,     5,
     433,   -52,  -230,  -230,   433,  -230,   419,  -230,    87,    95,
    -230,  -230,    82,  -230,   518,  -230,  -230,  -230,  -230,  -230,
      84,  -230,   527,  -230,  -230,    88,  -230,   133,  -230,  -230,
    -230,   205,   216,  -230,   231,  -230,  -230,   231,   130,  -230,
    -230,   433,  -230,  -230,  -230,     3,     3,  -230,   118,  -230,
    -230,   237,  -230,  -230,   238,   176,    27,    67,  -230,   180,
    -230,   -20,  -230,  -230,  -230,  -230,    45,  -230,  -230,   152,
     145,   -74,   -74,   461,   461,   461,   195,  -230,   153,   164,
    -230,   158,  -230,   -71,   461,   292,   155,    36,  -230,  -230,
    -230,  -230,   433,  -230,  -230,   266,  -230,  -230,   270,  -230,
     159,  -230,  -230,  -230,  -230,  -230,   469,  -230,   -20,  -230,
    -230,  -230,  -230,   135,   310,   206,   433,  -230,  -230,   -20,
     -20,   -20,  -230,  -230,   165,  -230,  -230,  -230,  -230,   277,
    -230,  -230,  -230,   195,   169,   461,   461,   461,   461,   461,
     461,   461,   461,   461,   461,   461,   461,   461,  -230,  -230,
     361,  -230,   478,   179,   -74,  -230,  -230,  -230,  -230,  -230,
    -230,   -74,   461,   -74,   -74,   461,   461,  -230,   182,   189,
     197,   461,   461,   461,  -230,  -230,   -53,  -230,    74,  -230,
    -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,
    -230,  -230,   447,  -230,  -230,  -230,  -230,   -71,   200,   170,
     433,   461,   461,   461,   201,  -230,    47,   372,   178,  -230,
    -230,  -230,  -230,  -230,  -230,   297,  -230,  -230,   298,   -54,
    -230,   236,   196,   202,  -230,   -51,  -230,   -28,  -230,     6,
     195,   203,   195,   195,   -22,  -230,  -230,   -17,   -13,  -230,
    -230,  -230,  -230,  -230,  -230,   240,   461,   461,   461,   461,
     461,   461,   461,   461,   461,  -230,   461,   461,   461,   461,
     461,   461,   461,   461,   204,   -74,   -74,   461,  -230,   221,
     105,   105,   461,  -230,  -230,     4,  -230,   195,   461,  -230,
    -230,  -230,   311,  -230,   492,  -230,  -230,    74,  -230,   461,
    -230,   461,  -230,   224,  -230,  -230,  -230,  -230,  -230,  -230,
    -230,  -230,  -230,   199,  -230,  -230,  -230,  -230,  -230,  -230,
    -230,  -230,   461,  -230,  -230,  -230,   208,  -230,  -230,  -230,
    -230,   461,   195,   195,   461,   -38,   325,  -230,  -230,  -230,
     209,   -76,  -230,  -230,   211,  -230,   230,  -230,  -230,  -230,
    -230,  -230,  -230,  -230,   337,   461,   461,   161,    67,  -230,
      74,  -230,  -230,  -230,     8,   347,    20,    23,  -230,   348,
     -18,  -230,   461,  -230,  -230,   461,  -230,   461,    73,  -230,
    -230,   350,   351,   352,  -230,   195,  -230,   353,  -230,  -230,
    -230,   -20,  -230,  -230,   256,  -230
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -230,  -230,  -230,   349,  -230,  -230,  -230,   177,  -230,  -230,
     312,  -230,  -230,  -229,  -230,  -230,  -230,    66,  -230,  -230,
    -230,  -230,   265,  -230,  -230,  -230,  -230,  -230,  -230,   217,
    -230,  -230,   293,   250,   219,  -230,  -230,  -230,  -230,  -230,
    -230,  -230,  -230,   181,  -230,   -70,  -230,  -230,  -230,  -230,
    -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,
    -230,    94,  -230,  -230,   213,   218,  -230,   -57,  -230,  -230,
    -230,  -230,  -230,  -230,  -230,  -230,  -230,   -23,    78,  -230,
    -230,  -230,  -230,    -7,  -230,   136,  -230,   -67,    -2,  -230,
    -230,   174,   -81,   207,  -230,   248,  -230,   140,  -186,   296,
     -34,  -135,  -230,  -230,  -230,    12,   227,   -79,   101
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -235
static const short yytable[] =
{
      45,   133,    91,   118,    74,   230,   231,   287,   170,   136,
     396,   -31,   481,   441,   442,   443,    20,   397,   122,   387,
     350,   142,   392,    94,   484,   168,    96,   486,    92,   137,
     242,    24,    25,    26,    27,    28,   243,   138,   135,   268,
     465,   269,    21,   145,   143,   392,   466,   467,    97,    98,
     190,   407,   191,   192,   193,   407,   409,   194,   195,   125,
     411,    74,   196,   197,   156,   388,    34,   198,   199,   351,
     134,   393,   159,   398,   128,   200,   201,   -64,   134,   202,
     145,   482,    95,    29,   352,   353,    88,   399,   333,   400,
     444,   361,    74,   485,   394,   334,   487,   336,   337,    57,
     408,   -65,   410,   494,   490,   226,   412,   127,   171,   203,
       1,   204,   205,   206,    40,   235,   172,   173,    41,    35,
      57,   207,    42,   104,   105,   208,    79,   209,     2,    46,
       3,   145,   171,    47,     4,    61,   328,     5,   150,   495,
     172,   173,    81,   274,    63,    64,    65,    66,   210,    67,
     496,    82,   211,    85,    87,   145,   212,    72,   189,   232,
     233,   234,   268,    49,   269,    93,  -214,   117,  -234,     6,
     245,   247,   297,    63,    64,    65,    66,   120,    67,   123,
     129,    68,    69,    70,    71,     7,    72,   124,   130,   326,
     151,   330,   275,   276,   277,   278,   279,   280,   152,   433,
     434,   132,   158,     8,   153,   273,   161,   160,   281,   162,
       2,     9,    68,    69,    70,    71,   288,   289,   290,    48,
     163,   299,   300,   301,   302,   303,   304,   305,   306,   307,
     308,   309,   310,   311,     2,   164,   327,   167,   180,   145,
     423,   182,   183,    48,    63,    64,    65,    66,   335,    67,
     184,   338,   339,   436,   188,   227,   237,   344,   346,   346,
      63,    64,    65,    66,   356,    67,   -18,   238,   476,   403,
     251,   405,   406,    72,   252,   454,   248,   456,   358,   286,
     253,   294,   332,   291,    49,   340,   -35,   362,   363,   364,
     298,  -233,   342,    50,    63,    64,    65,    66,   384,    67,
     343,    51,    52,   360,   365,   385,   386,    72,    49,   389,
     -36,   438,   439,   413,   390,   449,   447,    50,   283,   458,
     391,   404,   432,   451,   437,    51,    52,   457,   460,   469,
     470,   471,   414,   415,   416,   417,   418,   419,   420,   421,
     422,   473,   424,   425,   426,   427,   428,   429,   430,   431,
     472,   483,   489,   435,   498,   499,   500,   503,   440,   505,
      36,   462,   463,   213,   448,   131,    86,   275,   276,   277,
     278,   279,   280,   356,   166,   453,   119,   455,   312,   313,
     314,   315,   316,   284,   155,   179,   477,   347,   249,   185,
     357,    63,    64,    65,    66,   186,    67,   450,   459,    68,
      69,    70,    71,   480,    72,   452,   325,   461,   285,   169,
     464,   479,   331,   246,   502,   366,   140,   229,   359,   250,
       0,   367,   368,     0,     0,   317,   318,     0,   369,     0,
       0,   474,   475,     0,     0,     0,   356,     0,     0,     0,
       0,   370,   371,   372,   373,     0,     0,     0,   491,     0,
       0,   492,     0,   493,     0,     0,     0,     0,     0,     0,
      63,    64,    65,    66,   210,    67,     0,     0,   319,    69,
      70,    71,   320,    72,     0,     0,     0,     0,   504,     0,
       0,     0,     0,     0,   321,   322,   323,     0,   374,     0,
       0,   375,     0,     0,    62,     0,   376,   377,   378,   379,
     380,   381,   382,   383,   255,   256,   257,   258,   259,   260,
     261,   262,     0,   263,   264,   265,   266,   267,    63,    64,
      65,    66,     0,    67,     0,     0,    68,    69,    70,    71,
       0,    72,    63,    64,    65,    66,   137,    67,     0,     0,
      68,    69,    70,    71,   138,    72,    63,    64,    65,    66,
      29,    67,     0,     0,    68,    69,    70,    71,     0,    72,
      63,    64,    65,    66,     0,    67,     0,     0,    68,    69,
      70,    71,     0,    72,     0,     0,     0,    63,    64,    65,
      66,    40,    67,     0,   268,   329,   269,   270,   271,    42,
      72,    63,    64,    65,    66,   210,    67,     0,     0,   211,
       0,     0,     0,     0,    72,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   104,   105,   106,   107,   108,   109,
     110,   111
};

static const short yycheck[] =
{
      23,     4,    59,    82,    38,   191,   192,   236,     5,     4,
       4,     4,     4,     9,    10,    11,   119,    11,    88,    73,
      73,    73,    73,    73,     4,   160,     4,     4,    62,   103,
     101,    51,    52,    53,    54,    55,   107,   111,   117,   115,
      78,   117,   103,   124,    96,    73,    84,    85,    26,    27,
       5,    73,     7,     8,     9,    73,    73,    12,    13,    93,
      73,    95,    17,    18,   134,   119,     4,    22,    23,   122,
      73,   122,   142,    67,    97,    30,    31,    74,    73,    34,
     161,    73,   132,   103,    10,    11,    79,    81,   274,    83,
      86,   320,   126,    73,   122,   281,    73,   283,   284,    33,
     122,    74,   119,    30,   122,   186,   119,    95,   105,    64,
       4,    66,    67,    68,   103,   196,   113,   114,   107,     0,
      54,    76,   111,    87,    88,    80,     4,    82,    22,   103,
      24,   212,   105,   103,    28,   120,   271,    31,   126,    66,
     113,   114,   103,     8,    99,   100,   101,   102,   103,   104,
      77,   118,   107,     4,    98,   236,   111,   112,   181,   193,
     194,   195,   115,    96,   117,    75,   121,   118,   121,    63,
     204,   205,   253,    99,   100,   101,   102,   108,   104,     4,
     103,   107,   108,   109,   110,    79,   112,   111,    25,   270,
     103,   272,    57,    58,    59,    60,    61,    62,   103,   385,
     386,   121,   118,    97,   122,   228,    73,   119,    73,     4,
      22,   105,   107,   108,   109,   110,   239,   240,   241,    31,
       4,   255,   256,   257,   258,   259,   260,   261,   262,   263,
     264,   265,   266,   267,    22,     4,   270,   107,   120,   320,
     375,     4,     4,    31,    99,   100,   101,   102,   282,   104,
      74,   285,   286,   388,    74,   103,   103,   291,   292,   293,
      99,   100,   101,   102,   298,   104,   108,   103,   107,   350,
       4,   352,   353,   112,     4,   410,   121,   412,   312,    73,
     121,     4,   103,   118,    96,   103,    98,   321,   322,   323,
     121,   121,   103,   105,    99,   100,   101,   102,   120,   104,
     103,   113,   114,   103,   103,     8,     8,   112,    96,    73,
      98,   390,   391,    73,   118,     4,   397,   105,     8,   120,
     118,   118,   118,   404,   103,   113,   114,   103,   120,     4,
     121,   120,   366,   367,   368,   369,   370,   371,   372,   373,
     374,     4,   376,   377,   378,   379,   380,   381,   382,   383,
     120,     4,     4,   387,     4,     4,     4,     4,   392,   103,
      11,   442,   443,   186,   398,   100,    54,    57,    58,    59,
      60,    61,    62,   407,   157,   409,    83,   411,    17,    18,
      19,    20,    21,    73,   134,   166,   467,   293,   207,   176,
     312,    99,   100,   101,   102,   177,   104,   404,   432,   107,
     108,   109,   110,   470,   112,   407,   270,   441,   234,   161,
     444,   468,   272,   121,   495,    43,   120,   190,   317,   212,
      -1,    49,    50,    -1,    -1,    64,    65,    -1,    56,    -1,
      -1,   465,   466,    -1,    -1,    -1,   470,    -1,    -1,    -1,
      -1,    69,    70,    71,    72,    -1,    -1,    -1,   482,    -1,
      -1,   485,    -1,   487,    -1,    -1,    -1,    -1,    -1,    -1,
      99,   100,   101,   102,   103,   104,    -1,    -1,   107,   108,
     109,   110,   111,   112,    -1,    -1,    -1,    -1,   501,    -1,
      -1,    -1,    -1,    -1,   123,   124,   125,    -1,   116,    -1,
      -1,   119,    -1,    -1,    75,    -1,   124,   125,   126,   127,
     128,   129,   130,   131,    35,    36,    37,    38,    39,    40,
      41,    42,    -1,    44,    45,    46,    47,    48,    99,   100,
     101,   102,    -1,   104,    -1,    -1,   107,   108,   109,   110,
      -1,   112,    99,   100,   101,   102,   103,   104,    -1,    -1,
     107,   108,   109,   110,   111,   112,    99,   100,   101,   102,
     103,   104,    -1,    -1,   107,   108,   109,   110,    -1,   112,
      99,   100,   101,   102,    -1,   104,    -1,    -1,   107,   108,
     109,   110,    -1,   112,    -1,    -1,    -1,    99,   100,   101,
     102,   103,   104,    -1,   115,   107,   117,   118,   119,   111,
     112,    99,   100,   101,   102,   103,   104,    -1,    -1,   107,
      -1,    -1,    -1,    -1,   112,    87,    88,    89,    90,    91,
      92,    93,    94,    95,    87,    88,    89,    90,    91,    92,
      93,    94
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    22,    24,    28,    31,    63,    79,    97,   105,
     134,   135,   136,   137,   138,   147,   150,   151,   158,   168,
     119,   103,   159,   139,    51,    52,    53,    54,    55,   103,
     210,   211,   169,   148,     4,     0,   136,   234,   235,   152,
     103,   107,   111,   229,   230,   210,   103,   103,    31,    96,
     105,   113,   114,   140,   142,   143,   149,   150,   198,   199,
     200,   120,    75,    99,   100,   101,   102,   104,   107,   108,
     109,   110,   112,   225,   233,   236,   238,   239,   240,     4,
     160,   103,   118,   170,   141,     4,   143,    98,    79,   144,
     145,   200,   233,    75,    73,   132,     4,    26,    27,   153,
     154,   155,   156,   157,    87,    88,    89,    90,    91,    92,
      93,    94,    95,   165,   166,   176,   178,   118,   240,   165,
     108,   177,   178,     4,   111,   233,   237,   238,   210,   103,
      25,   155,   121,     4,    73,   240,     4,   103,   111,   231,
     232,   233,    73,    96,   146,   225,   226,   227,   228,   232,
     238,   103,   103,   122,   161,   166,   178,   171,   118,   178,
     119,    73,     4,     4,     4,   162,   162,   107,   234,   228,
       5,   105,   113,   114,   163,   167,   195,   196,   197,   167,
     120,   164,     4,     4,    74,   197,   198,   201,    74,   210,
       5,     7,     8,     9,    12,    13,    17,    18,    22,    23,
      30,    31,    34,    64,    66,    67,    68,    76,    80,    82,
     103,   107,   111,   140,   172,   185,   187,   191,   203,   212,
     213,   214,   215,   216,   218,   223,   225,   103,   207,   239,
     231,   231,   233,   233,   233,   225,   208,   103,   103,   204,
     205,   206,   101,   107,   241,   233,   121,   233,   121,   176,
     226,     4,     4,   121,   219,    35,    36,    37,    38,    39,
      40,    41,    42,    44,    45,    46,    47,    48,   115,   117,
     118,   119,   217,   210,     8,    57,    58,    59,    60,    61,
      62,    73,   224,     8,    73,   224,    73,   146,   210,   210,
     210,   118,   192,   193,     4,   188,   222,   225,   121,   233,
     233,   233,   233,   233,   233,   233,   233,   233,   233,   233,
     233,   233,    17,    18,    19,    20,    21,    64,    65,   107,
     111,   123,   124,   125,   209,   218,   225,   233,   234,   107,
     225,   230,   103,   231,   231,   233,   231,   231,   233,   233,
     103,   202,   103,   103,   233,   194,   233,   194,   173,   189,
      73,   122,    10,    11,   220,   221,   233,   211,   233,   241,
     103,   146,   233,   233,   233,   103,    43,    49,    50,    56,
      69,    70,    71,    72,   116,   119,   124,   125,   126,   127,
     128,   129,   130,   131,   120,     8,     8,    73,   119,    73,
     118,   118,    73,   122,   122,   180,     4,    11,    67,    81,
      83,   186,   190,   225,   118,   225,   225,    73,   122,    73,
     119,    73,   119,    73,   233,   233,   233,   233,   233,   233,
     233,   233,   233,   234,   233,   233,   233,   233,   233,   233,
     233,   233,   118,   231,   231,   233,   234,   103,   240,   240,
     233,     9,    10,    11,    86,   175,   181,   225,   233,     4,
     216,   225,   221,   233,   234,   233,   234,   103,   120,   233,
     120,   233,   225,   225,   233,    78,    84,    85,   179,     4,
     121,   120,   120,     4,   233,   233,   107,   225,   174,   200,
     220,     4,    73,     4,     4,    73,     4,    73,   182,     4,
     122,   233,   233,   233,    30,    66,    77,   183,     4,     4,
       4,   184,   225,     4,   210,   103
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
#line 400 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 409 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 410 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 411 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 412 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 9:
#line 413 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 414 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 415 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 12:
#line 416 "imcc/imcc.y"
    { yyval.i = 0;  }
    break;

  case 13:
#line 417 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 422 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 428 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 16:
#line 436 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 17:
#line 437 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 18:
#line 441 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 19:
#line 442 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 22:
#line 450 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 451 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 452 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 25:
#line 453 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 26:
#line 454 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 28:
#line 458 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 29:
#line 460 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 30:
#line 463 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(interp, yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(interp, str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, cur_unit);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 31:
#line 469 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 33:
#line 477 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 34:
#line 479 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 37:
#line 494 "imcc/imcc.y"
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

  case 38:
#line 510 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 39:
#line 517 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 41:
#line 526 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 46:
#line 537 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 47:
#line 542 "imcc/imcc.y"
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

  case 48:
#line 556 "imcc/imcc.y"
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

  case 49:
#line 572 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 50:
#line 577 "imcc/imcc.y"
    {
          Instruction *i = iSUBROUTINE(cur_unit, yyvsp[0].sr);
          /*
           * $<sr>$ is the SymReg value of this action rule
           */
          i->r[1] = yyval.sr = mk_pcc_sub(interp, str_dup(i->r[0]->name), 0);
          add_namespace(interp, cur_unit);
        }
    break;

  case 51:
#line 585 "imcc/imcc.y"
    { yyvsp[-2].sr->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 52:
#line 587 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 591 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 54:
#line 592 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 55:
#line 593 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-6].sr, yyvsp[-1].sr);}
    break;

  case 56:
#line 597 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 57:
#line 598 "imcc/imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 58:
#line 602 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 59:
#line 603 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 60:
#line 604 "imcc/imcc.y"
    { yyval.t = yyvsp[-2].t; }
    break;

  case 61:
#line 605 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 62:
#line 606 "imcc/imcc.y"
    { yyval.t = P_NONE; }
    break;

  case 63:
#line 609 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 66:
#line 618 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 67:
#line 620 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(interp, yyvsp[0].s));
            i->r[1] = yyval.sr = mk_pcc_sub(interp, str_dup(i->r[0]->name), 0);
            add_namespace(interp, cur_unit);

         }
    break;

  case 68:
#line 626 "imcc/imcc.y"
    { yyvsp[-2].sr->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 69:
#line 628 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 70:
#line 633 "imcc/imcc.y"
    {
            char name[128];
            SymReg * r, *r1;
            Instruction *i;

            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
            yyval.sr = r = mk_pcc_sub(interp, str_dup(name), 0);
            r->pcc_sub->pragma = yyvsp[-1].t;
            /* this mid rule action has the semantic value of the
             * sub SymReg.
             * This is used below to append args & results
             */
            current_call = i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB;
            /*
             * if we are inside a pcc_sub mark the sub as doing a
             * sub call; the sub is in r1 of the first ins
             */
            r1 = cur_unit->instructions->r[1];
            if (r1 && r1->pcc_sub)
                r1->pcc_sub->calls_a_sub |= 1;
         }
    break;

  case 71:
#line 660 "imcc/imcc.y"
    { yyval.i = 0; current_call = NULL; }
    break;

  case 72:
#line 664 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 0; }
    break;

  case 73:
#line 665 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 1; }
    break;

  case 74:
#line 669 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 75:
#line 671 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 76:
#line 674 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 77:
#line 675 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 78:
#line 679 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 79:
#line 680 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 80:
#line 681 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 82:
#line 685 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 83:
#line 686 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 84:
#line 687 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 85:
#line 688 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 86:
#line 689 "imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 87:
#line 690 "imcc/imcc.y"
    {  yyval.t = P_METHOD | P_NONE ; }
    break;

  case 88:
#line 695 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 89:
#line 700 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 90:
#line 702 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-1].sr);
            current_call->r[0]->pcc_sub->nci = 1;
         }
    break;

  case 91:
#line 707 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 92:
#line 709 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 93:
#line 711 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 94:
#line 715 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 95:
#line 721 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 96:
#line 722 "imcc/imcc.y"
    {  add_pcc_arg(current_call->r[0], yyvsp[-1].sr);}
    break;

  case 97:
#line 726 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 98:
#line 727 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 99:
#line 730 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 100:
#line 734 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 101:
#line 735 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 102:
#line 740 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 103:
#line 741 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 104:
#line 742 "imcc/imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 105:
#line 746 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 106:
#line 747 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 109:
#line 757 "imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 110:
#line 760 "imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 111:
#line 761 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 112:
#line 767 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 113:
#line 769 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 114:
#line 771 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 115:
#line 775 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 116:
#line 776 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 117:
#line 781 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 118:
#line 786 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 119:
#line 788 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 120:
#line 793 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 121:
#line 797 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 122:
#line 798 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 123:
#line 799 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 126:
#line 817 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 127:
#line 822 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 128:
#line 823 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 129:
#line 824 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 130:
#line 825 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 131:
#line 829 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 135:
#line 839 "imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 136:
#line 846 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 137:
#line 850 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 138:
#line 858 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 141:
#line 868 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 142:
#line 869 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 143:
#line 870 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 144:
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

  case 145:
#line 883 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 146:
#line 884 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 148:
#line 886 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 149:
#line 887 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 150:
#line 888 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 151:
#line 889 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
                                1, mk_ident(interp, yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 152:
#line 891 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 153:
#line 892 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 154:
#line 893 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 155:
#line 894 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 156:
#line 895 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 157:
#line 896 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 158:
#line 897 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 159:
#line 899 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 160:
#line 901 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 161:
#line 903 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 162:
#line 904 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 164:
#line 906 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 165:
#line 910 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 166:
#line 911 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 167:
#line 912 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 168:
#line 913 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 169:
#line 917 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 170:
#line 918 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 171:
#line 919 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 172:
#line 920 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 173:
#line 921 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 174:
#line 922 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 175:
#line 927 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 176:
#line 937 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 177:
#line 938 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 178:
#line 939 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 179:
#line 940 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 180:
#line 941 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 181:
#line 942 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 182:
#line 943 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 183:
#line 944 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 945 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 185:
#line 946 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 947 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 187:
#line 948 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 188:
#line 950 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 189:
#line 952 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 954 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 191:
#line 956 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 958 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 193:
#line 960 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 962 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 195:
#line 964 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 966 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 968 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 198:
#line 970 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 972 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 200:
#line 974 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 201:
#line 976 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 202:
#line 978 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 980 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 982 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 205:
#line 984 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                  mk_sub_address(interp, yyvsp[0].s), NULL, 1); }
    break;

  case 206:
#line 987 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(interp, yyvsp[-2].s),
                                           mk_sub_address(interp, yyvsp[0].s), 1); }
    break;

  case 207:
#line 994 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 208:
#line 997 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 209:
#line 999 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 210:
#line 1003 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 211:
#line 1005 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 1007 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 213:
#line 1010 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 214:
#line 1016 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 215:
#line 1020 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 218:
#line 1030 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1032 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 220:
#line 1034 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 221:
#line 1036 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 222:
#line 1038 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 223:
#line 1040 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 1042 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 1044 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 226:
#line 1046 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 227:
#line 1048 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 228:
#line 1050 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 229:
#line 1052 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 230:
#line 1054 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 231:
#line 1059 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 232:
#line 1065 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 233:
#line 1066 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 234:
#line 1067 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 235:
#line 1072 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 236:
#line 1073 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 237:
#line 1074 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 238:
#line 1077 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 239:
#line 1078 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 240:
#line 1083 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 241:
#line 1088 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 242:
#line 1092 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 243:
#line 1093 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 244:
#line 1094 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 245:
#line 1099 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 246:
#line 1100 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 247:
#line 1104 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 248:
#line 1108 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 249:
#line 1109 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 250:
#line 1114 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 251:
#line 1116 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 252:
#line 1118 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 253:
#line 1120 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 254:
#line 1122 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 255:
#line 1124 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 256:
#line 1128 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 257:
#line 1129 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 258:
#line 1130 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 259:
#line 1131 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 260:
#line 1132 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 261:
#line 1133 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 264:
#line 1142 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 265:
#line 1143 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 266:
#line 1147 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 268:
#line 1152 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 269:
#line 1154 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 271:
#line 1162 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 272:
#line 1166 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 273:
#line 1167 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 274:
#line 1171 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 275:
#line 1172 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 280:
#line 1185 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 281:
#line 1186 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 282:
#line 1190 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 283:
#line 1192 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 284:
#line 1193 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 285:
#line 1194 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 286:
#line 1198 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 287:
#line 1204 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 288:
#line 1206 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 289:
#line 1207 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 290:
#line 1211 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 291:
#line 1212 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 292:
#line 1213 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 293:
#line 1214 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 294:
#line 1215 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 295:
#line 1219 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 296:
#line 1220 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 297:
#line 1221 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 298:
#line 1222 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 299:
#line 1226 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 300:
#line 1227 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3517 "imcc/imcparser.c"

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


#line 1232 "imcc/imcc.y"



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

