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
     CALL = 260,
     GOTO = 261,
     ARG = 262,
     FLATTEN_ARG = 263,
     IF = 264,
     UNLESS = 265,
     NEW = 266,
     END = 267,
     SAVEALL = 268,
     RESTOREALL = 269,
     NAMESPACE = 270,
     ENDNAMESPACE = 271,
     CLASS = 272,
     ENDCLASS = 273,
     FIELD = 274,
     METHOD = 275,
     SUB = 276,
     SYM = 277,
     LOCAL = 278,
     CONST = 279,
     INC = 280,
     DEC = 281,
     GLOBAL_CONST = 282,
     SHIFT_LEFT = 283,
     SHIFT_RIGHT = 284,
     INTV = 285,
     FLOATV = 286,
     STRINGV = 287,
     DEFINED = 288,
     LOG_XOR = 289,
     RELOP_EQ = 290,
     RELOP_NE = 291,
     RELOP_GT = 292,
     RELOP_GTE = 293,
     RELOP_LT = 294,
     RELOP_LTE = 295,
     GLOBAL = 296,
     ADDR = 297,
     CLONE = 298,
     RESULT = 299,
     RETURN = 300,
     POW = 301,
     SHIFT_RIGHT_U = 302,
     LOG_AND = 303,
     LOG_OR = 304,
     COMMA = 305,
     ESUB = 306,
     PCC_BEGIN = 307,
     PCC_END = 308,
     PCC_CALL = 309,
     PCC_SUB = 310,
     PCC_BEGIN_RETURN = 311,
     PCC_END_RETURN = 312,
     PCC_BEGIN_YIELD = 313,
     PCC_END_YIELD = 314,
     NCI_CALL = 315,
     PROTOTYPED = 316,
     NON_PROTOTYPED = 317,
     LABEL = 318,
     EMIT = 319,
     EOM = 320,
     IREG = 321,
     NREG = 322,
     SREG = 323,
     PREG = 324,
     IDENTIFIER = 325,
     STRINGC = 326,
     INTC = 327,
     FLOATC = 328,
     REG = 329,
     MACRO = 330,
     ENDM = 331,
     PARROT_OP = 332,
     VAR = 333,
     LINECOMMENT = 334,
     FILECOMMENT = 335
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define CALL 260
#define GOTO 261
#define ARG 262
#define FLATTEN_ARG 263
#define IF 264
#define UNLESS 265
#define NEW 266
#define END 267
#define SAVEALL 268
#define RESTOREALL 269
#define NAMESPACE 270
#define ENDNAMESPACE 271
#define CLASS 272
#define ENDCLASS 273
#define FIELD 274
#define METHOD 275
#define SUB 276
#define SYM 277
#define LOCAL 278
#define CONST 279
#define INC 280
#define DEC 281
#define GLOBAL_CONST 282
#define SHIFT_LEFT 283
#define SHIFT_RIGHT 284
#define INTV 285
#define FLOATV 286
#define STRINGV 287
#define DEFINED 288
#define LOG_XOR 289
#define RELOP_EQ 290
#define RELOP_NE 291
#define RELOP_GT 292
#define RELOP_GTE 293
#define RELOP_LT 294
#define RELOP_LTE 295
#define GLOBAL 296
#define ADDR 297
#define CLONE 298
#define RESULT 299
#define RETURN 300
#define POW 301
#define SHIFT_RIGHT_U 302
#define LOG_AND 303
#define LOG_OR 304
#define COMMA 305
#define ESUB 306
#define PCC_BEGIN 307
#define PCC_END 308
#define PCC_CALL 309
#define PCC_SUB 310
#define PCC_BEGIN_RETURN 311
#define PCC_END_RETURN 312
#define PCC_BEGIN_YIELD 313
#define PCC_END_YIELD 314
#define NCI_CALL 315
#define PROTOTYPED 316
#define NON_PROTOTYPED 317
#define LABEL 318
#define EMIT 319
#define EOM 320
#define IREG 321
#define NREG 322
#define SREG 323
#define PREG 324
#define IDENTIFIER 325
#define STRINGC 326
#define INTC 327
#define FLOATC 328
#define REG 329
#define MACRO 330
#define ENDM 331
#define PARROT_OP 332
#define VAR 333
#define LINECOMMENT 334
#define FILECOMMENT 335




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
#define MAIN
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
MK_I(struct Parrot_Interp *interpreter, const char * fmt, int n, ...)
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
    return INS(interpreter, opname, fmt, r, n, keyvec, 1);
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


Instruction * INS_LABEL(SymReg * r0, int emit)
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
        emitb(ins);
    return ins;
}

static Instruction * iLABEL(SymReg * r0) {
    Instruction *i = INS_LABEL(r0, 1);
    i->line = line;
    clear_state();
    return i;
}


static Instruction * iSUBROUTINE(SymReg * r0) {
    Instruction *i;
    function = r0->name;
    i =  iLABEL(r0);
    i->line = line - 1;
    if (*r0->name != '_')
        fataly(EX_SOFTWARE, sourcefile, line,
        "illegal local label '%s'\n", r0->name);
    return i;
}


/*
 * substr or X = Pkey
 */
static Instruction *
iINDEXFETCH(struct Parrot_Interp *interp, SymReg * r0, SymReg * r1,
    SymReg * r2)
{
    if(r0->set == 'S' && r1->set == 'S' && r2->set == 'I') {
        SymReg * r3 = mk_const(str_dup("1"), 'I');
        return MK_I(interp, "substr %s, %s, %s, 1", 4, r0, r1, r2, r3);
    }
    keyvec |= KEY_BIT(2);
    return MK_I(interp, "set %s, %s[%s]", 3, r0,r1,r2);
}

/*
 * substr or Pkey = X
 */

static Instruction *
iINDEXSET(struct Parrot_Interp *interp, SymReg * r0, SymReg * r1, SymReg * r2)
{
    if(r0->set == 'S' && r1->set == 'I' && r2->set == 'S') {
        SymReg * r3 = mk_const(str_dup("1"), 'I');
        MK_I(interp, "substr %s, %s, %s, %s", 4, r0, r1,r3, r2);
    }
    else if (r0->set == 'P') {
        keyvec |= KEY_BIT(1);
	MK_I(interp, "set %s[%s], %s", 3, r0,r1,r2);
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
#line 203 "imcc/imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
    Symbol * sym;
    SymbolList * symlist;
    SymbolTable * symtab;
} yystype;
/* Line 193 of /usr/local/share/bison/yacc.c.  */
#line 445 "imcc/imcparser.c"
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


/* Line 213 of /usr/local/share/bison/yacc.c.  */
#line 466 "imcc/imcparser.c"

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
#define YYFINAL  3
#define YYLAST   346

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  96
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  80
/* YYNRULES -- Number of rules. */
#define YYNRULES  201
/* YYNRULES -- Number of states. */
#define YYNSTATES  347

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   335

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    83,     2,     2,     2,    89,    91,     2,
       2,     2,    87,    86,     2,    84,    90,    88,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    95,
       2,    82,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    93,     2,    94,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    92,     2,    85,     2,     2,     2,
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
      76,    77,    78,    79,    80,    81
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     4,     7,     9,    11,    13,    15,    18,
      20,    22,    25,    27,    30,    34,    37,    39,    41,    42,
      46,    49,    50,    52,    53,    58,    59,    66,    68,    69,
      71,    74,    76,    78,    80,    85,    89,    92,    95,    96,
     101,   102,   103,   112,   113,   115,   119,   120,   125,   126,
     137,   138,   141,   143,   145,   146,   148,   154,   158,   162,
     163,   167,   170,   173,   174,   178,   181,   182,   187,   188,
     195,   196,   203,   204,   207,   211,   214,   216,   219,   220,
     223,   226,   228,   230,   232,   234,   236,   237,   239,   242,
     244,   246,   250,   252,   254,   257,   260,   261,   266,   267,
     274,   275,   282,   283,   288,   291,   294,   297,   300,   303,
     306,   309,   312,   314,   316,   318,   321,   322,   324,   326,
     328,   330,   332,   336,   341,   346,   351,   357,   363,   369,
     375,   381,   387,   393,   399,   405,   411,   417,   423,   429,
     435,   441,   447,   454,   461,   468,   473,   478,   486,   491,
     496,   501,   506,   507,   511,   516,   524,   529,   536,   543,
     548,   553,   558,   563,   565,   567,   569,   571,   573,   575,
     577,   579,   581,   583,   584,   586,   590,   592,   594,   599,
     601,   603,   605,   607,   609,   611,   612,   615,   617,   621,
     623,   625,   627,   629,   631,   633,   635,   637,   639,   641,
     643,   645
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
      97,     0,    -1,    -1,    98,   100,    -1,   108,    -1,   115,
      -1,   119,    -1,   106,    -1,    76,     4,    -1,     4,    -1,
      99,    -1,   100,    99,    -1,   102,    -1,   101,   102,    -1,
     145,   103,     4,    -1,    76,     4,    -1,    81,    -1,    80,
      -1,    -1,   104,    78,   105,    -1,    56,    64,    -1,    -1,
     162,    -1,    -1,    65,   107,   101,    66,    -1,    -1,    18,
      71,   109,     4,   110,    19,    -1,   111,    -1,    -1,   112,
      -1,   111,   112,    -1,   113,    -1,   114,    -1,     4,    -1,
      20,   154,    71,     4,    -1,    21,    71,     4,    -1,   117,
     116,    -1,   142,    52,    -1,    -1,    22,   118,    71,     4,
      -1,    -1,    -1,    56,   120,    71,   129,     4,   121,   122,
     116,    -1,    -1,     4,    -1,   122,   123,     4,    -1,    -1,
       5,   124,   154,    71,    -1,    -1,    53,   128,     4,   126,
     131,   130,   127,   133,    54,     4,    -1,    -1,   147,     4,
      -1,    62,    -1,    63,    -1,    -1,   128,    -1,    55,   167,
      51,   167,     4,    -1,    55,   167,     4,    -1,    61,   167,
       4,    -1,    -1,   131,   132,     4,    -1,     8,   167,    -1,
       9,   160,    -1,    -1,   133,   134,     4,    -1,    45,   160,
      -1,    -1,    24,   135,   154,    71,    -1,    -1,    57,     4,
     137,   140,    58,     4,    -1,    -1,    59,     4,   139,   140,
      60,     4,    -1,    -1,   140,     4,    -1,   140,   141,     4,
      -1,    46,   167,    -1,   144,    -1,   142,   144,    -1,    -1,
     143,   148,    -1,    76,     4,    -1,   125,    -1,   136,    -1,
     138,    -1,    81,    -1,    80,    -1,    -1,   146,    -1,   146,
     147,    -1,   147,    -1,    64,    -1,   145,   149,     4,    -1,
     156,    -1,   158,    -1,    16,    71,    -1,    17,    71,    -1,
      -1,    24,   150,   154,    71,    -1,    -1,    25,   151,   154,
      71,    82,   174,    -1,    -1,    28,   152,   154,    71,    82,
     174,    -1,    -1,     5,   153,   154,    71,    -1,     5,   173,
      -1,    45,   167,    -1,     8,   167,    -1,    46,   167,    -1,
       6,   165,    -1,     7,   165,    -1,    26,   167,    -1,    27,
     167,    -1,    14,    -1,    15,    -1,    13,    -1,    78,   162,
      -1,    -1,    31,    -1,    32,    -1,    33,    -1,   155,    -1,
      71,    -1,   160,    82,   167,    -1,   160,    82,    83,   167,
      -1,   160,    82,    84,   167,    -1,   160,    82,    85,   167,
      -1,   160,    82,   167,    86,   167,    -1,   160,    82,   167,
      84,   167,    -1,   160,    82,   167,    87,   167,    -1,   160,
      82,   167,    47,   167,    -1,   160,    82,   167,    88,   167,
      -1,   160,    82,   167,    89,   167,    -1,   160,    82,   167,
      90,   167,    -1,   160,    82,   167,    29,   167,    -1,   160,
      82,   167,    30,   167,    -1,   160,    82,   167,    48,   167,
      -1,   160,    82,   167,    49,   167,    -1,   160,    82,   167,
      50,   167,    -1,   160,    82,   167,    35,   167,    -1,   160,
      82,   167,    91,   167,    -1,   160,    82,   167,    92,   167,
      -1,   160,    82,   167,    85,   167,    -1,   160,    82,   167,
      93,   168,    94,    -1,   167,    93,   168,    94,    82,   167,
      -1,   160,    82,    12,   155,    51,   167,    -1,   160,    82,
      12,   155,    -1,   160,    82,    34,   167,    -1,   160,    82,
      34,   167,    93,   168,    94,    -1,   160,    82,    44,   167,
      -1,   160,    82,    43,    71,    -1,   160,    82,    42,   175,
      -1,    42,   175,    82,   167,    -1,    -1,    12,   157,   105,
      -1,    34,   160,    51,   167,    -1,    34,   160,    51,   167,
      93,   168,    94,    -1,    44,   160,    51,   167,    -1,    10,
     167,   159,   167,     7,   165,    -1,    11,   167,   159,   167,
       7,   165,    -1,    10,   167,     7,   165,    -1,    11,   167,
       7,   165,    -1,    10,   167,    51,   165,    -1,    11,   167,
      51,   165,    -1,    36,    -1,    37,    -1,    38,    -1,    39,
      -1,    40,    -1,    41,    -1,    79,    -1,   173,    -1,    79,
      -1,   173,    -1,    -1,   163,    -1,   163,    51,   164,    -1,
     164,    -1,   166,    -1,   161,    93,   168,    94,    -1,    71,
      -1,    78,    -1,   165,    -1,   167,    -1,    79,    -1,   172,
      -1,    -1,   169,   170,    -1,   171,    -1,   170,    95,   171,
      -1,   167,    -1,   173,    -1,   174,    -1,    67,    -1,    68,
      -1,    69,    -1,    70,    -1,    75,    -1,    73,    -1,    74,
      -1,    72,    -1,    69,    -1,    72,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   259,   259,   259,   263,   265,   266,   267,   268,   269,
     272,   273,   276,   277,   280,   281,   282,   283,   286,   286,
     289,   295,   298,   303,   302,   313,   311,   326,   328,   331,
     333,   336,   338,   339,   342,   356,   370,   374,   383,   383,
     389,   391,   389,   401,   402,   403,   406,   406,   410,   410,
     439,   440,   443,   444,   447,   448,   451,   455,   458,   464,
     465,   468,   469,   472,   473,   476,   477,   477,   480,   480,
     496,   496,   513,   514,   515,   518,   521,   522,   532,   535,
     537,   538,   539,   540,   541,   542,   545,   546,   549,   550,
     553,   556,   559,   561,   562,   563,   564,   564,   565,   565,
     567,   567,   569,   569,   571,   572,   573,   574,   575,   576,
     577,   578,   579,   580,   581,   582,   584,   587,   589,   590,
     591,   594,   598,   600,   601,   602,   603,   604,   605,   606,
     607,   608,   609,   610,   611,   612,   613,   614,   615,   616,
     617,   618,   619,   620,   621,   622,   623,   624,   626,   628,
     630,   631,   632,   632,   634,   635,   637,   640,   642,   644,
     645,   646,   647,   651,   653,   654,   655,   656,   657,   661,
     662,   664,   665,   668,   669,   672,   673,   676,   677,   681,
     683,   685,   687,   690,   691,   694,   694,   698,   699,   702,
     705,   706,   709,   710,   711,   712,   713,   716,   717,   718,
     721,   722
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "CALL", 
  "GOTO", "ARG", "FLATTEN_ARG", "IF", "UNLESS", "NEW", "END", "SAVEALL", 
  "RESTOREALL", "NAMESPACE", "ENDNAMESPACE", "CLASS", "ENDCLASS", "FIELD", 
  "METHOD", "SUB", "SYM", "LOCAL", "CONST", "INC", "DEC", "GLOBAL_CONST", 
  "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "DEFINED", 
  "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", 
  "RELOP_LTE", "GLOBAL", "ADDR", "CLONE", "RESULT", "RETURN", "POW", 
  "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", "PCC_BEGIN", 
  "PCC_END", "PCC_CALL", "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN", 
  "PCC_BEGIN_YIELD", "PCC_END_YIELD", "NCI_CALL", "PROTOTYPED", 
  "NON_PROTOTYPED", "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", 
  "PREG", "IDENTIFIER", "STRINGC", "INTC", "FLOATC", "REG", "MACRO", 
  "ENDM", "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", "'='", "'!'", 
  "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", "'.'", "'&'", "'|'", "'['", 
  "']'", "';'", "$accept", "program", "@1", "compilation_unit", 
  "compilation_units", "pasmcode", "pasmline", "pasm_inst", "@2", 
  "pasm_args", "emit", "@3", "class", "@4", "class_body", "member_decls", 
  "member_decl", "field_decl", "method_decl", "sub", "sub_body", 
  "sub_start", "@5", "pcc_sub", "@6", "@7", "pcc_params", "pcc_param", 
  "@8", "pcc_sub_call", "@9", "opt_label", "pcc_proto", "pcc_sub_proto", 
  "pcc_call", "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@10", 
  "pcc_ret", "@11", "pcc_yield", "@12", "pcc_returns", "pcc_return", 
  "statements", "helper_clear_state", "statement", "labels", "_labels", 
  "label", "instruction", "labeled_inst", "@13", "@14", "@15", "@16", 
  "type", "classname", "assignment", "@17", "if_statement", "relop", 
  "target", "lhs", "vars", "_vars", "_var_or_i", "label_op", "var_or_i", 
  "var", "keylist", "@18", "_keylist", "key", "rc", "reg", "const", 
  "string", 0
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
     334,   335,    61,    33,    45,   126,    43,    42,    47,    37,
      46,    38,   124,    91,    93,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    96,    98,    97,    99,    99,    99,    99,    99,    99,
     100,   100,   101,   101,   102,   102,   102,   102,   104,   103,
     103,   103,   105,   107,   106,   109,   108,   110,   110,   111,
     111,   112,   112,   112,   113,   114,   115,   116,   118,   117,
     120,   121,   119,   122,   122,   122,   124,   123,   126,   125,
     127,   127,   128,   128,   129,   129,   130,   130,   130,   131,
     131,   132,   132,   133,   133,   134,   135,   134,   137,   136,
     139,   138,   140,   140,   140,   141,   142,   142,   143,   144,
     144,   144,   144,   144,   144,   144,   145,   145,   146,   146,
     147,   148,   149,   149,   149,   149,   150,   149,   151,   149,
     152,   149,   153,   149,   149,   149,   149,   149,   149,   149,
     149,   149,   149,   149,   149,   149,   149,   154,   154,   154,
     154,   155,   156,   156,   156,   156,   156,   156,   156,   156,
     156,   156,   156,   156,   156,   156,   156,   156,   156,   156,
     156,   156,   156,   156,   156,   156,   156,   156,   156,   156,
     156,   156,   157,   156,   156,   156,   156,   158,   158,   158,
     158,   158,   158,   159,   159,   159,   159,   159,   159,   160,
     160,   161,   161,   162,   162,   163,   163,   164,   164,   165,
     165,   166,   166,   167,   167,   169,   168,   170,   170,   171,
     172,   172,   173,   173,   173,   173,   173,   174,   174,   174,
     175,   175
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     2,     1,     1,     1,     1,     2,     1,
       1,     2,     1,     2,     3,     2,     1,     1,     0,     3,
       2,     0,     1,     0,     4,     0,     6,     1,     0,     1,
       2,     1,     1,     1,     4,     3,     2,     2,     0,     4,
       0,     0,     8,     0,     1,     3,     0,     4,     0,    10,
       0,     2,     1,     1,     0,     1,     5,     3,     3,     0,
       3,     2,     2,     0,     3,     2,     0,     4,     0,     6,
       0,     6,     0,     2,     3,     2,     1,     2,     0,     2,
       2,     1,     1,     1,     1,     1,     0,     1,     2,     1,
       1,     3,     1,     1,     2,     2,     0,     4,     0,     6,
       0,     6,     0,     4,     2,     2,     2,     2,     2,     2,
       2,     2,     1,     1,     1,     2,     0,     1,     1,     1,
       1,     1,     3,     4,     4,     4,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     6,     6,     6,     4,     4,     7,     4,     4,
       4,     4,     0,     3,     4,     7,     4,     6,     6,     4,
       4,     4,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     0,     1,     3,     1,     1,     4,     1,
       1,     1,     1,     1,     1,     0,     2,     1,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,     0,     1,     9,     0,    38,    40,    23,     0,
      10,     3,     7,     4,     5,    78,     6,    25,     0,     0,
      86,     8,    11,     0,     0,     0,     0,    85,    84,    36,
      81,    82,    83,    78,    86,    76,     0,     0,    54,    90,
       0,    17,    16,    86,    12,    18,    87,    89,    52,    53,
       0,    68,    70,    80,    37,    77,   116,    79,    28,    39,
      55,     0,    15,    24,    13,     0,     0,     0,    88,    48,
      72,    72,   102,     0,     0,     0,     0,     0,   152,   114,
     112,   113,     0,     0,    96,    98,     0,     0,   100,     0,
       0,     0,     0,     0,   192,   193,   194,   195,   199,   197,
     198,   196,   173,   169,     0,    92,    93,     0,     0,   184,
     170,   191,    33,     0,     0,     0,    27,    29,    31,    32,
      41,    20,    14,   173,    59,     0,     0,     0,   104,   179,
     180,   108,   109,   183,   106,   190,     0,     0,   173,    94,
      95,     0,     0,   110,   111,     0,   169,     0,   170,   200,
     201,     0,     0,   105,   107,   183,     0,   115,   174,   176,
     181,   177,   182,   190,    91,     0,   185,   117,   118,   119,
     121,     0,   120,     0,    26,    30,    43,    19,    22,     0,
      73,     0,     0,     0,     0,     0,     0,   163,   164,   165,
     166,   167,   168,     0,     0,     0,     0,     0,   153,     0,
       0,     0,     0,     0,     0,   185,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   122,     0,     0,     0,    35,
      44,    78,     0,     0,     0,     0,    50,     0,    75,    69,
      74,    71,   103,   159,   161,     0,   160,   162,     0,    97,
       0,     0,   154,   151,   156,     0,   175,   145,   146,   150,
     149,   148,   123,   124,   125,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   185,     0,   189,   186,   187,    34,    46,    42,     0,
      61,    62,     0,     0,    63,     0,    60,     0,     0,     0,
       0,   185,   178,     0,   185,   133,   134,   138,   129,   135,
     136,   137,   127,   141,   126,   128,   130,   131,   132,   139,
     140,     0,     0,     0,     0,    45,    57,     0,    58,     0,
      51,   157,   158,    99,   101,     0,   144,     0,   142,   143,
     188,     0,     0,    66,     0,     0,     0,   155,   147,    47,
      56,     0,    65,    49,    64,     0,    67
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,    10,    11,    43,    44,    66,    67,   177,
      12,    20,    13,    36,   115,   116,   117,   118,   119,    14,
      29,    15,    18,    16,    19,   176,   221,   279,   314,    30,
     124,   284,    50,    61,   226,   179,   227,   319,   336,   341,
      31,    70,    32,    71,   125,   183,    33,    34,    35,    45,
      46,    47,    57,   104,   141,   142,   145,   127,   171,   172,
     105,   138,   106,   194,   107,   156,   178,   158,   159,   160,
     161,   162,   216,   217,   274,   275,   109,   135,   111,   151
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -212
static const short yypact[] =
{
    -212,    39,    30,  -212,  -212,   -42,  -212,  -212,  -212,    38,
    -212,    30,  -212,  -212,  -212,   121,  -212,  -212,   -24,   -21,
     -15,  -212,  -212,   -43,    65,    71,    80,  -212,  -212,  -212,
    -212,  -212,  -212,    66,    21,  -212,    87,    88,   -43,  -212,
      90,  -212,  -212,   115,  -212,     6,    21,  -212,  -212,  -212,
      96,  -212,  -212,  -212,  -212,  -212,   225,  -212,     2,  -212,
    -212,   101,  -212,  -212,  -212,    45,   106,    33,  -212,  -212,
    -212,  -212,   102,   -46,   -46,   253,   253,   253,  -212,  -212,
    -212,  -212,    44,    46,  -212,  -212,   253,   253,  -212,   266,
     -48,   266,   253,   253,  -212,  -212,  -212,  -212,  -212,  -212,
    -212,  -212,   212,    27,   118,  -212,  -212,    42,    34,  -212,
      36,  -212,  -212,   -20,    55,   114,     2,  -212,  -212,  -212,
    -212,  -212,  -212,   212,  -212,    10,    14,   -20,  -212,  -212,
    -212,  -212,  -212,  -212,  -212,  -212,   100,   149,   212,  -212,
    -212,   -20,   -20,  -212,  -212,   -20,  -212,    83,  -212,  -212,
    -212,    61,    93,  -212,  -212,    56,    59,  -212,   107,  -212,
    -212,  -212,  -212,    64,  -212,    29,  -212,  -212,  -212,  -212,
    -212,    89,  -212,   157,  -212,  -212,   162,  -212,  -212,    22,
    -212,   253,   179,   180,   188,   122,   -46,  -212,  -212,  -212,
    -212,  -212,  -212,   -46,   253,   -46,   -46,   253,  -212,   123,
     127,   128,   253,   253,   253,  -212,   212,   132,   253,   -48,
     133,   253,   253,   253,   253,   226,   111,   253,   220,  -212,
    -212,     0,   253,   266,   253,   253,    21,   221,  -212,  -212,
    -212,  -212,  -212,  -212,  -212,   219,  -212,  -212,   222,  -212,
     146,   152,   150,  -212,  -212,   151,  -212,   196,   155,  -212,
    -212,  -212,  -212,  -212,  -212,   253,   253,   253,   253,   253,
     253,   253,   253,   253,   253,   253,   253,   253,   253,   253,
     253,  -212,   175,  -212,   163,  -212,  -212,  -212,  -212,   256,
    -212,  -212,    13,   258,  -212,   261,  -212,   -46,   -46,    15,
      15,  -212,  -212,   253,  -212,  -212,  -212,  -212,  -212,  -212,
    -212,  -212,  -212,  -212,  -212,  -212,  -212,  -212,  -212,  -212,
    -212,   172,   253,   253,   -20,  -212,  -212,   253,  -212,    -9,
    -212,  -212,  -212,  -212,  -212,   178,  -212,   183,  -212,  -212,
    -212,   217,   285,  -212,   266,   292,   297,  -212,  -212,  -212,
    -212,   -20,  -212,  -212,  -212,   231,  -212
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -212,  -212,  -212,   294,  -212,  -212,   263,  -212,  -212,   169,
    -212,  -212,  -212,  -212,  -212,  -212,   192,  -212,  -212,  -212,
     103,  -212,  -212,  -212,  -212,  -212,  -212,  -212,  -212,  -212,
    -212,  -212,   271,  -212,  -212,  -212,  -212,  -212,  -212,  -212,
    -212,  -212,  -212,  -212,   259,  -212,  -212,  -212,   296,   303,
    -212,   -44,  -212,  -212,  -212,  -212,  -212,  -212,   -87,   124,
    -212,  -212,  -212,   201,   -88,  -212,   237,  -212,   134,   -65,
    -212,   -49,  -201,  -212,  -212,    31,  -212,   -56,  -211,   137
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -191
static const short yytable[] =
{
     110,   147,    68,   152,   245,   277,   112,   108,   131,   132,
     -21,   167,   168,   169,   180,   333,   128,   316,   180,    48,
      49,   149,   113,   114,   150,   129,   134,   136,   137,    17,
     222,   223,   130,   148,     4,   148,   334,   143,   144,     3,
     185,   207,    21,   153,   154,   335,   163,    37,     5,    39,
      38,   170,     6,    23,   199,   200,   181,    24,   201,    25,
     181,    40,    65,   208,   317,    41,    42,   163,   182,    51,
     311,   209,   210,   211,   184,    52,    26,   224,   323,   324,
      27,    28,   163,   225,    53,    39,     7,    98,    99,   100,
     325,    58,    59,   327,    62,     8,    94,    95,    96,    97,
      69,    98,    99,   100,   101,   120,     9,   186,   133,   121,
     122,   123,   212,   213,   214,   139,   215,   140,    54,    23,
    -183,   233,   164,    24,   165,    25,   173,   166,   234,  -190,
     236,   237,   228,   174,   202,   281,   187,   188,   189,   190,
     191,   192,    26,   203,   204,   235,    27,    28,   238,  -171,
     163,   193,   205,   242,   243,   244,   195,  -172,   206,   248,
     218,   219,   251,   252,   253,   254,   220,   148,   273,    94,
      95,    96,    97,   280,    23,   282,   283,   101,    24,    39,
      25,    63,   285,   229,   230,   187,   188,   189,   190,   191,
     192,    40,   231,   232,   239,    41,    42,    26,   240,   241,
     196,    27,    28,   170,   250,   272,   295,   296,   297,   298,
     299,   300,   301,   302,   303,   304,   305,   306,   307,   308,
     309,   310,   321,   322,   276,   286,   287,   331,   289,   288,
      72,    73,    74,    75,   290,    76,    77,    78,    79,    80,
      81,    82,    83,   291,   326,   292,   342,   293,   294,    84,
      85,    86,    87,    88,   345,   255,   256,   312,   313,    89,
     315,   257,   318,   329,   273,   320,   328,    90,   332,    91,
      92,    93,   337,   258,   259,   260,   261,   338,   148,    94,
      95,    96,    97,   129,    98,    99,   100,   101,   339,   340,
     130,   155,    94,    95,    96,    97,   343,    98,    99,   100,
     101,   344,   346,   102,   103,    22,    64,   198,   175,    60,
     262,   263,   264,   265,   266,   267,   268,   269,   270,   271,
      94,    95,    96,    97,   278,    98,    99,   100,   101,    55,
     126,   247,   133,    94,    95,    96,    97,    56,   197,   157,
     246,   101,     0,     0,   330,   146,   249
};

static const short yycheck[] =
{
      56,    89,    46,    91,   205,     5,     4,    56,    73,    74,
       4,    31,    32,    33,     4,    24,    72,     4,     4,    62,
      63,    69,    20,    21,    72,    71,    75,    76,    77,    71,
       8,     9,    78,    89,     4,    91,    45,    86,    87,     0,
     127,    12,     4,    92,    93,    54,   102,    71,    18,    64,
      71,    71,    22,    53,   141,   142,    46,    57,   145,    59,
      46,    76,    56,    34,    51,    80,    81,   123,    58,     4,
     271,    42,    43,    44,    60,     4,    76,    55,   289,   290,
      80,    81,   138,    61,     4,    64,    56,    72,    73,    74,
     291,     4,     4,   294,     4,    65,    67,    68,    69,    70,
       4,    72,    73,    74,    75,     4,    76,     7,    79,    64,
       4,    78,    83,    84,    85,    71,   165,    71,    52,    53,
      93,   186,     4,    57,    82,    59,    71,    93,   193,    93,
     195,   196,   181,    19,    51,   223,    36,    37,    38,    39,
      40,    41,    76,    82,    51,   194,    80,    81,   197,    93,
     206,    51,    93,   202,   203,   204,     7,    93,    51,   208,
      71,     4,   211,   212,   213,   214,     4,   223,   217,    67,
      68,    69,    70,   222,    53,   224,   225,    75,    57,    64,
      59,    66,   226,     4,     4,    36,    37,    38,    39,    40,
      41,    76,     4,    71,    71,    80,    81,    76,    71,    71,
      51,    80,    81,    71,    71,    94,   255,   256,   257,   258,
     259,   260,   261,   262,   263,   264,   265,   266,   267,   268,
     269,   270,   287,   288,     4,     4,     7,   314,    82,     7,
       5,     6,     7,     8,    82,    10,    11,    12,    13,    14,
      15,    16,    17,    93,   293,    94,   334,    51,    93,    24,
      25,    26,    27,    28,   341,    29,    30,    82,    95,    34,
       4,    35,     4,   312,   313,     4,    94,    42,   317,    44,
      45,    46,    94,    47,    48,    49,    50,    94,   334,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    71,     4,
      78,    79,    67,    68,    69,    70,     4,    72,    73,    74,
      75,     4,    71,    78,    79,    11,    43,   138,   116,    38,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      67,    68,    69,    70,   221,    72,    73,    74,    75,    33,
      71,   207,    79,    67,    68,    69,    70,    34,   137,   102,
     206,    75,    -1,    -1,   313,    79,   209
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    97,    98,     0,     4,    18,    22,    56,    65,    76,
      99,   100,   106,   108,   115,   117,   119,    71,   118,   120,
     107,     4,    99,    53,    57,    59,    76,    80,    81,   116,
     125,   136,   138,   142,   143,   144,   109,    71,    71,    64,
      76,    80,    81,   101,   102,   145,   146,   147,    62,    63,
     128,     4,     4,     4,    52,   144,   145,   148,     4,     4,
     128,   129,     4,    66,   102,    56,   103,   104,   147,     4,
     137,   139,     5,     6,     7,     8,    10,    11,    12,    13,
      14,    15,    16,    17,    24,    25,    26,    27,    28,    34,
      42,    44,    45,    46,    67,    68,    69,    70,    72,    73,
      74,    75,    78,    79,   149,   156,   158,   160,   167,   172,
     173,   174,     4,    20,    21,   110,   111,   112,   113,   114,
       4,    64,     4,    78,   126,   140,   140,   153,   173,    71,
      78,   165,   165,    79,   167,   173,   167,   167,   157,    71,
      71,   150,   151,   167,   167,   152,    79,   160,   173,    69,
      72,   175,   160,   167,   167,    79,   161,   162,   163,   164,
     165,   166,   167,   173,     4,    82,    93,    31,    32,    33,
      71,   154,   155,    71,    19,   112,   121,   105,   162,   131,
       4,    46,    58,   141,    60,   154,     7,    36,    37,    38,
      39,    40,    41,    51,   159,     7,    51,   159,   105,   154,
     154,   154,    51,    82,    51,    93,    51,    12,    34,    42,
      43,    44,    83,    84,    85,   167,   168,   169,    71,     4,
       4,   122,     8,     9,    55,    61,   130,   132,   167,     4,
       4,     4,    71,   165,   165,   167,   165,   165,   167,    71,
      71,    71,   167,   167,   167,   168,   164,   155,   167,   175,
      71,   167,   167,   167,   167,    29,    30,    35,    47,    48,
      49,    50,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,   167,   170,   171,     4,     5,   116,   123,
     167,   160,   167,   167,   127,   147,     4,     7,     7,    82,
      82,    93,    94,    51,    93,   167,   167,   167,   167,   167,
     167,   167,   167,   167,   167,   167,   167,   167,   167,   167,
     167,   168,    82,    95,   124,     4,     4,    51,     4,   133,
       4,   165,   165,   174,   174,   168,   167,   168,    94,   167,
     171,   154,   167,    24,    45,    54,   134,    94,    94,    71,
       4,   135,   160,     4,     4,   154,    71
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
#line 259 "imcc/imcc.y"
    { open_comp_unit(); yyval.i = 0;}
    break;

  case 3:
#line 260 "imcc/imcc.y"
    { close_comp_unit(interp); yyval.i = 0; }
    break;

  case 8:
#line 268 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 9:
#line 269 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 280 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 281 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 282 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 17:
#line 283 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 18:
#line 286 "imcc/imcc.y"
    {clear_state();}
    break;

  case 19:
#line 287 "imcc/imcc.y"
    { yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                                          free(yyvsp[-1].s); }
    break;

  case 20:
#line 289 "imcc/imcc.y"
    {
                                          char *name = str_dup(yyvsp[0].s);
                                          yyval.i = iSUBROUTINE(
                                          mk_address(yyvsp[0].s, U_add_uniq_sub));
                                          yyval.i->r[1] =  mk_pcc_sub(name, 0);
                                        }
    break;

  case 21:
#line 295 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 23:
#line 303 "imcc/imcc.y"
    { open_comp_unit();
                                          function = "(emit)"; }
    break;

  case 24:
#line 306 "imcc/imcc.y"
    { if (optimizer_level & OPT_PASM)
                                                allocate(interp);
                                          emit_flush(interp); yyval.i=0;}
    break;

  case 25:
#line 313 "imcc/imcc.y"
    { 
           Symbol * sym = new_symbol(yyvsp[0].s);
           current_class = new_class(sym);
           sym->p = (void*)current_class;
           store_symbol(&global_sym_tab, sym);
        }
    break;

  case 26:
#line 320 "imcc/imcc.y"
    {
           yyval.i = 0;
           current_class = NULL;
        }
    break;

  case 28:
#line 328 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 33:
#line 339 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 34:
#line 344 "imcc/imcc.y"
    {
           Symbol * sym = new_symbol(yyvsp[-1].s);
           if(lookup_field_symbol(current_class, yyvsp[-1].s)) {
              fataly(EX_SOFTWARE, sourcefile, line,
                 "field '%s' previously declared in class '%s'\n",
                    yyvsp[-1].s, current_class->sym->name);
           }
           store_field_symbol(current_class, sym);
           yyval.i = 0;
        }
    break;

  case 35:
#line 358 "imcc/imcc.y"
    {
           Symbol * sym = new_symbol(yyvsp[-1].s);
           if(lookup_method_symbol(current_class, yyvsp[-1].s)) {
              fataly(EX_SOFTWARE, sourcefile, line,
                 "method '%s' previously declared in class '%s'\n",
                    yyvsp[-1].s, current_class->sym->name);
           }
           store_method_symbol(current_class, sym);
           yyval.i = 0;
        }
    break;

  case 37:
#line 376 "imcc/imcc.y"
    {
          yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 38:
#line 383 "imcc/imcc.y"
    { open_comp_unit(); }
    break;

  case 39:
#line 385 "imcc/imcc.y"
    { yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        }
    break;

  case 40:
#line 389 "imcc/imcc.y"
    { open_comp_unit(); }
    break;

  case 41:
#line 391 "imcc/imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 42:
#line 398 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 43:
#line 401 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 44:
#line 402 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 45:
#line 403 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 46:
#line 406 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 47:
#line 407 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 48:
#line 410 "imcc/imcc.y"
    {
              char name[128];
              SymReg * r;
              Instruction *i;

              sprintf(name, "#pcc_sub_call_%d", line - 1);
              yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
              r->pcc_sub->prototyped = yyvsp[-1].t;
              /* this mid rule action has the semantic value of the
                 sub SymReg.
                 This is used below to append args & results
              */
              i = iLABEL(r);
              i->type = ITPCCSUB;
              /*
               * if we are inside a pcc_sub mark the sub as doing a
               * sub call; the sub is in r1 of the first ins
               */
              if (instructions->r[1] && instructions->r[1]->pcc_sub)
                  instructions->r[1]->pcc_sub->calls_a_sub = 1;

           }
    break;

  case 49:
#line 436 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 50:
#line 439 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-2].sr ->pcc_sub->label = 0; }
    break;

  case 51:
#line 440 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-4].sr ->pcc_sub->label = 1; }
    break;

  case 52:
#line 443 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 53:
#line 444 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 54:
#line 447 "imcc/imcc.y"
    { yyval.t = -1; }
    break;

  case 56:
#line 451 "imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 57:
#line 455 "imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 58:
#line 458 "imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
                  yyvsp[-4].sr ->pcc_sub->nci = 1;
              }
    break;

  case 59:
#line 464 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 60:
#line 465 "imcc/imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 61:
#line 468 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 62:
#line 469 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 63:
#line 472 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 64:
#line 473 "imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 65:
#line 476 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 66:
#line 477 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 67:
#line 477 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 68:
#line 480 "imcc/imcc.y"
    {
                Instruction *i, *ins = instructions;
                SymReg *r;
                char name[128];
                if (!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
                    fataly(EX_SOFTWARE, sourcefile, line,
                        "pcc_return not inside pcc subroutine\n");
                sprintf(name, "#pcc_sub_ret_%d", line - 1);
                yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
                i = iLABEL(r);
                i->type = ITPCCSUB | ITLABEL;
        }
    break;

  case 69:
#line 493 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 70:
#line 496 "imcc/imcc.y"
    {
                Instruction *i, *ins = instructions;
                SymReg *r;
                char name[128];
                if (!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
                    fataly(EX_SOFTWARE, sourcefile, line,
                        "pcc_yield not inside pcc subroutine\n");
                ins->r[1]->pcc_sub->calls_a_sub = 1;
                sprintf(name, "#pcc_sub_yield_%d", line - 1);
                yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
                i = iLABEL(r);
                i->type = ITPCCSUB | ITLABEL | ITPCCYIELD;
        }
    break;

  case 71:
#line 510 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 72:
#line 513 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 73:
#line 514 "imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 74:
#line 515 "imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 75:
#line 518 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 78:
#line 532 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 79:
#line 536 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 80:
#line 537 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 81:
#line 538 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 84:
#line 541 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 85:
#line 542 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 86:
#line 545 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 90:
#line 553 "imcc/imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 91:
#line 557 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 94:
#line 562 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 95:
#line 563 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 96:
#line 564 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 97:
#line 564 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 98:
#line 565 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 99:
#line 566 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 100:
#line 567 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 101:
#line 568 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 102:
#line 569 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 103:
#line 569 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 104:
#line 571 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 105:
#line 572 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 106:
#line 573 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 107:
#line 574 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 108:
#line 575 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "bsr",  1, yyvsp[0].sr); }
    break;

  case 109:
#line 576 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "branch",1, yyvsp[0].sr); }
    break;

  case 110:
#line 577 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "inc",1, yyvsp[0].sr); }
    break;

  case 111:
#line 578 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "dec",1, yyvsp[0].sr); }
    break;

  case 112:
#line 579 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,0); }
    break;

  case 113:
#line 580 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,0); }
    break;

  case 114:
#line 581 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "end" ,0); }
    break;

  case 115:
#line 582 "imcc/imcc.y"
    { yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 116:
#line 584 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 117:
#line 588 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 118:
#line 589 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 119:
#line 590 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 120:
#line 591 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 122:
#line 599 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 123:
#line 600 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 124:
#line 601 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 125:
#line 602 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 126:
#line 603 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 127:
#line 604 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 128:
#line 605 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 129:
#line 606 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 130:
#line 607 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 131:
#line 608 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 132:
#line 609 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 133:
#line 610 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 134:
#line 611 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 135:
#line 612 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 136:
#line 613 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 137:
#line 614 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 138:
#line 615 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 139:
#line 616 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 140:
#line 617 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 141:
#line 618 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 142:
#line 619 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 143:
#line 620 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 144:
#line 621 "imcc/imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 145:
#line 622 "imcc/imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL,1); }
    break;

  case 146:
#line 623 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "defined",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 147:
#line 624 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 148:
#line 626 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "clone",2, yyvsp[-3].sr, yyvsp[0].sr);
    }
    break;

  case 149:
#line 628 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          2, yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once)); }
    break;

  case 150:
#line 630 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "find_global",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 151:
#line 631 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 152:
#line 632 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 153:
#line 633 "imcc/imcc.y"
    { yyval.i = INS(interp, "new",0,regs,nargs,keyvec,1); }
    break;

  case 154:
#line 634 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 155:
#line 635 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                                  yyval.i = MK_I(interp, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 156:
#line 637 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 157:
#line 641 "imcc/imcc.y"
    {yyval.i=MK_I(interp, yyvsp[-3].s,3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 158:
#line 642 "imcc/imcc.y"
    {yyval.i=MK_I(interp, inv_op(yyvsp[-3].s),
                                            3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 159:
#line 644 "imcc/imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 160:
#line 645 "imcc/imcc.y"
    {yyval.i= MK_I(interp, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 161:
#line 646 "imcc/imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 162:
#line 647 "imcc/imcc.y"
    {yyval.i= MK_I(interp, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 163:
#line 652 "imcc/imcc.y"
    { yyval.s = "eq"; }
    break;

  case 164:
#line 653 "imcc/imcc.y"
    { yyval.s = "ne"; }
    break;

  case 165:
#line 654 "imcc/imcc.y"
    { yyval.s = "gt"; }
    break;

  case 166:
#line 655 "imcc/imcc.y"
    { yyval.s = "ge"; }
    break;

  case 167:
#line 656 "imcc/imcc.y"
    { yyval.s = "lt"; }
    break;

  case 168:
#line 657 "imcc/imcc.y"
    { yyval.s = "le"; }
    break;

  case 173:
#line 668 "imcc/imcc.y"
    { yyval.sr = NULL; }
    break;

  case 174:
#line 669 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 175:
#line 672 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 177:
#line 676 "imcc/imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 178:
#line 677 "imcc/imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 179:
#line 682 "imcc/imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 180:
#line 683 "imcc/imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 185:
#line 694 "imcc/imcc.y"
    { nkeys=0; }
    break;

  case 186:
#line 695 "imcc/imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 187:
#line 698 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 188:
#line 699 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 192:
#line 709 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 193:
#line 710 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 194:
#line 711 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 195:
#line 712 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 196:
#line 713 "imcc/imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 197:
#line 716 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 198:
#line 717 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 199:
#line 718 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 200:
#line 721 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 201:
#line 722 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/local/share/bison/yacc.c.  */
#line 2558 "imcc/imcparser.c"

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


#line 726 "imcc/imcc.y"



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

