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
#line 306 "imcc/imcc.y"
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
#line 615 "imcc/imcparser.c"
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
#line 636 "imcc/imcparser.c"

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
#define YYLAST   602

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  130
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  107
/* YYNRULES -- Number of rules. */
#define YYNRULES  290
/* YYNRULES -- Number of states. */
#define YYNSTATES  492

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   368

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

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
     222,   224,   226,   228,   230,   236,   240,   244,   248,   252,
     258,   264,   265,   269,   272,   275,   276,   280,   283,   284,
     289,   291,   293,   295,   297,   298,   304,   306,   307,   310,
     314,   317,   318,   324,   325,   331,   332,   334,   338,   340,
     343,   344,   347,   350,   352,   354,   355,   357,   360,   362,
     364,   368,   370,   374,   376,   378,   381,   384,   385,   390,
     391,   398,   400,   401,   408,   409,   414,   417,   420,   423,
     426,   429,   432,   433,   437,   440,   442,   444,   446,   447,
     449,   451,   453,   455,   457,   459,   461,   463,   465,   467,
     469,   473,   478,   483,   488,   494,   500,   506,   512,   518,
     524,   530,   536,   542,   548,   554,   560,   566,   572,   578,
     584,   590,   597,   604,   611,   619,   624,   629,   636,   644,
     649,   656,   661,   666,   671,   676,   683,   691,   695,   696,
     706,   708,   710,   714,   718,   722,   726,   730,   734,   738,
     742,   746,   750,   754,   758,   762,   767,   769,   771,   775,
     779,   783,   785,   787,   788,   794,   795,   799,   801,   803,
     806,   810,   812,   819,   826,   831,   836,   841,   846,   848,
     850,   852,   854,   856,   858,   860,   862,   863,   865,   869,
     871,   873,   878,   880,   882,   884,   886,   888,   890,   892,
     894,   895,   898,   900,   904,   905,   910,   912,   916,   919,
     922,   924,   926,   928,   930,   932,   934,   936,   938,   940,
     942
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     131,     0,    -1,   132,    -1,   133,    -1,   132,   133,    -1,
     148,    -1,   147,    -1,   135,    -1,   134,    -1,   155,    -1,
     162,    -1,   144,    -1,   102,     4,    -1,     4,    -1,    62,
     206,   100,    -1,    62,   206,   100,   115,   235,    -1,    -1,
      30,   136,   206,   100,   115,   235,    -1,    -1,    30,   138,
     105,   227,   115,   104,    -1,   140,    -1,   139,   140,    -1,
     194,   141,     4,    -1,   102,     4,    -1,   111,    -1,   110,
      -1,   147,    -1,   137,    -1,    -1,   142,   108,   143,    -1,
      78,   173,    93,    -1,    -1,   222,    -1,    -1,    94,   145,
     146,    95,    -1,    -1,   139,    -1,    21,   116,   229,   117,
      -1,    -1,    23,   100,   149,     4,   150,    24,    -1,   151,
      -1,    -1,   152,    -1,   151,   152,    -1,   153,    -1,   154,
      -1,     4,    -1,    25,   206,   100,     4,    -1,    26,   100,
     100,     4,    -1,    -1,    -1,    27,   156,   225,   173,     4,
     157,   158,   161,    73,    -1,    -1,     4,    -1,   158,   159,
       4,    -1,    -1,     5,   160,   206,   100,    -1,    -1,   191,
      -1,    -1,    -1,    78,   163,   100,   173,     4,   164,   165,
     161,    73,    -1,    -1,     4,    -1,   165,   166,     4,    -1,
      -1,     5,   167,   206,   100,    -1,    -1,    75,   172,     4,
     169,   176,   171,   175,   170,   178,    76,    -1,    -1,   196,
       4,    -1,    -1,    85,   228,     4,    -1,    86,    -1,    87,
      -1,    -1,   173,    72,   174,    -1,   174,    -1,   172,    -1,
      89,    -1,    88,    -1,    90,    -1,    91,    -1,    92,    -1,
      77,   228,    72,   228,     4,    -1,    77,   228,     4,    -1,
      83,   228,     4,    -1,    84,   221,     4,    -1,    84,   104,
       4,    -1,    84,   221,    72,   228,     4,    -1,    84,   104,
      72,   228,     4,    -1,    -1,   176,   177,     4,    -1,     9,
     228,    -1,    10,   221,    -1,    -1,   178,   179,     4,    -1,
      65,   221,    -1,    -1,    29,   180,   206,   100,    -1,    79,
      -1,    81,    -1,    80,    -1,    82,    -1,    -1,   181,     4,
     184,   185,   182,    -1,   187,    -1,    -1,   185,     4,    -1,
     185,   186,     4,    -1,    66,   228,    -1,    -1,    66,   118,
     188,   190,   119,    -1,    -1,    67,   118,   189,   190,   119,
      -1,    -1,   228,    -1,   190,    72,   228,    -1,   193,    -1,
     191,   193,    -1,    -1,   192,   197,    -1,   102,     4,    -1,
     111,    -1,   110,    -1,    -1,   195,    -1,   195,   196,    -1,
     196,    -1,    93,    -1,   194,   199,     4,    -1,   100,    -1,
     198,    72,   100,    -1,   208,    -1,   219,    -1,    21,   100,
      -1,    22,   100,    -1,    -1,    29,   200,   206,   198,    -1,
      -1,    30,   201,   206,   100,   115,   235,    -1,   137,    -1,
      -1,    33,   202,   206,   100,   115,   235,    -1,    -1,     5,
     203,   206,   100,    -1,     5,   234,    -1,    65,   228,    -1,
       9,   228,    -1,    66,   228,    -1,     7,   226,    -1,     8,
     226,    -1,    -1,    17,   204,   143,    -1,   108,   222,    -1,
     214,    -1,   168,    -1,   183,    -1,    -1,    17,    -1,    18,
      -1,    19,    -1,    20,    -1,    50,    -1,    51,    -1,    52,
      -1,    53,    -1,    54,    -1,   207,    -1,   100,    -1,   221,
     115,   228,    -1,   221,   115,   120,   228,    -1,   221,   115,
     121,   228,    -1,   221,   115,   122,   228,    -1,   221,   115,
     228,   123,   228,    -1,   221,   115,   228,   121,   228,    -1,
     221,   115,   228,   124,   228,    -1,   221,   115,   228,    68,
     228,    -1,   221,   115,   228,   125,   228,    -1,   221,   115,
     228,    42,   228,    -1,   221,   115,   228,   126,   228,    -1,
     221,   115,   228,   113,   228,    -1,   221,   115,   228,    48,
     228,    -1,   221,   115,   228,    49,   228,    -1,   221,   115,
     228,    69,   228,    -1,   221,   115,   228,    70,   228,    -1,
     221,   115,   228,    71,   228,    -1,   221,   115,   228,    55,
     228,    -1,   221,   115,   228,   127,   228,    -1,   221,   115,
     228,   128,   228,    -1,   221,   115,   228,   122,   228,    -1,
     221,   115,   228,   116,   229,   117,    -1,   221,   116,   229,
     117,   115,   228,    -1,   221,   115,    16,   207,    72,   228,
      -1,   221,   115,    16,   207,   116,   229,   117,    -1,   221,
     115,    16,   207,    -1,   221,   115,    16,   228,    -1,   221,
     115,    16,   228,    72,   228,    -1,   221,   115,    16,   228,
     116,   229,   117,    -1,   221,   115,   205,   100,    -1,   221,
     115,   205,   100,    72,   100,    -1,   221,   115,    64,   100,
      -1,   221,   115,    63,   236,    -1,    63,   236,   115,   228,
      -1,    16,   221,    72,   228,    -1,    16,   221,    72,   228,
      72,   228,    -1,    16,   221,    72,   228,   116,   229,   117,
      -1,   221,   115,   214,    -1,    -1,   209,   118,   218,   119,
     115,   212,   118,   216,   119,    -1,   210,    -1,   211,    -1,
     221,    34,   228,    -1,   221,    35,   228,    -1,   221,    36,
     228,    -1,   221,    37,   228,    -1,   221,    44,   228,    -1,
     221,    43,   228,    -1,   221,    38,   228,    -1,   221,    39,
     228,    -1,   221,    40,   228,    -1,   221,    41,   228,    -1,
     221,    45,   228,    -1,   221,    46,   228,    -1,   221,    47,
     228,    -1,   221,   115,   108,   143,    -1,   100,    -1,   221,
      -1,   221,   213,   225,    -1,   221,   213,   104,    -1,   221,
     213,   221,    -1,   114,    -1,   112,    -1,    -1,   212,   215,
     118,   216,   119,    -1,    -1,   216,    72,   217,    -1,   217,
      -1,   228,    -1,    10,   221,    -1,   218,    72,   221,    -1,
     221,    -1,    11,   228,   220,   228,     8,   226,    -1,    12,
     228,   220,   228,     8,   226,    -1,    11,   228,     8,   226,
      -1,    12,   228,     8,   226,    -1,    11,   228,    72,   226,
      -1,    12,   228,    72,   226,    -1,    56,    -1,    57,    -1,
      58,    -1,    59,    -1,    60,    -1,    61,    -1,   109,    -1,
     234,    -1,    -1,   223,    -1,   223,    72,   224,    -1,   224,
      -1,   227,    -1,   221,   116,   229,   117,    -1,   100,    -1,
     108,    -1,   100,    -1,   108,    -1,   226,    -1,   228,    -1,
     221,    -1,   235,    -1,    -1,   230,   231,    -1,   233,    -1,
     231,   129,   233,    -1,    -1,   231,    72,   232,   233,    -1,
     228,    -1,   228,    74,   228,    -1,    74,   228,    -1,   228,
      74,    -1,    96,    -1,    97,    -1,    98,    -1,    99,    -1,
     101,    -1,   105,    -1,   106,    -1,   104,    -1,   107,    -1,
      98,    -1,   104,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   386,   386,   390,   392,   395,   397,   398,   399,   400,
     401,   402,   403,   404,   407,   413,   421,   420,   426,   425,
     429,   431,   434,   436,   437,   438,   439,   440,   443,   443,
     447,   454,   457,   462,   461,   473,   475,   478,   496,   494,
     510,   512,   515,   517,   520,   522,   523,   526,   540,   558,
     563,   556,   573,   575,   576,   580,   579,   584,   586,   590,
     592,   589,   602,   604,   605,   609,   608,   615,   613,   645,
     647,   650,   652,   655,   657,   660,   662,   663,   666,   667,
     668,   669,   670,   671,   674,   680,   682,   687,   689,   691,
     695,   701,   703,   706,   708,   711,   713,   716,   719,   719,
     723,   725,   728,   730,   735,   733,   739,   744,   746,   748,
     752,   757,   756,   758,   758,   761,   763,   764,   768,   770,
     781,   785,   788,   789,   790,   793,   795,   798,   800,   803,
     810,   815,   823,   831,   833,   834,   835,   836,   836,   849,
     849,   851,   852,   852,   854,   854,   856,   857,   858,   859,
     860,   861,   862,   862,   865,   868,   869,   870,   871,   874,
     876,   877,   878,   881,   883,   884,   885,   886,   887,   890,
     900,   902,   903,   904,   905,   906,   907,   908,   909,   910,
     911,   912,   913,   915,   917,   919,   921,   923,   925,   927,
     929,   931,   933,   935,   937,   939,   941,   943,   945,   947,
     950,   957,   960,   962,   966,   968,   970,   973,   980,   979,
     988,   989,   992,   995,   997,   999,  1001,  1003,  1005,  1007,
    1009,  1011,  1013,  1015,  1017,  1021,  1029,  1030,  1034,  1035,
    1036,  1039,  1040,  1045,  1043,  1053,  1055,  1056,  1059,  1062,
    1066,  1068,  1071,  1074,  1076,  1078,  1080,  1082,  1086,  1088,
    1089,  1090,  1091,  1092,  1095,  1097,  1100,  1102,  1105,  1107,
    1110,  1112,  1120,  1122,  1125,  1127,  1130,  1132,  1135,  1137,
    1140,  1140,  1144,  1146,  1148,  1148,  1152,  1158,  1161,  1162,
    1165,  1167,  1168,  1169,  1170,  1173,  1175,  1176,  1177,  1180,
    1182
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
  "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", 
  "REG", "MACRO", "ENDM", "STRINGC", "INTC", "FLOATC", "USTRINGC", 
  "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", 
  "POINTY", "'='", "'['", "']'", "'('", "')'", "'!'", "'-'", "'~'", "'+'", 
  "'*'", "'/'", "'%'", "'&'", "'|'", "';'", "$accept", "program", 
  "compilation_units", "compilation_unit", "global", "constdef", "@1", 
  "pmc_const", "@2", "pasmcode", "pasmline", "pasm_inst", "@3", 
  "pasm_args", "emit", "@4", "opt_pasmcode", "class_namespace", "class", 
  "@5", "class_body", "member_decls", "member_decl", "field_decl", 
  "method_decl", "sub", "@6", "@7", "sub_params", "sub_param", "@8", 
  "sub_body", "pcc_sub", "@9", "@10", "pcc_params", "pcc_param", "@11", 
  "pcc_sub_call", "@12", "opt_label", "opt_invocant", "pcc_proto", 
  "pcc_sub_proto", "proto", "pcc_call", "pcc_args", "pcc_arg", 
  "pcc_results", "pcc_result", "@13", "begin_ret_or_yield", 
  "end_ret_or_yield", "pcc_ret", "@14", "pcc_returns", "pcc_return", 
  "pcc_return_many", "@15", "@16", "var_returns", "statements", 
  "helper_clear_state", "statement", "labels", "_labels", "label", 
  "instruction", "id_list", "labeled_inst", "@17", "@18", "@19", "@20", 
  "@21", "newsub", "type", "classname", "assignment", "@22", "op_assign", 
  "func_assign", "the_sub", "ptr", "sub_call", "@23", "arglist", "arg", 
  "targetlist", "if_statement", "relop", "target", "vars", "_vars", 
  "_var_or_i", "sub_label_op", "label_op", "var_or_i", "var", "keylist", 
  "@24", "_keylist", "@25", "key", "reg", "const", "string", 0
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
     141,   141,   143,   145,   144,   146,   146,   147,   149,   148,
     150,   150,   151,   151,   152,   152,   152,   153,   154,   156,
     157,   155,   158,   158,   158,   160,   159,   161,   161,   163,
     164,   162,   165,   165,   165,   167,   166,   169,   168,   170,
     170,   171,   171,   172,   172,   173,   173,   173,   174,   174,
     174,   174,   174,   174,   175,   175,   175,   175,   175,   175,
     175,   176,   176,   177,   177,   178,   178,   179,   180,   179,
     181,   181,   182,   182,   184,   183,   183,   185,   185,   185,
     186,   188,   187,   189,   187,   190,   190,   190,   191,   191,
     192,   193,   193,   193,   193,   194,   194,   195,   195,   196,
     197,   198,   198,   199,   199,   199,   199,   200,   199,   201,
     199,   199,   202,   199,   203,   199,   199,   199,   199,   199,
     199,   199,   204,   199,   199,   199,   199,   199,   199,   205,
     205,   205,   205,   206,   206,   206,   206,   206,   206,   207,
     208,   208,   208,   208,   208,   208,   208,   208,   208,   208,
     208,   208,   208,   208,   208,   208,   208,   208,   208,   208,
     208,   208,   208,   208,   208,   208,   208,   208,   208,   208,
     208,   208,   208,   208,   208,   208,   208,   208,   209,   208,
     208,   208,   210,   210,   210,   210,   210,   210,   210,   210,
     210,   210,   210,   210,   210,   211,   212,   212,   212,   212,
     212,   213,   213,   215,   214,   216,   216,   216,   217,   217,
     218,   218,   219,   219,   219,   219,   219,   219,   220,   220,
     220,   220,   220,   220,   221,   221,   222,   222,   223,   223,
     224,   224,   225,   225,   226,   226,   227,   227,   228,   228,
     230,   229,   231,   231,   232,   231,   233,   233,   233,   233,
     234,   234,   234,   234,   234,   235,   235,   235,   235,   236,
     236
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
       1,     1,     1,     1,     5,     3,     3,     3,     3,     5,
       5,     0,     3,     2,     2,     0,     3,     2,     0,     4,
       1,     1,     1,     1,     0,     5,     1,     0,     2,     3,
       2,     0,     5,     0,     5,     0,     1,     3,     1,     2,
       0,     2,     2,     1,     1,     0,     1,     2,     1,     1,
       3,     1,     3,     1,     1,     2,     2,     0,     4,     0,
       6,     1,     0,     6,     0,     4,     2,     2,     2,     2,
       2,     2,     0,     3,     2,     1,     1,     1,     0,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       3,     4,     4,     4,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     6,     6,     6,     7,     4,     4,     6,     7,     4,
       6,     4,     4,     4,     4,     6,     7,     3,     0,     9,
       1,     1,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     4,     1,     1,     3,     3,
       3,     1,     1,     0,     5,     0,     3,     1,     1,     2,
       3,     1,     6,     6,     4,     4,     4,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     0,     1,     3,     1,
       1,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       0,     2,     1,     3,     0,     4,     1,     3,     2,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,    49,    16,     0,    59,    33,     0,
       0,     2,     3,     8,     7,    11,     6,     5,     9,    10,
     270,    38,     0,     0,   163,   164,   165,   166,   167,   169,
       0,   168,     0,   125,    12,     1,     4,     0,     0,     0,
     262,   263,    75,     0,    14,    75,    18,   129,     0,    25,
      24,    27,   125,    20,     0,    26,    28,   126,   128,    37,
       0,   280,   281,   282,   283,   284,   287,   285,   286,   288,
     254,   268,   276,   271,   272,   255,   269,    41,    73,    74,
      80,    79,    81,    82,    83,    78,     0,    77,     0,     0,
       0,     0,    23,    21,    34,    75,     0,     0,   127,   278,
     279,   274,     0,    46,     0,     0,     0,    40,    42,    44,
      45,    50,     0,     0,    15,    60,     0,     0,    22,   256,
     277,     0,   273,     0,     0,    39,    43,    52,    76,    17,
      62,   264,   265,   266,     0,   267,    30,    29,   268,    32,
     257,   259,   260,   275,     0,     0,    53,   120,    63,   120,
       0,   270,     0,    47,    48,    55,     0,   124,   123,     0,
       0,   120,   125,   118,    65,     0,     0,    19,     0,   258,
       0,   122,    54,    51,   119,   158,   121,     0,    61,    64,
     261,     0,   144,     0,     0,     0,     0,     0,     0,   152,
       0,     0,   137,   139,   142,     0,     0,     0,     0,     0,
     100,   101,   226,   256,   141,   156,     0,   157,   106,     0,
     133,     0,   210,   211,   233,   155,   134,   227,     0,    56,
       0,   146,   150,   151,   148,     0,     0,     0,   256,   135,
     136,     0,     0,     0,   289,   290,     0,   147,   111,   149,
     113,     0,   154,   104,   130,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     232,   231,     0,   270,     0,    66,     0,     0,   248,   249,
     250,   251,   252,   253,     0,     0,     0,     0,     0,     0,
     153,     0,     0,     0,     0,   115,   115,    67,   107,     0,
     241,   235,   212,   213,   214,   215,   218,   219,   220,   221,
     217,   216,   222,   223,   224,     0,   159,   160,   161,   162,
       0,     0,   256,     0,     0,     0,     0,   207,   268,   170,
       0,   229,   230,   228,   145,   244,   246,     0,   245,   247,
       0,   204,   131,   138,     0,     0,   203,     0,   116,     0,
      91,     0,     0,     0,     0,     0,   237,   238,   195,   196,
     202,   201,   225,   171,   172,   173,   199,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   270,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   270,
       0,     0,     0,     0,   112,   114,    71,   108,     0,   102,
     103,   105,     0,   240,     0,   239,     0,   234,     0,   270,
       0,   270,     0,   179,   182,   183,   187,   177,   184,   185,
     186,   181,     0,   175,   190,   174,   176,   178,   180,   188,
     189,     0,   242,   243,   205,     0,   132,   140,   143,   117,
       0,     0,     0,     0,     0,   110,   109,     0,   227,   236,
     193,     0,   197,     0,   200,   191,   192,   206,    93,    94,
       0,     0,     0,     0,    69,    92,   235,   194,   198,    72,
       0,     0,     0,     0,    95,     0,     0,    85,     0,    86,
      88,     0,    87,     0,     0,    70,   209,     0,     0,     0,
      98,     0,    68,     0,    84,    90,    89,     0,    97,    96,
       0,    99
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    10,    11,    12,    13,    14,    23,    51,    91,    52,
      53,    96,    97,   137,    15,    33,    54,    16,    17,    39,
     106,   107,   108,   109,   110,    18,    22,   127,   147,   159,
     170,   160,    19,    32,   130,   149,   166,   177,   205,   340,
     464,   433,    85,    86,    87,   454,   386,   434,   474,   483,
     487,   206,   391,   207,   288,   341,   392,   208,   285,   286,
     337,   161,   162,   163,    56,    57,    58,   176,   333,   209,
     231,   232,   233,   220,   228,   316,    30,    31,   210,   211,
     212,   213,   214,   264,   215,   246,   345,   346,   289,   216,
     275,    71,   139,   140,   141,    42,   133,   142,   135,    37,
      38,    73,   121,    74,    75,    76,   236
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -219
static const short yypact[] =
{
      22,  -219,   -93,   -66,  -219,  -219,     3,  -219,  -219,    31,
      39,    22,  -219,  -219,  -219,  -219,  -219,  -219,  -219,  -219,
    -219,  -219,   -72,     3,  -219,  -219,  -219,  -219,  -219,  -219,
     -50,  -219,   -49,    12,  -219,  -219,  -219,   -57,   184,    58,
    -219,  -219,   227,   -20,   -13,   227,  -219,  -219,   115,  -219,
    -219,  -219,    62,  -219,    37,  -219,     4,    40,  -219,  -219,
     493,  -219,  -219,  -219,  -219,  -219,  -219,  -219,  -219,  -219,
    -219,  -219,    84,   -58,  -219,  -219,  -219,    21,  -219,  -219,
    -219,  -219,  -219,  -219,  -219,  -219,     5,  -219,    61,   239,
       7,    74,  -219,  -219,  -219,   227,   179,    76,  -219,  -219,
     493,  -219,   184,  -219,     3,    95,   168,    21,  -219,  -219,
    -219,  -219,   227,   239,  -219,  -219,   465,   -52,  -219,   465,
    -219,   184,  -219,    96,   100,  -219,  -219,   201,  -219,  -219,
     220,  -219,  -219,  -219,   110,  -219,  -219,  -219,   111,  -219,
     157,  -219,  -219,  -219,   233,   234,  -219,    -1,  -219,     2,
     136,  -219,   465,  -219,  -219,  -219,   241,  -219,  -219,   242,
     174,    83,    40,  -219,  -219,   202,   253,  -219,   170,  -219,
       3,  -219,  -219,  -219,  -219,   396,  -219,     3,  -219,  -219,
    -219,   186,   169,   -70,   -70,   493,   493,   493,   175,  -219,
     192,   194,  -219,   200,  -219,   -39,   493,   347,   193,    88,
    -219,  -219,  -219,   465,  -219,  -219,   316,  -219,  -219,   326,
    -219,   221,  -219,  -219,  -219,  -219,  -219,   263,   240,  -219,
       3,  -219,  -219,  -219,  -219,   109,   130,   269,   465,  -219,
    -219,     3,     3,     3,  -219,  -219,   235,  -219,  -219,  -219,
    -219,   344,  -219,  -219,  -219,   175,   236,   493,   493,   493,
     493,   493,   493,   493,   493,   493,   493,   493,   493,   493,
    -219,  -219,   422,  -219,    44,  -219,   251,   -70,  -219,  -219,
    -219,  -219,  -219,  -219,   -70,   493,   -70,   -70,   493,   493,
    -219,   255,   256,   257,   493,   493,   493,  -219,  -219,   -51,
    -219,    30,  -219,  -219,  -219,  -219,  -219,  -219,  -219,  -219,
    -219,  -219,  -219,  -219,  -219,   479,  -219,  -219,  -219,  -219,
     -39,   258,   465,   493,   493,   493,   259,  -219,    89,   432,
     244,  -219,  -219,  -219,  -219,  -219,  -219,   345,  -219,  -219,
     355,   -40,  -219,   293,   252,   254,  -219,   -41,  -219,   -24,
    -219,     8,   175,   261,   175,   -11,  -219,  -219,    43,    46,
    -219,  -219,  -219,  -219,  -219,  -219,   294,   493,   493,   493,
     493,   493,   493,   493,   493,   493,  -219,   493,   493,   493,
     493,   493,   493,   493,   493,   265,   -70,   -70,   493,  -219,
     268,   239,   239,   493,  -219,  -219,     6,  -219,   493,  -219,
    -219,  -219,   366,  -219,   135,  -219,    30,  -219,   493,  -219,
     493,  -219,   272,  -219,  -219,  -219,  -219,  -219,  -219,  -219,
    -219,  -219,   264,  -219,  -219,  -219,  -219,  -219,  -219,  -219,
    -219,   493,  -219,  -219,  -219,   266,  -219,  -219,  -219,  -219,
     493,   175,   493,    94,   369,  -219,  -219,   270,    92,  -219,
    -219,   267,  -219,   273,  -219,  -219,  -219,  -219,  -219,  -219,
     370,   493,   493,   155,    40,  -219,    30,  -219,  -219,  -219,
      14,   378,    15,    25,  -219,   382,     1,  -219,   493,  -219,
    -219,   493,  -219,   493,    -7,  -219,  -219,   383,   385,   387,
    -219,   175,  -219,   388,  -219,  -219,  -219,     3,  -219,  -219,
     295,  -219
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -219,  -219,  -219,   386,  -219,  -219,  -219,   218,  -219,  -219,
     348,  -219,  -219,  -218,  -219,  -219,  -219,    11,  -219,  -219,
    -219,  -219,   299,  -219,  -219,  -219,  -219,  -219,  -219,  -219,
    -219,   260,  -219,  -219,  -219,  -219,  -219,  -219,  -219,  -219,
    -219,  -219,   203,   -28,   298,  -219,  -219,  -219,  -219,  -219,
    -219,  -219,  -219,  -219,  -219,  -219,  -219,  -219,  -219,  -219,
     125,  -219,  -219,   262,   271,  -219,   -56,  -219,  -219,  -219,
    -219,  -219,  -219,  -219,  -219,  -219,   -23,   114,  -219,  -219,
    -219,  -219,    20,  -219,   159,  -219,   -34,    28,  -219,  -219,
     204,   -82,   224,  -219,   276,   167,  -178,   318,   -36,  -138,
    -219,  -219,  -219,     9,   275,   -86,   126
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -228
static const short yytable[] =
{
      43,    98,    72,   114,   155,   222,   223,   164,   -31,   111,
     280,   115,   387,   168,   101,   430,   431,    90,   467,   470,
     112,   342,   480,    20,    99,   103,     1,   129,    40,   472,
     131,   383,   378,     2,    21,    34,    41,   138,   132,    35,
     344,   136,    46,     2,    55,     3,   104,   105,   383,     4,
      44,    45,     5,    24,    25,    26,    27,    28,   481,   234,
      59,   396,    77,    55,   120,   235,    72,   117,   343,   482,
     138,   102,   -57,   396,   388,   -57,   379,   112,   384,   112,
      88,   123,    95,     2,     6,    72,   468,   471,   389,   325,
     390,   432,    46,   217,   352,   385,   326,   473,   328,   329,
       7,   156,    89,    29,   156,    47,   227,   -35,   397,   157,
     158,   122,   157,   158,    48,   398,     8,   267,   400,    92,
     476,   138,    49,    50,     9,   320,    61,    62,    63,    64,
     143,    65,    94,    47,    66,    67,    68,    69,   276,    70,
      61,    62,    63,    64,    40,    65,   138,   181,   321,   224,
     225,   226,    41,    70,   218,    47,   -58,   -36,   100,   399,
     237,   239,   401,   290,    48,   268,   269,   270,   271,   272,
     273,   451,    49,    50,    78,    79,   113,   452,   453,   116,
     318,   274,   322,   118,   119,   156,   268,   269,   270,   271,
     272,   273,   125,   157,   158,   124,   144,   266,   422,   423,
     145,   260,   277,   261,   260,   146,   261,  -227,   281,   282,
     283,   292,   293,   294,   295,   296,   297,   298,   299,   300,
     301,   302,   303,   304,   148,   150,   319,   151,   412,   152,
     138,    61,    62,    63,    64,   202,    65,   153,   154,   327,
     167,   425,   330,   331,    70,   171,   172,   173,   336,   338,
     338,    61,    62,    63,    64,   347,    65,   179,    60,   462,
     393,   441,   395,   443,    70,    61,    62,    63,    64,   349,
      65,    61,    62,    63,    64,   178,    65,   353,   354,   355,
      61,    62,    63,    64,    70,    65,   219,   180,    66,    67,
      68,    69,   229,    70,   230,   427,   428,   247,   248,   249,
     250,   251,   252,   253,   254,   -18,   255,   256,   257,   258,
     259,   240,   438,    78,    79,    80,    81,    82,    83,    84,
     243,   403,   404,   405,   406,   407,   408,   409,   410,   411,
     244,   413,   414,   415,   416,   417,   418,   419,   420,   245,
     265,   279,   424,    66,    67,    68,    69,   429,   287,   449,
     284,   324,   435,   376,   291,   332,   334,   335,   351,   356,
     347,   375,   440,   377,   442,   380,   402,   381,   426,   382,
     436,   463,   444,   455,   459,   260,   394,   261,   262,   263,
     421,   445,   469,   447,   457,   446,   475,   484,   456,   485,
     458,   486,   489,   204,   448,   491,   450,    36,   465,   488,
      93,   182,   241,   183,   184,   185,   126,   186,   187,   165,
     128,   339,   188,   189,   437,   460,   461,   190,   191,   348,
     347,   317,   466,   174,   439,   192,   193,   242,   169,   194,
     278,   323,   477,   175,   134,   478,   350,   479,   305,   306,
     307,   308,   309,    61,    62,    63,    64,     0,    65,     0,
       0,    66,    67,    68,    69,     0,    70,   221,     0,   195,
       0,   196,   197,   198,   490,   238,     0,     0,     0,     0,
       0,   199,     0,     0,   357,   200,     0,   201,     0,     0,
     358,   359,     0,     0,     0,   310,   311,   360,     0,     0,
       0,     0,    61,    62,    63,    64,   202,    65,     0,     0,
     361,   362,   363,   364,   203,    70,     0,     0,     0,     0,
       0,     0,     0,     0,  -208,     0,     0,     0,    61,    62,
      63,    64,   202,    65,     0,     0,    66,    67,    68,    69,
     312,    70,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   313,   314,   315,   365,     0,     0,   366,     0,
       0,     0,     0,   367,   368,   369,   370,   371,   372,   373,
     374,    61,    62,    63,    64,   131,    65,     0,     0,    66,
      67,    68,    69,   132,    70,    61,    62,    63,    64,    29,
      65,     0,     0,    66,    67,    68,    69,     0,    70,    61,
      62,    63,    64,     0,    65,     0,     0,    66,    67,    68,
      69,     0,    70
};

static const short yycheck[] =
{
      23,    57,    38,    89,     5,   183,   184,     5,     4,     4,
     228,     4,     4,   151,    72,     9,    10,    45,     4,     4,
      72,    72,    29,   116,    60,     4,     4,   113,   100,     4,
     100,    72,    72,    21,   100,     4,   108,   119,   108,     0,
      10,    93,    30,    21,    33,    23,    25,    26,    72,    27,
     100,   100,    30,    50,    51,    52,    53,    54,    65,    98,
     117,    72,     4,    52,   100,   104,   102,    95,   119,    76,
     152,   129,    73,    72,    66,    73,   116,    72,   119,    72,
     100,   104,    78,    21,    62,   121,    72,    72,    80,   267,
      82,    85,    30,   175,   312,   119,   274,    72,   276,   277,
      78,   102,   115,   100,   102,    93,   188,    95,   119,   110,
     111,   102,   110,   111,   102,    72,    94,     8,    72,     4,
     119,   203,   110,   111,   102,   263,    96,    97,    98,    99,
     121,   101,    95,    93,   104,   105,   106,   107,     8,   109,
      96,    97,    98,    99,   100,   101,   228,   170,   104,   185,
     186,   187,   108,   109,   177,    93,    73,    95,    74,   116,
     196,   197,   116,   245,   102,    56,    57,    58,    59,    60,
      61,    77,   110,   111,    86,    87,   115,    83,    84,   105,
     262,    72,   264,     4,   108,   102,    56,    57,    58,    59,
      60,    61,    24,   110,   111,   100,   100,   220,   376,   377,
     100,   112,    72,   114,   112,     4,   114,   118,   231,   232,
     233,   247,   248,   249,   250,   251,   252,   253,   254,   255,
     256,   257,   258,   259,     4,   115,   262,   116,   366,    72,
     312,    96,    97,    98,    99,   100,   101,     4,     4,   275,
     104,   379,   278,   279,   109,     4,     4,    73,   284,   285,
     286,    96,    97,    98,    99,   291,   101,     4,    74,   104,
     342,   399,   344,   401,   109,    96,    97,    98,    99,   305,
     101,    96,    97,    98,    99,    73,   101,   313,   314,   315,
      96,    97,    98,    99,   109,   101,   100,   117,   104,   105,
     106,   107,   100,   109,   100,   381,   382,    34,    35,    36,
      37,    38,    39,    40,    41,   105,    43,    44,    45,    46,
      47,   118,   394,    86,    87,    88,    89,    90,    91,    92,
       4,   357,   358,   359,   360,   361,   362,   363,   364,   365,
       4,   367,   368,   369,   370,   371,   372,   373,   374,   118,
     100,    72,   378,   104,   105,   106,   107,   383,     4,   431,
     115,   100,   388,     8,   118,   100,   100,   100,   100,   100,
     396,   117,   398,     8,   400,    72,    72,   115,   100,   115,
       4,   453,   100,     4,     4,   112,   115,   114,   115,   116,
     115,   117,     4,   117,   117,   421,     4,     4,   118,     4,
     117,     4,     4,   175,   430,   100,   432,    11,   454,   481,
      52,     5,   199,     7,     8,     9,   107,    11,    12,   149,
     112,   286,    16,    17,   394,   451,   452,    21,    22,   305,
     456,   262,   456,   161,   396,    29,    30,   203,   152,    33,
     226,   264,   468,   162,   116,   471,   310,   473,    16,    17,
      18,    19,    20,    96,    97,    98,    99,    -1,   101,    -1,
      -1,   104,   105,   106,   107,    -1,   109,   182,    -1,    63,
      -1,    65,    66,    67,   487,   118,    -1,    -1,    -1,    -1,
      -1,    75,    -1,    -1,    42,    79,    -1,    81,    -1,    -1,
      48,    49,    -1,    -1,    -1,    63,    64,    55,    -1,    -1,
      -1,    -1,    96,    97,    98,    99,   100,   101,    -1,    -1,
      68,    69,    70,    71,   108,   109,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   118,    -1,    -1,    -1,    96,    97,
      98,    99,   100,   101,    -1,    -1,   104,   105,   106,   107,
     108,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   120,   121,   122,   113,    -1,    -1,   116,    -1,
      -1,    -1,    -1,   121,   122,   123,   124,   125,   126,   127,
     128,    96,    97,    98,    99,   100,   101,    -1,    -1,   104,
     105,   106,   107,   108,   109,    96,    97,    98,    99,   100,
     101,    -1,    -1,   104,   105,   106,   107,    -1,   109,    96,
      97,    98,    99,    -1,   101,    -1,    -1,   104,   105,   106,
     107,    -1,   109
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    21,    23,    27,    30,    62,    78,    94,   102,
     131,   132,   133,   134,   135,   144,   147,   148,   155,   162,
     116,   100,   156,   136,    50,    51,    52,    53,    54,   100,
     206,   207,   163,   145,     4,     0,   133,   229,   230,   149,
     100,   108,   225,   206,   100,   100,    30,    93,   102,   110,
     111,   137,   139,   140,   146,   147,   194,   195,   196,   117,
      74,    96,    97,    98,    99,   101,   104,   105,   106,   107,
     109,   221,   228,   231,   233,   234,   235,     4,    86,    87,
      88,    89,    90,    91,    92,   172,   173,   174,   100,   115,
     173,   138,     4,   140,    95,    78,   141,   142,   196,   228,
      74,    72,   129,     4,    25,    26,   150,   151,   152,   153,
     154,     4,    72,   115,   235,     4,   105,   173,     4,   108,
     228,   232,   233,   206,   100,    24,   152,   157,   174,   235,
     164,   100,   108,   226,   227,   228,    93,   143,   221,   222,
     223,   224,   227,   233,   100,   100,     4,   158,     4,   165,
     115,   116,    72,     4,     4,     5,   102,   110,   111,   159,
     161,   191,   192,   193,     5,   161,   166,   104,   229,   224,
     160,     4,     4,    73,   193,   194,   197,   167,    73,     4,
     117,   206,     5,     7,     8,     9,    11,    12,    16,    17,
      21,    22,    29,    30,    33,    63,    65,    66,    67,    75,
      79,    81,   100,   108,   137,   168,   181,   183,   187,   199,
     208,   209,   210,   211,   212,   214,   219,   221,   206,   100,
     203,   234,   226,   226,   228,   228,   228,   221,   204,   100,
     100,   200,   201,   202,    98,   104,   236,   228,   118,   228,
     118,   172,   222,     4,     4,   118,   215,    34,    35,    36,
      37,    38,    39,    40,    41,    43,    44,    45,    46,    47,
     112,   114,   115,   116,   213,   100,   206,     8,    56,    57,
      58,    59,    60,    61,    72,   220,     8,    72,   220,    72,
     143,   206,   206,   206,   115,   188,   189,     4,   184,   218,
     221,   118,   228,   228,   228,   228,   228,   228,   228,   228,
     228,   228,   228,   228,   228,    16,    17,    18,    19,    20,
      63,    64,   108,   120,   121,   122,   205,   214,   221,   228,
     229,   104,   221,   225,   100,   226,   226,   228,   226,   226,
     228,   228,   100,   198,   100,   100,   228,   190,   228,   190,
     169,   185,    72,   119,    10,   216,   217,   228,   207,   228,
     236,   100,   143,   228,   228,   228,   100,    42,    48,    49,
      55,    68,    69,    70,    71,   113,   116,   121,   122,   123,
     124,   125,   126,   127,   128,   117,     8,     8,    72,   116,
      72,   115,   115,    72,   119,   119,   176,     4,    66,    80,
      82,   182,   186,   221,   115,   221,    72,   119,    72,   116,
      72,   116,    72,   228,   228,   228,   228,   228,   228,   228,
     228,   228,   229,   228,   228,   228,   228,   228,   228,   228,
     228,   115,   226,   226,   228,   229,   100,   235,   235,   228,
       9,    10,    85,   171,   177,   228,     4,   212,   221,   217,
     228,   229,   228,   229,   100,   117,   228,   117,   228,   221,
     228,    77,    83,    84,   175,     4,   118,   117,   117,     4,
     228,   228,   104,   221,   170,   196,   216,     4,    72,     4,
       4,    72,     4,    72,   178,     4,   119,   228,   228,   228,
      29,    65,    76,   179,     4,     4,     4,   180,   221,     4,
     206,   100
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
#line 387 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 396 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 397 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 398 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 399 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 9:
#line 400 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 401 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 402 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 12:
#line 403 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 13:
#line 404 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 409 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 414 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 16:
#line 421 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 17:
#line 422 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 18:
#line 426 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 19:
#line 427 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 22:
#line 435 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 436 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 437 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 25:
#line 438 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 26:
#line 439 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 28:
#line 443 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 29:
#line 445 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 30:
#line 448 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, cur_unit);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 31:
#line 454 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 33:
#line 462 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; }
    break;

  case 34:
#line 465 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 37:
#line 480 "imcc/imcc.y"
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
#line 496 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 39:
#line 503 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 41:
#line 512 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 46:
#line 523 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 47:
#line 528 "imcc/imcc.y"
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
#line 542 "imcc/imcc.y"
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
#line 558 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 50:
#line 563 "imcc/imcc.y"
    {
          Instruction *i = iSUBROUTINE(cur_unit, yyvsp[-2].sr);
          i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
          add_namespace(interp, cur_unit);
          i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
        }
    break;

  case 51:
#line 570 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 52:
#line 574 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 53:
#line 575 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 54:
#line 576 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 55:
#line 580 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 56:
#line 581 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 59:
#line 590 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 60:
#line 592 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
            add_namespace(interp, cur_unit);
            i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
         }
    break;

  case 61:
#line 599 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 62:
#line 603 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 63:
#line 604 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 64:
#line 605 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 65:
#line 609 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 66:
#line 610 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 67:
#line 615 "imcc/imcc.y"
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
#line 642 "imcc/imcc.y"
    { yyval.i = 0; current_call = NULL; }
    break;

  case 69:
#line 646 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 0; }
    break;

  case 70:
#line 647 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 1; }
    break;

  case 71:
#line 651 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 72:
#line 653 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 73:
#line 656 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 74:
#line 657 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 75:
#line 661 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 76:
#line 662 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 77:
#line 663 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 79:
#line 667 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 80:
#line 668 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 81:
#line 669 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 82:
#line 670 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 83:
#line 671 "imcc/imcc.y"
    {  yyval.t = P_METHOD | P_NONE ; }
    break;

  case 84:
#line 676 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 85:
#line 681 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 86:
#line 683 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-1].sr);
            current_call->r[0]->pcc_sub->nci = 1;
         }
    break;

  case 87:
#line 688 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 88:
#line 690 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-1].s,'S')); }
    break;

  case 89:
#line 692 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 90:
#line 696 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-3].s,'S'));
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 91:
#line 702 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 92:
#line 703 "imcc/imcc.y"
    {  add_pcc_arg(current_call->r[0], yyvsp[-1].sr);}
    break;

  case 93:
#line 707 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 94:
#line 708 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 95:
#line 712 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 96:
#line 713 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 97:
#line 718 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 98:
#line 719 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 99:
#line 720 "imcc/imcc.y"
    {  mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 100:
#line 724 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 101:
#line 725 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 104:
#line 735 "imcc/imcc.y"
    { begin_return_or_yield(yyvsp[-1].t); }
    break;

  case 105:
#line 738 "imcc/imcc.y"
    { yyval.i = 0;  asm_state = AsmDefault; }
    break;

  case 106:
#line 739 "imcc/imcc.y"
    { asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 107:
#line 745 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 108:
#line 747 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(sr_return, yyvsp[-1].sr); }
    break;

  case 109:
#line 749 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(sr_return, yyvsp[-1].sr); }
    break;

  case 110:
#line 753 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 111:
#line 757 "imcc/imcc.y"
    {  if(asm_state == AsmDefault)   begin_return_or_yield(0); }
    break;

  case 112:
#line 757 "imcc/imcc.y"
    { asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 113:
#line 758 "imcc/imcc.y"
    {  if(asm_state == AsmDefault)   begin_return_or_yield(1); }
    break;

  case 114:
#line 758 "imcc/imcc.y"
    { asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 115:
#line 762 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 116:
#line 763 "imcc/imcc.y"
    {  add_pcc_return(sr_return, yyvsp[0].sr);    }
    break;

  case 117:
#line 764 "imcc/imcc.y"
    {  add_pcc_return(sr_return, yyvsp[0].sr);    }
    break;

  case 120:
#line 782 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 121:
#line 787 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 122:
#line 788 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 123:
#line 789 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 124:
#line 790 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 125:
#line 794 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 129:
#line 804 "imcc/imcc.y"
    {
                     /* $$ = iLABEL(cur_unit, mk_address(, U_add_uniq_label)); */
                     yyval.i = iLABEL(cur_unit, mk_local_label(cur_unit, yyvsp[0].s));
                   }
    break;

  case 130:
#line 812 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 131:
#line 816 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 132:
#line 824 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 135:
#line 834 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 136:
#line 835 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 137:
#line 836 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 138:
#line 837 "imcc/imcc.y"
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

  case 139:
#line 849 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 140:
#line 850 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 142:
#line 852 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 143:
#line 853 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 144:
#line 854 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 145:
#line 854 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 146:
#line 856 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 147:
#line 857 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 148:
#line 858 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 149:
#line 859 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 150:
#line 860 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 151:
#line 861 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 152:
#line 862 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 153:
#line 864 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 154:
#line 866 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 155:
#line 868 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 156:
#line 869 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 158:
#line 871 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 159:
#line 875 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 160:
#line 876 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 161:
#line 877 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 162:
#line 878 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 163:
#line 882 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 164:
#line 883 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 165:
#line 884 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 166:
#line 885 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 167:
#line 886 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 168:
#line 887 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 169:
#line 892 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 170:
#line 901 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 171:
#line 902 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 172:
#line 903 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 173:
#line 904 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 174:
#line 905 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 175:
#line 906 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 176:
#line 907 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 177:
#line 908 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 178:
#line 909 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 179:
#line 910 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 180:
#line 911 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 181:
#line 912 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 182:
#line 914 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 183:
#line 916 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 918 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 185:
#line 920 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 922 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 187:
#line 924 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 926 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 189:
#line 928 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 930 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 191:
#line 932 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 192:
#line 934 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 193:
#line 936 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 194:
#line 938 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 195:
#line 940 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 196:
#line 942 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 944 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 946 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 199:
#line 948 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                          mk_sub_address(yyvsp[0].s), NULL, 1); }
    break;

  case 200:
#line 951 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(yyvsp[-2].s),
                                           mk_sub_address(yyvsp[0].s), 1); }
    break;

  case 201:
#line 958 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                    2, yyvsp[-3].sr, mk_label_address(cur_unit, yyvsp[0].s)); }
    break;

  case 202:
#line 961 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 203:
#line 963 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 204:
#line 967 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 969 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 971 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 207:
#line 974 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 208:
#line 980 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 209:
#line 984 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 212:
#line 994 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 213:
#line 996 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 214:
#line 998 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 215:
#line 1000 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 216:
#line 1002 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 1004 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 218:
#line 1006 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1008 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 220:
#line 1010 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 221:
#line 1012 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 222:
#line 1014 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 223:
#line 1016 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 1018 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 1023 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 226:
#line 1029 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 227:
#line 1030 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                          fataly(1, sourcefile, line, "Sub isn't a PMC");
                     }
    break;

  case 228:
#line 1034 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 229:
#line 1035 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 230:
#line 1036 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 231:
#line 1039 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 232:
#line 1040 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 233:
#line 1045 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 234:
#line 1050 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 235:
#line 1054 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 236:
#line 1055 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 237:
#line 1056 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 238:
#line 1061 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 239:
#line 1063 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 240:
#line 1067 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 241:
#line 1068 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 242:
#line 1073 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 243:
#line 1075 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 244:
#line 1077 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 245:
#line 1079 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 246:
#line 1081 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 247:
#line 1083 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 248:
#line 1087 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 249:
#line 1088 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 250:
#line 1089 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 251:
#line 1090 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 252:
#line 1091 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 253:
#line 1092 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 256:
#line 1101 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 257:
#line 1102 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 258:
#line 1106 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 260:
#line 1111 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 261:
#line 1113 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 262:
#line 1121 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 263:
#line 1122 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 264:
#line 1126 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 265:
#line 1127 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 270:
#line 1140 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 271:
#line 1141 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); }
    break;

  case 272:
#line 1145 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 273:
#line 1147 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 274:
#line 1148 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 275:
#line 1149 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 276:
#line 1153 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 277:
#line 1159 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 278:
#line 1161 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 279:
#line 1162 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 280:
#line 1166 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 281:
#line 1167 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 282:
#line 1168 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 283:
#line 1169 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 284:
#line 1170 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 285:
#line 1174 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 286:
#line 1175 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 287:
#line 1176 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 288:
#line 1177 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'U'); }
    break;

  case 289:
#line 1181 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 290:
#line 1182 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3428 "imcc/imcparser.c"

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


#line 1187 "imcc/imcc.y"



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

