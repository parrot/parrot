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
     METHOD = 280,
     SUB = 281,
     SYM = 282,
     LOCAL = 283,
     CONST = 284,
     INC = 285,
     DEC = 286,
     GLOBAL_CONST = 287,
     SHIFT_LEFT = 288,
     SHIFT_RIGHT = 289,
     INTV = 290,
     FLOATV = 291,
     STRINGV = 292,
     PMCV = 293,
     OBJECTV = 294,
     DEFINED = 295,
     LOG_XOR = 296,
     RELOP_EQ = 297,
     RELOP_NE = 298,
     RELOP_GT = 299,
     RELOP_GTE = 300,
     RELOP_LT = 301,
     RELOP_LTE = 302,
     GLOBAL = 303,
     GLOBALOP = 304,
     ADDR = 305,
     CLONE = 306,
     RESULT = 307,
     RETURN = 308,
     POW = 309,
     SHIFT_RIGHT_U = 310,
     LOG_AND = 311,
     LOG_OR = 312,
     COMMA = 313,
     ESUB = 314,
     PCC_BEGIN = 315,
     PCC_END = 316,
     PCC_CALL = 317,
     PCC_SUB = 318,
     PCC_BEGIN_RETURN = 319,
     PCC_END_RETURN = 320,
     PCC_BEGIN_YIELD = 321,
     PCC_END_YIELD = 322,
     NCI_CALL = 323,
     PROTOTYPED = 324,
     NON_PROTOTYPED = 325,
     MAIN = 326,
     LOAD = 327,
     IMMEDIATE = 328,
     POSTCOMP = 329,
     LABEL = 330,
     EMIT = 331,
     EOM = 332,
     IREG = 333,
     NREG = 334,
     SREG = 335,
     PREG = 336,
     IDENTIFIER = 337,
     STRINGC = 338,
     INTC = 339,
     FLOATC = 340,
     REG = 341,
     MACRO = 342,
     ENDM = 343,
     PARROT_OP = 344,
     VAR = 345,
     LINECOMMENT = 346,
     FILECOMMENT = 347
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
#define METHOD 280
#define SUB 281
#define SYM 282
#define LOCAL 283
#define CONST 284
#define INC 285
#define DEC 286
#define GLOBAL_CONST 287
#define SHIFT_LEFT 288
#define SHIFT_RIGHT 289
#define INTV 290
#define FLOATV 291
#define STRINGV 292
#define PMCV 293
#define OBJECTV 294
#define DEFINED 295
#define LOG_XOR 296
#define RELOP_EQ 297
#define RELOP_NE 298
#define RELOP_GT 299
#define RELOP_GTE 300
#define RELOP_LT 301
#define RELOP_LTE 302
#define GLOBAL 303
#define GLOBALOP 304
#define ADDR 305
#define CLONE 306
#define RESULT 307
#define RETURN 308
#define POW 309
#define SHIFT_RIGHT_U 310
#define LOG_AND 311
#define LOG_OR 312
#define COMMA 313
#define ESUB 314
#define PCC_BEGIN 315
#define PCC_END 316
#define PCC_CALL 317
#define PCC_SUB 318
#define PCC_BEGIN_RETURN 319
#define PCC_END_RETURN 320
#define PCC_BEGIN_YIELD 321
#define PCC_END_YIELD 322
#define NCI_CALL 323
#define PROTOTYPED 324
#define NON_PROTOTYPED 325
#define MAIN 326
#define LOAD 327
#define IMMEDIATE 328
#define POSTCOMP 329
#define LABEL 330
#define EMIT 331
#define EOM 332
#define IREG 333
#define NREG 334
#define SREG 335
#define PREG 336
#define IDENTIFIER 337
#define STRINGC 338
#define INTC 339
#define FLOATC 340
#define REG 341
#define MACRO 342
#define ENDM 343
#define PARROT_OP 344
#define VAR 345
#define LINECOMMENT 346
#define FILECOMMENT 347




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
IMC_Unit * cur_unit;

/*
 * these are used for constructing one INS
 */
static SymReg *keys[IMCC_MAX_REGS];
static int nkeys;
static int keyvec;
static SymReg *regs[IMCC_MAX_REGS];
static int nargs;


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
#line 197 "imcc/imcc.y"
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
#line 463 "imcc/imcparser.c"
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
#line 484 "imcc/imcparser.c"

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
#define YYFINAL  32
#define YYLAST   449

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  110
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  93
/* YYNRULES -- Number of rules. */
#define YYNRULES  239
/* YYNRULES -- Number of states. */
#define YYNSTATES  414

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   347

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    95,     2,     2,     2,   101,   103,     2,
     107,   108,    99,    98,     2,    96,   102,   100,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   109,
       2,    94,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   105,     2,   106,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   104,     2,    97,     2,     2,     2,
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
      86,    87,    88,    89,    90,    91,    92,    93
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    25,    27,    31,    37,    38,    45,    47,    50,
      54,    57,    59,    61,    62,    66,    70,    71,    73,    74,
      79,    80,    87,    89,    90,    92,    95,    97,    99,   101,
     106,   111,   112,   113,   122,   123,   125,   129,   130,   135,
     138,   139,   140,   149,   150,   152,   156,   157,   162,   163,
     174,   175,   178,   180,   182,   183,   187,   189,   191,   193,
     195,   197,   199,   205,   209,   213,   214,   218,   221,   224,
     225,   229,   232,   233,   238,   239,   246,   247,   254,   255,
     258,   262,   265,   267,   270,   271,   274,   277,   279,   281,
     283,   285,   287,   289,   290,   292,   295,   297,   299,   303,
     305,   307,   310,   313,   314,   319,   320,   327,   328,   335,
     336,   341,   344,   347,   350,   353,   356,   359,   362,   365,
     367,   369,   371,   372,   376,   379,   380,   382,   384,   386,
     388,   390,   392,   394,   396,   398,   400,   402,   406,   411,
     416,   421,   427,   433,   439,   445,   451,   457,   463,   469,
     475,   481,   487,   493,   499,   505,   511,   517,   524,   531,
     538,   543,   548,   555,   560,   568,   573,   578,   583,   588,
     589,   593,   598,   606,   611,   615,   616,   626,   627,   633,
     634,   638,   640,   642,   645,   649,   651,   658,   665,   670,
     675,   680,   685,   687,   689,   691,   693,   695,   697,   699,
     701,   703,   705,   706,   708,   712,   714,   716,   721,   723,
     725,   727,   729,   731,   733,   735,   736,   739,   741,   745,
     747,   749,   751,   753,   755,   757,   759,   761,   763,   765
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     111,     0,    -1,   112,    -1,   113,    -1,   112,   113,    -1,
     124,    -1,   115,    -1,   114,    -1,   131,    -1,   138,    -1,
     122,    -1,    88,     4,    -1,     4,    -1,    49,   176,    83,
      -1,    49,   176,    83,    94,   201,    -1,    -1,    30,   116,
     176,    83,    94,   201,    -1,   118,    -1,   117,   118,    -1,
     165,   119,     4,    -1,    88,     4,    -1,    93,    -1,    92,
      -1,    -1,   120,    90,   121,    -1,    64,   148,    76,    -1,
      -1,   190,    -1,    -1,    77,   123,   117,    78,    -1,    -1,
      23,    83,   125,     4,   126,    24,    -1,   127,    -1,    -1,
     128,    -1,   127,   128,    -1,   129,    -1,   130,    -1,     4,
      -1,    25,   176,    83,     4,    -1,    26,    83,    83,     4,
      -1,    -1,    -1,    27,   132,    83,   148,     4,   133,   134,
     137,    -1,    -1,     4,    -1,   134,   135,     4,    -1,    -1,
       5,   136,   176,    83,    -1,   162,    60,    -1,    -1,    -1,
      64,   139,    83,   148,     4,   140,   141,   137,    -1,    -1,
       4,    -1,   141,   142,     4,    -1,    -1,     5,   143,   176,
      83,    -1,    -1,    61,   147,     4,   145,   151,   150,   146,
     153,    62,     4,    -1,    -1,   167,     4,    -1,    70,    -1,
      71,    -1,    -1,   148,    59,   149,    -1,   149,    -1,   147,
      -1,    73,    -1,    72,    -1,    74,    -1,    75,    -1,    63,
     195,    59,   195,     4,    -1,    63,   195,     4,    -1,    69,
     195,     4,    -1,    -1,   151,   152,     4,    -1,     9,   195,
      -1,    10,   188,    -1,    -1,   153,   154,     4,    -1,    53,
     188,    -1,    -1,    29,   155,   176,    83,    -1,    -1,    65,
       4,   157,   160,    66,     4,    -1,    -1,    67,     4,   159,
     160,    68,     4,    -1,    -1,   160,     4,    -1,   160,   161,
       4,    -1,    54,   195,    -1,   164,    -1,   162,   164,    -1,
      -1,   163,   168,    -1,    88,     4,    -1,   181,    -1,   144,
      -1,   156,    -1,   158,    -1,    93,    -1,    92,    -1,    -1,
     166,    -1,   166,   167,    -1,   167,    -1,    76,    -1,   165,
     169,     4,    -1,   178,    -1,   186,    -1,    21,    83,    -1,
      22,    83,    -1,    -1,    29,   170,   176,    83,    -1,    -1,
      30,   171,   176,    83,    94,   201,    -1,    -1,    33,   172,
     176,    83,    94,   201,    -1,    -1,     5,   173,   176,    83,
      -1,     5,   200,    -1,    53,   195,    -1,     9,   195,    -1,
      54,   195,    -1,     7,   193,    -1,     8,   193,    -1,    31,
     195,    -1,    32,   195,    -1,    14,    -1,    15,    -1,    13,
      -1,    -1,    17,   174,   121,    -1,    90,   190,    -1,    -1,
      17,    -1,    18,    -1,    19,    -1,    20,    -1,    36,    -1,
      37,    -1,    38,    -1,    39,    -1,    40,    -1,   177,    -1,
      83,    -1,   188,    94,   195,    -1,   188,    94,    95,   195,
      -1,   188,    94,    96,   195,    -1,   188,    94,    97,   195,
      -1,   188,    94,   195,    98,   195,    -1,   188,    94,   195,
      96,   195,    -1,   188,    94,   195,    99,   195,    -1,   188,
      94,   195,    55,   195,    -1,   188,    94,   195,   100,   195,
      -1,   188,    94,   195,   101,   195,    -1,   188,    94,   195,
     102,   195,    -1,   188,    94,   195,    34,   195,    -1,   188,
      94,   195,    35,   195,    -1,   188,    94,   195,    56,   195,
      -1,   188,    94,   195,    57,   195,    -1,   188,    94,   195,
      58,   195,    -1,   188,    94,   195,    42,   195,    -1,   188,
      94,   195,   103,   195,    -1,   188,    94,   195,   104,   195,
      -1,   188,    94,   195,    97,   195,    -1,   188,    94,   195,
     105,   196,   106,    -1,   195,   105,   196,   106,    94,   195,
      -1,   188,    94,    16,   177,    59,   195,    -1,   188,    94,
      16,   177,    -1,   188,    94,   175,    83,    -1,   188,    94,
     175,    83,    59,    83,    -1,   188,    94,    41,   195,    -1,
     188,    94,    41,   195,   105,   196,   106,    -1,   188,    94,
      52,   195,    -1,   188,    94,    51,    83,    -1,   188,    94,
      50,   202,    -1,    50,   202,    94,   195,    -1,    -1,    16,
     179,   121,    -1,    41,   188,    59,   195,    -1,    41,   188,
      59,   195,   105,   196,   106,    -1,    52,   188,    59,   195,
      -1,   188,    94,   181,    -1,    -1,   180,   107,   185,   108,
      94,    83,   107,   183,   108,    -1,    -1,    83,   182,   107,
     183,   108,    -1,    -1,   183,    59,   184,    -1,   184,    -1,
     195,    -1,    10,   188,    -1,   185,    59,   188,    -1,   188,
      -1,    11,   195,   187,   195,     8,   193,    -1,    12,   195,
     187,   195,     8,   193,    -1,    11,   195,     8,   193,    -1,
      12,   195,     8,   193,    -1,    11,   195,    59,   193,    -1,
      12,   195,    59,   193,    -1,    43,    -1,    44,    -1,    45,
      -1,    46,    -1,    47,    -1,    48,    -1,    91,    -1,   200,
      -1,    91,    -1,   200,    -1,    -1,   191,    -1,   191,    59,
     192,    -1,   192,    -1,   194,    -1,   189,   105,   196,   106,
      -1,    83,    -1,    90,    -1,   193,    -1,   195,    -1,    91,
      -1,   200,    -1,   201,    -1,    -1,   197,   198,    -1,   199,
      -1,   198,   109,   199,    -1,   195,    -1,    79,    -1,    80,
      -1,    81,    -1,    82,    -1,    87,    -1,    85,    -1,    86,
      -1,    84,    -1,    81,    -1,    84,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   261,   261,   265,   267,   270,   272,   273,   274,   275,
     276,   277,   278,   281,   287,   295,   294,   299,   301,   304,
     306,   307,   308,   311,   311,   315,   321,   324,   329,   328,
     342,   340,   356,   358,   361,   363,   366,   368,   369,   372,
     386,   404,   409,   402,   419,   421,   422,   426,   425,   430,
     435,   437,   434,   447,   449,   450,   454,   453,   460,   458,
     488,   490,   493,   495,   498,   500,   501,   504,   505,   506,
     507,   508,   511,   517,   519,   526,   528,   531,   533,   536,
     538,   541,   544,   544,   550,   548,   570,   568,   589,   591,
     593,   597,   601,   603,   614,   618,   621,   622,   623,   624,
     625,   626,   627,   630,   632,   635,   637,   640,   647,   652,
     654,   655,   656,   657,   657,   658,   658,   660,   660,   662,
     662,   664,   665,   666,   667,   668,   669,   670,   671,   672,
     673,   674,   675,   675,   678,   681,   684,   686,   687,   688,
     691,   693,   694,   695,   696,   697,   700,   709,   711,   712,
     713,   714,   715,   716,   717,   718,   719,   720,   721,   723,
     725,   727,   729,   731,   733,   735,   737,   739,   741,   743,
     745,   747,   750,   757,   759,   762,   764,   767,   769,   774,
     773,   777,   779,   782,   785,   792,   791,   816,   814,   835,
     837,   838,   841,   844,   848,   850,   853,   856,   858,   860,
     862,   864,   868,   870,   871,   872,   873,   874,   877,   879,
     882,   884,   887,   889,   892,   894,   897,   899,   907,   909,
     912,   914,   917,   919,   920,   923,   923,   927,   929,   933,
     937,   939,   940,   941,   942,   945,   947,   948,   951,   953
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
  "NAMESPACE", "ENDNAMESPACE", "CLASS", "ENDCLASS", "FIELD", "METHOD", 
  "SUB", "SYM", "LOCAL", "CONST", "INC", "DEC", "GLOBAL_CONST", 
  "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV", 
  "OBJECTV", "DEFINED", "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", 
  "RELOP_GTE", "RELOP_LT", "RELOP_LTE", "GLOBAL", "GLOBALOP", "ADDR", 
  "CLONE", "RESULT", "RETURN", "POW", "SHIFT_RIGHT_U", "LOG_AND", 
  "LOG_OR", "COMMA", "ESUB", "PCC_BEGIN", "PCC_END", "PCC_CALL", 
  "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD", 
  "PCC_END_YIELD", "NCI_CALL", "PROTOTYPED", "NON_PROTOTYPED", "MAIN", 
  "LOAD", "IMMEDIATE", "POSTCOMP", "LABEL", "EMIT", "EOM", "IREG", "NREG", 
  "SREG", "PREG", "IDENTIFIER", "STRINGC", "INTC", "FLOATC", "REG", 
  "MACRO", "ENDM", "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", 
  "'='", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", "'.'", "'&'", 
  "'|'", "'['", "']'", "'('", "')'", "';'", "$accept", "program", 
  "compilation_units", "compilation_unit", "global", "constdef", "@1", 
  "pasmcode", "pasmline", "pasm_inst", "@2", "pasm_args", "emit", "@3", 
  "class", "@4", "class_body", "member_decls", "member_decl", 
  "field_decl", "method_decl", "sub", "@5", "@6", "sub_params", 
  "sub_param", "@7", "sub_body", "pcc_sub", "@8", "@9", "pcc_params", 
  "pcc_param", "@10", "pcc_sub_call", "@11", "opt_label", "pcc_proto", 
  "pcc_sub_proto", "proto", "pcc_call", "pcc_args", "pcc_arg", 
  "pcc_results", "pcc_result", "@12", "pcc_ret", "@13", "pcc_yield", 
  "@14", "pcc_returns", "pcc_return", "statements", "helper_clear_state", 
  "statement", "labels", "_labels", "label", "instruction", 
  "labeled_inst", "@15", "@16", "@17", "@18", "@19", "newsub", "type", 
  "classname", "assignment", "@20", "@21", "sub_call", "@22", "arglist", 
  "arg", "targetlist", "if_statement", "relop", "target", "lhs", "vars", 
  "_vars", "_var_or_i", "label_op", "var_or_i", "var", "keylist", "@23", 
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
     344,   345,   346,   347,    61,    33,    45,   126,    43,    42,
      47,    37,    46,    38,   124,    91,    93,    40,    41,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   110,   111,   112,   112,   113,   113,   113,   113,   113,
     113,   113,   113,   114,   114,   116,   115,   117,   117,   118,
     118,   118,   118,   120,   119,   119,   119,   121,   123,   122,
     125,   124,   126,   126,   127,   127,   128,   128,   128,   129,
     130,   132,   133,   131,   134,   134,   134,   136,   135,   137,
     139,   140,   138,   141,   141,   141,   143,   142,   145,   144,
     146,   146,   147,   147,   148,   148,   148,   149,   149,   149,
     149,   149,   150,   150,   150,   151,   151,   152,   152,   153,
     153,   154,   155,   154,   157,   156,   159,   158,   160,   160,
     160,   161,   162,   162,   163,   164,   164,   164,   164,   164,
     164,   164,   164,   165,   165,   166,   166,   167,   168,   169,
     169,   169,   169,   170,   169,   171,   169,   172,   169,   173,
     169,   169,   169,   169,   169,   169,   169,   169,   169,   169,
     169,   169,   174,   169,   169,   169,   175,   175,   175,   175,
     176,   176,   176,   176,   176,   176,   177,   178,   178,   178,
     178,   178,   178,   178,   178,   178,   178,   178,   178,   178,
     178,   178,   178,   178,   178,   178,   178,   178,   178,   178,
     178,   178,   178,   178,   178,   178,   178,   178,   178,   179,
     178,   178,   178,   178,   178,   180,   178,   182,   181,   183,
     183,   183,   184,   184,   185,   185,   186,   186,   186,   186,
     186,   186,   187,   187,   187,   187,   187,   187,   188,   188,
     189,   189,   190,   190,   191,   191,   192,   192,   193,   193,
     194,   194,   195,   195,   195,   197,   196,   198,   198,   199,
     200,   200,   200,   200,   200,   201,   201,   201,   202,   202
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     3,     5,     0,     6,     1,     2,     3,
       2,     1,     1,     0,     3,     3,     0,     1,     0,     4,
       0,     6,     1,     0,     1,     2,     1,     1,     1,     4,
       4,     0,     0,     8,     0,     1,     3,     0,     4,     2,
       0,     0,     8,     0,     1,     3,     0,     4,     0,    10,
       0,     2,     1,     1,     0,     3,     1,     1,     1,     1,
       1,     1,     5,     3,     3,     0,     3,     2,     2,     0,
       3,     2,     0,     4,     0,     6,     0,     6,     0,     2,
       3,     2,     1,     2,     0,     2,     2,     1,     1,     1,
       1,     1,     1,     0,     1,     2,     1,     1,     3,     1,
       1,     2,     2,     0,     4,     0,     6,     0,     6,     0,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     1,
       1,     1,     0,     3,     2,     0,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     4,     4,
       4,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     6,     6,     6,
       4,     4,     6,     4,     7,     4,     4,     4,     4,     0,
       3,     4,     7,     4,     3,     0,     9,     0,     5,     0,
       3,     1,     1,     2,     3,     1,     6,     6,     4,     4,
       4,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     0,     1,     3,     1,     1,     4,     1,     1,
       1,     1,     1,     1,     1,     0,     2,     1,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       0,    12,     0,    41,    15,     0,    50,    28,     0,     0,
       2,     3,     7,     6,    10,     5,     8,     9,    30,     0,
       0,   140,   141,   142,   143,   144,   146,     0,   145,     0,
     103,    11,     1,     4,     0,    64,     0,    13,    64,   107,
       0,    22,    21,   103,    17,    23,   104,   106,    33,    62,
      63,    69,    68,    70,    71,    67,     0,    66,     0,     0,
       0,    20,    29,    18,    64,     0,     0,   105,    38,     0,
       0,     0,    32,    34,    36,    37,    42,     0,     0,   237,
     235,   236,    14,    51,     0,    19,   212,     0,     0,    31,
      35,    44,    65,    16,    53,    25,   230,   231,   232,   233,
     218,   234,   219,   222,    24,     0,    27,   213,   215,   220,
     216,   221,   223,   224,     0,     0,    45,    94,    54,    94,
     225,     0,    39,    40,    47,     0,     0,     0,   187,     0,
     102,   101,     0,    43,    98,    99,   100,    94,   103,    92,
      97,    56,    52,     0,     0,     0,   214,     0,     0,    84,
      86,     0,    96,    46,    49,    93,   135,    95,     0,    55,
     217,   222,   229,   226,   227,   223,     0,    58,    88,    88,
     189,   119,     0,     0,     0,     0,     0,   131,   129,   130,
     179,   132,     0,     0,   113,   115,     0,     0,   117,     0,
       0,     0,     0,     0,   212,   208,     0,   109,     0,   110,
       0,     0,   209,     0,     0,    48,    75,     0,     0,     0,
       0,   191,   192,     0,   121,   125,   126,   123,     0,     0,
     212,   212,   111,   112,     0,     0,   127,   128,     0,   208,
       0,   209,   238,   239,     0,     0,   122,   124,   134,   108,
       0,     0,   225,    57,   228,     0,    89,     0,     0,     0,
       0,   193,     0,   188,     0,     0,   202,   203,   204,   205,
     206,   207,     0,     0,     0,     0,     0,   180,   133,     0,
       0,     0,     0,     0,     0,     0,   195,     0,   136,   137,
     138,   139,     0,     0,     0,     0,     0,     0,     0,     0,
     184,   147,     0,     0,     0,     0,     0,    60,     0,    91,
      85,    90,    87,   190,   120,   198,   200,     0,   199,   201,
       0,   114,     0,     0,   181,   178,   183,     0,     0,   170,
     173,   177,   176,   175,   148,   149,   150,   171,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   225,     0,    77,    78,     0,     0,
      79,     0,    76,     0,     0,     0,     0,   225,   194,     0,
       0,   225,     0,   158,   159,   163,   154,   160,   161,   162,
     152,   166,   151,   153,   155,   156,   157,   164,   165,     0,
       0,    73,     0,    74,     0,    61,   196,   197,   116,   118,
       0,     0,   169,     0,   172,   167,   168,     0,    82,     0,
       0,     0,   182,   189,   174,    72,     0,    81,    59,    80,
       0,     0,   186,    83
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     9,    10,    11,    12,    13,    20,    43,    44,    65,
      66,   104,    14,    30,    15,    34,    71,    72,    73,    74,
      75,    16,    19,    91,   117,   132,   147,   133,    17,    29,
      94,   119,   143,   158,   134,   206,   350,    55,    56,    57,
     297,   245,   298,   384,   401,   406,   135,   168,   136,   169,
     207,   249,   137,   138,   139,    45,    46,    47,   157,   196,
     224,   225,   228,   213,   221,   289,    27,    28,   197,   220,
     198,   140,   151,   210,   211,   275,   199,   263,   200,   105,
     106,   107,   108,   109,   110,   111,   144,   145,   163,   164,
     165,   113,   234
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -237
static const short yypact[] =
{
       4,  -237,   -72,  -237,  -237,     2,  -237,  -237,    21,    23,
       4,  -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,   -36,
       2,  -237,  -237,  -237,  -237,  -237,  -237,   -33,  -237,   -27,
      19,  -237,  -237,  -237,    86,    28,   -24,    -1,    28,  -237,
     101,  -237,  -237,    55,  -237,     3,    37,  -237,    26,  -237,
    -237,  -237,  -237,  -237,  -237,  -237,    18,  -237,    29,    33,
      24,  -237,  -237,  -237,    28,   111,    32,  -237,  -237,     2,
      43,   106,    26,  -237,  -237,  -237,  -237,    28,    33,  -237,
    -237,  -237,  -237,  -237,   -41,  -237,   332,    57,    61,  -237,
    -237,   141,  -237,  -237,   142,  -237,  -237,  -237,  -237,  -237,
    -237,  -237,  -237,    44,  -237,    46,  -237,    95,  -237,  -237,
    -237,  -237,    51,  -237,   153,   154,  -237,    49,  -237,   172,
    -237,   332,  -237,  -237,  -237,    -5,   162,   163,  -237,   164,
    -237,  -237,   167,  -237,  -237,  -237,  -237,   343,    37,  -237,
    -237,  -237,  -237,   174,    70,   358,  -237,     2,   175,  -237,
    -237,    74,  -237,  -237,  -237,  -237,   263,  -237,     2,  -237,
    -237,  -237,  -237,    75,  -237,  -237,   104,  -237,  -237,  -237,
     110,    83,   -35,   -35,   358,   358,   358,  -237,  -237,  -237,
    -237,  -237,   105,   115,  -237,  -237,   358,   358,  -237,   171,
     -69,   171,   358,   358,   332,    94,   196,  -237,    96,  -237,
     108,   102,   107,   127,   358,  -237,  -237,     6,    10,   171,
     -50,  -237,  -237,     2,  -237,  -237,  -237,  -237,   198,   293,
     332,   332,  -237,  -237,     2,     2,  -237,  -237,     2,  -237,
     152,  -237,  -237,  -237,   119,   155,  -237,  -237,  -237,  -237,
     171,   310,  -237,  -237,  -237,     7,  -237,   358,   227,   231,
     232,  -237,   110,  -237,   157,   -35,  -237,  -237,  -237,  -237,
    -237,  -237,   -35,   358,   -35,   -35,   358,  -237,  -237,   165,
     166,   173,   358,   358,   358,   -39,  -237,   176,  -237,  -237,
    -237,  -237,   358,   -69,   178,   358,   358,   358,   358,   180,
    -237,   276,   132,   358,   171,   358,   358,    37,   262,  -237,
    -237,  -237,  -237,  -237,  -237,  -237,  -237,   265,  -237,  -237,
     273,  -237,   188,   189,   181,  -237,  -237,   171,   193,   229,
     184,  -237,  -237,  -237,  -237,  -237,  -237,   238,   358,   358,
     358,   358,   358,   358,   358,   358,   358,   358,   358,   358,
     358,   358,   358,   358,  -237,   197,  -237,  -237,    25,   296,
    -237,   298,  -237,   -35,   -35,    33,    33,  -237,  -237,   220,
     358,  -237,   222,  -237,  -237,  -237,  -237,  -237,  -237,  -237,
    -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,   200,
     358,  -237,   358,  -237,   -16,  -237,  -237,  -237,  -237,  -237,
     201,   202,  -237,   206,  -237,  -237,  -237,   304,  -237,   171,
     315,   316,  -237,   110,  -237,  -237,     2,  -237,  -237,  -237,
     -26,   239,  -237,  -237
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -237,  -237,  -237,   311,  -237,  -237,  -237,  -237,   280,  -237,
    -237,  -132,  -237,  -237,  -237,  -237,  -237,  -237,   252,  -237,
    -237,  -237,  -237,  -237,  -237,  -237,  -237,   216,  -237,  -237,
    -237,  -237,  -237,  -237,  -237,  -237,  -237,   221,   -19,   248,
    -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,  -237,
     186,  -237,  -237,  -237,   219,   225,  -237,   -43,  -237,  -237,
    -237,  -237,  -237,  -237,  -237,  -237,   -20,    80,  -237,  -237,
    -237,   117,  -237,   -44,   112,  -237,  -237,   146,  -165,  -237,
     177,  -237,   245,  -168,  -237,  -113,  -236,  -237,  -237,   179,
     -85,   -57,    84
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -224
static const short yytable[] =
{
      36,   112,    82,    67,   215,   216,   292,   -26,     1,   252,
     246,    18,   232,   398,   246,   233,   293,   294,    77,    60,
     317,    93,    76,    32,   230,    31,   235,     2,    83,   381,
      68,     3,   162,   252,     4,    95,   112,   399,    21,    22,
      23,    24,    25,   201,   251,    84,   400,    35,   100,    87,
      37,    69,    70,     5,   124,   102,    38,   212,   253,    58,
     247,   217,   218,   219,   247,    49,    50,    64,     6,   318,
     295,   202,   248,   226,   227,   276,   296,    77,   250,   236,
     237,     7,   412,    77,   382,    26,   214,   305,   267,   268,
      48,   162,     8,    59,   306,    39,   308,   309,    49,    50,
      51,    52,    53,    54,   231,    61,   231,    40,   379,   112,
     125,    41,    42,    39,   126,    85,   127,    79,    80,    81,
     209,   390,    86,    78,   231,   393,    88,   166,   291,   347,
      89,    39,   128,    62,   299,   112,   112,   129,   203,   212,
     114,   130,   131,    40,   115,   116,   118,    41,    42,  -210,
     307,   120,   358,   310,   121,   231,  -211,   122,   123,   314,
     315,   316,    96,    97,    98,    99,   149,   150,   152,   320,
     101,   153,   323,   324,   325,   326,   160,   141,   159,   167,
     346,   170,   348,   349,   204,   386,   387,   205,   222,    96,
      97,    98,    99,   254,    79,    80,    81,   101,   223,  -222,
     239,   161,   241,   240,   269,   270,   255,   242,   271,   231,
     243,   272,  -223,   273,   274,   363,   364,   365,   366,   367,
     368,   369,   370,   371,   372,   373,   374,   375,   376,   377,
     378,   300,   231,   125,   407,   301,   302,   126,   345,   127,
     304,   256,   257,   258,   259,   260,   261,   392,   311,   312,
      96,    97,    98,    99,   351,   128,   313,   262,   101,    26,
     129,   322,   229,   327,   130,   131,   352,   396,   171,   397,
     172,   173,   174,   353,   175,   176,   177,   178,   179,   180,
     181,   354,   355,   356,   182,   183,   357,   359,   360,   361,
     212,   380,   184,   185,   186,   187,   188,   362,   388,   389,
     383,   264,   385,   391,   189,   394,   395,   402,   405,   403,
     328,   329,   404,   190,   231,   191,   192,   193,   330,   408,
     409,    33,   413,    63,    90,    92,   277,   278,   279,   280,
     281,   331,   332,   333,   334,   142,   256,   257,   258,   259,
     260,   261,    96,    97,    98,    99,   148,    79,    80,    81,
     101,   282,   265,   194,   195,   208,   155,   319,   290,   410,
     283,   284,   285,   156,   303,   266,   146,   321,     0,     0,
    -185,   238,   335,   336,   337,   338,   339,   340,   341,   342,
     343,   344,     0,   244,     0,     0,   411,     0,     0,    96,
      97,    98,    99,   128,    79,    80,    81,   101,     0,     0,
       0,   161,     0,   154,   125,   286,   287,   288,   126,     0,
     127,    96,    97,    98,    99,   100,    79,    80,    81,   101,
       0,     0,   102,   103,     0,     0,   128,     0,     0,     0,
       0,   129,     0,     0,     0,   130,   131,    96,    97,    98,
      99,     0,    79,    80,    81,   101,     0,     0,     0,   161
};

static const short yycheck[] =
{
      20,    86,    59,    46,   172,   173,   242,     4,     4,    59,
       4,    83,    81,    29,     4,    84,     9,    10,    59,    38,
      59,    78,     4,     0,   189,     4,   191,    23,     4,     4,
       4,    27,   145,    59,    30,    76,   121,    53,    36,    37,
      38,    39,    40,   156,   209,    64,    62,    83,    83,    69,
      83,    25,    26,    49,     5,    90,    83,   170,   108,    83,
      54,   174,   175,   176,    54,    70,    71,    64,    64,   108,
      63,   156,    66,   186,   187,   240,    69,    59,    68,   192,
     193,    77,   108,    59,    59,    83,   171,   255,   220,   221,
       4,   204,    88,    94,   262,    76,   264,   265,    70,    71,
      72,    73,    74,    75,   189,     4,   191,    88,   344,   194,
      61,    92,    93,    76,    65,     4,    67,    84,    85,    86,
      10,   357,    90,    94,   209,   361,    83,   147,   241,   294,
      24,    76,    83,    78,   247,   220,   221,    88,   158,   252,
      83,    92,    93,    88,    83,     4,     4,    92,    93,   105,
     263,   105,   317,   266,    59,   240,   105,     4,     4,   272,
     273,   274,    79,    80,    81,    82,     4,     4,     4,   282,
      87,     4,   285,   286,   287,   288,   106,     5,     4,     4,
     293,   107,   295,   296,   109,   353,   354,    83,    83,    79,
      80,    81,    82,   213,    84,    85,    86,    87,    83,   105,
       4,    91,    94,   107,   224,   225,     8,   105,   228,   294,
      83,    59,   105,    94,    59,   328,   329,   330,   331,   332,
     333,   334,   335,   336,   337,   338,   339,   340,   341,   342,
     343,     4,   317,    61,   399,     4,     4,    65,   106,    67,
      83,    43,    44,    45,    46,    47,    48,   360,    83,    83,
      79,    80,    81,    82,   297,    83,    83,    59,    87,    83,
      88,    83,    91,    83,    92,    93,     4,   380,     5,   382,
       7,     8,     9,     8,    11,    12,    13,    14,    15,    16,
      17,     8,    94,    94,    21,    22,   105,    94,    59,   105,
     403,    94,    29,    30,    31,    32,    33,    59,   355,   356,
       4,     8,     4,    83,    41,    83,   106,   106,     4,   107,
      34,    35,   106,    50,   399,    52,    53,    54,    42,     4,
       4,    10,    83,    43,    72,    77,    16,    17,    18,    19,
      20,    55,    56,    57,    58,   119,    43,    44,    45,    46,
      47,    48,    79,    80,    81,    82,   125,    84,    85,    86,
      87,    41,    59,    90,    91,   169,   137,   277,   241,   403,
      50,    51,    52,   138,   252,   219,   121,   283,    -1,    -1,
     107,   194,    96,    97,    98,    99,   100,   101,   102,   103,
     104,   105,    -1,   204,    -1,    -1,   406,    -1,    -1,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    -1,    -1,
      -1,    91,    -1,    60,    61,    95,    96,    97,    65,    -1,
      67,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      -1,    -1,    90,    91,    -1,    -1,    83,    -1,    -1,    -1,
      -1,    88,    -1,    -1,    -1,    92,    93,    79,    80,    81,
      82,    -1,    84,    85,    86,    87,    -1,    -1,    -1,    91
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    23,    27,    30,    49,    64,    77,    88,   111,
     112,   113,   114,   115,   122,   124,   131,   138,    83,   132,
     116,    36,    37,    38,    39,    40,    83,   176,   177,   139,
     123,     4,     0,   113,   125,    83,   176,    83,    83,    76,
      88,    92,    93,   117,   118,   165,   166,   167,     4,    70,
      71,    72,    73,    74,    75,   147,   148,   149,    83,    94,
     148,     4,    78,   118,    64,   119,   120,   167,     4,    25,
      26,   126,   127,   128,   129,   130,     4,    59,    94,    84,
      85,    86,   201,     4,   148,     4,    90,   176,    83,    24,
     128,   133,   149,   201,   140,    76,    79,    80,    81,    82,
      83,    87,    90,    91,   121,   189,   190,   191,   192,   193,
     194,   195,   200,   201,    83,    83,     4,   134,     4,   141,
     105,    59,     4,     4,     5,    61,    65,    67,    83,    88,
      92,    93,   135,   137,   144,   156,   158,   162,   163,   164,
     181,     5,   137,   142,   196,   197,   192,   136,   147,     4,
       4,   182,     4,     4,    60,   164,   165,   168,   143,     4,
     106,    91,   195,   198,   199,   200,   176,     4,   157,   159,
     107,     5,     7,     8,     9,    11,    12,    13,    14,    15,
      16,    17,    21,    22,    29,    30,    31,    32,    33,    41,
      50,    52,    53,    54,    90,    91,   169,   178,   180,   186,
     188,   195,   200,   176,   109,    83,   145,   160,   160,    10,
     183,   184,   195,   173,   200,   193,   193,   195,   195,   195,
     179,   174,    83,    83,   170,   171,   195,   195,   172,    91,
     188,   200,    81,    84,   202,   188,   195,   195,   190,     4,
     107,    94,   105,    83,   199,   151,     4,    54,    66,   161,
      68,   188,    59,   108,   176,     8,    43,    44,    45,    46,
      47,    48,    59,   187,     8,    59,   187,   121,   121,   176,
     176,   176,    59,    94,    59,   185,   188,    16,    17,    18,
      19,    20,    41,    50,    51,    52,    95,    96,    97,   175,
     181,   195,   196,     9,    10,    63,    69,   150,   152,   195,
       4,     4,     4,   184,    83,   193,   193,   195,   193,   193,
     195,    83,    83,    83,   195,   195,   195,    59,   108,   177,
     195,   202,    83,   195,   195,   195,   195,    83,    34,    35,
      42,    55,    56,    57,    58,    96,    97,    98,    99,   100,
     101,   102,   103,   104,   105,   106,   195,   188,   195,   195,
     146,   167,     4,     8,     8,    94,    94,   105,   188,    94,
      59,   105,    59,   195,   195,   195,   195,   195,   195,   195,
     195,   195,   195,   195,   195,   195,   195,   195,   195,   196,
      94,     4,    59,     4,   153,     4,   193,   193,   201,   201,
     196,    83,   195,   196,    83,   106,   195,   195,    29,    53,
      62,   154,   106,   107,   106,     4,   155,   188,     4,     4,
     183,   176,   108,    83
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
#line 262 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 271 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 272 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 273 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 274 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 275 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 276 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 277 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 12:
#line 278 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 283 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 14:
#line 288 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 295 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 16:
#line 296 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 19:
#line 305 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 20:
#line 306 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 21:
#line 307 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 22:
#line 308 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 311 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 24:
#line 313 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 25:
#line 316 "imcc/imcc.y"
    { char *name = str_dup(yyvsp[0].s);
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(name, 0);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 26:
#line 321 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 28:
#line 329 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; }
    break;

  case 29:
#line 332 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 30:
#line 342 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 31:
#line 349 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 33:
#line 358 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 38:
#line 369 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 39:
#line 374 "imcc/imcc.y"
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

  case 40:
#line 388 "imcc/imcc.y"
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

  case 41:
#line 404 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 42:
#line 409 "imcc/imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
        }
    break;

  case 43:
#line 416 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 44:
#line 420 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 45:
#line 421 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 46:
#line 422 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 47:
#line 426 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 48:
#line 427 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 49:
#line 431 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 50:
#line 435 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 51:
#line 437 "imcc/imcc.y"
    {
            char *name = str_dup(yyvsp[-2].s);
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
            i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
         }
    break;

  case 52:
#line 444 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 448 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 54:
#line 449 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 55:
#line 450 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 56:
#line 454 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 57:
#line 455 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 58:
#line 460 "imcc/imcc.y"
    {
            char name[128];
            SymReg * r;
            Instruction *i;

            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, line - 1);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            r->pcc_sub->pragma = yyvsp[-1].t;
            /* this mid rule action has the semantic value of the
             * sub SymReg.
             * This is used below to append args & results
             */
            i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB;
            /*
             * if we are inside a pcc_sub mark the sub as doing a
             * sub call; the sub is in r1 of the first ins
             */
            if (cur_unit->instructions->r[1] && cur_unit->instructions->r[1]->pcc_sub)
                cur_unit->instructions->r[1]->pcc_sub->calls_a_sub = 1;
         }
    break;

  case 59:
#line 485 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 60:
#line 489 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-2].sr ->pcc_sub->label = 0; }
    break;

  case 61:
#line 490 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-4].sr ->pcc_sub->label = 1; }
    break;

  case 62:
#line 494 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 63:
#line 495 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 64:
#line 499 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 65:
#line 500 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 66:
#line 501 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 68:
#line 505 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 69:
#line 506 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 70:
#line 507 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 71:
#line 508 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 72:
#line 513 "imcc/imcc.y"
    {
            add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
            add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
         }
    break;

  case 73:
#line 518 "imcc/imcc.y"
    {  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr); }
    break;

  case 74:
#line 520 "imcc/imcc.y"
    {
            add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
            yyvsp[-4].sr ->pcc_sub->nci = 1;
         }
    break;

  case 75:
#line 527 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 76:
#line 528 "imcc/imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 77:
#line 532 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 78:
#line 533 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 79:
#line 537 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 80:
#line 538 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 81:
#line 543 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 82:
#line 544 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 83:
#line 545 "imcc/imcc.y"
    {  mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 84:
#line 550 "imcc/imcc.y"
    {
            Instruction *i, *ins;
            SymReg *r;
            char name[128];
            ins = cur_unit->instructions;
            if(!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
               fataly(EX_SOFTWARE, sourcefile, line,
                      "pcc_return not inside pcc subroutine\n");
            sprintf(name, "%cpcc_sub_ret_%d", IMCC_INTERNAL_CHAR, line - 1);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB | ITLABEL;
         }
    break;

  case 85:
#line 565 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 86:
#line 570 "imcc/imcc.y"
    {
            Instruction *i, *ins;
            SymReg *r;
            char name[128];
            ins = cur_unit->instructions;
            if(!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
               fataly(EX_SOFTWARE, sourcefile, line,
                      "pcc_yield not inside pcc subroutine\n");
            ins->r[1]->pcc_sub->calls_a_sub = 1;
            sprintf(name, "%cpcc_sub_yield_%d", IMCC_INTERNAL_CHAR, line - 1);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB | ITLABEL | ITPCCYIELD;
         }
    break;

  case 87:
#line 586 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 88:
#line 590 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 89:
#line 592 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 90:
#line 594 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 91:
#line 598 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 94:
#line 615 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 95:
#line 620 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 96:
#line 621 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 97:
#line 622 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 98:
#line 623 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 101:
#line 626 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 102:
#line 627 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 103:
#line 631 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 107:
#line 641 "imcc/imcc.y"
    {
                     /* $$ = iLABEL(cur_unit, mk_address(, U_add_uniq_label)); */
                     yyval.i = iLABEL(cur_unit, mk_local_label(cur_unit, yyvsp[0].s));
                   }
    break;

  case 108:
#line 649 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 111:
#line 655 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 112:
#line 656 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 113:
#line 657 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 114:
#line 657 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 115:
#line 658 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 116:
#line 659 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 117:
#line 660 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 118:
#line 661 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 119:
#line 662 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 120:
#line 662 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 121:
#line 664 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 122:
#line 665 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 123:
#line 666 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 124:
#line 667 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 125:
#line 668 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 126:
#line 669 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 127:
#line 670 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "inc",1, yyvsp[0].sr); }
    break;

  case 128:
#line 671 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "dec",1, yyvsp[0].sr); }
    break;

  case 129:
#line 672 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "saveall" ,0); }
    break;

  case 130:
#line 673 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restoreall" ,0); }
    break;

  case 131:
#line 674 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "end" ,0); }
    break;

  case 132:
#line 675 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 133:
#line 677 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 134:
#line 679 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 135:
#line 681 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 136:
#line 685 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 137:
#line 686 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 138:
#line 687 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 139:
#line 688 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 140:
#line 692 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 141:
#line 693 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 142:
#line 694 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 143:
#line 695 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 144:
#line 696 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 145:
#line 697 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 146:
#line 702 "imcc/imcc.y"
    {
            if((pmc_type(interp, string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 147:
#line 710 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 148:
#line 711 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 149:
#line 712 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 150:
#line 713 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 151:
#line 714 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 152:
#line 715 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 153:
#line 716 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 154:
#line 717 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 155:
#line 718 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 156:
#line 719 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 157:
#line 720 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 158:
#line 722 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 159:
#line 724 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 160:
#line 726 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 161:
#line 728 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 162:
#line 730 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 163:
#line 732 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 164:
#line 734 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 165:
#line 736 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 166:
#line 738 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 167:
#line 740 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 168:
#line 742 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 169:
#line 744 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 170:
#line 746 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 171:
#line 748 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                          mk_sub_address(yyvsp[0].s), NULL, 1); }
    break;

  case 172:
#line 751 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(yyvsp[-2].s),
                                           mk_sub_address(yyvsp[0].s), 1); }
    break;

  case 173:
#line 758 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 174:
#line 760 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3,yyvsp[-6].sr,yyvsp[-3].sr,yyvsp[-1].sr); }
    break;

  case 175:
#line 763 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone",2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 176:
#line 765 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                    2, yyvsp[-3].sr, mk_label_address(cur_unit, yyvsp[0].s)); }
    break;

  case 177:
#line 768 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 178:
#line 770 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 179:
#line 774 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 180:
#line 776 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "new",0,regs,nargs,keyvec,1); }
    break;

  case 181:
#line 778 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 182:
#line 780 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 183:
#line 783 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 786 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 185:
#line 792 "imcc/imcc.y"
    {
            char name[128];
            SymReg * r;
            Instruction *i;
            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, line - 1);
            r = mk_pcc_sub(str_dup(name), 0);
            current_call = i = iLABEL(cur_unit, r);
            i->type = ITCALL | ITPCCSUB;
            yyval.i = i;
         }
    break;

  case 186:
#line 803 "imcc/imcc.y"
    {
            current_call->r[0]->pcc_sub->sub = mk_sub_address(yyvsp[-3].s);
           /* FIXME use the default settings from .pragma */
            current_call->r[0]->pcc_sub->pragma = P_PROTOTYPED;
            if(cur_unit->type == IMC_PCCSUB)
               cur_unit->instructions->r[1]->pcc_sub->calls_a_sub = 1;

            current_call = NULL;
         }
    break;

  case 187:
#line 816 "imcc/imcc.y"
    {
           char name[128];
           SymReg * r;
           Instruction *i;
           sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, line - 1);
           r = mk_pcc_sub(str_dup(name), 0);
           current_call = i = iLABEL(cur_unit, r);
           i->type = ITCALL | ITPCCSUB;
           yyval.i = i;
           current_call->r[0]->pcc_sub->sub = mk_sub_address(yyvsp[0].s);
           /* FIXME use the default settings from .pragma */
           current_call->r[0]->pcc_sub->pragma = P_PROTOTYPED;
           if(cur_unit->type == IMC_PCCSUB)
              cur_unit->instructions->r[1]->pcc_sub->calls_a_sub = 1;
        }
    break;

  case 188:
#line 832 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 189:
#line 836 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 190:
#line 837 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 191:
#line 838 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 192:
#line 843 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 193:
#line 845 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 194:
#line 849 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 195:
#line 850 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 196:
#line 855 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 857 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 859 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 861 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 863 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 865 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 869 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 203:
#line 870 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 204:
#line 871 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 205:
#line 872 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 206:
#line 873 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 207:
#line 874 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 212:
#line 888 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 213:
#line 889 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 214:
#line 893 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 216:
#line 898 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 217:
#line 900 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 218:
#line 908 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 219:
#line 909 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 225:
#line 923 "imcc/imcc.y"
    {  nkeys=0; }
    break;

  case 226:
#line 924 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); }
    break;

  case 227:
#line 928 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 228:
#line 930 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 230:
#line 938 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 231:
#line 939 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 232:
#line 940 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 233:
#line 941 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 234:
#line 942 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 235:
#line 946 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 236:
#line 947 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 237:
#line 948 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 238:
#line 952 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 239:
#line 953 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2936 "imcc/imcparser.c"

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


#line 958 "imcc/imcc.y"



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

