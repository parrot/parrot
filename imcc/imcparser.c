/* A Bison parser, made by GNU Bison 2.1.  */

/* Skeleton parser for Yacc-like parsing with Bison,
   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005 Free Software Foundation, Inc.

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
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Bison version.  */
#define YYBISON_VERSION "2.1"

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
/* Tokens.  */
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

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined (YYSTYPE) && ! defined (YYSTYPE_IS_DECLARED)
#line 319 "imcc/imcc.y"
typedef union YYSTYPE {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} YYSTYPE;
/* Line 196 of yacc.c.  */
#line 635 "imcc/imcparser.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 219 of yacc.c.  */
#line 647 "imcc/imcparser.c"

#if ! defined (YYSIZE_T) && defined (__SIZE_TYPE__)
# define YYSIZE_T __SIZE_TYPE__
#endif
#if ! defined (YYSIZE_T) && defined (size_t)
# define YYSIZE_T size_t
#endif
#if ! defined (YYSIZE_T) && (defined (__STDC__) || defined (__cplusplus))
# include <stddef.h> /* INFRINGES ON USER NAME SPACE */
# define YYSIZE_T size_t
#endif
#if ! defined (YYSIZE_T)
# define YYSIZE_T unsigned int
#endif

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

#if ! defined (yyoverflow) || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if defined (__STDC__) || defined (__cplusplus)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     define YYINCLUDED_STDLIB_H
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning. */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2005 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM ((YYSIZE_T) -1)
#  endif
#  ifdef __cplusplus
extern "C" {
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if (! defined (malloc) && ! defined (YYINCLUDED_STDLIB_H) \
	&& (defined (__STDC__) || defined (__cplusplus)))
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if (! defined (free) && ! defined (YYINCLUDED_STDLIB_H) \
	&& (defined (__STDC__) || defined (__cplusplus)))
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifdef __cplusplus
}
#  endif
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
	  YYSIZE_T yyi;				\
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
#define YYFINAL  41
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   605

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  129
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  110
/* YYNRULES -- Number of rules. */
#define YYNRULES  299
/* YYNRULES -- Number of states. */
#define YYNSTATES  513

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   367

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

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
static const unsigned short int yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    25,    27,    29,    33,    36,    39,    44,    49,
      53,    59,    60,    67,    68,    75,    77,    80,    84,    87,
      89,    91,    93,    95,    96,   100,   104,   107,   112,   113,
     115,   116,   121,   122,   124,   129,   130,   131,   132,   143,
     144,   146,   150,   151,   157,   158,   160,   165,   170,   175,
     176,   180,   182,   184,   186,   188,   190,   192,   193,   195,
     196,   197,   198,   209,   210,   220,   221,   224,   225,   229,
     230,   232,   234,   238,   240,   242,   244,   246,   248,   250,
     252,   254,   256,   262,   266,   270,   274,   278,   284,   290,
     291,   295,   298,   299,   303,   307,   308,   313,   314,   317,
     319,   321,   323,   325,   327,   329,   331,   332,   338,   340,
     341,   344,   348,   352,   353,   359,   360,   366,   367,   369,
     373,   375,   378,   379,   382,   385,   387,   389,   390,   392,
     395,   397,   399,   403,   405,   409,   411,   413,   416,   419,
     420,   425,   430,   431,   438,   440,   441,   448,   451,   454,
     457,   460,   462,   464,   466,   467,   469,   471,   473,   475,
     477,   479,   481,   485,   490,   495,   500,   506,   512,   518,
     524,   530,   536,   542,   548,   554,   560,   566,   572,   578,
     584,   590,   596,   602,   609,   616,   623,   631,   636,   641,
     648,   656,   661,   666,   671,   676,   683,   691,   695,   696,
     706,   708,   710,   714,   718,   722,   726,   730,   734,   738,
     742,   746,   750,   754,   758,   762,   766,   771,   773,   775,
     777,   781,   785,   789,   791,   793,   794,   800,   801,   805,
     807,   810,   811,   814,   816,   819,   823,   825,   832,   839,
     845,   851,   856,   861,   866,   871,   873,   875,   877,   879,
     881,   883,   885,   887,   888,   890,   894,   896,   898,   903,
     905,   907,   909,   911,   913,   915,   917,   919,   921,   923,
     924,   927,   929,   933,   934,   939,   941,   945,   948,   951,
     953,   955,   957,   959,   961,   963,   965,   967,   969,   971
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     130,     0,    -1,   131,    -1,   132,    -1,   131,   132,    -1,
     149,    -1,   137,    -1,   136,    -1,   150,    -1,   163,    -1,
     146,    -1,   101,     4,    -1,   133,    -1,     4,    -1,     6,
     134,     4,    -1,   135,     4,    -1,     7,   104,    -1,     8,
     103,    69,   103,    -1,     9,   104,    69,   104,    -1,    59,
     204,    99,    -1,    59,   204,    99,   114,   237,    -1,    -1,
      27,   138,   204,    99,   114,   237,    -1,    -1,    27,   140,
     104,   229,   114,   103,    -1,   142,    -1,   141,   142,    -1,
     195,   143,     4,    -1,   101,     4,    -1,   110,    -1,   109,
      -1,   149,    -1,   139,    -1,    -1,   144,   107,   145,    -1,
      75,   171,    92,    -1,    14,   230,    -1,    26,   103,    69,
     100,    -1,    -1,   223,    -1,    -1,    93,   147,   148,    94,
      -1,    -1,   141,    -1,    20,   115,   231,   116,    -1,    -1,
      -1,    -1,    23,   151,   226,   152,   171,     4,   153,   154,
     162,    70,    -1,    -1,     4,    -1,   154,   155,     4,    -1,
      -1,     5,   156,   204,    99,   180,    -1,    -1,    69,    -1,
      91,   117,   160,   118,    -1,    89,   117,   103,   118,    -1,
      89,   117,    99,   118,    -1,    -1,   160,    69,   161,    -1,
     161,    -1,    47,    -1,    48,    -1,    50,    -1,    49,    -1,
      99,    -1,    -1,   192,    -1,    -1,    -1,    -1,    75,   164,
      99,   165,   171,     4,   166,   154,   162,    70,    -1,    -1,
      72,     4,   168,   175,   170,   174,   169,   177,    73,    -1,
      -1,   197,     4,    -1,    -1,    82,   230,     4,    -1,    -1,
     172,    -1,   173,    -1,   172,   157,   173,    -1,    84,    -1,
      83,    -1,    85,    -1,    86,    -1,    88,    -1,    87,    -1,
      90,    -1,   158,    -1,   159,    -1,    74,   230,    69,   230,
       4,    -1,    74,   230,     4,    -1,    80,   230,     4,    -1,
      81,   222,     4,    -1,    81,   103,     4,    -1,    81,   222,
      69,   230,     4,    -1,    81,   103,    69,   230,     4,    -1,
      -1,   175,   176,     4,    -1,    11,   215,    -1,    -1,   177,
     178,     4,    -1,    62,   222,   180,    -1,    -1,    25,   179,
     204,    99,    -1,    -1,   180,   181,    -1,    16,    -1,    17,
      -1,    18,    -1,    76,    -1,    78,    -1,    77,    -1,    79,
      -1,    -1,   182,     4,   185,   186,   183,    -1,   188,    -1,
      -1,   186,     4,    -1,   186,   187,     4,    -1,    63,   230,
     216,    -1,    -1,    63,   117,   189,   191,   118,    -1,    -1,
      64,   117,   190,   191,   118,    -1,    -1,   215,    -1,   191,
      69,   215,    -1,   194,    -1,   192,   194,    -1,    -1,   193,
     198,    -1,   101,     4,    -1,   110,    -1,   109,    -1,    -1,
     196,    -1,   196,   197,    -1,   197,    -1,    92,    -1,   195,
     200,     4,    -1,    99,    -1,   199,    69,    99,    -1,   206,
      -1,   220,    -1,    20,    99,    -1,    21,    99,    -1,    -1,
      25,   201,   204,   199,    -1,    26,   103,    69,   222,    -1,
      -1,    27,   202,   204,    99,   114,   237,    -1,   139,    -1,
      -1,    30,   203,   204,    99,   114,   237,    -1,    63,   212,
      -1,    10,   228,    -1,   107,   223,    -1,    14,   230,    -1,
     212,    -1,   167,    -1,   184,    -1,    -1,    47,    -1,    48,
      -1,    49,    -1,    50,    -1,    51,    -1,   205,    -1,    99,
      -1,   222,   114,   230,    -1,   222,   114,   119,   230,    -1,
     222,   114,   120,   230,    -1,   222,   114,   121,   230,    -1,
     222,   114,   230,   122,   230,    -1,   222,   114,   230,   120,
     230,    -1,   222,   114,   230,   123,   230,    -1,   222,   114,
     230,    65,   230,    -1,   222,   114,   230,   124,   230,    -1,
     222,   114,   230,    39,   230,    -1,   222,   114,   230,   125,
     230,    -1,   222,   114,   230,   112,   230,    -1,   222,   114,
     230,    45,   230,    -1,   222,   114,   230,    46,   230,    -1,
     222,   114,   230,    66,   230,    -1,   222,   114,   230,    67,
     230,    -1,   222,   114,   230,    68,   230,    -1,   222,   114,
     230,    52,   230,    -1,   222,   114,   230,   126,   230,    -1,
     222,   114,   230,   127,   230,    -1,   222,   114,   230,   121,
     230,    -1,   222,   114,   230,   115,   231,   116,    -1,   222,
     115,   231,   116,   114,   230,    -1,   222,   114,    19,   205,
      69,   230,    -1,   222,   114,    19,   205,   115,   231,   116,
      -1,   222,   114,    19,   205,    -1,   222,   114,    19,   230,
      -1,   222,   114,    19,   230,    69,   230,    -1,   222,   114,
      19,   230,   115,   231,   116,    -1,   222,   114,    61,    99,
      -1,   222,   114,    60,   238,    -1,    60,   238,   114,   230,
      -1,    19,   222,    69,   230,    -1,    19,   222,    69,   230,
      69,   230,    -1,    19,   222,    69,   230,   115,   231,   116,
      -1,   222,   114,   212,    -1,    -1,   207,   117,   219,   118,
     114,   210,   117,   214,   118,    -1,   208,    -1,   209,    -1,
     222,   114,    14,    -1,   222,    31,   230,    -1,   222,    32,
     230,    -1,   222,    33,   230,    -1,   222,    34,   230,    -1,
     222,    41,   230,    -1,   222,    40,   230,    -1,   222,    35,
     230,    -1,   222,    36,   230,    -1,   222,    37,   230,    -1,
     222,    38,   230,    -1,   222,    42,   230,    -1,   222,    43,
     230,    -1,   222,    44,   230,    -1,   222,   114,   107,   145,
      -1,    99,    -1,   103,    -1,   222,    -1,   222,   211,   227,
      -1,   222,   211,   103,    -1,   222,   211,   222,    -1,   113,
      -1,   111,    -1,    -1,   210,   213,   117,   214,   118,    -1,
      -1,   214,    69,   215,    -1,   215,    -1,   230,   216,    -1,
      -1,   216,   217,    -1,    15,    -1,   222,   180,    -1,   219,
      69,   218,    -1,   218,    -1,    12,   230,   221,   230,    10,
     228,    -1,    13,   230,   221,   230,    10,   228,    -1,    12,
      14,   230,    10,   228,    -1,    13,    14,   230,    10,   228,
      -1,    12,   230,    10,   228,    -1,    13,   230,    10,   228,
      -1,    12,   230,    69,   228,    -1,    13,   230,    69,   228,
      -1,    53,    -1,    54,    -1,    55,    -1,    56,    -1,    57,
      -1,    58,    -1,   108,    -1,   236,    -1,    -1,   224,    -1,
     224,    69,   225,    -1,   225,    -1,   229,    -1,   222,   115,
     231,   116,    -1,   227,    -1,   103,    -1,    99,    -1,   107,
      -1,    99,    -1,   107,    -1,   228,    -1,   230,    -1,   222,
      -1,   237,    -1,    -1,   232,   233,    -1,   235,    -1,   233,
     128,   235,    -1,    -1,   233,    69,   234,   235,    -1,   230,
      -1,   230,    71,   230,    -1,    71,   230,    -1,   230,    71,
      -1,    95,    -1,    96,    -1,    97,    -1,    98,    -1,   100,
      -1,   104,    -1,   105,    -1,   103,    -1,   106,    -1,    97,
      -1,   103,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   398,   398,   402,   403,   407,   408,   409,   410,   411,
     412,   413,   414,   415,   418,   419,   422,   430,   439,   448,
     454,   463,   463,   468,   468,   472,   473,   477,   478,   479,
     480,   481,   482,   485,   485,   489,   497,   499,   504,   508,
     512,   512,   522,   524,   528,   545,   549,   552,   544,   558,
     559,   560,   564,   564,   570,   571,   575,   578,   581,   587,
     588,   589,   593,   594,   595,   596,   597,   609,   611,   615,
     617,   621,   615,   628,   627,   659,   660,   664,   665,   670,
     671,   675,   676,   680,   681,   682,   683,   684,   685,   686,
     687,   688,   692,   697,   699,   704,   706,   708,   712,   720,
     721,   725,   730,   731,   735,   736,   736,   741,   742,   746,
     747,   748,   753,   754,   758,   759,   764,   763,   768,   774,
     775,   777,   782,   787,   786,   794,   793,   803,   804,   805,
     810,   811,   823,   827,   829,   830,   831,   835,   836,   840,
     841,   845,   851,   855,   863,   872,   873,   874,   875,   876,
     876,   889,   893,   893,   895,   896,   896,   898,   902,   903,
     906,   908,   909,   910,   911,   915,   916,   917,   918,   919,
     920,   924,   935,   936,   937,   938,   939,   940,   941,   942,
     943,   944,   945,   946,   947,   949,   951,   953,   955,   957,
     959,   961,   963,   965,   967,   969,   971,   973,   975,   977,
     979,   981,   984,   986,   990,   992,   994,   997,  1004,  1004,
    1012,  1013,  1014,  1019,  1021,  1023,  1025,  1027,  1029,  1031,
    1033,  1035,  1037,  1039,  1041,  1043,  1048,  1055,  1056,  1057,
    1062,  1063,  1064,  1067,  1068,  1073,  1072,  1082,  1083,  1084,
    1088,  1092,  1093,  1097,  1100,  1104,  1105,  1109,  1111,  1113,
    1115,  1117,  1119,  1121,  1123,  1128,  1129,  1130,  1131,  1132,
    1133,  1137,  1138,  1142,  1143,  1147,  1148,  1152,  1153,  1161,
    1162,  1166,  1167,  1171,  1172,  1176,  1177,  1181,  1182,  1185,
    1185,  1190,  1191,  1193,  1193,  1198,  1203,  1206,  1207,  1211,
    1212,  1213,  1214,  1215,  1219,  1220,  1221,  1222,  1226,  1227
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
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
  "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV", "OBJECTV", "LOG_XOR",
  "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", "RELOP_LTE",
  "GLOBAL", "GLOBALOP", "ADDR", "RESULT", "RETURN", "YIELDT", "POW",
  "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", "DOTDOT",
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
  "constdef", "@1", "pmc_const", "@2", "pasmcode", "pasmline", "pasm_inst",
  "@3", "pasm_args", "emit", "@4", "opt_pasmcode", "class_namespace",
  "sub", "@5", "@6", "@7", "sub_params", "sub_param", "@8", "opt_comma",
  "multi", "outer", "multi_types", "multi_type", "sub_body", "pcc_sub",
  "@9", "@10", "@11", "pcc_sub_call", "@12", "opt_label", "opt_invocant",
  "sub_proto", "sub_proto_list", "proto", "pcc_call", "pcc_args",
  "pcc_arg", "pcc_results", "pcc_result", "@13", "paramtype_list",
  "paramtype", "begin_ret_or_yield", "end_ret_or_yield", "pcc_ret", "@14",
  "pcc_returns", "pcc_return", "pcc_return_many", "@15", "@16",
  "var_returns", "statements", "helper_clear_state", "statement", "labels",
  "_labels", "label", "instruction", "id_list", "labeled_inst", "@17",
  "@18", "@19", "type", "classname", "assignment", "@20", "op_assign",
  "func_assign", "the_sub", "ptr", "sub_call", "@21", "arglist", "arg",
  "argtype_list", "argtype", "result", "targetlist", "if_statement",
  "relop", "target", "vars", "_vars", "_var_or_i", "sub_label_op_c",
  "sub_label_op", "label_op", "var_or_i", "var", "keylist", "@22",
  "_keylist", "@23", "key", "reg", "const", "string", 0
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
     142,   142,   142,   144,   143,   143,   143,   143,   143,   145,
     147,   146,   148,   148,   149,   151,   152,   153,   150,   154,
     154,   154,   156,   155,   157,   157,   158,   159,   159,   160,
     160,   160,   161,   161,   161,   161,   161,   162,   162,   164,
     165,   166,   163,   168,   167,   169,   169,   170,   170,   171,
     171,   172,   172,   173,   173,   173,   173,   173,   173,   173,
     173,   173,   174,   174,   174,   174,   174,   174,   174,   175,
     175,   176,   177,   177,   178,   179,   178,   180,   180,   181,
     181,   181,   182,   182,   183,   183,   185,   184,   184,   186,
     186,   186,   187,   189,   188,   190,   188,   191,   191,   191,
     192,   192,   193,   194,   194,   194,   194,   195,   195,   196,
     196,   197,   198,   199,   199,   200,   200,   200,   200,   201,
     200,   200,   202,   200,   200,   203,   200,   200,   200,   200,
     200,   200,   200,   200,   200,   204,   204,   204,   204,   204,
     204,   205,   206,   206,   206,   206,   206,   206,   206,   206,
     206,   206,   206,   206,   206,   206,   206,   206,   206,   206,
     206,   206,   206,   206,   206,   206,   206,   206,   206,   206,
     206,   206,   206,   206,   206,   206,   206,   206,   207,   206,
     206,   206,   206,   208,   208,   208,   208,   208,   208,   208,
     208,   208,   208,   208,   208,   208,   209,   210,   210,   210,
     210,   210,   210,   211,   211,   213,   212,   214,   214,   214,
     215,   216,   216,   217,   218,   219,   219,   220,   220,   220,
     220,   220,   220,   220,   220,   221,   221,   221,   221,   221,
     221,   222,   222,   223,   223,   224,   224,   225,   225,   226,
     226,   227,   227,   228,   228,   229,   229,   230,   230,   232,
     231,   233,   233,   234,   233,   235,   235,   235,   235,   236,
     236,   236,   236,   236,   237,   237,   237,   237,   238,   238
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     3,     2,     2,     4,     4,     3,
       5,     0,     6,     0,     6,     1,     2,     3,     2,     1,
       1,     1,     1,     0,     3,     3,     2,     4,     0,     1,
       0,     4,     0,     1,     4,     0,     0,     0,    10,     0,
       1,     3,     0,     5,     0,     1,     4,     4,     4,     0,
       3,     1,     1,     1,     1,     1,     1,     0,     1,     0,
       0,     0,    10,     0,     9,     0,     2,     0,     3,     0,
       1,     1,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     5,     3,     3,     3,     3,     5,     5,     0,
       3,     2,     0,     3,     3,     0,     4,     0,     2,     1,
       1,     1,     1,     1,     1,     1,     0,     5,     1,     0,
       2,     3,     3,     0,     5,     0,     5,     0,     1,     3,
       1,     2,     0,     2,     2,     1,     1,     0,     1,     2,
       1,     1,     3,     1,     3,     1,     1,     2,     2,     0,
       4,     4,     0,     6,     1,     0,     6,     2,     2,     2,
       2,     1,     1,     1,     0,     1,     1,     1,     1,     1,
       1,     1,     3,     4,     4,     4,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     6,     6,     6,     7,     4,     4,     6,
       7,     4,     4,     4,     4,     6,     7,     3,     0,     9,
       1,     1,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     4,     1,     1,     1,
       3,     3,     3,     1,     1,     0,     5,     0,     3,     1,
       2,     0,     2,     1,     2,     3,     1,     6,     6,     5,
       5,     4,     4,     4,     4,     1,     1,     1,     1,     1,
       1,     1,     1,     0,     1,     3,     1,     1,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     0,
       2,     1,     3,     0,     4,     1,     3,     2,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
       0,    13,     0,     0,     0,     0,    45,    21,     0,    69,
      40,     0,     0,     2,     3,    12,     0,     7,     6,    10,
       5,     8,     9,     0,     0,     0,     0,   279,     0,     0,
     165,   166,   167,   168,   169,   171,     0,   170,     0,   137,
      11,     1,     4,    15,    16,    14,     0,     0,     0,     0,
     271,   270,   272,    46,   269,     0,    19,    70,    23,   141,
       0,    30,    29,    32,   137,    25,     0,    31,    33,   138,
     140,    17,    18,    44,     0,   289,   290,   291,   292,   293,
     296,   294,   295,   297,   261,   277,   285,   280,   281,   262,
     278,    79,     0,     0,    79,     0,    28,    26,    41,     0,
       0,    79,     0,     0,   139,   287,   288,   283,     0,    84,
      83,    85,    86,    88,    87,     0,    89,     0,    90,    91,
       0,    54,    81,     0,    20,     0,     0,    36,     0,     0,
      27,   263,   286,     0,   282,     0,    59,    47,    55,     0,
      22,    71,   273,   274,   275,     0,   276,     0,    35,    34,
     277,    39,   264,   266,   267,   284,     0,     0,    62,    63,
      65,    64,    66,     0,    61,    49,    82,    49,     0,    37,
     279,     0,    58,    57,     0,    56,    50,   132,   132,    24,
       0,   265,    60,    52,     0,   136,   135,     0,     0,   132,
     137,   130,     0,   268,     0,   134,    51,    48,   131,   164,
     133,    72,     0,     0,     0,     0,     0,     0,     0,     0,
     149,     0,   152,   155,     0,     0,     0,     0,   112,   113,
     227,   228,   263,   154,   162,     0,   163,   118,     0,   145,
       0,   210,   211,   235,   161,   146,   229,   107,   158,     0,
       0,     0,     0,   160,     0,   147,   148,     0,     0,     0,
       0,   298,   299,     0,   123,   157,   229,   125,    73,   159,
     116,   142,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   234,   233,     0,
     279,     0,    53,     0,     0,   255,   256,   257,   258,   259,
     260,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   127,   127,    99,   119,   246,     0,   107,
     237,   213,   214,   215,   216,   219,   220,   221,   222,   218,
     217,   223,   224,   225,   212,     0,     0,     0,   296,   263,
       0,     0,     0,   207,   277,   172,     0,   231,   232,   230,
     109,   110,   111,   108,     0,   251,   253,     0,     0,   252,
     254,     0,   204,   143,   150,   151,     0,     0,   203,     0,
     128,   241,     0,    77,     0,     0,     0,   244,     0,   239,
     197,   198,   202,   201,   226,   173,   174,   175,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   249,     0,   250,
       0,     0,   279,     0,     0,     0,     0,   124,   240,   126,
       0,     0,     0,     0,   120,     0,   114,   115,   117,     0,
     245,     0,     0,   236,     0,   279,     0,   279,   181,   184,
     185,   189,   179,   186,   187,   188,   183,     0,   177,   192,
     176,   178,   180,   182,   190,   191,     0,   247,   248,   205,
       0,   144,   153,   156,   129,   243,   242,   101,     0,     0,
       0,     0,    75,   100,   241,   121,     0,   238,   195,     0,
     199,     0,   193,   194,   206,    78,     0,     0,     0,     0,
     102,     0,   122,   237,   196,   200,    93,     0,    94,    96,
       0,    95,     0,     0,    76,     0,     0,     0,     0,   105,
       0,    74,     0,   209,    92,    98,    97,     0,   107,   103,
       0,   104,   106
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    12,    13,    14,    15,    24,    16,    17,    18,    29,
      63,    95,    64,    65,   102,   103,   149,    19,    39,    66,
      20,    21,    28,    91,   165,   177,   187,   194,   139,   118,
     119,   163,   164,   188,    22,    38,    94,   167,   224,   305,
     480,   412,   120,   121,   122,   462,   363,   413,   493,   502,
     507,   282,   343,   225,   418,   226,   306,   364,   419,   227,
     303,   304,   359,   189,   190,   191,    68,    69,    70,   200,
     354,   228,   247,   249,   250,    36,    37,   229,   230,   231,
     232,   233,   281,   234,   263,   368,   360,   408,   456,   307,
     308,   235,   292,    85,   151,   152,   153,    53,    54,   144,
     154,   361,    48,    49,    87,   133,    88,    89,    90,   253
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -306
static const short int yypact[] =
{
     184,  -306,    20,   -86,   -67,   -66,  -306,  -306,    -4,  -306,
    -306,    54,    65,   184,  -306,  -306,    94,  -306,  -306,  -306,
    -306,  -306,  -306,   -36,   106,    48,    57,  -306,   -48,    -4,
    -306,  -306,  -306,  -306,  -306,  -306,    42,  -306,    45,    33,
    -306,  -306,  -306,  -306,  -306,  -306,    52,    73,    40,   260,
    -306,  -306,  -306,  -306,  -306,    62,    58,  -306,  -306,  -306,
     165,  -306,  -306,  -306,   171,  -306,    91,  -306,     5,    95,
    -306,  -306,  -306,  -306,   442,  -306,  -306,  -306,  -306,  -306,
    -306,  -306,  -306,  -306,  -306,  -306,   118,   -57,  -306,  -306,
    -306,   514,    87,   110,   514,    98,  -306,  -306,  -306,   442,
     102,   514,   202,   112,  -306,  -306,   442,  -306,   260,  -306,
    -306,  -306,  -306,  -306,  -306,    92,  -306,   100,  -306,  -306,
     231,     4,  -306,   110,  -306,   235,   414,  -306,   172,   148,
    -306,   414,  -306,   260,  -306,    68,    -9,  -306,  -306,   514,
    -306,  -306,  -306,  -306,  -306,   128,  -306,   151,  -306,  -306,
     141,  -306,   189,  -306,  -306,  -306,   143,   144,  -306,  -306,
    -306,  -306,  -306,   -64,  -306,   263,  -306,   263,   161,  -306,
    -306,   414,  -306,  -306,    -9,  -306,  -306,    29,    29,  -306,
     152,  -306,  -306,  -306,   265,  -306,  -306,   266,   201,    39,
      95,  -306,   203,  -306,    -4,  -306,  -306,  -306,  -306,   366,
    -306,  -306,   175,   -79,    78,   198,   442,   488,   176,   180,
    -306,   179,   182,  -306,   -47,   149,   167,   287,  -306,  -306,
    -306,  -306,   414,  -306,  -306,   293,  -306,  -306,   295,  -306,
     183,  -306,  -306,  -306,  -306,  -306,   286,  -306,  -306,   442,
     398,   442,   447,  -306,   236,  -306,  -306,    -4,   238,    -4,
      -4,  -306,  -306,   194,  -306,  -306,    55,  -306,  -306,  -306,
    -306,  -306,   488,   192,   442,   442,   442,   442,   442,   442,
     442,   442,   442,   442,   442,   442,   442,  -306,  -306,    16,
    -306,   456,   178,   300,   -79,  -306,  -306,  -306,  -306,  -306,
    -306,   -79,   442,   301,   -79,   -79,   442,   442,   213,   488,
     214,   217,   442,   442,   442,  -306,  -306,  -306,   -51,  -306,
     442,  -306,  -306,  -306,  -306,  -306,  -306,  -306,  -306,  -306,
    -306,  -306,  -306,  -306,  -306,   428,   -47,   226,   216,   414,
     442,   442,   442,  -306,    34,   367,   218,  -306,  -306,  -306,
    -306,  -306,  -306,  -306,   -79,  -306,  -306,   325,   -79,  -306,
    -306,   335,    -8,  -306,   285,  -306,   247,   248,  -306,   -46,
    -306,  -306,   -44,     0,     6,   488,   253,   178,   -43,  -306,
      -7,    31,  -306,  -306,  -306,  -306,  -306,  -306,   442,   442,
     442,   442,   442,   442,   442,   442,   442,  -306,   442,   442,
     442,   442,   442,   442,   442,   442,   256,  -306,   -79,  -306,
     -79,   442,  -306,   273,   110,   110,   442,  -306,   359,  -306,
     442,   442,    79,   371,  -306,   442,  -306,  -306,  -306,   373,
    -306,   470,   442,  -306,   442,  -306,   442,  -306,  -306,  -306,
    -306,  -306,  -306,  -306,  -306,  -306,  -306,   267,  -306,  -306,
    -306,  -306,  -306,  -306,  -306,  -306,   442,  -306,  -306,  -306,
     272,  -306,  -306,  -306,  -306,  -306,  -306,  -306,   377,   442,
     442,   479,    95,  -306,  -306,  -306,   278,  -306,  -306,   274,
    -306,   282,  -306,  -306,  -306,  -306,    10,   385,    12,    18,
    -306,   399,   359,   442,  -306,  -306,  -306,   442,  -306,  -306,
     442,  -306,   442,   -10,  -306,   -21,   401,   403,   405,  -306,
     488,  -306,   406,  -306,  -306,  -306,  -306,    -4,  -306,  -306,
     303,   178,  -306
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -306,  -306,  -306,   402,  -306,  -306,  -306,  -306,  -306,  -306,
     212,  -306,  -306,   350,  -306,  -306,    93,  -306,  -306,  -306,
      64,  -306,  -306,  -306,  -306,   249,  -306,  -306,  -306,  -306,
    -306,  -306,   246,   243,  -306,  -306,  -306,  -306,  -306,  -306,
    -306,  -306,   -65,  -306,   284,  -306,  -306,  -306,  -306,  -306,
    -306,  -305,  -306,  -306,  -306,  -306,  -306,  -306,  -306,  -306,
    -306,  -306,   120,  -306,  -306,   239,   237,  -306,   -68,  -306,
    -306,  -306,  -306,  -306,  -306,   -29,   111,  -306,  -306,  -306,
    -306,    19,  -306,  -191,  -306,   -58,  -304,   -33,  -306,    72,
    -306,  -306,   197,  -129,   219,  -306,   275,  -306,   162,  -190,
     321,   -42,  -149,  -306,  -306,  -306,    24,  -306,   -90,   123
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -230
static const short int yytable[] =
{
      55,   104,   150,   124,   367,   174,   369,    86,   -80,   -38,
     414,   410,   107,   238,   486,   499,   489,    25,   365,    99,
     142,   180,   491,   406,   255,   406,   422,    23,   143,   125,
     324,   100,   105,   140,   183,   325,   129,    26,   158,   159,
     160,   161,   150,    30,    31,    32,    33,    34,   422,    27,
     251,    50,   500,     5,   175,    51,   252,   127,    40,    52,
      58,   401,   424,   501,   132,    41,    86,   366,    44,   415,
     236,   108,   407,   138,   409,   423,   326,   327,   244,   487,
     101,   490,   411,   416,   146,   417,   256,   492,   333,   146,
     162,    86,   239,   150,   345,    35,   -80,   503,    43,   -67,
     426,   346,   454,    67,   349,   350,   457,   402,   425,   -68,
      45,    75,    76,    77,    78,   220,    79,    46,   467,   328,
      81,    82,    83,   329,    84,    59,    47,   -42,    67,   146,
     184,   336,   134,   309,    60,   330,   331,   332,   185,   186,
     184,    56,    61,    62,    57,   277,   427,   278,   185,   186,
     334,  -229,   338,   459,   397,    71,    73,   155,   399,   460,
     461,    92,   240,   242,   243,   202,   277,   156,   278,    96,
     355,   157,    93,    75,    76,    77,    78,    72,    79,   369,
     146,    80,    81,    82,    83,    98,    84,    59,     1,   106,
       2,     5,     3,     4,   340,   341,   342,   283,    58,   293,
     150,   123,   126,   511,     5,   128,   130,     6,   447,   135,
     448,     7,   241,    80,    81,    82,    83,   136,   298,   131,
     300,   301,   311,   312,   313,   314,   315,   316,   317,   318,
     319,   320,   321,   322,   323,   137,   309,   335,   437,   141,
     148,   147,   168,     8,    75,    76,    77,    78,   220,    79,
     347,   169,   221,   450,   351,   352,   170,    84,   171,     9,
     358,   172,   173,    59,   179,   -43,   254,   176,   193,   195,
     196,   197,    60,   201,   237,   245,   469,    10,   471,   246,
      61,    62,   248,   371,   257,    11,   -23,   146,   375,   376,
     377,   258,   256,    75,    76,    77,    78,   260,    79,   261,
     262,    80,    81,    82,    83,   297,    84,   299,   302,   310,
     344,   348,   353,   356,   452,   453,   357,   264,   265,   266,
     267,   268,   269,   270,   271,   373,   272,   273,   274,   275,
     276,    74,   479,  -228,   396,   398,   428,   429,   430,   431,
     432,   433,   434,   435,   436,   400,   438,   439,   440,   441,
     442,   443,   444,   445,   403,    75,    76,    77,    78,   449,
      79,   404,   405,    80,    81,    82,    83,   421,    84,   458,
     446,   508,   451,   464,   455,   463,   203,   465,   204,   205,
     206,   475,   468,   472,   470,   207,   208,   209,   474,   488,
     484,   210,   211,   212,   481,   483,   213,   277,   485,   278,
     279,   280,   512,   494,   473,   504,   378,   505,   284,   506,
     509,   223,   379,   380,    97,    42,   178,   476,   477,   381,
     182,   192,   374,   166,   362,   495,   214,   199,   198,   215,
     216,   482,   382,   383,   384,   385,   370,   420,   217,   296,
     466,   259,   218,   339,   219,   496,   181,   145,   497,   372,
     498,   285,   286,   287,   288,   289,   290,   294,     0,     0,
       0,    75,    76,    77,    78,   220,    79,   291,     0,   221,
       0,     0,     0,   222,    84,     0,     0,     0,   510,   386,
       0,     0,   387,  -208,     0,     0,     0,   388,   389,   390,
     391,   392,   393,   394,   395,     0,     0,     0,     0,     0,
     285,   286,   287,   288,   289,   290,     0,     0,     0,    75,
      76,    77,    78,   142,    79,     0,   295,    80,    81,    82,
      83,   143,    84,    75,    76,    77,    78,    35,    79,     0,
       0,    80,    81,    82,    83,     0,    84,    75,    76,    77,
      78,     0,    79,     0,     0,    80,    81,    82,    83,     0,
      84,    75,    76,    77,    78,    50,    79,     0,     0,   337,
       0,     0,     0,    52,    84,    75,    76,    77,    78,   220,
      79,     0,     0,   221,    75,    76,    77,    78,    84,    79,
       0,     0,   478,    75,    76,    77,    78,    84,    79,     0,
       0,     0,     0,     0,     0,     0,    84,   109,   110,   111,
     112,   113,   114,   115,   116,   117
};

static const short int yycheck[] =
{
      29,    69,   131,    93,   309,    69,   310,    49,     4,     4,
       4,    11,    69,   203,     4,    25,     4,   103,    69,    14,
      99,   170,     4,    69,   215,    69,    69,     7,   107,    94,
      14,    26,    74,   123,     5,    19,   101,   104,    47,    48,
      49,    50,   171,    47,    48,    49,    50,    51,    69,   115,
      97,    99,    62,    20,   118,   103,   103,    99,     4,   107,
      27,    69,    69,    73,   106,     0,   108,   118,   104,    63,
     199,   128,   118,    69,   118,   118,    60,    61,   207,    69,
      75,    69,    82,    77,   126,    79,   215,    69,   279,   131,
      99,   133,    14,   222,   284,    99,    92,   118,     4,    70,
      69,   291,   406,    39,   294,   295,   410,   115,   115,    70,
       4,    95,    96,    97,    98,    99,   100,    69,   422,   103,
     104,   105,   106,   107,   108,    92,    69,    94,    64,   171,
     101,   280,   108,   262,   101,   119,   120,   121,   109,   110,
     101,    99,   109,   110,    99,   111,   115,   113,   109,   110,
     279,   117,   281,    74,   344,   103,   116,   133,   348,    80,
      81,    99,   204,   205,   206,   194,   111,    99,   113,     4,
     299,   103,   114,    95,    96,    97,    98,   104,   100,   483,
     222,   103,   104,   105,   106,    94,   108,    92,     4,    71,
       6,    20,     8,     9,    16,    17,    18,   239,    27,   241,
     329,   114,   104,   508,    20,   103,     4,    23,   398,   117,
     400,    27,    14,   103,   104,   105,   106,   117,   247,   107,
     249,   250,   264,   265,   266,   267,   268,   269,   270,   271,
     272,   273,   274,   275,   276,     4,   365,   279,   387,     4,
      92,    69,   114,    59,    95,    96,    97,    98,    99,   100,
     292,   100,   103,   402,   296,   297,   115,   108,    69,    75,
     302,   118,   118,    92,   103,    94,   117,     4,   116,     4,
       4,    70,   101,    70,    99,    99,   425,    93,   427,    99,
     109,   110,   103,   325,   117,   101,   104,   329,   330,   331,
     332,     4,   421,    95,    96,    97,    98,     4,   100,     4,
     117,   103,   104,   105,   106,    69,   108,    69,   114,   117,
      10,    10,    99,    99,   404,   405,    99,    31,    32,    33,
      34,    35,    36,    37,    38,    99,    40,    41,    42,    43,
      44,    71,   461,   117,   116,    10,   378,   379,   380,   381,
     382,   383,   384,   385,   386,    10,   388,   389,   390,   391,
     392,   393,   394,   395,    69,    95,    96,    97,    98,   401,
     100,   114,   114,   103,   104,   105,   106,   114,   108,   411,
     114,   500,    99,   415,    15,     4,    10,     4,    12,    13,
      14,     4,   424,   116,   426,    19,    20,    21,   116,     4,
     116,    25,    26,    27,   462,   117,    30,   111,   116,   113,
     114,   115,    99,     4,   446,     4,    39,     4,    10,     4,
       4,   199,    45,    46,    64,    13,   167,   459,   460,    52,
     174,   178,   329,   139,   304,   483,    60,   190,   189,    63,
      64,   464,    65,    66,    67,    68,   325,   365,    72,   242,
     421,   222,    76,   281,    78,   487,   171,   126,   490,   326,
     492,    53,    54,    55,    56,    57,    58,    10,    -1,    -1,
      -1,    95,    96,    97,    98,    99,   100,    69,    -1,   103,
      -1,    -1,    -1,   107,   108,    -1,    -1,    -1,   507,   112,
      -1,    -1,   115,   117,    -1,    -1,    -1,   120,   121,   122,
     123,   124,   125,   126,   127,    -1,    -1,    -1,    -1,    -1,
      53,    54,    55,    56,    57,    58,    -1,    -1,    -1,    95,
      96,    97,    98,    99,   100,    -1,    69,   103,   104,   105,
     106,   107,   108,    95,    96,    97,    98,    99,   100,    -1,
      -1,   103,   104,   105,   106,    -1,   108,    95,    96,    97,
      98,    -1,   100,    -1,    -1,   103,   104,   105,   106,    -1,
     108,    95,    96,    97,    98,    99,   100,    -1,    -1,   103,
      -1,    -1,    -1,   107,   108,    95,    96,    97,    98,    99,
     100,    -1,    -1,   103,    95,    96,    97,    98,   108,   100,
      -1,    -1,   103,    95,    96,    97,    98,   108,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   108,    83,    84,    85,
      86,    87,    88,    89,    90,    91
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,     9,    20,    23,    27,    59,    75,
      93,   101,   130,   131,   132,   133,   135,   136,   137,   146,
     149,   150,   163,     7,   134,   103,   104,   115,   151,   138,
      47,    48,    49,    50,    51,    99,   204,   205,   164,   147,
       4,     0,   132,     4,   104,     4,    69,    69,   231,   232,
      99,   103,   107,   226,   227,   204,    99,    99,    27,    92,
     101,   109,   110,   139,   141,   142,   148,   149,   195,   196,
     197,   103,   104,   116,    71,    95,    96,    97,    98,   100,
     103,   104,   105,   106,   108,   222,   230,   233,   235,   236,
     237,   152,    99,   114,   165,   140,     4,   142,    94,    14,
      26,    75,   143,   144,   197,   230,    71,    69,   128,    83,
      84,    85,    86,    87,    88,    89,    90,    91,   158,   159,
     171,   172,   173,   114,   237,   171,   104,   230,   103,   171,
       4,   107,   230,   234,   235,   117,   117,     4,    69,   157,
     237,     4,    99,   107,   228,   229,   230,    69,    92,   145,
     222,   223,   224,   225,   229,   235,    99,   103,    47,    48,
      49,    50,    99,   160,   161,   153,   173,   166,   114,   100,
     115,    69,   118,   118,    69,   118,     4,   154,   154,   103,
     231,   225,   161,     5,   101,   109,   110,   155,   162,   192,
     193,   194,   162,   116,   156,     4,     4,    70,   194,   195,
     198,    70,   204,    10,    12,    13,    14,    19,    20,    21,
      25,    26,    27,    30,    60,    63,    64,    72,    76,    78,
      99,   103,   107,   139,   167,   182,   184,   188,   200,   206,
     207,   208,   209,   210,   212,   220,   222,    99,   228,    14,
     230,    14,   230,   230,   222,    99,    99,   201,   103,   202,
     203,    97,   103,   238,   117,   212,   222,   117,     4,   223,
       4,     4,   117,   213,    31,    32,    33,    34,    35,    36,
      37,    38,    40,    41,    42,    43,    44,   111,   113,   114,
     115,   211,   180,   230,    10,    53,    54,    55,    56,    57,
      58,    69,   221,   230,    10,    69,   221,    69,   204,    69,
     204,   204,   114,   189,   190,   168,   185,   218,   219,   222,
     117,   230,   230,   230,   230,   230,   230,   230,   230,   230,
     230,   230,   230,   230,    14,    19,    60,    61,   103,   107,
     119,   120,   121,   212,   222,   230,   231,   103,   222,   227,
      16,    17,    18,   181,    10,   228,   228,   230,    10,   228,
     228,   230,   230,    99,   199,   222,    99,    99,   230,   191,
     215,   230,   191,   175,   186,    69,   118,   180,   214,   215,
     205,   230,   238,    99,   145,   230,   230,   230,    39,    45,
      46,    52,    65,    66,    67,    68,   112,   115,   120,   121,
     122,   123,   124,   125,   126,   127,   116,   228,    10,   228,
      10,    69,   115,    69,   114,   114,    69,   118,   216,   118,
      11,    82,   170,   176,     4,    63,    77,    79,   183,   187,
     218,   114,    69,   118,    69,   115,    69,   115,   230,   230,
     230,   230,   230,   230,   230,   230,   230,   231,   230,   230,
     230,   230,   230,   230,   230,   230,   114,   228,   228,   230,
     231,    99,   237,   237,   215,    15,   217,   215,   230,    74,
      80,    81,   174,     4,   230,     4,   210,   215,   230,   231,
     230,   231,   116,   230,   116,     4,   230,   230,   103,   222,
     169,   197,   216,   117,   116,   116,     4,    69,     4,     4,
      69,     4,    69,   177,     4,   214,   230,   230,   230,    25,
      62,    73,   178,   118,     4,     4,     4,   179,   222,     4,
     204,   180,    99
};

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
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (0)


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (N)								\
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (0)
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
              (Loc).first_line, (Loc).first_column,	\
              (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
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

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)		\
do {								\
  if (yydebug)							\
    {								\
      YYFPRINTF (stderr, "%s ", Title);				\
      yysymprint (stderr,					\
                  Type, Value);	\
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
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu), ",
             yyrule - 1, yylno);
  /* Print the symbols being reduced, and their result.  */
  for (yyi = yyprhs[yyrule]; 0 <= yyrhs[yyi]; yyi++)
    YYFPRINTF (stderr, "%s ", yytname[yyrhs[yyi]]);
  YYFPRINTF (stderr, "-> %s\n", yytname[yyr1[yyrule]]);
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
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
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
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

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
  const char *yys = yystr;

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
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      size_t yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

#endif /* YYERROR_VERBOSE */



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
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);


# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
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
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvaluep;

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

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
    ;
#endif
#endif
{
  /* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;

  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
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
  short int *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



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
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	short int *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
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
/* Read a look-ahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to look-ahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
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
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
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

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

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
#line 398 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 5:
#line 407 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); ;}
    break;

  case 6:
#line 408 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); ;}
    break;

  case 7:
#line 409 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); ;}
    break;

  case 8:
#line 410 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; ;}
    break;

  case 9:
#line 411 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; ;}
    break;

  case 10:
#line 412 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; ;}
    break;

  case 11:
#line 413 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 12:
#line 414 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 13:
#line 415 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 14:
#line 418 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 15:
#line 419 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 16:
#line 423 "imcc/imcc.y"
    { if ((yyvsp[0].s))
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    ;}
    break;

  case 17:
#line 431 "imcc/imcc.y"
    {
            STRING *hll_name, *hll_lib;
            hll_name = string_unescape_cstring(interp, (yyvsp[-2].s) + 1, '"', NULL);
            hll_lib =  string_unescape_cstring(interp, (yyvsp[0].s) + 1, '"', NULL);
            IMCC_INFO(interp)->HLL_id =
                Parrot_register_HLL(interp, hll_name, hll_lib);
            (yyval.t) = 0;
         ;}
    break;

  case 18:
#line 440 "imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                IMCC_INFO(interp)->HLL_id, atoi((yyvsp[-2].s)), atoi((yyvsp[0].s)));
             (yyval.t) = 0;
         ;}
    break;

  case 19:
#line 449 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         ;}
    break;

  case 20:
#line 455 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         ;}
    break;

  case 21:
#line 463 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 22:
#line 464 "imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1);is_def=0; ;}
    break;

  case 23:
#line 468 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 24:
#line 469 "imcc/imcc.y"
    { (yyval.i) = mk_pmc_const(interp, cur_unit, (yyvsp[-3].s), (yyvsp[-2].sr), (yyvsp[0].s));is_def=0; ;}
    break;

  case 27:
#line 477 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 28:
#line 478 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 29:
#line 479 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 30:
#line 480 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 31:
#line 481 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); ;}
    break;

  case 33:
#line 485 "imcc/imcc.y"
    { clear_state(); ;}
    break;

  case 34:
#line 487 "imcc/imcc.y"
    { (yyval.i) = INS(interp, cur_unit, (yyvsp[-1].s),0,regs,nargs,keyvec,1);
                     free((yyvsp[-1].s)); ;}
    break;

  case 35:
#line 490 "imcc/imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                     (yyval.i) = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, (yyvsp[0].s)));
                     cur_call->pcc_sub->pragma = (yyvsp[-1].t);
                   ;}
    break;

  case 36:
#line 498 "imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[0].sr)); ;}
    break;

  case 37:
#line 500 "imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, (yyvsp[0].s));
                       set_lexical(interp, r, (yyvsp[-2].s)); (yyval.i) = 0;
                   ;}
    break;

  case 38:
#line 504 "imcc/imcc.y"
    { (yyval.i) = 0;;}
    break;

  case 40:
#line 512 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); ;}
    break;

  case 41:
#line 514 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     (yyval.i)=0; ;}
    break;

  case 44:
#line 529 "imcc/imcc.y"
    {
                    int re_open = 0;
                    (yyval.i)=0;
                    if (IMCC_INFO(interp)->state->pasm_file && cur_namespace) {
                        imc_close_unit(interp, cur_unit);
                        re_open = 1;
                    }
                    IMCC_INFO(interp)->cur_namespace = (yyvsp[-1].sr);
                    cur_namespace = (yyvsp[-1].sr);
                    if (re_open)
                        cur_unit = imc_open_unit(interp, IMC_PASM);
                ;}
    break;

  case 45:
#line 545 "imcc/imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        ;}
    break;

  case 46:
#line 549 "imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, (yyvsp[0].sr));
        ;}
    break;

  case 47:
#line 552 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = (yyvsp[-1].t); ;}
    break;

  case 48:
#line 554 "imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; ;}
    break;

  case 49:
#line 558 "imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 50:
#line 559 "imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 51:
#line 560 "imcc/imcc.y"
    { add_pcc_param(cur_call, (yyvsp[-1].sr));;}
    break;

  case 52:
#line 564 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 53:
#line 565 "imcc/imcc.y"
    { (yyval.sr) = mk_ident(interp, (yyvsp[-1].s), (yyvsp[-2].t));
                                         is_def=0; (yyval.sr)->type |= (yyvsp[0].t); ;}
    break;

  case 54:
#line 570 "imcc/imcc.y"
    { (yyval.t) = 0;  ;}
    break;

  case 56:
#line 575 "imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 57:
#line 579 "imcc/imcc.y"
    { (yyval.t) = 0; cur_unit->outer =
                     mk_sub_address_fromc(interp, (yyvsp[-1].s)); ;}
    break;

  case 58:
#line 582 "imcc/imcc.y"
    { (yyval.t) = 0; cur_unit->outer =
                     mk_const(interp, (yyvsp[-1].s), 'S'); ;}
    break;

  case 59:
#line 587 "imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 60:
#line 588 "imcc/imcc.y"
    { (yyval.t) = 0; add_pcc_multi(cur_call, (yyvsp[0].sr)); ;}
    break;

  case 61:
#line 589 "imcc/imcc.y"
    { (yyval.t) = 0;  add_pcc_multi(cur_call, (yyvsp[0].sr));;}
    break;

  case 62:
#line 593 "imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("INTVAL"), 'S'); ;}
    break;

  case 63:
#line 594 "imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("FLOATVAL"), 'S'); ;}
    break;

  case 64:
#line 595 "imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("PMC"), 'S'); ;}
    break;

  case 65:
#line 596 "imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("STRING"), 'S'); ;}
    break;

  case 66:
#line 597 "imcc/imcc.y"
    {
                          SymReg *r;
                          if (strcmp((yyvsp[0].s), "_"))
                              r = mk_const(interp, (yyvsp[0].s), 'S');
                          else {
                              free((yyvsp[0].s)),
                              r = mk_const(interp, str_dup("PMC"), 'S');
                           }
                           (yyval.sr) = r;
                       ;}
    break;

  case 69:
#line 615 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); ;}
    break;

  case 70:
#line 617 "imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, (yyvsp[0].s)));

         ;}
    break;

  case 71:
#line 621 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = (yyvsp[-1].t); ;}
    break;

  case 72:
#line 623 "imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; ;}
    break;

  case 73:
#line 628 "imcc/imcc.y"
    {
            char name[128];
            SymReg * r, *r1;
            Instruction *i;

            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
            (yyval.sr) = r = mk_pcc_sub(interp, str_dup(name), 0);
            /* this mid rule action has the semantic value of the
             * sub SymReg.
             * This is used below to append args & results
             */
            i = iLABEL(cur_unit, r);
            cur_call = r;
            i->type = ITPCCSUB;
            /*
             * if we are inside a pcc_sub mark the sub as doing a
             * sub call; the sub is in r[0] of the first ins
             */
            r1 = cur_unit->instructions->r[0];
            if (r1 && r1->pcc_sub)
                r1->pcc_sub->calls_a_sub |= 1;
         ;}
    break;

  case 74:
#line 655 "imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; ;}
    break;

  case 75:
#line 659 "imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->label = 0; ;}
    break;

  case 76:
#line 660 "imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->label = 1; ;}
    break;

  case 77:
#line 664 "imcc/imcc.y"
    { (yyval.i) = NULL; ;}
    break;

  case 78:
#line 666 "imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->object = (yyvsp[-1].sr); ;}
    break;

  case 79:
#line 670 "imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 81:
#line 675 "imcc/imcc.y"
    { (yyval.t) = (yyvsp[0].t); ;}
    break;

  case 82:
#line 676 "imcc/imcc.y"
    { (yyval.t) = (yyvsp[-2].t) | (yyvsp[0].t); ;}
    break;

  case 83:
#line 680 "imcc/imcc.y"
    {  (yyval.t) = P_LOAD; ;}
    break;

  case 84:
#line 681 "imcc/imcc.y"
    {  (yyval.t) = P_MAIN; ;}
    break;

  case 85:
#line 682 "imcc/imcc.y"
    {  (yyval.t) = P_IMMEDIATE; ;}
    break;

  case 86:
#line 683 "imcc/imcc.y"
    {  (yyval.t) = P_POSTCOMP; ;}
    break;

  case 87:
#line 684 "imcc/imcc.y"
    {  (yyval.t) = P_ANON; ;}
    break;

  case 88:
#line 685 "imcc/imcc.y"
    {  (yyval.t) = P_METHOD; ;}
    break;

  case 89:
#line 686 "imcc/imcc.y"
    {  (yyval.t) = P_NEED_LEX; ;}
    break;

  case 92:
#line 693 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, (yyvsp[-3].sr));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         ;}
    break;

  case 93:
#line 698 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-1].sr)); ;}
    break;

  case 94:
#line 700 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, (yyvsp[-1].sr));
            cur_call->pcc_sub->flags |= isNCI;
         ;}
    break;

  case 95:
#line 705 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-1].sr)); ;}
    break;

  case 96:
#line 707 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, (yyvsp[-1].s),'S')); ;}
    break;

  case 97:
#line 709 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-3].sr));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         ;}
    break;

  case 98:
#line 713 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, (yyvsp[-3].s),'S'));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         ;}
    break;

  case 99:
#line 720 "imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 100:
#line 721 "imcc/imcc.y"
    {  add_pcc_arg(cur_call, (yyvsp[-1].sr)); ;}
    break;

  case 101:
#line 725 "imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 102:
#line 730 "imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 103:
#line 731 "imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_result(cur_call, (yyvsp[-1].sr)); ;}
    break;

  case 104:
#line 735 "imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); ;}
    break;

  case 105:
#line 736 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 106:
#line 737 "imcc/imcc.y"
    {  mk_ident(interp, (yyvsp[0].s), (yyvsp[-1].t)); is_def=0; (yyval.sr)=0; ;}
    break;

  case 107:
#line 741 "imcc/imcc.y"
    {  (yyval.t) = 0; ;}
    break;

  case 108:
#line 742 "imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); ;}
    break;

  case 109:
#line 746 "imcc/imcc.y"
    {  (yyval.t) = VT_FLAT;   ;}
    break;

  case 110:
#line 747 "imcc/imcc.y"
    {  (yyval.t) = VT_OPTIONAL; ;}
    break;

  case 111:
#line 748 "imcc/imcc.y"
    {  (yyval.t) = VT_OPT_FLAG; ;}
    break;

  case 112:
#line 753 "imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 113:
#line 754 "imcc/imcc.y"
    { (yyval.t) = 1; ;}
    break;

  case 116:
#line 764 "imcc/imcc.y"
    { begin_return_or_yield(interp, (yyvsp[-1].t)); ;}
    break;

  case 117:
#line 767 "imcc/imcc.y"
    { (yyval.i) = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; ;}
    break;

  case 118:
#line 768 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.i) = 0;  ;}
    break;

  case 119:
#line 774 "imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 120:
#line 776 "imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); ;}
    break;

  case 121:
#line 778 "imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); ;}
    break;

  case 122:
#line 782 "imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); ;}
    break;

  case 123:
#line 787 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        ;}
    break;

  case 124:
#line 792 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  ;}
    break;

  case 125:
#line 794 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        ;}
    break;

  case 126:
#line 799 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  ;}
    break;

  case 127:
#line 803 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 128:
#line 804 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr));    ;}
    break;

  case 129:
#line 805 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr));    ;}
    break;

  case 132:
#line 823 "imcc/imcc.y"
    { clear_state(); ;}
    break;

  case 133:
#line 828 "imcc/imcc.y"
    {  (yyval.i) = (yyvsp[0].i); ;}
    break;

  case 134:
#line 829 "imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 135:
#line 830 "imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 136:
#line 831 "imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 137:
#line 835 "imcc/imcc.y"
    {  (yyval.i) = NULL; ;}
    break;

  case 141:
#line 845 "imcc/imcc.y"
    {
                     (yyval.i) = iLABEL(cur_unit, mk_local_label(interp, (yyvsp[0].s)));
                   ;}
    break;

  case 142:
#line 852 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[-1].i); ;}
    break;

  case 143:
#line 856 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = (yyvsp[0].s);
            (yyval.idlist) = l;
         ;}
    break;

  case 144:
#line 864 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = (yyvsp[0].s);
           l->next = (yyvsp[-2].idlist);
           (yyval.idlist) = l;
        ;}
    break;

  case 147:
#line 874 "imcc/imcc.y"
    { push_namespace((yyvsp[0].s)); ;}
    break;

  case 148:
#line 875 "imcc/imcc.y"
    { pop_namespace((yyvsp[0].s)); ;}
    break;

  case 149:
#line 876 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 150:
#line 877 "imcc/imcc.y"
    {
        IdList* l = (yyvsp[0].idlist);
         while(l) {
             IdList* l1;
             mk_ident(interp, l->id, (yyvsp[-1].t));
             l1 = l;
             l = l->next;
             free(l1);
     }
    is_def=0; (yyval.i)=0;

   ;}
    break;

  case 151:
#line 890 "imcc/imcc.y"
    {
                       set_lexical(interp, (yyvsp[0].sr), (yyvsp[-2].s)); (yyval.i) = 0;
                    ;}
    break;

  case 152:
#line 893 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 153:
#line 894 "imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 0);is_def=0; ;}
    break;

  case 155:
#line 896 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 156:
#line 897 "imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1);is_def=0; ;}
    break;

  case 157:
#line 898 "imcc/imcc.y"
    { (yyval.i) = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        ;}
    break;

  case 158:
#line 902 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "branch",1, (yyvsp[0].sr)); ;}
    break;

  case 159:
#line 904 "imcc/imcc.y"
    { (yyval.i) = INS(interp, cur_unit, (yyvsp[-1].s), 0, regs, nargs, keyvec, 1);
                                          free((yyvsp[-1].s)); ;}
    break;

  case 160:
#line 907 "imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[0].sr)); ;}
    break;

  case 161:
#line 908 "imcc/imcc.y"
    {  (yyval.i) = 0; cur_call = NULL; ;}
    break;

  case 162:
#line 909 "imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 164:
#line 911 "imcc/imcc.y"
    { (yyval.i) = 0;;}
    break;

  case 165:
#line 915 "imcc/imcc.y"
    { (yyval.t) = 'I'; ;}
    break;

  case 166:
#line 916 "imcc/imcc.y"
    { (yyval.t) = 'N'; ;}
    break;

  case 167:
#line 917 "imcc/imcc.y"
    { (yyval.t) = 'S'; ;}
    break;

  case 168:
#line 918 "imcc/imcc.y"
    { (yyval.t) = 'P'; ;}
    break;

  case 169:
#line 919 "imcc/imcc.y"
    { (yyval.t) = 'P'; ;}
    break;

  case 170:
#line 920 "imcc/imcc.y"
    { (yyval.t) = 'P'; free((yyvsp[0].s)); ;}
    break;

  case 171:
#line 925 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, (yyvsp[0].s), 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", (yyvsp[0].s));
            }
         ;}
    break;

  case 172:
#line 935 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "set", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 173:
#line 936 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "not", 2, (yyvsp[-3].sr), (yyvsp[0].sr));;}
    break;

  case 174:
#line 937 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "neg", 2, (yyvsp[-3].sr), (yyvsp[0].sr));;}
    break;

  case 175:
#line 938 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bnot", 2, (yyvsp[-3].sr), (yyvsp[0].sr));;}
    break;

  case 176:
#line 939 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "add", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 177:
#line 940 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "sub", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 178:
#line 941 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mul", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 179:
#line 942 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "pow", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 180:
#line 943 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "div", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 181:
#line 944 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "fdiv", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 182:
#line 945 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mod", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 183:
#line 946 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "concat", 3, (yyvsp[-4].sr),(yyvsp[-2].sr),(yyvsp[0].sr)); ;}
    break;

  case 184:
#line 948 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shl", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 185:
#line 950 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 186:
#line 952 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "lsr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 187:
#line 954 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "and", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 188:
#line 956 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "or", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 189:
#line 958 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "xor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 190:
#line 960 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "band", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 191:
#line 962 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 192:
#line 964 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bxor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 193:
#line 966 "imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); ;}
    break;

  case 194:
#line 968 "imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[0].sr)); ;}
    break;

  case 195:
#line 970 "imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-2].s), (yyvsp[0].sr), 1); ;}
    break;

  case 196:
#line 972 "imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-6].sr), (yyvsp[-3].s), (yyvsp[-1].sr), 1); ;}
    break;

  case 197:
#line 974 "imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-3].sr), (yyvsp[0].s), NULL, 1); ;}
    break;

  case 198:
#line 976 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[-3].sr), (yyvsp[0].sr)); ;}
    break;

  case 199:
#line 978 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 200:
#line 980 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-6].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); ;}
    break;

  case 201:
#line 982 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "set_addr",
                            2, (yyvsp[-3].sr), mk_label_address(interp, (yyvsp[0].s))); ;}
    break;

  case 202:
#line 985 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "find_global",2,(yyvsp[-3].sr),(yyvsp[0].sr));;}
    break;

  case 203:
#line 987 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "store_global",2, (yyvsp[-2].sr),(yyvsp[0].sr)); ;}
    break;

  case 204:
#line 991 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 205:
#line 993 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 206:
#line 995 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); ;}
    break;

  case 207:
#line 998 "imcc/imcc.y"
    {
            add_pcc_result((yyvsp[0].i)->r[0], (yyvsp[-2].sr));
            cur_call = NULL;
            (yyval.i) = 0;
         ;}
    break;

  case 208:
#line 1004 "imcc/imcc.y"
    {
            (yyval.i) = IMCC_create_itcall_label(interp);
         ;}
    break;

  case 209:
#line 1008 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[-3].sr));
           cur_call = NULL;
         ;}
    break;

  case 212:
#line 1015 "imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[-2].sr)); ;}
    break;

  case 213:
#line 1020 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "add", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 214:
#line 1022 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "sub", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 215:
#line 1024 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mul", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 216:
#line 1026 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "div", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 217:
#line 1028 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mod", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 218:
#line 1030 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "fdiv", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 219:
#line 1032 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "concat", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 220:
#line 1034 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "band", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 221:
#line 1036 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 222:
#line 1038 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bxor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 223:
#line 1040 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 224:
#line 1042 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shl", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 225:
#line 1044 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "lsr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 226:
#line 1049 "imcc/imcc.y"
    { (yyval.i) = func_ins(interp, cur_unit, (yyvsp[-3].sr), (yyvsp[-1].s),
                                   regs,nargs,keyvec,1);
                     free((yyvsp[-1].s));
                   ;}
    break;

  case 227:
#line 1055 "imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); ;}
    break;

  case 228:
#line 1056 "imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); ;}
    break;

  case 229:
#line 1057 "imcc/imcc.y"
    { (yyval.sr) = (yyvsp[0].sr);
                       if ((yyvsp[0].sr)->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     ;}
    break;

  case 230:
#line 1062 "imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 231:
#line 1063 "imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); ;}
    break;

  case 232:
#line 1064 "imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 233:
#line 1067 "imcc/imcc.y"
    { (yyval.t)=0; ;}
    break;

  case 234:
#line 1068 "imcc/imcc.y"
    { (yyval.t)=0; ;}
    break;

  case 235:
#line 1073 "imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[0].sr));
        ;}
    break;

  case 236:
#line 1078 "imcc/imcc.y"
    {  (yyval.i) = (yyvsp[-3].i); ;}
    break;

  case 237:
#line 1082 "imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 238:
#line 1083 "imcc/imcc.y"
    {  (yyval.sr) = 0; add_pcc_arg(cur_call, (yyvsp[0].sr)); ;}
    break;

  case 239:
#line 1084 "imcc/imcc.y"
    {  (yyval.sr) = 0; add_pcc_arg(cur_call, (yyvsp[0].sr)); ;}
    break;

  case 240:
#line 1088 "imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); ;}
    break;

  case 241:
#line 1092 "imcc/imcc.y"
    {  (yyval.t) = 0; ;}
    break;

  case 242:
#line 1093 "imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); ;}
    break;

  case 243:
#line 1097 "imcc/imcc.y"
    {  (yyval.t) = VT_FLAT; ;}
    break;

  case 244:
#line 1100 "imcc/imcc.y"
    { (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); ;}
    break;

  case 245:
#line 1104 "imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_result(cur_call, (yyvsp[0].sr)); ;}
    break;

  case 246:
#line 1105 "imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_result(cur_call, (yyvsp[0].sr)); ;}
    break;

  case 247:
#line 1110 "imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, (yyvsp[-3].s), 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 248:
#line 1112 "imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, inv_op((yyvsp[-3].s)), 3, (yyvsp[-4].sr),(yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 249:
#line 1114 "imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 250:
#line 1116 "imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 251:
#line 1118 "imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 252:
#line 1120 "imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless",2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 253:
#line 1122 "imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 254:
#line 1124 "imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 255:
#line 1128 "imcc/imcc.y"
    {  (yyval.s) = "eq"; ;}
    break;

  case 256:
#line 1129 "imcc/imcc.y"
    {  (yyval.s) = "ne"; ;}
    break;

  case 257:
#line 1130 "imcc/imcc.y"
    {  (yyval.s) = "gt"; ;}
    break;

  case 258:
#line 1131 "imcc/imcc.y"
    {  (yyval.s) = "ge"; ;}
    break;

  case 259:
#line 1132 "imcc/imcc.y"
    {  (yyval.s) = "lt"; ;}
    break;

  case 260:
#line 1133 "imcc/imcc.y"
    {  (yyval.s) = "le"; ;}
    break;

  case 263:
#line 1142 "imcc/imcc.y"
    {  (yyval.sr) = NULL; ;}
    break;

  case 264:
#line 1143 "imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 265:
#line 1147 "imcc/imcc.y"
    { (yyval.sr) = regs[0]; ;}
    break;

  case 267:
#line 1152 "imcc/imcc.y"
    {  regs[nargs++] = (yyvsp[0].sr); ;}
    break;

  case 268:
#line 1154 "imcc/imcc.y"
    {
                      regs[nargs++] = (yyvsp[-3].sr);
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = (yyvsp[-1].sr); (yyval.sr) = (yyvsp[-3].sr);
                   ;}
    break;

  case 270:
#line 1162 "imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); ;}
    break;

  case 271:
#line 1166 "imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); ;}
    break;

  case 272:
#line 1167 "imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); ;}
    break;

  case 273:
#line 1171 "imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); ;}
    break;

  case 274:
#line 1172 "imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); ;}
    break;

  case 279:
#line 1185 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; ;}
    break;

  case 280:
#line 1186 "imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp, nkeys, keys); ;}
    break;

  case 281:
#line 1190 "imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[0].sr); ;}
    break;

  case 282:
#line 1192 "imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[0].sr); (yyval.sr) =  keys[0]; ;}
    break;

  case 283:
#line 1193 "imcc/imcc.y"
    { in_slice = 1; ;}
    break;

  case 284:
#line 1194 "imcc/imcc.y"
    { keys[nkeys++] = (yyvsp[0].sr); (yyval.sr) =  keys[0]; ;}
    break;

  case 285:
#line 1198 "imcc/imcc.y"
    { if (in_slice) {
                         (yyvsp[0].sr)->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     (yyval.sr) = (yyvsp[0].sr);
                   ;}
    break;

  case 286:
#line 1204 "imcc/imcc.y"
    { (yyvsp[-2].sr)->type |= VT_START_SLICE;  (yyvsp[0].sr)->type |= VT_END_SLICE;
                     keys[nkeys++] = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 287:
#line 1206 "imcc/imcc.y"
    { (yyvsp[0].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 288:
#line 1207 "imcc/imcc.y"
    { (yyvsp[-1].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[-1].sr); ;}
    break;

  case 289:
#line 1211 "imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'I'); ;}
    break;

  case 290:
#line 1212 "imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'N'); ;}
    break;

  case 291:
#line 1213 "imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); ;}
    break;

  case 292:
#line 1214 "imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'P'); ;}
    break;

  case 293:
#line 1215 "imcc/imcc.y"
    {  (yyval.sr) = mk_pasm_reg(interp, (yyvsp[0].s)); ;}
    break;

  case 294:
#line 1219 "imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'I'); ;}
    break;

  case 295:
#line 1220 "imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'N'); ;}
    break;

  case 296:
#line 1221 "imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); ;}
    break;

  case 297:
#line 1222 "imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'U'); ;}
    break;

  case 298:
#line 1226 "imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); ;}
    break;

  case 299:
#line 1227 "imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); ;}
    break;


      default: break;
    }

/* Line 1126 of yacc.c.  */
#line 3669 "imcc/imcparser.c"

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
	  int yytype = YYTRANSLATE (yychar);
	  YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
	  YYSIZE_T yysize = yysize0;
	  YYSIZE_T yysize1;
	  int yysize_overflow = 0;
	  char *yymsg = 0;
#	  define YYERROR_VERBOSE_ARGS_MAXIMUM 5
	  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
	  int yyx;

#if 0
	  /* This is so xgettext sees the translatable formats that are
	     constructed on the fly.  */
	  YY_("syntax error, unexpected %s");
	  YY_("syntax error, unexpected %s, expecting %s");
	  YY_("syntax error, unexpected %s, expecting %s or %s");
	  YY_("syntax error, unexpected %s, expecting %s or %s or %s");
	  YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
#endif
	  char *yyfmt;
	  char const *yyf;
	  static char const yyunexpected[] = "syntax error, unexpected %s";
	  static char const yyexpecting[] = ", expecting %s";
	  static char const yyor[] = " or %s";
	  char yyformat[sizeof yyunexpected
			+ sizeof yyexpecting - 1
			+ ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
			   * (sizeof yyor - 1))];
	  char const *yyprefix = yyexpecting;

	  /* Start YYX at -YYN if negative to avoid negative indexes in
	     YYCHECK.  */
	  int yyxbegin = yyn < 0 ? -yyn : 0;

	  /* Stay within bounds of both yycheck and yytname.  */
	  int yychecklim = YYLAST - yyn;
	  int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
	  int yycount = 1;

	  yyarg[0] = yytname[yytype];
	  yyfmt = yystpcpy (yyformat, yyunexpected);

	  for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	      {
		if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
		  {
		    yycount = 1;
		    yysize = yysize0;
		    yyformat[sizeof yyunexpected - 1] = '\0';
		    break;
		  }
		yyarg[yycount++] = yytname[yyx];
		yysize1 = yysize + yytnamerr (0, yytname[yyx]);
		yysize_overflow |= yysize1 < yysize;
		yysize = yysize1;
		yyfmt = yystpcpy (yyfmt, yyprefix);
		yyprefix = yyor;
	      }

	  yyf = YY_(yyformat);
	  yysize1 = yysize + yystrlen (yyf);
	  yysize_overflow |= yysize1 < yysize;
	  yysize = yysize1;

	  if (!yysize_overflow && yysize <= YYSTACK_ALLOC_MAXIMUM)
	    yymsg = (char *) YYSTACK_ALLOC (yysize);
	  if (yymsg)
	    {
	      /* Avoid sprintf, as that infringes on the user's name space.
		 Don't have undefined behavior even if the translation
		 produced a string with the wrong number of "%s"s.  */
	      char *yyp = yymsg;
	      int yyi = 0;
	      while ((*yyp = *yyf))
		{
		  if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		    {
		      yyp += yytnamerr (yyp, yyarg[yyi++]);
		      yyf += 2;
		    }
		  else
		    {
		      yyp++;
		      yyf++;
		    }
		}
	      yyerror (yymsg);
	      YYSTACK_FREE (yymsg);
	    }
	  else
	    {
	      yyerror (YY_("syntax error"));
	      goto yyexhaustedlab;
	    }
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror (YY_("syntax error"));
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
        {
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
        }
      else
	{
	  yydestruct ("Error: discarding", yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (0)
     goto yyerrorlab;

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


      yydestruct ("Error: popping", yystos[yystate], yyvsp);
      YYPOPSTACK;
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token. */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

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
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK;
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  return yyresult;
}


#line 1232 "imcc/imcc.y"



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

