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
     LABEL = 349,
     EMIT = 350,
     EOM = 351,
     IREG = 352,
     NREG = 353,
     SREG = 354,
     PREG = 355,
     IDENTIFIER = 356,
     REG = 357,
     MACRO = 358,
     ENDM = 359,
     STRINGC = 360,
     INTC = 361,
     FLOATC = 362,
     USTRINGC = 363,
     PARROT_OP = 364,
     VAR = 365,
     LINECOMMENT = 366,
     FILECOMMENT = 367,
     DOT = 368,
     CONCAT = 369,
     POINTY = 370
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
#define LABEL 349
#define EMIT 350
#define EOM 351
#define IREG 352
#define NREG 353
#define SREG 354
#define PREG 355
#define IDENTIFIER 356
#define REG 357
#define MACRO 358
#define ENDM 359
#define STRINGC 360
#define INTC 361
#define FLOATC 362
#define USTRINGC 363
#define PARROT_OP 364
#define VAR 365
#define LINECOMMENT 366
#define FILECOMMENT 367
#define DOT 368
#define CONCAT 369
#define POINTY 370




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
#line 631 "imcc/imcparser.c"
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
#line 652 "imcc/imcparser.c"

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
#define YYLAST   568

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  132
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  108
/* YYNRULES -- Number of rules. */
#define YYNRULES  297
/* YYNRULES -- Number of states. */
#define YYNSTATES  503

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   370

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   122,     2,     2,     2,   128,   129,     2,
     120,   121,   126,   125,     2,   123,     2,   127,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   131,
       2,   117,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   118,     2,   119,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   130,     2,   124,     2,     2,     2,
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
     116
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
     134,   135,   145,   146,   148,   152,   153,   158,   159,   161,
     162,   163,   173,   174,   176,   180,   181,   186,   187,   198,
     199,   202,   203,   207,   209,   211,   212,   216,   218,   220,
     222,   224,   226,   228,   230,   232,   238,   242,   246,   250,
     254,   260,   266,   267,   271,   274,   277,   280,   281,   285,
     288,   289,   294,   296,   298,   300,   302,   303,   309,   311,
     312,   315,   319,   322,   325,   326,   332,   333,   339,   340,
     342,   346,   348,   351,   352,   355,   358,   360,   362,   363,
     365,   368,   370,   372,   376,   378,   382,   384,   386,   389,
     392,   393,   398,   399,   406,   408,   409,   416,   417,   422,
     425,   428,   431,   434,   437,   440,   441,   445,   448,   450,
     452,   454,   455,   457,   459,   461,   463,   465,   467,   469,
     471,   473,   475,   477,   481,   486,   491,   496,   502,   508,
     514,   520,   526,   532,   538,   544,   550,   556,   562,   568,
     574,   580,   586,   592,   598,   605,   612,   619,   627,   632,
     637,   644,   652,   657,   664,   669,   674,   679,   684,   691,
     699,   703,   704,   714,   716,   718,   722,   726,   730,   734,
     738,   742,   746,   750,   754,   758,   762,   766,   770,   775,
     777,   779,   781,   785,   789,   793,   795,   797,   798,   804,
     805,   809,   811,   813,   816,   819,   823,   825,   832,   839,
     844,   849,   854,   859,   861,   863,   865,   867,   869,   871,
     873,   875,   876,   878,   882,   884,   886,   891,   893,   895,
     897,   899,   901,   903,   905,   907,   909,   911,   912,   915,
     917,   921,   922,   927,   929,   933,   936,   939,   941,   943,
     945,   947,   949,   951,   953,   955,   957,   959
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     133,     0,    -1,   134,    -1,   135,    -1,   134,   135,    -1,
     150,    -1,   149,    -1,   137,    -1,   136,    -1,   157,    -1,
     164,    -1,   146,    -1,   104,     4,    -1,     4,    -1,    63,
     208,   102,    -1,    63,   208,   102,   117,   238,    -1,    -1,
      31,   138,   208,   102,   117,   238,    -1,    -1,    31,   140,
     107,   230,   117,   106,    -1,   142,    -1,   141,   142,    -1,
     196,   143,     4,    -1,   104,     4,    -1,   113,    -1,   112,
      -1,   149,    -1,   139,    -1,    -1,   144,   110,   145,    -1,
      79,   175,    95,    -1,    -1,   224,    -1,    -1,    96,   147,
     148,    97,    -1,    -1,   141,    -1,    22,   118,   232,   119,
      -1,    -1,    24,   102,   151,     4,   152,    25,    -1,   153,
      -1,    -1,   154,    -1,   153,   154,    -1,   155,    -1,   156,
      -1,     4,    -1,    26,   208,   102,     4,    -1,    27,   102,
     102,     4,    -1,    -1,    -1,    28,   158,   227,   175,     4,
     159,   160,   163,    74,    -1,    -1,     4,    -1,   160,   161,
       4,    -1,    -1,     5,   162,   208,   102,    -1,    -1,   193,
      -1,    -1,    -1,    79,   165,   102,   175,     4,   166,   167,
     163,    74,    -1,    -1,     4,    -1,   167,   168,     4,    -1,
      -1,     5,   169,   208,   102,    -1,    -1,    76,   174,     4,
     171,   178,   173,   177,   172,   180,    77,    -1,    -1,   198,
       4,    -1,    -1,    86,   231,     4,    -1,    87,    -1,    88,
      -1,    -1,   175,    73,   176,    -1,   176,    -1,   174,    -1,
      90,    -1,    89,    -1,    91,    -1,    92,    -1,    94,    -1,
      93,    -1,    78,   231,    73,   231,     4,    -1,    78,   231,
       4,    -1,    84,   231,     4,    -1,    85,   223,     4,    -1,
      85,   106,     4,    -1,    85,   223,    73,   231,     4,    -1,
      85,   106,    73,   231,     4,    -1,    -1,   178,   179,     4,
      -1,     9,   231,    -1,    11,   223,    -1,    10,   223,    -1,
      -1,   180,   181,     4,    -1,    66,   223,    -1,    -1,    30,
     182,   208,   102,    -1,    80,    -1,    82,    -1,    81,    -1,
      83,    -1,    -1,   183,     4,   186,   187,   184,    -1,   189,
      -1,    -1,   187,     4,    -1,   187,   188,     4,    -1,    67,
     231,    -1,    11,   223,    -1,    -1,    67,   120,   190,   192,
     121,    -1,    -1,    68,   120,   191,   192,   121,    -1,    -1,
     231,    -1,   192,    73,   231,    -1,   195,    -1,   193,   195,
      -1,    -1,   194,   199,    -1,   104,     4,    -1,   113,    -1,
     112,    -1,    -1,   197,    -1,   197,   198,    -1,   198,    -1,
      95,    -1,   196,   201,     4,    -1,   102,    -1,   200,    73,
     102,    -1,   210,    -1,   221,    -1,    22,   102,    -1,    23,
     102,    -1,    -1,    30,   202,   208,   200,    -1,    -1,    31,
     203,   208,   102,   117,   238,    -1,   139,    -1,    -1,    34,
     204,   208,   102,   117,   238,    -1,    -1,     5,   205,   208,
     102,    -1,     5,   237,    -1,    66,   231,    -1,     9,   231,
      -1,    67,   231,    -1,     7,   229,    -1,     8,   229,    -1,
      -1,    18,   206,   145,    -1,   110,   224,    -1,   216,    -1,
     170,    -1,   185,    -1,    -1,    18,    -1,    19,    -1,    20,
      -1,    21,    -1,    51,    -1,    52,    -1,    53,    -1,    54,
      -1,    55,    -1,   209,    -1,   102,    -1,   223,   117,   231,
      -1,   223,   117,   122,   231,    -1,   223,   117,   123,   231,
      -1,   223,   117,   124,   231,    -1,   223,   117,   231,   125,
     231,    -1,   223,   117,   231,   123,   231,    -1,   223,   117,
     231,   126,   231,    -1,   223,   117,   231,    69,   231,    -1,
     223,   117,   231,   127,   231,    -1,   223,   117,   231,    43,
     231,    -1,   223,   117,   231,   128,   231,    -1,   223,   117,
     231,   115,   231,    -1,   223,   117,   231,    49,   231,    -1,
     223,   117,   231,    50,   231,    -1,   223,   117,   231,    70,
     231,    -1,   223,   117,   231,    71,   231,    -1,   223,   117,
     231,    72,   231,    -1,   223,   117,   231,    56,   231,    -1,
     223,   117,   231,   129,   231,    -1,   223,   117,   231,   130,
     231,    -1,   223,   117,   231,   124,   231,    -1,   223,   117,
     231,   118,   232,   119,    -1,   223,   118,   232,   119,   117,
     231,    -1,   223,   117,    17,   209,    73,   231,    -1,   223,
     117,    17,   209,   118,   232,   119,    -1,   223,   117,    17,
     209,    -1,   223,   117,    17,   231,    -1,   223,   117,    17,
     231,    73,   231,    -1,   223,   117,    17,   231,   118,   232,
     119,    -1,   223,   117,   207,   102,    -1,   223,   117,   207,
     102,    73,   102,    -1,   223,   117,    65,   102,    -1,   223,
     117,    64,   239,    -1,    64,   239,   117,   231,    -1,    17,
     223,    73,   231,    -1,    17,   223,    73,   231,    73,   231,
      -1,    17,   223,    73,   231,   118,   232,   119,    -1,   223,
     117,   216,    -1,    -1,   211,   120,   220,   121,   117,   214,
     120,   218,   121,    -1,   212,    -1,   213,    -1,   223,    35,
     231,    -1,   223,    36,   231,    -1,   223,    37,   231,    -1,
     223,    38,   231,    -1,   223,    45,   231,    -1,   223,    44,
     231,    -1,   223,    39,   231,    -1,   223,    40,   231,    -1,
     223,    41,   231,    -1,   223,    42,   231,    -1,   223,    46,
     231,    -1,   223,    47,   231,    -1,   223,    48,   231,    -1,
     223,   117,   110,   145,    -1,   102,    -1,   106,    -1,   223,
      -1,   223,   215,   228,    -1,   223,   215,   106,    -1,   223,
     215,   223,    -1,   116,    -1,   114,    -1,    -1,   214,   217,
     120,   218,   121,    -1,    -1,   218,    73,   219,    -1,   219,
      -1,   231,    -1,    11,   223,    -1,    10,   223,    -1,   220,
      73,   223,    -1,   223,    -1,    12,   231,   222,   231,     8,
     229,    -1,    13,   231,   222,   231,     8,   229,    -1,    12,
     231,     8,   229,    -1,    13,   231,     8,   229,    -1,    12,
     231,    73,   229,    -1,    13,   231,    73,   229,    -1,    57,
      -1,    58,    -1,    59,    -1,    60,    -1,    61,    -1,    62,
      -1,   111,    -1,   237,    -1,    -1,   225,    -1,   225,    73,
     226,    -1,   226,    -1,   230,    -1,   223,   118,   232,   119,
      -1,   228,    -1,   106,    -1,   102,    -1,   110,    -1,   102,
      -1,   110,    -1,   229,    -1,   231,    -1,   223,    -1,   238,
      -1,    -1,   233,   234,    -1,   236,    -1,   234,   131,   236,
      -1,    -1,   234,    73,   235,   236,    -1,   231,    -1,   231,
      75,   231,    -1,    75,   231,    -1,   231,    75,    -1,    98,
      -1,    99,    -1,   100,    -1,   101,    -1,   103,    -1,   107,
      -1,   108,    -1,   106,    -1,   109,    -1,   100,    -1,   106,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   398,   398,   402,   404,   407,   409,   410,   411,   412,
     413,   414,   415,   416,   419,   426,   435,   434,   440,   439,
     443,   445,   448,   450,   451,   452,   453,   454,   457,   457,
     461,   468,   471,   476,   475,   486,   488,   491,   509,   507,
     523,   525,   528,   530,   533,   535,   536,   539,   553,   571,
     576,   569,   586,   588,   589,   593,   592,   597,   599,   603,
     605,   602,   615,   617,   618,   622,   621,   628,   626,   658,
     660,   663,   665,   668,   670,   673,   675,   676,   679,   680,
     681,   682,   683,   684,   685,   688,   694,   696,   701,   703,
     705,   709,   715,   717,   720,   722,   725,   728,   730,   733,
     736,   736,   740,   742,   745,   747,   752,   750,   756,   761,
     763,   765,   769,   771,   776,   774,   783,   782,   791,   793,
     794,   798,   800,   811,   815,   818,   819,   820,   823,   825,
     828,   830,   833,   839,   844,   852,   860,   862,   863,   864,
     865,   865,   878,   878,   880,   881,   881,   883,   883,   886,
     887,   888,   889,   890,   891,   892,   892,   895,   898,   899,
     900,   901,   904,   906,   907,   908,   911,   913,   914,   915,
     916,   917,   920,   931,   933,   934,   935,   936,   937,   938,
     939,   940,   941,   942,   943,   944,   946,   948,   950,   952,
     954,   956,   958,   960,   962,   964,   966,   968,   970,   972,
     974,   976,   978,   981,   988,   991,   993,   997,   999,  1001,
    1004,  1011,  1010,  1019,  1020,  1023,  1026,  1028,  1030,  1032,
    1034,  1036,  1038,  1040,  1042,  1044,  1046,  1048,  1052,  1060,
    1061,  1062,  1067,  1068,  1069,  1072,  1073,  1078,  1076,  1086,
    1088,  1089,  1092,  1095,  1098,  1102,  1104,  1107,  1110,  1112,
    1114,  1116,  1118,  1122,  1124,  1125,  1126,  1127,  1128,  1131,
    1133,  1136,  1138,  1141,  1143,  1146,  1148,  1155,  1157,  1160,
    1162,  1165,  1167,  1170,  1172,  1175,  1177,  1180,  1180,  1184,
    1186,  1188,  1188,  1192,  1198,  1201,  1202,  1205,  1207,  1208,
    1209,  1210,  1213,  1215,  1216,  1217,  1220,  1222
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
  "IMMEDIATE", "POSTCOMP", "METHOD", "ANON", "LABEL", "EMIT", "EOM", 
  "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "REG", "MACRO", "ENDM", 
  "STRINGC", "INTC", "FLOATC", "USTRINGC", "PARROT_OP", "VAR", 
  "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", "POINTY", "'='", "'['", 
  "']'", "'('", "')'", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", 
  "'&'", "'|'", "';'", "$accept", "program", "compilation_units", 
  "compilation_unit", "global", "constdef", "@1", "pmc_const", "@2", 
  "pasmcode", "pasmline", "pasm_inst", "@3", "pasm_args", "emit", "@4", 
  "opt_pasmcode", "class_namespace", "class", "@5", "class_body", 
  "member_decls", "member_decl", "field_decl", "method_decl", "sub", "@6", 
  "@7", "sub_params", "sub_param", "@8", "sub_body", "pcc_sub", "@9", 
  "@10", "pcc_params", "pcc_param", "@11", "pcc_sub_call", "@12", 
  "opt_label", "opt_invocant", "pcc_proto", "pcc_sub_proto", "proto", 
  "pcc_call", "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@13", 
  "begin_ret_or_yield", "end_ret_or_yield", "pcc_ret", "@14", 
  "pcc_returns", "pcc_return", "pcc_return_many", "@15", "@16", 
  "var_returns", "statements", "helper_clear_state", "statement", 
  "labels", "_labels", "label", "instruction", "id_list", "labeled_inst", 
  "@17", "@18", "@19", "@20", "@21", "newsub", "type", "classname", 
  "assignment", "@22", "op_assign", "func_assign", "the_sub", "ptr", 
  "sub_call", "@23", "arglist", "arg", "targetlist", "if_statement", 
  "relop", "target", "vars", "_vars", "_var_or_i", "sub_label_op_c", 
  "sub_label_op", "label_op", "var_or_i", "var", "keylist", "@24", 
  "_keylist", "@25", "key", "reg", "const", "string", 0
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
     364,   365,   366,   367,   368,   369,   370,    61,    91,    93,
      40,    41,    33,    45,   126,    43,    42,    47,    37,    38,
     124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   132,   133,   134,   134,   135,   135,   135,   135,   135,
     135,   135,   135,   135,   136,   136,   138,   137,   140,   139,
     141,   141,   142,   142,   142,   142,   142,   142,   144,   143,
     143,   143,   145,   147,   146,   148,   148,   149,   151,   150,
     152,   152,   153,   153,   154,   154,   154,   155,   156,   158,
     159,   157,   160,   160,   160,   162,   161,   163,   163,   165,
     166,   164,   167,   167,   167,   169,   168,   171,   170,   172,
     172,   173,   173,   174,   174,   175,   175,   175,   176,   176,
     176,   176,   176,   176,   176,   177,   177,   177,   177,   177,
     177,   177,   178,   178,   179,   179,   179,   180,   180,   181,
     182,   181,   183,   183,   184,   184,   186,   185,   185,   187,
     187,   187,   188,   188,   190,   189,   191,   189,   192,   192,
     192,   193,   193,   194,   195,   195,   195,   195,   196,   196,
     197,   197,   198,   199,   200,   200,   201,   201,   201,   201,
     202,   201,   203,   201,   201,   204,   201,   205,   201,   201,
     201,   201,   201,   201,   201,   206,   201,   201,   201,   201,
     201,   201,   207,   207,   207,   207,   208,   208,   208,   208,
     208,   208,   209,   210,   210,   210,   210,   210,   210,   210,
     210,   210,   210,   210,   210,   210,   210,   210,   210,   210,
     210,   210,   210,   210,   210,   210,   210,   210,   210,   210,
     210,   210,   210,   210,   210,   210,   210,   210,   210,   210,
     210,   211,   210,   210,   210,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   213,   214,
     214,   214,   214,   214,   214,   215,   215,   217,   216,   218,
     218,   218,   219,   219,   219,   220,   220,   221,   221,   221,
     221,   221,   221,   222,   222,   222,   222,   222,   222,   223,
     223,   224,   224,   225,   225,   226,   226,   227,   227,   228,
     228,   229,   229,   230,   230,   231,   231,   233,   232,   234,
     234,   235,   234,   236,   236,   236,   236,   237,   237,   237,
     237,   237,   238,   238,   238,   238,   239,   239
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     2,     1,     3,     5,     0,     6,     0,     6,
       1,     2,     3,     2,     1,     1,     1,     1,     0,     3,
       3,     0,     1,     0,     4,     0,     1,     4,     0,     6,
       1,     0,     1,     2,     1,     1,     1,     4,     4,     0,
       0,     9,     0,     1,     3,     0,     4,     0,     1,     0,
       0,     9,     0,     1,     3,     0,     4,     0,    10,     0,
       2,     0,     3,     1,     1,     0,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     5,     3,     3,     3,     3,
       5,     5,     0,     3,     2,     2,     2,     0,     3,     2,
       0,     4,     1,     1,     1,     1,     0,     5,     1,     0,
       2,     3,     2,     2,     0,     5,     0,     5,     0,     1,
       3,     1,     2,     0,     2,     2,     1,     1,     0,     1,
       2,     1,     1,     3,     1,     3,     1,     1,     2,     2,
       0,     4,     0,     6,     1,     0,     6,     0,     4,     2,
       2,     2,     2,     2,     2,     0,     3,     2,     1,     1,
       1,     0,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     3,     4,     4,     4,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     6,     6,     6,     7,     4,     4,
       6,     7,     4,     6,     4,     4,     4,     4,     6,     7,
       3,     0,     9,     1,     1,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     4,     1,
       1,     1,     3,     3,     3,     1,     1,     0,     5,     0,
       3,     1,     1,     2,     2,     3,     1,     6,     6,     4,
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
       0,    13,     0,     0,    49,    16,     0,    59,    33,     0,
       0,     2,     3,     8,     7,    11,     6,     5,     9,    10,
     277,    38,     0,     0,   166,   167,   168,   169,   170,   172,
       0,   171,     0,   128,    12,     1,     4,     0,     0,     0,
     269,   268,   270,    75,   267,     0,    14,    75,    18,   132,
       0,    25,    24,    27,   128,    20,     0,    26,    28,   129,
     131,    37,     0,   287,   288,   289,   290,   291,   294,   292,
     293,   295,   259,   275,   283,   278,   279,   260,   276,    41,
      73,    74,    80,    79,    81,    82,    84,    83,    78,     0,
      77,     0,     0,     0,     0,    23,    21,    34,    75,     0,
       0,   130,   285,   286,   281,     0,    46,     0,     0,     0,
      40,    42,    44,    45,    50,     0,     0,    15,    60,     0,
       0,    22,   261,   284,     0,   280,     0,     0,    39,    43,
      52,    76,    17,    62,   271,   272,   273,     0,   274,    30,
      29,   275,    32,   262,   264,   265,   282,     0,     0,    53,
     123,    63,   123,     0,   277,     0,    47,    48,    55,     0,
     127,   126,     0,     0,   123,   128,   121,    65,     0,     0,
      19,     0,   263,     0,   125,    54,    51,   122,   161,   124,
       0,    61,    64,   266,     0,   147,     0,     0,     0,     0,
       0,     0,   155,     0,     0,   140,   142,   145,     0,     0,
       0,     0,     0,   102,   103,   229,   230,   261,   144,   159,
       0,   160,   108,     0,   136,     0,   213,   214,   237,   158,
     137,   231,     0,    56,     0,   149,   153,   154,   151,     0,
       0,     0,   261,   138,   139,     0,     0,     0,   296,   297,
       0,   150,   114,   152,   116,     0,   157,   106,   133,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   236,   235,     0,   277,     0,    66,
       0,     0,   253,   254,   255,   256,   257,   258,     0,     0,
       0,     0,     0,     0,   156,     0,     0,     0,     0,   118,
     118,    67,   109,     0,   246,   239,   215,   216,   217,   218,
     221,   222,   223,   224,   220,   219,   225,   226,   227,     0,
     162,   163,   164,   165,     0,     0,   294,   261,     0,     0,
       0,     0,   210,   275,   173,     0,   233,   234,   232,   148,
     249,   251,     0,   250,   252,     0,   207,   134,   141,     0,
       0,   206,     0,   119,     0,    92,     0,     0,     0,     0,
       0,     0,   241,   242,   198,   199,   205,   204,   228,   174,
     175,   176,   202,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   277,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   277,     0,     0,     0,     0,
     115,   117,    71,   110,     0,     0,   104,   105,   107,     0,
     245,     0,   244,   243,     0,   238,     0,   277,     0,   277,
       0,   182,   185,   186,   190,   180,   187,   188,   189,   184,
       0,   178,   193,   177,   179,   181,   183,   191,   192,     0,
     247,   248,   208,     0,   135,   143,   146,   120,     0,     0,
       0,     0,     0,     0,   113,   112,   111,     0,   231,   240,
     196,     0,   200,     0,   203,   194,   195,   209,    94,    96,
      95,     0,     0,     0,     0,    69,    93,   239,   197,   201,
      72,     0,     0,     0,     0,    97,     0,     0,    86,     0,
      87,    89,     0,    88,     0,     0,    70,   212,     0,     0,
       0,   100,     0,    68,     0,    85,    91,    90,     0,    99,
      98,     0,   101
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    10,    11,    12,    13,    14,    23,    53,    94,    54,
      55,    99,   100,   140,    15,    33,    56,    16,    17,    39,
     109,   110,   111,   112,   113,    18,    22,   130,   150,   162,
     173,   163,    19,    32,   133,   152,   169,   180,   209,   345,
     475,   442,    88,    89,    90,   465,   392,   443,   485,   494,
     498,   210,   398,   211,   292,   346,   399,   212,   289,   290,
     342,   164,   165,   166,    58,    59,    60,   179,   338,   213,
     235,   236,   237,   224,   232,   321,    30,    31,   214,   215,
     216,   217,   218,   268,   219,   250,   351,   352,   293,   220,
     279,    73,   142,   143,   144,    43,    44,   136,   145,   138,
      37,    38,    75,   124,    76,    77,    78,   240
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -224
static const short yypact[] =
{
      40,  -224,   -79,   -73,  -224,  -224,   129,  -224,  -224,    49,
      30,    40,  -224,  -224,  -224,  -224,  -224,  -224,  -224,  -224,
    -224,  -224,    15,   129,  -224,  -224,  -224,  -224,  -224,  -224,
     -45,  -224,   -44,    61,  -224,  -224,  -224,   -37,   210,    57,
    -224,  -224,  -224,   474,  -224,    31,    -9,   474,  -224,  -224,
     133,  -224,  -224,  -224,   144,  -224,    44,  -224,    -1,    43,
    -224,  -224,   435,  -224,  -224,  -224,  -224,  -224,  -224,  -224,
    -224,  -224,  -224,  -224,    94,   -51,  -224,  -224,  -224,    28,
    -224,  -224,  -224,  -224,  -224,  -224,  -224,  -224,  -224,     6,
    -224,    54,   102,     8,    65,  -224,  -224,  -224,   474,   172,
      68,  -224,  -224,   435,  -224,   210,  -224,   129,    95,   160,
      28,  -224,  -224,  -224,  -224,   474,   102,  -224,  -224,   396,
     -50,  -224,   396,  -224,   210,  -224,    97,   103,  -224,  -224,
     228,  -224,  -224,   231,  -224,  -224,  -224,   120,  -224,  -224,
    -224,   122,  -224,   165,  -224,  -224,  -224,   245,   246,  -224,
       0,  -224,     3,   145,  -224,   396,  -224,  -224,  -224,   251,
    -224,  -224,   258,   189,   132,    43,  -224,  -224,   191,   270,
    -224,   162,  -224,   129,  -224,  -224,  -224,  -224,    29,  -224,
     129,  -224,  -224,  -224,   184,   257,    24,    24,   435,   435,
     435,   203,  -224,   185,   188,  -224,   187,  -224,    45,   435,
     365,   175,   -39,  -224,  -224,  -224,  -224,   396,  -224,  -224,
     292,  -224,  -224,   293,  -224,   178,  -224,  -224,  -224,  -224,
    -224,   414,   205,  -224,   129,  -224,  -224,  -224,  -224,   134,
     337,   242,   396,  -224,  -224,   129,   129,   129,  -224,  -224,
     206,  -224,  -224,  -224,  -224,   316,  -224,  -224,  -224,   203,
     202,   435,   435,   435,   435,   435,   435,   435,   435,   435,
     435,   435,   435,   435,  -224,  -224,   169,  -224,   263,  -224,
     222,    24,  -224,  -224,  -224,  -224,  -224,  -224,    24,   435,
      24,    24,   435,   435,  -224,   223,   224,   234,   435,   435,
     435,  -224,  -224,   -49,  -224,   278,  -224,  -224,  -224,  -224,
    -224,  -224,  -224,  -224,  -224,  -224,  -224,  -224,  -224,   410,
    -224,  -224,  -224,  -224,    45,   244,   227,   396,   435,   435,
     435,   247,  -224,    84,   363,   233,  -224,  -224,  -224,  -224,
    -224,  -224,   346,  -224,  -224,   359,   -53,  -224,   298,   265,
     266,  -224,   -48,  -224,   -46,  -224,    39,   203,   271,   203,
     203,    26,  -224,  -224,   -42,    37,  -224,  -224,  -224,  -224,
    -224,  -224,   307,   435,   435,   435,   435,   435,   435,   435,
     435,   435,  -224,   435,   435,   435,   435,   435,   435,   435,
     435,   273,    24,    24,   435,  -224,   289,   102,   102,   435,
    -224,  -224,     4,  -224,   203,   435,  -224,  -224,  -224,   388,
    -224,   449,  -224,  -224,   278,  -224,   435,  -224,   435,  -224,
     299,  -224,  -224,  -224,  -224,  -224,  -224,  -224,  -224,  -224,
     281,  -224,  -224,  -224,  -224,  -224,  -224,  -224,  -224,   435,
    -224,  -224,  -224,   285,  -224,  -224,  -224,  -224,   435,   203,
     203,   435,    83,   404,  -224,  -224,  -224,   291,    32,  -224,
    -224,   290,  -224,   295,  -224,  -224,  -224,  -224,  -224,  -224,
    -224,   417,   435,   435,   317,    43,  -224,   278,  -224,  -224,
    -224,    12,   418,    13,    14,  -224,   420,    41,  -224,   435,
    -224,  -224,   435,  -224,   435,    93,  -224,  -224,   421,   425,
     426,  -224,   203,  -224,   432,  -224,  -224,  -224,   129,  -224,
    -224,   335,  -224
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -224,  -224,  -224,   427,  -224,  -224,  -224,   261,  -224,  -224,
     386,  -224,  -224,  -223,  -224,  -224,  -224,     2,  -224,  -224,
    -224,  -224,   331,  -224,  -224,  -224,  -224,  -224,  -224,  -224,
    -224,   305,  -224,  -224,  -224,  -224,  -224,  -224,  -224,  -224,
    -224,  -224,   240,   -28,   329,  -224,  -224,  -224,  -224,  -224,
    -224,  -224,  -224,  -224,  -224,  -224,  -224,  -224,  -224,  -224,
     155,  -224,  -224,   283,   302,  -224,   -58,  -224,  -224,  -224,
    -224,  -224,  -224,  -224,  -224,  -224,   -23,   161,  -224,  -224,
    -224,  -224,    76,  -224,   213,  -224,    16,    78,  -224,  -224,
     239,   -89,   277,  -224,   325,  -224,   232,  -180,   382,   -36,
    -143,  -224,  -224,  -224,   -84,   330,   -88,   200
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -232
static const short yytable[] =
{
      45,   101,    74,   -31,   117,   158,   226,   227,   167,   284,
     114,   171,   118,   438,   439,   440,   478,   481,   483,    93,
     384,   125,   104,   115,   347,   389,   102,   389,   132,    21,
      35,   406,   106,   141,   185,    57,   186,   187,   188,    20,
     146,   189,   190,   393,     1,   139,   191,   192,    80,    81,
     394,   193,   194,    34,   107,   108,    57,    46,    47,   195,
     196,    79,     2,   197,     3,   385,   141,   123,     4,    74,
     120,     5,   348,   390,   -57,   391,   407,   -57,    98,   115,
     105,   115,    61,     2,   126,   479,   482,   484,    74,   221,
     441,   330,    48,   198,   358,   199,   200,   201,   331,   404,
     333,   334,   231,     6,   159,   202,   395,   159,    92,   203,
     408,   204,   160,   161,   404,   160,   161,    40,   141,     7,
     396,    41,   397,   491,   325,    42,   134,    63,    64,    65,
      66,   205,    67,    91,   135,   206,     8,    95,    49,   207,
      72,    97,   271,   141,     9,   238,   264,   405,   265,  -211,
     184,   239,   228,   229,   230,   409,    49,   222,   -35,   492,
     294,   462,   487,   241,   243,    50,     2,   463,   464,   103,
     493,   116,   119,    51,    52,    48,   121,   323,   122,   327,
      24,    25,    26,    27,    28,   128,   309,   310,   311,   312,
     313,   272,   273,   274,   275,   276,   277,   127,   264,   147,
     265,   270,   430,   431,  -231,   148,   -58,   278,    68,    69,
      70,    71,   285,   286,   287,   296,   297,   298,   299,   300,
     301,   302,   303,   304,   305,   306,   307,   308,   141,   420,
     324,    29,   149,   314,   315,   151,   159,   153,   155,    49,
     154,   -36,   433,   332,   160,   161,   335,   336,    50,   156,
     157,   170,   341,   343,   343,   174,    51,    52,   400,   353,
     402,   403,   175,   176,   451,   181,   453,    63,    64,    65,
      66,   205,    67,   355,   182,   316,    69,    70,    71,   317,
      72,   183,   359,   360,   361,    62,   223,   233,   349,   350,
     234,   318,   319,   320,   -18,   244,   247,   248,   249,   435,
     436,    63,    64,    65,    66,   444,    67,   269,    63,    64,
      65,    66,   448,    67,    72,   283,    68,    69,    70,    71,
     291,    72,   295,   288,   329,   337,   339,   411,   412,   413,
     414,   415,   416,   417,   418,   419,   340,   421,   422,   423,
     424,   425,   426,   427,   428,   280,   357,  -230,   432,   362,
     459,   460,   381,   437,   382,    63,    64,    65,    66,   445,
      67,    63,    64,    65,    66,    40,    67,   383,   353,   326,
     450,   386,   452,    42,    72,   474,    63,    64,    65,    66,
     410,    67,   387,   388,    68,    69,    70,    71,   401,    72,
     429,   434,   446,   456,   272,   273,   274,   275,   276,   277,
     455,   454,   458,   499,   457,   461,   363,   476,   466,   468,
     281,   467,   364,   365,   469,    63,    64,    65,    66,   366,
      67,   470,   480,   473,   486,   495,   471,   472,    72,   496,
     497,   353,   367,   368,   369,   370,   500,   502,    36,   208,
      96,   129,   245,   488,   131,   344,   489,   177,   490,   251,
     252,   253,   254,   255,   256,   257,   258,   168,   259,   260,
     261,   262,   263,    63,    64,    65,    66,   178,    67,   282,
     354,    68,    69,    70,    71,   501,    72,   447,   371,   322,
     172,   372,   449,   477,   246,   242,   373,   374,   375,   376,
     377,   378,   379,   380,    63,    64,    65,    66,   134,    67,
     328,   137,    68,    69,    70,    71,   135,    72,    63,    64,
      65,    66,    29,    67,   356,   225,    68,    69,    70,    71,
       0,    72,     0,     0,     0,     0,     0,     0,   264,     0,
     265,   266,   267,    63,    64,    65,    66,     0,    67,     0,
       0,    68,    69,    70,    71,     0,    72,    63,    64,    65,
      66,   205,    67,     0,     0,   206,     0,     0,     0,     0,
      72,    80,    81,    82,    83,    84,    85,    86,    87
};

static const short yycheck[] =
{
      23,    59,    38,     4,    92,     5,   186,   187,     5,   232,
       4,   154,     4,     9,    10,    11,     4,     4,     4,    47,
      73,   105,    73,    73,    73,    73,    62,    73,   116,   102,
       0,    73,     4,   122,     5,    33,     7,     8,     9,   118,
     124,    12,    13,     4,     4,    95,    17,    18,    87,    88,
      11,    22,    23,     4,    26,    27,    54,   102,   102,    30,
      31,     4,    22,    34,    24,   118,   155,   103,    28,   105,
      98,    31,   121,   121,    74,   121,   118,    74,    79,    73,
     131,    73,   119,    22,   107,    73,    73,    73,   124,   178,
      86,   271,    31,    64,   317,    66,    67,    68,   278,    73,
     280,   281,   191,    63,   104,    76,    67,   104,   117,    80,
      73,    82,   112,   113,    73,   112,   113,   102,   207,    79,
      81,   106,    83,    30,   267,   110,   102,    98,    99,   100,
     101,   102,   103,   102,   110,   106,    96,     4,    95,   110,
     111,    97,     8,   232,   104,   100,   114,   121,   116,   120,
     173,   106,   188,   189,   190,   118,    95,   180,    97,    66,
     249,    78,   121,   199,   200,   104,    22,    84,    85,    75,
      77,   117,   107,   112,   113,    31,     4,   266,   110,   268,
      51,    52,    53,    54,    55,    25,    17,    18,    19,    20,
      21,    57,    58,    59,    60,    61,    62,   102,   114,   102,
     116,   224,   382,   383,   120,   102,    74,    73,   106,   107,
     108,   109,   235,   236,   237,   251,   252,   253,   254,   255,
     256,   257,   258,   259,   260,   261,   262,   263,   317,   372,
     266,   102,     4,    64,    65,     4,   104,   117,    73,    95,
     118,    97,   385,   279,   112,   113,   282,   283,   104,     4,
       4,   106,   288,   289,   290,     4,   112,   113,   347,   295,
     349,   350,     4,    74,   407,    74,   409,    98,    99,   100,
     101,   102,   103,   309,     4,   106,   107,   108,   109,   110,
     111,   119,   318,   319,   320,    75,   102,   102,    10,    11,
     102,   122,   123,   124,   107,   120,     4,     4,   120,   387,
     388,    98,    99,   100,   101,   394,   103,   102,    98,    99,
     100,   101,   401,   103,   111,    73,   106,   107,   108,   109,
       4,   111,   120,   117,   102,   102,   102,   363,   364,   365,
     366,   367,   368,   369,   370,   371,   102,   373,   374,   375,
     376,   377,   378,   379,   380,     8,   102,   120,   384,   102,
     439,   440,   119,   389,     8,    98,    99,   100,   101,   395,
     103,    98,    99,   100,   101,   102,   103,     8,   404,   106,
     406,    73,   408,   110,   111,   464,    98,    99,   100,   101,
      73,   103,   117,   117,   106,   107,   108,   109,   117,   111,
     117,   102,     4,   429,    57,    58,    59,    60,    61,    62,
     119,   102,   438,   492,   119,   441,    43,   465,     4,   119,
      73,   120,    49,    50,   119,    98,    99,   100,   101,    56,
     103,     4,     4,   106,     4,     4,   462,   463,   111,     4,
       4,   467,    69,    70,    71,    72,     4,   102,    11,   178,
      54,   110,   202,   479,   115,   290,   482,   164,   484,    35,
      36,    37,    38,    39,    40,    41,    42,   152,    44,    45,
      46,    47,    48,    98,    99,   100,   101,   165,   103,   230,
     309,   106,   107,   108,   109,   498,   111,   401,   115,   266,
     155,   118,   404,   467,   207,   120,   123,   124,   125,   126,
     127,   128,   129,   130,    98,    99,   100,   101,   102,   103,
     268,   119,   106,   107,   108,   109,   110,   111,    98,    99,
     100,   101,   102,   103,   314,   185,   106,   107,   108,   109,
      -1,   111,    -1,    -1,    -1,    -1,    -1,    -1,   114,    -1,
     116,   117,   118,    98,    99,   100,   101,    -1,   103,    -1,
      -1,   106,   107,   108,   109,    -1,   111,    98,    99,   100,
     101,   102,   103,    -1,    -1,   106,    -1,    -1,    -1,    -1,
     111,    87,    88,    89,    90,    91,    92,    93,    94
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    22,    24,    28,    31,    63,    79,    96,   104,
     133,   134,   135,   136,   137,   146,   149,   150,   157,   164,
     118,   102,   158,   138,    51,    52,    53,    54,    55,   102,
     208,   209,   165,   147,     4,     0,   135,   232,   233,   151,
     102,   106,   110,   227,   228,   208,   102,   102,    31,    95,
     104,   112,   113,   139,   141,   142,   148,   149,   196,   197,
     198,   119,    75,    98,    99,   100,   101,   103,   106,   107,
     108,   109,   111,   223,   231,   234,   236,   237,   238,     4,
      87,    88,    89,    90,    91,    92,    93,    94,   174,   175,
     176,   102,   117,   175,   140,     4,   142,    97,    79,   143,
     144,   198,   231,    75,    73,   131,     4,    26,    27,   152,
     153,   154,   155,   156,     4,    73,   117,   238,     4,   107,
     175,     4,   110,   231,   235,   236,   208,   102,    25,   154,
     159,   176,   238,   166,   102,   110,   229,   230,   231,    95,
     145,   223,   224,   225,   226,   230,   236,   102,   102,     4,
     160,     4,   167,   117,   118,    73,     4,     4,     5,   104,
     112,   113,   161,   163,   193,   194,   195,     5,   163,   168,
     106,   232,   226,   162,     4,     4,    74,   195,   196,   199,
     169,    74,     4,   119,   208,     5,     7,     8,     9,    12,
      13,    17,    18,    22,    23,    30,    31,    34,    64,    66,
      67,    68,    76,    80,    82,   102,   106,   110,   139,   170,
     183,   185,   189,   201,   210,   211,   212,   213,   214,   216,
     221,   223,   208,   102,   205,   237,   229,   229,   231,   231,
     231,   223,   206,   102,   102,   202,   203,   204,   100,   106,
     239,   231,   120,   231,   120,   174,   224,     4,     4,   120,
     217,    35,    36,    37,    38,    39,    40,    41,    42,    44,
      45,    46,    47,    48,   114,   116,   117,   118,   215,   102,
     208,     8,    57,    58,    59,    60,    61,    62,    73,   222,
       8,    73,   222,    73,   145,   208,   208,   208,   117,   190,
     191,     4,   186,   220,   223,   120,   231,   231,   231,   231,
     231,   231,   231,   231,   231,   231,   231,   231,   231,    17,
      18,    19,    20,    21,    64,    65,   106,   110,   122,   123,
     124,   207,   216,   223,   231,   232,   106,   223,   228,   102,
     229,   229,   231,   229,   229,   231,   231,   102,   200,   102,
     102,   231,   192,   231,   192,   171,   187,    73,   121,    10,
      11,   218,   219,   231,   209,   231,   239,   102,   145,   231,
     231,   231,   102,    43,    49,    50,    56,    69,    70,    71,
      72,   115,   118,   123,   124,   125,   126,   127,   128,   129,
     130,   119,     8,     8,    73,   118,    73,   117,   117,    73,
     121,   121,   178,     4,    11,    67,    81,    83,   184,   188,
     223,   117,   223,   223,    73,   121,    73,   118,    73,   118,
      73,   231,   231,   231,   231,   231,   231,   231,   231,   231,
     232,   231,   231,   231,   231,   231,   231,   231,   231,   117,
     229,   229,   231,   232,   102,   238,   238,   231,     9,    10,
      11,    86,   173,   179,   223,   231,     4,   214,   223,   219,
     231,   232,   231,   232,   102,   119,   231,   119,   231,   223,
     223,   231,    78,    84,    85,   177,     4,   120,   119,   119,
       4,   231,   231,   106,   223,   172,   198,   218,     4,    73,
       4,     4,    73,     4,    73,   180,     4,   121,   231,   231,
     231,    30,    66,    77,   181,     4,     4,     4,   182,   223,
       4,   208,   102
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
    { yyval.i = 0;  }
    break;

  case 13:
#line 416 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 421 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 427 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 16:
#line 435 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 17:
#line 436 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 18:
#line 440 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 19:
#line 441 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 22:
#line 449 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 450 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 451 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 25:
#line 452 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 26:
#line 453 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 28:
#line 457 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 29:
#line 459 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 30:
#line 462 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(interp, yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(interp, str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, cur_unit);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 31:
#line 468 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 33:
#line 476 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 34:
#line 478 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 37:
#line 493 "imcc/imcc.y"
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
#line 509 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 39:
#line 516 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 41:
#line 525 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 46:
#line 536 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 47:
#line 541 "imcc/imcc.y"
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
#line 555 "imcc/imcc.y"
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
#line 571 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 50:
#line 576 "imcc/imcc.y"
    {
          Instruction *i = iSUBROUTINE(cur_unit, yyvsp[-2].sr);
          i->r[1] = yyval.sr = mk_pcc_sub(interp, str_dup(i->r[0]->name), 0);
          add_namespace(interp, cur_unit);
          i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
        }
    break;

  case 51:
#line 583 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 52:
#line 587 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 53:
#line 588 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 54:
#line 589 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 55:
#line 593 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 56:
#line 594 "imcc/imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 59:
#line 603 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 60:
#line 605 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(interp, yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(interp, str_dup(i->r[0]->name), 0);
            add_namespace(interp, cur_unit);
            i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
         }
    break;

  case 61:
#line 612 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 62:
#line 616 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 63:
#line 617 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 64:
#line 618 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 65:
#line 622 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 66:
#line 623 "imcc/imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 67:
#line 628 "imcc/imcc.y"
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

  case 68:
#line 655 "imcc/imcc.y"
    { yyval.i = 0; current_call = NULL; }
    break;

  case 69:
#line 659 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 0; }
    break;

  case 70:
#line 660 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 1; }
    break;

  case 71:
#line 664 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 72:
#line 666 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 73:
#line 669 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 74:
#line 670 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 75:
#line 674 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 76:
#line 675 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 77:
#line 676 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 79:
#line 680 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 80:
#line 681 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 81:
#line 682 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 82:
#line 683 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 83:
#line 684 "imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 84:
#line 685 "imcc/imcc.y"
    {  yyval.t = P_METHOD | P_NONE ; }
    break;

  case 85:
#line 690 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 86:
#line 695 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 87:
#line 697 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-1].sr);
            current_call->r[0]->pcc_sub->nci = 1;
         }
    break;

  case 88:
#line 702 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 89:
#line 704 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 90:
#line 706 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 91:
#line 710 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 92:
#line 716 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 93:
#line 717 "imcc/imcc.y"
    {  add_pcc_arg(current_call->r[0], yyvsp[-1].sr);}
    break;

  case 94:
#line 721 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 95:
#line 722 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 96:
#line 725 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 97:
#line 729 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 98:
#line 730 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 99:
#line 735 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 100:
#line 736 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 101:
#line 737 "imcc/imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 102:
#line 741 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 103:
#line 742 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 106:
#line 752 "imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 107:
#line 755 "imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 108:
#line 756 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 109:
#line 762 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 110:
#line 764 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 111:
#line 766 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 112:
#line 770 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 113:
#line 771 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 114:
#line 776 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 115:
#line 781 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 116:
#line 783 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 117:
#line 788 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 118:
#line 792 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 119:
#line 793 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 120:
#line 794 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 123:
#line 812 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 124:
#line 817 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 125:
#line 818 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 126:
#line 819 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 127:
#line 820 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 128:
#line 824 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 132:
#line 834 "imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 133:
#line 841 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 134:
#line 845 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 135:
#line 853 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 138:
#line 863 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 139:
#line 864 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 140:
#line 865 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 141:
#line 866 "imcc/imcc.y"
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

  case 142:
#line 878 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 143:
#line 879 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 145:
#line 881 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 146:
#line 882 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 147:
#line 883 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 148:
#line 884 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
                                1, mk_ident(interp, yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 149:
#line 886 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 150:
#line 887 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 151:
#line 888 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 152:
#line 889 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 153:
#line 890 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 154:
#line 891 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 155:
#line 892 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 156:
#line 894 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 157:
#line 896 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 158:
#line 898 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 159:
#line 899 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 161:
#line 901 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 162:
#line 905 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 163:
#line 906 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 164:
#line 907 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 165:
#line 908 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 166:
#line 912 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 167:
#line 913 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 168:
#line 914 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 169:
#line 915 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 170:
#line 916 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 171:
#line 917 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 172:
#line 922 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 173:
#line 932 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 174:
#line 933 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 175:
#line 934 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 176:
#line 935 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 177:
#line 936 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 178:
#line 937 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 179:
#line 938 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 180:
#line 939 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 181:
#line 940 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 182:
#line 941 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 183:
#line 942 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 943 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 185:
#line 945 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 947 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 187:
#line 949 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 951 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 189:
#line 953 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 955 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 191:
#line 957 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 959 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 193:
#line 961 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 963 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 195:
#line 965 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 967 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 197:
#line 969 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 198:
#line 971 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 199:
#line 973 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 975 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 977 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 202:
#line 979 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                  mk_sub_address(interp, yyvsp[0].s), NULL, 1); }
    break;

  case 203:
#line 982 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(interp, yyvsp[-2].s),
                                           mk_sub_address(interp, yyvsp[0].s), 1); }
    break;

  case 204:
#line 989 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 205:
#line 992 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 206:
#line 994 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 207:
#line 998 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 208:
#line 1000 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 1002 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 210:
#line 1005 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 211:
#line 1011 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 212:
#line 1015 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 215:
#line 1025 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 216:
#line 1027 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 1029 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 218:
#line 1031 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1033 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 220:
#line 1035 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 221:
#line 1037 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 222:
#line 1039 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 223:
#line 1041 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 1043 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 1045 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 226:
#line 1047 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 227:
#line 1049 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 228:
#line 1054 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 229:
#line 1060 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 230:
#line 1061 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 231:
#line 1062 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 232:
#line 1067 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 233:
#line 1068 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 234:
#line 1069 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 235:
#line 1072 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 236:
#line 1073 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 237:
#line 1078 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 238:
#line 1083 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 239:
#line 1087 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 240:
#line 1088 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 241:
#line 1089 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 242:
#line 1094 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 243:
#line 1095 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 244:
#line 1099 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 245:
#line 1103 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 246:
#line 1104 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 247:
#line 1109 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 248:
#line 1111 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 249:
#line 1113 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 250:
#line 1115 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 251:
#line 1117 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 252:
#line 1119 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 253:
#line 1123 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 254:
#line 1124 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 255:
#line 1125 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 256:
#line 1126 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 257:
#line 1127 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 258:
#line 1128 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 261:
#line 1137 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 262:
#line 1138 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 263:
#line 1142 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 265:
#line 1147 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 266:
#line 1149 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 268:
#line 1157 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 269:
#line 1161 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 270:
#line 1162 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 271:
#line 1166 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 272:
#line 1167 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 277:
#line 1180 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 278:
#line 1181 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 279:
#line 1185 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 280:
#line 1187 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 281:
#line 1188 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 282:
#line 1189 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 283:
#line 1193 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 284:
#line 1199 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 285:
#line 1201 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 286:
#line 1202 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 287:
#line 1206 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 288:
#line 1207 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 289:
#line 1208 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 290:
#line 1209 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 291:
#line 1210 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 292:
#line 1214 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 293:
#line 1215 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 294:
#line 1216 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 295:
#line 1217 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 296:
#line 1221 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 297:
#line 1222 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3482 "imcc/imcparser.c"

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


#line 1227 "imcc/imcc.y"



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

