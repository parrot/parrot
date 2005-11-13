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
     GOTO = 263,
     ARG = 264,
     IF = 265,
     UNLESS = 266,
     PNULL = 267,
     ADV_FLAT = 268,
     ADV_SLURPY = 269,
     ADV_OPTIONAL = 270,
     ADV_OPT_FLAG = 271,
     NEW = 272,
     NAMESPACE = 273,
     ENDNAMESPACE = 274,
     DOT_METHOD = 275,
     SUB = 276,
     SYM = 277,
     LOCAL = 278,
     LEXICAL = 279,
     CONST = 280,
     INC = 281,
     DEC = 282,
     GLOBAL_CONST = 283,
     PLUS_ASSIGN = 284,
     MINUS_ASSIGN = 285,
     MUL_ASSIGN = 286,
     DIV_ASSIGN = 287,
     CONCAT_ASSIGN = 288,
     BAND_ASSIGN = 289,
     BOR_ASSIGN = 290,
     BXOR_ASSIGN = 291,
     FDIV = 292,
     FDIV_ASSIGN = 293,
     MOD_ASSIGN = 294,
     SHR_ASSIGN = 295,
     SHL_ASSIGN = 296,
     SHR_U_ASSIGN = 297,
     SHIFT_LEFT = 298,
     SHIFT_RIGHT = 299,
     INTV = 300,
     FLOATV = 301,
     STRINGV = 302,
     PMCV = 303,
     OBJECTV = 304,
     LOG_XOR = 305,
     RELOP_EQ = 306,
     RELOP_NE = 307,
     RELOP_GT = 308,
     RELOP_GTE = 309,
     RELOP_LT = 310,
     RELOP_LTE = 311,
     GLOBAL = 312,
     GLOBALOP = 313,
     ADDR = 314,
     RESULT = 315,
     RETURN = 316,
     YIELDT = 317,
     POW = 318,
     SHIFT_RIGHT_U = 319,
     LOG_AND = 320,
     LOG_OR = 321,
     COMMA = 322,
     ESUB = 323,
     DOTDOT = 324,
     PCC_BEGIN = 325,
     PCC_END = 326,
     PCC_CALL = 327,
     PCC_SUB = 328,
     PCC_BEGIN_RETURN = 329,
     PCC_END_RETURN = 330,
     PCC_BEGIN_YIELD = 331,
     PCC_END_YIELD = 332,
     NCI_CALL = 333,
     METH_CALL = 334,
     INVOCANT = 335,
     MAIN = 336,
     LOAD = 337,
     IMMEDIATE = 338,
     POSTCOMP = 339,
     METHOD = 340,
     ANON = 341,
     OUTER = 342,
     MULTI = 343,
     LABEL = 344,
     EMIT = 345,
     EOM = 346,
     IREG = 347,
     NREG = 348,
     SREG = 349,
     PREG = 350,
     IDENTIFIER = 351,
     REG = 352,
     MACRO = 353,
     ENDM = 354,
     STRINGC = 355,
     INTC = 356,
     FLOATC = 357,
     USTRINGC = 358,
     PARROT_OP = 359,
     VAR = 360,
     LINECOMMENT = 361,
     FILECOMMENT = 362,
     DOT = 363,
     CONCAT = 364,
     POINTY = 365
   };
#endif
/* Tokens.  */
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define N_OPERATORS 261
#define HLL 262
#define GOTO 263
#define ARG 264
#define IF 265
#define UNLESS 266
#define PNULL 267
#define ADV_FLAT 268
#define ADV_SLURPY 269
#define ADV_OPTIONAL 270
#define ADV_OPT_FLAG 271
#define NEW 272
#define NAMESPACE 273
#define ENDNAMESPACE 274
#define DOT_METHOD 275
#define SUB 276
#define SYM 277
#define LOCAL 278
#define LEXICAL 279
#define CONST 280
#define INC 281
#define DEC 282
#define GLOBAL_CONST 283
#define PLUS_ASSIGN 284
#define MINUS_ASSIGN 285
#define MUL_ASSIGN 286
#define DIV_ASSIGN 287
#define CONCAT_ASSIGN 288
#define BAND_ASSIGN 289
#define BOR_ASSIGN 290
#define BXOR_ASSIGN 291
#define FDIV 292
#define FDIV_ASSIGN 293
#define MOD_ASSIGN 294
#define SHR_ASSIGN 295
#define SHL_ASSIGN 296
#define SHR_U_ASSIGN 297
#define SHIFT_LEFT 298
#define SHIFT_RIGHT 299
#define INTV 300
#define FLOATV 301
#define STRINGV 302
#define PMCV 303
#define OBJECTV 304
#define LOG_XOR 305
#define RELOP_EQ 306
#define RELOP_NE 307
#define RELOP_GT 308
#define RELOP_GTE 309
#define RELOP_LT 310
#define RELOP_LTE 311
#define GLOBAL 312
#define GLOBALOP 313
#define ADDR 314
#define RESULT 315
#define RETURN 316
#define YIELDT 317
#define POW 318
#define SHIFT_RIGHT_U 319
#define LOG_AND 320
#define LOG_OR 321
#define COMMA 322
#define ESUB 323
#define DOTDOT 324
#define PCC_BEGIN 325
#define PCC_END 326
#define PCC_CALL 327
#define PCC_SUB 328
#define PCC_BEGIN_RETURN 329
#define PCC_END_RETURN 330
#define PCC_BEGIN_YIELD 331
#define PCC_END_YIELD 332
#define NCI_CALL 333
#define METH_CALL 334
#define INVOCANT 335
#define MAIN 336
#define LOAD 337
#define IMMEDIATE 338
#define POSTCOMP 339
#define METHOD 340
#define ANON 341
#define OUTER 342
#define MULTI 343
#define LABEL 344
#define EMIT 345
#define EOM 346
#define IREG 347
#define NREG 348
#define SREG 349
#define PREG 350
#define IDENTIFIER 351
#define REG 352
#define MACRO 353
#define ENDM 354
#define STRINGC 355
#define INTC 356
#define FLOATC 357
#define USTRINGC 358
#define PARROT_OP 359
#define VAR 360
#define LINECOMMENT 361
#define FILECOMMENT 362
#define DOT 363
#define CONCAT 364
#define POINTY 365




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
#line 308 "imcc/imcc.y"
typedef union YYSTYPE {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} YYSTYPE;
/* Line 196 of yacc.c.  */
#line 620 "imcc/imcparser.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 219 of yacc.c.  */
#line 632 "imcc/imcparser.c"

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
#define YYFINAL  39
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   582

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  127
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  110
/* YYNRULES -- Number of rules. */
#define YYNRULES  296
/* YYNRULES -- Number of states. */
#define YYNSTATES  506

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   365

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   117,     2,     2,     2,   123,   124,     2,
     115,   116,   121,   120,     2,   118,     2,   122,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   126,
       2,   112,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   113,     2,   114,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   125,     2,   119,     2,     2,     2,
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
     106,   107,   108,   109,   110,   111
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short int yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    25,    27,    29,    33,    36,    39,    44,    48,
      54,    55,    62,    63,    70,    72,    75,    79,    82,    84,
      86,    88,    90,    91,    95,    99,   102,   107,   108,   110,
     111,   116,   117,   119,   124,   125,   126,   127,   138,   139,
     141,   145,   146,   152,   153,   155,   160,   165,   166,   170,
     172,   174,   176,   178,   180,   182,   183,   185,   186,   187,
     188,   199,   200,   210,   211,   214,   215,   219,   220,   222,
     224,   228,   230,   232,   234,   236,   238,   240,   242,   244,
     250,   254,   258,   262,   266,   272,   278,   279,   283,   286,
     287,   291,   295,   296,   301,   302,   305,   307,   309,   311,
     313,   315,   317,   319,   320,   326,   328,   329,   332,   336,
     340,   341,   347,   348,   354,   355,   357,   361,   363,   366,
     367,   370,   373,   375,   377,   378,   380,   383,   385,   387,
     391,   393,   397,   399,   401,   404,   407,   408,   413,   418,
     419,   426,   428,   429,   436,   439,   442,   445,   448,   450,
     452,   454,   455,   457,   459,   461,   463,   465,   467,   469,
     473,   478,   483,   488,   494,   500,   506,   512,   518,   524,
     530,   536,   542,   548,   554,   560,   566,   572,   578,   584,
     590,   597,   604,   611,   619,   624,   629,   636,   644,   649,
     654,   659,   664,   671,   679,   683,   684,   694,   696,   698,
     702,   706,   710,   714,   718,   722,   726,   730,   734,   738,
     742,   746,   750,   754,   759,   761,   763,   765,   769,   773,
     777,   779,   781,   782,   788,   789,   793,   795,   798,   799,
     802,   804,   807,   811,   813,   820,   827,   833,   839,   844,
     849,   854,   859,   861,   863,   865,   867,   869,   871,   873,
     875,   876,   878,   882,   884,   886,   891,   893,   895,   897,
     899,   901,   903,   905,   907,   909,   911,   912,   915,   917,
     921,   922,   927,   929,   933,   936,   939,   941,   943,   945,
     947,   949,   951,   953,   955,   957,   959
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     128,     0,    -1,   129,    -1,   130,    -1,   129,   130,    -1,
     147,    -1,   135,    -1,   134,    -1,   148,    -1,   161,    -1,
     144,    -1,    99,     4,    -1,   131,    -1,     4,    -1,     6,
     132,     4,    -1,   133,     4,    -1,     7,   102,    -1,     8,
     101,    68,   101,    -1,    58,   202,    97,    -1,    58,   202,
      97,   112,   235,    -1,    -1,    26,   136,   202,    97,   112,
     235,    -1,    -1,    26,   138,   102,   227,   112,   101,    -1,
     140,    -1,   139,   140,    -1,   193,   141,     4,    -1,    99,
       4,    -1,   108,    -1,   107,    -1,   147,    -1,   137,    -1,
      -1,   142,   105,   143,    -1,    74,   169,    90,    -1,    13,
     228,    -1,    25,   101,    68,    98,    -1,    -1,   221,    -1,
      -1,    91,   145,   146,    92,    -1,    -1,   139,    -1,    19,
     113,   229,   114,    -1,    -1,    -1,    -1,    22,   149,   224,
     150,   169,     4,   151,   152,   160,    69,    -1,    -1,     4,
      -1,   152,   153,     4,    -1,    -1,     5,   154,   202,    97,
     178,    -1,    -1,    68,    -1,    89,   115,   158,   116,    -1,
      88,   115,   101,   116,    -1,    -1,   158,    68,   159,    -1,
     159,    -1,    46,    -1,    47,    -1,    49,    -1,    48,    -1,
      97,    -1,    -1,   190,    -1,    -1,    -1,    -1,    74,   162,
      97,   163,   169,     4,   164,   152,   160,    69,    -1,    -1,
      71,     4,   166,   173,   168,   172,   167,   175,    72,    -1,
      -1,   195,     4,    -1,    -1,    81,   228,     4,    -1,    -1,
     170,    -1,   171,    -1,   170,   155,   171,    -1,    83,    -1,
      82,    -1,    84,    -1,    85,    -1,    87,    -1,    86,    -1,
     156,    -1,   157,    -1,    73,   228,    68,   228,     4,    -1,
      73,   228,     4,    -1,    79,   228,     4,    -1,    80,   220,
       4,    -1,    80,   101,     4,    -1,    80,   220,    68,   228,
       4,    -1,    80,   101,    68,   228,     4,    -1,    -1,   173,
     174,     4,    -1,    10,   213,    -1,    -1,   175,   176,     4,
      -1,    61,   220,   178,    -1,    -1,    24,   177,   202,    97,
      -1,    -1,   178,   179,    -1,    15,    -1,    16,    -1,    17,
      -1,    75,    -1,    77,    -1,    76,    -1,    78,    -1,    -1,
     180,     4,   183,   184,   181,    -1,   186,    -1,    -1,   184,
       4,    -1,   184,   185,     4,    -1,    62,   228,   214,    -1,
      -1,    62,   115,   187,   189,   116,    -1,    -1,    63,   115,
     188,   189,   116,    -1,    -1,   213,    -1,   189,    68,   213,
      -1,   192,    -1,   190,   192,    -1,    -1,   191,   196,    -1,
      99,     4,    -1,   108,    -1,   107,    -1,    -1,   194,    -1,
     194,   195,    -1,   195,    -1,    90,    -1,   193,   198,     4,
      -1,    97,    -1,   197,    68,    97,    -1,   204,    -1,   218,
      -1,    19,    97,    -1,    20,    97,    -1,    -1,    24,   199,
     202,   197,    -1,    25,   101,    68,   220,    -1,    -1,    26,
     200,   202,    97,   112,   235,    -1,   137,    -1,    -1,    29,
     201,   202,    97,   112,   235,    -1,    62,   210,    -1,     9,
     226,    -1,   105,   221,    -1,    13,   228,    -1,   210,    -1,
     165,    -1,   182,    -1,    -1,    46,    -1,    47,    -1,    48,
      -1,    49,    -1,    50,    -1,   203,    -1,    97,    -1,   220,
     112,   228,    -1,   220,   112,   117,   228,    -1,   220,   112,
     118,   228,    -1,   220,   112,   119,   228,    -1,   220,   112,
     228,   120,   228,    -1,   220,   112,   228,   118,   228,    -1,
     220,   112,   228,   121,   228,    -1,   220,   112,   228,    64,
     228,    -1,   220,   112,   228,   122,   228,    -1,   220,   112,
     228,    38,   228,    -1,   220,   112,   228,   123,   228,    -1,
     220,   112,   228,   110,   228,    -1,   220,   112,   228,    44,
     228,    -1,   220,   112,   228,    45,   228,    -1,   220,   112,
     228,    65,   228,    -1,   220,   112,   228,    66,   228,    -1,
     220,   112,   228,    67,   228,    -1,   220,   112,   228,    51,
     228,    -1,   220,   112,   228,   124,   228,    -1,   220,   112,
     228,   125,   228,    -1,   220,   112,   228,   119,   228,    -1,
     220,   112,   228,   113,   229,   114,    -1,   220,   113,   229,
     114,   112,   228,    -1,   220,   112,    18,   203,    68,   228,
      -1,   220,   112,    18,   203,   113,   229,   114,    -1,   220,
     112,    18,   203,    -1,   220,   112,    18,   228,    -1,   220,
     112,    18,   228,    68,   228,    -1,   220,   112,    18,   228,
     113,   229,   114,    -1,   220,   112,    60,    97,    -1,   220,
     112,    59,   236,    -1,    59,   236,   112,   228,    -1,    18,
     220,    68,   228,    -1,    18,   220,    68,   228,    68,   228,
      -1,    18,   220,    68,   228,   113,   229,   114,    -1,   220,
     112,   210,    -1,    -1,   205,   115,   217,   116,   112,   208,
     115,   212,   116,    -1,   206,    -1,   207,    -1,   220,   112,
      13,    -1,   220,    30,   228,    -1,   220,    31,   228,    -1,
     220,    32,   228,    -1,   220,    33,   228,    -1,   220,    40,
     228,    -1,   220,    39,   228,    -1,   220,    34,   228,    -1,
     220,    35,   228,    -1,   220,    36,   228,    -1,   220,    37,
     228,    -1,   220,    41,   228,    -1,   220,    42,   228,    -1,
     220,    43,   228,    -1,   220,   112,   105,   143,    -1,    97,
      -1,   101,    -1,   220,    -1,   220,   209,   225,    -1,   220,
     209,   101,    -1,   220,   209,   220,    -1,   111,    -1,   109,
      -1,    -1,   208,   211,   115,   212,   116,    -1,    -1,   212,
      68,   213,    -1,   213,    -1,   228,   214,    -1,    -1,   214,
     215,    -1,    14,    -1,   220,   178,    -1,   217,    68,   216,
      -1,   216,    -1,    11,   228,   219,   228,     9,   226,    -1,
      12,   228,   219,   228,     9,   226,    -1,    11,    13,   228,
       9,   226,    -1,    12,    13,   228,     9,   226,    -1,    11,
     228,     9,   226,    -1,    12,   228,     9,   226,    -1,    11,
     228,    68,   226,    -1,    12,   228,    68,   226,    -1,    52,
      -1,    53,    -1,    54,    -1,    55,    -1,    56,    -1,    57,
      -1,   106,    -1,   234,    -1,    -1,   222,    -1,   222,    68,
     223,    -1,   223,    -1,   227,    -1,   220,   113,   229,   114,
      -1,   225,    -1,   101,    -1,    97,    -1,   105,    -1,    97,
      -1,   105,    -1,   226,    -1,   228,    -1,   220,    -1,   235,
      -1,    -1,   230,   231,    -1,   233,    -1,   231,   126,   233,
      -1,    -1,   231,    68,   232,   233,    -1,   228,    -1,   228,
      70,   228,    -1,    70,   228,    -1,   228,    70,    -1,    93,
      -1,    94,    -1,    95,    -1,    96,    -1,    98,    -1,   102,
      -1,   103,    -1,   101,    -1,   104,    -1,    95,    -1,   101,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   387,   387,   391,   392,   396,   397,   398,   399,   400,
     401,   402,   403,   404,   407,   408,   411,   419,   431,   437,
     446,   446,   451,   451,   455,   456,   460,   461,   462,   463,
     464,   465,   468,   468,   472,   480,   482,   488,   492,   496,
     496,   506,   508,   512,   529,   533,   536,   528,   542,   543,
     544,   548,   548,   554,   555,   559,   562,   568,   569,   570,
     574,   575,   576,   577,   578,   590,   592,   596,   598,   602,
     596,   609,   608,   640,   641,   645,   646,   651,   652,   656,
     657,   661,   662,   663,   664,   665,   666,   667,   668,   672,
     677,   679,   684,   686,   688,   692,   700,   701,   705,   710,
     711,   715,   716,   716,   721,   722,   726,   727,   728,   733,
     734,   738,   739,   744,   743,   748,   754,   755,   757,   762,
     767,   766,   774,   773,   783,   784,   785,   790,   791,   803,
     807,   809,   810,   811,   815,   816,   820,   821,   825,   831,
     835,   843,   852,   853,   854,   855,   856,   856,   869,   873,
     873,   875,   876,   876,   878,   882,   883,   886,   888,   889,
     890,   891,   895,   896,   897,   898,   899,   900,   904,   915,
     916,   917,   918,   919,   920,   921,   922,   923,   924,   925,
     926,   927,   929,   931,   933,   935,   937,   939,   941,   943,
     945,   947,   949,   951,   953,   955,   957,   959,   961,   964,
     966,   970,   972,   974,   977,   984,   984,   992,   993,   994,
     999,  1001,  1003,  1005,  1007,  1009,  1011,  1013,  1015,  1017,
    1019,  1021,  1023,  1028,  1035,  1036,  1037,  1042,  1043,  1044,
    1047,  1048,  1053,  1052,  1062,  1063,  1064,  1068,  1072,  1073,
    1077,  1080,  1084,  1085,  1089,  1091,  1093,  1095,  1097,  1099,
    1101,  1103,  1108,  1109,  1110,  1111,  1112,  1113,  1117,  1118,
    1122,  1123,  1127,  1128,  1132,  1133,  1141,  1142,  1146,  1147,
    1151,  1152,  1156,  1157,  1161,  1162,  1165,  1165,  1170,  1171,
    1173,  1173,  1178,  1183,  1186,  1187,  1191,  1192,  1193,  1194,
    1195,  1199,  1200,  1201,  1202,  1206,  1207
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "PRAGMA",
  "N_OPERATORS", "HLL", "GOTO", "ARG", "IF", "UNLESS", "PNULL", "ADV_FLAT",
  "ADV_SLURPY", "ADV_OPTIONAL", "ADV_OPT_FLAG", "NEW", "NAMESPACE",
  "ENDNAMESPACE", "DOT_METHOD", "SUB", "SYM", "LOCAL", "LEXICAL", "CONST",
  "INC", "DEC", "GLOBAL_CONST", "PLUS_ASSIGN", "MINUS_ASSIGN",
  "MUL_ASSIGN", "DIV_ASSIGN", "CONCAT_ASSIGN", "BAND_ASSIGN", "BOR_ASSIGN",
  "BXOR_ASSIGN", "FDIV", "FDIV_ASSIGN", "MOD_ASSIGN", "SHR_ASSIGN",
  "SHL_ASSIGN", "SHR_U_ASSIGN", "SHIFT_LEFT", "SHIFT_RIGHT", "INTV",
  "FLOATV", "STRINGV", "PMCV", "OBJECTV", "LOG_XOR", "RELOP_EQ",
  "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", "RELOP_LTE", "GLOBAL",
  "GLOBALOP", "ADDR", "RESULT", "RETURN", "YIELDT", "POW", "SHIFT_RIGHT_U",
  "LOG_AND", "LOG_OR", "COMMA", "ESUB", "DOTDOT", "PCC_BEGIN", "PCC_END",
  "PCC_CALL", "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN",
  "PCC_BEGIN_YIELD", "PCC_END_YIELD", "NCI_CALL", "METH_CALL", "INVOCANT",
  "MAIN", "LOAD", "IMMEDIATE", "POSTCOMP", "METHOD", "ANON", "OUTER",
  "MULTI", "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG",
  "IDENTIFIER", "REG", "MACRO", "ENDM", "STRINGC", "INTC", "FLOATC",
  "USTRINGC", "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", "DOT",
  "CONCAT", "POINTY", "'='", "'['", "']'", "'('", "')'", "'!'", "'-'",
  "'~'", "'+'", "'*'", "'/'", "'%'", "'&'", "'|'", "';'", "$accept",
  "program", "compilation_units", "compilation_unit", "pragma", "pragma_1",
  "hll_def", "global", "constdef", "@1", "pmc_const", "@2", "pasmcode",
  "pasmline", "pasm_inst", "@3", "pasm_args", "emit", "@4", "opt_pasmcode",
  "class_namespace", "sub", "@5", "@6", "@7", "sub_params", "sub_param",
  "@8", "opt_comma", "multi", "outer", "multi_types", "multi_type",
  "sub_body", "pcc_sub", "@9", "@10", "@11", "pcc_sub_call", "@12",
  "opt_label", "opt_invocant", "sub_proto", "sub_proto_list", "proto",
  "pcc_call", "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@13",
  "paramtype_list", "paramtype", "begin_ret_or_yield", "end_ret_or_yield",
  "pcc_ret", "@14", "pcc_returns", "pcc_return", "pcc_return_many", "@15",
  "@16", "var_returns", "statements", "helper_clear_state", "statement",
  "labels", "_labels", "label", "instruction", "id_list", "labeled_inst",
  "@17", "@18", "@19", "type", "classname", "assignment", "@20",
  "op_assign", "func_assign", "the_sub", "ptr", "sub_call", "@21",
  "arglist", "arg", "argtype_list", "argtype", "result", "targetlist",
  "if_statement", "relop", "target", "vars", "_vars", "_var_or_i",
  "sub_label_op_c", "sub_label_op", "label_op", "var_or_i", "var",
  "keylist", "@22", "_keylist", "@23", "key", "reg", "const", "string", 0
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
     364,   365,    61,    91,    93,    40,    41,    33,    45,   126,
      43,    42,    47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   127,   128,   129,   129,   130,   130,   130,   130,   130,
     130,   130,   130,   130,   131,   131,   132,   133,   134,   134,
     136,   135,   138,   137,   139,   139,   140,   140,   140,   140,
     140,   140,   142,   141,   141,   141,   141,   141,   143,   145,
     144,   146,   146,   147,   149,   150,   151,   148,   152,   152,
     152,   154,   153,   155,   155,   156,   157,   158,   158,   158,
     159,   159,   159,   159,   159,   160,   160,   162,   163,   164,
     161,   166,   165,   167,   167,   168,   168,   169,   169,   170,
     170,   171,   171,   171,   171,   171,   171,   171,   171,   172,
     172,   172,   172,   172,   172,   172,   173,   173,   174,   175,
     175,   176,   177,   176,   178,   178,   179,   179,   179,   180,
     180,   181,   181,   183,   182,   182,   184,   184,   184,   185,
     187,   186,   188,   186,   189,   189,   189,   190,   190,   191,
     192,   192,   192,   192,   193,   193,   194,   194,   195,   196,
     197,   197,   198,   198,   198,   198,   199,   198,   198,   200,
     198,   198,   201,   198,   198,   198,   198,   198,   198,   198,
     198,   198,   202,   202,   202,   202,   202,   202,   203,   204,
     204,   204,   204,   204,   204,   204,   204,   204,   204,   204,
     204,   204,   204,   204,   204,   204,   204,   204,   204,   204,
     204,   204,   204,   204,   204,   204,   204,   204,   204,   204,
     204,   204,   204,   204,   204,   205,   204,   204,   204,   204,
     206,   206,   206,   206,   206,   206,   206,   206,   206,   206,
     206,   206,   206,   207,   208,   208,   208,   208,   208,   208,
     209,   209,   211,   210,   212,   212,   212,   213,   214,   214,
     215,   216,   217,   217,   218,   218,   218,   218,   218,   218,
     218,   218,   219,   219,   219,   219,   219,   219,   220,   220,
     221,   221,   222,   222,   223,   223,   224,   224,   225,   225,
     226,   226,   227,   227,   228,   228,   230,   229,   231,   231,
     232,   231,   233,   233,   233,   233,   234,   234,   234,   234,
     234,   235,   235,   235,   235,   236,   236
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     3,     2,     2,     4,     3,     5,
       0,     6,     0,     6,     1,     2,     3,     2,     1,     1,
       1,     1,     0,     3,     3,     2,     4,     0,     1,     0,
       4,     0,     1,     4,     0,     0,     0,    10,     0,     1,
       3,     0,     5,     0,     1,     4,     4,     0,     3,     1,
       1,     1,     1,     1,     1,     0,     1,     0,     0,     0,
      10,     0,     9,     0,     2,     0,     3,     0,     1,     1,
       3,     1,     1,     1,     1,     1,     1,     1,     1,     5,
       3,     3,     3,     3,     5,     5,     0,     3,     2,     0,
       3,     3,     0,     4,     0,     2,     1,     1,     1,     1,
       1,     1,     1,     0,     5,     1,     0,     2,     3,     3,
       0,     5,     0,     5,     0,     1,     3,     1,     2,     0,
       2,     2,     1,     1,     0,     1,     2,     1,     1,     3,
       1,     3,     1,     1,     2,     2,     0,     4,     4,     0,
       6,     1,     0,     6,     2,     2,     2,     2,     1,     1,
       1,     0,     1,     1,     1,     1,     1,     1,     1,     3,
       4,     4,     4,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       6,     6,     6,     7,     4,     4,     6,     7,     4,     4,
       4,     4,     6,     7,     3,     0,     9,     1,     1,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     4,     1,     1,     1,     3,     3,     3,
       1,     1,     0,     5,     0,     3,     1,     2,     0,     2,
       1,     2,     3,     1,     6,     6,     5,     5,     4,     4,
       4,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       0,     1,     3,     1,     1,     4,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     0,     2,     1,     3,
       0,     4,     1,     3,     2,     2,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
       0,    13,     0,     0,     0,    44,    20,     0,    67,    39,
       0,     0,     2,     3,    12,     0,     7,     6,    10,     5,
       8,     9,     0,     0,     0,   276,     0,     0,   162,   163,
     164,   165,   166,   168,     0,   167,     0,   134,    11,     1,
       4,    15,    16,    14,     0,     0,     0,   268,   267,   269,
      45,   266,     0,    18,    68,    22,   138,     0,    29,    28,
      31,   134,    24,     0,    30,    32,   135,   137,    17,    43,
       0,   286,   287,   288,   289,   290,   293,   291,   292,   294,
     258,   274,   282,   277,   278,   259,   275,    77,     0,     0,
      77,     0,    27,    25,    40,     0,     0,    77,     0,     0,
     136,   284,   285,   280,     0,    82,    81,    83,    84,    86,
      85,     0,     0,    87,    88,     0,    53,    79,     0,    19,
       0,     0,    35,     0,     0,    26,   260,   283,     0,   279,
       0,    57,    46,    54,     0,    21,    69,   270,   271,   272,
       0,   273,     0,    34,    33,   274,    38,   261,   263,   264,
     281,     0,    60,    61,    63,    62,    64,     0,    59,    48,
      80,    48,     0,    36,   276,     0,    56,     0,    55,    49,
     129,   129,    23,     0,   262,    58,    51,     0,   133,   132,
       0,     0,   129,   134,   127,     0,   265,     0,   131,    50,
      47,   128,   161,   130,    70,     0,     0,     0,     0,     0,
       0,     0,     0,   146,     0,   149,   152,     0,     0,     0,
       0,   109,   110,   224,   225,   260,   151,   159,     0,   160,
     115,     0,   142,     0,   207,   208,   232,   158,   143,   226,
     104,   155,     0,     0,     0,     0,   157,     0,   144,   145,
       0,     0,     0,     0,   295,   296,     0,   120,   154,   226,
     122,    71,   156,   113,   139,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     231,   230,     0,   276,     0,    52,     0,     0,   252,   253,
     254,   255,   256,   257,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   124,   124,    96,   116,
     243,     0,   104,   234,   210,   211,   212,   213,   216,   217,
     218,   219,   215,   214,   220,   221,   222,   209,     0,     0,
       0,   293,   260,     0,     0,     0,   204,   274,   169,     0,
     228,   229,   227,   106,   107,   108,   105,     0,   248,   250,
       0,     0,   249,   251,     0,   201,   140,   147,   148,     0,
       0,   200,     0,   125,   238,     0,    75,     0,     0,     0,
     241,     0,   236,   194,   195,   199,   198,   223,   170,   171,
     172,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     276,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     246,     0,   247,     0,     0,   276,     0,     0,     0,     0,
     121,   237,   123,     0,     0,     0,     0,   117,     0,   111,
     112,   114,     0,   242,     0,     0,   233,     0,   276,     0,
     276,   178,   181,   182,   186,   176,   183,   184,   185,   180,
       0,   174,   189,   173,   175,   177,   179,   187,   188,     0,
     244,   245,   202,     0,   141,   150,   153,   126,   240,   239,
      98,     0,     0,     0,     0,    73,    97,   238,   118,     0,
     235,   192,     0,   196,     0,   190,   191,   203,    76,     0,
       0,     0,     0,    99,     0,   119,   234,   193,   197,    90,
       0,    91,    93,     0,    92,     0,     0,    74,     0,     0,
       0,     0,   102,     0,    72,     0,   206,    89,    95,    94,
       0,   104,   100,     0,   101,   103
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    11,    12,    13,    14,    23,    15,    16,    17,    27,
      60,    91,    61,    62,    98,    99,   144,    18,    37,    63,
      19,    20,    26,    87,   159,   170,   180,   187,   134,   113,
     114,   157,   158,   181,    21,    36,    90,   161,   217,   298,
     473,   405,   115,   116,   117,   455,   356,   406,   486,   495,
     500,   275,   336,   218,   411,   219,   299,   357,   412,   220,
     296,   297,   352,   182,   183,   184,    65,    66,    67,   193,
     347,   221,   240,   242,   243,    34,    35,   222,   223,   224,
     225,   226,   274,   227,   256,   361,   353,   401,   449,   300,
     301,   228,   285,    81,   146,   147,   148,    50,    51,   139,
     149,   354,    45,    46,    83,   128,    84,    85,    86,   246
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -299
static const short int yypact[] =
{
      16,  -299,     3,   -78,   -77,  -299,  -299,   117,  -299,  -299,
      35,    69,    16,  -299,  -299,   101,  -299,  -299,  -299,  -299,
    -299,  -299,   -62,   109,    44,  -299,    17,   117,  -299,  -299,
    -299,  -299,  -299,  -299,    20,  -299,    24,    54,  -299,  -299,
    -299,  -299,  -299,  -299,    33,    28,   423,  -299,  -299,  -299,
    -299,  -299,    46,    61,  -299,  -299,  -299,   141,  -299,  -299,
    -299,    97,  -299,    55,  -299,     8,    86,  -299,  -299,  -299,
     451,  -299,  -299,  -299,  -299,  -299,  -299,  -299,  -299,  -299,
    -299,  -299,   113,   -59,  -299,  -299,  -299,   238,    78,   108,
     238,    95,  -299,  -299,  -299,   451,    87,   238,   195,   102,
    -299,  -299,   451,  -299,   423,  -299,  -299,  -299,  -299,  -299,
    -299,    85,   115,  -299,  -299,   229,    10,  -299,   108,  -299,
     243,   406,  -299,   180,   161,  -299,   406,  -299,   423,  -299,
     152,    -3,  -299,  -299,   238,  -299,  -299,  -299,  -299,  -299,
     142,  -299,   158,  -299,  -299,   148,  -299,   196,  -299,  -299,
    -299,   147,  -299,  -299,  -299,  -299,  -299,   -50,  -299,   262,
    -299,   262,   167,  -299,  -299,   406,  -299,    -3,  -299,  -299,
       2,     2,  -299,   153,  -299,  -299,  -299,   268,  -299,  -299,
     271,   207,   166,    86,  -299,   208,  -299,   117,  -299,  -299,
    -299,  -299,   290,  -299,  -299,   182,    14,    34,    76,   451,
     164,   183,   189,  -299,   186,   179,  -299,    90,   341,   173,
     285,  -299,  -299,  -299,  -299,   406,  -299,  -299,   287,  -299,
    -299,   294,  -299,   191,  -299,  -299,  -299,  -299,  -299,   455,
    -299,  -299,   451,     4,   451,   184,  -299,   239,  -299,  -299,
     117,   245,   117,   117,  -299,  -299,   205,  -299,  -299,   -58,
    -299,  -299,  -299,  -299,  -299,   164,   203,   451,   451,   451,
     451,   451,   451,   451,   451,   451,   451,   451,   451,   451,
    -299,  -299,   357,  -299,   199,   227,   319,    14,  -299,  -299,
    -299,  -299,  -299,  -299,    14,   451,   320,    14,    14,   451,
     451,   253,   164,   254,   258,   451,   451,   451,  -299,  -299,
    -299,   -41,  -299,   451,  -299,  -299,  -299,  -299,  -299,  -299,
    -299,  -299,  -299,  -299,  -299,  -299,  -299,  -299,   437,    90,
     259,   225,   406,   451,   451,   451,  -299,    40,   359,   244,
    -299,  -299,  -299,  -299,  -299,  -299,  -299,    14,  -299,  -299,
     348,    14,  -299,  -299,   350,   -43,  -299,   292,  -299,   250,
     251,  -299,   -31,  -299,  -299,   -20,     6,     1,   164,   260,
     227,   -19,  -299,    71,    73,  -299,  -299,  -299,  -299,  -299,
    -299,   451,   451,   451,   451,   451,   451,   451,   451,   451,
    -299,   451,   451,   451,   451,   451,   451,   451,   451,   261,
    -299,    14,  -299,    14,   451,  -299,   269,   108,   108,   451,
    -299,   360,  -299,   451,   451,   122,   367,  -299,   451,  -299,
    -299,  -299,   372,  -299,   476,   451,  -299,   451,  -299,   451,
    -299,  -299,  -299,  -299,  -299,  -299,  -299,  -299,  -299,  -299,
     264,  -299,  -299,  -299,  -299,  -299,  -299,  -299,  -299,   451,
    -299,  -299,  -299,   266,  -299,  -299,  -299,  -299,  -299,  -299,
    -299,   377,   451,   451,   313,    86,  -299,  -299,  -299,   267,
    -299,  -299,   275,  -299,   278,  -299,  -299,  -299,  -299,    15,
     389,    25,    27,  -299,   390,   360,   451,  -299,  -299,  -299,
     451,  -299,  -299,   451,  -299,   451,    -7,  -299,    38,   394,
     396,   397,  -299,   164,  -299,   398,  -299,  -299,  -299,  -299,
     117,  -299,  -299,   318,   227,  -299
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -299,  -299,  -299,   408,  -299,  -299,  -299,  -299,  -299,  -299,
     226,  -299,  -299,   361,  -299,  -299,    99,  -299,  -299,  -299,
     -11,  -299,  -299,  -299,  -299,   270,  -299,  -299,  -299,  -299,
    -299,  -299,   263,   256,  -299,  -299,  -299,  -299,  -299,  -299,
    -299,  -299,    36,  -299,   295,  -299,  -299,  -299,  -299,  -299,
    -299,  -298,  -299,  -299,  -299,  -299,  -299,  -299,  -299,  -299,
    -299,  -299,   131,  -299,  -299,   282,   249,  -299,   -65,  -299,
    -299,  -299,  -299,  -299,  -299,   -27,   123,  -299,  -299,  -299,
    -299,    19,  -299,  -174,  -299,   -32,  -295,    -9,  -299,    88,
    -299,  -299,   214,  -124,   242,  -299,   300,  -299,   192,  -185,
     346,   -40,  -149,  -299,  -299,  -299,   -76,  -299,   -86,   149
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -227
static const short int yytable[] =
{
      52,   100,   145,   119,   360,   407,    82,   176,   362,   103,
      22,   231,   -37,   277,   -78,   173,   403,   492,   167,   479,
       1,    95,     2,    24,     3,   394,    64,   358,   129,   482,
     101,   484,   135,    96,   248,     4,    25,   399,     5,    38,
      42,   145,     6,   152,   153,   154,   155,   232,   399,   415,
      64,   270,   150,   271,   493,   122,   278,   279,   280,   281,
     282,   283,   127,   408,    82,   494,   168,   104,   229,    39,
     395,   -65,   284,     4,     7,   359,   237,   409,   133,   410,
      55,   141,    97,   480,   249,   400,   141,   404,    82,   234,
       8,   145,   338,   483,   156,   485,   402,   416,   326,   339,
     -78,   177,   342,   343,   447,    41,   415,     9,   450,   178,
     179,   137,    44,    43,    47,    10,     4,    53,    48,   138,
     460,    54,    49,    55,   329,   141,   120,    71,    72,    73,
      74,   302,    75,   124,    68,    76,    77,    78,    79,   417,
      80,   419,    69,    88,    56,    92,   -41,    94,   327,   270,
     331,   271,   390,    57,   496,  -226,   392,   233,   235,   236,
     195,    58,    59,    28,    29,    30,    31,    32,   348,    71,
      72,    73,    74,    89,    75,   141,    56,    76,    77,    78,
      79,   362,    80,   102,   418,   244,   420,    56,   123,   -42,
     118,   245,   276,   287,   286,   452,    57,   121,   145,   125,
     130,   453,   454,   504,    58,    59,   440,   126,   441,    76,
      77,    78,    79,   291,    33,   293,   294,   304,   305,   306,
     307,   308,   309,   310,   311,   312,   313,   314,   315,   316,
     131,   430,   328,   132,   302,   -66,   278,   279,   280,   281,
     282,   283,   333,   334,   335,   340,   443,   136,   142,   344,
     345,   143,   288,   151,   162,   351,   163,    71,    72,    73,
      74,   164,    75,   166,   165,   177,   169,   186,   172,   462,
      80,   464,   188,   178,   179,   189,   190,   194,   364,   230,
     238,   -22,   141,   368,   369,   370,   239,   241,   250,   251,
     249,   253,    71,    72,    73,    74,    47,    75,   254,   196,
     330,   197,   198,   199,    49,    80,   255,   290,   200,   201,
     202,   445,   446,   292,   203,   204,   205,   295,   303,   206,
     105,   106,   107,   108,   109,   110,   111,   112,   337,   341,
     472,   421,   422,   423,   424,   425,   426,   427,   428,   429,
    -225,   431,   432,   433,   434,   435,   436,   437,   438,   207,
     346,   349,   208,   209,   442,   350,   366,   391,   389,   393,
     396,   210,   397,   398,   451,   211,   444,   212,   457,   501,
     317,   456,   414,   439,   448,   318,   458,   461,   465,   463,
     467,   468,   476,    71,    72,    73,    74,   213,    75,   477,
     474,   214,   478,   481,   487,   215,    80,   371,   497,   466,
     498,   499,   502,   372,   373,  -205,    71,    72,    73,    74,
     374,    75,   469,   470,   471,   505,   319,   320,   216,    80,
      40,   367,    93,   375,   376,   377,   378,   185,   355,   160,
     175,   171,   192,   459,    71,    72,    73,    74,   213,    75,
     489,   363,   214,   490,   488,   491,   413,    80,   475,   289,
      71,    72,    73,    74,   213,    75,   247,   252,   321,    77,
      78,    79,   322,    80,   191,   174,   332,   140,   365,   379,
       0,     0,   380,   503,   323,   324,   325,   381,   382,   383,
     384,   385,   386,   387,   388,   257,   258,   259,   260,   261,
     262,   263,   264,    70,   265,   266,   267,   268,   269,    71,
      72,    73,    74,   137,    75,     0,     0,    76,    77,    78,
      79,   138,    80,     0,     0,     0,    71,    72,    73,    74,
       0,    75,     0,     0,    76,    77,    78,    79,     0,    80,
      71,    72,    73,    74,    33,    75,     0,     0,    76,    77,
      78,    79,     0,    80,    71,    72,    73,    74,     0,    75,
       0,     0,    76,    77,    78,    79,     0,    80,     0,     0,
       0,     0,     0,     0,   270,     0,   271,   272,   273,    71,
      72,    73,    74,   213,    75,     0,     0,   214,     0,     0,
       0,     0,    80
};

static const short int yycheck[] =
{
      27,    66,   126,    89,   302,     4,    46,     5,   303,    68,
       7,   196,     4,     9,     4,   164,    10,    24,    68,     4,
       4,    13,     6,   101,     8,    68,    37,    68,   104,     4,
      70,     4,   118,    25,   208,    19,   113,    68,    22,     4,
     102,   165,    26,    46,    47,    48,    49,    13,    68,    68,
      61,   109,   128,   111,    61,    95,    52,    53,    54,    55,
      56,    57,   102,    62,   104,    72,   116,   126,   192,     0,
     113,    69,    68,    19,    58,   116,   200,    76,    68,    78,
      26,   121,    74,    68,   208,   116,   126,    81,   128,    13,
      74,   215,   277,    68,    97,    68,   116,   116,   272,   284,
      90,    99,   287,   288,   399,     4,    68,    91,   403,   107,
     108,    97,    68,     4,    97,    99,    19,    97,   101,   105,
     415,    97,   105,    26,   273,   165,    90,    93,    94,    95,
      96,   255,    98,    97,   101,   101,   102,   103,   104,    68,
     106,    68,   114,    97,    90,     4,    92,    92,   272,   109,
     274,   111,   337,    99,   116,   115,   341,   197,   198,   199,
     187,   107,   108,    46,    47,    48,    49,    50,   292,    93,
      94,    95,    96,   112,    98,   215,    90,   101,   102,   103,
     104,   476,   106,    70,   113,    95,   113,    90,   101,    92,
     112,   101,   232,     9,   234,    73,    99,   102,   322,     4,
     115,    79,    80,   501,   107,   108,   391,   105,   393,   101,
     102,   103,   104,   240,    97,   242,   243,   257,   258,   259,
     260,   261,   262,   263,   264,   265,   266,   267,   268,   269,
     115,   380,   272,     4,   358,    69,    52,    53,    54,    55,
      56,    57,    15,    16,    17,   285,   395,     4,    68,   289,
     290,    90,    68,   101,   112,   295,    98,    93,    94,    95,
      96,   113,    98,   116,    68,    99,     4,   114,   101,   418,
     106,   420,     4,   107,   108,     4,    69,    69,   318,    97,
      97,   102,   322,   323,   324,   325,    97,   101,   115,     4,
     414,     4,    93,    94,    95,    96,    97,    98,     4,     9,
     101,    11,    12,    13,   105,   106,   115,    68,    18,    19,
      20,   397,   398,    68,    24,    25,    26,   112,   115,    29,
      82,    83,    84,    85,    86,    87,    88,    89,     9,     9,
     454,   371,   372,   373,   374,   375,   376,   377,   378,   379,
     115,   381,   382,   383,   384,   385,   386,   387,   388,    59,
      97,    97,    62,    63,   394,    97,    97,     9,   114,     9,
      68,    71,   112,   112,   404,    75,    97,    77,   408,   493,
      13,     4,   112,   112,    14,    18,     4,   417,   114,   419,
     114,     4,   115,    93,    94,    95,    96,    97,    98,   114,
     455,   101,   114,     4,     4,   105,   106,    38,     4,   439,
       4,     4,     4,    44,    45,   115,    93,    94,    95,    96,
      51,    98,   452,   453,   101,    97,    59,    60,   192,   106,
      12,   322,    61,    64,    65,    66,    67,   171,   297,   134,
     167,   161,   183,   414,    93,    94,    95,    96,    97,    98,
     480,   318,   101,   483,   476,   485,   358,   106,   457,   235,
      93,    94,    95,    96,    97,    98,   115,   215,   101,   102,
     103,   104,   105,   106,   182,   165,   274,   121,   319,   110,
      -1,    -1,   113,   500,   117,   118,   119,   118,   119,   120,
     121,   122,   123,   124,   125,    30,    31,    32,    33,    34,
      35,    36,    37,    70,    39,    40,    41,    42,    43,    93,
      94,    95,    96,    97,    98,    -1,    -1,   101,   102,   103,
     104,   105,   106,    -1,    -1,    -1,    93,    94,    95,    96,
      -1,    98,    -1,    -1,   101,   102,   103,   104,    -1,   106,
      93,    94,    95,    96,    97,    98,    -1,    -1,   101,   102,
     103,   104,    -1,   106,    93,    94,    95,    96,    -1,    98,
      -1,    -1,   101,   102,   103,   104,    -1,   106,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,   111,   112,   113,    93,
      94,    95,    96,    97,    98,    -1,    -1,   101,    -1,    -1,
      -1,    -1,   106
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,    19,    22,    26,    58,    74,    91,
      99,   128,   129,   130,   131,   133,   134,   135,   144,   147,
     148,   161,     7,   132,   101,   113,   149,   136,    46,    47,
      48,    49,    50,    97,   202,   203,   162,   145,     4,     0,
     130,     4,   102,     4,    68,   229,   230,    97,   101,   105,
     224,   225,   202,    97,    97,    26,    90,    99,   107,   108,
     137,   139,   140,   146,   147,   193,   194,   195,   101,   114,
      70,    93,    94,    95,    96,    98,   101,   102,   103,   104,
     106,   220,   228,   231,   233,   234,   235,   150,    97,   112,
     163,   138,     4,   140,    92,    13,    25,    74,   141,   142,
     195,   228,    70,    68,   126,    82,    83,    84,    85,    86,
      87,    88,    89,   156,   157,   169,   170,   171,   112,   235,
     169,   102,   228,   101,   169,     4,   105,   228,   232,   233,
     115,   115,     4,    68,   155,   235,     4,    97,   105,   226,
     227,   228,    68,    90,   143,   220,   221,   222,   223,   227,
     233,   101,    46,    47,    48,    49,    97,   158,   159,   151,
     171,   164,   112,    98,   113,    68,   116,    68,   116,     4,
     152,   152,   101,   229,   223,   159,     5,    99,   107,   108,
     153,   160,   190,   191,   192,   160,   114,   154,     4,     4,
      69,   192,   193,   196,    69,   202,     9,    11,    12,    13,
      18,    19,    20,    24,    25,    26,    29,    59,    62,    63,
      71,    75,    77,    97,   101,   105,   137,   165,   180,   182,
     186,   198,   204,   205,   206,   207,   208,   210,   218,   220,
      97,   226,    13,   228,    13,   228,   228,   220,    97,    97,
     199,   101,   200,   201,    95,   101,   236,   115,   210,   220,
     115,     4,   221,     4,     4,   115,   211,    30,    31,    32,
      33,    34,    35,    36,    37,    39,    40,    41,    42,    43,
     109,   111,   112,   113,   209,   178,   228,     9,    52,    53,
      54,    55,    56,    57,    68,   219,   228,     9,    68,   219,
      68,   202,    68,   202,   202,   112,   187,   188,   166,   183,
     216,   217,   220,   115,   228,   228,   228,   228,   228,   228,
     228,   228,   228,   228,   228,   228,   228,    13,    18,    59,
      60,   101,   105,   117,   118,   119,   210,   220,   228,   229,
     101,   220,   225,    15,    16,    17,   179,     9,   226,   226,
     228,     9,   226,   226,   228,   228,    97,   197,   220,    97,
      97,   228,   189,   213,   228,   189,   173,   184,    68,   116,
     178,   212,   213,   203,   228,   236,    97,   143,   228,   228,
     228,    38,    44,    45,    51,    64,    65,    66,    67,   110,
     113,   118,   119,   120,   121,   122,   123,   124,   125,   114,
     226,     9,   226,     9,    68,   113,    68,   112,   112,    68,
     116,   214,   116,    10,    81,   168,   174,     4,    62,    76,
      78,   181,   185,   216,   112,    68,   116,    68,   113,    68,
     113,   228,   228,   228,   228,   228,   228,   228,   228,   228,
     229,   228,   228,   228,   228,   228,   228,   228,   228,   112,
     226,   226,   228,   229,    97,   235,   235,   213,    14,   215,
     213,   228,    73,    79,    80,   172,     4,   228,     4,   208,
     213,   228,   229,   228,   229,   114,   228,   114,     4,   228,
     228,   101,   220,   167,   195,   214,   115,   114,   114,     4,
      68,     4,     4,    68,     4,    68,   175,     4,   212,   228,
     228,   228,    24,    61,    72,   176,   116,     4,     4,     4,
     177,   220,     4,   202,   178,    97
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
#line 387 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 5:
#line 396 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); ;}
    break;

  case 6:
#line 397 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); ;}
    break;

  case 7:
#line 398 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); ;}
    break;

  case 8:
#line 399 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; ;}
    break;

  case 9:
#line 400 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; ;}
    break;

  case 10:
#line 401 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); imc_close_unit(interp, cur_unit); cur_unit = 0; ;}
    break;

  case 11:
#line 402 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 12:
#line 403 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 13:
#line 404 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 14:
#line 407 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 15:
#line 408 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 16:
#line 412 "imcc/imcc.y"
    { if ((yyvsp[0].s))
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    ;}
    break;

  case 17:
#line 420 "imcc/imcc.y"
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
#line 432 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         ;}
    break;

  case 19:
#line 438 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            (yyval.i) = 0;
         ;}
    break;

  case 20:
#line 446 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 21:
#line 447 "imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1);is_def=0; ;}
    break;

  case 22:
#line 451 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 23:
#line 452 "imcc/imcc.y"
    { (yyval.i) = mk_pmc_const(interp, cur_unit, (yyvsp[-3].s), (yyvsp[-2].sr), (yyvsp[0].s));is_def=0; ;}
    break;

  case 26:
#line 460 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 27:
#line 461 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 28:
#line 462 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 29:
#line 463 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 30:
#line 464 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[0].i); ;}
    break;

  case 32:
#line 468 "imcc/imcc.y"
    { clear_state(); ;}
    break;

  case 33:
#line 470 "imcc/imcc.y"
    { (yyval.i) = INS(interp, cur_unit, (yyvsp[-1].s),0,regs,nargs,keyvec,1);
                     free((yyvsp[-1].s)); ;}
    break;

  case 34:
#line 473 "imcc/imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                     (yyval.i) = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, (yyvsp[0].s)));
                     cur_call->pcc_sub->pragma = (yyvsp[-1].t);
                   ;}
    break;

  case 35:
#line 481 "imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[0].sr)); ;}
    break;

  case 36:
#line 483 "imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, (yyvsp[0].s));
                       r->usage |= U_LEXICAL; (yyval.i) = 0;
                       r->reg = mk_const(interp, (yyvsp[-2].s), 'S');
                   ;}
    break;

  case 37:
#line 488 "imcc/imcc.y"
    { (yyval.i) = 0;;}
    break;

  case 39:
#line 496 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); ;}
    break;

  case 40:
#line 498 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     (yyval.i)=0; ;}
    break;

  case 43:
#line 513 "imcc/imcc.y"
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

  case 44:
#line 529 "imcc/imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        ;}
    break;

  case 45:
#line 533 "imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, (yyvsp[0].sr));
        ;}
    break;

  case 46:
#line 536 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = (yyvsp[-1].t); ;}
    break;

  case 47:
#line 538 "imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; ;}
    break;

  case 48:
#line 542 "imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 49:
#line 543 "imcc/imcc.y"
    { (yyval.sr) = 0; ;}
    break;

  case 50:
#line 544 "imcc/imcc.y"
    { add_pcc_param(cur_call, (yyvsp[-1].sr));;}
    break;

  case 51:
#line 548 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 52:
#line 549 "imcc/imcc.y"
    { (yyval.sr) = mk_ident(interp, (yyvsp[-1].s), (yyvsp[-2].t));
                                         is_def=0; (yyval.sr)->type |= (yyvsp[0].t); ;}
    break;

  case 53:
#line 554 "imcc/imcc.y"
    { (yyval.t) = 0;  ;}
    break;

  case 55:
#line 559 "imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 56:
#line 563 "imcc/imcc.y"
    { (yyval.t) = 0; cur_unit->outer =
                     mk_sub_address_fromc(interp, (yyvsp[-1].s)); ;}
    break;

  case 57:
#line 568 "imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 58:
#line 569 "imcc/imcc.y"
    { (yyval.t) = 0; add_pcc_multi(cur_call, (yyvsp[0].sr)); ;}
    break;

  case 59:
#line 570 "imcc/imcc.y"
    { (yyval.t) = 0;  add_pcc_multi(cur_call, (yyvsp[0].sr));;}
    break;

  case 60:
#line 574 "imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("INTVAL"), 'S'); ;}
    break;

  case 61:
#line 575 "imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("FLOATVAL"), 'S'); ;}
    break;

  case 62:
#line 576 "imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("PMC"), 'S'); ;}
    break;

  case 63:
#line 577 "imcc/imcc.y"
    { (yyval.sr) = mk_const(interp, str_dup("STRING"), 'S'); ;}
    break;

  case 64:
#line 578 "imcc/imcc.y"
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

  case 67:
#line 596 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); ;}
    break;

  case 68:
#line 598 "imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, (yyvsp[0].s)));

         ;}
    break;

  case 69:
#line 602 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = (yyvsp[-1].t); ;}
    break;

  case 70:
#line 604 "imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; ;}
    break;

  case 71:
#line 609 "imcc/imcc.y"
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

  case 72:
#line 636 "imcc/imcc.y"
    { (yyval.i) = 0; cur_call = NULL; ;}
    break;

  case 73:
#line 640 "imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->label = 0; ;}
    break;

  case 74:
#line 641 "imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->label = 1; ;}
    break;

  case 75:
#line 645 "imcc/imcc.y"
    { (yyval.i) = NULL; ;}
    break;

  case 76:
#line 647 "imcc/imcc.y"
    { (yyval.i) = NULL;  cur_call->pcc_sub->object = (yyvsp[-1].sr); ;}
    break;

  case 77:
#line 651 "imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 79:
#line 656 "imcc/imcc.y"
    { (yyval.t) = (yyvsp[0].t); ;}
    break;

  case 80:
#line 657 "imcc/imcc.y"
    { (yyval.t) = (yyvsp[-2].t) | (yyvsp[0].t); ;}
    break;

  case 81:
#line 661 "imcc/imcc.y"
    {  (yyval.t) = P_LOAD; ;}
    break;

  case 82:
#line 662 "imcc/imcc.y"
    {  (yyval.t) = P_MAIN; ;}
    break;

  case 83:
#line 663 "imcc/imcc.y"
    {  (yyval.t) = P_IMMEDIATE; ;}
    break;

  case 84:
#line 664 "imcc/imcc.y"
    {  (yyval.t) = P_POSTCOMP; ;}
    break;

  case 85:
#line 665 "imcc/imcc.y"
    {  (yyval.t) = P_ANON; ;}
    break;

  case 86:
#line 666 "imcc/imcc.y"
    {  (yyval.t) = P_METHOD; ;}
    break;

  case 89:
#line 673 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, (yyvsp[-3].sr));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         ;}
    break;

  case 90:
#line 678 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-1].sr)); ;}
    break;

  case 91:
#line 680 "imcc/imcc.y"
    {
            add_pcc_sub(cur_call, (yyvsp[-1].sr));
            cur_call->pcc_sub->flags |= isNCI;
         ;}
    break;

  case 92:
#line 685 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-1].sr)); ;}
    break;

  case 93:
#line 687 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, (yyvsp[-1].s),'S')); ;}
    break;

  case 94:
#line 689 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, (yyvsp[-3].sr));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         ;}
    break;

  case 95:
#line 693 "imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, (yyvsp[-3].s),'S'));
            add_pcc_cc(cur_call, (yyvsp[-1].sr));
         ;}
    break;

  case 96:
#line 700 "imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 97:
#line 701 "imcc/imcc.y"
    {  add_pcc_arg(cur_call, (yyvsp[-1].sr)); ;}
    break;

  case 98:
#line 705 "imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 99:
#line 710 "imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 100:
#line 711 "imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_result(cur_call, (yyvsp[-1].sr)); ;}
    break;

  case 101:
#line 715 "imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); ;}
    break;

  case 102:
#line 716 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 103:
#line 717 "imcc/imcc.y"
    {  mk_ident(interp, (yyvsp[0].s), (yyvsp[-1].t)); is_def=0; (yyval.sr)=0; ;}
    break;

  case 104:
#line 721 "imcc/imcc.y"
    {  (yyval.t) = 0; ;}
    break;

  case 105:
#line 722 "imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); ;}
    break;

  case 106:
#line 726 "imcc/imcc.y"
    {  (yyval.t) = VT_FLAT;   ;}
    break;

  case 107:
#line 727 "imcc/imcc.y"
    {  (yyval.t) = VT_OPTIONAL; ;}
    break;

  case 108:
#line 728 "imcc/imcc.y"
    {  (yyval.t) = VT_OPT_FLAG; ;}
    break;

  case 109:
#line 733 "imcc/imcc.y"
    { (yyval.t) = 0; ;}
    break;

  case 110:
#line 734 "imcc/imcc.y"
    { (yyval.t) = 1; ;}
    break;

  case 113:
#line 744 "imcc/imcc.y"
    { begin_return_or_yield(interp, (yyvsp[-1].t)); ;}
    break;

  case 114:
#line 747 "imcc/imcc.y"
    { (yyval.i) = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; ;}
    break;

  case 115:
#line 748 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.i) = 0;  ;}
    break;

  case 116:
#line 754 "imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 117:
#line 756 "imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); ;}
    break;

  case 118:
#line 758 "imcc/imcc.y"
    {  if((yyvsp[-1].sr)) add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[-1].sr)); ;}
    break;

  case 119:
#line 762 "imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); ;}
    break;

  case 120:
#line 767 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        ;}
    break;

  case 121:
#line 772 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  ;}
    break;

  case 122:
#line 774 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        ;}
    break;

  case 123:
#line 779 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; (yyval.t) = 0;  ;}
    break;

  case 124:
#line 783 "imcc/imcc.y"
    { (yyval.i) = 0; ;}
    break;

  case 125:
#line 784 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr));    ;}
    break;

  case 126:
#line 785 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, (yyvsp[0].sr));    ;}
    break;

  case 129:
#line 803 "imcc/imcc.y"
    { clear_state(); ;}
    break;

  case 130:
#line 808 "imcc/imcc.y"
    {  (yyval.i) = (yyvsp[0].i); ;}
    break;

  case 131:
#line 809 "imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 132:
#line 810 "imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 133:
#line 811 "imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 134:
#line 815 "imcc/imcc.y"
    {  (yyval.i) = NULL; ;}
    break;

  case 138:
#line 825 "imcc/imcc.y"
    {
                     (yyval.i) = iLABEL(cur_unit, mk_local_label(interp, (yyvsp[0].s)));
                   ;}
    break;

  case 139:
#line 832 "imcc/imcc.y"
    { (yyval.i) = (yyvsp[-1].i); ;}
    break;

  case 140:
#line 836 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = (yyvsp[0].s);
            (yyval.idlist) = l;
         ;}
    break;

  case 141:
#line 844 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = (yyvsp[0].s);
           l->next = (yyvsp[-2].idlist);
           (yyval.idlist) = l;
        ;}
    break;

  case 144:
#line 854 "imcc/imcc.y"
    { push_namespace((yyvsp[0].s)); ;}
    break;

  case 145:
#line 855 "imcc/imcc.y"
    { pop_namespace((yyvsp[0].s)); ;}
    break;

  case 146:
#line 856 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 147:
#line 857 "imcc/imcc.y"
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

  case 148:
#line 870 "imcc/imcc.y"
    { (yyvsp[0].sr)->usage |= U_LEXICAL;
                      (yyvsp[0].sr)->reg = mk_const(interp, (yyvsp[-2].s), 'S');
                   (yyval.i) = 0; ;}
    break;

  case 149:
#line 873 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 150:
#line 874 "imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 0);is_def=0; ;}
    break;

  case 152:
#line 876 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 153:
#line 877 "imcc/imcc.y"
    { mk_const_ident(interp, (yyvsp[-2].s), (yyvsp[-3].t), (yyvsp[0].sr), 1);is_def=0; ;}
    break;

  case 154:
#line 878 "imcc/imcc.y"
    { (yyval.i) = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        ;}
    break;

  case 155:
#line 882 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "branch",1, (yyvsp[0].sr)); ;}
    break;

  case 156:
#line 884 "imcc/imcc.y"
    { (yyval.i) = INS(interp, cur_unit, (yyvsp[-1].s), 0, regs, nargs, keyvec, 1);
                                          free((yyvsp[-1].s)); ;}
    break;

  case 157:
#line 887 "imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[0].sr)); ;}
    break;

  case 158:
#line 888 "imcc/imcc.y"
    {  (yyval.i) = 0; cur_call = NULL; ;}
    break;

  case 159:
#line 889 "imcc/imcc.y"
    {  (yyval.i) = 0; ;}
    break;

  case 161:
#line 891 "imcc/imcc.y"
    { (yyval.i) = 0;;}
    break;

  case 162:
#line 895 "imcc/imcc.y"
    { (yyval.t) = 'I'; ;}
    break;

  case 163:
#line 896 "imcc/imcc.y"
    { (yyval.t) = 'N'; ;}
    break;

  case 164:
#line 897 "imcc/imcc.y"
    { (yyval.t) = 'S'; ;}
    break;

  case 165:
#line 898 "imcc/imcc.y"
    { (yyval.t) = 'P'; ;}
    break;

  case 166:
#line 899 "imcc/imcc.y"
    { (yyval.t) = 'P'; ;}
    break;

  case 167:
#line 900 "imcc/imcc.y"
    { (yyval.t) = 'P'; free((yyvsp[0].s)); ;}
    break;

  case 168:
#line 905 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, (yyvsp[0].s), 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", (yyvsp[0].s));
            }
         ;}
    break;

  case 169:
#line 915 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "set", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 170:
#line 916 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "not", 2, (yyvsp[-3].sr), (yyvsp[0].sr));;}
    break;

  case 171:
#line 917 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "neg", 2, (yyvsp[-3].sr), (yyvsp[0].sr));;}
    break;

  case 172:
#line 918 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bnot", 2, (yyvsp[-3].sr), (yyvsp[0].sr));;}
    break;

  case 173:
#line 919 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "add", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 174:
#line 920 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "sub", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 175:
#line 921 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mul", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 176:
#line 922 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "pow", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 177:
#line 923 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "div", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 178:
#line 924 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "fdiv", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 179:
#line 925 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mod", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 180:
#line 926 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "concat", 3, (yyvsp[-4].sr),(yyvsp[-2].sr),(yyvsp[0].sr)); ;}
    break;

  case 181:
#line 928 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shl", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 182:
#line 930 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 183:
#line 932 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "lsr", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 184:
#line 934 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "and", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 185:
#line 936 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "or", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 186:
#line 938 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "xor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 187:
#line 940 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "band", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 188:
#line 942 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 189:
#line 944 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bxor", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 190:
#line 946 "imcc/imcc.y"
    { (yyval.i) = iINDEXFETCH(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); ;}
    break;

  case 191:
#line 948 "imcc/imcc.y"
    { (yyval.i) = iINDEXSET(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[0].sr)); ;}
    break;

  case 192:
#line 950 "imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-5].sr), (yyvsp[-2].s), (yyvsp[0].sr), 1); ;}
    break;

  case 193:
#line 952 "imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-6].sr), (yyvsp[-3].s), (yyvsp[-1].sr), 1); ;}
    break;

  case 194:
#line 954 "imcc/imcc.y"
    { (yyval.i) = iNEW(interp, cur_unit, (yyvsp[-3].sr), (yyvsp[0].s), NULL, 1); ;}
    break;

  case 195:
#line 956 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[-3].sr), (yyvsp[0].sr)); ;}
    break;

  case 196:
#line 958 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 197:
#line 960 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-6].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); ;}
    break;

  case 198:
#line 962 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "set_addr",
                            2, (yyvsp[-3].sr), mk_label_address(interp, (yyvsp[0].s))); ;}
    break;

  case 199:
#line 965 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "find_global",2,(yyvsp[-3].sr),(yyvsp[0].sr));;}
    break;

  case 200:
#line 967 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "store_global",2, (yyvsp[-2].sr),(yyvsp[0].sr)); ;}
    break;

  case 201:
#line 971 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 202:
#line 973 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 203:
#line 975 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "new", 3, (yyvsp[-5].sr), (yyvsp[-3].sr), (yyvsp[-1].sr)); ;}
    break;

  case 204:
#line 978 "imcc/imcc.y"
    {
            add_pcc_result((yyvsp[0].i)->r[0], (yyvsp[-2].sr));
            cur_call = NULL;
            (yyval.i) = 0;
         ;}
    break;

  case 205:
#line 984 "imcc/imcc.y"
    {
            (yyval.i) = IMCC_create_itcall_label(interp);
         ;}
    break;

  case 206:
#line 988 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, (yyvsp[-3].sr));
           cur_call = NULL;
         ;}
    break;

  case 209:
#line 995 "imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, "null", 1, (yyvsp[-2].sr)); ;}
    break;

  case 210:
#line 1000 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "add", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 211:
#line 1002 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "sub", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 212:
#line 1004 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mul", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 213:
#line 1006 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "div", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 214:
#line 1008 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "mod", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 215:
#line 1010 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "fdiv", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 216:
#line 1012 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "concat", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 217:
#line 1014 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "band", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 218:
#line 1016 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 219:
#line 1018 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "bxor", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 220:
#line 1020 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 221:
#line 1022 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "shl", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 222:
#line 1024 "imcc/imcc.y"
    { (yyval.i) = MK_I(interp, cur_unit, "lsr", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 223:
#line 1029 "imcc/imcc.y"
    { (yyval.i) = func_ins(interp, cur_unit, (yyvsp[-3].sr), (yyvsp[-1].s),
                                   regs,nargs,keyvec,1);
                     free((yyvsp[-1].s));
                   ;}
    break;

  case 224:
#line 1035 "imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); ;}
    break;

  case 225:
#line 1036 "imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); ;}
    break;

  case 226:
#line 1037 "imcc/imcc.y"
    { (yyval.sr) = (yyvsp[0].sr);
                       if ((yyvsp[0].sr)->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     ;}
    break;

  case 227:
#line 1042 "imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 228:
#line 1043 "imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); ;}
    break;

  case 229:
#line 1044 "imcc/imcc.y"
    { cur_obj = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 230:
#line 1047 "imcc/imcc.y"
    { (yyval.t)=0; ;}
    break;

  case 231:
#line 1048 "imcc/imcc.y"
    { (yyval.t)=0; ;}
    break;

  case 232:
#line 1053 "imcc/imcc.y"
    {
           (yyval.i) = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, (yyvsp[0].sr));
        ;}
    break;

  case 233:
#line 1058 "imcc/imcc.y"
    {  (yyval.i) = (yyvsp[-3].i); ;}
    break;

  case 234:
#line 1062 "imcc/imcc.y"
    {  (yyval.sr) = 0; ;}
    break;

  case 235:
#line 1063 "imcc/imcc.y"
    {  (yyval.sr) = 0; add_pcc_arg(cur_call, (yyvsp[0].sr)); ;}
    break;

  case 236:
#line 1064 "imcc/imcc.y"
    {  (yyval.sr) = 0; add_pcc_arg(cur_call, (yyvsp[0].sr)); ;}
    break;

  case 237:
#line 1068 "imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); ;}
    break;

  case 238:
#line 1072 "imcc/imcc.y"
    {  (yyval.t) = 0; ;}
    break;

  case 239:
#line 1073 "imcc/imcc.y"
    {  (yyval.t) = (yyvsp[-1].t) | (yyvsp[0].t); ;}
    break;

  case 240:
#line 1077 "imcc/imcc.y"
    {  (yyval.t) = VT_FLAT; ;}
    break;

  case 241:
#line 1080 "imcc/imcc.y"
    { (yyval.sr) = (yyvsp[-1].sr); (yyval.sr)->type |= (yyvsp[0].t); ;}
    break;

  case 242:
#line 1084 "imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_result(cur_call, (yyvsp[0].sr)); ;}
    break;

  case 243:
#line 1085 "imcc/imcc.y"
    { (yyval.sr) = 0; add_pcc_result(cur_call, (yyvsp[0].sr)); ;}
    break;

  case 244:
#line 1090 "imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, (yyvsp[-3].s), 3, (yyvsp[-4].sr), (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 245:
#line 1092 "imcc/imcc.y"
    {  (yyval.i) =MK_I(interp, cur_unit, inv_op((yyvsp[-3].s)), 3, (yyvsp[-4].sr),(yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 246:
#line 1094 "imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 247:
#line 1096 "imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless_null", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 248:
#line 1098 "imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 249:
#line 1100 "imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless",2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 250:
#line 1102 "imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "if", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 251:
#line 1104 "imcc/imcc.y"
    {  (yyval.i) = MK_I(interp, cur_unit, "unless", 2, (yyvsp[-2].sr), (yyvsp[0].sr)); ;}
    break;

  case 252:
#line 1108 "imcc/imcc.y"
    {  (yyval.s) = "eq"; ;}
    break;

  case 253:
#line 1109 "imcc/imcc.y"
    {  (yyval.s) = "ne"; ;}
    break;

  case 254:
#line 1110 "imcc/imcc.y"
    {  (yyval.s) = "gt"; ;}
    break;

  case 255:
#line 1111 "imcc/imcc.y"
    {  (yyval.s) = "ge"; ;}
    break;

  case 256:
#line 1112 "imcc/imcc.y"
    {  (yyval.s) = "lt"; ;}
    break;

  case 257:
#line 1113 "imcc/imcc.y"
    {  (yyval.s) = "le"; ;}
    break;

  case 260:
#line 1122 "imcc/imcc.y"
    {  (yyval.sr) = NULL; ;}
    break;

  case 261:
#line 1123 "imcc/imcc.y"
    {  (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 262:
#line 1127 "imcc/imcc.y"
    { (yyval.sr) = regs[0]; ;}
    break;

  case 264:
#line 1132 "imcc/imcc.y"
    {  regs[nargs++] = (yyvsp[0].sr); ;}
    break;

  case 265:
#line 1134 "imcc/imcc.y"
    {
                      regs[nargs++] = (yyvsp[-3].sr);
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = (yyvsp[-1].sr); (yyval.sr) = (yyvsp[-3].sr);
                   ;}
    break;

  case 267:
#line 1142 "imcc/imcc.y"
    { (yyval.sr) = mk_sub_address_fromc(interp, (yyvsp[0].s)); ;}
    break;

  case 268:
#line 1146 "imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); ;}
    break;

  case 269:
#line 1147 "imcc/imcc.y"
    { (yyval.sr) = mk_sub_address(interp, (yyvsp[0].s)); ;}
    break;

  case 270:
#line 1151 "imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); ;}
    break;

  case 271:
#line 1152 "imcc/imcc.y"
    { (yyval.sr) = mk_label_address(interp, (yyvsp[0].s)); ;}
    break;

  case 276:
#line 1165 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; ;}
    break;

  case 277:
#line 1166 "imcc/imcc.y"
    {  (yyval.sr) = link_keys(interp, nkeys, keys); ;}
    break;

  case 278:
#line 1170 "imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[0].sr); ;}
    break;

  case 279:
#line 1172 "imcc/imcc.y"
    {  keys[nkeys++] = (yyvsp[0].sr); (yyval.sr) =  keys[0]; ;}
    break;

  case 280:
#line 1173 "imcc/imcc.y"
    { in_slice = 1; ;}
    break;

  case 281:
#line 1174 "imcc/imcc.y"
    { keys[nkeys++] = (yyvsp[0].sr); (yyval.sr) =  keys[0]; ;}
    break;

  case 282:
#line 1178 "imcc/imcc.y"
    { if (in_slice) {
                         (yyvsp[0].sr)->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     (yyval.sr) = (yyvsp[0].sr);
                   ;}
    break;

  case 283:
#line 1184 "imcc/imcc.y"
    { (yyvsp[-2].sr)->type |= VT_START_SLICE;  (yyvsp[0].sr)->type |= VT_END_SLICE;
                     keys[nkeys++] = (yyvsp[-2].sr); (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 284:
#line 1186 "imcc/imcc.y"
    { (yyvsp[0].sr)->type |= VT_START_ZERO | VT_END_SLICE; (yyval.sr) = (yyvsp[0].sr); ;}
    break;

  case 285:
#line 1187 "imcc/imcc.y"
    { (yyvsp[-1].sr)->type |= VT_START_SLICE | VT_END_INF; (yyval.sr) = (yyvsp[-1].sr); ;}
    break;

  case 286:
#line 1191 "imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'I'); ;}
    break;

  case 287:
#line 1192 "imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'N'); ;}
    break;

  case 288:
#line 1193 "imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); ;}
    break;

  case 289:
#line 1194 "imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'P'); ;}
    break;

  case 290:
#line 1195 "imcc/imcc.y"
    {  (yyval.sr) = mk_pasm_reg(interp, (yyvsp[0].s)); ;}
    break;

  case 291:
#line 1199 "imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'I'); ;}
    break;

  case 292:
#line 1200 "imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'N'); ;}
    break;

  case 293:
#line 1201 "imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); ;}
    break;

  case 294:
#line 1202 "imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'U'); ;}
    break;

  case 295:
#line 1206 "imcc/imcc.y"
    {  (yyval.sr) = mk_symreg(interp, (yyvsp[0].s), 'S'); ;}
    break;

  case 296:
#line 1207 "imcc/imcc.y"
    {  (yyval.sr) = mk_const(interp, (yyvsp[0].s), 'S'); ;}
    break;


      default: break;
    }

/* Line 1126 of yacc.c.  */
#line 3626 "imcc/imcparser.c"

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


#line 1212 "imcc/imcc.y"



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

