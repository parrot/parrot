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
     ANON = 347,
     LABEL = 348,
     EMIT = 349,
     EOM = 350,
     IREG = 351,
     NREG = 352,
     SREG = 353,
     PREG = 354,
     IDENTIFIER = 355,
     REG = 356,
     MACRO = 357,
     ENDM = 358,
     STRINGC = 359,
     INTC = 360,
     FLOATC = 361,
     USTRINGC = 362,
     PARROT_OP = 363,
     VAR = 364,
     LINECOMMENT = 365,
     FILECOMMENT = 366,
     DOT = 367,
     CONCAT = 368,
     POINTY = 369
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
#define ANON 347
#define LABEL 348
#define EMIT 349
#define EOM 350
#define IREG 351
#define NREG 352
#define SREG 353
#define PREG 354
#define IDENTIFIER 355
#define REG 356
#define MACRO 357
#define ENDM 358
#define STRINGC 359
#define INTC 360
#define FLOATC 361
#define USTRINGC 362
#define PARROT_OP 363
#define VAR 364
#define LINECOMMENT 365
#define FILECOMMENT 366
#define DOT 367
#define CONCAT 368
#define POINTY 369




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
 * substr or X = Pkey
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
 * substr or Pkey = X
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


static SymReg *
mk_sub_address_fromc(char * name)
{
    /* name is a quoted sub name */
    SymReg *r;

    name[strlen(name) - 1] = '\0';
    r = mk_sub_address(str_dup(name + 1));
    mem_sys_free(name);
    return r;
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

#ifndef YYSTYPE
#line 319 "imcc/imcc.y"
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
#line 630 "imcc/imcparser.c"
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
#line 651 "imcc/imcparser.c"

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
#define YYLAST   591

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  131
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  108
/* YYNRULES -- Number of rules. */
#define YYNRULES  294
/* YYNRULES -- Number of states. */
#define YYNSTATES  497

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   369

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   121,     2,     2,     2,   127,   128,     2,
     119,   120,   125,   124,     2,   122,     2,   126,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   130,
       2,   116,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   117,     2,   118,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   129,     2,   123,     2,     2,     2,
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
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115
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
     254,   260,   266,   267,   271,   274,   277,   278,   282,   285,
     286,   291,   293,   295,   297,   299,   300,   306,   308,   309,
     312,   316,   319,   320,   326,   327,   333,   334,   336,   340,
     342,   345,   346,   349,   352,   354,   356,   357,   359,   362,
     364,   366,   370,   372,   376,   378,   380,   383,   386,   387,
     392,   393,   400,   402,   403,   410,   411,   416,   419,   422,
     425,   428,   431,   434,   435,   439,   442,   444,   446,   448,
     449,   451,   453,   455,   457,   459,   461,   463,   465,   467,
     469,   471,   475,   480,   485,   490,   496,   502,   508,   514,
     520,   526,   532,   538,   544,   550,   556,   562,   568,   574,
     580,   586,   592,   599,   606,   613,   621,   626,   631,   638,
     646,   651,   658,   663,   668,   673,   678,   685,   693,   697,
     698,   708,   710,   712,   716,   720,   724,   728,   732,   736,
     740,   744,   748,   752,   756,   760,   764,   769,   771,   773,
     775,   779,   783,   787,   789,   791,   792,   798,   799,   803,
     805,   807,   810,   814,   816,   823,   830,   835,   840,   845,
     850,   852,   854,   856,   858,   860,   862,   864,   866,   867,
     869,   873,   875,   877,   882,   884,   886,   888,   890,   892,
     894,   896,   898,   900,   902,   903,   906,   908,   912,   913,
     918,   920,   924,   927,   930,   932,   934,   936,   938,   940,
     942,   944,   946,   948,   950
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     132,     0,    -1,   133,    -1,   134,    -1,   133,   134,    -1,
     149,    -1,   148,    -1,   136,    -1,   135,    -1,   156,    -1,
     163,    -1,   145,    -1,   103,     4,    -1,     4,    -1,    62,
     207,   101,    -1,    62,   207,   101,   116,   237,    -1,    -1,
      30,   137,   207,   101,   116,   237,    -1,    -1,    30,   139,
     106,   229,   116,   105,    -1,   141,    -1,   140,   141,    -1,
     195,   142,     4,    -1,   103,     4,    -1,   112,    -1,   111,
      -1,   148,    -1,   138,    -1,    -1,   143,   109,   144,    -1,
      78,   174,    94,    -1,    -1,   223,    -1,    -1,    95,   146,
     147,    96,    -1,    -1,   140,    -1,    21,   117,   231,   118,
      -1,    -1,    23,   101,   150,     4,   151,    24,    -1,   152,
      -1,    -1,   153,    -1,   152,   153,    -1,   154,    -1,   155,
      -1,     4,    -1,    25,   207,   101,     4,    -1,    26,   101,
     101,     4,    -1,    -1,    -1,    27,   157,   226,   174,     4,
     158,   159,   162,    73,    -1,    -1,     4,    -1,   159,   160,
       4,    -1,    -1,     5,   161,   207,   101,    -1,    -1,   192,
      -1,    -1,    -1,    78,   164,   101,   174,     4,   165,   166,
     162,    73,    -1,    -1,     4,    -1,   166,   167,     4,    -1,
      -1,     5,   168,   207,   101,    -1,    -1,    75,   173,     4,
     170,   177,   172,   176,   171,   179,    76,    -1,    -1,   197,
       4,    -1,    -1,    85,   230,     4,    -1,    86,    -1,    87,
      -1,    -1,   174,    72,   175,    -1,   175,    -1,   173,    -1,
      89,    -1,    88,    -1,    90,    -1,    91,    -1,    93,    -1,
      92,    -1,    77,   230,    72,   230,     4,    -1,    77,   230,
       4,    -1,    83,   230,     4,    -1,    84,   222,     4,    -1,
      84,   105,     4,    -1,    84,   222,    72,   230,     4,    -1,
      84,   105,    72,   230,     4,    -1,    -1,   177,   178,     4,
      -1,     9,   230,    -1,    10,   222,    -1,    -1,   179,   180,
       4,    -1,    65,   222,    -1,    -1,    29,   181,   207,   101,
      -1,    79,    -1,    81,    -1,    80,    -1,    82,    -1,    -1,
     182,     4,   185,   186,   183,    -1,   188,    -1,    -1,   186,
       4,    -1,   186,   187,     4,    -1,    66,   230,    -1,    -1,
      66,   119,   189,   191,   120,    -1,    -1,    67,   119,   190,
     191,   120,    -1,    -1,   230,    -1,   191,    72,   230,    -1,
     194,    -1,   192,   194,    -1,    -1,   193,   198,    -1,   103,
       4,    -1,   112,    -1,   111,    -1,    -1,   196,    -1,   196,
     197,    -1,   197,    -1,    94,    -1,   195,   200,     4,    -1,
     101,    -1,   199,    72,   101,    -1,   209,    -1,   220,    -1,
      21,   101,    -1,    22,   101,    -1,    -1,    29,   201,   207,
     199,    -1,    -1,    30,   202,   207,   101,   116,   237,    -1,
     138,    -1,    -1,    33,   203,   207,   101,   116,   237,    -1,
      -1,     5,   204,   207,   101,    -1,     5,   236,    -1,    65,
     230,    -1,     9,   230,    -1,    66,   230,    -1,     7,   228,
      -1,     8,   228,    -1,    -1,    17,   205,   144,    -1,   109,
     223,    -1,   215,    -1,   169,    -1,   184,    -1,    -1,    17,
      -1,    18,    -1,    19,    -1,    20,    -1,    50,    -1,    51,
      -1,    52,    -1,    53,    -1,    54,    -1,   208,    -1,   101,
      -1,   222,   116,   230,    -1,   222,   116,   121,   230,    -1,
     222,   116,   122,   230,    -1,   222,   116,   123,   230,    -1,
     222,   116,   230,   124,   230,    -1,   222,   116,   230,   122,
     230,    -1,   222,   116,   230,   125,   230,    -1,   222,   116,
     230,    68,   230,    -1,   222,   116,   230,   126,   230,    -1,
     222,   116,   230,    42,   230,    -1,   222,   116,   230,   127,
     230,    -1,   222,   116,   230,   114,   230,    -1,   222,   116,
     230,    48,   230,    -1,   222,   116,   230,    49,   230,    -1,
     222,   116,   230,    69,   230,    -1,   222,   116,   230,    70,
     230,    -1,   222,   116,   230,    71,   230,    -1,   222,   116,
     230,    55,   230,    -1,   222,   116,   230,   128,   230,    -1,
     222,   116,   230,   129,   230,    -1,   222,   116,   230,   123,
     230,    -1,   222,   116,   230,   117,   231,   118,    -1,   222,
     117,   231,   118,   116,   230,    -1,   222,   116,    16,   208,
      72,   230,    -1,   222,   116,    16,   208,   117,   231,   118,
      -1,   222,   116,    16,   208,    -1,   222,   116,    16,   230,
      -1,   222,   116,    16,   230,    72,   230,    -1,   222,   116,
      16,   230,   117,   231,   118,    -1,   222,   116,   206,   101,
      -1,   222,   116,   206,   101,    72,   101,    -1,   222,   116,
      64,   101,    -1,   222,   116,    63,   238,    -1,    63,   238,
     116,   230,    -1,    16,   222,    72,   230,    -1,    16,   222,
      72,   230,    72,   230,    -1,    16,   222,    72,   230,   117,
     231,   118,    -1,   222,   116,   215,    -1,    -1,   210,   119,
     219,   120,   116,   213,   119,   217,   120,    -1,   211,    -1,
     212,    -1,   222,    34,   230,    -1,   222,    35,   230,    -1,
     222,    36,   230,    -1,   222,    37,   230,    -1,   222,    44,
     230,    -1,   222,    43,   230,    -1,   222,    38,   230,    -1,
     222,    39,   230,    -1,   222,    40,   230,    -1,   222,    41,
     230,    -1,   222,    45,   230,    -1,   222,    46,   230,    -1,
     222,    47,   230,    -1,   222,   116,   109,   144,    -1,   101,
      -1,   105,    -1,   222,    -1,   222,   214,   227,    -1,   222,
     214,   105,    -1,   222,   214,   222,    -1,   115,    -1,   113,
      -1,    -1,   213,   216,   119,   217,   120,    -1,    -1,   217,
      72,   218,    -1,   218,    -1,   230,    -1,    10,   222,    -1,
     219,    72,   222,    -1,   222,    -1,    11,   230,   221,   230,
       8,   228,    -1,    12,   230,   221,   230,     8,   228,    -1,
      11,   230,     8,   228,    -1,    12,   230,     8,   228,    -1,
      11,   230,    72,   228,    -1,    12,   230,    72,   228,    -1,
      56,    -1,    57,    -1,    58,    -1,    59,    -1,    60,    -1,
      61,    -1,   110,    -1,   236,    -1,    -1,   224,    -1,   224,
      72,   225,    -1,   225,    -1,   229,    -1,   222,   117,   231,
     118,    -1,   227,    -1,   105,    -1,   101,    -1,   109,    -1,
     101,    -1,   109,    -1,   228,    -1,   230,    -1,   222,    -1,
     237,    -1,    -1,   232,   233,    -1,   235,    -1,   233,   130,
     235,    -1,    -1,   233,    72,   234,   235,    -1,   230,    -1,
     230,    74,   230,    -1,    74,   230,    -1,   230,    74,    -1,
      97,    -1,    98,    -1,    99,    -1,   100,    -1,   102,    -1,
     106,    -1,   107,    -1,   105,    -1,   108,    -1,    99,    -1,
     105,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   399,   399,   403,   405,   408,   410,   411,   412,   413,
     414,   415,   416,   417,   420,   426,   434,   433,   439,   438,
     442,   444,   447,   449,   450,   451,   452,   453,   456,   456,
     460,   467,   470,   475,   474,   486,   488,   491,   509,   507,
     523,   525,   528,   530,   533,   535,   536,   539,   553,   571,
     576,   569,   586,   588,   589,   593,   592,   597,   599,   603,
     605,   602,   615,   617,   618,   622,   621,   628,   626,   658,
     660,   663,   665,   668,   670,   673,   675,   676,   679,   680,
     681,   682,   683,   684,   685,   688,   694,   696,   701,   703,
     705,   709,   715,   717,   720,   722,   725,   727,   730,   733,
     733,   737,   739,   742,   744,   749,   747,   753,   758,   760,
     762,   766,   771,   770,   772,   772,   775,   777,   778,   782,
     784,   795,   799,   802,   803,   804,   807,   809,   812,   814,
     817,   824,   829,   837,   845,   847,   848,   849,   850,   850,
     863,   863,   865,   866,   866,   868,   868,   870,   871,   872,
     873,   874,   875,   876,   876,   879,   882,   883,   884,   885,
     888,   890,   891,   892,   895,   897,   898,   899,   900,   901,
     904,   914,   916,   917,   918,   919,   920,   921,   922,   923,
     924,   925,   926,   927,   929,   931,   933,   935,   937,   939,
     941,   943,   945,   947,   949,   951,   953,   955,   957,   959,
     961,   964,   971,   974,   976,   980,   982,   984,   987,   994,
     993,  1002,  1003,  1006,  1009,  1011,  1013,  1015,  1017,  1019,
    1021,  1023,  1025,  1027,  1029,  1031,  1035,  1043,  1044,  1045,
    1049,  1050,  1051,  1054,  1055,  1060,  1058,  1068,  1070,  1071,
    1074,  1077,  1081,  1083,  1086,  1089,  1091,  1093,  1095,  1097,
    1101,  1103,  1104,  1105,  1106,  1107,  1110,  1112,  1115,  1117,
    1120,  1122,  1125,  1127,  1134,  1136,  1139,  1141,  1144,  1146,
    1149,  1151,  1154,  1156,  1159,  1159,  1163,  1165,  1167,  1167,
    1171,  1177,  1180,  1181,  1184,  1186,  1187,  1188,  1189,  1192,
    1194,  1195,  1196,  1199,  1201
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
  "RETURN", "YIELDT", "POW", "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", 
  "COMMA", "ESUB", "DOTDOT", "PCC_BEGIN", "PCC_END", "PCC_CALL", 
  "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD", 
  "PCC_END_YIELD", "NCI_CALL", "METH_CALL", "INVOCANT", "PROTOTYPED", 
  "NON_PROTOTYPED", "MAIN", "LOAD", "IMMEDIATE", "POSTCOMP", "METHOD", 
  "ANON", "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", 
  "IDENTIFIER", "REG", "MACRO", "ENDM", "STRINGC", "INTC", "FLOATC", 
  "USTRINGC", "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", "DOT", 
  "CONCAT", "POINTY", "'='", "'['", "']'", "'('", "')'", "'!'", "'-'", 
  "'~'", "'+'", "'*'", "'/'", "'%'", "'&'", "'|'", "';'", "$accept", 
  "program", "compilation_units", "compilation_unit", "global", 
  "constdef", "@1", "pmc_const", "@2", "pasmcode", "pasmline", 
  "pasm_inst", "@3", "pasm_args", "emit", "@4", "opt_pasmcode", 
  "class_namespace", "class", "@5", "class_body", "member_decls", 
  "member_decl", "field_decl", "method_decl", "sub", "@6", "@7", 
  "sub_params", "sub_param", "@8", "sub_body", "pcc_sub", "@9", "@10", 
  "pcc_params", "pcc_param", "@11", "pcc_sub_call", "@12", "opt_label", 
  "opt_invocant", "pcc_proto", "pcc_sub_proto", "proto", "pcc_call", 
  "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@13", 
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
     364,   365,   366,   367,   368,   369,    61,    91,    93,    40,
      41,    33,    45,   126,    43,    42,    47,    37,    38,   124,
      59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   131,   132,   133,   133,   134,   134,   134,   134,   134,
     134,   134,   134,   134,   135,   135,   137,   136,   139,   138,
     140,   140,   141,   141,   141,   141,   141,   141,   143,   142,
     142,   142,   144,   146,   145,   147,   147,   148,   150,   149,
     151,   151,   152,   152,   153,   153,   153,   154,   155,   157,
     158,   156,   159,   159,   159,   161,   160,   162,   162,   164,
     165,   163,   166,   166,   166,   168,   167,   170,   169,   171,
     171,   172,   172,   173,   173,   174,   174,   174,   175,   175,
     175,   175,   175,   175,   175,   176,   176,   176,   176,   176,
     176,   176,   177,   177,   178,   178,   179,   179,   180,   181,
     180,   182,   182,   183,   183,   185,   184,   184,   186,   186,
     186,   187,   189,   188,   190,   188,   191,   191,   191,   192,
     192,   193,   194,   194,   194,   194,   195,   195,   196,   196,
     197,   198,   199,   199,   200,   200,   200,   200,   201,   200,
     202,   200,   200,   203,   200,   204,   200,   200,   200,   200,
     200,   200,   200,   205,   200,   200,   200,   200,   200,   200,
     206,   206,   206,   206,   207,   207,   207,   207,   207,   207,
     208,   209,   209,   209,   209,   209,   209,   209,   209,   209,
     209,   209,   209,   209,   209,   209,   209,   209,   209,   209,
     209,   209,   209,   209,   209,   209,   209,   209,   209,   209,
     209,   209,   209,   209,   209,   209,   209,   209,   209,   210,
     209,   209,   209,   211,   211,   211,   211,   211,   211,   211,
     211,   211,   211,   211,   211,   211,   212,   213,   213,   213,
     213,   213,   213,   214,   214,   216,   215,   217,   217,   217,
     218,   218,   219,   219,   220,   220,   220,   220,   220,   220,
     221,   221,   221,   221,   221,   221,   222,   222,   223,   223,
     224,   224,   225,   225,   226,   226,   227,   227,   228,   228,
     229,   229,   230,   230,   232,   231,   233,   233,   234,   233,
     235,   235,   235,   235,   236,   236,   236,   236,   236,   237,
     237,   237,   237,   238,   238
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
       5,     5,     0,     3,     2,     2,     0,     3,     2,     0,
       4,     1,     1,     1,     1,     0,     5,     1,     0,     2,
       3,     2,     0,     5,     0,     5,     0,     1,     3,     1,
       2,     0,     2,     2,     1,     1,     0,     1,     2,     1,
       1,     3,     1,     3,     1,     1,     2,     2,     0,     4,
       0,     6,     1,     0,     6,     0,     4,     2,     2,     2,
       2,     2,     2,     0,     3,     2,     1,     1,     1,     0,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     4,     4,     4,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     6,     6,     6,     7,     4,     4,     6,     7,
       4,     6,     4,     4,     4,     4,     6,     7,     3,     0,
       9,     1,     1,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     4,     1,     1,     1,
       3,     3,     3,     1,     1,     0,     5,     0,     3,     1,
       1,     2,     3,     1,     6,     6,     4,     4,     4,     4,
       1,     1,     1,     1,     1,     1,     1,     1,     0,     1,
       3,     1,     1,     4,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     0,     2,     1,     3,     0,     4,
       1,     3,     2,     2,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,    49,    16,     0,    59,    33,     0,
       0,     2,     3,     8,     7,    11,     6,     5,     9,    10,
     274,    38,     0,     0,   164,   165,   166,   167,   168,   170,
       0,   169,     0,   126,    12,     1,     4,     0,     0,     0,
     266,   265,   267,    75,   264,     0,    14,    75,    18,   130,
       0,    25,    24,    27,   126,    20,     0,    26,    28,   127,
     129,    37,     0,   284,   285,   286,   287,   288,   291,   289,
     290,   292,   256,   272,   280,   275,   276,   257,   273,    41,
      73,    74,    80,    79,    81,    82,    84,    83,    78,     0,
      77,     0,     0,     0,     0,    23,    21,    34,    75,     0,
       0,   128,   282,   283,   278,     0,    46,     0,     0,     0,
      40,    42,    44,    45,    50,     0,     0,    15,    60,     0,
       0,    22,   258,   281,     0,   277,     0,     0,    39,    43,
      52,    76,    17,    62,   268,   269,   270,     0,   271,    30,
      29,   272,    32,   259,   261,   262,   279,     0,     0,    53,
     121,    63,   121,     0,   274,     0,    47,    48,    55,     0,
     125,   124,     0,     0,   121,   126,   119,    65,     0,     0,
      19,     0,   260,     0,   123,    54,    51,   120,   159,   122,
       0,    61,    64,   263,     0,   145,     0,     0,     0,     0,
       0,     0,   153,     0,     0,   138,   140,   143,     0,     0,
       0,     0,     0,   101,   102,   227,   228,   258,   142,   157,
       0,   158,   107,     0,   134,     0,   211,   212,   235,   156,
     135,   229,     0,    56,     0,   147,   151,   152,   149,     0,
       0,     0,   258,   136,   137,     0,     0,     0,   293,   294,
       0,   148,   112,   150,   114,     0,   155,   105,   131,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   234,   233,     0,   274,     0,    66,
       0,     0,   250,   251,   252,   253,   254,   255,     0,     0,
       0,     0,     0,     0,   154,     0,     0,     0,     0,   116,
     116,    67,   108,     0,   243,   237,   213,   214,   215,   216,
     219,   220,   221,   222,   218,   217,   223,   224,   225,     0,
     160,   161,   162,   163,     0,     0,   291,   258,     0,     0,
       0,     0,   208,   272,   171,     0,   231,   232,   230,   146,
     246,   248,     0,   247,   249,     0,   205,   132,   139,     0,
       0,   204,     0,   117,     0,    92,     0,     0,     0,     0,
       0,   239,   240,   196,   197,   203,   202,   226,   172,   173,
     174,   200,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   274,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   274,     0,     0,     0,     0,   113,
     115,    71,   109,     0,   103,   104,   106,     0,   242,     0,
     241,     0,   236,     0,   274,     0,   274,     0,   180,   183,
     184,   188,   178,   185,   186,   187,   182,     0,   176,   191,
     175,   177,   179,   181,   189,   190,     0,   244,   245,   206,
       0,   133,   141,   144,   118,     0,     0,     0,     0,     0,
     111,   110,     0,   229,   238,   194,     0,   198,     0,   201,
     192,   193,   207,    94,    95,     0,     0,     0,     0,    69,
      93,   237,   195,   199,    72,     0,     0,     0,     0,    96,
       0,     0,    86,     0,    87,    89,     0,    88,     0,     0,
      70,   210,     0,     0,     0,    99,     0,    68,     0,    85,
      91,    90,     0,    98,    97,     0,   100
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    10,    11,    12,    13,    14,    23,    53,    94,    54,
      55,    99,   100,   140,    15,    33,    56,    16,    17,    39,
     109,   110,   111,   112,   113,    18,    22,   130,   150,   162,
     173,   163,    19,    32,   133,   152,   169,   180,   209,   345,
     469,   438,    88,    89,    90,   459,   391,   439,   479,   488,
     492,   210,   396,   211,   292,   346,   397,   212,   289,   290,
     342,   164,   165,   166,    58,    59,    60,   179,   338,   213,
     235,   236,   237,   224,   232,   321,    30,    31,   214,   215,
     216,   217,   218,   268,   219,   250,   350,   351,   293,   220,
     279,    73,   142,   143,   144,    43,    44,   136,   145,   138,
      37,    38,    75,   124,    76,    77,    78,   240
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -227
static const short yypact[] =
{
       8,  -227,   -95,   -22,  -227,  -227,    -8,  -227,  -227,    61,
     108,     8,  -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,
    -227,  -227,    60,    -8,  -227,  -227,  -227,  -227,  -227,  -227,
     -20,  -227,    16,   146,  -227,  -227,  -227,    -9,   416,   114,
    -227,  -227,  -227,   498,  -227,    26,    -4,   498,  -227,  -227,
     144,  -227,  -227,  -227,   168,  -227,    77,  -227,    17,    80,
    -227,  -227,   473,  -227,  -227,  -227,  -227,  -227,  -227,  -227,
    -227,  -227,  -227,  -227,   101,   -64,  -227,  -227,  -227,   115,
    -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,     6,
    -227,    68,   169,    11,    71,  -227,  -227,  -227,   498,   184,
      87,  -227,  -227,   473,  -227,   416,  -227,    -8,   102,   182,
     115,  -227,  -227,  -227,  -227,   498,   169,  -227,  -227,   445,
     -45,  -227,   445,  -227,   416,  -227,   106,   109,  -227,  -227,
     205,  -227,  -227,   207,  -227,  -227,  -227,   113,  -227,  -227,
    -227,   121,  -227,   159,  -227,  -227,  -227,   235,   240,  -227,
       2,  -227,     4,   140,  -227,   445,  -227,  -227,  -227,   244,
    -227,  -227,   246,   178,    59,    80,  -227,  -227,   183,   256,
    -227,   137,  -227,    -8,  -227,  -227,  -227,  -227,   401,  -227,
      -8,  -227,  -227,  -227,   164,   135,   -51,   -51,   473,   473,
     473,    95,  -227,   166,   171,  -227,   163,  -227,    67,   473,
     430,   151,   -39,  -227,  -227,  -227,  -227,   445,  -227,  -227,
     274,  -227,  -227,   277,  -227,   172,  -227,  -227,  -227,  -227,
    -227,   265,   191,  -227,    -8,  -227,  -227,  -227,  -227,   399,
     435,   222,   445,  -227,  -227,    -8,    -8,    -8,  -227,  -227,
     181,  -227,  -227,  -227,  -227,   303,  -227,  -227,  -227,    95,
     194,   473,   473,   473,   473,   473,   473,   473,   473,   473,
     473,   473,   473,   473,  -227,  -227,    37,  -227,    81,  -227,
     213,   -51,  -227,  -227,  -227,  -227,  -227,  -227,   -51,   473,
     -51,   -51,   473,   473,  -227,   214,   215,   216,   473,   473,
     473,  -227,  -227,   -52,  -227,    23,  -227,  -227,  -227,  -227,
    -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,   459,
    -227,  -227,  -227,  -227,    67,   218,   201,   445,   473,   473,
     473,   220,  -227,    89,   324,   204,  -227,  -227,  -227,  -227,
    -227,  -227,   315,  -227,  -227,   316,   -44,  -227,   253,   219,
     228,  -227,   -49,  -227,   -48,  -227,    10,    95,   229,    95,
     -40,  -227,  -227,   -35,   -11,  -227,  -227,  -227,  -227,  -227,
    -227,   282,   473,   473,   473,   473,   473,   473,   473,   473,
     473,  -227,   473,   473,   473,   473,   473,   473,   473,   473,
     230,   -51,   -51,   473,  -227,   257,   169,   169,   473,  -227,
    -227,     9,  -227,   473,  -227,  -227,  -227,   355,  -227,   188,
    -227,    23,  -227,   473,  -227,   473,  -227,   259,  -227,  -227,
    -227,  -227,  -227,  -227,  -227,  -227,  -227,   245,  -227,  -227,
    -227,  -227,  -227,  -227,  -227,  -227,   473,  -227,  -227,  -227,
     250,  -227,  -227,  -227,  -227,   473,    95,   473,    72,   358,
    -227,  -227,   252,   -53,  -227,  -227,   258,  -227,   266,  -227,
    -227,  -227,  -227,  -227,  -227,   360,   473,   473,   251,    80,
    -227,    23,  -227,  -227,  -227,    13,   366,    30,    32,  -227,
     370,   -33,  -227,   473,  -227,  -227,   473,  -227,   473,   -13,
    -227,  -227,   371,   379,   381,  -227,    95,  -227,   382,  -227,
    -227,  -227,    -8,  -227,  -227,   286,  -227
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -227,  -227,  -227,   377,  -227,  -227,  -227,   211,  -227,  -227,
     337,  -227,  -227,  -226,  -227,  -227,  -227,    -3,  -227,  -227,
    -227,  -227,   287,  -227,  -227,  -227,  -227,  -227,  -227,  -227,
    -227,   248,  -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,
    -227,  -227,   196,   -34,   281,  -227,  -227,  -227,  -227,  -227,
    -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,
     112,  -227,  -227,   247,   239,  -227,   -56,  -227,  -227,  -227,
    -227,  -227,  -227,  -227,  -227,  -227,   -23,   105,  -227,  -227,
    -227,  -227,    20,  -227,   149,  -227,   -37,    15,  -227,  -227,
     197,   -81,   221,  -227,   271,  -227,   161,  -182,   313,   -36,
    -143,  -227,  -227,  -227,   -65,   254,   -91,   119
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -230
static const short yytable[] =
{
      45,   117,    74,   101,   226,   227,   284,   158,   104,   167,
     114,   171,     1,    93,   392,   118,   485,   472,   435,   436,
     347,   -31,    20,   388,   388,   132,   102,   115,   383,     2,
      57,     3,   401,   349,   475,     4,   477,   403,     5,   401,
     125,   141,    24,    25,    26,    27,    28,    80,    81,   139,
     134,    57,   486,   309,   310,   311,   312,   313,   135,   146,
     264,   405,   265,   487,   120,    34,   105,   123,   348,    74,
       6,   389,   390,   384,   141,   -57,   393,   -57,   115,    21,
     402,    46,   404,   115,   126,   473,     7,   481,    74,   330,
     394,   357,   395,    29,   437,    98,   331,   221,   333,   334,
     314,   315,   476,     8,   478,   159,   406,   159,    35,    61,
     231,     9,    92,   160,   161,   160,   161,    47,    79,   106,
      63,    64,    65,    66,   325,    67,   141,    91,    68,    69,
      70,    71,   -58,    72,    63,    64,    65,    66,   205,    67,
     107,   108,   316,    69,    70,    71,   317,    72,    95,   456,
     184,   141,   228,   229,   230,   457,   458,   222,   318,   319,
     320,    40,   159,   241,   243,    41,   238,     2,   294,    42,
     160,   161,   239,    97,    49,   103,    48,   119,    63,    64,
      65,    66,    40,    67,   116,   323,   326,   327,   121,     2,
      42,    72,    63,    64,    65,    66,   122,    67,    48,   427,
     428,   270,   264,   127,   265,    72,   128,   147,  -229,   149,
     148,   151,   285,   286,   287,   296,   297,   298,   299,   300,
     301,   302,   303,   304,   305,   306,   307,   308,   417,   153,
     324,   155,    63,    64,    65,    66,   141,    67,   154,   156,
      49,   430,   -35,   332,   157,   170,   335,   336,   174,    50,
     175,   176,   341,   343,   343,   183,   181,    51,    52,   352,
     182,   446,    49,   448,   -36,   223,   398,   233,   400,   -18,
     244,    50,   234,   354,    68,    69,    70,    71,   247,    51,
      52,   248,   358,   359,   360,    63,    64,    65,    66,   205,
      67,   249,   269,   206,   283,   432,   433,   288,    72,   251,
     252,   253,   254,   255,   256,   257,   258,   291,   259,   260,
     261,   262,   263,   295,   329,   337,   339,   340,   443,   356,
    -228,   361,   380,   381,   382,   385,   408,   409,   410,   411,
     412,   413,   414,   415,   416,   386,   418,   419,   420,   421,
     422,   423,   424,   425,   387,   399,   426,   429,    63,    64,
      65,    66,   434,    67,   407,   454,   467,   440,   431,   441,
     449,    72,   460,   450,   464,   352,   362,   445,   452,   447,
     474,   461,   363,   364,   480,   489,   462,   468,   264,   365,
     265,   266,   267,   490,   463,   491,   494,   496,    36,   208,
     451,    96,   366,   367,   368,   369,   131,   129,   245,   453,
     168,   455,   344,   470,   178,   493,   185,   271,   186,   187,
     188,   177,   189,   190,   353,   322,   444,   191,   192,   442,
     465,   466,   193,   194,   471,   352,   172,   282,   246,   328,
     195,   196,   137,   355,   197,     0,     0,   482,   370,   225,
     483,   371,   484,   280,     0,     0,   372,   373,   374,   375,
     376,   377,   378,   379,     0,   272,   273,   274,   275,   276,
     277,     0,     0,     0,   198,     0,   199,   200,   201,   495,
       0,   278,     0,     0,     0,     0,   202,     0,     0,     0,
     203,     0,   204,     0,     0,     0,     0,     0,     0,     0,
      62,   272,   273,   274,   275,   276,   277,     0,    63,    64,
      65,    66,   205,    67,     0,     0,   206,   281,     0,     0,
     207,    72,     0,    63,    64,    65,    66,     0,    67,     0,
    -209,    68,    69,    70,    71,     0,    72,    63,    64,    65,
      66,     0,    67,     0,     0,    68,    69,    70,    71,     0,
      72,     0,    63,    64,    65,    66,   134,    67,     0,   242,
      68,    69,    70,    71,   135,    72,    63,    64,    65,    66,
      29,    67,     0,     0,    68,    69,    70,    71,     0,    72,
      63,    64,    65,    66,     0,    67,     0,     0,    68,    69,
      70,    71,     0,    72,    80,    81,    82,    83,    84,    85,
      86,    87
};

static const short yycheck[] =
{
      23,    92,    38,    59,   186,   187,   232,     5,    72,     5,
       4,   154,     4,    47,     4,     4,    29,     4,     9,    10,
      72,     4,   117,    72,    72,   116,    62,    72,    72,    21,
      33,    23,    72,    10,     4,    27,     4,    72,    30,    72,
     105,   122,    50,    51,    52,    53,    54,    86,    87,    94,
     101,    54,    65,    16,    17,    18,    19,    20,   109,   124,
     113,    72,   115,    76,    98,     4,   130,   103,   120,   105,
      62,   120,   120,   117,   155,    73,    66,    73,    72,   101,
     120,   101,   117,    72,   107,    72,    78,   120,   124,   271,
      80,   317,    82,   101,    85,    78,   278,   178,   280,   281,
      63,    64,    72,    95,    72,   103,   117,   103,     0,   118,
     191,   103,   116,   111,   112,   111,   112,   101,     4,     4,
      97,    98,    99,   100,   267,   102,   207,   101,   105,   106,
     107,   108,    73,   110,    97,    98,    99,   100,   101,   102,
      25,    26,   105,   106,   107,   108,   109,   110,     4,    77,
     173,   232,   188,   189,   190,    83,    84,   180,   121,   122,
     123,   101,   103,   199,   200,   105,    99,    21,   249,   109,
     111,   112,   105,    96,    94,    74,    30,   106,    97,    98,
      99,   100,   101,   102,   116,   266,   105,   268,     4,    21,
     109,   110,    97,    98,    99,   100,   109,   102,    30,   381,
     382,   224,   113,   101,   115,   110,    24,   101,   119,     4,
     101,     4,   235,   236,   237,   251,   252,   253,   254,   255,
     256,   257,   258,   259,   260,   261,   262,   263,   371,   116,
     266,    72,    97,    98,    99,   100,   317,   102,   117,     4,
      94,   384,    96,   279,     4,   105,   282,   283,     4,   103,
       4,    73,   288,   289,   290,   118,    73,   111,   112,   295,
       4,   404,    94,   406,    96,   101,   347,   101,   349,   106,
     119,   103,   101,   309,   105,   106,   107,   108,     4,   111,
     112,     4,   318,   319,   320,    97,    98,    99,   100,   101,
     102,   119,   101,   105,    72,   386,   387,   116,   110,    34,
      35,    36,    37,    38,    39,    40,    41,     4,    43,    44,
      45,    46,    47,   119,   101,   101,   101,   101,   399,   101,
     119,   101,   118,     8,     8,    72,   362,   363,   364,   365,
     366,   367,   368,   369,   370,   116,   372,   373,   374,   375,
     376,   377,   378,   379,   116,   116,   116,   383,    97,    98,
      99,   100,   388,   102,    72,   436,   105,   393,   101,     4,
     101,   110,     4,   118,     4,   401,    42,   403,   118,   405,
       4,   119,    48,    49,     4,     4,   118,   458,   113,    55,
     115,   116,   117,     4,   118,     4,     4,   101,    11,   178,
     426,    54,    68,    69,    70,    71,   115,   110,   202,   435,
     152,   437,   290,   459,   165,   486,     5,     8,     7,     8,
       9,   164,    11,    12,   309,   266,   401,    16,    17,   399,
     456,   457,    21,    22,   461,   461,   155,   230,   207,   268,
      29,    30,   119,   314,    33,    -1,    -1,   473,   114,   185,
     476,   117,   478,     8,    -1,    -1,   122,   123,   124,   125,
     126,   127,   128,   129,    -1,    56,    57,    58,    59,    60,
      61,    -1,    -1,    -1,    63,    -1,    65,    66,    67,   492,
      -1,    72,    -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,
      79,    -1,    81,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    56,    57,    58,    59,    60,    61,    -1,    97,    98,
      99,   100,   101,   102,    -1,    -1,   105,    72,    -1,    -1,
     109,   110,    -1,    97,    98,    99,   100,    -1,   102,    -1,
     119,   105,   106,   107,   108,    -1,   110,    97,    98,    99,
     100,    -1,   102,    -1,    -1,   105,   106,   107,   108,    -1,
     110,    -1,    97,    98,    99,   100,   101,   102,    -1,   119,
     105,   106,   107,   108,   109,   110,    97,    98,    99,   100,
     101,   102,    -1,    -1,   105,   106,   107,   108,    -1,   110,
      97,    98,    99,   100,    -1,   102,    -1,    -1,   105,   106,
     107,   108,    -1,   110,    86,    87,    88,    89,    90,    91,
      92,    93
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    21,    23,    27,    30,    62,    78,    95,   103,
     132,   133,   134,   135,   136,   145,   148,   149,   156,   163,
     117,   101,   157,   137,    50,    51,    52,    53,    54,   101,
     207,   208,   164,   146,     4,     0,   134,   231,   232,   150,
     101,   105,   109,   226,   227,   207,   101,   101,    30,    94,
     103,   111,   112,   138,   140,   141,   147,   148,   195,   196,
     197,   118,    74,    97,    98,    99,   100,   102,   105,   106,
     107,   108,   110,   222,   230,   233,   235,   236,   237,     4,
      86,    87,    88,    89,    90,    91,    92,    93,   173,   174,
     175,   101,   116,   174,   139,     4,   141,    96,    78,   142,
     143,   197,   230,    74,    72,   130,     4,    25,    26,   151,
     152,   153,   154,   155,     4,    72,   116,   237,     4,   106,
     174,     4,   109,   230,   234,   235,   207,   101,    24,   153,
     158,   175,   237,   165,   101,   109,   228,   229,   230,    94,
     144,   222,   223,   224,   225,   229,   235,   101,   101,     4,
     159,     4,   166,   116,   117,    72,     4,     4,     5,   103,
     111,   112,   160,   162,   192,   193,   194,     5,   162,   167,
     105,   231,   225,   161,     4,     4,    73,   194,   195,   198,
     168,    73,     4,   118,   207,     5,     7,     8,     9,    11,
      12,    16,    17,    21,    22,    29,    30,    33,    63,    65,
      66,    67,    75,    79,    81,   101,   105,   109,   138,   169,
     182,   184,   188,   200,   209,   210,   211,   212,   213,   215,
     220,   222,   207,   101,   204,   236,   228,   228,   230,   230,
     230,   222,   205,   101,   101,   201,   202,   203,    99,   105,
     238,   230,   119,   230,   119,   173,   223,     4,     4,   119,
     216,    34,    35,    36,    37,    38,    39,    40,    41,    43,
      44,    45,    46,    47,   113,   115,   116,   117,   214,   101,
     207,     8,    56,    57,    58,    59,    60,    61,    72,   221,
       8,    72,   221,    72,   144,   207,   207,   207,   116,   189,
     190,     4,   185,   219,   222,   119,   230,   230,   230,   230,
     230,   230,   230,   230,   230,   230,   230,   230,   230,    16,
      17,    18,    19,    20,    63,    64,   105,   109,   121,   122,
     123,   206,   215,   222,   230,   231,   105,   222,   227,   101,
     228,   228,   230,   228,   228,   230,   230,   101,   199,   101,
     101,   230,   191,   230,   191,   170,   186,    72,   120,    10,
     217,   218,   230,   208,   230,   238,   101,   144,   230,   230,
     230,   101,    42,    48,    49,    55,    68,    69,    70,    71,
     114,   117,   122,   123,   124,   125,   126,   127,   128,   129,
     118,     8,     8,    72,   117,    72,   116,   116,    72,   120,
     120,   177,     4,    66,    80,    82,   183,   187,   222,   116,
     222,    72,   120,    72,   117,    72,   117,    72,   230,   230,
     230,   230,   230,   230,   230,   230,   230,   231,   230,   230,
     230,   230,   230,   230,   230,   230,   116,   228,   228,   230,
     231,   101,   237,   237,   230,     9,    10,    85,   172,   178,
     230,     4,   213,   222,   218,   230,   231,   230,   231,   101,
     118,   230,   118,   230,   222,   230,    77,    83,    84,   176,
       4,   119,   118,   118,     4,   230,   230,   105,   222,   171,
     197,   217,     4,    72,     4,     4,    72,     4,    72,   179,
       4,   120,   230,   230,   230,    29,    65,    76,   180,     4,
       4,     4,   181,   222,     4,   207,   101
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
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 13:
#line 417 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 422 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 427 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 16:
#line 434 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 17:
#line 435 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 18:
#line 439 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 19:
#line 440 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 22:
#line 448 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 449 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 450 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 25:
#line 451 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 26:
#line 452 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 28:
#line 456 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 29:
#line 458 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 30:
#line 461 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, cur_unit);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 31:
#line 467 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 33:
#line 475 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; }
    break;

  case 34:
#line 478 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 37:
#line 493 "imcc/imcc.y"
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
                         fataly(EX_SOFTWARE, sourcefile, line,
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
              fataly(EX_SOFTWARE, sourcefile, line,
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
          i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
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
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 59:
#line 603 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 60:
#line 605 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
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
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 67:
#line 628 "imcc/imcc.y"
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
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-1].s,'S')); }
    break;

  case 90:
#line 706 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 91:
#line 710 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-3].s,'S'));
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
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 96:
#line 726 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 97:
#line 727 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 98:
#line 732 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 99:
#line 733 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 100:
#line 734 "imcc/imcc.y"
    {  mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 101:
#line 738 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 102:
#line 739 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 105:
#line 749 "imcc/imcc.y"
    { begin_return_or_yield(yyvsp[-1].t); }
    break;

  case 106:
#line 752 "imcc/imcc.y"
    { yyval.i = 0;  asm_state = AsmDefault; }
    break;

  case 107:
#line 753 "imcc/imcc.y"
    { asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 108:
#line 759 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 109:
#line 761 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(sr_return, yyvsp[-1].sr); }
    break;

  case 110:
#line 763 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(sr_return, yyvsp[-1].sr); }
    break;

  case 111:
#line 767 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 112:
#line 771 "imcc/imcc.y"
    {  if(asm_state == AsmDefault)   begin_return_or_yield(0); }
    break;

  case 113:
#line 771 "imcc/imcc.y"
    { asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 114:
#line 772 "imcc/imcc.y"
    {  if(asm_state == AsmDefault)   begin_return_or_yield(1); }
    break;

  case 115:
#line 772 "imcc/imcc.y"
    { asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 116:
#line 776 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 117:
#line 777 "imcc/imcc.y"
    {  add_pcc_return(sr_return, yyvsp[0].sr);    }
    break;

  case 118:
#line 778 "imcc/imcc.y"
    {  add_pcc_return(sr_return, yyvsp[0].sr);    }
    break;

  case 121:
#line 796 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 122:
#line 801 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 123:
#line 802 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 124:
#line 803 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 125:
#line 804 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 126:
#line 808 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 130:
#line 818 "imcc/imcc.y"
    {
                     /* $$ = iLABEL(cur_unit, mk_address(, U_add_uniq_label)); */
                     yyval.i = iLABEL(cur_unit, mk_local_label(cur_unit, yyvsp[0].s));
                   }
    break;

  case 131:
#line 826 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 132:
#line 830 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 133:
#line 838 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 136:
#line 848 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 137:
#line 849 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 138:
#line 850 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 139:
#line 851 "imcc/imcc.y"
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

   }
    break;

  case 140:
#line 863 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 141:
#line 864 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 143:
#line 866 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 144:
#line 867 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 145:
#line 868 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 146:
#line 868 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 147:
#line 870 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 148:
#line 871 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 149:
#line 872 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 150:
#line 873 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 151:
#line 874 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 152:
#line 875 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 153:
#line 876 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 154:
#line 878 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 155:
#line 880 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 156:
#line 882 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 157:
#line 883 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 159:
#line 885 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 160:
#line 889 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 161:
#line 890 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 162:
#line 891 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 163:
#line 892 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 164:
#line 896 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 165:
#line 897 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 166:
#line 898 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 167:
#line 899 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 168:
#line 900 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 169:
#line 901 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 170:
#line 906 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 171:
#line 915 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 172:
#line 916 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 173:
#line 917 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 174:
#line 918 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 175:
#line 919 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 176:
#line 920 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 177:
#line 921 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 178:
#line 922 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 179:
#line 923 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 180:
#line 924 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 181:
#line 925 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 182:
#line 926 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 183:
#line 928 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 930 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 185:
#line 932 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 934 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 187:
#line 936 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 938 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 189:
#line 940 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 942 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 191:
#line 944 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 946 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 193:
#line 948 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 950 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 195:
#line 952 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 196:
#line 954 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 197:
#line 956 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 958 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 960 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 200:
#line 962 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                          mk_sub_address(yyvsp[0].s), NULL, 1); }
    break;

  case 201:
#line 965 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(yyvsp[-2].s),
                                           mk_sub_address(yyvsp[0].s), 1); }
    break;

  case 202:
#line 972 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                    2, yyvsp[-3].sr, mk_label_address(cur_unit, yyvsp[0].s)); }
    break;

  case 203:
#line 975 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 204:
#line 977 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 205:
#line 981 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 983 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 985 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 208:
#line 988 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 209:
#line 994 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 210:
#line 998 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 213:
#line 1008 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 214:
#line 1010 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 215:
#line 1012 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 216:
#line 1014 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 1016 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 218:
#line 1018 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1020 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 220:
#line 1022 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 221:
#line 1024 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 222:
#line 1026 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 223:
#line 1028 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 1030 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 1032 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 226:
#line 1037 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 227:
#line 1043 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 228:
#line 1044 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(yyvsp[0].s); }
    break;

  case 229:
#line 1045 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                          fataly(1, sourcefile, line, "Sub isn't a PMC");
                     }
    break;

  case 230:
#line 1049 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 231:
#line 1050 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 232:
#line 1051 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 233:
#line 1054 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 234:
#line 1055 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 235:
#line 1060 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 236:
#line 1065 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 237:
#line 1069 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 238:
#line 1070 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 239:
#line 1071 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 240:
#line 1076 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 241:
#line 1078 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 242:
#line 1082 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 243:
#line 1083 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 244:
#line 1088 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 245:
#line 1090 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 246:
#line 1092 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 247:
#line 1094 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 248:
#line 1096 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 249:
#line 1098 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 250:
#line 1102 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 251:
#line 1103 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 252:
#line 1104 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 253:
#line 1105 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 254:
#line 1106 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 255:
#line 1107 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 258:
#line 1116 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 259:
#line 1117 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 260:
#line 1121 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 262:
#line 1126 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 263:
#line 1128 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 265:
#line 1136 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(yyvsp[0].s); }
    break;

  case 266:
#line 1140 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 267:
#line 1141 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 268:
#line 1145 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 269:
#line 1146 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 274:
#line 1159 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 275:
#line 1160 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); }
    break;

  case 276:
#line 1164 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 277:
#line 1166 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 278:
#line 1167 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 279:
#line 1168 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 280:
#line 1172 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 281:
#line 1178 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 282:
#line 1180 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 283:
#line 1181 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 284:
#line 1185 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 285:
#line 1186 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 286:
#line 1187 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 287:
#line 1188 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 288:
#line 1189 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 289:
#line 1193 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 290:
#line 1194 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 291:
#line 1195 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 292:
#line 1196 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'U'); }
    break;

  case 293:
#line 1200 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 294:
#line 1201 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3459 "imcc/imcparser.c"

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


#line 1206 "imcc/imcc.y"



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

