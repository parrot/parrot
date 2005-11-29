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
     HLL_MAP = 263,
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
     DOT_METHOD = 276,
     SUB = 277,
     SYM = 278,
     LOCAL = 279,
     LEXICAL = 280,
     CONST = 281,
     INC = 282,
     DEC = 283,
     GLOBAL_CONST = 284,
     PLUS_ASSIGN = 285,
     MINUS_ASSIGN = 286,
     MUL_ASSIGN = 287,
     DIV_ASSIGN = 288,
     CONCAT_ASSIGN = 289,
     BAND_ASSIGN = 290,
     BOR_ASSIGN = 291,
     BXOR_ASSIGN = 292,
     FDIV = 293,
     FDIV_ASSIGN = 294,
     MOD_ASSIGN = 295,
     SHR_ASSIGN = 296,
     SHL_ASSIGN = 297,
     SHR_U_ASSIGN = 298,
     SHIFT_LEFT = 299,
     SHIFT_RIGHT = 300,
     INTV = 301,
     FLOATV = 302,
     STRINGV = 303,
     PMCV = 304,
     OBJECTV = 305,
     LOG_XOR = 306,
     RELOP_EQ = 307,
     RELOP_NE = 308,
     RELOP_GT = 309,
     RELOP_GTE = 310,
     RELOP_LT = 311,
     RELOP_LTE = 312,
     GLOBAL = 313,
     GLOBALOP = 314,
     ADDR = 315,
     RESULT = 316,
     RETURN = 317,
     YIELDT = 318,
     POW = 319,
     SHIFT_RIGHT_U = 320,
     LOG_AND = 321,
     LOG_OR = 322,
     COMMA = 323,
     ESUB = 324,
     DOTDOT = 325,
     PCC_BEGIN = 326,
     PCC_END = 327,
     PCC_CALL = 328,
     PCC_SUB = 329,
     PCC_BEGIN_RETURN = 330,
     PCC_END_RETURN = 331,
     PCC_BEGIN_YIELD = 332,
     PCC_END_YIELD = 333,
     NCI_CALL = 334,
     METH_CALL = 335,
     INVOCANT = 336,
     MAIN = 337,
     LOAD = 338,
     IMMEDIATE = 339,
     POSTCOMP = 340,
     METHOD = 341,
     ANON = 342,
     OUTER = 343,
     NEED_LEX = 344,
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
#define N_OPERATORS 261
#define HLL 262
#define HLL_MAP 263
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
#define DOT_METHOD 276
#define SUB 277
#define SYM 278
#define LOCAL 279
#define LEXICAL 280
#define CONST 281
#define INC 282
#define DEC 283
#define GLOBAL_CONST 284
#define PLUS_ASSIGN 285
#define MINUS_ASSIGN 286
#define MUL_ASSIGN 287
#define DIV_ASSIGN 288
#define CONCAT_ASSIGN 289
#define BAND_ASSIGN 290
#define BOR_ASSIGN 291
#define BXOR_ASSIGN 292
#define FDIV 293
#define FDIV_ASSIGN 294
#define MOD_ASSIGN 295
#define SHR_ASSIGN 296
#define SHL_ASSIGN 297
#define SHR_U_ASSIGN 298
#define SHIFT_LEFT 299
#define SHIFT_RIGHT 300
#define INTV 301
#define FLOATV 302
#define STRINGV 303
#define PMCV 304
#define OBJECTV 305
#define LOG_XOR 306
#define RELOP_EQ 307
#define RELOP_NE 308
#define RELOP_GT 309
#define RELOP_GTE 310
#define RELOP_LT 311
#define RELOP_LTE 312
#define GLOBAL 313
#define GLOBALOP 314
#define ADDR 315
#define RESULT 316
#define RETURN 317
#define YIELDT 318
#define POW 319
#define SHIFT_RIGHT_U 320
#define LOG_AND 321
#define LOG_OR 322
#define COMMA 323
#define ESUB 324
#define DOTDOT 325
#define PCC_BEGIN 326
#define PCC_END 327
#define PCC_CALL 328
#define PCC_SUB 329
#define PCC_BEGIN_RETURN 330
#define PCC_END_RETURN 331
#define PCC_BEGIN_YIELD 332
#define PCC_END_YIELD 333
#define NCI_CALL 334
#define METH_CALL 335
#define INVOCANT 336
#define MAIN 337
#define LOAD 338
#define IMMEDIATE 339
#define POSTCOMP 340
#define METHOD 341
#define ANON 342
#define OUTER 343
#define NEED_LEX 344
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
#line 623 "imcc/imcparser.c"
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
#line 644 "imcc/imcparser.c"

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
#define YYFINAL  41
#define YYLAST   598

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  129
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  111
/* YYNRULES -- Number of rules. */
#define YYNRULES  300
/* YYNRULES -- Number of states. */
#define YYNSTATES  514

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
      20,    22,    25,    27,    29,    33,    36,    39,    44,    49,
      53,    59,    60,    67,    68,    75,    77,    80,    84,    87,
      89,    91,    93,    95,    96,   100,   101,   106,   109,   114,
     115,   117,   118,   123,   124,   126,   131,   132,   133,   134,
     145,   146,   148,   152,   153,   159,   160,   162,   167,   172,
     177,   178,   182,   184,   186,   188,   190,   192,   194,   195,
     197,   198,   199,   200,   211,   212,   222,   223,   226,   227,
     231,   232,   234,   236,   240,   242,   244,   246,   248,   250,
     252,   254,   256,   258,   264,   268,   272,   276,   280,   286,
     292,   293,   297,   300,   301,   305,   309,   310,   315,   316,
     319,   321,   323,   325,   327,   329,   331,   333,   334,   340,
     342,   343,   346,   350,   354,   355,   361,   362,   368,   369,
     371,   375,   377,   380,   381,   384,   387,   389,   391,   392,
     394,   397,   399,   401,   405,   407,   411,   413,   415,   418,
     421,   422,   427,   432,   433,   440,   442,   443,   450,   453,
     456,   459,   462,   464,   466,   468,   469,   471,   473,   475,
     477,   479,   481,   483,   487,   492,   497,   502,   508,   514,
     520,   526,   532,   538,   544,   550,   556,   562,   568,   574,
     580,   586,   592,   598,   604,   611,   618,   625,   633,   638,
     643,   650,   658,   663,   668,   673,   678,   685,   693,   697,
     698,   708,   710,   712,   716,   720,   724,   728,   732,   736,
     740,   744,   748,   752,   756,   760,   764,   768,   773,   775,
     777,   779,   783,   787,   791,   793,   795,   796,   802,   803,
     807,   809,   812,   813,   816,   818,   821,   825,   827,   834,
     841,   847,   853,   858,   863,   868,   873,   875,   877,   879,
     881,   883,   885,   887,   889,   890,   892,   896,   898,   900,
     905,   907,   909,   911,   913,   915,   917,   919,   921,   923,
     925,   926,   929,   931,   935,   936,   941,   943,   947,   950,
     953,   955,   957,   959,   961,   963,   965,   967,   969,   971,
     973
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     130,     0,    -1,   131,    -1,   132,    -1,   131,   132,    -1,
     150,    -1,   137,    -1,   136,    -1,   151,    -1,   164,    -1,
     147,    -1,   101,     4,    -1,   133,    -1,     4,    -1,     6,
     134,     4,    -1,   135,     4,    -1,     7,   104,    -1,     8,
     103,    69,   103,    -1,     9,   104,    69,   104,    -1,    59,
     205,    99,    -1,    59,   205,    99,   114,   238,    -1,    -1,
      27,   138,   205,    99,   114,   238,    -1,    -1,    27,   140,
     104,   230,   114,   103,    -1,   142,    -1,   141,   142,    -1,
     196,   143,     4,    -1,   101,     4,    -1,   110,    -1,   109,
      -1,   150,    -1,   139,    -1,    -1,   144,   107,   146,    -1,
      -1,    75,   145,   172,    92,    -1,    14,   231,    -1,    26,
     103,    69,   100,    -1,    -1,   224,    -1,    -1,    93,   148,
     149,    94,    -1,    -1,   141,    -1,    20,   115,   232,   116,
      -1,    -1,    -1,    -1,    23,   152,   227,   153,   172,     4,
     154,   155,   163,    70,    -1,    -1,     4,    -1,   155,   156,
       4,    -1,    -1,     5,   157,   205,    99,   181,    -1,    -1,
      69,    -1,    91,   117,   161,   118,    -1,    89,   117,   103,
     118,    -1,    89,   117,    99,   118,    -1,    -1,   161,    69,
     162,    -1,   162,    -1,    47,    -1,    48,    -1,    50,    -1,
      49,    -1,    99,    -1,    -1,   193,    -1,    -1,    -1,    -1,
      75,   165,    99,   166,   172,     4,   167,   155,   163,    70,
      -1,    -1,    72,     4,   169,   176,   171,   175,   170,   178,
      73,    -1,    -1,   198,     4,    -1,    -1,    82,   231,     4,
      -1,    -1,   173,    -1,   174,    -1,   173,   158,   174,    -1,
      84,    -1,    83,    -1,    85,    -1,    86,    -1,    88,    -1,
      87,    -1,    90,    -1,   159,    -1,   160,    -1,    74,   231,
      69,   231,     4,    -1,    74,   231,     4,    -1,    80,   231,
       4,    -1,    81,   223,     4,    -1,    81,   103,     4,    -1,
      81,   223,    69,   231,     4,    -1,    81,   103,    69,   231,
       4,    -1,    -1,   176,   177,     4,    -1,    11,   216,    -1,
      -1,   178,   179,     4,    -1,    62,   223,   181,    -1,    -1,
      25,   180,   205,    99,    -1,    -1,   181,   182,    -1,    16,
      -1,    17,    -1,    18,    -1,    76,    -1,    78,    -1,    77,
      -1,    79,    -1,    -1,   183,     4,   186,   187,   184,    -1,
     189,    -1,    -1,   187,     4,    -1,   187,   188,     4,    -1,
      63,   231,   217,    -1,    -1,    63,   117,   190,   192,   118,
      -1,    -1,    64,   117,   191,   192,   118,    -1,    -1,   216,
      -1,   192,    69,   216,    -1,   195,    -1,   193,   195,    -1,
      -1,   194,   199,    -1,   101,     4,    -1,   110,    -1,   109,
      -1,    -1,   197,    -1,   197,   198,    -1,   198,    -1,    92,
      -1,   196,   201,     4,    -1,    99,    -1,   200,    69,    99,
      -1,   207,    -1,   221,    -1,    20,    99,    -1,    21,    99,
      -1,    -1,    25,   202,   205,   200,    -1,    26,   103,    69,
     223,    -1,    -1,    27,   203,   205,    99,   114,   238,    -1,
     139,    -1,    -1,    30,   204,   205,    99,   114,   238,    -1,
      63,   213,    -1,    10,   229,    -1,   107,   224,    -1,    14,
     231,    -1,   213,    -1,   168,    -1,   185,    -1,    -1,    47,
      -1,    48,    -1,    49,    -1,    50,    -1,    51,    -1,   206,
      -1,    99,    -1,   223,   114,   231,    -1,   223,   114,   119,
     231,    -1,   223,   114,   120,   231,    -1,   223,   114,   121,
     231,    -1,   223,   114,   231,   122,   231,    -1,   223,   114,
     231,   120,   231,    -1,   223,   114,   231,   123,   231,    -1,
     223,   114,   231,    65,   231,    -1,   223,   114,   231,   124,
     231,    -1,   223,   114,   231,    39,   231,    -1,   223,   114,
     231,   125,   231,    -1,   223,   114,   231,   112,   231,    -1,
     223,   114,   231,    45,   231,    -1,   223,   114,   231,    46,
     231,    -1,   223,   114,   231,    66,   231,    -1,   223,   114,
     231,    67,   231,    -1,   223,   114,   231,    68,   231,    -1,
     223,   114,   231,    52,   231,    -1,   223,   114,   231,   126,
     231,    -1,   223,   114,   231,   127,   231,    -1,   223,   114,
     231,   121,   231,    -1,   223,   114,   231,   115,   232,   116,
      -1,   223,   115,   232,   116,   114,   231,    -1,   223,   114,
      19,   206,    69,   231,    -1,   223,   114,    19,   206,   115,
     232,   116,    -1,   223,   114,    19,   206,    -1,   223,   114,
      19,   231,    -1,   223,   114,    19,   231,    69,   231,    -1,
     223,   114,    19,   231,   115,   232,   116,    -1,   223,   114,
      61,    99,    -1,   223,   114,    60,   239,    -1,    60,   239,
     114,   231,    -1,    19,   223,    69,   231,    -1,    19,   223,
      69,   231,    69,   231,    -1,    19,   223,    69,   231,   115,
     232,   116,    -1,   223,   114,   213,    -1,    -1,   208,   117,
     220,   118,   114,   211,   117,   215,   118,    -1,   209,    -1,
     210,    -1,   223,   114,    14,    -1,   223,    31,   231,    -1,
     223,    32,   231,    -1,   223,    33,   231,    -1,   223,    34,
     231,    -1,   223,    41,   231,    -1,   223,    40,   231,    -1,
     223,    35,   231,    -1,   223,    36,   231,    -1,   223,    37,
     231,    -1,   223,    38,   231,    -1,   223,    42,   231,    -1,
     223,    43,   231,    -1,   223,    44,   231,    -1,   223,   114,
     107,   146,    -1,    99,    -1,   103,    -1,   223,    -1,   223,
     212,   228,    -1,   223,   212,   103,    -1,   223,   212,   223,
      -1,   113,    -1,   111,    -1,    -1,   211,   214,   117,   215,
     118,    -1,    -1,   215,    69,   216,    -1,   216,    -1,   231,
     217,    -1,    -1,   217,   218,    -1,    15,    -1,   223,   181,
      -1,   220,    69,   219,    -1,   219,    -1,    12,   231,   222,
     231,    10,   229,    -1,    13,   231,   222,   231,    10,   229,
      -1,    12,    14,   231,    10,   229,    -1,    13,    14,   231,
      10,   229,    -1,    12,   231,    10,   229,    -1,    13,   231,
      10,   229,    -1,    12,   231,    69,   229,    -1,    13,   231,
      69,   229,    -1,    53,    -1,    54,    -1,    55,    -1,    56,
      -1,    57,    -1,    58,    -1,   108,    -1,   237,    -1,    -1,
     225,    -1,   225,    69,   226,    -1,   226,    -1,   230,    -1,
     223,   115,   232,   116,    -1,   228,    -1,   103,    -1,    99,
      -1,   107,    -1,    99,    -1,   107,    -1,   229,    -1,   231,
      -1,   223,    -1,   238,    -1,    -1,   233,   234,    -1,   236,
      -1,   234,   128,   236,    -1,    -1,   234,    69,   235,   236,
      -1,   231,    -1,   231,    71,   231,    -1,    71,   231,    -1,
     231,    71,    -1,    95,    -1,    96,    -1,    97,    -1,    98,
      -1,   100,    -1,   104,    -1,   105,    -1,   103,    -1,   106,
      -1,    97,    -1,   103,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   397,   397,   401,   403,   406,   408,   409,   410,   411,
     412,   413,   414,   415,   418,   419,   422,   430,   439,   447,
     454,   463,   462,   468,   467,   471,   473,   476,   478,   479,
     480,   481,   482,   485,   485,   490,   489,   500,   502,   507,
     510,   515,   514,   525,   527,   530,   548,   552,   555,   546,
     560,   562,   563,   567,   566,   572,   574,   578,   581,   584,
     589,   591,   592,   595,   597,   598,   599,   600,   612,   614,
     618,   620,   624,   617,   631,   629,   661,   663,   666,   668,
     672,   674,   677,   679,   682,   684,   685,   686,   687,   688,
     689,   690,   691,   694,   700,   702,   707,   709,   711,   715,
     722,   724,   727,   732,   734,   737,   739,   739,   743,   745,
     748,   750,   751,   755,   757,   760,   762,   767,   765,   771,
     776,   778,   780,   784,   790,   788,   797,   796,   805,   807,
     808,   812,   814,   825,   829,   832,   833,   834,   837,   839,
     842,   844,   847,   853,   858,   866,   874,   876,   877,   878,
     879,   879,   892,   896,   896,   898,   899,   899,   901,   905,
     906,   909,   911,   912,   913,   914,   917,   919,   920,   921,
     922,   923,   926,   937,   939,   940,   941,   942,   943,   944,
     945,   946,   947,   948,   949,   950,   952,   954,   956,   958,
     960,   962,   964,   966,   968,   970,   972,   974,   976,   978,
     980,   982,   984,   987,   989,   993,   995,   997,  1000,  1007,
    1006,  1015,  1016,  1017,  1021,  1024,  1026,  1028,  1030,  1032,
    1034,  1036,  1038,  1040,  1042,  1044,  1046,  1050,  1058,  1059,
    1060,  1065,  1066,  1067,  1070,  1071,  1076,  1074,  1084,  1086,
    1087,  1090,  1094,  1096,  1099,  1103,  1106,  1108,  1111,  1114,
    1116,  1118,  1120,  1122,  1124,  1126,  1130,  1132,  1133,  1134,
    1135,  1136,  1139,  1141,  1144,  1146,  1149,  1151,  1154,  1156,
    1163,  1165,  1168,  1170,  1173,  1175,  1178,  1180,  1183,  1185,
    1188,  1188,  1192,  1194,  1196,  1196,  1200,  1206,  1209,  1210,
    1213,  1215,  1216,  1217,  1218,  1221,  1223,  1224,  1225,  1228,
    1230
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "PRAGMA", 
  "N_OPERATORS", "HLL", "HLL_MAP", "GOTO", "ARG", "IF", "UNLESS", "PNULL", 
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
  "pasm_inst", "@3", "@4", "pasm_args", "emit", "@5", "opt_pasmcode", 
  "class_namespace", "sub", "@6", "@7", "@8", "sub_params", "sub_param", 
  "@9", "opt_comma", "multi", "outer", "multi_types", "multi_type", 
  "sub_body", "pcc_sub", "@10", "@11", "@12", "pcc_sub_call", "@13", 
  "opt_label", "opt_invocant", "sub_proto", "sub_proto_list", "proto", 
  "pcc_call", "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@14", 
  "paramtype_list", "paramtype", "begin_ret_or_yield", "end_ret_or_yield", 
  "pcc_ret", "@15", "pcc_returns", "pcc_return", "pcc_return_many", "@16", 
  "@17", "var_returns", "statements", "helper_clear_state", "statement", 
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
     132,   132,   132,   132,   133,   133,   134,   135,   135,   136,
     136,   138,   137,   140,   139,   141,   141,   142,   142,   142,
     142,   142,   142,   144,   143,   145,   143,   143,   143,   143,
     146,   148,   147,   149,   149,   150,   152,   153,   154,   151,
     155,   155,   155,   157,   156,   158,   158,   159,   160,   160,
     161,   161,   161,   162,   162,   162,   162,   162,   163,   163,
     165,   166,   167,   164,   169,   168,   170,   170,   171,   171,
     172,   172,   173,   173,   174,   174,   174,   174,   174,   174,
     174,   174,   174,   175,   175,   175,   175,   175,   175,   175,
     176,   176,   177,   178,   178,   179,   180,   179,   181,   181,
     182,   182,   182,   183,   183,   184,   184,   186,   185,   185,
     187,   187,   187,   188,   190,   189,   191,   189,   192,   192,
     192,   193,   193,   194,   195,   195,   195,   195,   196,   196,
     197,   197,   198,   199,   200,   200,   201,   201,   201,   201,
     202,   201,   201,   203,   201,   201,   204,   201,   201,   201,
     201,   201,   201,   201,   201,   201,   205,   205,   205,   205,
     205,   205,   206,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   208,
     207,   207,   207,   207,   209,   209,   209,   209,   209,   209,
     209,   209,   209,   209,   209,   209,   209,   210,   211,   211,
     211,   211,   211,   211,   212,   212,   214,   213,   215,   215,
     215,   216,   217,   217,   218,   219,   220,   220,   221,   221,
     221,   221,   221,   221,   221,   221,   222,   222,   222,   222,
     222,   222,   223,   223,   224,   224,   225,   225,   226,   226,
     227,   227,   228,   228,   229,   229,   230,   230,   231,   231,
     233,   232,   234,   234,   235,   234,   236,   236,   236,   236,
     237,   237,   237,   237,   237,   238,   238,   238,   238,   239,
     239
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     3,     2,     2,     4,     4,     3,
       5,     0,     6,     0,     6,     1,     2,     3,     2,     1,
       1,     1,     1,     0,     3,     0,     4,     2,     4,     0,
       1,     0,     4,     0,     1,     4,     0,     0,     0,    10,
       0,     1,     3,     0,     5,     0,     1,     4,     4,     4,
       0,     3,     1,     1,     1,     1,     1,     1,     0,     1,
       0,     0,     0,    10,     0,     9,     0,     2,     0,     3,
       0,     1,     1,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     5,     3,     3,     3,     3,     5,     5,
       0,     3,     2,     0,     3,     3,     0,     4,     0,     2,
       1,     1,     1,     1,     1,     1,     1,     0,     5,     1,
       0,     2,     3,     3,     0,     5,     0,     5,     0,     1,
       3,     1,     2,     0,     2,     2,     1,     1,     0,     1,
       2,     1,     1,     3,     1,     3,     1,     1,     2,     2,
       0,     4,     4,     0,     6,     1,     0,     6,     2,     2,
       2,     2,     1,     1,     1,     0,     1,     1,     1,     1,
       1,     1,     1,     3,     4,     4,     4,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     6,     6,     6,     7,     4,     4,
       6,     7,     4,     4,     4,     4,     6,     7,     3,     0,
       9,     1,     1,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     4,     1,     1,
       1,     3,     3,     3,     1,     1,     0,     5,     0,     3,
       1,     2,     0,     2,     1,     2,     3,     1,     6,     6,
       5,     5,     4,     4,     4,     4,     1,     1,     1,     1,
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
       0,    13,     0,     0,     0,     0,    46,    21,     0,    70,
      41,     0,     0,     2,     3,    12,     0,     7,     6,    10,
       5,     8,     9,     0,     0,     0,     0,   280,     0,     0,
     166,   167,   168,   169,   170,   172,     0,   171,     0,   138,
      11,     1,     4,    15,    16,    14,     0,     0,     0,     0,
     272,   271,   273,    47,   270,     0,    19,    71,    23,   142,
       0,    30,    29,    32,   138,    25,     0,    31,    33,   139,
     141,    17,    18,    45,     0,   290,   291,   292,   293,   294,
     297,   295,   296,   298,   262,   278,   286,   281,   282,   263,
     279,    80,     0,     0,    80,     0,    28,    26,    42,     0,
       0,    35,     0,     0,   140,   288,   289,   284,     0,    85,
      84,    86,    87,    89,    88,     0,    90,     0,    91,    92,
       0,    55,    82,     0,    20,     0,     0,    37,     0,    80,
      27,   264,   287,     0,   283,     0,    60,    48,    56,     0,
      22,    72,   274,   275,   276,     0,   277,     0,     0,    34,
     278,    40,   265,   267,   268,   285,     0,     0,    63,    64,
      66,    65,    67,     0,    62,    50,    83,    50,     0,    38,
      36,   280,     0,    59,    58,     0,    57,    51,   133,   133,
      24,     0,   266,    61,    53,     0,   137,   136,     0,     0,
     133,   138,   131,     0,   269,     0,   135,    52,    49,   132,
     165,   134,    73,     0,     0,     0,     0,     0,     0,     0,
       0,   150,     0,   153,   156,     0,     0,     0,     0,   113,
     114,   228,   229,   264,   155,   163,     0,   164,   119,     0,
     146,     0,   211,   212,   236,   162,   147,   230,   108,   159,
       0,     0,     0,     0,   161,     0,   148,   149,     0,     0,
       0,     0,   299,   300,     0,   124,   158,   230,   126,    74,
     160,   117,   143,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   235,   234,
       0,   280,     0,    54,     0,     0,   256,   257,   258,   259,
     260,   261,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   128,   128,   100,   120,   247,     0,
     108,   238,   214,   215,   216,   217,   220,   221,   222,   223,
     219,   218,   224,   225,   226,   213,     0,     0,     0,   297,
     264,     0,     0,     0,   208,   278,   173,     0,   232,   233,
     231,   110,   111,   112,   109,     0,   252,   254,     0,     0,
     253,   255,     0,   205,   144,   151,   152,     0,     0,   204,
       0,   129,   242,     0,    78,     0,     0,     0,   245,     0,
     240,   198,   199,   203,   202,   227,   174,   175,   176,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   280,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   250,     0,
     251,     0,     0,   280,     0,     0,     0,     0,   125,   241,
     127,     0,     0,     0,     0,   121,     0,   115,   116,   118,
       0,   246,     0,     0,   237,     0,   280,     0,   280,   182,
     185,   186,   190,   180,   187,   188,   189,   184,     0,   178,
     193,   177,   179,   181,   183,   191,   192,     0,   248,   249,
     206,     0,   145,   154,   157,   130,   244,   243,   102,     0,
       0,     0,     0,    76,   101,   242,   122,     0,   239,   196,
       0,   200,     0,   194,   195,   207,    79,     0,     0,     0,
       0,   103,     0,   123,   238,   197,   201,    94,     0,    95,
      97,     0,    96,     0,     0,    77,     0,     0,     0,     0,
     106,     0,    75,     0,   210,    93,    99,    98,     0,   108,
     104,     0,   105,   107
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    12,    13,    14,    15,    24,    16,    17,    18,    29,
      63,    95,    64,    65,   102,   103,   129,   149,    19,    39,
      66,    20,    21,    28,    91,   165,   178,   188,   195,   139,
     118,   119,   163,   164,   189,    22,    38,    94,   167,   225,
     306,   481,   413,   120,   121,   122,   463,   364,   414,   494,
     503,   508,   283,   344,   226,   419,   227,   307,   365,   420,
     228,   304,   305,   360,   190,   191,   192,    68,    69,    70,
     201,   355,   229,   248,   250,   251,    36,    37,   230,   231,
     232,   233,   234,   282,   235,   264,   369,   361,   409,   457,
     308,   309,   236,   293,    85,   151,   152,   153,    53,    54,
     144,   154,   362,    48,    49,    87,   133,    88,    89,    90,
     254
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -307
static const short yypact[] =
{
     182,  -307,    24,   -83,   -66,   -74,  -307,  -307,    -3,  -307,
    -307,    54,    60,   182,  -307,  -307,    61,  -307,  -307,  -307,
    -307,  -307,  -307,    -9,   105,    41,    48,  -307,   108,    -3,
    -307,  -307,  -307,  -307,  -307,  -307,    27,  -307,    32,    47,
    -307,  -307,  -307,  -307,  -307,  -307,    52,    36,    58,   261,
    -307,  -307,  -307,  -307,  -307,    84,    70,  -307,  -307,  -307,
     185,  -307,  -307,  -307,   193,  -307,   116,  -307,    13,   120,
    -307,  -307,  -307,  -307,   444,  -307,  -307,  -307,  -307,  -307,
    -307,  -307,  -307,  -307,  -307,  -307,   145,   -53,  -307,  -307,
    -307,   507,   103,    39,   507,   110,  -307,  -307,  -307,   444,
     115,  -307,   232,   133,  -307,  -307,   444,  -307,   261,  -307,
    -307,  -307,  -307,  -307,  -307,   131,  -307,   132,  -307,  -307,
     246,     1,  -307,    39,  -307,   248,   416,  -307,   184,   507,
    -307,   416,  -307,   261,  -307,    30,     5,  -307,  -307,   507,
    -307,  -307,  -307,  -307,  -307,   146,  -307,   159,   170,  -307,
     154,  -307,   201,  -307,  -307,  -307,   160,   162,  -307,  -307,
    -307,  -307,  -307,   -57,  -307,   277,  -307,   277,   179,  -307,
    -307,  -307,   416,  -307,  -307,     5,  -307,  -307,    37,    37,
    -307,   176,  -307,  -307,  -307,   282,  -307,  -307,   291,   226,
     197,   120,  -307,   227,  -307,    -3,  -307,  -307,  -307,  -307,
     367,  -307,  -307,   200,   -70,    72,   168,   444,   360,   202,
     205,  -307,   206,   196,  -307,    55,   401,   188,   304,  -307,
    -307,  -307,  -307,   416,  -307,  -307,   306,  -307,  -307,   307,
    -307,   195,  -307,  -307,  -307,  -307,  -307,   287,  -307,  -307,
     444,   139,   444,   189,  -307,   244,  -307,  -307,    -3,   245,
      -3,    -3,  -307,  -307,   203,  -307,  -307,    74,  -307,  -307,
    -307,  -307,  -307,   360,   209,   444,   444,   444,   444,   444,
     444,   444,   444,   444,   444,   444,   444,   444,  -307,  -307,
      16,  -307,   458,   143,   324,   -70,  -307,  -307,  -307,  -307,
    -307,  -307,   -70,   444,   325,   -70,   -70,   444,   444,   237,
     360,   247,   256,   444,   444,   444,  -307,  -307,  -307,   -55,
    -307,   444,  -307,  -307,  -307,  -307,  -307,  -307,  -307,  -307,
    -307,  -307,  -307,  -307,  -307,  -307,   430,    55,   263,   251,
     416,   444,   444,   444,  -307,   -77,   368,   255,  -307,  -307,
    -307,  -307,  -307,  -307,  -307,   -70,  -307,  -307,   353,   -70,
    -307,  -307,   363,   -10,  -307,   309,  -307,   262,   268,  -307,
     -50,  -307,  -307,   -46,     0,     6,   360,   270,   143,   -20,
    -307,    -7,    12,  -307,  -307,  -307,  -307,  -307,  -307,   444,
     444,   444,   444,   444,   444,   444,   444,   444,  -307,   444,
     444,   444,   444,   444,   444,   444,   444,   275,  -307,   -70,
    -307,   -70,   444,  -307,   276,    39,    39,   444,  -307,   375,
    -307,   444,   444,   -56,   387,  -307,   444,  -307,  -307,  -307,
     392,  -307,   472,   444,  -307,   444,  -307,   444,  -307,  -307,
    -307,  -307,  -307,  -307,  -307,  -307,  -307,  -307,   283,  -307,
    -307,  -307,  -307,  -307,  -307,  -307,  -307,   444,  -307,  -307,
    -307,   288,  -307,  -307,  -307,  -307,  -307,  -307,  -307,   399,
     444,   444,   481,   120,  -307,  -307,  -307,   289,  -307,  -307,
     292,  -307,   293,  -307,  -307,  -307,  -307,     4,   406,     9,
      11,  -307,   407,   375,   444,  -307,  -307,  -307,   444,  -307,
    -307,   444,  -307,   444,   100,  -307,   -19,   408,   411,   412,
    -307,   360,  -307,   413,  -307,  -307,  -307,  -307,    -3,  -307,
    -307,   322,   143,  -307
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -307,  -307,  -307,   409,  -307,  -307,  -307,  -307,  -307,  -307,
     223,  -307,  -307,   361,  -307,  -307,  -307,    94,  -307,  -307,
    -307,   -13,  -307,  -307,  -307,  -307,   259,  -307,  -307,  -307,
    -307,  -307,  -307,   253,   250,  -307,  -307,  -307,  -307,  -307,
    -307,  -307,  -307,   -73,  -307,   298,  -307,  -307,  -307,  -307,
    -307,  -307,  -306,  -307,  -307,  -307,  -307,  -307,  -307,  -307,
    -307,  -307,  -307,   127,  -307,  -307,   252,   249,  -307,   -68,
    -307,  -307,  -307,  -307,  -307,  -307,   -29,   112,  -307,  -307,
    -307,  -307,    19,  -307,  -188,  -307,   -40,  -305,   -18,  -307,
      82,  -307,  -307,   207,  -129,   229,  -307,   281,  -307,   172,
    -195,   333,   -42,  -149,  -307,  -307,  -307,    -5,  -307,   -90,
     134
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -231
static const short yytable[] =
{
      55,   104,   150,   124,   368,   -81,   370,    86,   487,   239,
     415,   411,   175,   490,   366,   492,   107,   -39,   460,   407,
      25,   125,   181,   407,   461,   462,    67,    99,   256,   142,
     325,    23,   105,   140,   278,   326,   279,   143,    26,   100,
    -230,    27,   184,   150,    30,    31,    32,    33,    34,   423,
     423,    67,   158,   159,   160,   161,   148,   127,    40,   402,
      41,   176,   425,   367,   132,    43,    86,     5,   408,   416,
     138,   237,   410,   488,    58,   108,   327,   328,   491,   245,
     493,   427,   412,   417,   146,   418,   240,   257,   101,   146,
     346,    86,   334,   -81,   150,    44,    35,   347,   424,   504,
     350,   351,   455,   134,   162,   403,   458,   -68,   426,    45,
      46,    75,    76,    77,    78,   221,    79,    47,   468,   329,
      81,    82,    83,   330,    84,   500,    56,   428,   155,   156,
     146,    57,   337,   157,   310,   331,   332,   333,   185,    59,
      72,   -43,    80,    81,    82,    83,   186,   187,    60,   285,
     398,   335,   252,   339,   400,    71,    61,    62,   253,   341,
     342,   343,   501,   241,   243,   244,   203,    75,    76,    77,
      78,   356,    79,   502,    73,    80,    81,    82,    83,   370,
      84,   146,   242,    92,    93,   278,     1,   279,     2,    96,
       3,     4,   286,   287,   288,   289,   290,   291,   284,   295,
     294,   150,     5,   512,   448,     6,   449,    50,   292,     7,
      98,    51,    59,     5,   126,    52,   106,   123,   128,   299,
      58,   301,   302,   312,   313,   314,   315,   316,   317,   318,
     319,   320,   321,   322,   323,   324,   130,   310,   336,   438,
     131,     8,   286,   287,   288,   289,   290,   291,   135,   136,
     137,   348,   141,   147,   451,   352,   353,     9,   296,   169,
     168,   359,   170,    75,    76,    77,    78,   -69,    79,   171,
     172,    80,    81,    82,    83,    10,    84,   470,   173,   472,
     174,   177,   180,    11,   372,    59,   196,   -44,   146,   376,
     377,   378,   194,   257,    60,   197,   198,   202,   185,   238,
     -23,   246,    61,    62,   247,   258,   186,   187,   259,   249,
     261,   262,   263,   298,   300,   453,   454,   303,   265,   266,
     267,   268,   269,   270,   271,   272,   311,   273,   274,   275,
     276,   277,    74,   480,   345,   349,   354,   429,   430,   431,
     432,   433,   434,   435,   436,   437,   357,   439,   440,   441,
     442,   443,   444,   445,   446,   358,    75,    76,    77,    78,
     450,    79,   374,   399,    80,    81,    82,    83,  -229,    84,
     459,   397,   509,   401,   465,   452,   405,   204,   404,   205,
     206,   207,   406,   469,   422,   471,   208,   209,   210,   447,
     456,   464,   211,   212,   213,   482,   466,   214,   278,   473,
     279,   280,   281,   476,   475,   474,   484,   379,   485,   486,
     489,   495,   505,   380,   381,   506,   507,   510,   477,   478,
     382,   513,    42,   224,   375,    97,   179,   215,   183,   193,
     216,   217,   363,   383,   384,   385,   386,   166,   371,   218,
     200,   467,   199,   219,   496,   220,   497,   483,   421,   498,
     297,   499,   260,   182,   340,    75,    76,    77,    78,   145,
      79,   373,    75,    76,    77,    78,   221,    79,    84,     0,
     222,     0,     0,     0,   223,    84,     0,     0,     0,   511,
     387,     0,     0,   388,  -209,     0,     0,     0,   389,   390,
     391,   392,   393,   394,   395,   396,    75,    76,    77,    78,
     221,    79,     0,     0,   222,     0,     0,     0,     0,    84,
       0,    75,    76,    77,    78,   142,    79,     0,   255,    80,
      81,    82,    83,   143,    84,    75,    76,    77,    78,    35,
      79,     0,     0,    80,    81,    82,    83,     0,    84,    75,
      76,    77,    78,     0,    79,     0,     0,    80,    81,    82,
      83,     0,    84,    75,    76,    77,    78,    50,    79,     0,
       0,   338,     0,     0,     0,    52,    84,    75,    76,    77,
      78,   221,    79,     0,     0,   222,    75,    76,    77,    78,
      84,    79,     0,     0,   479,     0,     0,     0,     0,    84,
     109,   110,   111,   112,   113,   114,   115,   116,   117
};

static const short yycheck[] =
{
      29,    69,   131,    93,   310,     4,   311,    49,     4,   204,
       4,    11,    69,     4,    69,     4,    69,     4,    74,    69,
     103,    94,   171,    69,    80,    81,    39,    14,   216,    99,
      14,     7,    74,   123,   111,    19,   113,   107,   104,    26,
     117,   115,     5,   172,    47,    48,    49,    50,    51,    69,
      69,    64,    47,    48,    49,    50,   129,    99,     4,    69,
       0,   118,    69,   118,   106,     4,   108,    20,   118,    63,
      69,   200,   118,    69,    27,   128,    60,    61,    69,   208,
      69,    69,    82,    77,   126,    79,    14,   216,    75,   131,
     285,   133,   280,    92,   223,   104,    99,   292,   118,   118,
     295,   296,   407,   108,    99,   115,   411,    70,   115,     4,
      69,    95,    96,    97,    98,    99,   100,    69,   423,   103,
     104,   105,   106,   107,   108,    25,    99,   115,   133,    99,
     172,    99,   281,   103,   263,   119,   120,   121,   101,    92,
     104,    94,   103,   104,   105,   106,   109,   110,   101,    10,
     345,   280,    97,   282,   349,   103,   109,   110,   103,    16,
      17,    18,    62,   205,   206,   207,   195,    95,    96,    97,
      98,   300,   100,    73,   116,   103,   104,   105,   106,   484,
     108,   223,    14,    99,   114,   111,     4,   113,     6,     4,
       8,     9,    53,    54,    55,    56,    57,    58,   240,    10,
     242,   330,    20,   509,   399,    23,   401,    99,    69,    27,
      94,   103,    92,    20,   104,   107,    71,   114,   103,   248,
      27,   250,   251,   265,   266,   267,   268,   269,   270,   271,
     272,   273,   274,   275,   276,   277,     4,   366,   280,   388,
     107,    59,    53,    54,    55,    56,    57,    58,   117,   117,
       4,   293,     4,    69,   403,   297,   298,    75,    69,   100,
     114,   303,    92,    95,    96,    97,    98,    70,   100,   115,
      69,   103,   104,   105,   106,    93,   108,   426,   118,   428,
     118,     4,   103,   101,   326,    92,     4,    94,   330,   331,
     332,   333,   116,   422,   101,     4,    70,    70,   101,    99,
     104,    99,   109,   110,    99,   117,   109,   110,     4,   103,
       4,     4,   117,    69,    69,   405,   406,   114,    31,    32,
      33,    34,    35,    36,    37,    38,   117,    40,    41,    42,
      43,    44,    71,   462,    10,    10,    99,   379,   380,   381,
     382,   383,   384,   385,   386,   387,    99,   389,   390,   391,
     392,   393,   394,   395,   396,    99,    95,    96,    97,    98,
     402,   100,    99,    10,   103,   104,   105,   106,   117,   108,
     412,   116,   501,    10,   416,    99,   114,    10,    69,    12,
      13,    14,   114,   425,   114,   427,    19,    20,    21,   114,
      15,     4,    25,    26,    27,   463,     4,    30,   111,   116,
     113,   114,   115,     4,   116,   447,   117,    39,   116,   116,
       4,     4,     4,    45,    46,     4,     4,     4,   460,   461,
      52,    99,    13,   200,   330,    64,   167,    60,   175,   179,
      63,    64,   305,    65,    66,    67,    68,   139,   326,    72,
     191,   422,   190,    76,   484,    78,   488,   465,   366,   491,
     243,   493,   223,   172,   282,    95,    96,    97,    98,   126,
     100,   327,    95,    96,    97,    98,    99,   100,   108,    -1,
     103,    -1,    -1,    -1,   107,   108,    -1,    -1,    -1,   508,
     112,    -1,    -1,   115,   117,    -1,    -1,    -1,   120,   121,
     122,   123,   124,   125,   126,   127,    95,    96,    97,    98,
      99,   100,    -1,    -1,   103,    -1,    -1,    -1,    -1,   108,
      -1,    95,    96,    97,    98,    99,   100,    -1,   117,   103,
     104,   105,   106,   107,   108,    95,    96,    97,    98,    99,
     100,    -1,    -1,   103,   104,   105,   106,    -1,   108,    95,
      96,    97,    98,    -1,   100,    -1,    -1,   103,   104,   105,
     106,    -1,   108,    95,    96,    97,    98,    99,   100,    -1,
      -1,   103,    -1,    -1,    -1,   107,   108,    95,    96,    97,
      98,    99,   100,    -1,    -1,   103,    95,    96,    97,    98,
     108,   100,    -1,    -1,   103,    -1,    -1,    -1,    -1,   108,
      83,    84,    85,    86,    87,    88,    89,    90,    91
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,     9,    20,    23,    27,    59,    75,
      93,   101,   130,   131,   132,   133,   135,   136,   137,   147,
     150,   151,   164,     7,   134,   103,   104,   115,   152,   138,
      47,    48,    49,    50,    51,    99,   205,   206,   165,   148,
       4,     0,   132,     4,   104,     4,    69,    69,   232,   233,
      99,   103,   107,   227,   228,   205,    99,    99,    27,    92,
     101,   109,   110,   139,   141,   142,   149,   150,   196,   197,
     198,   103,   104,   116,    71,    95,    96,    97,    98,   100,
     103,   104,   105,   106,   108,   223,   231,   234,   236,   237,
     238,   153,    99,   114,   166,   140,     4,   142,    94,    14,
      26,    75,   143,   144,   198,   231,    71,    69,   128,    83,
      84,    85,    86,    87,    88,    89,    90,    91,   159,   160,
     172,   173,   174,   114,   238,   172,   104,   231,   103,   145,
       4,   107,   231,   235,   236,   117,   117,     4,    69,   158,
     238,     4,    99,   107,   229,   230,   231,    69,   172,   146,
     223,   224,   225,   226,   230,   236,    99,   103,    47,    48,
      49,    50,    99,   161,   162,   154,   174,   167,   114,   100,
      92,   115,    69,   118,   118,    69,   118,     4,   155,   155,
     103,   232,   226,   162,     5,   101,   109,   110,   156,   163,
     193,   194,   195,   163,   116,   157,     4,     4,    70,   195,
     196,   199,    70,   205,    10,    12,    13,    14,    19,    20,
      21,    25,    26,    27,    30,    60,    63,    64,    72,    76,
      78,    99,   103,   107,   139,   168,   183,   185,   189,   201,
     207,   208,   209,   210,   211,   213,   221,   223,    99,   229,
      14,   231,    14,   231,   231,   223,    99,    99,   202,   103,
     203,   204,    97,   103,   239,   117,   213,   223,   117,     4,
     224,     4,     4,   117,   214,    31,    32,    33,    34,    35,
      36,    37,    38,    40,    41,    42,    43,    44,   111,   113,
     114,   115,   212,   181,   231,    10,    53,    54,    55,    56,
      57,    58,    69,   222,   231,    10,    69,   222,    69,   205,
      69,   205,   205,   114,   190,   191,   169,   186,   219,   220,
     223,   117,   231,   231,   231,   231,   231,   231,   231,   231,
     231,   231,   231,   231,   231,    14,    19,    60,    61,   103,
     107,   119,   120,   121,   213,   223,   231,   232,   103,   223,
     228,    16,    17,    18,   182,    10,   229,   229,   231,    10,
     229,   229,   231,   231,    99,   200,   223,    99,    99,   231,
     192,   216,   231,   192,   176,   187,    69,   118,   181,   215,
     216,   206,   231,   239,    99,   146,   231,   231,   231,    39,
      45,    46,    52,    65,    66,    67,    68,   112,   115,   120,
     121,   122,   123,   124,   125,   126,   127,   116,   229,    10,
     229,    10,    69,   115,    69,   114,   114,    69,   118,   217,
     118,    11,    82,   171,   177,     4,    63,    77,    79,   184,
     188,   219,   114,    69,   118,    69,   115,    69,   115,   231,
     231,   231,   231,   231,   231,   231,   231,   231,   232,   231,
     231,   231,   231,   231,   231,   231,   231,   114,   229,   229,
     231,   232,    99,   238,   238,   216,    15,   218,   216,   231,
      74,    80,    81,   175,     4,   231,     4,   211,   216,   231,
     232,   231,   232,   116,   231,   116,     4,   231,   231,   103,
     223,   170,   198,   217,   117,   116,   116,     4,    69,     4,
       4,    69,     4,    69,   178,     4,   215,   231,   231,   231,
      25,    62,    73,   179,   118,     4,     4,     4,   180,   223,
       4,   205,   181,    99
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
#line 440 "imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                IMCC_INFO(interp)->HLL_id, atoi(yyvsp[-2].s), atoi(yyvsp[0].s));
             yyval.t = 0;
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
#line 455 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 21:
#line 463 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 22:
#line 464 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 23:
#line 468 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 24:
#line 469 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 27:
#line 477 "imcc/imcc.y"
    { yyval.i = 0; }
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
    { yyval.i = yyvsp[0].i; }
    break;

  case 33:
#line 485 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 34:
#line 487 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 35:
#line 490 "imcc/imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                    }
    break;

  case 36:
#line 495 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, yyvsp[0].s));
                     cur_call->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 37:
#line 501 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 38:
#line 503 "imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, yyvsp[0].s);
                       set_lexical(interp, r, yyvsp[-2].s); yyval.i = 0;
                   }
    break;

  case 39:
#line 507 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 41:
#line 515 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 42:
#line 517 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 45:
#line 532 "imcc/imcc.y"
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

  case 46:
#line 548 "imcc/imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 47:
#line 552 "imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, yyvsp[0].sr);
        }
    break;

  case 48:
#line 555 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 49:
#line 557 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 50:
#line 561 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 51:
#line 562 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 52:
#line 563 "imcc/imcc.y"
    { add_pcc_param(cur_call, yyvsp[-1].sr);}
    break;

  case 53:
#line 567 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 54:
#line 568 "imcc/imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-2].t);
                                         is_def=0; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 55:
#line 573 "imcc/imcc.y"
    { yyval.t = 0;  }
    break;

  case 57:
#line 578 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 58:
#line 582 "imcc/imcc.y"
    { yyval.t = 0; cur_unit->outer =
                     mk_sub_address_fromc(interp, yyvsp[-1].s); }
    break;

  case 59:
#line 585 "imcc/imcc.y"
    { yyval.t = 0; cur_unit->outer =
                     mk_const(interp, yyvsp[-1].s, 'S'); }
    break;

  case 60:
#line 590 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 61:
#line 591 "imcc/imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); }
    break;

  case 62:
#line 592 "imcc/imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);}
    break;

  case 63:
#line 596 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 64:
#line 597 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 65:
#line 598 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 66:
#line 599 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 67:
#line 600 "imcc/imcc.y"
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

  case 70:
#line 618 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 71:
#line 620 "imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, yyvsp[0].s));

         }
    break;

  case 72:
#line 624 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 73:
#line 626 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 74:
#line 631 "imcc/imcc.y"
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

  case 75:
#line 658 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 76:
#line 662 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 77:
#line 663 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 78:
#line 667 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 79:
#line 669 "imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 80:
#line 673 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 82:
#line 678 "imcc/imcc.y"
    { yyval.t = yyvsp[0].t; }
    break;

  case 83:
#line 679 "imcc/imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; }
    break;

  case 84:
#line 683 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 85:
#line 684 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 86:
#line 685 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 87:
#line 686 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 88:
#line 687 "imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 89:
#line 688 "imcc/imcc.y"
    {  yyval.t = P_METHOD; }
    break;

  case 90:
#line 689 "imcc/imcc.y"
    {  yyval.t = P_NEED_LEX; }
    break;

  case 93:
#line 696 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 94:
#line 701 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 95:
#line 703 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-1].sr);
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 96:
#line 708 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 97:
#line 710 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 98:
#line 712 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 99:
#line 716 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 100:
#line 723 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 101:
#line 724 "imcc/imcc.y"
    {  add_pcc_arg(cur_call, yyvsp[-1].sr); }
    break;

  case 102:
#line 728 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 103:
#line 733 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 104:
#line 734 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(cur_call, yyvsp[-1].sr); }
    break;

  case 105:
#line 738 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 106:
#line 739 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 107:
#line 740 "imcc/imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 108:
#line 744 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 109:
#line 745 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 110:
#line 749 "imcc/imcc.y"
    {  yyval.t = VT_FLAT;   }
    break;

  case 111:
#line 750 "imcc/imcc.y"
    {  yyval.t = VT_OPTIONAL; }
    break;

  case 112:
#line 751 "imcc/imcc.y"
    {  yyval.t = VT_OPT_FLAG; }
    break;

  case 113:
#line 756 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 114:
#line 757 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 117:
#line 767 "imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 118:
#line 770 "imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 119:
#line 771 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 120:
#line 777 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 121:
#line 779 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 122:
#line 781 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 123:
#line 785 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 124:
#line 790 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 125:
#line 795 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 126:
#line 797 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 127:
#line 802 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 128:
#line 806 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 129:
#line 807 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 130:
#line 808 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 133:
#line 826 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 134:
#line 831 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 135:
#line 832 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 136:
#line 833 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 137:
#line 834 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 138:
#line 838 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 142:
#line 848 "imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 143:
#line 855 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 144:
#line 859 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 145:
#line 867 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 148:
#line 877 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 149:
#line 878 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 150:
#line 879 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 151:
#line 880 "imcc/imcc.y"
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

  case 152:
#line 893 "imcc/imcc.y"
    {
                       set_lexical(interp, yyvsp[0].sr, yyvsp[-2].s); yyval.i = 0;
                    }
    break;

  case 153:
#line 896 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 154:
#line 897 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 156:
#line 899 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 157:
#line 900 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 158:
#line 901 "imcc/imcc.y"
    { yyval.i = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 159:
#line 905 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 160:
#line 907 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 161:
#line 910 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 162:
#line 911 "imcc/imcc.y"
    {  yyval.i = 0; cur_call = NULL; }
    break;

  case 163:
#line 912 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 165:
#line 914 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 166:
#line 918 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 167:
#line 919 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 168:
#line 920 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 169:
#line 921 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 170:
#line 922 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 171:
#line 923 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 172:
#line 928 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 173:
#line 938 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 174:
#line 939 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 175:
#line 940 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 176:
#line 941 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 177:
#line 942 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 178:
#line 943 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 179:
#line 944 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 180:
#line 945 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 181:
#line 946 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 182:
#line 947 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 183:
#line 948 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 949 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 185:
#line 951 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 953 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 187:
#line 955 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 957 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 189:
#line 959 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 961 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 191:
#line 963 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 965 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 193:
#line 967 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 969 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 195:
#line 971 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 973 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 197:
#line 975 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 198:
#line 977 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 199:
#line 979 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 981 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 983 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 202:
#line 985 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 203:
#line 988 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 204:
#line 990 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 205:
#line 994 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 996 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 998 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 208:
#line 1001 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            cur_call = NULL;
            yyval.i = 0;
         }
    break;

  case 209:
#line 1007 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 210:
#line 1011 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           cur_call = NULL;
         }
    break;

  case 213:
#line 1018 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[-2].sr); }
    break;

  case 214:
#line 1023 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 215:
#line 1025 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 216:
#line 1027 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 1029 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 218:
#line 1031 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1033 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 220:
#line 1035 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 221:
#line 1037 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 222:
#line 1039 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 223:
#line 1041 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 1043 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 1045 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 226:
#line 1047 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 227:
#line 1052 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 228:
#line 1058 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 229:
#line 1059 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 230:
#line 1060 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 231:
#line 1065 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 232:
#line 1066 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 233:
#line 1067 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 234:
#line 1070 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 235:
#line 1071 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 236:
#line 1076 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 237:
#line 1081 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 238:
#line 1085 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 239:
#line 1086 "imcc/imcc.y"
    {  yyval.sr = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 240:
#line 1087 "imcc/imcc.y"
    {  yyval.sr = 0; add_pcc_arg(cur_call, yyvsp[0].sr); }
    break;

  case 241:
#line 1091 "imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 242:
#line 1095 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 243:
#line 1096 "imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 244:
#line 1100 "imcc/imcc.y"
    {  yyval.t = VT_FLAT; }
    break;

  case 245:
#line 1103 "imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 246:
#line 1107 "imcc/imcc.y"
    { yyval.sr = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 247:
#line 1108 "imcc/imcc.y"
    { yyval.sr = 0; add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 248:
#line 1113 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 249:
#line 1115 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 250:
#line 1117 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 251:
#line 1119 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 252:
#line 1121 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 253:
#line 1123 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 254:
#line 1125 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 255:
#line 1127 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 256:
#line 1131 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 257:
#line 1132 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 258:
#line 1133 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 259:
#line 1134 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 260:
#line 1135 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 261:
#line 1136 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 264:
#line 1145 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 265:
#line 1146 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 266:
#line 1150 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 268:
#line 1155 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 269:
#line 1157 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 271:
#line 1165 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 272:
#line 1169 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 273:
#line 1170 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 274:
#line 1174 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 275:
#line 1175 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 280:
#line 1188 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 281:
#line 1189 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 282:
#line 1193 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 283:
#line 1195 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 284:
#line 1196 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 285:
#line 1197 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 286:
#line 1201 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 287:
#line 1207 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 288:
#line 1209 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 289:
#line 1210 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 290:
#line 1214 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 291:
#line 1215 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 292:
#line 1216 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 293:
#line 1217 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 294:
#line 1218 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 295:
#line 1222 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 296:
#line 1223 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 297:
#line 1224 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 298:
#line 1225 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 299:
#line 1229 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 300:
#line 1230 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3507 "imcc/imcparser.c"

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


#line 1235 "imcc/imcc.y"



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

