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
#line 321 "imcc/imcc.y"
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
#define YYFINAL  35
#define YYLAST   622

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  133
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  111
/* YYNRULES -- Number of rules. */
#define YYNRULES  308
/* YYNRULES -- Number of states. */
#define YYNSTATES  515

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
     165,   169,   171,   173,   178,   179,   183,   185,   187,   189,
     191,   193,   195,   196,   198,   199,   200,   201,   212,   213,
     224,   225,   228,   229,   233,   235,   237,   238,   242,   244,
     246,   248,   250,   252,   254,   256,   258,   264,   268,   272,
     276,   280,   286,   292,   293,   297,   300,   303,   306,   307,
     311,   314,   315,   320,   322,   324,   326,   328,   329,   335,
     337,   338,   341,   345,   348,   351,   352,   358,   359,   365,
     366,   368,   372,   374,   377,   378,   381,   384,   386,   388,
     389,   391,   394,   396,   398,   402,   404,   408,   410,   412,
     415,   418,   419,   424,   425,   432,   434,   435,   442,   443,
     448,   451,   454,   457,   460,   463,   466,   467,   471,   474,
     476,   478,   480,   481,   483,   485,   487,   489,   491,   493,
     495,   497,   499,   501,   503,   507,   512,   517,   522,   528,
     534,   540,   546,   552,   558,   564,   570,   576,   582,   588,
     594,   600,   606,   612,   618,   624,   631,   638,   645,   653,
     658,   663,   670,   678,   683,   690,   695,   700,   705,   710,
     717,   725,   729,   730,   740,   742,   744,   748,   752,   756,
     760,   764,   768,   772,   776,   780,   784,   788,   792,   796,
     801,   803,   805,   807,   811,   815,   819,   821,   823,   824,
     830,   831,   835,   837,   839,   842,   845,   849,   851,   858,
     865,   870,   875,   880,   885,   887,   889,   891,   893,   895,
     897,   899,   901,   902,   904,   908,   910,   912,   917,   919,
     921,   923,   925,   927,   929,   931,   933,   935,   937,   938,
     941,   943,   947,   948,   953,   955,   959,   962,   965,   967,
     969,   971,   973,   975,   977,   979,   981,   983,   985
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     134,     0,    -1,   135,    -1,   136,    -1,   135,   136,    -1,
     151,    -1,   150,    -1,   138,    -1,   137,    -1,   158,    -1,
     170,    -1,   147,    -1,   105,     4,    -1,     4,    -1,    63,
     212,   103,    -1,    63,   212,   103,   118,   242,    -1,    -1,
      31,   139,   212,   103,   118,   242,    -1,    -1,    31,   141,
     108,   234,   118,   107,    -1,   143,    -1,   142,   143,    -1,
     200,   144,     4,    -1,   105,     4,    -1,   114,    -1,   113,
      -1,   150,    -1,   140,    -1,    -1,   145,   111,   146,    -1,
      79,   179,    96,    -1,    -1,   228,    -1,    -1,    97,   148,
     149,    98,    -1,    -1,   142,    -1,    22,   119,   236,   120,
      -1,    -1,    24,   103,   152,     4,   153,    25,    -1,   154,
      -1,    -1,   155,    -1,   154,   155,    -1,   156,    -1,   157,
      -1,     4,    -1,    26,   212,   103,     4,    -1,    27,   103,
     103,     4,    -1,    -1,    -1,    -1,    28,   159,   231,   160,
     165,     4,   161,   162,   169,    74,    -1,    -1,     4,    -1,
     162,   163,     4,    -1,    -1,     5,   164,   212,   103,    -1,
      -1,   165,    73,   180,    -1,   165,    73,   166,    -1,   180,
      -1,   166,    -1,    95,   121,   167,   122,    -1,    -1,   167,
      73,   168,    -1,   168,    -1,    51,    -1,    52,    -1,    54,
      -1,    53,    -1,   103,    -1,    -1,   197,    -1,    -1,    -1,
      -1,    79,   171,   103,   172,   165,     4,   173,   162,   169,
      74,    -1,    -1,    76,   178,     4,   175,   182,   177,   181,
     176,   184,    77,    -1,    -1,   202,     4,    -1,    -1,    86,
     235,     4,    -1,    87,    -1,    88,    -1,    -1,   179,    73,
     180,    -1,   180,    -1,   178,    -1,    90,    -1,    89,    -1,
      91,    -1,    92,    -1,    94,    -1,    93,    -1,    78,   235,
      73,   235,     4,    -1,    78,   235,     4,    -1,    84,   235,
       4,    -1,    85,   227,     4,    -1,    85,   107,     4,    -1,
      85,   227,    73,   235,     4,    -1,    85,   107,    73,   235,
       4,    -1,    -1,   182,   183,     4,    -1,     9,   235,    -1,
      11,   227,    -1,    10,   227,    -1,    -1,   184,   185,     4,
      -1,    66,   227,    -1,    -1,    30,   186,   212,   103,    -1,
      80,    -1,    82,    -1,    81,    -1,    83,    -1,    -1,   187,
       4,   190,   191,   188,    -1,   193,    -1,    -1,   191,     4,
      -1,   191,   192,     4,    -1,    67,   235,    -1,    11,   227,
      -1,    -1,    67,   121,   194,   196,   122,    -1,    -1,    68,
     121,   195,   196,   122,    -1,    -1,   235,    -1,   196,    73,
     235,    -1,   199,    -1,   197,   199,    -1,    -1,   198,   203,
      -1,   105,     4,    -1,   114,    -1,   113,    -1,    -1,   201,
      -1,   201,   202,    -1,   202,    -1,    96,    -1,   200,   205,
       4,    -1,   103,    -1,   204,    73,   103,    -1,   214,    -1,
     225,    -1,    22,   103,    -1,    23,   103,    -1,    -1,    30,
     206,   212,   204,    -1,    -1,    31,   207,   212,   103,   118,
     242,    -1,   140,    -1,    -1,    34,   208,   212,   103,   118,
     242,    -1,    -1,     5,   209,   212,   103,    -1,     5,   241,
      -1,    66,   235,    -1,     9,   235,    -1,    67,   235,    -1,
       7,   233,    -1,     8,   233,    -1,    -1,    18,   210,   146,
      -1,   111,   228,    -1,   220,    -1,   174,    -1,   189,    -1,
      -1,    18,    -1,    19,    -1,    20,    -1,    21,    -1,    51,
      -1,    52,    -1,    53,    -1,    54,    -1,    55,    -1,   213,
      -1,   103,    -1,   227,   118,   235,    -1,   227,   118,   123,
     235,    -1,   227,   118,   124,   235,    -1,   227,   118,   125,
     235,    -1,   227,   118,   235,   126,   235,    -1,   227,   118,
     235,   124,   235,    -1,   227,   118,   235,   127,   235,    -1,
     227,   118,   235,    69,   235,    -1,   227,   118,   235,   128,
     235,    -1,   227,   118,   235,    43,   235,    -1,   227,   118,
     235,   129,   235,    -1,   227,   118,   235,   116,   235,    -1,
     227,   118,   235,    49,   235,    -1,   227,   118,   235,    50,
     235,    -1,   227,   118,   235,    70,   235,    -1,   227,   118,
     235,    71,   235,    -1,   227,   118,   235,    72,   235,    -1,
     227,   118,   235,    56,   235,    -1,   227,   118,   235,   130,
     235,    -1,   227,   118,   235,   131,   235,    -1,   227,   118,
     235,   125,   235,    -1,   227,   118,   235,   119,   236,   120,
      -1,   227,   119,   236,   120,   118,   235,    -1,   227,   118,
      17,   213,    73,   235,    -1,   227,   118,    17,   213,   119,
     236,   120,    -1,   227,   118,    17,   213,    -1,   227,   118,
      17,   235,    -1,   227,   118,    17,   235,    73,   235,    -1,
     227,   118,    17,   235,   119,   236,   120,    -1,   227,   118,
     211,   103,    -1,   227,   118,   211,   103,    73,   103,    -1,
     227,   118,    65,   103,    -1,   227,   118,    64,   243,    -1,
      64,   243,   118,   235,    -1,    17,   227,    73,   235,    -1,
      17,   227,    73,   235,    73,   235,    -1,    17,   227,    73,
     235,   119,   236,   120,    -1,   227,   118,   220,    -1,    -1,
     215,   121,   224,   122,   118,   218,   121,   222,   122,    -1,
     216,    -1,   217,    -1,   227,    35,   235,    -1,   227,    36,
     235,    -1,   227,    37,   235,    -1,   227,    38,   235,    -1,
     227,    45,   235,    -1,   227,    44,   235,    -1,   227,    39,
     235,    -1,   227,    40,   235,    -1,   227,    41,   235,    -1,
     227,    42,   235,    -1,   227,    46,   235,    -1,   227,    47,
     235,    -1,   227,    48,   235,    -1,   227,   118,   111,   146,
      -1,   103,    -1,   107,    -1,   227,    -1,   227,   219,   232,
      -1,   227,   219,   107,    -1,   227,   219,   227,    -1,   117,
      -1,   115,    -1,    -1,   218,   221,   121,   222,   122,    -1,
      -1,   222,    73,   223,    -1,   223,    -1,   235,    -1,    11,
     227,    -1,    10,   227,    -1,   224,    73,   227,    -1,   227,
      -1,    12,   235,   226,   235,     8,   233,    -1,    13,   235,
     226,   235,     8,   233,    -1,    12,   235,     8,   233,    -1,
      13,   235,     8,   233,    -1,    12,   235,    73,   233,    -1,
      13,   235,    73,   233,    -1,    57,    -1,    58,    -1,    59,
      -1,    60,    -1,    61,    -1,    62,    -1,   112,    -1,   241,
      -1,    -1,   229,    -1,   229,    73,   230,    -1,   230,    -1,
     234,    -1,   227,   119,   236,   120,    -1,   232,    -1,   107,
      -1,   103,    -1,   111,    -1,   103,    -1,   111,    -1,   233,
      -1,   235,    -1,   227,    -1,   242,    -1,    -1,   237,   238,
      -1,   240,    -1,   238,   132,   240,    -1,    -1,   238,    73,
     239,   240,    -1,   235,    -1,   235,    75,   235,    -1,    75,
     235,    -1,   235,    75,    -1,    99,    -1,   100,    -1,   101,
      -1,   102,    -1,   104,    -1,   108,    -1,   109,    -1,   107,
      -1,   110,    -1,   101,    -1,   107,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   402,   402,   406,   408,   411,   413,   414,   415,   416,
     417,   418,   419,   420,   423,   430,   439,   438,   444,   443,
     447,   449,   452,   454,   455,   456,   457,   458,   461,   461,
     465,   472,   475,   480,   479,   490,   492,   495,   513,   511,
     527,   529,   532,   534,   537,   539,   540,   543,   557,   575,
     580,   585,   573,   590,   592,   593,   597,   596,   601,   603,
     604,   605,   606,   609,   612,   614,   615,   618,   620,   621,
     622,   623,   635,   637,   641,   643,   649,   640,   656,   654,
     686,   688,   691,   693,   696,   698,   701,   703,   704,   707,
     708,   709,   710,   711,   712,   713,   716,   722,   724,   729,
     731,   733,   737,   743,   745,   748,   750,   753,   756,   758,
     761,   764,   764,   768,   770,   773,   775,   780,   778,   784,
     789,   791,   793,   797,   799,   804,   802,   811,   810,   819,
     821,   822,   826,   828,   839,   843,   846,   847,   848,   851,
     853,   856,   858,   861,   867,   872,   880,   888,   890,   891,
     892,   893,   893,   906,   906,   908,   909,   909,   911,   911,
     914,   915,   916,   917,   918,   919,   920,   920,   923,   926,
     927,   928,   929,   932,   934,   935,   936,   939,   941,   942,
     943,   944,   945,   948,   959,   961,   962,   963,   964,   965,
     966,   967,   968,   969,   970,   971,   972,   974,   976,   978,
     980,   982,   984,   986,   988,   990,   992,   994,   996,   998,
    1000,  1002,  1004,  1006,  1009,  1016,  1019,  1021,  1025,  1027,
    1029,  1032,  1039,  1038,  1047,  1048,  1051,  1054,  1056,  1058,
    1060,  1062,  1064,  1066,  1068,  1070,  1072,  1074,  1076,  1080,
    1088,  1089,  1090,  1095,  1096,  1097,  1100,  1101,  1106,  1104,
    1114,  1116,  1117,  1120,  1123,  1126,  1130,  1132,  1135,  1138,
    1140,  1142,  1144,  1146,  1150,  1152,  1153,  1154,  1155,  1156,
    1159,  1161,  1164,  1166,  1169,  1171,  1174,  1176,  1183,  1185,
    1188,  1190,  1193,  1195,  1198,  1200,  1203,  1205,  1208,  1208,
    1212,  1214,  1216,  1216,  1220,  1226,  1229,  1230,  1233,  1235,
    1236,  1237,  1238,  1241,  1243,  1244,  1245,  1248,  1250
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
  "multi_types", "multi_type", "sub_body", "pcc_sub", "@10", "@11", "@12", 
  "pcc_sub_call", "@13", "opt_label", "opt_invocant", "pcc_proto", 
  "pcc_sub_proto", "proto", "pcc_call", "pcc_args", "pcc_arg", 
  "pcc_results", "pcc_result", "@14", "begin_ret_or_yield", 
  "end_ret_or_yield", "pcc_ret", "@15", "pcc_returns", "pcc_return", 
  "pcc_return_many", "@16", "@17", "var_returns", "statements", 
  "helper_clear_state", "statement", "labels", "_labels", "label", 
  "instruction", "id_list", "labeled_inst", "@18", "@19", "@20", "@21", 
  "@22", "newsub", "type", "classname", "assignment", "@23", "op_assign", 
  "func_assign", "the_sub", "ptr", "sub_call", "@24", "arglist", "arg", 
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
     165,   165,   165,   166,   167,   167,   167,   168,   168,   168,
     168,   168,   169,   169,   171,   172,   173,   170,   175,   174,
     176,   176,   177,   177,   178,   178,   179,   179,   179,   180,
     180,   180,   180,   180,   180,   180,   181,   181,   181,   181,
     181,   181,   181,   182,   182,   183,   183,   183,   184,   184,
     185,   186,   185,   187,   187,   188,   188,   190,   189,   189,
     191,   191,   191,   192,   192,   194,   193,   195,   193,   196,
     196,   196,   197,   197,   198,   199,   199,   199,   199,   200,
     200,   201,   201,   202,   203,   204,   204,   205,   205,   205,
     205,   206,   205,   207,   205,   205,   208,   205,   209,   205,
     205,   205,   205,   205,   205,   205,   210,   205,   205,   205,
     205,   205,   205,   211,   211,   211,   211,   212,   212,   212,
     212,   212,   212,   213,   214,   214,   214,   214,   214,   214,
     214,   214,   214,   214,   214,   214,   214,   214,   214,   214,
     214,   214,   214,   214,   214,   214,   214,   214,   214,   214,
     214,   214,   214,   214,   214,   214,   214,   214,   214,   214,
     214,   214,   215,   214,   214,   214,   216,   216,   216,   216,
     216,   216,   216,   216,   216,   216,   216,   216,   216,   217,
     218,   218,   218,   218,   218,   218,   219,   219,   221,   220,
     222,   222,   222,   223,   223,   223,   224,   224,   225,   225,
     225,   225,   225,   225,   226,   226,   226,   226,   226,   226,
     227,   227,   228,   228,   229,   229,   230,   230,   231,   231,
     232,   232,   233,   233,   234,   234,   235,   235,   237,   236,
     238,   238,   239,   238,   240,   240,   240,   240,   241,   241,
     241,   241,   241,   242,   242,   242,   242,   243,   243
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
       3,     1,     1,     4,     0,     3,     1,     1,     1,     1,
       1,     1,     0,     1,     0,     0,     0,    10,     0,    10,
       0,     2,     0,     3,     1,     1,     0,     3,     1,     1,
       1,     1,     1,     1,     1,     1,     5,     3,     3,     3,
       3,     5,     5,     0,     3,     2,     2,     2,     0,     3,
       2,     0,     4,     1,     1,     1,     1,     0,     5,     1,
       0,     2,     3,     2,     2,     0,     5,     0,     5,     0,
       1,     3,     1,     2,     0,     2,     2,     1,     1,     0,
       1,     2,     1,     1,     3,     1,     3,     1,     1,     2,
       2,     0,     4,     0,     6,     1,     0,     6,     0,     4,
       2,     2,     2,     2,     2,     2,     0,     3,     2,     1,
       1,     1,     0,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     3,     4,     4,     4,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     6,     6,     6,     7,     4,
       4,     6,     7,     4,     6,     4,     4,     4,     4,     6,
       7,     3,     0,     9,     1,     1,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     4,
       1,     1,     1,     3,     3,     3,     1,     1,     0,     5,
       0,     3,     1,     1,     2,     2,     3,     1,     6,     6,
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
       0,    13,     0,     0,    49,    16,     0,    74,    33,     0,
       0,     2,     3,     8,     7,    11,     6,     5,     9,    10,
     288,    38,     0,     0,   177,   178,   179,   180,   181,   183,
       0,   182,     0,   139,    12,     1,     4,     0,     0,     0,
     280,   279,   281,    50,   278,     0,    14,    75,    18,   143,
       0,    25,    24,    27,   139,    20,     0,    26,    28,   140,
     142,    37,     0,   298,   299,   300,   301,   302,   305,   303,
     304,   306,   270,   286,   294,   289,   290,   271,   287,    41,
      58,     0,     0,    58,     0,    23,    21,    34,    86,     0,
       0,   141,   296,   297,   292,     0,    46,     0,     0,     0,
      40,    42,    44,    45,    84,    85,    91,    90,    92,    93,
      95,    94,     0,     0,    62,    89,    61,     0,    15,     0,
       0,     0,    88,    22,   272,   295,     0,   291,     0,     0,
      39,    43,    64,    51,     0,    17,    76,   282,   283,   284,
       0,   285,     0,    30,    29,   286,    32,   273,   275,   276,
     293,     0,     0,    67,    68,    70,    69,    71,     0,    66,
      53,    60,    59,    53,     0,    87,   288,     0,    47,    48,
       0,    63,    54,   134,   134,    19,     0,   274,    65,    56,
       0,   138,   137,     0,     0,   134,   139,   132,     0,   277,
       0,   136,    55,    52,   133,   172,   135,    77,     0,   158,
       0,     0,     0,     0,     0,     0,   166,     0,     0,   151,
     153,   156,     0,     0,     0,     0,     0,   113,   114,   240,
     241,   272,   155,   170,     0,   171,   119,     0,   147,     0,
     224,   225,   248,   169,   148,   242,    57,     0,   160,   164,
     165,   162,     0,     0,     0,   272,   149,   150,     0,     0,
       0,   307,   308,     0,   161,   125,   163,   127,     0,   168,
     117,   144,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   247,   246,     0,
     288,     0,     0,     0,   264,   265,   266,   267,   268,   269,
       0,     0,     0,     0,     0,     0,   167,     0,     0,     0,
       0,   129,   129,    78,   120,     0,   257,   250,   226,   227,
     228,   229,   232,   233,   234,   235,   231,   230,   236,   237,
     238,     0,   173,   174,   175,   176,     0,     0,   305,   272,
       0,     0,     0,     0,   221,   286,   184,     0,   244,   245,
     243,   159,   260,   262,     0,   261,   263,     0,   218,   145,
     152,     0,     0,   217,     0,   130,     0,   103,     0,     0,
       0,     0,     0,     0,   252,   253,   209,   210,   216,   215,
     239,   185,   186,   187,   213,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   288,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   288,     0,     0,
       0,     0,   126,   128,    82,   121,     0,     0,   115,   116,
     118,     0,   256,     0,   255,   254,     0,   249,     0,   288,
       0,   288,     0,   193,   196,   197,   201,   191,   198,   199,
     200,   195,     0,   189,   204,   188,   190,   192,   194,   202,
     203,     0,   258,   259,   219,     0,   146,   154,   157,   131,
       0,     0,     0,     0,     0,     0,   124,   123,   122,     0,
     242,   251,   207,     0,   211,     0,   214,   205,   206,   220,
     105,   107,   106,     0,     0,     0,     0,    80,   104,   250,
     208,   212,    83,     0,     0,     0,     0,   108,     0,     0,
      97,     0,    98,   100,     0,    99,     0,     0,    81,   223,
       0,     0,     0,   111,     0,    79,     0,    96,   102,   101,
       0,   110,   109,     0,   112
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    10,    11,    12,    13,    14,    23,    53,    84,    54,
      55,    89,    90,   144,    15,    33,    56,    16,    17,    39,
      99,   100,   101,   102,   103,    18,    22,    80,   160,   173,
     183,   190,   113,   114,   158,   159,   184,    19,    32,    83,
     163,   223,   357,   487,   454,   115,   121,   116,   477,   404,
     455,   497,   506,   510,   224,   410,   225,   304,   358,   411,
     226,   301,   302,   354,   185,   186,   187,    58,    59,    60,
     196,   350,   227,   248,   249,   250,   237,   245,   333,    30,
      31,   228,   229,   230,   231,   232,   281,   233,   263,   363,
     364,   305,   234,   291,    73,   146,   147,   148,    43,    44,
     139,   149,   141,    37,    38,    75,   126,    76,    77,    78,
     253
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -237
static const short yypact[] =
{
       1,  -237,  -103,   -59,  -237,  -237,    82,  -237,  -237,    41,
      48,     1,  -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,
    -237,  -237,   -70,    82,  -237,  -237,  -237,  -237,  -237,  -237,
      29,  -237,    38,   -11,  -237,  -237,  -237,    30,   301,   104,
    -237,  -237,  -237,  -237,  -237,    55,    43,  -237,  -237,  -237,
     159,  -237,  -237,  -237,   221,  -237,    73,  -237,     2,    77,
    -237,  -237,   471,  -237,  -237,  -237,  -237,  -237,  -237,  -237,
    -237,  -237,  -237,  -237,   102,   -56,  -237,  -237,  -237,    23,
     527,    60,    96,   527,    74,  -237,  -237,  -237,   201,   182,
      76,  -237,  -237,   471,  -237,   301,  -237,    82,    86,   168,
      23,  -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,
    -237,  -237,    92,     6,  -237,  -237,  -237,    96,  -237,     9,
     443,   -43,  -237,  -237,   443,  -237,   301,  -237,   113,   114,
    -237,  -237,    15,  -237,   527,  -237,  -237,  -237,  -237,  -237,
     100,  -237,   201,  -237,  -237,   103,  -237,   148,  -237,  -237,
    -237,   219,   220,  -237,  -237,  -237,  -237,  -237,   -51,  -237,
     224,  -237,  -237,   224,   137,  -237,  -237,   443,  -237,  -237,
      15,  -237,  -237,    -4,    -4,  -237,   126,  -237,  -237,  -237,
     243,  -237,  -237,   247,   179,    78,    77,  -237,   180,  -237,
      82,  -237,  -237,  -237,  -237,   108,  -237,  -237,   152,    95,
     -64,   -64,   471,   471,   471,   364,  -237,   153,   156,  -237,
     155,  -237,   -61,   471,   428,   143,    56,  -237,  -237,  -237,
    -237,   443,  -237,  -237,   261,  -237,  -237,   271,  -237,   158,
    -237,  -237,  -237,  -237,  -237,   478,  -237,    82,  -237,  -237,
    -237,  -237,   242,   250,   203,   443,  -237,  -237,    82,    82,
      82,  -237,  -237,   165,  -237,  -237,  -237,  -237,   281,  -237,
    -237,  -237,   364,   184,   471,   471,   471,   471,   471,   471,
     471,   471,   471,   471,   471,   471,   471,  -237,  -237,   370,
    -237,   487,   210,   -64,  -237,  -237,  -237,  -237,  -237,  -237,
     -64,   471,   -64,   -64,   471,   471,  -237,   211,   213,   215,
     471,   471,   471,  -237,  -237,   -49,  -237,    47,  -237,  -237,
    -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,
    -237,   457,  -237,  -237,  -237,  -237,   -61,   225,   185,   443,
     471,   471,   471,   226,  -237,    45,   381,   202,  -237,  -237,
    -237,  -237,  -237,  -237,   316,  -237,  -237,   319,     4,  -237,
     257,   218,   222,  -237,   -18,  -237,   -17,  -237,     8,   364,
     232,   364,   364,   -10,  -237,  -237,    34,    46,  -237,  -237,
    -237,  -237,  -237,  -237,   258,   471,   471,   471,   471,   471,
     471,   471,   471,   471,  -237,   471,   471,   471,   471,   471,
     471,   471,   471,   241,   -64,   -64,   471,  -237,   230,    96,
      96,   471,  -237,  -237,    25,  -237,   364,   471,  -237,  -237,
    -237,   333,  -237,   501,  -237,  -237,    47,  -237,   471,  -237,
     471,  -237,   235,  -237,  -237,  -237,  -237,  -237,  -237,  -237,
    -237,  -237,   240,  -237,  -237,  -237,  -237,  -237,  -237,  -237,
    -237,   471,  -237,  -237,  -237,   244,  -237,  -237,  -237,  -237,
     471,   364,   364,   471,    44,   335,  -237,  -237,  -237,   245,
     -55,  -237,  -237,   248,  -237,   249,  -237,  -237,  -237,  -237,
    -237,  -237,  -237,   357,   471,   471,   170,    77,  -237,    47,
    -237,  -237,  -237,    10,   359,    11,    22,  -237,   361,     5,
    -237,   471,  -237,  -237,   471,  -237,   471,   -12,  -237,  -237,
     368,   371,   373,  -237,   364,  -237,   374,  -237,  -237,  -237,
      82,  -237,  -237,   276,  -237
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -237,  -237,  -237,   363,  -237,  -237,  -237,   186,  -237,  -237,
     326,  -237,  -237,  -236,  -237,  -237,  -237,    18,  -237,  -237,
    -237,  -237,   283,  -237,  -237,  -237,  -237,  -237,  -237,   229,
    -237,  -237,   302,   259,  -237,   227,   238,  -237,  -237,  -237,
    -237,  -237,  -237,  -237,  -237,   178,  -237,   -46,  -237,  -237,
    -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,
    -237,  -237,  -237,    94,  -237,  -237,   214,   212,  -237,   -57,
    -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,   -23,
      83,  -237,  -237,  -237,  -237,    -7,  -237,   135,  -237,   -62,
      -1,  -237,  -237,   175,   -81,   200,  -237,   255,  -237,   144,
    -193,   306,   -34,  -135,  -237,  -237,  -237,   -74,   228,   -79,
     106
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -243
static const short yytable[] =
{
      45,   179,    91,   118,    74,     1,   -31,   239,   240,   296,
     133,     2,   405,   136,   490,   493,    20,    94,   503,   406,
      48,   127,   170,     2,   359,     3,   495,    96,    92,     4,
     142,   176,     5,    40,   450,   451,   452,    41,   135,   137,
     251,    42,   122,   145,    21,    34,   252,   138,    35,    97,
      98,    57,   150,   143,   504,   401,   401,   361,   362,   125,
     277,    74,   278,   416,     6,   505,   153,   154,   155,   156,
     -72,   171,    57,   360,   128,   407,    95,   396,   416,   134,
       7,    88,   134,   491,   494,    49,   145,   -35,   162,   408,
     342,   409,    74,   370,    50,   496,   165,   343,     8,   345,
     346,   180,    51,    52,   402,   403,     9,   418,    79,   181,
     182,   453,   417,   199,   235,   200,   201,   202,   157,   420,
     203,   204,   474,   397,   244,   205,   206,   499,   475,   476,
     207,   208,    46,    24,    25,    26,    27,    28,   209,   210,
     145,    47,   211,   104,   105,   337,    63,    64,    65,    66,
      61,    67,   -73,   419,    68,    69,    70,    71,    81,    72,
     277,    82,   278,    85,   145,   421,  -242,   198,   241,   242,
     243,    87,   212,    49,   213,   214,   215,    93,   117,   254,
     256,   306,   120,   180,   216,    29,   123,   124,   217,   129,
     218,   181,   182,   130,    63,    64,    65,    66,   335,    67,
     339,   442,   443,    68,    69,    70,    71,    63,    64,    65,
      66,   219,    67,   132,   282,   220,   151,   152,   164,   221,
      72,   167,   166,   168,   169,   297,   298,   299,   172,  -222,
     308,   309,   310,   311,   312,   313,   314,   315,   316,   317,
     318,   319,   320,     2,   175,   336,   189,   191,   145,   432,
     283,   192,    48,   193,   197,   236,   246,   344,   292,   247,
     347,   348,   445,   -18,   257,   260,   353,   355,   355,    63,
      64,    65,    66,   365,    67,   261,   295,   485,   412,   262,
     414,   415,    72,   300,   463,   303,   465,   367,   104,   105,
     106,   107,   108,   109,   110,   111,   371,   372,   373,   284,
     285,   286,   287,   288,   289,   307,  -241,   284,   285,   286,
     287,   288,   289,   341,   349,   290,   351,    49,   352,   -36,
     447,   448,   393,   293,   394,   456,    50,   395,   369,   374,
     398,   422,   460,   446,    51,    52,   399,   458,   466,   478,
     400,   423,   424,   425,   426,   427,   428,   429,   430,   431,
     413,   433,   434,   435,   436,   437,   438,   439,   440,   441,
     467,   482,   444,   492,   469,   498,   479,   449,   480,   481,
     471,   472,   507,   457,    36,   508,    62,   509,   512,   514,
      86,   222,   365,   131,   462,   119,   464,   321,   322,   323,
     324,   325,   174,   161,   258,   486,   356,   178,   195,   194,
      63,    64,    65,    66,   366,    67,   459,   468,    68,    69,
      70,    71,   188,    72,   334,   461,   470,   489,   294,   473,
     488,   259,   177,   511,   375,   340,   140,   238,     0,     0,
     376,   377,   368,     0,   326,   327,     0,   378,     0,     0,
     483,   484,     0,     0,     0,   365,     0,     0,     0,     0,
     379,   380,   381,   382,     0,     0,     0,   500,     0,     0,
     501,     0,   502,    63,    64,    65,    66,     0,    67,    63,
      64,    65,    66,   219,    67,     0,    72,   328,    69,    70,
      71,   329,    72,     0,     0,     0,     0,   513,     0,     0,
       0,     0,     0,   330,   331,   332,     0,   383,     0,     0,
     384,     0,     0,     0,     0,   385,   386,   387,   388,   389,
     390,   391,   392,   264,   265,   266,   267,   268,   269,   270,
     271,     0,   272,   273,   274,   275,   276,    63,    64,    65,
      66,     0,    67,     0,     0,    68,    69,    70,    71,     0,
      72,     0,    63,    64,    65,    66,   137,    67,     0,   255,
      68,    69,    70,    71,   138,    72,    63,    64,    65,    66,
      29,    67,     0,     0,    68,    69,    70,    71,     0,    72,
      63,    64,    65,    66,     0,    67,     0,     0,    68,    69,
      70,    71,     0,    72,     0,     0,    63,    64,    65,    66,
      40,    67,     0,   277,   338,   278,   279,   280,    42,    72,
      63,    64,    65,    66,   219,    67,     0,     0,   220,     0,
       0,     0,     0,    72,   104,   105,   106,   107,   108,   109,
     110,   111,   112
};

static const short yycheck[] =
{
      23,     5,    59,    82,    38,     4,     4,   200,   201,   245,
       4,    22,     4,     4,     4,     4,   119,    73,    30,    11,
      31,    95,    73,    22,    73,    24,     4,     4,    62,    28,
      73,   166,    31,   103,     9,    10,    11,   107,   117,   103,
     101,   111,    88,   124,   103,     4,   107,   111,     0,    26,
      27,    33,   126,    96,    66,    73,    73,    10,    11,    93,
     115,    95,   117,    73,    63,    77,    51,    52,    53,    54,
      74,   122,    54,   122,    97,    67,   132,    73,    73,    73,
      79,    79,    73,    73,    73,    96,   167,    98,   134,    81,
     283,    83,   126,   329,   105,    73,   142,   290,    97,   292,
     293,   105,   113,   114,   122,   122,   105,    73,     4,   113,
     114,    86,   122,     5,   195,     7,     8,     9,   103,    73,
      12,    13,    78,   119,   205,    17,    18,   122,    84,    85,
      22,    23,   103,    51,    52,    53,    54,    55,    30,    31,
     221,   103,    34,    87,    88,   280,    99,   100,   101,   102,
     120,   104,    74,   119,   107,   108,   109,   110,   103,   112,
     115,   118,   117,     4,   245,   119,   121,   190,   202,   203,
     204,    98,    64,    96,    66,    67,    68,    75,   118,   213,
     214,   262,   108,   105,    76,   103,     4,   111,    80,   103,
      82,   113,   114,    25,    99,   100,   101,   102,   279,   104,
     281,   394,   395,   107,   108,   109,   110,    99,   100,   101,
     102,   103,   104,   121,   237,   107,   103,   103,   118,   111,
     112,    73,   119,     4,     4,   248,   249,   250,     4,   121,
     264,   265,   266,   267,   268,   269,   270,   271,   272,   273,
     274,   275,   276,    22,   107,   279,   120,     4,   329,   384,
       8,     4,    31,    74,    74,   103,   103,   291,     8,   103,
     294,   295,   397,   108,   121,     4,   300,   301,   302,    99,
     100,   101,   102,   307,   104,     4,    73,   107,   359,   121,
     361,   362,   112,   118,   419,     4,   421,   321,    87,    88,
      89,    90,    91,    92,    93,    94,   330,   331,   332,    57,
      58,    59,    60,    61,    62,   121,   121,    57,    58,    59,
      60,    61,    62,   103,   103,    73,   103,    96,   103,    98,
     399,   400,   120,    73,     8,   406,   105,     8,   103,   103,
      73,    73,   413,   103,   113,   114,   118,     4,   103,     4,
     118,   375,   376,   377,   378,   379,   380,   381,   382,   383,
     118,   385,   386,   387,   388,   389,   390,   391,   392,   118,
     120,     4,   396,     4,   120,     4,   121,   401,   120,   120,
     451,   452,     4,   407,    11,     4,    75,     4,     4,   103,
      54,   195,   416,   100,   418,    83,   420,    17,    18,    19,
      20,    21,   163,   134,   216,   476,   302,   170,   186,   185,
      99,   100,   101,   102,   321,   104,   413,   441,   107,   108,
     109,   110,   174,   112,   279,   416,   450,   479,   243,   453,
     477,   221,   167,   504,    43,   281,   120,   199,    -1,    -1,
      49,    50,   326,    -1,    64,    65,    -1,    56,    -1,    -1,
     474,   475,    -1,    -1,    -1,   479,    -1,    -1,    -1,    -1,
      69,    70,    71,    72,    -1,    -1,    -1,   491,    -1,    -1,
     494,    -1,   496,    99,   100,   101,   102,    -1,   104,    99,
     100,   101,   102,   103,   104,    -1,   112,   107,   108,   109,
     110,   111,   112,    -1,    -1,    -1,    -1,   510,    -1,    -1,
      -1,    -1,    -1,   123,   124,   125,    -1,   116,    -1,    -1,
     119,    -1,    -1,    -1,    -1,   124,   125,   126,   127,   128,
     129,   130,   131,    35,    36,    37,    38,    39,    40,    41,
      42,    -1,    44,    45,    46,    47,    48,    99,   100,   101,
     102,    -1,   104,    -1,    -1,   107,   108,   109,   110,    -1,
     112,    -1,    99,   100,   101,   102,   103,   104,    -1,   121,
     107,   108,   109,   110,   111,   112,    99,   100,   101,   102,
     103,   104,    -1,    -1,   107,   108,   109,   110,    -1,   112,
      99,   100,   101,   102,    -1,   104,    -1,    -1,   107,   108,
     109,   110,    -1,   112,    -1,    -1,    99,   100,   101,   102,
     103,   104,    -1,   115,   107,   117,   118,   119,   111,   112,
      99,   100,   101,   102,   103,   104,    -1,    -1,   107,    -1,
      -1,    -1,    -1,   112,    87,    88,    89,    90,    91,    92,
      93,    94,    95
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    22,    24,    28,    31,    63,    79,    97,   105,
     134,   135,   136,   137,   138,   147,   150,   151,   158,   170,
     119,   103,   159,   139,    51,    52,    53,    54,    55,   103,
     212,   213,   171,   148,     4,     0,   136,   236,   237,   152,
     103,   107,   111,   231,   232,   212,   103,   103,    31,    96,
     105,   113,   114,   140,   142,   143,   149,   150,   200,   201,
     202,   120,    75,    99,   100,   101,   102,   104,   107,   108,
     109,   110,   112,   227,   235,   238,   240,   241,   242,     4,
     160,   103,   118,   172,   141,     4,   143,    98,    79,   144,
     145,   202,   235,    75,    73,   132,     4,    26,    27,   153,
     154,   155,   156,   157,    87,    88,    89,    90,    91,    92,
      93,    94,    95,   165,   166,   178,   180,   118,   242,   165,
     108,   179,   180,     4,   111,   235,   239,   240,   212,   103,
      25,   155,   121,     4,    73,   242,     4,   103,   111,   233,
     234,   235,    73,    96,   146,   227,   228,   229,   230,   234,
     240,   103,   103,    51,    52,    53,    54,   103,   167,   168,
     161,   166,   180,   173,   118,   180,   119,    73,     4,     4,
      73,   122,     4,   162,   162,   107,   236,   230,   168,     5,
     105,   113,   114,   163,   169,   197,   198,   199,   169,   120,
     164,     4,     4,    74,   199,   200,   203,    74,   212,     5,
       7,     8,     9,    12,    13,    17,    18,    22,    23,    30,
      31,    34,    64,    66,    67,    68,    76,    80,    82,   103,
     107,   111,   140,   174,   187,   189,   193,   205,   214,   215,
     216,   217,   218,   220,   225,   227,   103,   209,   241,   233,
     233,   235,   235,   235,   227,   210,   103,   103,   206,   207,
     208,   101,   107,   243,   235,   121,   235,   121,   178,   228,
       4,     4,   121,   221,    35,    36,    37,    38,    39,    40,
      41,    42,    44,    45,    46,    47,    48,   115,   117,   118,
     119,   219,   212,     8,    57,    58,    59,    60,    61,    62,
      73,   226,     8,    73,   226,    73,   146,   212,   212,   212,
     118,   194,   195,     4,   190,   224,   227,   121,   235,   235,
     235,   235,   235,   235,   235,   235,   235,   235,   235,   235,
     235,    17,    18,    19,    20,    21,    64,    65,   107,   111,
     123,   124,   125,   211,   220,   227,   235,   236,   107,   227,
     232,   103,   233,   233,   235,   233,   233,   235,   235,   103,
     204,   103,   103,   235,   196,   235,   196,   175,   191,    73,
     122,    10,    11,   222,   223,   235,   213,   235,   243,   103,
     146,   235,   235,   235,   103,    43,    49,    50,    56,    69,
      70,    71,    72,   116,   119,   124,   125,   126,   127,   128,
     129,   130,   131,   120,     8,     8,    73,   119,    73,   118,
     118,    73,   122,   122,   182,     4,    11,    67,    81,    83,
     188,   192,   227,   118,   227,   227,    73,   122,    73,   119,
      73,   119,    73,   235,   235,   235,   235,   235,   235,   235,
     235,   235,   236,   235,   235,   235,   235,   235,   235,   235,
     235,   118,   233,   233,   235,   236,   103,   242,   242,   235,
       9,    10,    11,    86,   177,   183,   227,   235,     4,   218,
     227,   223,   235,   236,   235,   236,   103,   120,   235,   120,
     235,   227,   227,   235,    78,    84,    85,   181,     4,   121,
     120,   120,     4,   235,   235,   107,   227,   176,   202,   222,
       4,    73,     4,     4,    73,     4,    73,   184,     4,   122,
     235,   235,   235,    30,    66,    77,   185,     4,     4,     4,
     186,   227,     4,   212,   103
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
    { yyval.i = 0;  }
    break;

  case 13:
#line 420 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 425 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 431 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 16:
#line 439 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 17:
#line 440 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 18:
#line 444 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 19:
#line 445 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 22:
#line 453 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 454 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 455 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 25:
#line 456 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 26:
#line 457 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 28:
#line 461 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 29:
#line 463 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 30:
#line 466 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(interp, yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(interp, str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, cur_unit);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 31:
#line 472 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 33:
#line 480 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 34:
#line 482 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 37:
#line 497 "imcc/imcc.y"
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
#line 513 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 39:
#line 520 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 41:
#line 529 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 46:
#line 540 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 47:
#line 545 "imcc/imcc.y"
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
#line 559 "imcc/imcc.y"
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
#line 575 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 50:
#line 580 "imcc/imcc.y"
    {
          Instruction *i = iSUBROUTINE(cur_unit, yyvsp[0].sr);
          i->r[1] = cur_call = mk_pcc_sub(interp, str_dup(i->r[0]->name), 0);
          add_namespace(interp, cur_unit);
        }
    break;

  case 51:
#line 585 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 52:
#line 587 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
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
    { add_pcc_param(cur_call, yyvsp[-1].sr);}
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

  case 64:
#line 613 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 65:
#line 614 "imcc/imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); }
    break;

  case 66:
#line 615 "imcc/imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);}
    break;

  case 67:
#line 619 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 68:
#line 620 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 69:
#line 621 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 70:
#line 622 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 71:
#line 623 "imcc/imcc.y"
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

  case 74:
#line 641 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 75:
#line 643 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(interp, yyvsp[0].s));
            i->r[1] = cur_call = mk_pcc_sub(interp, str_dup(i->r[0]->name), 0);
            add_namespace(interp, cur_unit);

         }
    break;

  case 76:
#line 649 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 77:
#line 651 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 78:
#line 656 "imcc/imcc.y"
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

  case 79:
#line 683 "imcc/imcc.y"
    { yyval.i = 0; current_call = NULL; }
    break;

  case 80:
#line 687 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 0; }
    break;

  case 81:
#line 688 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 1; }
    break;

  case 82:
#line 692 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 83:
#line 694 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 84:
#line 697 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 85:
#line 698 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 86:
#line 702 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 87:
#line 703 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 88:
#line 704 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 90:
#line 708 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 91:
#line 709 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 92:
#line 710 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 93:
#line 711 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 94:
#line 712 "imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 95:
#line 713 "imcc/imcc.y"
    {  yyval.t = P_METHOD | P_NONE ; }
    break;

  case 96:
#line 718 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 97:
#line 723 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 98:
#line 725 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-1].sr);
            current_call->r[0]->pcc_sub->nci = 1;
         }
    break;

  case 99:
#line 730 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 100:
#line 732 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 101:
#line 734 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 102:
#line 738 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 103:
#line 744 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 104:
#line 745 "imcc/imcc.y"
    {  add_pcc_arg(current_call->r[0], yyvsp[-1].sr);}
    break;

  case 105:
#line 749 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 106:
#line 750 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 107:
#line 753 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 108:
#line 757 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 109:
#line 758 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 110:
#line 763 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 111:
#line 764 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 112:
#line 765 "imcc/imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 113:
#line 769 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 114:
#line 770 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 117:
#line 780 "imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 118:
#line 783 "imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 119:
#line 784 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 120:
#line 790 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 121:
#line 792 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 122:
#line 794 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 123:
#line 798 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 124:
#line 799 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 125:
#line 804 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 126:
#line 809 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 127:
#line 811 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 128:
#line 816 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 129:
#line 820 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 130:
#line 821 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 131:
#line 822 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 134:
#line 840 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 135:
#line 845 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 136:
#line 846 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 137:
#line 847 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 138:
#line 848 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 139:
#line 852 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 143:
#line 862 "imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 144:
#line 869 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 145:
#line 873 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 146:
#line 881 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 149:
#line 891 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 150:
#line 892 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 151:
#line 893 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 152:
#line 894 "imcc/imcc.y"
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

  case 153:
#line 906 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 154:
#line 907 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 156:
#line 909 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 157:
#line 910 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 158:
#line 911 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 159:
#line 912 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
                                1, mk_ident(interp, yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 160:
#line 914 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 161:
#line 915 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 162:
#line 916 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 163:
#line 917 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 164:
#line 918 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 165:
#line 919 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 166:
#line 920 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 167:
#line 922 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 168:
#line 924 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 169:
#line 926 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 170:
#line 927 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 172:
#line 929 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 173:
#line 933 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 174:
#line 934 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 175:
#line 935 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 176:
#line 936 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 177:
#line 940 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 178:
#line 941 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 179:
#line 942 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 180:
#line 943 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 181:
#line 944 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 182:
#line 945 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 183:
#line 950 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 184:
#line 960 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 185:
#line 961 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 186:
#line 962 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 187:
#line 963 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 188:
#line 964 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 189:
#line 965 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 966 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 191:
#line 967 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 968 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 193:
#line 969 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 970 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 195:
#line 971 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 196:
#line 973 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 975 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 977 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 979 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 981 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 983 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 985 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 987 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 989 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 991 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 206:
#line 993 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 995 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 208:
#line 997 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 209:
#line 999 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 210:
#line 1001 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 211:
#line 1003 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 1005 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 213:
#line 1007 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                  mk_sub_address(interp, yyvsp[0].s), NULL, 1); }
    break;

  case 214:
#line 1010 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(interp, yyvsp[-2].s),
                                           mk_sub_address(interp, yyvsp[0].s), 1); }
    break;

  case 215:
#line 1017 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 216:
#line 1020 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 217:
#line 1022 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 218:
#line 1026 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1028 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 220:
#line 1030 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 221:
#line 1033 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 222:
#line 1039 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 223:
#line 1043 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 226:
#line 1053 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 227:
#line 1055 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 228:
#line 1057 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 229:
#line 1059 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 230:
#line 1061 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 231:
#line 1063 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 232:
#line 1065 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 233:
#line 1067 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 234:
#line 1069 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 235:
#line 1071 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 236:
#line 1073 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 237:
#line 1075 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 238:
#line 1077 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 239:
#line 1082 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 240:
#line 1088 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 241:
#line 1089 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 242:
#line 1090 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 243:
#line 1095 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 244:
#line 1096 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 245:
#line 1097 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 246:
#line 1100 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 247:
#line 1101 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 248:
#line 1106 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 249:
#line 1111 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 250:
#line 1115 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 251:
#line 1116 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 252:
#line 1117 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 253:
#line 1122 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 254:
#line 1123 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 255:
#line 1127 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 256:
#line 1131 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 257:
#line 1132 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 258:
#line 1137 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 259:
#line 1139 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 260:
#line 1141 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 261:
#line 1143 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 262:
#line 1145 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 263:
#line 1147 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 264:
#line 1151 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 265:
#line 1152 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 266:
#line 1153 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 267:
#line 1154 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 268:
#line 1155 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 269:
#line 1156 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 272:
#line 1165 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 273:
#line 1166 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 274:
#line 1170 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 276:
#line 1175 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 277:
#line 1177 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 279:
#line 1185 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 280:
#line 1189 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 281:
#line 1190 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 282:
#line 1194 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 283:
#line 1195 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 288:
#line 1208 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 289:
#line 1209 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 290:
#line 1213 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 291:
#line 1215 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 292:
#line 1216 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 293:
#line 1217 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 294:
#line 1221 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 295:
#line 1227 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 296:
#line 1229 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 297:
#line 1230 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 298:
#line 1234 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 299:
#line 1235 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 300:
#line 1236 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 301:
#line 1237 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 302:
#line 1238 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 303:
#line 1242 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 304:
#line 1243 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 305:
#line 1244 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 306:
#line 1245 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 307:
#line 1249 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 308:
#line 1250 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3574 "imcc/imcparser.c"

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


#line 1255 "imcc/imcc.y"



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

