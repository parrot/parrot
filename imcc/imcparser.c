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
     CALL = 261,
     GOTO = 262,
     ARG = 263,
     FLATTEN_ARG = 264,
     IF = 265,
     UNLESS = 266,
     END = 267,
     SAVEALL = 268,
     RESTOREALL = 269,
     NEW = 270,
     NEWSUB = 271,
     NEWCLOSURE = 272,
     NEWCOR = 273,
     NEWCONT = 274,
     NAMESPACE = 275,
     ENDNAMESPACE = 276,
     CLASS = 277,
     ENDCLASS = 278,
     FIELD = 279,
     DOT_METHOD = 280,
     SUB = 281,
     SYM = 282,
     LOCAL = 283,
     CONST = 284,
     INC = 285,
     DEC = 286,
     GLOBAL_CONST = 287,
     PLUS_ASSIGN = 288,
     MINUS_ASSIGN = 289,
     MUL_ASSIGN = 290,
     DIV_ASSIGN = 291,
     CONCAT_ASSIGN = 292,
     BAND_ASSIGN = 293,
     BOR_ASSIGN = 294,
     BXOR_ASSIGN = 295,
     FDIV = 296,
     FDIV_ASSIGN = 297,
     MOD_ASSIGN = 298,
     SHR_ASSIGN = 299,
     SHL_ASSIGN = 300,
     SHR_U_ASSIGN = 301,
     SHIFT_LEFT = 302,
     SHIFT_RIGHT = 303,
     INTV = 304,
     FLOATV = 305,
     STRINGV = 306,
     PMCV = 307,
     OBJECTV = 308,
     LOG_XOR = 309,
     RELOP_EQ = 310,
     RELOP_NE = 311,
     RELOP_GT = 312,
     RELOP_GTE = 313,
     RELOP_LT = 314,
     RELOP_LTE = 315,
     GLOBAL = 316,
     GLOBALOP = 317,
     ADDR = 318,
     RESULT = 319,
     RETURN = 320,
     YIELDT = 321,
     POW = 322,
     SHIFT_RIGHT_U = 323,
     LOG_AND = 324,
     LOG_OR = 325,
     COMMA = 326,
     ESUB = 327,
     DOTDOT = 328,
     PCC_BEGIN = 329,
     PCC_END = 330,
     PCC_CALL = 331,
     PCC_SUB = 332,
     PCC_BEGIN_RETURN = 333,
     PCC_END_RETURN = 334,
     PCC_BEGIN_YIELD = 335,
     PCC_END_YIELD = 336,
     NCI_CALL = 337,
     METH_CALL = 338,
     INVOCANT = 339,
     PROTOTYPED = 340,
     NON_PROTOTYPED = 341,
     MAIN = 342,
     LOAD = 343,
     IMMEDIATE = 344,
     POSTCOMP = 345,
     METHOD = 346,
     LABEL = 347,
     EMIT = 348,
     EOM = 349,
     IREG = 350,
     NREG = 351,
     SREG = 352,
     PREG = 353,
     IDENTIFIER = 354,
     REG = 355,
     MACRO = 356,
     ENDM = 357,
     STRINGC = 358,
     INTC = 359,
     FLOATC = 360,
     USTRINGC = 361,
     PARROT_OP = 362,
     VAR = 363,
     LINECOMMENT = 364,
     FILECOMMENT = 365,
     DOT = 366,
     CONCAT = 367,
     POINTY = 368
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define CALL 261
#define GOTO 262
#define ARG 263
#define FLATTEN_ARG 264
#define IF 265
#define UNLESS 266
#define END 267
#define SAVEALL 268
#define RESTOREALL 269
#define NEW 270
#define NEWSUB 271
#define NEWCLOSURE 272
#define NEWCOR 273
#define NEWCONT 274
#define NAMESPACE 275
#define ENDNAMESPACE 276
#define CLASS 277
#define ENDCLASS 278
#define FIELD 279
#define DOT_METHOD 280
#define SUB 281
#define SYM 282
#define LOCAL 283
#define CONST 284
#define INC 285
#define DEC 286
#define GLOBAL_CONST 287
#define PLUS_ASSIGN 288
#define MINUS_ASSIGN 289
#define MUL_ASSIGN 290
#define DIV_ASSIGN 291
#define CONCAT_ASSIGN 292
#define BAND_ASSIGN 293
#define BOR_ASSIGN 294
#define BXOR_ASSIGN 295
#define FDIV 296
#define FDIV_ASSIGN 297
#define MOD_ASSIGN 298
#define SHR_ASSIGN 299
#define SHL_ASSIGN 300
#define SHR_U_ASSIGN 301
#define SHIFT_LEFT 302
#define SHIFT_RIGHT 303
#define INTV 304
#define FLOATV 305
#define STRINGV 306
#define PMCV 307
#define OBJECTV 308
#define LOG_XOR 309
#define RELOP_EQ 310
#define RELOP_NE 311
#define RELOP_GT 312
#define RELOP_GTE 313
#define RELOP_LT 314
#define RELOP_LTE 315
#define GLOBAL 316
#define GLOBALOP 317
#define ADDR 318
#define RESULT 319
#define RETURN 320
#define YIELDT 321
#define POW 322
#define SHIFT_RIGHT_U 323
#define LOG_AND 324
#define LOG_OR 325
#define COMMA 326
#define ESUB 327
#define DOTDOT 328
#define PCC_BEGIN 329
#define PCC_END 330
#define PCC_CALL 331
#define PCC_SUB 332
#define PCC_BEGIN_RETURN 333
#define PCC_END_RETURN 334
#define PCC_BEGIN_YIELD 335
#define PCC_END_YIELD 336
#define NCI_CALL 337
#define METH_CALL 338
#define INVOCANT 339
#define PROTOTYPED 340
#define NON_PROTOTYPED 341
#define MAIN 342
#define LOAD 343
#define IMMEDIATE 344
#define POSTCOMP 345
#define METHOD 346
#define LABEL 347
#define EMIT 348
#define EOM 349
#define IREG 350
#define NREG 351
#define SREG 352
#define PREG 353
#define IDENTIFIER 354
#define REG 355
#define MACRO 356
#define ENDM 357
#define STRINGC 358
#define INTC 359
#define FLOATC 360
#define USTRINGC 361
#define PARROT_OP 362
#define VAR 363
#define LINECOMMENT 364
#define FILECOMMENT 365
#define DOT 366
#define CONCAT 367
#define POINTY 368




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
        if (pasm_file) {
            fataly(EX_UNAVAILABLE, sourcefile, line, "Ident as PMC constant",
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
    rhs = mk_const(name, 'p');
    r[1] = rhs;
    switch (type_enum) {
        case enum_class_Sub:
            rhs->usage = U_FIXUP;
            return INS(interp, unit, "set_p_pc", "", r, 2, 0, 1);
    }
    fataly(EX_UNAVAILABLE, sourcefile, line, "Unknown PMC constant",
        " type %d", type_enum);
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
    function = r0->name;
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
        SymReg * r3 = mk_const(str_dup("1"), 'I');
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
        SymReg * r3 = mk_const(str_dup("1"), 'I');
        MK_I(interp, unit, "substr %s, %s, %s, %s", 4, r0, r1,r3, r2);
    }
    else if (r0->set == 'P') {
        keyvec |= KEY_BIT(1);
	MK_I(interp, unit, "set %s[%s], %s", 3, r0,r1,r2);
    }
    else {
        fataly(EX_SOFTWARE, sourcefile, line,"unsupported indexed set op\n");
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

    UNUSED(interpreter);
    sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
    r = mk_pcc_sub(str_dup(name), 0);
    current_call = i = iLABEL(cur_unit, r);
    i->type = ITCALL | ITPCCSUB;
    return i;
}

void
IMCC_itcall_sub(Interp* interpreter, SymReg* sub)
{
   UNUSED(interpreter);
   current_call->r[0]->pcc_sub->sub = sub;
   if (cur_obj) {
       if (cur_obj->set != 'P')
          fataly(1, sourcefile, line, "object isn't a PMC");
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
begin_return_or_yield(int yield)
{
    Instruction *i, *ins;
    char name[128];
    ins = cur_unit->instructions;
    if(!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
       fataly(EX_SOFTWARE, sourcefile, line,
              "yield or return directive outside pcc subroutine\n");
    if(yield)
       ins->r[1]->pcc_sub->calls_a_sub = 1 | ITPCCYIELD;
    sprintf(name, yield ? "%cpcc_sub_yield_%d" : "%cpcc_sub_ret_%d", IMCC_INTERNAL_CHAR, cnr++);
    sr_return = mk_pcc_sub(str_dup(name), 0);
    i = iLABEL(cur_unit, sr_return);
    i->type = yield ? ITPCCSUB | ITLABEL | ITPCCYIELD : ITPCCSUB | ITLABEL ;
    asm_state = yield ? AsmInYield : AsmInReturn;
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
#line 306 "imcc/imcc.y"
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
#line 618 "imcc/imcparser.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 214 of yacc.c.  */
#line 630 "imcc/imcparser.c"

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
#define YYFINAL  35
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   582

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  130
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  106
/* YYNRULES -- Number of rules. */
#define YYNRULES  287
/* YYNRULES -- Number of states. */
#define YYNSTATES  490

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   368

#define YYTRANSLATE(YYX) 						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   120,     2,     2,     2,   126,   127,     2,
     118,   119,   124,   123,     2,   121,     2,   125,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   129,
       2,   115,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   116,     2,   117,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   128,     2,   122,     2,     2,     2,
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
     106,   107,   108,   109,   110,   111,   112,   113,   114
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short int yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    24,    27,    29,    33,    39,    40,    47,    48,
      55,    57,    60,    64,    67,    69,    71,    73,    75,    76,
      80,    84,    85,    87,    88,    93,    98,    99,   106,   108,
     109,   111,   114,   116,   118,   120,   125,   130,   131,   132,
     141,   142,   144,   148,   149,   154,   157,   158,   159,   168,
     169,   171,   175,   176,   181,   182,   193,   194,   197,   198,
     202,   204,   206,   207,   211,   213,   215,   217,   219,   221,
     223,   225,   231,   235,   239,   243,   247,   253,   259,   260,
     264,   267,   270,   271,   275,   278,   279,   284,   286,   288,
     290,   292,   293,   299,   301,   302,   305,   309,   312,   313,
     319,   320,   326,   327,   329,   333,   335,   338,   339,   342,
     345,   347,   349,   350,   352,   355,   357,   359,   363,   365,
     369,   371,   373,   376,   379,   380,   385,   386,   393,   395,
     396,   403,   404,   409,   412,   415,   418,   421,   424,   427,
     428,   432,   435,   437,   439,   441,   442,   444,   446,   448,
     450,   452,   454,   456,   458,   460,   462,   464,   468,   473,
     478,   483,   489,   495,   501,   507,   513,   519,   525,   531,
     537,   543,   549,   555,   561,   567,   573,   579,   585,   592,
     599,   606,   614,   619,   624,   631,   639,   644,   651,   656,
     661,   666,   671,   678,   686,   690,   691,   701,   703,   705,
     709,   713,   717,   721,   725,   729,   733,   737,   741,   745,
     749,   753,   757,   762,   764,   766,   770,   774,   778,   780,
     782,   783,   789,   790,   794,   796,   798,   801,   805,   807,
     814,   821,   826,   831,   836,   841,   843,   845,   847,   849,
     851,   853,   855,   857,   858,   860,   864,   866,   868,   873,
     875,   877,   879,   881,   883,   885,   887,   889,   890,   893,
     895,   899,   900,   905,   907,   911,   914,   917,   919,   921,
     923,   925,   927,   929,   931,   933,   935,   937
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short int yyrhs[] =
{
     131,     0,    -1,   132,    -1,   133,    -1,   132,   133,    -1,
     147,    -1,   146,    -1,   135,    -1,   134,    -1,   154,    -1,
     161,    -1,   144,    -1,   102,     4,    -1,     4,    -1,    62,
     205,   100,    -1,    62,   205,   100,   115,   234,    -1,    -1,
      30,   136,   205,   100,   115,   234,    -1,    -1,    30,   138,
     105,   226,   115,   104,    -1,   140,    -1,   139,   140,    -1,
     193,   141,     4,    -1,   102,     4,    -1,   111,    -1,   110,
      -1,   146,    -1,   137,    -1,    -1,   142,   108,   143,    -1,
      78,   172,    93,    -1,    -1,   221,    -1,    -1,    94,   145,
     139,    95,    -1,    21,   116,   228,   117,    -1,    -1,    23,
     100,   148,     4,   149,    24,    -1,   150,    -1,    -1,   151,
      -1,   150,   151,    -1,   152,    -1,   153,    -1,     4,    -1,
      25,   205,   100,     4,    -1,    26,   100,   100,     4,    -1,
      -1,    -1,    27,   155,   224,   172,     4,   156,   157,   160,
      -1,    -1,     4,    -1,   157,   158,     4,    -1,    -1,     5,
     159,   205,   100,    -1,   190,    73,    -1,    -1,    -1,    78,
     162,   100,   172,     4,   163,   164,   160,    -1,    -1,     4,
      -1,   164,   165,     4,    -1,    -1,     5,   166,   205,   100,
      -1,    -1,    75,   171,     4,   168,   175,   170,   174,   169,
     177,    76,    -1,    -1,   195,     4,    -1,    -1,    85,   227,
       4,    -1,    86,    -1,    87,    -1,    -1,   172,    72,   173,
      -1,   173,    -1,   171,    -1,    89,    -1,    88,    -1,    90,
      -1,    91,    -1,    92,    -1,    77,   227,    72,   227,     4,
      -1,    77,   227,     4,    -1,    83,   227,     4,    -1,    84,
     220,     4,    -1,    84,   104,     4,    -1,    84,   220,    72,
     227,     4,    -1,    84,   104,    72,   227,     4,    -1,    -1,
     175,   176,     4,    -1,     9,   227,    -1,    10,   220,    -1,
      -1,   177,   178,     4,    -1,    65,   220,    -1,    -1,    29,
     179,   205,   100,    -1,    79,    -1,    81,    -1,    80,    -1,
      82,    -1,    -1,   180,     4,   183,   184,   181,    -1,   186,
      -1,    -1,   184,     4,    -1,   184,   185,     4,    -1,    66,
     227,    -1,    -1,    66,   118,   187,   189,   119,    -1,    -1,
      67,   118,   188,   189,   119,    -1,    -1,   227,    -1,   189,
      72,   227,    -1,   192,    -1,   190,   192,    -1,    -1,   191,
     196,    -1,   102,     4,    -1,   111,    -1,   110,    -1,    -1,
     194,    -1,   194,   195,    -1,   195,    -1,    93,    -1,   193,
     198,     4,    -1,   100,    -1,   197,    72,   100,    -1,   207,
      -1,   218,    -1,    21,   100,    -1,    22,   100,    -1,    -1,
      29,   199,   205,   197,    -1,    -1,    30,   200,   205,   100,
     115,   234,    -1,   137,    -1,    -1,    33,   201,   205,   100,
     115,   234,    -1,    -1,     5,   202,   205,   100,    -1,     5,
     233,    -1,    65,   227,    -1,     9,   227,    -1,    66,   227,
      -1,     7,   225,    -1,     8,   225,    -1,    -1,    17,   203,
     143,    -1,   108,   221,    -1,   213,    -1,   167,    -1,   182,
      -1,    -1,    17,    -1,    18,    -1,    19,    -1,    20,    -1,
      50,    -1,    51,    -1,    52,    -1,    53,    -1,    54,    -1,
     206,    -1,   100,    -1,   220,   115,   227,    -1,   220,   115,
     120,   227,    -1,   220,   115,   121,   227,    -1,   220,   115,
     122,   227,    -1,   220,   115,   227,   123,   227,    -1,   220,
     115,   227,   121,   227,    -1,   220,   115,   227,   124,   227,
      -1,   220,   115,   227,    68,   227,    -1,   220,   115,   227,
     125,   227,    -1,   220,   115,   227,    42,   227,    -1,   220,
     115,   227,   126,   227,    -1,   220,   115,   227,   113,   227,
      -1,   220,   115,   227,    48,   227,    -1,   220,   115,   227,
      49,   227,    -1,   220,   115,   227,    69,   227,    -1,   220,
     115,   227,    70,   227,    -1,   220,   115,   227,    71,   227,
      -1,   220,   115,   227,    55,   227,    -1,   220,   115,   227,
     127,   227,    -1,   220,   115,   227,   128,   227,    -1,   220,
     115,   227,   122,   227,    -1,   220,   115,   227,   116,   228,
     117,    -1,   220,   116,   228,   117,   115,   227,    -1,   220,
     115,    16,   206,    72,   227,    -1,   220,   115,    16,   206,
     116,   228,   117,    -1,   220,   115,    16,   206,    -1,   220,
     115,    16,   227,    -1,   220,   115,    16,   227,    72,   227,
      -1,   220,   115,    16,   227,   116,   228,   117,    -1,   220,
     115,   204,   100,    -1,   220,   115,   204,   100,    72,   100,
      -1,   220,   115,    64,   100,    -1,   220,   115,    63,   235,
      -1,    63,   235,   115,   227,    -1,    16,   220,    72,   227,
      -1,    16,   220,    72,   227,    72,   227,    -1,    16,   220,
      72,   227,   116,   228,   117,    -1,   220,   115,   213,    -1,
      -1,   208,   118,   217,   119,   115,   211,   118,   215,   119,
      -1,   209,    -1,   210,    -1,   220,    34,   227,    -1,   220,
      35,   227,    -1,   220,    36,   227,    -1,   220,    37,   227,
      -1,   220,    44,   227,    -1,   220,    43,   227,    -1,   220,
      38,   227,    -1,   220,    39,   227,    -1,   220,    40,   227,
      -1,   220,    41,   227,    -1,   220,    45,   227,    -1,   220,
      46,   227,    -1,   220,    47,   227,    -1,   220,   115,   108,
     143,    -1,   100,    -1,   220,    -1,   220,   212,   224,    -1,
     220,   212,   104,    -1,   220,   212,   220,    -1,   114,    -1,
     112,    -1,    -1,   211,   214,   118,   215,   119,    -1,    -1,
     215,    72,   216,    -1,   216,    -1,   227,    -1,    10,   220,
      -1,   217,    72,   220,    -1,   220,    -1,    11,   227,   219,
     227,     8,   225,    -1,    12,   227,   219,   227,     8,   225,
      -1,    11,   227,     8,   225,    -1,    12,   227,     8,   225,
      -1,    11,   227,    72,   225,    -1,    12,   227,    72,   225,
      -1,    56,    -1,    57,    -1,    58,    -1,    59,    -1,    60,
      -1,    61,    -1,   109,    -1,   233,    -1,    -1,   222,    -1,
     222,    72,   223,    -1,   223,    -1,   226,    -1,   220,   116,
     228,   117,    -1,   100,    -1,   108,    -1,   100,    -1,   108,
      -1,   225,    -1,   227,    -1,   220,    -1,   234,    -1,    -1,
     229,   230,    -1,   232,    -1,   230,   129,   232,    -1,    -1,
     230,    72,   231,   232,    -1,   227,    -1,   227,    74,   227,
      -1,    74,   227,    -1,   227,    74,    -1,    96,    -1,    97,
      -1,    98,    -1,    99,    -1,   101,    -1,   105,    -1,   106,
      -1,   104,    -1,   107,    -1,    98,    -1,   104,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short int yyrline[] =
{
       0,   387,   387,   391,   392,   396,   397,   398,   399,   400,
     401,   402,   403,   404,   408,   413,   421,   421,   426,   426,
     430,   431,   435,   436,   437,   438,   439,   440,   443,   443,
     447,   454,   458,   462,   462,   474,   491,   490,   506,   507,
     511,   512,   516,   517,   518,   522,   536,   553,   558,   552,
     569,   570,   571,   575,   575,   580,   584,   586,   584,   597,
     598,   599,   603,   603,   609,   608,   640,   641,   645,   646,
     650,   651,   655,   656,   657,   660,   661,   662,   663,   664,
     665,   669,   674,   676,   681,   683,   685,   689,   696,   697,
     701,   702,   706,   707,   711,   713,   713,   717,   717,   718,
     718,   722,   721,   726,   732,   733,   735,   740,   744,   744,
     745,   745,   749,   750,   751,   756,   757,   769,   773,   775,
     776,   777,   781,   782,   786,   787,   791,   798,   802,   810,
     819,   820,   821,   822,   823,   823,   836,   836,   838,   839,
     839,   841,   841,   843,   844,   845,   846,   847,   848,   849,
     849,   852,   855,   856,   857,   858,   862,   863,   864,   865,
     869,   870,   871,   872,   873,   874,   878,   888,   889,   890,
     891,   892,   893,   894,   895,   896,   897,   898,   899,   900,
     902,   904,   906,   908,   910,   912,   914,   916,   918,   920,
     922,   924,   926,   928,   930,   932,   934,   937,   944,   947,
     949,   953,   955,   957,   960,   967,   967,   975,   976,   980,
     982,   984,   986,   988,   990,   992,   994,   996,   998,  1000,
    1002,  1004,  1009,  1016,  1017,  1021,  1022,  1023,  1026,  1027,
    1032,  1031,  1041,  1042,  1043,  1047,  1049,  1054,  1055,  1059,
    1061,  1063,  1065,  1067,  1069,  1074,  1075,  1076,  1077,  1078,
    1079,  1083,  1084,  1088,  1089,  1093,  1094,  1098,  1099,  1108,
    1109,  1113,  1114,  1118,  1119,  1123,  1124,  1127,  1127,  1132,
    1133,  1135,  1135,  1140,  1145,  1148,  1149,  1153,  1154,  1155,
    1156,  1157,  1161,  1162,  1163,  1164,  1168,  1169
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "PRAGMA",
  "CALL", "GOTO", "ARG", "FLATTEN_ARG", "IF", "UNLESS", "END", "SAVEALL",
  "RESTOREALL", "NEW", "NEWSUB", "NEWCLOSURE", "NEWCOR", "NEWCONT",
  "NAMESPACE", "ENDNAMESPACE", "CLASS", "ENDCLASS", "FIELD", "DOT_METHOD",
  "SUB", "SYM", "LOCAL", "CONST", "INC", "DEC", "GLOBAL_CONST",
  "PLUS_ASSIGN", "MINUS_ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN",
  "CONCAT_ASSIGN", "BAND_ASSIGN", "BOR_ASSIGN", "BXOR_ASSIGN", "FDIV",
  "FDIV_ASSIGN", "MOD_ASSIGN", "SHR_ASSIGN", "SHL_ASSIGN", "SHR_U_ASSIGN",
  "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV",
  "OBJECTV", "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE",
  "RELOP_LT", "RELOP_LTE", "GLOBAL", "GLOBALOP", "ADDR", "RESULT",
  "RETURN", "YIELDT", "POW", "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA",
  "ESUB", "DOTDOT", "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB",
  "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD", "PCC_END_YIELD",
  "NCI_CALL", "METH_CALL", "INVOCANT", "PROTOTYPED", "NON_PROTOTYPED",
  "MAIN", "LOAD", "IMMEDIATE", "POSTCOMP", "METHOD", "LABEL", "EMIT",
  "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "REG", "MACRO",
  "ENDM", "STRINGC", "INTC", "FLOATC", "USTRINGC", "PARROT_OP", "VAR",
  "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", "POINTY", "'='", "'['",
  "']'", "'('", "')'", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", "'%'",
  "'&'", "'|'", "';'", "$accept", "program", "compilation_units",
  "compilation_unit", "global", "constdef", "@1", "pmc_const", "@2",
  "pasmcode", "pasmline", "pasm_inst", "@3", "pasm_args", "emit", "@4",
  "class_namespace", "class", "@5", "class_body", "member_decls",
  "member_decl", "field_decl", "method_decl", "sub", "@6", "@7",
  "sub_params", "sub_param", "@8", "sub_body", "pcc_sub", "@9", "@10",
  "pcc_params", "pcc_param", "@11", "pcc_sub_call", "@12", "opt_label",
  "opt_invocant", "pcc_proto", "pcc_sub_proto", "proto", "pcc_call",
  "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@13",
  "begin_ret_or_yield", "end_ret_or_yield", "pcc_ret", "@14",
  "pcc_returns", "pcc_return", "pcc_return_many", "@15", "@16",
  "var_returns", "statements", "helper_clear_state", "statement", "labels",
  "_labels", "label", "instruction", "id_list", "labeled_inst", "@17",
  "@18", "@19", "@20", "@21", "newsub", "type", "classname", "assignment",
  "@22", "op_assign", "func_assign", "the_sub", "ptr", "sub_call", "@23",
  "arglist", "arg", "targetlist", "if_statement", "relop", "target",
  "vars", "_vars", "_var_or_i", "sub_label_op", "label_op", "var_or_i",
  "var", "keylist", "@24", "_keylist", "@25", "key", "reg", "const",
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
     364,   365,   366,   367,   368,    61,    91,    93,    40,    41,
      33,    45,   126,    43,    42,    47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   130,   131,   132,   132,   133,   133,   133,   133,   133,
     133,   133,   133,   133,   134,   134,   136,   135,   138,   137,
     139,   139,   140,   140,   140,   140,   140,   140,   142,   141,
     141,   141,   143,   145,   144,   146,   148,   147,   149,   149,
     150,   150,   151,   151,   151,   152,   153,   155,   156,   154,
     157,   157,   157,   159,   158,   160,   162,   163,   161,   164,
     164,   164,   166,   165,   168,   167,   169,   169,   170,   170,
     171,   171,   172,   172,   172,   173,   173,   173,   173,   173,
     173,   174,   174,   174,   174,   174,   174,   174,   175,   175,
     176,   176,   177,   177,   178,   179,   178,   180,   180,   181,
     181,   183,   182,   182,   184,   184,   184,   185,   187,   186,
     188,   186,   189,   189,   189,   190,   190,   191,   192,   192,
     192,   192,   193,   193,   194,   194,   195,   196,   197,   197,
     198,   198,   198,   198,   199,   198,   200,   198,   198,   201,
     198,   202,   198,   198,   198,   198,   198,   198,   198,   203,
     198,   198,   198,   198,   198,   198,   204,   204,   204,   204,
     205,   205,   205,   205,   205,   205,   206,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   208,   207,   207,   207,   209,
     209,   209,   209,   209,   209,   209,   209,   209,   209,   209,
     209,   209,   210,   211,   211,   211,   211,   211,   212,   212,
     214,   213,   215,   215,   215,   216,   216,   217,   217,   218,
     218,   218,   218,   218,   218,   219,   219,   219,   219,   219,
     219,   220,   220,   221,   221,   222,   222,   223,   223,   224,
     224,   225,   225,   226,   226,   227,   227,   229,   228,   230,
     230,   231,   230,   232,   232,   232,   232,   233,   233,   233,
     233,   233,   234,   234,   234,   234,   235,   235
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     2,     1,     3,     5,     0,     6,     0,     6,
       1,     2,     3,     2,     1,     1,     1,     1,     0,     3,
       3,     0,     1,     0,     4,     4,     0,     6,     1,     0,
       1,     2,     1,     1,     1,     4,     4,     0,     0,     8,
       0,     1,     3,     0,     4,     2,     0,     0,     8,     0,
       1,     3,     0,     4,     0,    10,     0,     2,     0,     3,
       1,     1,     0,     3,     1,     1,     1,     1,     1,     1,
       1,     5,     3,     3,     3,     3,     5,     5,     0,     3,
       2,     2,     0,     3,     2,     0,     4,     1,     1,     1,
       1,     0,     5,     1,     0,     2,     3,     2,     0,     5,
       0,     5,     0,     1,     3,     1,     2,     0,     2,     2,
       1,     1,     0,     1,     2,     1,     1,     3,     1,     3,
       1,     1,     2,     2,     0,     4,     0,     6,     1,     0,
       6,     0,     4,     2,     2,     2,     2,     2,     2,     0,
       3,     2,     1,     1,     1,     0,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     4,     4,
       4,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     6,     6,
       6,     7,     4,     4,     6,     7,     4,     6,     4,     4,
       4,     4,     6,     7,     3,     0,     9,     1,     1,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     4,     1,     1,     3,     3,     3,     1,     1,
       0,     5,     0,     3,     1,     1,     2,     3,     1,     6,
       6,     4,     4,     4,     4,     1,     1,     1,     1,     1,
       1,     1,     1,     0,     1,     3,     1,     1,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     0,     2,     1,
       3,     0,     4,     1,     3,     2,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short int yydefact[] =
{
       0,    13,     0,     0,    47,    16,     0,    56,    33,     0,
       0,     2,     3,     8,     7,    11,     6,     5,     9,    10,
     267,    36,     0,     0,   160,   161,   162,   163,   164,   166,
       0,   165,     0,   122,    12,     1,     4,     0,     0,     0,
     259,   260,    72,     0,    14,    72,    18,   126,     0,    25,
      24,    27,   122,    20,    26,    28,   123,   125,    35,     0,
     277,   278,   279,   280,   281,   284,   282,   283,   285,   251,
     265,   273,   268,   269,   252,   266,    39,    70,    71,    77,
      76,    78,    79,    80,    75,     0,    74,     0,     0,     0,
       0,    23,    34,    21,    72,     0,     0,   124,   275,   276,
     271,     0,    44,     0,     0,     0,    38,    40,    42,    43,
      48,     0,     0,    15,    57,     0,     0,    22,   253,   274,
       0,   270,     0,     0,    37,    41,    50,    73,    17,    59,
     261,   262,   263,     0,   264,    30,    29,   265,    32,   254,
     256,   257,   272,     0,     0,    51,   117,    60,   117,     0,
     267,     0,    45,    46,    53,     0,   121,   120,     0,    49,
     117,   122,   115,    62,    58,     0,    19,     0,   255,     0,
     119,    52,    55,   116,   155,   118,     0,    61,   258,     0,
     141,     0,     0,     0,     0,     0,     0,   149,     0,     0,
     134,   136,   139,     0,     0,     0,     0,     0,    97,    98,
     223,   253,   138,   153,     0,   154,   103,     0,   130,     0,
     207,   208,   230,   152,   131,   224,     0,    54,     0,   143,
     147,   148,   145,     0,     0,     0,   253,   132,   133,     0,
       0,     0,   286,   287,     0,   144,   108,   146,   110,     0,
     151,   101,   127,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   229,   228,
       0,   267,     0,    63,     0,     0,   245,   246,   247,   248,
     249,   250,     0,     0,     0,     0,     0,     0,   150,     0,
       0,     0,     0,   112,   112,    64,   104,     0,   238,   232,
     209,   210,   211,   212,   215,   216,   217,   218,   214,   213,
     219,   220,   221,     0,   156,   157,   158,   159,     0,     0,
     253,     0,     0,     0,     0,   204,   265,   167,     0,   226,
     227,   225,   142,   241,   243,     0,   242,   244,     0,   201,
     128,   135,     0,     0,   200,     0,   113,     0,    88,     0,
       0,     0,     0,     0,   234,   235,   192,   193,   199,   198,
     222,   168,   169,   170,   196,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   267,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   267,     0,     0,
       0,     0,   109,   111,    68,   105,     0,    99,   100,   102,
       0,   237,     0,   236,     0,   231,     0,   267,     0,   267,
       0,   176,   179,   180,   184,   174,   181,   182,   183,   178,
       0,   172,   187,   171,   173,   175,   177,   185,   186,     0,
     239,   240,   202,     0,   129,   137,   140,   114,     0,     0,
       0,     0,     0,   107,   106,     0,   224,   233,   190,     0,
     194,     0,   197,   188,   189,   203,    90,    91,     0,     0,
       0,     0,    66,    89,   232,   191,   195,    69,     0,     0,
       0,     0,    92,     0,     0,    82,     0,    83,    85,     0,
      84,     0,     0,    67,   206,     0,     0,     0,    95,     0,
      65,     0,    81,    87,    86,     0,    94,    93,     0,    96
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short int yydefgoto[] =
{
      -1,    10,    11,    12,    13,    14,    23,    51,    90,    52,
      53,    95,    96,   136,    15,    33,    16,    17,    39,   105,
     106,   107,   108,   109,    18,    22,   126,   146,   158,   169,
     159,    19,    32,   129,   148,   165,   176,   203,   338,   462,
     431,    84,    85,    86,   452,   384,   432,   472,   481,   485,
     204,   389,   205,   286,   339,   390,   206,   283,   284,   335,
     160,   161,   162,    55,    56,    57,   175,   331,   207,   229,
     230,   231,   218,   226,   314,    30,    31,   208,   209,   210,
     211,   212,   262,   213,   244,   343,   344,   287,   214,   273,
      70,   138,   139,   140,    42,   132,   141,   134,    37,    38,
      72,   120,    73,    74,    75,   234
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -221
static const short int yypact[] =
{
     275,  -221,   -66,   -49,  -221,  -221,     2,  -221,  -221,    54,
      67,   275,  -221,  -221,  -221,  -221,  -221,  -221,  -221,  -221,
    -221,  -221,   -64,     2,  -221,  -221,  -221,  -221,  -221,  -221,
     -38,  -221,   -21,    64,  -221,  -221,  -221,    16,   385,   132,
    -221,  -221,   224,    55,    39,   224,  -221,  -221,   164,  -221,
    -221,  -221,   140,  -221,  -221,     3,    83,  -221,  -221,   450,
    -221,  -221,  -221,  -221,  -221,  -221,  -221,  -221,  -221,  -221,
    -221,   112,   -60,  -221,  -221,  -221,    22,  -221,  -221,  -221,
    -221,  -221,  -221,  -221,  -221,     4,  -221,    81,   176,    10,
      82,  -221,  -221,  -221,   224,   199,   114,  -221,  -221,   450,
    -221,   385,  -221,     2,   125,   202,    22,  -221,  -221,  -221,
    -221,   224,   176,  -221,  -221,   414,   -33,  -221,   414,  -221,
     385,  -221,   130,   131,  -221,  -221,   228,  -221,  -221,   230,
    -221,  -221,  -221,   123,  -221,  -221,  -221,   127,  -221,   167,
    -221,  -221,  -221,   240,   241,  -221,    13,  -221,    17,   145,
    -221,   414,  -221,  -221,  -221,   248,  -221,  -221,   250,  -221,
      62,    83,  -221,  -221,  -221,   251,  -221,   143,  -221,     2,
    -221,  -221,  -221,  -221,     8,  -221,     2,  -221,  -221,   168,
     103,   -51,   -51,   450,   450,   450,   473,  -221,   178,   184,
    -221,   194,  -221,    52,   450,   399,   179,    76,  -221,  -221,
    -221,   414,  -221,  -221,   296,  -221,  -221,   299,  -221,   186,
    -221,  -221,  -221,  -221,  -221,   429,   206,  -221,     2,  -221,
    -221,  -221,  -221,   133,   347,   235,   414,  -221,  -221,     2,
       2,     2,  -221,  -221,   193,  -221,  -221,  -221,  -221,   313,
    -221,  -221,  -221,   473,   200,   450,   450,   450,   450,   450,
     450,   450,   450,   450,   450,   450,   450,   450,  -221,  -221,
     165,  -221,   328,  -221,   238,   -51,  -221,  -221,  -221,  -221,
    -221,  -221,   -51,   450,   -51,   -51,   450,   450,  -221,   239,
     242,   243,   450,   450,   450,  -221,  -221,   -27,  -221,    33,
    -221,  -221,  -221,  -221,  -221,  -221,  -221,  -221,  -221,  -221,
    -221,  -221,  -221,   428,  -221,  -221,  -221,  -221,    52,   244,
     414,   450,   450,   450,   247,  -221,    53,   330,   211,  -221,
    -221,  -221,  -221,  -221,  -221,   333,  -221,  -221,   340,   -44,
    -221,   277,   236,   237,  -221,   -26,  -221,    -8,  -221,    30,
     473,   246,   473,    -6,  -221,  -221,     5,    72,  -221,  -221,
    -221,  -221,  -221,  -221,   282,   450,   450,   450,   450,   450,
     450,   450,   450,   450,  -221,   450,   450,   450,   450,   450,
     450,   450,   450,   249,   -51,   -51,   450,  -221,   256,   176,
     176,   450,  -221,  -221,     1,  -221,   450,  -221,  -221,  -221,
     353,  -221,   192,  -221,    33,  -221,   450,  -221,   450,  -221,
     259,  -221,  -221,  -221,  -221,  -221,  -221,  -221,  -221,  -221,
     253,  -221,  -221,  -221,  -221,  -221,  -221,  -221,  -221,   450,
    -221,  -221,  -221,   254,  -221,  -221,  -221,  -221,   450,   473,
     450,    68,   359,  -221,  -221,   255,    66,  -221,  -221,   257,
    -221,   258,  -221,  -221,  -221,  -221,  -221,  -221,   361,   450,
     450,   464,    83,  -221,    33,  -221,  -221,  -221,    27,   362,
      28,    29,  -221,   363,    50,  -221,   450,  -221,  -221,   450,
    -221,   450,    49,  -221,  -221,   372,   376,   377,  -221,   473,
    -221,   378,  -221,  -221,  -221,     2,  -221,  -221,   284,  -221
};

/* YYPGOTO[NTERM-NUM].  */
static const short int yypgoto[] =
{
    -221,  -221,  -221,   375,  -221,  -221,  -221,   213,  -221,  -221,
     336,  -221,  -221,  -220,  -221,  -221,     7,  -221,  -221,  -221,
    -221,   283,  -221,  -221,  -221,  -221,  -221,  -221,  -221,  -221,
     245,  -221,  -221,  -221,  -221,  -221,  -221,  -221,  -221,  -221,
    -221,   198,   -24,   279,  -221,  -221,  -221,  -221,  -221,  -221,
    -221,  -221,  -221,  -221,  -221,  -221,  -221,  -221,  -221,   107,
    -221,  -221,   252,   260,  -221,   -55,  -221,  -221,  -221,  -221,
    -221,  -221,  -221,  -221,  -221,   -23,    99,  -221,  -221,  -221,
    -221,    18,  -221,   149,  -221,   -43,    21,  -221,  -221,   196,
     -83,   215,  -221,   266,   160,  -177,   308,   -36,  -141,  -221,
    -221,  -221,   -59,   261,   -85,   126
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -225
static const short int yytable[] =
{
      43,    97,    71,   113,   220,   221,   278,   -31,   110,   167,
     428,   429,   100,   180,   114,   181,   182,   183,   154,   184,
     185,    89,   163,    98,   186,   187,   102,   128,   376,   188,
     189,   465,   468,   470,   385,   137,    40,   190,   191,   111,
      54,   192,   121,   342,    41,   340,   381,   103,   104,   130,
      20,    21,    24,    25,    26,    27,    28,   131,    34,    54,
     135,   142,    44,   119,   381,    71,   394,    35,   137,   101,
     116,   193,   377,   194,   195,   196,   111,   396,   478,    45,
     122,    94,   111,   197,    71,     2,   430,   198,   323,   199,
     350,   215,   341,   382,    46,   324,   386,   326,   327,   466,
     469,   471,    29,   225,    60,    61,    62,    63,   200,    64,
     387,   383,   388,   395,   479,   155,   201,    69,   137,   155,
     318,   397,   394,   156,   157,   480,  -205,   156,   157,    60,
      61,    62,    63,    58,    64,   172,    76,    65,    66,    67,
      68,   265,    69,   137,   398,   449,   179,   222,   223,   224,
     232,   450,   451,   216,    88,    87,   233,    47,   235,   237,
     288,     2,    77,    78,   155,   258,    48,   259,    91,   474,
      46,  -224,   156,   157,    49,    50,    47,   316,   258,   320,
     259,   303,   304,   305,   306,   307,    99,   115,   399,   266,
     267,   268,   269,   270,   271,   264,   112,   420,   421,    60,
      61,    62,    63,   117,    64,   272,   279,   280,   281,   290,
     291,   292,   293,   294,   295,   296,   297,   298,   299,   300,
     301,   302,   118,   410,   317,   123,   124,   137,   308,   309,
     143,   144,   145,    47,   147,    92,   423,   325,   149,   151,
     328,   329,    48,   150,   152,   153,   334,   336,   336,   166,
      49,    50,   170,   345,   171,   177,   439,   391,   441,   393,
     178,    60,    61,    62,    63,   200,    64,   347,   217,    65,
      66,    67,    68,   310,    69,   351,   352,   353,   227,     1,
      65,    66,    67,    68,   228,   311,   312,   313,    60,    61,
      62,    63,   200,    64,   425,   426,     2,   238,     3,   -18,
     241,    69,     4,   242,   243,     5,   263,   277,   282,   436,
      77,    78,    79,    80,    81,    82,    83,   285,   289,   401,
     402,   403,   404,   405,   406,   407,   408,   409,   373,   411,
     412,   413,   414,   415,   416,   417,   418,     6,   322,   330,
     422,   374,   332,   333,   349,   427,   447,   354,   375,   378,
     433,   379,   380,     7,   400,   274,   424,   434,   345,   442,
     438,   392,   440,   453,   419,   457,   467,   473,   461,     8,
     443,   445,   355,   454,   455,   456,   482,     9,   356,   357,
     483,   484,   487,   444,   489,   358,    36,   202,    93,   125,
     127,   337,   446,   164,   448,   239,   486,   463,   359,   360,
     361,   362,   346,   266,   267,   268,   269,   270,   271,   315,
     435,   464,   173,   458,   459,   437,   240,   168,   345,   275,
     276,   174,   321,   133,    60,    61,    62,    63,    40,    64,
     475,     0,   319,   476,   348,   477,    41,    69,     0,     0,
       0,   219,     0,   363,     0,     0,   364,     0,     0,     0,
       0,   365,   366,   367,   368,   369,   370,   371,   372,    59,
       0,     0,   488,   245,   246,   247,   248,   249,   250,   251,
     252,     0,   253,   254,   255,   256,   257,     0,     0,     0,
       0,    60,    61,    62,    63,     0,    64,     0,     0,    65,
      66,    67,    68,     0,    69,    60,    61,    62,    63,     0,
      64,     0,     0,    65,    66,    67,    68,     0,    69,     0,
      60,    61,    62,    63,   130,    64,     0,   236,    65,    66,
      67,    68,   131,    69,    60,    61,    62,    63,    29,    64,
       0,     0,    65,    66,    67,    68,     0,    69,     0,     0,
       0,   258,     0,   259,   260,   261,    60,    61,    62,    63,
       0,    64,     0,     0,    65,    66,    67,    68,     0,    69,
      60,    61,    62,    63,     0,    64,     0,     0,   460,    60,
      61,    62,    63,    69,    64,     0,     0,     0,     0,     0,
       0,     0,    69
};

static const short int yycheck[] =
{
      23,    56,    38,    88,   181,   182,   226,     4,     4,   150,
       9,    10,    72,     5,     4,     7,     8,     9,     5,    11,
      12,    45,     5,    59,    16,    17,     4,   112,    72,    21,
      22,     4,     4,     4,     4,   118,   100,    29,    30,    72,
      33,    33,   101,    10,   108,    72,    72,    25,    26,   100,
     116,   100,    50,    51,    52,    53,    54,   108,     4,    52,
      93,   120,   100,    99,    72,   101,    72,     0,   151,   129,
      94,    63,   116,    65,    66,    67,    72,    72,    29,   100,
     103,    78,    72,    75,   120,    21,    85,    79,   265,    81,
     310,   174,   119,   119,    30,   272,    66,   274,   275,    72,
      72,    72,   100,   186,    96,    97,    98,    99,   100,   101,
      80,   119,    82,   119,    65,   102,   108,   109,   201,   102,
     261,   116,    72,   110,   111,    76,   118,   110,   111,    96,
      97,    98,    99,   117,   101,    73,     4,   104,   105,   106,
     107,     8,   109,   226,    72,    77,   169,   183,   184,   185,
      98,    83,    84,   176,   115,   100,   104,    93,   194,   195,
     243,    21,    86,    87,   102,   112,   102,   114,     4,   119,
      30,   118,   110,   111,   110,   111,    93,   260,   112,   262,
     114,    16,    17,    18,    19,    20,    74,   105,   116,    56,
      57,    58,    59,    60,    61,   218,   115,   374,   375,    96,
      97,    98,    99,     4,   101,    72,   229,   230,   231,   245,
     246,   247,   248,   249,   250,   251,   252,   253,   254,   255,
     256,   257,   108,   364,   260,   100,    24,   310,    63,    64,
     100,   100,     4,    93,     4,    95,   377,   273,   115,    72,
     276,   277,   102,   116,     4,     4,   282,   283,   284,   104,
     110,   111,     4,   289,     4,     4,   397,   340,   399,   342,
     117,    96,    97,    98,    99,   100,   101,   303,   100,   104,
     105,   106,   107,   108,   109,   311,   312,   313,   100,     4,
     104,   105,   106,   107,   100,   120,   121,   122,    96,    97,
      98,    99,   100,   101,   379,   380,    21,   118,    23,   105,
       4,   109,    27,     4,   118,    30,   100,    72,   115,   392,
      86,    87,    88,    89,    90,    91,    92,     4,   118,   355,
     356,   357,   358,   359,   360,   361,   362,   363,   117,   365,
     366,   367,   368,   369,   370,   371,   372,    62,   100,   100,
     376,     8,   100,   100,   100,   381,   429,   100,     8,    72,
     386,   115,   115,    78,    72,     8,   100,     4,   394,   100,
     396,   115,   398,     4,   115,     4,     4,     4,   451,    94,
     117,   117,    42,   118,   117,   117,     4,   102,    48,    49,
       4,     4,     4,   419,   100,    55,    11,   174,    52,   106,
     111,   284,   428,   148,   430,   197,   479,   452,    68,    69,
      70,    71,   303,    56,    57,    58,    59,    60,    61,   260,
     392,   454,   160,   449,   450,   394,   201,   151,   454,    72,
     224,   161,   262,   115,    96,    97,    98,    99,   100,   101,
     466,    -1,   104,   469,   308,   471,   108,   109,    -1,    -1,
      -1,   180,    -1,   113,    -1,    -1,   116,    -1,    -1,    -1,
      -1,   121,   122,   123,   124,   125,   126,   127,   128,    74,
      -1,    -1,   485,    34,    35,    36,    37,    38,    39,    40,
      41,    -1,    43,    44,    45,    46,    47,    -1,    -1,    -1,
      -1,    96,    97,    98,    99,    -1,   101,    -1,    -1,   104,
     105,   106,   107,    -1,   109,    96,    97,    98,    99,    -1,
     101,    -1,    -1,   104,   105,   106,   107,    -1,   109,    -1,
      96,    97,    98,    99,   100,   101,    -1,   118,   104,   105,
     106,   107,   108,   109,    96,    97,    98,    99,   100,   101,
      -1,    -1,   104,   105,   106,   107,    -1,   109,    -1,    -1,
      -1,   112,    -1,   114,   115,   116,    96,    97,    98,    99,
      -1,   101,    -1,    -1,   104,   105,   106,   107,    -1,   109,
      96,    97,    98,    99,    -1,   101,    -1,    -1,   104,    96,
      97,    98,    99,   109,   101,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    21,    23,    27,    30,    62,    78,    94,   102,
     131,   132,   133,   134,   135,   144,   146,   147,   154,   161,
     116,   100,   155,   136,    50,    51,    52,    53,    54,   100,
     205,   206,   162,   145,     4,     0,   133,   228,   229,   148,
     100,   108,   224,   205,   100,   100,    30,    93,   102,   110,
     111,   137,   139,   140,   146,   193,   194,   195,   117,    74,
      96,    97,    98,    99,   101,   104,   105,   106,   107,   109,
     220,   227,   230,   232,   233,   234,     4,    86,    87,    88,
      89,    90,    91,    92,   171,   172,   173,   100,   115,   172,
     138,     4,    95,   140,    78,   141,   142,   195,   227,    74,
      72,   129,     4,    25,    26,   149,   150,   151,   152,   153,
       4,    72,   115,   234,     4,   105,   172,     4,   108,   227,
     231,   232,   205,   100,    24,   151,   156,   173,   234,   163,
     100,   108,   225,   226,   227,    93,   143,   220,   221,   222,
     223,   226,   232,   100,   100,     4,   157,     4,   164,   115,
     116,    72,     4,     4,     5,   102,   110,   111,   158,   160,
     190,   191,   192,     5,   160,   165,   104,   228,   223,   159,
       4,     4,    73,   192,   193,   196,   166,     4,   117,   205,
       5,     7,     8,     9,    11,    12,    16,    17,    21,    22,
      29,    30,    33,    63,    65,    66,    67,    75,    79,    81,
     100,   108,   137,   167,   180,   182,   186,   198,   207,   208,
     209,   210,   211,   213,   218,   220,   205,   100,   202,   233,
     225,   225,   227,   227,   227,   220,   203,   100,   100,   199,
     200,   201,    98,   104,   235,   227,   118,   227,   118,   171,
     221,     4,     4,   118,   214,    34,    35,    36,    37,    38,
      39,    40,    41,    43,    44,    45,    46,    47,   112,   114,
     115,   116,   212,   100,   205,     8,    56,    57,    58,    59,
      60,    61,    72,   219,     8,    72,   219,    72,   143,   205,
     205,   205,   115,   187,   188,     4,   183,   217,   220,   118,
     227,   227,   227,   227,   227,   227,   227,   227,   227,   227,
     227,   227,   227,    16,    17,    18,    19,    20,    63,    64,
     108,   120,   121,   122,   204,   213,   220,   227,   228,   104,
     220,   224,   100,   225,   225,   227,   225,   225,   227,   227,
     100,   197,   100,   100,   227,   189,   227,   189,   168,   184,
      72,   119,    10,   215,   216,   227,   206,   227,   235,   100,
     143,   227,   227,   227,   100,    42,    48,    49,    55,    68,
      69,    70,    71,   113,   116,   121,   122,   123,   124,   125,
     126,   127,   128,   117,     8,     8,    72,   116,    72,   115,
     115,    72,   119,   119,   175,     4,    66,    80,    82,   181,
     185,   220,   115,   220,    72,   119,    72,   116,    72,   116,
      72,   227,   227,   227,   227,   227,   227,   227,   227,   227,
     228,   227,   227,   227,   227,   227,   227,   227,   227,   115,
     225,   225,   227,   228,   100,   234,   234,   227,     9,    10,
      85,   170,   176,   227,     4,   211,   220,   216,   227,   228,
     227,   228,   100,   117,   227,   117,   227,   220,   227,    77,
      83,    84,   174,     4,   118,   117,   117,     4,   227,   227,
     104,   220,   169,   195,   215,     4,    72,     4,     4,    72,
       4,    72,   177,     4,   119,   227,   227,   227,    29,    65,
      76,   178,     4,     4,     4,   179,   220,     4,   205,   100
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
#line 387 "imcc/imcc.y"
    { yyval.i = 0; ;}
    break;

  case 5:
#line 396 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; ;}
    break;

  case 6:
#line 397 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; ;}
    break;

  case 7:
#line 398 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; ;}
    break;

  case 8:
#line 399 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; ;}
    break;

  case 9:
#line 400 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; ;}
    break;

  case 10:
#line 401 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; ;}
    break;

  case 11:
#line 402 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; ;}
    break;

  case 12:
#line 403 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; ;}
    break;

  case 13:
#line 404 "imcc/imcc.y"
    { yyval.i = 0; ;}
    break;

  case 14:
#line 409 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         ;}
    break;

  case 15:
#line 414 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         ;}
    break;

  case 16:
#line 421 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 17:
#line 422 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; ;}
    break;

  case 18:
#line 426 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 19:
#line 427 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; ;}
    break;

  case 22:
#line 435 "imcc/imcc.y"
    { yyval.i = 0; ;}
    break;

  case 23:
#line 436 "imcc/imcc.y"
    { yyval.i = 0; ;}
    break;

  case 24:
#line 437 "imcc/imcc.y"
    { yyval.i = 0; ;}
    break;

  case 25:
#line 438 "imcc/imcc.y"
    { yyval.i = 0; ;}
    break;

  case 26:
#line 439 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; ;}
    break;

  case 28:
#line 443 "imcc/imcc.y"
    { clear_state(); ;}
    break;

  case 29:
#line 445 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); ;}
    break;

  case 30:
#line 448 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, cur_unit);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   ;}
    break;

  case 31:
#line 454 "imcc/imcc.y"
    { yyval.i = 0;;}
    break;

  case 33:
#line 462 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; ;}
    break;

  case 34:
#line 465 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; ;}
    break;

  case 35:
#line 475 "imcc/imcc.y"
    {
                    int re_open = 0;
                    yyval.i=0;
                    if (pasm_file && cur_namespace) {
                        imc_close_unit(interp, cur_unit);
                        re_open = 1;
                    }
                    IMCC_INFO(interp)->cur_namespace = yyvsp[-1].sr;
                    cur_namespace = yyvsp[-1].sr;
                    if (re_open)
                        cur_unit = imc_open_unit(interp, IMC_PASM);
                ;}
    break;

  case 36:
#line 491 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); ;}
    break;

  case 37:
#line 498 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; ;}
    break;

  case 39:
#line 507 "imcc/imcc.y"
    { yyval.i = 0; ;}
    break;

  case 44:
#line 518 "imcc/imcc.y"
    { yyval.i = 0; ;}
    break;

  case 45:
#line 523 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[-1].s);
                      if(lookup_field_symbol(current_class, yyvsp[-1].s)) {
                         fataly(EX_SOFTWARE, sourcefile, line,
                            "field '%s' previously declared in class '%s'\n",
                            yyvsp[-1].s, current_class->sym->name);
                      }
                      sym->type = yyvsp[-2].t;
                      store_field_symbol(current_class, sym);
                      yyval.i = 0; ;}
    break;

  case 46:
#line 537 "imcc/imcc.y"
    {
           Method * meth;
           Symbol * sym = new_symbol(yyvsp[-2].s);
           if(lookup_method_symbol(current_class, yyvsp[-2].s)) {
              fataly(EX_SOFTWARE, sourcefile, line,
                 "method '%s' previously declared in class '%s'\n",
                    yyvsp[-2].s, current_class->sym->name);
           }
           meth = new_method(sym, new_symbol(yyvsp[-1].s));
           store_method_symbol(current_class, sym);
           yyval.i = 0;
        ;}
    break;

  case 47:
#line 553 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        ;}
    break;

  case 48:
#line 558 "imcc/imcc.y"
    {
          Instruction *i = iSUBROUTINE(cur_unit, yyvsp[-2].sr);
          i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
          add_namespace(interp, cur_unit);
          i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
        ;}
    break;

  case 49:
#line 565 "imcc/imcc.y"
    { yyval.i = 0; ;}
    break;

  case 50:
#line 569 "imcc/imcc.y"
    { yyval.sr = 0; ;}
    break;

  case 51:
#line 570 "imcc/imcc.y"
    { yyval.sr = 0; ;}
    break;

  case 52:
#line 571 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);;}
    break;

  case 53:
#line 575 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 54:
#line 576 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; ;}
    break;

  case 55:
#line 580 "imcc/imcc.y"
    { yyval.i = 0; ;}
    break;

  case 56:
#line 584 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); ;}
    break;

  case 57:
#line 586 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
            add_namespace(interp, cur_unit);
            i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
         ;}
    break;

  case 58:
#line 593 "imcc/imcc.y"
    { yyval.i = 0; ;}
    break;

  case 59:
#line 597 "imcc/imcc.y"
    { yyval.sr = 0; ;}
    break;

  case 60:
#line 598 "imcc/imcc.y"
    { yyval.sr = 0; ;}
    break;

  case 61:
#line 599 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);;}
    break;

  case 62:
#line 603 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 63:
#line 604 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; ;}
    break;

  case 64:
#line 609 "imcc/imcc.y"
    {
            char name[128];
            SymReg * r, *r1;
            Instruction *i;

            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            r->pcc_sub->pragma = yyvsp[-1].t;
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
         ;}
    break;

  case 65:
#line 636 "imcc/imcc.y"
    { yyval.i = 0; current_call = NULL; ;}
    break;

  case 66:
#line 640 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 0; ;}
    break;

  case 67:
#line 641 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 1; ;}
    break;

  case 68:
#line 645 "imcc/imcc.y"
    { yyval.i = NULL; ;}
    break;

  case 69:
#line 647 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->object = yyvsp[-1].sr; ;}
    break;

  case 70:
#line 650 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; ;}
    break;

  case 71:
#line 651 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; ;}
    break;

  case 72:
#line 655 "imcc/imcc.y"
    {  yyval.t = P_NONE; ;}
    break;

  case 73:
#line 656 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; ;}
    break;

  case 74:
#line 657 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; ;}
    break;

  case 76:
#line 661 "imcc/imcc.y"
    {  yyval.t = P_LOAD; ;}
    break;

  case 77:
#line 662 "imcc/imcc.y"
    {  yyval.t = P_MAIN; ;}
    break;

  case 78:
#line 663 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; ;}
    break;

  case 79:
#line 664 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; ;}
    break;

  case 80:
#line 665 "imcc/imcc.y"
    {  yyval.t = P_METHOD | P_NONE ; ;}
    break;

  case 81:
#line 670 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         ;}
    break;

  case 82:
#line 675 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); ;}
    break;

  case 83:
#line 677 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-1].sr);
            current_call->r[0]->pcc_sub->nci = 1;
         ;}
    break;

  case 84:
#line 682 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); ;}
    break;

  case 85:
#line 684 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-1].s,'S')); ;}
    break;

  case 86:
#line 686 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         ;}
    break;

  case 87:
#line 690 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-3].s,'S'));
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         ;}
    break;

  case 88:
#line 696 "imcc/imcc.y"
    {  yyval.sr = 0; ;}
    break;

  case 89:
#line 697 "imcc/imcc.y"
    {  add_pcc_arg(current_call->r[0], yyvsp[-1].sr);;}
    break;

  case 90:
#line 701 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; ;}
    break;

  case 91:
#line 702 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; ;}
    break;

  case 92:
#line 706 "imcc/imcc.y"
    {  yyval.sr = 0; ;}
    break;

  case 93:
#line 707 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(current_call->r[0], yyvsp[-1].sr); ;}
    break;

  case 94:
#line 712 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; ;}
    break;

  case 95:
#line 713 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 96:
#line 714 "imcc/imcc.y"
    {  mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; ;}
    break;

  case 97:
#line 717 "imcc/imcc.y"
    { yyval.t = 0 ;}
    break;

  case 98:
#line 717 "imcc/imcc.y"
    { yyval.t = 1 ;}
    break;

  case 101:
#line 722 "imcc/imcc.y"
    { begin_return_or_yield(yyvsp[-1].t); ;}
    break;

  case 102:
#line 725 "imcc/imcc.y"
    { yyval.i = 0;  asm_state = AsmDefault; ;}
    break;

  case 103:
#line 726 "imcc/imcc.y"
    { asm_state = AsmDefault; yyval.i = 0;  ;}
    break;

  case 104:
#line 732 "imcc/imcc.y"
    {  yyval.sr = 0; ;}
    break;

  case 105:
#line 734 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(sr_return, yyvsp[-1].sr); ;}
    break;

  case 106:
#line 736 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(sr_return, yyvsp[-1].sr); ;}
    break;

  case 107:
#line 740 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; ;}
    break;

  case 108:
#line 744 "imcc/imcc.y"
    {  if(asm_state == AsmDefault)   begin_return_or_yield(0); ;}
    break;

  case 109:
#line 744 "imcc/imcc.y"
    { asm_state = AsmDefault; yyval.t = 0;  ;}
    break;

  case 110:
#line 745 "imcc/imcc.y"
    {  if(asm_state == AsmDefault)   begin_return_or_yield(1); ;}
    break;

  case 111:
#line 745 "imcc/imcc.y"
    { asm_state = AsmDefault; yyval.t = 0;  ;}
    break;

  case 112:
#line 749 "imcc/imcc.y"
    { yyval.i = 0; ;}
    break;

  case 113:
#line 750 "imcc/imcc.y"
    {  add_pcc_return(sr_return, yyvsp[0].sr);    ;}
    break;

  case 114:
#line 751 "imcc/imcc.y"
    {  add_pcc_return(sr_return, yyvsp[0].sr);    ;}
    break;

  case 117:
#line 769 "imcc/imcc.y"
    { clear_state(); ;}
    break;

  case 118:
#line 774 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; ;}
    break;

  case 119:
#line 775 "imcc/imcc.y"
    {  yyval.i = 0; ;}
    break;

  case 120:
#line 776 "imcc/imcc.y"
    {  yyval.i = 0; ;}
    break;

  case 121:
#line 777 "imcc/imcc.y"
    {  yyval.i = 0; ;}
    break;

  case 122:
#line 781 "imcc/imcc.y"
    {  yyval.i = NULL; ;}
    break;

  case 126:
#line 791 "imcc/imcc.y"
    {
                     /* $$ = iLABEL(cur_unit, mk_address($1, U_add_uniq_label)); */
                     yyval.i = iLABEL(cur_unit, mk_local_label(cur_unit, yyvsp[0].s));
                   ;}
    break;

  case 127:
#line 799 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; ;}
    break;

  case 128:
#line 803 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         ;}
    break;

  case 129:
#line 811 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        ;}
    break;

  case 132:
#line 821 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); ;}
    break;

  case 133:
#line 822 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); ;}
    break;

  case 134:
#line 823 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 135:
#line 824 "imcc/imcc.y"
    {
        IdList* l = yyvsp[0].idlist;
         while(l) {
             IdList* l1;
             mk_ident(l->id, yyvsp[-1].t);
             l1 = l;
             l = l->next;
             free(l1);
     }
    is_def=0; yyval.i=0;

   ;}
    break;

  case 136:
#line 836 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 137:
#line 837 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; ;}
    break;

  case 139:
#line 839 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 140:
#line 840 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; ;}
    break;

  case 141:
#line 841 "imcc/imcc.y"
    { is_def=1; ;}
    break;

  case 142:
#line 841 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; ;}
    break;

  case 143:
#line 843 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); ;}
    break;

  case 144:
#line 844 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); ;}
    break;

  case 145:
#line 845 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); ;}
    break;

  case 146:
#line 846 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); ;}
    break;

  case 147:
#line 847 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); ;}
    break;

  case 148:
#line 848 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); ;}
    break;

  case 149:
#line 849 "imcc/imcc.y"
    { expect_pasm = 1; ;}
    break;

  case 150:
#line 851 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); ;}
    break;

  case 151:
#line 853 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); ;}
    break;

  case 152:
#line 855 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; ;}
    break;

  case 153:
#line 856 "imcc/imcc.y"
    {  yyval.i = 0; ;}
    break;

  case 155:
#line 858 "imcc/imcc.y"
    { yyval.i = 0;;}
    break;

  case 156:
#line 862 "imcc/imcc.y"
    { yyval.t = NEWSUB; ;}
    break;

  case 157:
#line 863 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; ;}
    break;

  case 158:
#line 864 "imcc/imcc.y"
    { yyval.t = NEWCOR; ;}
    break;

  case 159:
#line 865 "imcc/imcc.y"
    { yyval.t = NEWCONT; ;}
    break;

  case 160:
#line 869 "imcc/imcc.y"
    { yyval.t = 'I'; ;}
    break;

  case 161:
#line 870 "imcc/imcc.y"
    { yyval.t = 'N'; ;}
    break;

  case 162:
#line 871 "imcc/imcc.y"
    { yyval.t = 'S'; ;}
    break;

  case 163:
#line 872 "imcc/imcc.y"
    { yyval.t = 'P'; ;}
    break;

  case 164:
#line 873 "imcc/imcc.y"
    { yyval.t = 'P'; ;}
    break;

  case 165:
#line 874 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); ;}
    break;

  case 166:
#line 879 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         ;}
    break;

  case 167:
#line 888 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 168:
#line 889 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);;}
    break;

  case 169:
#line 890 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);;}
    break;

  case 170:
#line 891 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);;}
    break;

  case 171:
#line 892 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 172:
#line 893 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 173:
#line 894 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 174:
#line 895 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 175:
#line 896 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 176:
#line 897 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 177:
#line 898 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 178:
#line 899 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); ;}
    break;

  case 179:
#line 901 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 180:
#line 903 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 181:
#line 905 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 182:
#line 907 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 183:
#line 909 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 184:
#line 911 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 185:
#line 913 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 186:
#line 915 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 187:
#line 917 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 188:
#line 919 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); ;}
    break;

  case 189:
#line 921 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); ;}
    break;

  case 190:
#line 923 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); ;}
    break;

  case 191:
#line 925 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); ;}
    break;

  case 192:
#line 927 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); ;}
    break;

  case 193:
#line 929 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); ;}
    break;

  case 194:
#line 931 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 195:
#line 933 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); ;}
    break;

  case 196:
#line 935 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                          mk_sub_address(yyvsp[0].s), NULL, 1); ;}
    break;

  case 197:
#line 938 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use $1 instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(yyvsp[-2].s),
                                           mk_sub_address(yyvsp[0].s), 1); ;}
    break;

  case 198:
#line 945 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                    2, yyvsp[-3].sr, mk_label_address(cur_unit, yyvsp[0].s)); ;}
    break;

  case 199:
#line 948 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);;}
    break;

  case 200:
#line 950 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); ;}
    break;

  case 201:
#line 954 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 202:
#line 956 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 203:
#line 958 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); ;}
    break;

  case 204:
#line 961 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         ;}
    break;

  case 205:
#line 967 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         ;}
    break;

  case 206:
#line 971 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           current_call = NULL;
         ;}
    break;

  case 209:
#line 981 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 210:
#line 983 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 211:
#line 985 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 212:
#line 987 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 213:
#line 989 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 214:
#line 991 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 215:
#line 993 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 216:
#line 995 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 217:
#line 997 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 218:
#line 999 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 219:
#line 1001 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 220:
#line 1003 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 221:
#line 1005 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 222:
#line 1010 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   ;}
    break;

  case 223:
#line 1016 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); ;}
    break;

  case 224:
#line 1017 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                          fataly(1, sourcefile, line, "Sub isn't a PMC");
                     ;}
    break;

  case 225:
#line 1021 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; ;}
    break;

  case 226:
#line 1022 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(yyvsp[0].s, 'S'); ;}
    break;

  case 227:
#line 1023 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; ;}
    break;

  case 228:
#line 1026 "imcc/imcc.y"
    { yyval.t=0; ;}
    break;

  case 229:
#line 1027 "imcc/imcc.y"
    { yyval.t=0; ;}
    break;

  case 230:
#line 1032 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        ;}
    break;

  case 231:
#line 1037 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; ;}
    break;

  case 232:
#line 1041 "imcc/imcc.y"
    {  yyval.symlist = 0; ;}
    break;

  case 233:
#line 1042 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); ;}
    break;

  case 234:
#line 1043 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); ;}
    break;

  case 235:
#line 1048 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; ;}
    break;

  case 236:
#line 1050 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; ;}
    break;

  case 237:
#line 1054 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); ;}
    break;

  case 238:
#line 1055 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); ;}
    break;

  case 239:
#line 1060 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 240:
#line 1062 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 241:
#line 1064 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 242:
#line 1066 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 243:
#line 1068 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 244:
#line 1070 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 245:
#line 1074 "imcc/imcc.y"
    {  yyval.s = "eq"; ;}
    break;

  case 246:
#line 1075 "imcc/imcc.y"
    {  yyval.s = "ne"; ;}
    break;

  case 247:
#line 1076 "imcc/imcc.y"
    {  yyval.s = "gt"; ;}
    break;

  case 248:
#line 1077 "imcc/imcc.y"
    {  yyval.s = "ge"; ;}
    break;

  case 249:
#line 1078 "imcc/imcc.y"
    {  yyval.s = "lt"; ;}
    break;

  case 250:
#line 1079 "imcc/imcc.y"
    {  yyval.s = "le"; ;}
    break;

  case 253:
#line 1088 "imcc/imcc.y"
    {  yyval.sr = NULL; ;}
    break;

  case 254:
#line 1089 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; ;}
    break;

  case 255:
#line 1093 "imcc/imcc.y"
    { yyval.sr = regs[0]; ;}
    break;

  case 257:
#line 1098 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; ;}
    break;

  case 258:
#line 1100 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   ;}
    break;

  case 259:
#line 1108 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); ;}
    break;

  case 260:
#line 1109 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); ;}
    break;

  case 261:
#line 1113 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); ;}
    break;

  case 262:
#line 1114 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); ;}
    break;

  case 267:
#line 1127 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; ;}
    break;

  case 268:
#line 1128 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); ;}
    break;

  case 269:
#line 1132 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; ;}
    break;

  case 270:
#line 1134 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; ;}
    break;

  case 271:
#line 1135 "imcc/imcc.y"
    { in_slice = 1; ;}
    break;

  case 272:
#line 1136 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; ;}
    break;

  case 273:
#line 1140 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   ;}
    break;

  case 274:
#line 1146 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; ;}
    break;

  case 275:
#line 1148 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; ;}
    break;

  case 276:
#line 1149 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; ;}
    break;

  case 277:
#line 1153 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); ;}
    break;

  case 278:
#line 1154 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); ;}
    break;

  case 279:
#line 1155 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); ;}
    break;

  case 280:
#line 1156 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); ;}
    break;

  case 281:
#line 1157 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); ;}
    break;

  case 282:
#line 1161 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); ;}
    break;

  case 283:
#line 1162 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); ;}
    break;

  case 284:
#line 1163 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); ;}
    break;

  case 285:
#line 1164 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'U'); ;}
    break;

  case 286:
#line 1168 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); ;}
    break;

  case 287:
#line 1169 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); ;}
    break;


    }

/* Line 1010 of yacc.c.  */
#line 3480 "imcc/imcparser.c"

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


#line 1174 "imcc/imcc.y"



int yyerror(char * s)
{
    /* fprintf(stderr, "last token = [%s]\n", yylval.s); */
    fataly(EX_UNAVAILABLE, sourcefile, line, "%s\n", s);
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

