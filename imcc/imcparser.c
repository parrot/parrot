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
     POW = 321,
     SHIFT_RIGHT_U = 322,
     LOG_AND = 323,
     LOG_OR = 324,
     COMMA = 325,
     ESUB = 326,
     DOTDOT = 327,
     PCC_BEGIN = 328,
     PCC_END = 329,
     PCC_CALL = 330,
     PCC_SUB = 331,
     PCC_BEGIN_RETURN = 332,
     PCC_END_RETURN = 333,
     PCC_BEGIN_YIELD = 334,
     PCC_END_YIELD = 335,
     NCI_CALL = 336,
     METH_CALL = 337,
     INVOCANT = 338,
     PROTOTYPED = 339,
     NON_PROTOTYPED = 340,
     MAIN = 341,
     LOAD = 342,
     IMMEDIATE = 343,
     POSTCOMP = 344,
     METHOD = 345,
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
#define POW 321
#define SHIFT_RIGHT_U 322
#define LOG_AND 323
#define LOG_OR 324
#define COMMA 325
#define ESUB 326
#define DOTDOT 327
#define PCC_BEGIN 328
#define PCC_END 329
#define PCC_CALL 330
#define PCC_SUB 331
#define PCC_BEGIN_RETURN 332
#define PCC_END_RETURN 333
#define PCC_BEGIN_YIELD 334
#define PCC_END_YIELD 335
#define NCI_CALL 336
#define METH_CALL 337
#define INVOCANT 338
#define PROTOTYPED 339
#define NON_PROTOTYPED 340
#define MAIN 341
#define LOAD 342
#define IMMEDIATE 343
#define POSTCOMP 344
#define METHOD 345
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
#line 286 "imcc/imcc.y"
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
#line 593 "imcc/imcparser.c"
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
#line 614 "imcc/imcparser.c"

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
#define YYLAST   536

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  129
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  102
/* YYNRULES -- Number of rules. */
#define YYNRULES  278
/* YYNRULES -- Number of states. */
#define YYNSTATES  479

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
       2,     2,     2,   117,     2,     2,     2,   123,   124,     2,
     126,   127,   121,   120,     2,   118,     2,   122,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   128,
       2,   114,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   115,     2,   116,     2,     2,     2,     2,     2,     2,
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
     106,   107,   108,   109,   110,   111,   112,   113
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
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
     264,   267,   270,   271,   275,   278,   279,   284,   285,   291,
     292,   298,   299,   302,   306,   309,   311,   314,   315,   318,
     321,   323,   325,   326,   328,   331,   333,   335,   339,   341,
     345,   347,   349,   352,   355,   356,   361,   362,   369,   371,
     372,   379,   380,   385,   388,   391,   394,   397,   400,   403,
     404,   408,   411,   413,   415,   417,   419,   420,   422,   424,
     426,   428,   430,   432,   434,   436,   438,   440,   442,   446,
     451,   456,   461,   467,   473,   479,   485,   491,   497,   503,
     509,   515,   521,   527,   533,   539,   545,   551,   557,   563,
     570,   577,   584,   592,   597,   602,   609,   617,   622,   629,
     634,   639,   644,   649,   656,   664,   668,   669,   679,   681,
     683,   687,   691,   695,   699,   703,   707,   711,   715,   719,
     723,   727,   731,   735,   740,   742,   744,   748,   752,   756,
     758,   760,   761,   767,   768,   772,   774,   776,   779,   783,
     785,   792,   799,   804,   809,   814,   819,   821,   823,   825,
     827,   829,   831,   833,   835,   836,   838,   842,   844,   846,
     851,   853,   855,   857,   859,   861,   863,   865,   867,   868,
     871,   873,   877,   878,   883,   885,   889,   892,   895,   897,
     899,   901,   903,   905,   907,   909,   911,   913,   915
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     130,     0,    -1,   131,    -1,   132,    -1,   131,   132,    -1,
     146,    -1,   145,    -1,   134,    -1,   133,    -1,   153,    -1,
     160,    -1,   143,    -1,   101,     4,    -1,     4,    -1,    62,
     200,    99,    -1,    62,   200,    99,   114,   229,    -1,    -1,
      30,   135,   200,    99,   114,   229,    -1,    -1,    30,   137,
     104,   221,   114,   103,    -1,   139,    -1,   138,   139,    -1,
     188,   140,     4,    -1,   101,     4,    -1,   110,    -1,   109,
      -1,   145,    -1,   136,    -1,    -1,   141,   107,   142,    -1,
      77,   171,    92,    -1,    -1,   216,    -1,    -1,    93,   144,
     138,    94,    -1,    21,   115,   223,   116,    -1,    -1,    23,
      99,   147,     4,   148,    24,    -1,   149,    -1,    -1,   150,
      -1,   149,   150,    -1,   151,    -1,   152,    -1,     4,    -1,
      25,   200,    99,     4,    -1,    26,    99,    99,     4,    -1,
      -1,    -1,    27,   154,   219,   171,     4,   155,   156,   159,
      -1,    -1,     4,    -1,   156,   157,     4,    -1,    -1,     5,
     158,   200,    99,    -1,   185,    72,    -1,    -1,    -1,    77,
     161,    99,   171,     4,   162,   163,   159,    -1,    -1,     4,
      -1,   163,   164,     4,    -1,    -1,     5,   165,   200,    99,
      -1,    -1,    74,   170,     4,   167,   174,   169,   173,   168,
     176,    75,    -1,    -1,   190,     4,    -1,    -1,    84,   222,
       4,    -1,    85,    -1,    86,    -1,    -1,   171,    71,   172,
      -1,   172,    -1,   170,    -1,    88,    -1,    87,    -1,    89,
      -1,    90,    -1,    91,    -1,    76,   222,    71,   222,     4,
      -1,    76,   222,     4,    -1,    82,   222,     4,    -1,    83,
     215,     4,    -1,    83,   103,     4,    -1,    83,   215,    71,
     222,     4,    -1,    83,   103,    71,   222,     4,    -1,    -1,
     174,   175,     4,    -1,     9,   222,    -1,    10,   215,    -1,
      -1,   176,   177,     4,    -1,    65,   215,    -1,    -1,    29,
     178,   200,    99,    -1,    -1,    78,     4,   180,   183,    79,
      -1,    -1,    80,     4,   182,   183,    81,    -1,    -1,   183,
       4,    -1,   183,   184,     4,    -1,    66,   222,    -1,   187,
      -1,   185,   187,    -1,    -1,   186,   191,    -1,   101,     4,
      -1,   110,    -1,   109,    -1,    -1,   189,    -1,   189,   190,
      -1,   190,    -1,    92,    -1,   188,   193,     4,    -1,    99,
      -1,   192,    71,    99,    -1,   202,    -1,   213,    -1,    21,
      99,    -1,    22,    99,    -1,    -1,    29,   194,   200,   192,
      -1,    -1,    30,   195,   200,    99,   114,   229,    -1,   136,
      -1,    -1,    33,   196,   200,    99,   114,   229,    -1,    -1,
       5,   197,   200,    99,    -1,     5,   228,    -1,    65,   222,
      -1,     9,   222,    -1,    66,   222,    -1,     7,   220,    -1,
       8,   220,    -1,    -1,    17,   198,   142,    -1,   107,   216,
      -1,   208,    -1,   166,    -1,   179,    -1,   181,    -1,    -1,
      17,    -1,    18,    -1,    19,    -1,    20,    -1,    50,    -1,
      51,    -1,    52,    -1,    53,    -1,    54,    -1,   201,    -1,
      99,    -1,   215,   114,   222,    -1,   215,   114,   117,   222,
      -1,   215,   114,   118,   222,    -1,   215,   114,   119,   222,
      -1,   215,   114,   222,   120,   222,    -1,   215,   114,   222,
     118,   222,    -1,   215,   114,   222,   121,   222,    -1,   215,
     114,   222,    67,   222,    -1,   215,   114,   222,   122,   222,
      -1,   215,   114,   222,    42,   222,    -1,   215,   114,   222,
     123,   222,    -1,   215,   114,   222,   112,   222,    -1,   215,
     114,   222,    48,   222,    -1,   215,   114,   222,    49,   222,
      -1,   215,   114,   222,    68,   222,    -1,   215,   114,   222,
      69,   222,    -1,   215,   114,   222,    70,   222,    -1,   215,
     114,   222,    55,   222,    -1,   215,   114,   222,   124,   222,
      -1,   215,   114,   222,   125,   222,    -1,   215,   114,   222,
     119,   222,    -1,   215,   114,   222,   115,   223,   116,    -1,
     215,   115,   223,   116,   114,   222,    -1,   215,   114,    16,
     201,    71,   222,    -1,   215,   114,    16,   201,   115,   223,
     116,    -1,   215,   114,    16,   201,    -1,   215,   114,    16,
     222,    -1,   215,   114,    16,   222,    71,   222,    -1,   215,
     114,    16,   222,   115,   223,   116,    -1,   215,   114,   199,
      99,    -1,   215,   114,   199,    99,    71,    99,    -1,   215,
     114,    64,    99,    -1,   215,   114,    63,   230,    -1,    63,
     230,   114,   222,    -1,    16,   215,    71,   222,    -1,    16,
     215,    71,   222,    71,   222,    -1,    16,   215,    71,   222,
     115,   223,   116,    -1,   215,   114,   208,    -1,    -1,   203,
     126,   212,   127,   114,   206,   126,   210,   127,    -1,   204,
      -1,   205,    -1,   215,    34,   222,    -1,   215,    35,   222,
      -1,   215,    36,   222,    -1,   215,    37,   222,    -1,   215,
      44,   222,    -1,   215,    43,   222,    -1,   215,    38,   222,
      -1,   215,    39,   222,    -1,   215,    40,   222,    -1,   215,
      41,   222,    -1,   215,    45,   222,    -1,   215,    46,   222,
      -1,   215,    47,   222,    -1,   215,   114,   107,   142,    -1,
      99,    -1,   215,    -1,   215,   207,   219,    -1,   215,   207,
     103,    -1,   215,   207,   215,    -1,   113,    -1,   111,    -1,
      -1,   206,   209,   126,   210,   127,    -1,    -1,   210,    71,
     211,    -1,   211,    -1,   222,    -1,    10,   215,    -1,   212,
      71,   215,    -1,   215,    -1,    11,   222,   214,   222,     8,
     220,    -1,    12,   222,   214,   222,     8,   220,    -1,    11,
     222,     8,   220,    -1,    12,   222,     8,   220,    -1,    11,
     222,    71,   220,    -1,    12,   222,    71,   220,    -1,    56,
      -1,    57,    -1,    58,    -1,    59,    -1,    60,    -1,    61,
      -1,   108,    -1,   228,    -1,    -1,   217,    -1,   217,    71,
     218,    -1,   218,    -1,   221,    -1,   215,   115,   223,   116,
      -1,    99,    -1,   107,    -1,    99,    -1,   107,    -1,   220,
      -1,   222,    -1,   215,    -1,   229,    -1,    -1,   224,   225,
      -1,   227,    -1,   225,   128,   227,    -1,    -1,   225,    71,
     226,   227,    -1,   222,    -1,   222,    73,   222,    -1,    73,
     222,    -1,   222,    73,    -1,    95,    -1,    96,    -1,    97,
      -1,    98,    -1,   100,    -1,   104,    -1,   105,    -1,   103,
      -1,   106,    -1,    97,    -1,   103,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   363,   363,   367,   369,   372,   374,   375,   376,   377,
     378,   379,   380,   381,   384,   390,   398,   397,   403,   402,
     406,   408,   411,   413,   414,   415,   416,   417,   420,   420,
     424,   431,   434,   439,   438,   450,   459,   457,   473,   475,
     478,   480,   483,   485,   486,   489,   503,   521,   526,   519,
     536,   538,   539,   543,   542,   547,   552,   554,   551,   564,
     566,   567,   571,   570,   577,   575,   607,   609,   612,   614,
     617,   619,   622,   624,   625,   628,   629,   630,   631,   632,
     633,   636,   642,   644,   649,   651,   653,   657,   663,   665,
     668,   670,   673,   675,   678,   681,   681,   687,   685,   707,
     705,   726,   728,   730,   734,   738,   740,   751,   755,   758,
     759,   760,   763,   765,   768,   770,   773,   780,   785,   793,
     801,   803,   804,   805,   806,   806,   819,   819,   821,   822,
     822,   824,   824,   826,   827,   828,   829,   830,   831,   832,
     832,   835,   838,   839,   840,   841,   842,   845,   847,   848,
     849,   852,   854,   855,   856,   857,   858,   861,   871,   873,
     874,   875,   876,   877,   878,   879,   880,   881,   882,   883,
     884,   886,   888,   890,   892,   894,   896,   898,   900,   902,
     904,   906,   908,   910,   912,   914,   916,   918,   921,   928,
     931,   933,   937,   939,   941,   944,   951,   950,   959,   960,
     963,   966,   968,   970,   972,   974,   976,   978,   980,   982,
     984,   986,   988,   992,  1000,  1001,  1005,  1006,  1007,  1010,
    1011,  1016,  1014,  1024,  1026,  1027,  1030,  1033,  1037,  1039,
    1042,  1045,  1047,  1049,  1051,  1053,  1057,  1059,  1060,  1061,
    1062,  1063,  1066,  1068,  1071,  1073,  1076,  1078,  1081,  1083,
    1091,  1093,  1096,  1098,  1101,  1103,  1106,  1108,  1111,  1111,
    1115,  1117,  1119,  1119,  1123,  1129,  1132,  1133,  1136,  1138,
    1139,  1140,  1141,  1144,  1146,  1147,  1148,  1151,  1153
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
  "RETURN", "POW", "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", 
  "DOTDOT", "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB", 
  "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD", 
  "PCC_END_YIELD", "NCI_CALL", "METH_CALL", "INVOCANT", "PROTOTYPED", 
  "NON_PROTOTYPED", "MAIN", "LOAD", "IMMEDIATE", "POSTCOMP", "METHOD", 
  "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", 
  "REG", "MACRO", "ENDM", "STRINGC", "INTC", "FLOATC", "USTRINGC", 
  "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", 
  "POINTY", "'='", "'['", "']'", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", 
  "'%'", "'&'", "'|'", "'('", "')'", "';'", "$accept", "program", 
  "compilation_units", "compilation_unit", "global", "constdef", "@1", 
  "pmc_const", "@2", "pasmcode", "pasmline", "pasm_inst", "@3", 
  "pasm_args", "emit", "@4", "class_namespace", "class", "@5", 
  "class_body", "member_decls", "member_decl", "field_decl", 
  "method_decl", "sub", "@6", "@7", "sub_params", "sub_param", "@8", 
  "sub_body", "pcc_sub", "@9", "@10", "pcc_params", "pcc_param", "@11", 
  "pcc_sub_call", "@12", "opt_label", "opt_invocant", "pcc_proto", 
  "pcc_sub_proto", "proto", "pcc_call", "pcc_args", "pcc_arg", 
  "pcc_results", "pcc_result", "@13", "pcc_ret", "@14", "pcc_yield", 
  "@15", "pcc_returns", "pcc_return", "statements", "helper_clear_state", 
  "statement", "labels", "_labels", "label", "instruction", "id_list", 
  "labeled_inst", "@16", "@17", "@18", "@19", "@20", "newsub", "type", 
  "classname", "assignment", "@21", "op_assign", "func_assign", "the_sub", 
  "ptr", "sub_call", "@22", "arglist", "arg", "targetlist", 
  "if_statement", "relop", "target", "vars", "_vars", "_var_or_i", 
  "sub_label_op", "label_op", "var_or_i", "var", "keylist", "@23", 
  "_keylist", "@24", "key", "reg", "const", "string", 0
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
     364,   365,   366,   367,    61,    91,    93,    33,    45,   126,
      43,    42,    47,    37,    38,   124,    40,    41,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   129,   130,   131,   131,   132,   132,   132,   132,   132,
     132,   132,   132,   132,   133,   133,   135,   134,   137,   136,
     138,   138,   139,   139,   139,   139,   139,   139,   141,   140,
     140,   140,   142,   144,   143,   145,   147,   146,   148,   148,
     149,   149,   150,   150,   150,   151,   152,   154,   155,   153,
     156,   156,   156,   158,   157,   159,   161,   162,   160,   163,
     163,   163,   165,   164,   167,   166,   168,   168,   169,   169,
     170,   170,   171,   171,   171,   172,   172,   172,   172,   172,
     172,   173,   173,   173,   173,   173,   173,   173,   174,   174,
     175,   175,   176,   176,   177,   178,   177,   180,   179,   182,
     181,   183,   183,   183,   184,   185,   185,   186,   187,   187,
     187,   187,   188,   188,   189,   189,   190,   191,   192,   192,
     193,   193,   193,   193,   194,   193,   195,   193,   193,   196,
     193,   197,   193,   193,   193,   193,   193,   193,   193,   198,
     193,   193,   193,   193,   193,   193,   193,   199,   199,   199,
     199,   200,   200,   200,   200,   200,   200,   201,   202,   202,
     202,   202,   202,   202,   202,   202,   202,   202,   202,   202,
     202,   202,   202,   202,   202,   202,   202,   202,   202,   202,
     202,   202,   202,   202,   202,   202,   202,   202,   202,   202,
     202,   202,   202,   202,   202,   202,   203,   202,   202,   202,
     204,   204,   204,   204,   204,   204,   204,   204,   204,   204,
     204,   204,   204,   205,   206,   206,   206,   206,   206,   207,
     207,   209,   208,   210,   210,   210,   211,   211,   212,   212,
     213,   213,   213,   213,   213,   213,   214,   214,   214,   214,
     214,   214,   215,   215,   216,   216,   217,   217,   218,   218,
     219,   219,   220,   220,   221,   221,   222,   222,   224,   223,
     225,   225,   226,   225,   227,   227,   227,   227,   228,   228,
     228,   228,   228,   229,   229,   229,   229,   230,   230
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
       2,     2,     0,     3,     2,     0,     4,     0,     5,     0,
       5,     0,     2,     3,     2,     1,     2,     0,     2,     2,
       1,     1,     0,     1,     2,     1,     1,     3,     1,     3,
       1,     1,     2,     2,     0,     4,     0,     6,     1,     0,
       6,     0,     4,     2,     2,     2,     2,     2,     2,     0,
       3,     2,     1,     1,     1,     1,     0,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     3,     4,
       4,     4,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     6,
       6,     6,     7,     4,     4,     6,     7,     4,     6,     4,
       4,     4,     4,     6,     7,     3,     0,     9,     1,     1,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     4,     1,     1,     3,     3,     3,     1,
       1,     0,     5,     0,     3,     1,     1,     2,     3,     1,
       6,     6,     4,     4,     4,     4,     1,     1,     1,     1,
       1,     1,     1,     1,     0,     1,     3,     1,     1,     4,
       1,     1,     1,     1,     1,     1,     1,     1,     0,     2,
       1,     3,     0,     4,     1,     3,     2,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,    47,    16,     0,    56,    33,     0,
       0,     2,     3,     8,     7,    11,     6,     5,     9,    10,
     258,    36,     0,     0,   151,   152,   153,   154,   155,   157,
       0,   156,     0,   112,    12,     1,     4,     0,     0,     0,
     250,   251,    72,     0,    14,    72,    18,   116,     0,    25,
      24,    27,   112,    20,    26,    28,   113,   115,    35,     0,
     268,   269,   270,   271,   272,   275,   273,   274,   276,   242,
     256,   264,   259,   260,   243,   257,    39,    70,    71,    77,
      76,    78,    79,    80,    75,     0,    74,     0,     0,     0,
       0,    23,    34,    21,    72,     0,     0,   114,   266,   267,
     262,     0,    44,     0,     0,     0,    38,    40,    42,    43,
      48,     0,     0,    15,    57,     0,     0,    22,   244,   265,
       0,   261,     0,     0,    37,    41,    50,    73,    17,    59,
     252,   253,   254,     0,   255,    30,    29,   256,    32,   245,
     247,   248,   263,     0,     0,    51,   107,    60,   107,     0,
     258,     0,    45,    46,    53,     0,   111,   110,     0,    49,
     107,   112,   105,    62,    58,     0,    19,     0,   246,     0,
     109,    52,    55,   106,   146,   108,     0,    61,   249,     0,
     131,     0,     0,     0,     0,     0,     0,   139,     0,     0,
     124,   126,   129,     0,     0,     0,     0,     0,     0,   214,
     244,   128,   143,   144,   145,     0,   120,     0,   198,   199,
     221,   142,   121,   215,     0,    54,     0,   133,   137,   138,
     135,     0,     0,     0,   244,   122,   123,     0,     0,     0,
     277,   278,     0,   134,   136,     0,    97,    99,   141,   117,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   220,   219,     0,   258,     0,
      63,     0,     0,   236,   237,   238,   239,   240,   241,     0,
       0,     0,     0,     0,     0,   140,     0,     0,     0,     0,
      64,   101,   101,     0,   229,   223,   200,   201,   202,   203,
     206,   207,   208,   209,   205,   204,   210,   211,   212,     0,
     147,   148,   149,   150,     0,     0,   244,     0,     0,     0,
       0,   195,   256,   158,     0,   217,   218,   216,   132,   232,
     234,     0,   233,   235,     0,   192,   118,   125,     0,     0,
     191,    88,     0,     0,     0,     0,     0,     0,   225,   226,
     183,   184,   190,   189,   213,   159,   160,   161,   187,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   258,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   258,     0,     0,     0,    68,   102,     0,    98,     0,
     100,   228,     0,   227,     0,   222,     0,   258,     0,   258,
       0,   167,   170,   171,   175,   165,   172,   173,   174,   169,
       0,   163,   178,   162,   164,   166,   168,   176,   177,     0,
     230,   231,   193,     0,   119,   127,   130,     0,     0,     0,
       0,     0,   104,   103,     0,   215,   224,   181,     0,   185,
       0,   188,   179,   180,   194,    90,    91,     0,     0,     0,
       0,    66,    89,   223,   182,   186,    69,     0,     0,     0,
       0,    92,     0,     0,    82,     0,    83,    85,     0,    84,
       0,     0,    67,   197,     0,     0,     0,    95,     0,    65,
       0,    81,    87,    86,     0,    94,    93,     0,    96
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    10,    11,    12,    13,    14,    23,    51,    90,    52,
      53,    95,    96,   136,    15,    33,    16,    17,    39,   105,
     106,   107,   108,   109,    18,    22,   126,   146,   158,   169,
     159,    19,    32,   129,   148,   165,   176,   202,   331,   451,
     420,    84,    85,    86,   441,   375,   421,   461,   470,   474,
     203,   281,   204,   282,   332,   379,   160,   161,   162,    55,
      56,    57,   175,   327,   205,   227,   228,   229,   216,   224,
     310,    30,    31,   206,   207,   208,   209,   210,   259,   211,
     241,   337,   338,   283,   212,   270,    70,   138,   139,   140,
      42,   132,   141,   134,    37,    38,    72,   120,    73,    74,
      75,   232
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -220
static const short yypact[] =
{
      11,  -220,  -102,   -62,  -220,  -220,   138,  -220,  -220,    16,
      40,    11,  -220,  -220,  -220,  -220,  -220,  -220,  -220,  -220,
    -220,  -220,    74,   138,  -220,  -220,  -220,  -220,  -220,  -220,
     -25,  -220,    33,    62,  -220,  -220,  -220,    36,   163,   135,
    -220,  -220,   385,    43,    44,   385,  -220,  -220,   153,  -220,
    -220,  -220,    46,  -220,  -220,    13,    78,  -220,  -220,   331,
    -220,  -220,  -220,  -220,  -220,  -220,  -220,  -220,  -220,  -220,
    -220,   101,   -60,  -220,  -220,  -220,    18,  -220,  -220,  -220,
    -220,  -220,  -220,  -220,  -220,     6,  -220,    61,   172,    10,
      72,  -220,  -220,  -220,   385,   175,   114,  -220,  -220,   331,
    -220,   163,  -220,   138,   125,   202,    18,  -220,  -220,  -220,
    -220,   385,   172,  -220,  -220,   201,   -46,  -220,   201,  -220,
     163,  -220,   129,   133,  -220,  -220,   221,  -220,  -220,   230,
    -220,  -220,  -220,   132,  -220,  -220,  -220,   137,  -220,   176,
    -220,  -220,  -220,   250,   252,  -220,    -1,  -220,     1,   159,
    -220,   201,  -220,  -220,  -220,   261,  -220,  -220,   266,  -220,
      34,    78,  -220,  -220,  -220,   281,  -220,   170,  -220,   138,
    -220,  -220,  -220,  -220,   389,  -220,   138,  -220,  -220,   196,
     103,    95,    95,   331,   331,   331,   348,  -220,   203,   211,
    -220,   207,  -220,   -32,   331,   331,    51,   308,   309,  -220,
     201,  -220,  -220,  -220,  -220,   319,  -220,   206,  -220,  -220,
    -220,  -220,  -220,    15,   234,  -220,   138,  -220,  -220,  -220,
    -220,   126,   223,   263,   201,  -220,  -220,   138,   138,   138,
    -220,  -220,   224,  -220,  -220,   336,  -220,  -220,  -220,  -220,
     348,   215,   331,   331,   331,   331,   331,   331,   331,   331,
     331,   331,   331,   331,   331,  -220,  -220,   273,  -220,   395,
    -220,   244,    95,  -220,  -220,  -220,  -220,  -220,  -220,    95,
     331,    95,    95,   331,   331,  -220,   245,   246,   247,   331,
    -220,  -220,  -220,   -48,  -220,    19,  -220,  -220,  -220,  -220,
    -220,  -220,  -220,  -220,  -220,  -220,  -220,  -220,  -220,   259,
    -220,  -220,  -220,  -220,   -32,   248,   201,   331,   331,   331,
     249,  -220,   -78,   411,   236,  -220,  -220,  -220,  -220,  -220,
    -220,   342,  -220,  -220,   352,   -40,  -220,   295,   269,   271,
    -220,  -220,    12,     3,   348,   274,   348,   -26,  -220,  -220,
     -29,    47,  -220,  -220,  -220,  -220,  -220,  -220,   304,   331,
     331,   331,   331,   331,   331,   331,   331,   331,  -220,   331,
     331,   331,   331,   331,   331,   331,   331,   279,    95,    95,
     331,  -220,   288,   172,   172,     9,  -220,   331,  -220,   391,
    -220,  -220,    69,  -220,    19,  -220,   331,  -220,   331,  -220,
     300,  -220,  -220,  -220,  -220,  -220,  -220,  -220,  -220,  -220,
     286,  -220,  -220,  -220,  -220,  -220,  -220,  -220,  -220,   331,
    -220,  -220,  -220,   291,  -220,  -220,  -220,   331,   348,   331,
     147,   405,  -220,  -220,   287,    20,  -220,  -220,   296,  -220,
     298,  -220,  -220,  -220,  -220,  -220,  -220,   412,   331,   331,
     145,    78,  -220,    19,  -220,  -220,  -220,    23,   413,    26,
      32,  -220,   417,   -14,  -220,   331,  -220,  -220,   331,  -220,
     331,    76,  -220,  -220,   420,   426,   428,  -220,   348,  -220,
     429,  -220,  -220,  -220,   138,  -220,  -220,   316,  -220
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -220,  -220,  -220,   427,  -220,  -220,  -220,   267,  -220,  -220,
     388,  -220,  -220,  -219,  -220,  -220,    -5,  -220,  -220,  -220,
    -220,   341,  -220,  -220,  -220,  -220,  -220,  -220,  -220,  -220,
     294,  -220,  -220,  -220,  -220,  -220,  -220,  -220,  -220,  -220,
    -220,   253,   -24,   339,  -220,  -220,  -220,  -220,  -220,  -220,
    -220,  -220,  -220,  -220,   179,  -220,  -220,  -220,   297,   301,
    -220,   -55,  -220,  -220,  -220,  -220,  -220,  -220,  -220,  -220,
    -220,   -23,   165,  -220,  -220,  -220,  -220,    83,  -220,   220,
    -220,    25,    98,  -220,  -220,   277,   -79,   258,  -220,   332,
     241,  -173,   386,   -35,  -138,  -220,  -220,  -220,   -38,   324,
     -86,   204
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -216
static const short yytable[] =
{
      43,    97,   113,    71,   154,   275,   163,   376,   218,   219,
     110,   100,   167,    20,   114,     1,   376,   -31,   417,   418,
      34,    89,   102,   334,    98,   111,   128,   454,    54,   336,
     457,   370,     2,   255,     3,   256,   459,    21,     4,   137,
      35,     5,   386,   103,   104,   384,   135,    54,  -215,   242,
     243,   244,   245,   246,   247,   248,   249,   384,   250,   251,
     252,   253,   254,   121,   119,   230,    71,     2,   101,   377,
     116,   231,   137,     6,    44,   371,    46,   111,   377,   335,
     122,   111,   142,     2,   380,    71,   387,   344,     7,   319,
      94,   378,    46,   419,   455,   213,   320,   458,   322,   323,
     155,   385,   155,   460,     8,   467,   172,   223,   156,   157,
     156,   157,     9,   463,    60,    61,    62,    63,   388,    64,
     314,   137,    65,    66,    67,    68,   255,    69,   256,   257,
     258,   255,    45,   256,   262,   155,    77,    78,    47,    76,
      92,   468,    87,   156,   157,   137,   179,    48,   220,   221,
     222,   469,    58,   214,    47,    49,    50,    91,    88,   233,
     234,   284,   389,    48,    60,    61,    62,    63,   199,    64,
      47,    49,    50,    40,    99,   112,   115,    69,   312,   117,
     316,    41,   263,   264,   265,   266,   267,   268,    24,    25,
      26,    27,    28,   261,   130,   410,   411,   269,    60,    61,
      62,    63,   131,    64,   276,   277,   278,   286,   287,   288,
     289,   290,   291,   292,   293,   294,   295,   296,   297,   298,
     400,   118,   313,   438,   123,   145,   124,   137,   143,   439,
     440,   271,   144,   413,   147,   321,    59,    29,   324,   325,
      60,    61,    62,    63,   330,    64,   149,   151,   449,   428,
     339,   430,   150,    69,   152,   381,   153,   383,    60,    61,
      62,    63,   166,    64,   341,   170,    65,    66,    67,    68,
     171,    69,   345,   346,   347,    65,    66,    67,    68,   263,
     264,   265,   266,   267,   268,   177,   178,   415,   416,   299,
     300,   301,   302,   303,   272,   215,    60,    61,    62,    63,
     130,    64,   225,   425,    65,    66,    67,    68,   131,    69,
     226,   -18,   236,   237,   391,   392,   393,   394,   395,   396,
     397,   398,   399,   239,   401,   402,   403,   404,   405,   406,
     407,   408,   240,   260,   274,   412,   304,   305,   279,   436,
     280,   285,   422,   318,   326,   328,   329,   343,   348,   339,
     368,   427,   367,   429,    60,    61,    62,    63,    29,    64,
     369,   450,    65,    66,    67,    68,   372,    69,    60,    61,
      62,    63,   199,    64,   433,   390,    65,    66,    67,    68,
     306,    69,   435,   373,   437,   374,   452,   414,   382,   475,
     307,   308,   309,   409,   180,   423,   181,   182,   183,   431,
     184,   185,   432,   447,   448,   186,   187,   434,   339,   442,
     188,   189,   444,   443,   445,   478,   446,   456,   190,   191,
     464,   462,   192,   465,   471,   466,    60,    61,    62,    63,
     472,    64,   473,   476,    65,    66,    67,    68,    36,    69,
      93,   201,   164,    60,    61,    62,    63,   125,    64,   235,
     127,   477,   193,   349,   194,   195,    69,   173,   238,   350,
     351,   333,   174,   196,   340,   424,   352,   197,   453,   198,
      77,    78,    79,    80,    81,    82,    83,   311,   353,   354,
     355,   356,   426,   168,    60,    61,    62,    63,   199,    64,
      60,    61,    62,    63,    40,    64,   200,    69,   315,   273,
     317,   133,    41,    69,   217,     0,     0,     0,   342,     0,
       0,     0,     0,     0,     0,  -196,     0,     0,     0,     0,
       0,     0,     0,   357,     0,     0,   358,     0,     0,   359,
     360,   361,   362,   363,   364,   365,   366
};

static const short yycheck[] =
{
      23,    56,    88,    38,     5,   224,     5,     4,   181,   182,
       4,    71,   150,   115,     4,     4,     4,     4,     9,    10,
       4,    45,     4,    71,    59,    71,   112,     4,    33,    10,
       4,    71,    21,   111,    23,   113,     4,    99,    27,   118,
       0,    30,    71,    25,    26,    71,    92,    52,   126,    34,
      35,    36,    37,    38,    39,    40,    41,    71,    43,    44,
      45,    46,    47,   101,    99,    97,   101,    21,   128,    66,
      94,   103,   151,    62,    99,   115,    30,    71,    66,   127,
     103,    71,   120,    21,    81,   120,   115,   306,    77,   262,
      77,    79,    30,    84,    71,   174,   269,    71,   271,   272,
     101,   127,   101,    71,    93,    29,    72,   186,   109,   110,
     109,   110,   101,   127,    95,    96,    97,    98,    71,   100,
     258,   200,   103,   104,   105,   106,   111,   108,   113,   114,
     115,   111,    99,   113,     8,   101,    85,    86,    92,     4,
      94,    65,    99,   109,   110,   224,   169,   101,   183,   184,
     185,    75,   116,   176,    92,   109,   110,     4,   114,   194,
     195,   240,   115,   101,    95,    96,    97,    98,    99,   100,
      92,   109,   110,    99,    73,   114,   104,   108,   257,     4,
     259,   107,    56,    57,    58,    59,    60,    61,    50,    51,
      52,    53,    54,   216,    99,   368,   369,    71,    95,    96,
      97,    98,   107,   100,   227,   228,   229,   242,   243,   244,
     245,   246,   247,   248,   249,   250,   251,   252,   253,   254,
     358,   107,   257,    76,    99,     4,    24,   306,    99,    82,
      83,     8,    99,   371,     4,   270,    73,    99,   273,   274,
      95,    96,    97,    98,   279,   100,   114,    71,   103,   387,
     285,   389,   115,   108,     4,   334,     4,   336,    95,    96,
      97,    98,   103,   100,   299,     4,   103,   104,   105,   106,
       4,   108,   307,   308,   309,   103,   104,   105,   106,    56,
      57,    58,    59,    60,    61,     4,   116,   373,   374,    16,
      17,    18,    19,    20,    71,    99,    95,    96,    97,    98,
      99,   100,    99,   382,   103,   104,   105,   106,   107,   108,
      99,   104,     4,     4,   349,   350,   351,   352,   353,   354,
     355,   356,   357,     4,   359,   360,   361,   362,   363,   364,
     365,   366,   126,    99,    71,   370,    63,    64,   114,   418,
       4,   126,   377,    99,    99,    99,    99,    99,    99,   384,
       8,   386,   116,   388,    95,    96,    97,    98,    99,   100,
       8,   440,   103,   104,   105,   106,    71,   108,    95,    96,
      97,    98,    99,   100,   409,    71,   103,   104,   105,   106,
     107,   108,   417,   114,   419,   114,   441,    99,   114,   468,
     117,   118,   119,   114,     5,     4,     7,     8,     9,    99,
      11,    12,   116,   438,   439,    16,    17,   116,   443,     4,
      21,    22,   116,   126,   116,    99,     4,     4,    29,    30,
     455,     4,    33,   458,     4,   460,    95,    96,    97,    98,
       4,   100,     4,     4,   103,   104,   105,   106,    11,   108,
      52,   174,   148,    95,    96,    97,    98,   106,   100,   196,
     111,   474,    63,    42,    65,    66,   108,   160,   200,    48,
      49,   282,   161,    74,   299,   382,    55,    78,   443,    80,
      85,    86,    87,    88,    89,    90,    91,   257,    67,    68,
      69,    70,   384,   151,    95,    96,    97,    98,    99,   100,
      95,    96,    97,    98,    99,   100,   107,   108,   103,   222,
     259,   115,   107,   108,   180,    -1,    -1,    -1,   304,    -1,
      -1,    -1,    -1,    -1,    -1,   126,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   112,    -1,    -1,   115,    -1,    -1,   118,
     119,   120,   121,   122,   123,   124,   125
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    21,    23,    27,    30,    62,    77,    93,   101,
     130,   131,   132,   133,   134,   143,   145,   146,   153,   160,
     115,    99,   154,   135,    50,    51,    52,    53,    54,    99,
     200,   201,   161,   144,     4,     0,   132,   223,   224,   147,
      99,   107,   219,   200,    99,    99,    30,    92,   101,   109,
     110,   136,   138,   139,   145,   188,   189,   190,   116,    73,
      95,    96,    97,    98,   100,   103,   104,   105,   106,   108,
     215,   222,   225,   227,   228,   229,     4,    85,    86,    87,
      88,    89,    90,    91,   170,   171,   172,    99,   114,   171,
     137,     4,    94,   139,    77,   140,   141,   190,   222,    73,
      71,   128,     4,    25,    26,   148,   149,   150,   151,   152,
       4,    71,   114,   229,     4,   104,   171,     4,   107,   222,
     226,   227,   200,    99,    24,   150,   155,   172,   229,   162,
      99,   107,   220,   221,   222,    92,   142,   215,   216,   217,
     218,   221,   227,    99,    99,     4,   156,     4,   163,   114,
     115,    71,     4,     4,     5,   101,   109,   110,   157,   159,
     185,   186,   187,     5,   159,   164,   103,   223,   218,   158,
       4,     4,    72,   187,   188,   191,   165,     4,   116,   200,
       5,     7,     8,     9,    11,    12,    16,    17,    21,    22,
      29,    30,    33,    63,    65,    66,    74,    78,    80,    99,
     107,   136,   166,   179,   181,   193,   202,   203,   204,   205,
     206,   208,   213,   215,   200,    99,   197,   228,   220,   220,
     222,   222,   222,   215,   198,    99,    99,   194,   195,   196,
      97,   103,   230,   222,   222,   170,     4,     4,   216,     4,
     126,   209,    34,    35,    36,    37,    38,    39,    40,    41,
      43,    44,    45,    46,    47,   111,   113,   114,   115,   207,
      99,   200,     8,    56,    57,    58,    59,    60,    61,    71,
     214,     8,    71,   214,    71,   142,   200,   200,   200,   114,
       4,   180,   182,   212,   215,   126,   222,   222,   222,   222,
     222,   222,   222,   222,   222,   222,   222,   222,   222,    16,
      17,    18,    19,    20,    63,    64,   107,   117,   118,   119,
     199,   208,   215,   222,   223,   103,   215,   219,    99,   220,
     220,   222,   220,   220,   222,   222,    99,   192,    99,    99,
     222,   167,   183,   183,    71,   127,    10,   210,   211,   222,
     201,   222,   230,    99,   142,   222,   222,   222,    99,    42,
      48,    49,    55,    67,    68,    69,    70,   112,   115,   118,
     119,   120,   121,   122,   123,   124,   125,   116,     8,     8,
      71,   115,    71,   114,   114,   174,     4,    66,    79,   184,
      81,   215,   114,   215,    71,   127,    71,   115,    71,   115,
      71,   222,   222,   222,   222,   222,   222,   222,   222,   222,
     223,   222,   222,   222,   222,   222,   222,   222,   222,   114,
     220,   220,   222,   223,    99,   229,   229,     9,    10,    84,
     169,   175,   222,     4,   206,   215,   211,   222,   223,   222,
     223,    99,   116,   222,   116,   222,   215,   222,    76,    82,
      83,   173,     4,   126,   116,   116,     4,   222,   222,   103,
     215,   168,   190,   210,     4,    71,     4,     4,    71,     4,
      71,   176,     4,   127,   222,   222,   222,    29,    65,    75,
     177,     4,     4,     4,   178,   215,     4,   200,    99
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
#line 364 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 373 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 374 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 375 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 376 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 9:
#line 377 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 378 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 379 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 12:
#line 380 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 13:
#line 381 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 386 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 391 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 16:
#line 398 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 17:
#line 399 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 18:
#line 403 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 19:
#line 404 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 22:
#line 412 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 413 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 414 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 25:
#line 415 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 26:
#line 416 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 28:
#line 420 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 29:
#line 422 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 30:
#line 425 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, yyval.i->r[1]);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 31:
#line 431 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 33:
#line 439 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; }
    break;

  case 34:
#line 442 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 35:
#line 451 "imcc/imcc.y"
    { yyval.i=0;
                                 IMCC_INFO(interp)->cur_namespace = yyvsp[-1].sr;
                                 cur_namespace = yyvsp[-1].sr;
                                 }
    break;

  case 36:
#line 459 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 37:
#line 466 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 39:
#line 475 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 44:
#line 486 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 45:
#line 491 "imcc/imcc.y"
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

  case 46:
#line 505 "imcc/imcc.y"
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

  case 47:
#line 521 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 48:
#line 526 "imcc/imcc.y"
    {
          Instruction *i = iSUBROUTINE(cur_unit, yyvsp[-2].sr);
          i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
          add_namespace(interp, i->r[1]);
          i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
        }
    break;

  case 49:
#line 533 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 50:
#line 537 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 51:
#line 538 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 52:
#line 539 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 53:
#line 543 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 54:
#line 544 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 55:
#line 548 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 56:
#line 552 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 57:
#line 554 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
            add_namespace(interp, i->r[1]);
            i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
         }
    break;

  case 58:
#line 561 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 59:
#line 565 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 60:
#line 566 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 61:
#line 567 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 62:
#line 571 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 63:
#line 572 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 64:
#line 577 "imcc/imcc.y"
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

  case 65:
#line 604 "imcc/imcc.y"
    { yyval.i = 0; current_call = NULL; }
    break;

  case 66:
#line 608 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 0; }
    break;

  case 67:
#line 609 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 1; }
    break;

  case 68:
#line 613 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 69:
#line 615 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 70:
#line 618 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 71:
#line 619 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 72:
#line 623 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 73:
#line 624 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 74:
#line 625 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 76:
#line 629 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 77:
#line 630 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 78:
#line 631 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 79:
#line 632 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 80:
#line 633 "imcc/imcc.y"
    {  yyval.t = P_METHOD | P_NONE ; }
    break;

  case 81:
#line 638 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 82:
#line 643 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 83:
#line 645 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-1].sr);
            current_call->r[0]->pcc_sub->nci = 1;
         }
    break;

  case 84:
#line 650 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 85:
#line 652 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-1].s,'S')); }
    break;

  case 86:
#line 654 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 87:
#line 658 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-3].s,'S'));
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 88:
#line 664 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 89:
#line 665 "imcc/imcc.y"
    {  add_pcc_arg(current_call->r[0], yyvsp[-1].sr);}
    break;

  case 90:
#line 669 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 91:
#line 670 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 92:
#line 674 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 93:
#line 675 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 94:
#line 680 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 95:
#line 681 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 96:
#line 682 "imcc/imcc.y"
    {  mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 97:
#line 687 "imcc/imcc.y"
    {
            Instruction *i, *ins;
            SymReg *r;
            char name[128];
            ins = cur_unit->instructions;
            if(!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
               fataly(EX_SOFTWARE, sourcefile, line,
                      "pcc_return not inside pcc subroutine\n");
            sprintf(name, "%cpcc_sub_ret_%d", IMCC_INTERNAL_CHAR, cnr++);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB | ITLABEL;
         }
    break;

  case 98:
#line 702 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 99:
#line 707 "imcc/imcc.y"
    {
            Instruction *i, *ins;
            SymReg *r;
            char name[128];
            ins = cur_unit->instructions;
            if(!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
               fataly(EX_SOFTWARE, sourcefile, line,
                      "pcc_yield not inside pcc subroutine\n");
            ins->r[1]->pcc_sub->calls_a_sub = 1 | ITPCCYIELD;
            sprintf(name, "%cpcc_sub_yield_%d", IMCC_INTERNAL_CHAR, cnr++);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB | ITLABEL | ITPCCYIELD;
         }
    break;

  case 100:
#line 723 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 101:
#line 727 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 102:
#line 729 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 103:
#line 731 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 104:
#line 735 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 107:
#line 752 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 108:
#line 757 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 109:
#line 758 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 110:
#line 759 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 111:
#line 760 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 112:
#line 764 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 116:
#line 774 "imcc/imcc.y"
    {
                     /* $$ = iLABEL(cur_unit, mk_address(, U_add_uniq_label)); */
                     yyval.i = iLABEL(cur_unit, mk_local_label(cur_unit, yyvsp[0].s));
                   }
    break;

  case 117:
#line 782 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 118:
#line 786 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 119:
#line 794 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 122:
#line 804 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 123:
#line 805 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 124:
#line 806 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 125:
#line 807 "imcc/imcc.y"
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

  case 126:
#line 819 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 127:
#line 820 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 129:
#line 822 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 130:
#line 823 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 131:
#line 824 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 132:
#line 824 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 133:
#line 826 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 134:
#line 827 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 135:
#line 828 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 136:
#line 829 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 137:
#line 830 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 138:
#line 831 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 139:
#line 832 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 140:
#line 834 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 141:
#line 836 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 142:
#line 838 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 143:
#line 839 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 146:
#line 842 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 147:
#line 846 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 148:
#line 847 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 149:
#line 848 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 150:
#line 849 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 151:
#line 853 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 152:
#line 854 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 153:
#line 855 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 154:
#line 856 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 155:
#line 857 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 156:
#line 858 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 157:
#line 863 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 158:
#line 872 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 159:
#line 873 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 160:
#line 874 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 161:
#line 875 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 162:
#line 876 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 163:
#line 877 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 164:
#line 878 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 165:
#line 879 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 166:
#line 880 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 167:
#line 881 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 168:
#line 882 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 169:
#line 883 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 170:
#line 885 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 171:
#line 887 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 172:
#line 889 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 173:
#line 891 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 174:
#line 893 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 175:
#line 895 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 176:
#line 897 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 177:
#line 899 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 178:
#line 901 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 179:
#line 903 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 180:
#line 905 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 181:
#line 907 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 182:
#line 909 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 183:
#line 911 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 184:
#line 913 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 185:
#line 915 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 917 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 187:
#line 919 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                          mk_sub_address(yyvsp[0].s), NULL, 1); }
    break;

  case 188:
#line 922 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(yyvsp[-2].s),
                                           mk_sub_address(yyvsp[0].s), 1); }
    break;

  case 189:
#line 929 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                    2, yyvsp[-3].sr, mk_label_address(cur_unit, yyvsp[0].s)); }
    break;

  case 190:
#line 932 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 191:
#line 934 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 192:
#line 938 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 193:
#line 940 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 942 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 195:
#line 945 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 196:
#line 951 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 197:
#line 955 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 200:
#line 965 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 967 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 969 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 971 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 973 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 975 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 977 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 979 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 208:
#line 981 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 983 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 210:
#line 985 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 211:
#line 987 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 989 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 213:
#line 994 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 214:
#line 1000 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 215:
#line 1001 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                          fataly(1, sourcefile, line, "Sub isn't a PMC");
                     }
    break;

  case 216:
#line 1005 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 217:
#line 1006 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 218:
#line 1007 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 219:
#line 1010 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 220:
#line 1011 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 221:
#line 1016 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 222:
#line 1021 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 223:
#line 1025 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 224:
#line 1026 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 225:
#line 1027 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 226:
#line 1032 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 227:
#line 1034 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 228:
#line 1038 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 229:
#line 1039 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 230:
#line 1044 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 231:
#line 1046 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 232:
#line 1048 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 233:
#line 1050 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 234:
#line 1052 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 235:
#line 1054 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 236:
#line 1058 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 237:
#line 1059 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 238:
#line 1060 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 239:
#line 1061 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 240:
#line 1062 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 241:
#line 1063 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 244:
#line 1072 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 245:
#line 1073 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 246:
#line 1077 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 248:
#line 1082 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 249:
#line 1084 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 250:
#line 1092 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 251:
#line 1093 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 252:
#line 1097 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 253:
#line 1098 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 258:
#line 1111 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 259:
#line 1112 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); }
    break;

  case 260:
#line 1116 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 261:
#line 1118 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 262:
#line 1119 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 263:
#line 1120 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 264:
#line 1124 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 265:
#line 1130 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 266:
#line 1132 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 267:
#line 1133 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 268:
#line 1137 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 269:
#line 1138 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 270:
#line 1139 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 271:
#line 1140 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 272:
#line 1141 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 273:
#line 1145 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 274:
#line 1146 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 275:
#line 1147 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 276:
#line 1148 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'U'); }
    break;

  case 277:
#line 1152 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 278:
#line 1153 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3356 "imcc/imcparser.c"

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


#line 1158 "imcc/imcc.y"



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

