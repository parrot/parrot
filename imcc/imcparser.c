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
     POW = 318,
     SHIFT_RIGHT_U = 319,
     LOG_AND = 320,
     LOG_OR = 321,
     COMMA = 322,
     ESUB = 323,
     PCC_BEGIN = 324,
     PCC_END = 325,
     PCC_CALL = 326,
     PCC_SUB = 327,
     PCC_BEGIN_RETURN = 328,
     PCC_END_RETURN = 329,
     PCC_BEGIN_YIELD = 330,
     PCC_END_YIELD = 331,
     NCI_CALL = 332,
     METH_CALL = 333,
     INVOCANT = 334,
     PROTOTYPED = 335,
     NON_PROTOTYPED = 336,
     MAIN = 337,
     LOAD = 338,
     IMMEDIATE = 339,
     POSTCOMP = 340,
     METHOD = 341,
     LABEL = 342,
     EMIT = 343,
     EOM = 344,
     IREG = 345,
     NREG = 346,
     SREG = 347,
     PREG = 348,
     IDENTIFIER = 349,
     STRINGC = 350,
     INTC = 351,
     FLOATC = 352,
     REG = 353,
     MACRO = 354,
     ENDM = 355,
     PARROT_OP = 356,
     VAR = 357,
     LINECOMMENT = 358,
     FILECOMMENT = 359,
     DOT = 360,
     CONCAT = 361,
     POINTY = 362
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
#define POW 318
#define SHIFT_RIGHT_U 319
#define LOG_AND 320
#define LOG_OR 321
#define COMMA 322
#define ESUB 323
#define PCC_BEGIN 324
#define PCC_END 325
#define PCC_CALL 326
#define PCC_SUB 327
#define PCC_BEGIN_RETURN 328
#define PCC_END_RETURN 329
#define PCC_BEGIN_YIELD 330
#define PCC_END_YIELD 331
#define NCI_CALL 332
#define METH_CALL 333
#define INVOCANT 334
#define PROTOTYPED 335
#define NON_PROTOTYPED 336
#define MAIN 337
#define LOAD 338
#define IMMEDIATE 339
#define POSTCOMP 340
#define METHOD 341
#define LABEL 342
#define EMIT 343
#define EOM 344
#define IREG 345
#define NREG 346
#define SREG 347
#define PREG 348
#define IDENTIFIER 349
#define STRINGC 350
#define INTC 351
#define FLOATC 352
#define REG 353
#define MACRO 354
#define ENDM 355
#define PARROT_OP 356
#define VAR 357
#define LINECOMMENT 358
#define FILECOMMENT 359
#define DOT 360
#define CONCAT 361
#define POINTY 362




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
IMC_Unit * cur_unit;
SymReg *cur_namespace; /* ugly hack for mk_address */

/*
 * these are used for constructing one INS
 */
static SymReg *keys[IMCC_MAX_REGS];
static int nkeys;
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
MK_I(struct Parrot_Interp *interpreter, IMC_Unit * unit, const char * fmt, int n, ...)
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
iINDEXFETCH(struct Parrot_Interp *interp, IMC_Unit * unit, SymReg * r0, SymReg * r1,
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
iINDEXSET(struct Parrot_Interp *interp, IMC_Unit * unit,
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

static Instruction *
create_itcall_label(void)
{
    char name[128];
    SymReg * r;
    Instruction *i;

    sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
    r = mk_pcc_sub(str_dup(name), 0);
    current_call = i = iLABEL(cur_unit, r);
    i->type = ITCALL | ITPCCSUB;
    return i;
}

static void
itcall_sub(SymReg* sub)
{
   current_call->r[0]->pcc_sub->sub = sub;
   if (cur_obj) {
       if (cur_obj->set != 'P')
          fataly(1, sourcefile, line, "object isn't a PMC");
       current_call->r[0]->pcc_sub->object = cur_obj;
       cur_obj = NULL;
   }
   /* FIXME use the default settings from .pragma */
   current_call->r[0]->pcc_sub->pragma = P_PROTOTYPED;
   if(cur_unit->type == IMC_PCCSUB)
        cur_unit->instructions->r[1]->pcc_sub->calls_a_sub = 1;
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
#line 244 "imcc/imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
    Symbol * sym;
    SymbolList * symlist;
    SymbolTable * symtab;
} yystype;
/* Line 193 of /usr/share/bison/yacc.c.  */
#line 540 "imcc/imcparser.c"
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
#line 561 "imcc/imcparser.c"

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
#define YYLAST   523

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  124
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  98
/* YYNRULES -- Number of rules. */
#define YYNRULES  261
/* YYNRULES -- Number of states. */
#define YYNSTATES  445

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   362

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   112,     2,     2,     2,   118,   119,     2,
     121,   122,   116,   115,     2,   113,     2,   117,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   123,
       2,   109,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   110,     2,   111,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   120,     2,   114,     2,     2,     2,
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
     106,   107,   108
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    24,    27,    29,    33,    39,    40,    47,    49,
      52,    56,    59,    61,    63,    65,    66,    70,    74,    75,
      77,    78,    83,    88,    89,    96,    98,    99,   101,   104,
     106,   108,   110,   115,   120,   121,   122,   131,   132,   134,
     138,   139,   144,   147,   148,   149,   158,   159,   161,   165,
     166,   171,   172,   183,   184,   187,   188,   192,   194,   196,
     197,   201,   203,   205,   207,   209,   211,   213,   215,   221,
     225,   229,   233,   237,   243,   249,   250,   254,   257,   260,
     261,   265,   268,   269,   274,   275,   281,   282,   288,   289,
     292,   296,   299,   301,   304,   305,   308,   311,   313,   315,
     316,   318,   321,   323,   325,   329,   331,   333,   336,   339,
     340,   345,   346,   353,   354,   361,   362,   367,   370,   373,
     376,   379,   382,   385,   388,   391,   393,   395,   397,   398,
     402,   405,   407,   409,   411,   413,   414,   416,   418,   420,
     422,   424,   426,   428,   430,   432,   434,   436,   440,   445,
     450,   455,   461,   467,   473,   479,   485,   491,   497,   503,
     509,   515,   521,   527,   533,   539,   545,   551,   558,   565,
     572,   577,   582,   589,   594,   599,   604,   605,   609,   613,
     614,   624,   626,   628,   632,   636,   640,   644,   648,   652,
     656,   660,   664,   668,   672,   677,   679,   681,   685,   689,
     693,   695,   697,   698,   704,   705,   709,   711,   713,   716,
     720,   722,   729,   736,   741,   746,   751,   756,   758,   760,
     762,   764,   766,   768,   770,   772,   773,   775,   779,   781,
     783,   788,   790,   792,   794,   796,   798,   800,   801,   804,
     806,   810,   812,   814,   816,   818,   820,   822,   824,   826,
     828,   830
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     125,     0,    -1,   126,    -1,   127,    -1,   126,   127,    -1,
     139,    -1,   138,    -1,   129,    -1,   128,    -1,   146,    -1,
     153,    -1,   136,    -1,   100,     4,    -1,     4,    -1,    59,
     192,    95,    -1,    59,   192,    95,   109,   220,    -1,    -1,
      30,   130,   192,    95,   109,   220,    -1,   132,    -1,   131,
     132,    -1,   181,   133,     4,    -1,   100,     4,    -1,   105,
      -1,   104,    -1,   138,    -1,    -1,   134,   102,   135,    -1,
      73,   164,    88,    -1,    -1,   209,    -1,    -1,    89,   137,
     131,    90,    -1,    21,   110,   215,   111,    -1,    -1,    23,
      95,   140,     4,   141,    24,    -1,   142,    -1,    -1,   143,
      -1,   142,   143,    -1,   144,    -1,   145,    -1,     4,    -1,
      25,   192,    95,     4,    -1,    26,    95,    95,     4,    -1,
      -1,    -1,    27,   147,    95,   164,     4,   148,   149,   152,
      -1,    -1,     4,    -1,   149,   150,     4,    -1,    -1,     5,
     151,   192,    95,    -1,   178,    69,    -1,    -1,    -1,    73,
     154,    95,   164,     4,   155,   156,   152,    -1,    -1,     4,
      -1,   156,   157,     4,    -1,    -1,     5,   158,   192,    95,
      -1,    -1,    70,   163,     4,   160,   167,   162,   166,   161,
     169,    71,    -1,    -1,   183,     4,    -1,    -1,    80,   214,
       4,    -1,    81,    -1,    82,    -1,    -1,   164,    68,   165,
      -1,   165,    -1,   163,    -1,    84,    -1,    83,    -1,    85,
      -1,    86,    -1,    87,    -1,    72,   214,    68,   214,     4,
      -1,    72,   214,     4,    -1,    78,   214,     4,    -1,    79,
     208,     4,    -1,    79,    96,     4,    -1,    79,   208,    68,
     214,     4,    -1,    79,    96,    68,   214,     4,    -1,    -1,
     167,   168,     4,    -1,     9,   214,    -1,    10,   208,    -1,
      -1,   169,   170,     4,    -1,    62,   208,    -1,    -1,    29,
     171,   192,    95,    -1,    -1,    74,     4,   173,   176,    75,
      -1,    -1,    76,     4,   175,   176,    77,    -1,    -1,   176,
       4,    -1,   176,   177,     4,    -1,    63,   214,    -1,   180,
      -1,   178,   180,    -1,    -1,   179,   184,    -1,   100,     4,
      -1,   105,    -1,   104,    -1,    -1,   182,    -1,   182,   183,
      -1,   183,    -1,    88,    -1,   181,   185,     4,    -1,   194,
      -1,   206,    -1,    21,    95,    -1,    22,    95,    -1,    -1,
      29,   186,   192,    95,    -1,    -1,    30,   187,   192,    95,
     109,   220,    -1,    -1,    33,   188,   192,    95,   109,   220,
      -1,    -1,     5,   189,   192,    95,    -1,     5,   219,    -1,
      62,   214,    -1,     9,   214,    -1,    63,   214,    -1,     7,
     212,    -1,     8,   212,    -1,    31,   214,    -1,    32,   214,
      -1,    14,    -1,    15,    -1,    13,    -1,    -1,    17,   190,
     135,    -1,   102,   209,    -1,   201,    -1,   159,    -1,   172,
      -1,   174,    -1,    -1,    17,    -1,    18,    -1,    19,    -1,
      20,    -1,    47,    -1,    48,    -1,    49,    -1,    50,    -1,
      51,    -1,   193,    -1,    95,    -1,   208,   109,   214,    -1,
     208,   109,   112,   214,    -1,   208,   109,   113,   214,    -1,
     208,   109,   114,   214,    -1,   208,   109,   214,   115,   214,
      -1,   208,   109,   214,   113,   214,    -1,   208,   109,   214,
     116,   214,    -1,   208,   109,   214,    64,   214,    -1,   208,
     109,   214,   117,   214,    -1,   208,   109,   214,   118,   214,
      -1,   208,   109,   214,   107,   214,    -1,   208,   109,   214,
      45,   214,    -1,   208,   109,   214,    46,   214,    -1,   208,
     109,   214,    65,   214,    -1,   208,   109,   214,    66,   214,
      -1,   208,   109,   214,    67,   214,    -1,   208,   109,   214,
      52,   214,    -1,   208,   109,   214,   119,   214,    -1,   208,
     109,   214,   120,   214,    -1,   208,   109,   214,   114,   214,
      -1,   208,   109,   214,   110,   215,   111,    -1,   208,   110,
     215,   111,   109,   214,    -1,   208,   109,    16,   193,    68,
     214,    -1,   208,   109,    16,   193,    -1,   208,   109,   191,
      95,    -1,   208,   109,   191,    95,    68,    95,    -1,   208,
     109,    61,    95,    -1,   208,   109,    60,   221,    -1,    60,
     221,   109,   214,    -1,    -1,    16,   195,   135,    -1,   208,
     109,   201,    -1,    -1,   196,   121,   205,   122,   109,   199,
     121,   203,   122,    -1,   197,    -1,   198,    -1,   208,    34,
     214,    -1,   208,    35,   214,    -1,   208,    36,   214,    -1,
     208,    37,   214,    -1,   208,    38,   214,    -1,   208,    39,
     214,    -1,   208,    40,   214,    -1,   208,    41,   214,    -1,
     208,    42,   214,    -1,   208,    43,   214,    -1,   208,    44,
     214,    -1,   208,   109,   102,   135,    -1,    95,    -1,   103,
      -1,   208,   200,    95,    -1,   208,   200,    96,    -1,   208,
     200,   208,    -1,   108,    -1,   106,    -1,    -1,   199,   202,
     121,   203,   122,    -1,    -1,   203,    68,   204,    -1,   204,
      -1,   214,    -1,    10,   208,    -1,   205,    68,   208,    -1,
     208,    -1,    11,   214,   207,   214,     8,   212,    -1,    12,
     214,   207,   214,     8,   212,    -1,    11,   214,     8,   212,
      -1,    12,   214,     8,   212,    -1,    11,   214,    68,   212,
      -1,    12,   214,    68,   212,    -1,    53,    -1,    54,    -1,
      55,    -1,    56,    -1,    57,    -1,    58,    -1,   103,    -1,
     219,    -1,    -1,   210,    -1,   210,    68,   211,    -1,   211,
      -1,   213,    -1,   208,   110,   215,   111,    -1,    95,    -1,
     102,    -1,   212,    -1,   214,    -1,   208,    -1,   220,    -1,
      -1,   216,   217,    -1,   218,    -1,   217,   123,   218,    -1,
     214,    -1,    91,    -1,    92,    -1,    93,    -1,    94,    -1,
      99,    -1,    97,    -1,    98,    -1,    96,    -1,    93,    -1,
      96,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   318,   318,   322,   324,   327,   329,   330,   331,   332,
     333,   334,   335,   336,   339,   345,   353,   352,   357,   359,
     362,   364,   365,   366,   367,   370,   370,   374,   381,   384,
     389,   388,   400,   409,   407,   423,   425,   428,   430,   433,
     435,   436,   439,   453,   471,   476,   469,   486,   488,   489,
     493,   492,   497,   502,   504,   501,   514,   516,   517,   521,
     520,   527,   525,   557,   559,   562,   564,   567,   569,   572,
     574,   575,   578,   579,   580,   581,   582,   583,   586,   592,
     594,   599,   601,   603,   607,   613,   615,   618,   620,   623,
     625,   628,   631,   631,   637,   635,   657,   655,   676,   678,
     680,   684,   688,   690,   701,   705,   708,   709,   710,   713,
     715,   718,   720,   723,   730,   735,   737,   738,   739,   740,
     740,   741,   741,   743,   743,   745,   745,   747,   748,   749,
     750,   751,   752,   753,   754,   755,   756,   757,   758,   758,
     761,   764,   765,   766,   767,   768,   771,   773,   774,   775,
     778,   780,   781,   782,   783,   784,   787,   796,   798,   799,
     800,   801,   802,   803,   804,   805,   806,   807,   808,   810,
     812,   814,   816,   818,   820,   822,   824,   826,   828,   830,
     832,   834,   837,   844,   847,   849,   854,   853,   858,   865,
     864,   873,   874,   877,   880,   882,   884,   886,   888,   890,
     892,   894,   896,   898,   902,   910,   911,   915,   916,   917,
     920,   921,   926,   924,   934,   936,   937,   940,   943,   947,
     949,   952,   955,   957,   959,   961,   963,   967,   969,   970,
     971,   972,   973,   976,   978,   981,   983,   986,   988,   991,
     993,  1001,  1003,  1006,  1008,  1011,  1013,  1016,  1016,  1020,
    1022,  1026,  1030,  1032,  1033,  1034,  1035,  1038,  1040,  1041,
    1044,  1046
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
  "CONCAT_ASSIGN", "BAND_ASSIGN", "BOR_ASSIGN", "BXOR_ASSIGN", 
  "SHR_ASSIGN", "SHL_ASSIGN", "SHR_U_ASSIGN", "SHIFT_LEFT", "SHIFT_RIGHT", 
  "INTV", "FLOATV", "STRINGV", "PMCV", "OBJECTV", "LOG_XOR", "RELOP_EQ", 
  "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", "RELOP_LTE", "GLOBAL", 
  "GLOBALOP", "ADDR", "RESULT", "RETURN", "POW", "SHIFT_RIGHT_U", 
  "LOG_AND", "LOG_OR", "COMMA", "ESUB", "PCC_BEGIN", "PCC_END", 
  "PCC_CALL", "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN", 
  "PCC_BEGIN_YIELD", "PCC_END_YIELD", "NCI_CALL", "METH_CALL", "INVOCANT", 
  "PROTOTYPED", "NON_PROTOTYPED", "MAIN", "LOAD", "IMMEDIATE", "POSTCOMP", 
  "METHOD", "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", 
  "IDENTIFIER", "STRINGC", "INTC", "FLOATC", "REG", "MACRO", "ENDM", 
  "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", 
  "POINTY", "'='", "'['", "']'", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", 
  "'%'", "'&'", "'|'", "'('", "')'", "';'", "$accept", "program", 
  "compilation_units", "compilation_unit", "global", "constdef", "@1", 
  "pasmcode", "pasmline", "pasm_inst", "@2", "pasm_args", "emit", "@3", 
  "class_namespace", "class", "@4", "class_body", "member_decls", 
  "member_decl", "field_decl", "method_decl", "sub", "@5", "@6", 
  "sub_params", "sub_param", "@7", "sub_body", "pcc_sub", "@8", "@9", 
  "pcc_params", "pcc_param", "@10", "pcc_sub_call", "@11", "opt_label", 
  "opt_invocant", "pcc_proto", "pcc_sub_proto", "proto", "pcc_call", 
  "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@12", "pcc_ret", 
  "@13", "pcc_yield", "@14", "pcc_returns", "pcc_return", "statements", 
  "helper_clear_state", "statement", "labels", "_labels", "label", 
  "instruction", "labeled_inst", "@15", "@16", "@17", "@18", "@19", 
  "newsub", "type", "classname", "assignment", "@20", "@21", "op_assign", 
  "func_assign", "the_sub", "ptr", "sub_call", "@22", "arglist", "arg", 
  "targetlist", "if_statement", "relop", "target", "vars", "_vars", 
  "_var_or_i", "label_op", "var_or_i", "var", "keylist", "@23", 
  "_keylist", "key", "reg", "const", "string", 0
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
     354,   355,   356,   357,   358,   359,   360,   361,   362,    61,
      91,    93,    33,    45,   126,    43,    42,    47,    37,    38,
     124,    40,    41,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   124,   125,   126,   126,   127,   127,   127,   127,   127,
     127,   127,   127,   127,   128,   128,   130,   129,   131,   131,
     132,   132,   132,   132,   132,   134,   133,   133,   133,   135,
     137,   136,   138,   140,   139,   141,   141,   142,   142,   143,
     143,   143,   144,   145,   147,   148,   146,   149,   149,   149,
     151,   150,   152,   154,   155,   153,   156,   156,   156,   158,
     157,   160,   159,   161,   161,   162,   162,   163,   163,   164,
     164,   164,   165,   165,   165,   165,   165,   165,   166,   166,
     166,   166,   166,   166,   166,   167,   167,   168,   168,   169,
     169,   170,   171,   170,   173,   172,   175,   174,   176,   176,
     176,   177,   178,   178,   179,   180,   180,   180,   180,   181,
     181,   182,   182,   183,   184,   185,   185,   185,   185,   186,
     185,   187,   185,   188,   185,   189,   185,   185,   185,   185,
     185,   185,   185,   185,   185,   185,   185,   185,   190,   185,
     185,   185,   185,   185,   185,   185,   191,   191,   191,   191,
     192,   192,   192,   192,   192,   192,   193,   194,   194,   194,
     194,   194,   194,   194,   194,   194,   194,   194,   194,   194,
     194,   194,   194,   194,   194,   194,   194,   194,   194,   194,
     194,   194,   194,   194,   194,   194,   195,   194,   194,   196,
     194,   194,   194,   197,   197,   197,   197,   197,   197,   197,
     197,   197,   197,   197,   198,   199,   199,   199,   199,   199,
     200,   200,   202,   201,   203,   203,   203,   204,   204,   205,
     205,   206,   206,   206,   206,   206,   206,   207,   207,   207,
     207,   207,   207,   208,   208,   209,   209,   210,   210,   211,
     211,   212,   212,   213,   213,   214,   214,   216,   215,   217,
     217,   218,   219,   219,   219,   219,   219,   220,   220,   220,
     221,   221
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     2,     1,     3,     5,     0,     6,     1,     2,
       3,     2,     1,     1,     1,     0,     3,     3,     0,     1,
       0,     4,     4,     0,     6,     1,     0,     1,     2,     1,
       1,     1,     4,     4,     0,     0,     8,     0,     1,     3,
       0,     4,     2,     0,     0,     8,     0,     1,     3,     0,
       4,     0,    10,     0,     2,     0,     3,     1,     1,     0,
       3,     1,     1,     1,     1,     1,     1,     1,     5,     3,
       3,     3,     3,     5,     5,     0,     3,     2,     2,     0,
       3,     2,     0,     4,     0,     5,     0,     5,     0,     2,
       3,     2,     1,     2,     0,     2,     2,     1,     1,     0,
       1,     2,     1,     1,     3,     1,     1,     2,     2,     0,
       4,     0,     6,     0,     6,     0,     4,     2,     2,     2,
       2,     2,     2,     2,     2,     1,     1,     1,     0,     3,
       2,     1,     1,     1,     1,     0,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     4,     4,
       4,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     6,     6,     6,
       4,     4,     6,     4,     4,     4,     0,     3,     3,     0,
       9,     1,     1,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     4,     1,     1,     3,     3,     3,
       1,     1,     0,     5,     0,     3,     1,     1,     2,     3,
       1,     6,     6,     4,     4,     4,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     0,     1,     3,     1,     1,
       4,     1,     1,     1,     1,     1,     1,     0,     2,     1,
       3,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,    44,    16,     0,    53,    30,     0,
       0,     2,     3,     8,     7,    11,     6,     5,     9,    10,
     247,    33,     0,     0,   150,   151,   152,   153,   154,   156,
       0,   155,     0,   109,    12,     1,     4,     0,     0,     0,
      69,     0,    14,    69,   113,     0,    23,    22,   109,    18,
      24,    25,   110,   112,    32,   252,   253,   254,   255,   259,
     257,   258,   256,   233,   245,   251,   248,   249,   234,   246,
      36,    67,    68,    74,    73,    75,    76,    77,    72,     0,
      71,     0,     0,     0,    21,    31,    19,    69,     0,     0,
     111,     0,    41,     0,     0,     0,    35,    37,    39,    40,
      45,     0,     0,    15,    54,     0,    20,   235,   250,     0,
       0,    34,    38,    47,    70,    17,    56,    27,   241,   242,
      26,   245,    29,   236,   238,   243,   239,   244,     0,     0,
      48,   104,    57,   104,   247,     0,    42,    43,    50,     0,
     108,   107,     0,    46,   104,   109,   102,    59,    55,     0,
       0,   237,     0,   106,    49,    52,   103,   145,   105,     0,
      58,   240,     0,   125,     0,     0,     0,     0,     0,   137,
     135,   136,   186,   138,     0,     0,   119,   121,     0,     0,
     123,     0,     0,     0,     0,     0,     0,   205,   235,   233,
     142,   143,   144,     0,   115,     0,   191,   192,   212,   141,
     116,     0,     0,    51,     0,   127,   131,   132,   129,     0,
       0,   235,   235,   117,   118,     0,     0,   133,   134,     0,
     260,   261,     0,   128,   130,     0,    94,    96,   140,   114,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   211,   210,     0,   247,     0,    60,     0,
       0,   227,   228,   229,   230,   231,   232,     0,     0,     0,
       0,     0,   187,   139,     0,     0,     0,     0,    61,    98,
      98,     0,   220,   214,   193,   194,   195,   196,   197,   198,
     199,   200,   201,   202,   203,     0,   146,   147,   148,   149,
       0,     0,   235,     0,     0,     0,     0,   188,   245,   157,
       0,   207,   208,   209,   126,   223,   225,     0,   224,   226,
       0,   120,     0,     0,   185,    85,     0,     0,     0,     0,
       0,     0,   216,   217,   180,   184,   183,   204,   158,   159,
     160,   181,     0,     0,     0,     0,     0,     0,     0,     0,
     247,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    65,    99,     0,    95,     0,    97,
     219,     0,   218,     0,   213,     0,     0,   168,   169,   173,
     164,   170,   171,   172,   167,     0,   162,   176,   161,   163,
     165,   166,   174,   175,     0,   221,   222,   122,   124,     0,
       0,     0,     0,     0,   101,   100,     0,     0,   215,   179,
     182,   177,   178,    87,    88,     0,     0,     0,     0,    63,
      86,   214,    66,     0,     0,     0,     0,    89,     0,     0,
      79,     0,    80,    82,     0,    81,     0,     0,    64,   190,
       0,     0,     0,    92,     0,    62,     0,    78,    84,    83,
       0,    91,    90,     0,    93
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    10,    11,    12,    13,    14,    23,    48,    49,    88,
      89,   120,    15,    33,    16,    17,    39,    95,    96,    97,
      98,    99,    18,    22,   113,   131,   142,   152,   143,    19,
      32,   116,   133,   149,   159,   190,   315,   417,   392,    78,
      79,    80,   409,   354,   393,   427,   436,   440,   191,   269,
     192,   270,   316,   358,   144,   145,   146,    51,    52,    53,
     158,   193,   215,   216,   219,   204,   212,   296,    30,    31,
     194,   211,   195,   196,   197,   198,   247,   199,   231,   321,
     322,   271,   200,   258,    64,   122,   123,   124,   125,   126,
     127,    37,    38,    66,    67,    68,    69,   222
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -196
static const short yypact[] =
{
       0,  -196,   -64,   -38,  -196,  -196,     3,  -196,  -196,    58,
      76,     0,  -196,  -196,  -196,  -196,  -196,  -196,  -196,  -196,
    -196,  -196,    13,     3,  -196,  -196,  -196,  -196,  -196,  -196,
      18,  -196,    33,    11,  -196,  -196,  -196,    23,    86,   123,
     166,    40,    36,   166,  -196,   138,  -196,  -196,    -9,  -196,
    -196,     7,    61,  -196,  -196,  -196,  -196,  -196,  -196,  -196,
    -196,  -196,  -196,  -196,  -196,  -196,    28,  -196,  -196,  -196,
      22,  -196,  -196,  -196,  -196,  -196,  -196,  -196,  -196,    14,
    -196,    37,    43,    16,  -196,  -196,  -196,   166,   146,    50,
    -196,    86,  -196,     3,    59,   131,    22,  -196,  -196,  -196,
    -196,   166,    43,  -196,  -196,   -33,  -196,   248,  -196,    75,
      77,  -196,  -196,   170,  -196,  -196,   171,  -196,  -196,  -196,
    -196,    66,  -196,   118,  -196,  -196,  -196,  -196,   183,   184,
    -196,     2,  -196,     5,  -196,   248,  -196,  -196,  -196,   186,
    -196,  -196,   187,  -196,    53,    61,  -196,  -196,  -196,   204,
      98,  -196,     3,  -196,  -196,  -196,  -196,   389,  -196,     3,
    -196,  -196,   117,   -28,   -59,   -59,    86,    86,    86,  -196,
    -196,  -196,  -196,  -196,   119,   120,  -196,  -196,    86,    86,
    -196,   -19,    86,    86,   -42,   209,   213,  -196,   248,   101,
    -196,  -196,  -196,   215,  -196,   103,  -196,  -196,  -196,  -196,
    -196,   125,   130,  -196,     3,  -196,  -196,  -196,  -196,   208,
     269,   248,   248,  -196,  -196,     3,     3,  -196,  -196,     3,
    -196,  -196,   121,  -196,  -196,   224,  -196,  -196,  -196,  -196,
     339,   108,    86,    86,    86,    86,    86,    86,    86,    86,
      86,    86,    86,  -196,  -196,   409,  -196,   270,  -196,   141,
     -59,  -196,  -196,  -196,  -196,  -196,  -196,   -59,    86,   -59,
     -59,    86,  -196,  -196,   142,   148,   150,    86,  -196,  -196,
    -196,   -62,  -196,    27,  -196,  -196,  -196,  -196,  -196,  -196,
    -196,  -196,  -196,  -196,  -196,   159,  -196,  -196,  -196,  -196,
     -19,   160,   248,    86,    86,    86,   161,  -196,   -21,   175,
     163,  -196,  -196,  -196,  -196,  -196,  -196,   249,  -196,  -196,
     272,  -196,   169,   172,  -196,  -196,    15,     9,   339,   174,
     339,   -54,  -196,  -196,   216,  -196,  -196,  -196,  -196,  -196,
    -196,   218,    86,    86,    86,    86,    86,    86,    86,    86,
    -196,    86,    86,    86,    86,    86,    86,    86,    86,   196,
     -59,   -59,    43,    43,    32,  -196,    86,  -196,   292,  -196,
    -196,   176,  -196,    27,  -196,    86,   219,  -196,  -196,  -196,
    -196,  -196,  -196,  -196,  -196,   206,  -196,  -196,  -196,  -196,
    -196,  -196,  -196,  -196,    86,  -196,  -196,  -196,  -196,    86,
     339,    86,   -34,   311,  -196,  -196,   197,   -21,  -196,  -196,
    -196,  -196,  -196,  -196,  -196,   315,    86,    86,   289,    61,
    -196,    27,  -196,    20,   316,    24,    25,  -196,   325,   -53,
    -196,    86,  -196,  -196,    86,  -196,    86,    -4,  -196,  -196,
     327,   328,   329,  -196,   339,  -196,   331,  -196,  -196,  -196,
       3,  -196,  -196,   241,  -196
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -196,  -196,  -196,   337,  -196,  -196,  -196,  -196,   290,  -196,
    -196,  -195,  -196,  -196,     1,  -196,  -196,  -196,  -196,   256,
    -196,  -196,  -196,  -196,  -196,  -196,  -196,  -196,   220,  -196,
    -196,  -196,  -196,  -196,  -196,  -196,  -196,  -196,  -196,   173,
     -12,   254,  -196,  -196,  -196,  -196,  -196,  -196,  -196,  -196,
    -196,  -196,    89,  -196,  -196,  -196,   223,   225,  -196,   -51,
    -196,  -196,  -196,  -196,  -196,  -196,  -196,  -196,   -23,    83,
    -196,  -196,  -196,  -196,  -196,    17,  -196,   129,  -196,   -36,
      21,  -196,  -196,   167,   -74,   191,  -196,   252,  -156,  -196,
     -35,  -129,  -196,  -196,   299,   230,   -80,   105
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -207
static const short yytable[] =
{
      41,    90,   103,    65,     1,   150,   318,   138,   206,   207,
     147,   -28,     2,   355,   363,   363,   262,   263,   100,   355,
     104,     2,   115,     3,   420,   433,    92,     4,   423,   425,
       5,    83,     2,   121,    50,   101,   118,   320,   406,    71,
      72,   389,   390,   119,   407,   408,    20,    93,    94,    50,
      24,    25,    26,    27,    28,   117,    65,    21,   434,     6,
     319,   121,    34,    55,    56,    57,    58,   435,   364,   429,
     109,    62,   356,     7,   220,   105,    35,   221,   356,    44,
      87,    85,   101,   201,   101,   243,   359,   244,   421,     8,
     357,    45,   424,   426,   305,    46,    47,   327,    29,    44,
       9,   306,   139,   308,   309,   139,   140,   141,    40,   140,
     141,    45,   391,    42,   121,    46,    47,   300,    55,    56,
      57,    58,   155,    59,    60,    61,    62,    70,    43,   162,
      63,   208,   209,   210,    54,    81,   202,   121,   121,    59,
      60,    61,    84,   217,   218,    82,   102,   223,   224,    44,
     106,    91,   107,   139,   110,   111,   272,   140,   141,   232,
     233,   234,   235,   236,   237,   238,   239,   240,   241,   242,
     128,   298,   129,   303,   130,   132,   134,    55,    56,    57,
      58,   249,    59,    60,    61,    62,   135,   136,   137,    63,
     153,   154,   264,   265,   385,   386,   266,   274,   275,   276,
     277,   278,   279,   280,   281,   282,   283,   284,   160,   161,
     299,   375,   203,   226,   213,   214,   250,   227,   121,   229,
     332,   333,  -206,   307,   230,   248,   310,   334,   268,   273,
     267,   243,   314,   244,   245,   246,   304,   311,   323,   335,
     336,   337,   338,   312,   360,   313,   362,    71,    72,    73,
      74,    75,    76,    77,    29,   326,   331,   350,   328,   329,
     330,   251,   252,   253,   254,   255,   256,    55,    56,    57,
      58,   187,   387,   388,   349,    62,   257,   259,   352,   189,
     351,   353,   339,   361,   365,   340,   366,   397,   341,   342,
     343,   344,   345,   346,   347,   348,   395,   367,   368,   369,
     370,   371,   372,   373,   374,   384,   376,   377,   378,   379,
     380,   381,   382,   383,   400,   410,   404,   401,   411,   412,
     422,   394,   251,   252,   253,   254,   255,   256,   323,   428,
     399,   437,   438,   439,   416,   442,   444,   260,    86,    55,
      56,    57,    58,   118,    59,    60,    61,    62,    36,   402,
     119,    63,   112,   148,   403,   114,   405,   225,   418,   317,
     441,    55,    56,    57,    58,   301,   302,   156,   324,    62,
     157,   413,   414,    63,   297,   419,   323,   261,   396,   228,
      55,    56,    57,    58,   398,   415,   430,   151,    62,   431,
     108,   432,    63,   205,   163,   325,   164,   165,   166,     0,
     167,   168,   169,   170,   171,   172,   173,     0,     0,     0,
     174,   175,     0,     0,     0,     0,     0,   443,   176,   177,
     178,   179,   180,     0,     0,   285,   286,   287,   288,   289,
      55,    56,    57,    58,     0,     0,     0,     0,    62,     0,
       0,     0,    63,     0,     0,     0,     0,     0,     0,   181,
       0,   182,   183,     0,     0,     0,     0,     0,     0,   184,
       0,     0,     0,   185,     0,   186,     0,     0,     0,   290,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      55,    56,    57,    58,   187,     0,     0,     0,    62,     0,
       0,   188,   189,     0,     0,     0,     0,     0,     0,     0,
      55,    56,    57,    58,   187,    59,    60,    61,    62,     0,
    -189,   292,   189,     0,     0,     0,     0,     0,     0,     0,
       0,   293,   294,   295
};

static const short yycheck[] =
{
      23,    52,    82,    38,     4,   134,    68,     5,   164,   165,
       5,     4,    21,     4,    68,    68,   211,   212,     4,     4,
       4,    21,   102,    23,     4,    29,     4,    27,     4,     4,
      30,    43,    21,   107,    33,    68,    95,    10,    72,    81,
      82,     9,    10,   102,    78,    79,   110,    25,    26,    48,
      47,    48,    49,    50,    51,    88,    91,    95,    62,    59,
     122,   135,     4,    91,    92,    93,    94,    71,   122,   122,
      93,    99,    63,    73,    93,    87,     0,    96,    63,    88,
      73,    90,    68,   157,    68,   106,    77,   108,    68,    89,
      75,   100,    68,    68,   250,   104,   105,   292,    95,    88,
     100,   257,   100,   259,   260,   100,   104,   105,    95,   104,
     105,   100,    80,    95,   188,   104,   105,   246,    91,    92,
      93,    94,    69,    96,    97,    98,    99,     4,    95,   152,
     103,   166,   167,   168,   111,    95,   159,   211,   212,    96,
      97,    98,     4,   178,   179,   109,   109,   182,   183,    88,
       4,   123,   102,   100,    95,    24,   230,   104,   105,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      95,   245,    95,   247,     4,     4,   110,    91,    92,    93,
      94,   204,    96,    97,    98,    99,    68,     4,     4,   103,
       4,     4,   215,   216,   350,   351,   219,   232,   233,   234,
     235,   236,   237,   238,   239,   240,   241,   242,     4,   111,
     245,   340,    95,     4,    95,    95,     8,     4,   292,     4,
      45,    46,   121,   258,   121,    95,   261,    52,     4,   121,
     109,   106,   267,   108,   109,   110,    95,    95,   273,    64,
      65,    66,    67,    95,   318,    95,   320,    81,    82,    83,
      84,    85,    86,    87,    95,    95,    95,     8,   293,   294,
     295,    53,    54,    55,    56,    57,    58,    91,    92,    93,
      94,    95,   352,   353,   111,    99,    68,     8,   109,   103,
       8,   109,   107,   109,    68,   110,    68,   361,   113,   114,
     115,   116,   117,   118,   119,   120,     4,   332,   333,   334,
     335,   336,   337,   338,   339,   109,   341,   342,   343,   344,
     345,   346,   347,   348,    95,     4,   390,   111,   121,     4,
       4,   356,    53,    54,    55,    56,    57,    58,   363,     4,
     365,     4,     4,     4,   408,     4,    95,    68,    48,    91,
      92,    93,    94,    95,    96,    97,    98,    99,    11,   384,
     102,   103,    96,   133,   389,   101,   391,   184,   409,   270,
     434,    91,    92,    93,    94,    95,    96,   144,   285,    99,
     145,   406,   407,   103,   245,   411,   411,   210,   361,   188,
      91,    92,    93,    94,   363,    96,   421,   135,    99,   424,
      91,   426,   103,   163,     5,   290,     7,     8,     9,    -1,
      11,    12,    13,    14,    15,    16,    17,    -1,    -1,    -1,
      21,    22,    -1,    -1,    -1,    -1,    -1,   440,    29,    30,
      31,    32,    33,    -1,    -1,    16,    17,    18,    19,    20,
      91,    92,    93,    94,    -1,    -1,    -1,    -1,    99,    -1,
      -1,    -1,   103,    -1,    -1,    -1,    -1,    -1,    -1,    60,
      -1,    62,    63,    -1,    -1,    -1,    -1,    -1,    -1,    70,
      -1,    -1,    -1,    74,    -1,    76,    -1,    -1,    -1,    60,
      61,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      91,    92,    93,    94,    95,    -1,    -1,    -1,    99,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      91,    92,    93,    94,    95,    96,    97,    98,    99,    -1,
     121,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   112,   113,   114
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    21,    23,    27,    30,    59,    73,    89,   100,
     125,   126,   127,   128,   129,   136,   138,   139,   146,   153,
     110,    95,   147,   130,    47,    48,    49,    50,    51,    95,
     192,   193,   154,   137,     4,     0,   127,   215,   216,   140,
      95,   192,    95,    95,    88,   100,   104,   105,   131,   132,
     138,   181,   182,   183,   111,    91,    92,    93,    94,    96,
      97,    98,    99,   103,   208,   214,   217,   218,   219,   220,
       4,    81,    82,    83,    84,    85,    86,    87,   163,   164,
     165,    95,   109,   164,     4,    90,   132,    73,   133,   134,
     183,   123,     4,    25,    26,   141,   142,   143,   144,   145,
       4,    68,   109,   220,     4,   164,     4,   102,   218,   192,
      95,    24,   143,   148,   165,   220,   155,    88,    95,   102,
     135,   208,   209,   210,   211,   212,   213,   214,    95,    95,
       4,   149,     4,   156,   110,    68,     4,     4,     5,   100,
     104,   105,   150,   152,   178,   179,   180,     5,   152,   157,
     215,   211,   151,     4,     4,    69,   180,   181,   184,   158,
       4,   111,   192,     5,     7,     8,     9,    11,    12,    13,
      14,    15,    16,    17,    21,    22,    29,    30,    31,    32,
      33,    60,    62,    63,    70,    74,    76,    95,   102,   103,
     159,   172,   174,   185,   194,   196,   197,   198,   199,   201,
     206,   208,   192,    95,   189,   219,   212,   212,   214,   214,
     214,   195,   190,    95,    95,   186,   187,   214,   214,   188,
      93,    96,   221,   214,   214,   163,     4,     4,   209,     4,
     121,   202,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,   106,   108,   109,   110,   200,    95,   192,
       8,    53,    54,    55,    56,    57,    58,    68,   207,     8,
      68,   207,   135,   135,   192,   192,   192,   109,     4,   173,
     175,   205,   208,   121,   214,   214,   214,   214,   214,   214,
     214,   214,   214,   214,   214,    16,    17,    18,    19,    20,
      60,    61,   102,   112,   113,   114,   191,   201,   208,   214,
     215,    95,    96,   208,    95,   212,   212,   214,   212,   212,
     214,    95,    95,    95,   214,   160,   176,   176,    68,   122,
      10,   203,   204,   214,   193,   221,    95,   135,   214,   214,
     214,    95,    45,    46,    52,    64,    65,    66,    67,   107,
     110,   113,   114,   115,   116,   117,   118,   119,   120,   111,
       8,     8,   109,   109,   167,     4,    63,    75,   177,    77,
     208,   109,   208,    68,   122,    68,    68,   214,   214,   214,
     214,   214,   214,   214,   214,   215,   214,   214,   214,   214,
     214,   214,   214,   214,   109,   212,   212,   220,   220,     9,
      10,    80,   162,   168,   214,     4,   199,   208,   204,   214,
      95,   111,   214,   214,   208,   214,    72,    78,    79,   166,
       4,   121,     4,   214,   214,    96,   208,   161,   183,   203,
       4,    68,     4,     4,    68,     4,    68,   169,     4,   122,
     214,   214,   214,    29,    62,    71,   170,     4,     4,     4,
     171,   208,     4,   192,    95
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
#line 319 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 328 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 329 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 330 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 331 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 9:
#line 332 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 333 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 334 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 12:
#line 335 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 13:
#line 336 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 341 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 346 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 16:
#line 353 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 17:
#line 354 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 20:
#line 363 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 21:
#line 364 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 22:
#line 365 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 366 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 367 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 25:
#line 370 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 26:
#line 372 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 27:
#line 375 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, yyval.i->r[1]);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 28:
#line 381 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 30:
#line 389 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; }
    break;

  case 31:
#line 392 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 32:
#line 401 "imcc/imcc.y"
    { yyval.i=0;
                                 IMCC_INFO(interp)->cur_namespace = yyvsp[-1].sr;
                                 cur_namespace = yyvsp[-1].sr;
                                 }
    break;

  case 33:
#line 409 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 34:
#line 416 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 36:
#line 425 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 41:
#line 436 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 42:
#line 441 "imcc/imcc.y"
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

  case 43:
#line 455 "imcc/imcc.y"
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

  case 44:
#line 471 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 45:
#line 476 "imcc/imcc.y"
    {
          Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
          i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
          add_namespace(interp, i->r[1]);
          i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
        }
    break;

  case 46:
#line 483 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 47:
#line 487 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 48:
#line 488 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 49:
#line 489 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 50:
#line 493 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 51:
#line 494 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 52:
#line 498 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 502 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 54:
#line 504 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
            add_namespace(interp, i->r[1]);
            i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
         }
    break;

  case 55:
#line 511 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 56:
#line 515 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 57:
#line 516 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 58:
#line 517 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 59:
#line 521 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 60:
#line 522 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 61:
#line 527 "imcc/imcc.y"
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
                r1->pcc_sub->calls_a_sub = 1;
         }
    break;

  case 62:
#line 554 "imcc/imcc.y"
    { yyval.i = 0; current_call = NULL; }
    break;

  case 63:
#line 558 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 0; }
    break;

  case 64:
#line 559 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 1; }
    break;

  case 65:
#line 563 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 66:
#line 565 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 67:
#line 568 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 68:
#line 569 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 69:
#line 573 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 70:
#line 574 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 71:
#line 575 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 73:
#line 579 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 74:
#line 580 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 75:
#line 581 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 76:
#line 582 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 77:
#line 583 "imcc/imcc.y"
    {  yyval.t = P_METHOD | P_NONE ; }
    break;

  case 78:
#line 588 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 79:
#line 593 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 80:
#line 595 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-1].sr);
            current_call->r[0]->pcc_sub->nci = 1;
         }
    break;

  case 81:
#line 600 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 82:
#line 602 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-1].s,'S')); }
    break;

  case 83:
#line 604 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 84:
#line 608 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-3].s,'S'));
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 85:
#line 614 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 86:
#line 615 "imcc/imcc.y"
    {  add_pcc_arg(current_call->r[0], yyvsp[-1].sr);}
    break;

  case 87:
#line 619 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 88:
#line 620 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 89:
#line 624 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 90:
#line 625 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 91:
#line 630 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 92:
#line 631 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 93:
#line 632 "imcc/imcc.y"
    {  mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 94:
#line 637 "imcc/imcc.y"
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

  case 95:
#line 652 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 96:
#line 657 "imcc/imcc.y"
    {
            Instruction *i, *ins;
            SymReg *r;
            char name[128];
            ins = cur_unit->instructions;
            if(!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
               fataly(EX_SOFTWARE, sourcefile, line,
                      "pcc_yield not inside pcc subroutine\n");
            ins->r[1]->pcc_sub->calls_a_sub = 1;
            sprintf(name, "%cpcc_sub_yield_%d", IMCC_INTERNAL_CHAR, cnr++);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB | ITLABEL | ITPCCYIELD;
         }
    break;

  case 97:
#line 673 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 98:
#line 677 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 99:
#line 679 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 100:
#line 681 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 101:
#line 685 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 104:
#line 702 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 105:
#line 707 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 106:
#line 708 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 107:
#line 709 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 108:
#line 710 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 109:
#line 714 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 113:
#line 724 "imcc/imcc.y"
    {
                     /* $$ = iLABEL(cur_unit, mk_address(, U_add_uniq_label)); */
                     yyval.i = iLABEL(cur_unit, mk_local_label(cur_unit, yyvsp[0].s));
                   }
    break;

  case 114:
#line 732 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 117:
#line 738 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 118:
#line 739 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 119:
#line 740 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 120:
#line 740 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 121:
#line 741 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 122:
#line 742 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 123:
#line 743 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 124:
#line 744 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 125:
#line 745 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 126:
#line 745 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 127:
#line 747 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 128:
#line 748 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 129:
#line 749 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 130:
#line 750 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 131:
#line 751 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 132:
#line 752 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 133:
#line 753 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "inc",1, yyvsp[0].sr); }
    break;

  case 134:
#line 754 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "dec",1, yyvsp[0].sr); }
    break;

  case 135:
#line 755 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "saveall" ,0); }
    break;

  case 136:
#line 756 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restoreall" ,0); }
    break;

  case 137:
#line 757 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "end" ,0); }
    break;

  case 138:
#line 758 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 139:
#line 760 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 140:
#line 762 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 141:
#line 764 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 142:
#line 765 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 145:
#line 768 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 146:
#line 772 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 147:
#line 773 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 148:
#line 774 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 149:
#line 775 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 150:
#line 779 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 151:
#line 780 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 152:
#line 781 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 153:
#line 782 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 154:
#line 783 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 155:
#line 784 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 156:
#line 789 "imcc/imcc.y"
    {
            if((pmc_type(interp, string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 157:
#line 797 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 158:
#line 798 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 159:
#line 799 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 160:
#line 800 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 161:
#line 801 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 162:
#line 802 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 163:
#line 803 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 164:
#line 804 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 165:
#line 805 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 166:
#line 806 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 167:
#line 807 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 168:
#line 809 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 169:
#line 811 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 170:
#line 813 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 171:
#line 815 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 172:
#line 817 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 173:
#line 819 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 174:
#line 821 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 175:
#line 823 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 176:
#line 825 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 177:
#line 827 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 178:
#line 829 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 179:
#line 831 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 180:
#line 833 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 181:
#line 835 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                          mk_sub_address(yyvsp[0].s), NULL, 1); }
    break;

  case 182:
#line 838 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(yyvsp[-2].s),
                                           mk_sub_address(yyvsp[0].s), 1); }
    break;

  case 183:
#line 845 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                    2, yyvsp[-3].sr, mk_label_address(cur_unit, yyvsp[0].s)); }
    break;

  case 184:
#line 848 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 185:
#line 850 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 186:
#line 854 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 187:
#line 856 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "new",0,regs,nargs,keyvec,1); }
    break;

  case 188:
#line 859 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 189:
#line 865 "imcc/imcc.y"
    {
            yyval.i = create_itcall_label();
         }
    break;

  case 190:
#line 869 "imcc/imcc.y"
    {
           itcall_sub(yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 193:
#line 879 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 881 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 195:
#line 883 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 885 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 887 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 889 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 891 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 893 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 895 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 897 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 899 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 904 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 205:
#line 910 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 206:
#line 911 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                          fataly(1, sourcefile, line, "Sub isn't a PMC");
                     }
    break;

  case 207:
#line 915 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 208:
#line 916 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 209:
#line 917 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 210:
#line 920 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 211:
#line 921 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 212:
#line 926 "imcc/imcc.y"
    {
           yyval.i = create_itcall_label();
           itcall_sub(yyvsp[0].sr);
        }
    break;

  case 213:
#line 931 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 214:
#line 935 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 215:
#line 936 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 216:
#line 937 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 217:
#line 942 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 218:
#line 944 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 219:
#line 948 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 220:
#line 949 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 221:
#line 954 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 222:
#line 956 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 223:
#line 958 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 960 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 962 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 226:
#line 964 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 227:
#line 968 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 228:
#line 969 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 229:
#line 970 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 230:
#line 971 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 231:
#line 972 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 232:
#line 973 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 235:
#line 982 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 236:
#line 983 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 237:
#line 987 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 239:
#line 992 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 240:
#line 994 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 241:
#line 1002 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 242:
#line 1003 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 247:
#line 1016 "imcc/imcc.y"
    {  nkeys=0; }
    break;

  case 248:
#line 1017 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); }
    break;

  case 249:
#line 1021 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 250:
#line 1023 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 252:
#line 1031 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 253:
#line 1032 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 254:
#line 1033 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 255:
#line 1034 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 256:
#line 1035 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 257:
#line 1039 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 258:
#line 1040 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 259:
#line 1041 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 260:
#line 1045 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 261:
#line 1046 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3170 "imcc/imcparser.c"

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


#line 1051 "imcc/imcc.y"



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

