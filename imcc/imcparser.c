/* A Bison parser, made from imcc.y, by GNU bison 1.75.  */

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
     CALL = 258,
     GOTO = 259,
     ARG = 260,
     IF = 261,
     UNLESS = 262,
     NEW = 263,
     END = 264,
     SAVEALL = 265,
     RESTOREALL = 266,
     SUB = 267,
     NAMESPACE = 268,
     ENDNAMESPACE = 269,
     CLASS = 270,
     ENDCLASS = 271,
     SYM = 272,
     LOCAL = 273,
     CONST = 274,
     PARAM = 275,
     INC = 276,
     DEC = 277,
     GLOBAL_CONST = 278,
     SHIFT_LEFT = 279,
     SHIFT_RIGHT = 280,
     INTV = 281,
     FLOATV = 282,
     STRINGV = 283,
     DEFINED = 284,
     LOG_XOR = 285,
     RELOP_EQ = 286,
     RELOP_NE = 287,
     RELOP_GT = 288,
     RELOP_GTE = 289,
     RELOP_LT = 290,
     RELOP_LTE = 291,
     GLOBAL = 292,
     ADDR = 293,
     CLONE = 294,
     RESULT = 295,
     RETURN = 296,
     POW = 297,
     SHIFT_RIGHT_U = 298,
     LOG_AND = 299,
     LOG_OR = 300,
     COMMA = 301,
     ESUB = 302,
     PCC_BEGIN = 303,
     PCC_END = 304,
     PCC_CALL = 305,
     PCC_SUB = 306,
     PCC_BEGIN_RETURN = 307,
     PCC_END_RETURN = 308,
     PCC_BEGIN_YIELD = 309,
     PCC_END_YIELD = 310,
     PROTOTYPED = 311,
     NON_PROTOTYPED = 312,
     LABEL = 313,
     EMIT = 314,
     EOM = 315,
     IREG = 316,
     NREG = 317,
     SREG = 318,
     PREG = 319,
     IDENTIFIER = 320,
     STRINGC = 321,
     INTC = 322,
     FLOATC = 323,
     REG = 324,
     MACRO = 325,
     ENDM = 326,
     PARROT_OP = 327,
     VAR = 328,
     LINECOMMENT = 329,
     FILECOMMENT = 330
   };
#endif
#define CALL 258
#define GOTO 259
#define ARG 260
#define IF 261
#define UNLESS 262
#define NEW 263
#define END 264
#define SAVEALL 265
#define RESTOREALL 266
#define SUB 267
#define NAMESPACE 268
#define ENDNAMESPACE 269
#define CLASS 270
#define ENDCLASS 271
#define SYM 272
#define LOCAL 273
#define CONST 274
#define PARAM 275
#define INC 276
#define DEC 277
#define GLOBAL_CONST 278
#define SHIFT_LEFT 279
#define SHIFT_RIGHT 280
#define INTV 281
#define FLOATV 282
#define STRINGV 283
#define DEFINED 284
#define LOG_XOR 285
#define RELOP_EQ 286
#define RELOP_NE 287
#define RELOP_GT 288
#define RELOP_GTE 289
#define RELOP_LT 290
#define RELOP_LTE 291
#define GLOBAL 292
#define ADDR 293
#define CLONE 294
#define RESULT 295
#define RETURN 296
#define POW 297
#define SHIFT_RIGHT_U 298
#define LOG_AND 299
#define LOG_OR 300
#define COMMA 301
#define ESUB 302
#define PCC_BEGIN 303
#define PCC_END 304
#define PCC_CALL 305
#define PCC_SUB 306
#define PCC_BEGIN_RETURN 307
#define PCC_END_RETURN 308
#define PCC_BEGIN_YIELD 309
#define PCC_END_YIELD 310
#define PROTOTYPED 311
#define NON_PROTOTYPED 312
#define LABEL 313
#define EMIT 314
#define EOM 315
#define IREG 316
#define NREG 317
#define SREG 318
#define PREG 319
#define IDENTIFIER 320
#define STRINGC 321
#define INTC 322
#define FLOATC 323
#define REG 324
#define MACRO 325
#define ENDM 326
#define PARROT_OP 327
#define VAR 328
#define LINECOMMENT 329
#define FILECOMMENT 330




/* Copy the first part of user declarations.  */
#line 1 "imcc.y"

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
 * we use a pure parser wtih the interpreter as a parameter
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
#line 191 "imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 193 of /usr/share/bison/yacc.c.  */
#line 420 "imcparser.c"
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
#line 441 "imcparser.c"

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
#define YYLAST   341

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  91
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  72
/* YYNRULES -- Number of rules. */
#define YYNRULES  183
/* YYNRULES -- Number of states. */
#define YYNSTATES  318

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   330

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      76,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    78,     2,     2,     2,    84,    86,     2,
       2,     2,    82,    81,     2,    79,    85,    83,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    90,
       2,    77,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    88,     2,    89,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    87,     2,    80,     2,     2,     2,
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
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     4,     7,     9,    11,    13,    15,    17,
      20,    22,    25,    29,    32,    34,    36,    37,    41,    44,
      45,    47,    48,    53,    56,    59,    60,    65,    66,    67,
      76,    77,    81,    82,    87,    88,   100,   102,   104,   105,
     107,   113,   117,   118,   122,   125,   126,   130,   133,   134,
     139,   140,   147,   148,   155,   156,   159,   163,   166,   168,
     171,   172,   175,   178,   180,   182,   184,   186,   188,   189,
     191,   194,   196,   198,   202,   204,   206,   209,   212,   213,
     218,   219,   226,   227,   234,   235,   240,   243,   246,   249,
     252,   255,   258,   261,   264,   266,   268,   270,   273,   274,
     276,   278,   280,   282,   284,   288,   293,   298,   303,   309,
     315,   321,   327,   333,   339,   345,   351,   357,   363,   369,
     375,   381,   387,   393,   399,   406,   413,   420,   425,   430,
     438,   443,   448,   453,   458,   459,   463,   468,   476,   481,
     488,   495,   500,   505,   510,   515,   517,   519,   521,   523,
     525,   527,   529,   531,   533,   535,   536,   538,   542,   544,
     546,   551,   553,   555,   557,   559,   561,   563,   564,   567,
     569,   573,   575,   577,   579,   581,   583,   585,   587,   589,
     591,   593,   595,   597
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
      92,     0,    -1,    -1,    93,    95,    -1,   103,    -1,   107,
      -1,   101,    -1,    76,    -1,    94,    -1,    95,    94,    -1,
      97,    -1,    96,    97,    -1,   132,    98,    76,    -1,    70,
      76,    -1,    75,    -1,    74,    -1,    -1,    99,    72,   100,
      -1,    51,    58,    -1,    -1,   149,    -1,    -1,    59,   102,
      96,    60,    -1,   105,   104,    -1,   129,    47,    -1,    -1,
      12,   106,    65,    76,    -1,    -1,    -1,    51,   108,    65,
     116,    76,   109,   110,   104,    -1,    -1,   110,   111,    76,
      -1,    -1,    20,   112,   141,    65,    -1,    -1,    48,   115,
      76,   114,   118,   117,   134,    76,   120,    49,    76,    -1,
      56,    -1,    57,    -1,    -1,   115,    -1,    50,   154,    46,
     154,    76,    -1,    50,   154,    76,    -1,    -1,   118,   119,
      76,    -1,     5,   154,    -1,    -1,   120,   121,    76,    -1,
      40,   154,    -1,    -1,    18,   122,   141,    65,    -1,    -1,
      52,    76,   124,   127,    53,    76,    -1,    -1,    54,    76,
     126,   127,    55,    76,    -1,    -1,   127,    76,    -1,   127,
     128,    76,    -1,    41,   154,    -1,   130,    -1,   129,   130,
      -1,    -1,   131,   135,    -1,    70,    76,    -1,   113,    -1,
     123,    -1,   125,    -1,    75,    -1,    74,    -1,    -1,   133,
      -1,   133,   134,    -1,   134,    -1,    58,    -1,   132,   136,
      76,    -1,   143,    -1,   145,    -1,    13,    65,    -1,    14,
      65,    -1,    -1,    18,   137,   141,    65,    -1,    -1,    19,
     138,   141,    65,    77,   161,    -1,    -1,    23,   139,   141,
      65,    77,   161,    -1,    -1,    20,   140,   141,    65,    -1,
      20,   160,    -1,    40,   154,    -1,     5,   154,    -1,    41,
     154,    -1,     3,   152,    -1,     4,   152,    -1,    21,   154,
      -1,    22,   154,    -1,    10,    -1,    11,    -1,     9,    -1,
      72,   149,    -1,    -1,    26,    -1,    27,    -1,    28,    -1,
     142,    -1,    65,    -1,   147,    77,   154,    -1,   147,    77,
      78,   154,    -1,   147,    77,    79,   154,    -1,   147,    77,
      80,   154,    -1,   147,    77,   154,    81,   154,    -1,   147,
      77,   154,    79,   154,    -1,   147,    77,   154,    82,   154,
      -1,   147,    77,   154,    42,   154,    -1,   147,    77,   154,
      83,   154,    -1,   147,    77,   154,    84,   154,    -1,   147,
      77,   154,    85,   154,    -1,   147,    77,   154,    24,   154,
      -1,   147,    77,   154,    25,   154,    -1,   147,    77,   154,
      43,   154,    -1,   147,    77,   154,    44,   154,    -1,   147,
      77,   154,    45,   154,    -1,   147,    77,   154,    30,   154,
      -1,   147,    77,   154,    86,   154,    -1,   147,    77,   154,
      87,   154,    -1,   147,    77,   154,    80,   154,    -1,   147,
      77,   154,    88,   155,    89,    -1,   154,    88,   155,    89,
      77,   154,    -1,   147,    77,     8,   142,    46,   154,    -1,
     147,    77,     8,   142,    -1,   147,    77,    29,   154,    -1,
     147,    77,    29,   154,    88,   155,    89,    -1,   147,    77,
      39,   154,    -1,   147,    77,    38,    65,    -1,   147,    77,
      37,   162,    -1,    37,   162,    77,   154,    -1,    -1,     8,
     144,   100,    -1,    29,   147,    46,   154,    -1,    29,   147,
      46,   154,    88,   155,    89,    -1,    39,   147,    46,   154,
      -1,     6,   154,   146,   154,     4,   152,    -1,     7,   154,
     146,   154,     4,   152,    -1,     6,   154,     4,   152,    -1,
       7,   154,     4,   152,    -1,     6,   154,    46,   152,    -1,
       7,   154,    46,   152,    -1,    31,    -1,    32,    -1,    33,
      -1,    34,    -1,    35,    -1,    36,    -1,    73,    -1,   160,
      -1,    73,    -1,   160,    -1,    -1,   150,    -1,   150,    46,
     151,    -1,   151,    -1,   153,    -1,   148,    88,   155,    89,
      -1,    65,    -1,    72,    -1,   152,    -1,   154,    -1,    73,
      -1,   159,    -1,    -1,   156,   157,    -1,   158,    -1,   157,
      90,   158,    -1,   154,    -1,   160,    -1,   161,    -1,    61,
      -1,    62,    -1,    63,    -1,    64,    -1,    69,    -1,    67,
      -1,    68,    -1,    66,    -1,    63,    -1,    66,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   238,   238,   238,   242,   243,   244,   245,   248,   249,
     253,   254,   257,   258,   259,   260,   263,   263,   266,   272,
     274,   279,   278,   287,   291,   300,   300,   306,   308,   306,
     318,   319,   322,   322,   326,   326,   355,   356,   359,   360,
     363,   367,   372,   373,   376,   379,   380,   383,   384,   384,
     387,   387,   403,   403,   420,   421,   422,   425,   428,   429,
     432,   432,   434,   435,   436,   437,   438,   439,   442,   443,
     446,   447,   450,   453,   456,   458,   459,   460,   461,   461,
     462,   462,   464,   464,   466,   466,   468,   469,   470,   471,
     472,   473,   474,   475,   476,   477,   478,   479,   481,   484,
     486,   487,   488,   491,   495,   497,   498,   499,   500,   501,
     502,   503,   504,   505,   506,   507,   508,   509,   510,   511,
     512,   513,   514,   515,   516,   517,   518,   519,   520,   521,
     523,   525,   527,   528,   529,   529,   531,   532,   534,   537,
     539,   541,   542,   543,   544,   548,   550,   551,   552,   553,
     554,   558,   559,   561,   562,   565,   566,   569,   570,   573,
     574,   578,   580,   582,   584,   587,   588,   591,   591,   595,
     596,   599,   602,   603,   606,   607,   608,   609,   610,   613,
     614,   615,   618,   619
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "CALL", "GOTO", "ARG", "IF", "UNLESS", 
  "NEW", "END", "SAVEALL", "RESTOREALL", "SUB", "NAMESPACE", 
  "ENDNAMESPACE", "CLASS", "ENDCLASS", "SYM", "LOCAL", "CONST", "PARAM", 
  "INC", "DEC", "GLOBAL_CONST", "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", 
  "FLOATV", "STRINGV", "DEFINED", "LOG_XOR", "RELOP_EQ", "RELOP_NE", 
  "RELOP_GT", "RELOP_GTE", "RELOP_LT", "RELOP_LTE", "GLOBAL", "ADDR", 
  "CLONE", "RESULT", "RETURN", "POW", "SHIFT_RIGHT_U", "LOG_AND", 
  "LOG_OR", "COMMA", "ESUB", "PCC_BEGIN", "PCC_END", "PCC_CALL", 
  "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD", 
  "PCC_END_YIELD", "PROTOTYPED", "NON_PROTOTYPED", "LABEL", "EMIT", "EOM", 
  "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "STRINGC", "INTC", 
  "FLOATC", "REG", "MACRO", "ENDM", "PARROT_OP", "VAR", "LINECOMMENT", 
  "FILECOMMENT", "'\\n'", "'='", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", 
  "'%'", "'.'", "'&'", "'|'", "'['", "']'", "';'", "$accept", "program", 
  "@1", "compilation_unit", "compilation_units", "pasmcode", "pasmline", 
  "pasm_inst", "@2", "pasm_args", "emit", "@3", "sub", "sub_body", 
  "sub_start", "@4", "pcc_sub", "@5", "@6", "pcc_params", "pcc_param", 
  "@7", "pcc_sub_call", "@8", "pcc_proto", "pcc_sub_proto", "pcc_call", 
  "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@9", "pcc_ret", 
  "@10", "pcc_yield", "@11", "pcc_returns", "pcc_return", "statements", 
  "statement", "@12", "labels", "_labels", "label", "instruction", 
  "labeled_inst", "@13", "@14", "@15", "@16", "type", "classname", 
  "assignment", "@17", "if_statement", "relop", "target", "lhs", "vars", 
  "_vars", "_var_or_i", "label_op", "var_or_i", "var", "keylist", "@18", 
  "_keylist", "key", "rc", "reg", "const", "string", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const unsigned short yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,    10,    61,    33,    45,
     126,    43,    42,    47,    37,    46,    38,   124,    91,    93,
      59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    91,    93,    92,    94,    94,    94,    94,    95,    95,
      96,    96,    97,    97,    97,    97,    99,    98,    98,    98,
     100,   102,   101,   103,   104,   106,   105,   108,   109,   107,
     110,   110,   112,   111,   114,   113,   115,   115,   116,   116,
     117,   117,   118,   118,   119,   120,   120,   121,   122,   121,
     124,   123,   126,   125,   127,   127,   127,   128,   129,   129,
     131,   130,   130,   130,   130,   130,   130,   130,   132,   132,
     133,   133,   134,   135,   136,   136,   136,   136,   137,   136,
     138,   136,   139,   136,   140,   136,   136,   136,   136,   136,
     136,   136,   136,   136,   136,   136,   136,   136,   136,   141,
     141,   141,   141,   142,   143,   143,   143,   143,   143,   143,
     143,   143,   143,   143,   143,   143,   143,   143,   143,   143,
     143,   143,   143,   143,   143,   143,   143,   143,   143,   143,
     143,   143,   143,   143,   144,   143,   143,   143,   143,   145,
     145,   145,   145,   145,   145,   146,   146,   146,   146,   146,
     146,   147,   147,   148,   148,   149,   149,   150,   150,   151,
     151,   152,   152,   153,   153,   154,   154,   156,   155,   157,
     157,   158,   159,   159,   160,   160,   160,   160,   160,   161,
     161,   161,   162,   162
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     2,     1,     1,     1,     1,     1,     2,
       1,     2,     3,     2,     1,     1,     0,     3,     2,     0,
       1,     0,     4,     2,     2,     0,     4,     0,     0,     8,
       0,     3,     0,     4,     0,    11,     1,     1,     0,     1,
       5,     3,     0,     3,     2,     0,     3,     2,     0,     4,
       0,     6,     0,     6,     0,     2,     3,     2,     1,     2,
       0,     2,     2,     1,     1,     1,     1,     1,     0,     1,
       2,     1,     1,     3,     1,     1,     2,     2,     0,     4,
       0,     6,     0,     6,     0,     4,     2,     2,     2,     2,
       2,     2,     2,     2,     1,     1,     1,     2,     0,     1,
       1,     1,     1,     1,     3,     4,     4,     4,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     6,     6,     6,     4,     4,     7,
       4,     4,     4,     4,     0,     3,     4,     7,     4,     6,
       6,     4,     4,     4,     4,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     0,     1,     3,     1,     1,
       4,     1,     1,     1,     1,     1,     1,     0,     2,     1,
       3,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,     0,     1,    25,    27,    21,     7,     8,     3,
       6,     4,    60,     5,     0,     0,    68,     9,     0,     0,
       0,     0,    67,    66,    23,    63,    64,    65,    60,    58,
      68,     0,    38,    72,     0,    15,    14,    68,    10,    16,
      69,    71,    36,    37,     0,    50,    52,    62,    24,    59,
      98,    61,    26,    39,     0,    13,    22,    11,     0,     0,
       0,    70,    34,    54,    54,     0,     0,     0,     0,     0,
     134,    96,    94,    95,     0,     0,    78,    80,    84,     0,
       0,    82,     0,     0,     0,     0,     0,   174,   175,   176,
     177,   181,   179,   180,   178,   155,   151,     0,    74,    75,
       0,     0,   166,   152,   173,    28,    18,    12,   155,    42,
       0,     0,   161,   162,    90,    91,   165,    88,   172,     0,
       0,   155,    76,    77,     0,     0,     0,    86,    92,    93,
       0,   151,     0,   152,   182,   183,     0,     0,    87,    89,
     165,     0,    97,   156,   158,   163,   159,   164,   172,    73,
       0,   167,    30,    17,    20,     0,     0,     0,    55,     0,
       0,     0,   145,   146,   147,   148,   149,   150,     0,     0,
       0,     0,     0,   135,    99,   100,   101,   103,     0,   102,
       0,     0,     0,     0,     0,     0,   167,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   104,     0,     0,    60,
       0,     0,     0,     0,    57,    51,    56,    53,   141,   143,
       0,   142,   144,     0,    79,     0,    85,     0,   136,   133,
     138,     0,   157,   127,   128,   132,   131,   130,   105,   106,
     107,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   167,     0,   171,
     168,   169,    32,    29,     0,    44,     0,     0,    43,     0,
       0,     0,     0,   167,   160,     0,   167,   115,   116,   120,
     111,   117,   118,   119,   109,   123,   108,   110,   112,   113,
     114,   121,   122,     0,     0,     0,     0,    31,     0,    41,
      45,   139,   140,    81,    83,     0,   126,     0,   124,   125,
     170,     0,     0,     0,   137,   129,    33,    40,    48,     0,
       0,     0,     0,    47,    35,    46,     0,    49
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,     8,     9,    37,    38,    59,    60,   153,
      10,    16,    11,    24,    12,    14,    13,    15,   152,   199,
     254,   286,    25,   109,    44,    54,   202,   155,   203,   303,
     311,   312,    26,    63,    27,    64,   110,   159,    28,    29,
      30,    39,    40,    41,    51,    97,   124,   125,   130,   126,
     178,   179,    98,   121,    99,   169,   100,   141,   154,   143,
     144,   145,   146,   147,   197,   198,   250,   251,   102,   118,
     104,   136
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -238
static const short yypact[] =
{
    -238,     3,    -4,  -238,  -238,  -238,  -238,  -238,  -238,    -4,
    -238,  -238,   218,  -238,   -58,   -49,   102,  -238,   -44,   -45,
     -32,    -2,  -238,  -238,  -238,  -238,  -238,  -238,    29,  -238,
      13,    10,   -44,  -238,    21,  -238,  -238,    66,  -238,   -31,
      13,  -238,  -238,  -238,    22,  -238,  -238,  -238,  -238,  -238,
     242,  -238,  -238,  -238,    26,  -238,  -238,  -238,    47,    31,
      37,  -238,  -238,  -238,  -238,     1,     1,   255,   255,   255,
    -238,  -238,  -238,  -238,     5,    19,  -238,  -238,    68,   255,
     255,  -238,   268,    12,   268,   255,   255,  -238,  -238,  -238,
    -238,  -238,  -238,  -238,  -238,   164,    30,    44,  -238,  -238,
      46,    33,  -238,    40,  -238,  -238,  -238,  -238,   164,  -238,
     -14,   -15,  -238,  -238,  -238,  -238,  -238,  -238,  -238,    81,
     121,   164,  -238,  -238,    -5,    -5,    -5,  -238,  -238,  -238,
      -5,  -238,    92,  -238,  -238,  -238,    70,   112,  -238,  -238,
      71,    73,  -238,   116,  -238,  -238,  -238,  -238,    80,  -238,
     141,  -238,  -238,  -238,  -238,    -1,   255,    93,  -238,    97,
      99,     1,  -238,  -238,  -238,  -238,  -238,  -238,     1,   255,
       1,     1,   255,  -238,  -238,  -238,  -238,  -238,   109,  -238,
     133,   136,   146,   255,   255,   255,  -238,   164,   147,   255,
      12,   148,   255,   255,   255,   255,     8,   117,   255,    -6,
     255,   255,    13,   140,  -238,  -238,  -238,  -238,  -238,  -238,
     213,  -238,  -238,   214,  -238,   145,  -238,   162,   135,  -238,
    -238,   151,  -238,   178,   153,  -238,  -238,  -238,  -238,  -238,
    -238,   255,   255,   255,   255,   255,   255,   255,   255,   255,
     255,   255,   255,   255,   255,   255,   255,  -238,   165,  -238,
     154,  -238,  -238,  -238,   167,  -238,   -18,   181,  -238,     1,
       1,    98,    98,  -238,  -238,   255,  -238,  -238,  -238,  -238,
    -238,  -238,  -238,  -238,  -238,  -238,  -238,  -238,  -238,  -238,
    -238,  -238,  -238,   169,   255,   255,    -5,  -238,   255,  -238,
    -238,  -238,  -238,  -238,  -238,   179,  -238,   180,  -238,  -238,
    -238,   189,   191,    16,  -238,  -238,  -238,  -238,  -238,   255,
     197,   198,    -5,  -238,  -238,  -238,   210,  -238
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -238,  -238,  -238,   267,  -238,  -238,   240,  -238,  -238,   157,
    -238,  -238,  -238,    85,  -238,  -238,  -238,  -238,  -238,  -238,
    -238,  -238,  -238,  -238,   248,  -238,  -238,  -238,  -238,  -238,
    -238,  -238,  -238,  -238,  -238,  -238,   221,  -238,  -238,   258,
    -238,   257,  -238,   -39,  -238,  -238,  -238,  -238,  -238,  -238,
    -115,   101,  -238,  -238,  -238,   170,   -25,  -238,   196,  -238,
     107,   -60,  -238,   -50,  -184,  -238,  -238,    11,  -238,   -41,
    -237,   105
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -173
static const short yytable[] =
{
     101,    61,   221,     3,   200,   114,   115,    31,     4,   103,
     180,   181,    42,    43,   252,   182,    32,   117,   119,   120,
      58,   174,   175,   176,   293,   294,   156,   156,   288,   128,
     129,    45,   231,   232,   308,   138,   139,   127,   233,   157,
     160,   133,    18,   133,    46,   -19,    19,     5,    20,   201,
     234,   235,   236,   237,   148,     6,   309,   132,   289,   137,
     177,   158,   158,   283,    21,   310,   112,   148,    22,    23,
     122,    33,     7,   113,    47,   134,    48,    18,   135,   295,
     148,    19,   297,    20,   123,   161,    52,   238,   239,   240,
     241,   242,   243,   244,   245,   246,   247,    55,    62,    21,
     196,   208,   105,    22,    23,   106,   204,   107,   209,   108,
     211,   212,   162,   163,   164,   165,   166,   167,  -165,   210,
     149,   151,   213,   150,    33,   170,    56,   168,  -172,    87,
      88,    89,    90,   218,   219,   220,    34,    94,   183,   224,
      35,    36,   227,   228,   229,   230,   148,   184,   249,   188,
     255,   256,   162,   163,   164,   165,   166,   167,   185,  -153,
      33,   186,   187,   257,    91,    92,    93,   171,  -154,   205,
     189,   301,    34,   206,   214,   207,    35,    36,   190,   191,
     192,   267,   268,   269,   270,   271,   272,   273,   274,   275,
     276,   277,   278,   279,   280,   281,   282,   316,   215,   291,
     292,   216,    87,    88,    89,    90,   248,    91,    92,    93,
      94,   217,   177,   226,   116,   296,   258,   259,   260,   193,
     194,   195,   261,   263,   265,    87,    88,    89,    90,   112,
      91,    92,    93,    94,   299,   249,   113,   140,   302,   262,
     264,   266,   284,   287,   285,    65,    66,    67,    68,    69,
      70,    71,    72,    73,   306,    74,    75,   290,   298,   313,
      76,    77,    78,    79,    80,    81,    18,   307,   304,   305,
      19,    82,    20,   314,   315,   317,    17,    57,   173,    83,
      53,    84,    85,    86,   253,   111,    49,    50,    21,   223,
     172,   142,    22,    23,   222,   225,   300,     0,     0,     0,
       0,     0,     0,    87,    88,    89,    90,     0,    91,    92,
      93,    94,     0,     0,    95,    96,    87,    88,    89,    90,
       0,    91,    92,    93,    94,     0,     0,     0,   116,    87,
      88,    89,    90,     0,     0,     0,     0,    94,     0,     0,
       0,   131
};

static const short yycheck[] =
{
      50,    40,   186,     0,     5,    65,    66,    65,    12,    50,
     125,   126,    56,    57,    20,   130,    65,    67,    68,    69,
      51,    26,    27,    28,   261,   262,    41,    41,    46,    79,
      80,    76,    24,    25,    18,    85,    86,    78,    30,    53,
      55,    82,    48,    84,    76,    76,    52,    51,    54,    50,
      42,    43,    44,    45,    95,    59,    40,    82,    76,    84,
      65,    76,    76,   247,    70,    49,    65,   108,    74,    75,
      65,    58,    76,    72,    76,    63,    47,    48,    66,   263,
     121,    52,   266,    54,    65,     4,    76,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    76,    76,    70,
     150,   161,    76,    74,    75,    58,   156,    76,   168,    72,
     170,   171,    31,    32,    33,    34,    35,    36,    88,   169,
      76,    88,   172,    77,    58,     4,    60,    46,    88,    61,
      62,    63,    64,   183,   184,   185,    70,    69,    46,   189,
      74,    75,   192,   193,   194,   195,   187,    77,   198,     8,
     200,   201,    31,    32,    33,    34,    35,    36,    46,    88,
      58,    88,    46,   202,    66,    67,    68,    46,    88,    76,
      29,   286,    70,    76,    65,    76,    74,    75,    37,    38,
      39,   231,   232,   233,   234,   235,   236,   237,   238,   239,
     240,   241,   242,   243,   244,   245,   246,   312,    65,   259,
     260,    65,    61,    62,    63,    64,    89,    66,    67,    68,
      69,    65,    65,    65,    73,   265,    76,     4,     4,    78,
      79,    80,    77,    88,    46,    61,    62,    63,    64,    65,
      66,    67,    68,    69,   284,   285,    72,    73,   288,    77,
      89,    88,    77,    76,    90,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    65,    13,    14,    76,    89,   309,
      18,    19,    20,    21,    22,    23,    48,    76,    89,    89,
      52,    29,    54,    76,    76,    65,     9,    37,   121,    37,
      32,    39,    40,    41,   199,    64,    28,    30,    70,   188,
     120,    95,    74,    75,   187,   190,   285,    -1,    -1,    -1,
      -1,    -1,    -1,    61,    62,    63,    64,    -1,    66,    67,
      68,    69,    -1,    -1,    72,    73,    61,    62,    63,    64,
      -1,    66,    67,    68,    69,    -1,    -1,    -1,    73,    61,
      62,    63,    64,    -1,    -1,    -1,    -1,    69,    -1,    -1,
      -1,    73
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    92,    93,     0,    12,    51,    59,    76,    94,    95,
     101,   103,   105,   107,   106,   108,   102,    94,    48,    52,
      54,    70,    74,    75,   104,   113,   123,   125,   129,   130,
     131,    65,    65,    58,    70,    74,    75,    96,    97,   132,
     133,   134,    56,    57,   115,    76,    76,    76,    47,   130,
     132,   135,    76,   115,   116,    76,    60,    97,    51,    98,
      99,   134,    76,   124,   126,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    13,    14,    18,    19,    20,    21,
      22,    23,    29,    37,    39,    40,    41,    61,    62,    63,
      64,    66,    67,    68,    69,    72,    73,   136,   143,   145,
     147,   154,   159,   160,   161,    76,    58,    76,    72,   114,
     127,   127,    65,    72,   152,   152,    73,   154,   160,   154,
     154,   144,    65,    65,   137,   138,   140,   160,   154,   154,
     139,    73,   147,   160,    63,    66,   162,   147,   154,   154,
      73,   148,   149,   150,   151,   152,   153,   154,   160,    76,
      77,    88,   109,   100,   149,   118,    41,    53,    76,   128,
      55,     4,    31,    32,    33,    34,    35,    36,    46,   146,
       4,    46,   146,   100,    26,    27,    28,    65,   141,   142,
     141,   141,   141,    46,    77,    46,    88,    46,     8,    29,
      37,    38,    39,    78,    79,    80,   154,   155,   156,   110,
       5,    50,   117,   119,   154,    76,    76,    76,   152,   152,
     154,   152,   152,   154,    65,    65,    65,    65,   154,   154,
     154,   155,   151,   142,   154,   162,    65,   154,   154,   154,
     154,    24,    25,    30,    42,    43,    44,    45,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,   154,
     157,   158,    20,   104,   111,   154,   154,   134,    76,     4,
       4,    77,    77,    88,    89,    46,    88,   154,   154,   154,
     154,   154,   154,   154,   154,   154,   154,   154,   154,   154,
     154,   154,   154,   155,    77,    90,   112,    76,    46,    76,
      76,   152,   152,   161,   161,   155,   154,   155,    89,   154,
     158,   141,   154,   120,    89,    89,    65,    76,    18,    40,
      49,   121,   122,   154,    76,    76,   141,    65
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
#line 238 "imcc.y"
    { open_comp_unit(); yyval.i = 0;}
    break;

  case 3:
#line 239 "imcc.y"
    { close_comp_unit(interp); yyval.i = 0; }
    break;

  case 7:
#line 245 "imcc.y"
    { yyval.i = 0; }
    break;

  case 12:
#line 257 "imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 258 "imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 259 "imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 260 "imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 263 "imcc.y"
    {clear_state();}
    break;

  case 17:
#line 264 "imcc.y"
    { yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                                          free(yyvsp[-1].s); }
    break;

  case 18:
#line 266 "imcc.y"
    {
                                          char *name = str_dup(yyvsp[0].s);
                                          yyval.i = iSUBROUTINE(
                                          mk_address(yyvsp[0].s, U_add_uniq_sub));
                                          yyval.i->r[1] =  mk_pcc_sub(name, 0);
                                        }
    break;

  case 19:
#line 272 "imcc.y"
    { yyval.i = 0;}
    break;

  case 21:
#line 279 "imcc.y"
    { open_comp_unit();
                                          function = "(emit)"; }
    break;

  case 22:
#line 282 "imcc.y"
    { if (optimizer_level & OPT_PASM)
                                                allocate(interp);
                                          emit_flush(interp); yyval.i=0;}
    break;

  case 24:
#line 293 "imcc.y"
    {
          yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 25:
#line 300 "imcc.y"
    { open_comp_unit(); }
    break;

  case 26:
#line 302 "imcc.y"
    { yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        }
    break;

  case 27:
#line 306 "imcc.y"
    { open_comp_unit(); }
    break;

  case 28:
#line 308 "imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 29:
#line 315 "imcc.y"
    { yyval.i = 0; }
    break;

  case 30:
#line 318 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 31:
#line 319 "imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 32:
#line 322 "imcc.y"
    { is_def=1; }
    break;

  case 33:
#line 323 "imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 34:
#line 326 "imcc.y"
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

  case 35:
#line 352 "imcc.y"
    { yyval.i = 0; }
    break;

  case 36:
#line 355 "imcc.y"
    { yyval.t = 1; }
    break;

  case 37:
#line 356 "imcc.y"
    { yyval.t = 0; }
    break;

  case 38:
#line 359 "imcc.y"
    { yyval.t = -1; }
    break;

  case 40:
#line 363 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 41:
#line 367 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 42:
#line 372 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 43:
#line 373 "imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 44:
#line 376 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 45:
#line 379 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 46:
#line 380 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-7].sr, yyvsp[-1].sr); }
    break;

  case 47:
#line 383 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 48:
#line 384 "imcc.y"
    { is_def=1; }
    break;

  case 49:
#line 384 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 50:
#line 387 "imcc.y"
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

  case 51:
#line 400 "imcc.y"
    { yyval.i = 0; }
    break;

  case 52:
#line 403 "imcc.y"
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

  case 53:
#line 417 "imcc.y"
    { yyval.i = 0; }
    break;

  case 54:
#line 420 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 55:
#line 421 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 56:
#line 422 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 57:
#line 425 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 60:
#line 432 "imcc.y"
    { clear_state(); }
    break;

  case 61:
#line 433 "imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 62:
#line 434 "imcc.y"
    { yyval.i = 0; }
    break;

  case 63:
#line 435 "imcc.y"
    { yyval.i = 0; }
    break;

  case 66:
#line 438 "imcc.y"
    { yyval.i = 0; }
    break;

  case 67:
#line 439 "imcc.y"
    { yyval.i = 0; }
    break;

  case 68:
#line 442 "imcc.y"
    { yyval.i = NULL; }
    break;

  case 72:
#line 450 "imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 73:
#line 454 "imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 76:
#line 459 "imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 77:
#line 460 "imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 78:
#line 461 "imcc.y"
    { is_def=1; }
    break;

  case 79:
#line 461 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 80:
#line 462 "imcc.y"
    { is_def=1; }
    break;

  case 81:
#line 463 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 82:
#line 464 "imcc.y"
    { is_def=1; }
    break;

  case 83:
#line 465 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 84:
#line 466 "imcc.y"
    { is_def=1; }
    break;

  case 85:
#line 466 "imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 86:
#line 468 "imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 87:
#line 469 "imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 88:
#line 470 "imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 89:
#line 471 "imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 90:
#line 472 "imcc.y"
    { yyval.i = MK_I(interp, "bsr",  1, yyvsp[0].sr); }
    break;

  case 91:
#line 473 "imcc.y"
    { yyval.i = MK_I(interp, "branch",1, yyvsp[0].sr); }
    break;

  case 92:
#line 474 "imcc.y"
    { yyval.i = MK_I(interp, "inc",1, yyvsp[0].sr); }
    break;

  case 93:
#line 475 "imcc.y"
    { yyval.i = MK_I(interp, "dec",1, yyvsp[0].sr); }
    break;

  case 94:
#line 476 "imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,0); }
    break;

  case 95:
#line 477 "imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,0); }
    break;

  case 96:
#line 478 "imcc.y"
    { yyval.i = MK_I(interp, "end" ,0); }
    break;

  case 97:
#line 479 "imcc.y"
    { yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 98:
#line 481 "imcc.y"
    { yyval.i = 0;}
    break;

  case 99:
#line 485 "imcc.y"
    { yyval.t = 'I'; }
    break;

  case 100:
#line 486 "imcc.y"
    { yyval.t = 'N'; }
    break;

  case 101:
#line 487 "imcc.y"
    { yyval.t = 'S'; }
    break;

  case 102:
#line 488 "imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 104:
#line 496 "imcc.y"
    { yyval.i = MK_I(interp, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 105:
#line 497 "imcc.y"
    { yyval.i = MK_I(interp, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 106:
#line 498 "imcc.y"
    { yyval.i = MK_I(interp, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 107:
#line 499 "imcc.y"
    { yyval.i = MK_I(interp, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 108:
#line 500 "imcc.y"
    { yyval.i = MK_I(interp, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 109:
#line 501 "imcc.y"
    { yyval.i = MK_I(interp, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 110:
#line 502 "imcc.y"
    { yyval.i = MK_I(interp, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 111:
#line 503 "imcc.y"
    { yyval.i = MK_I(interp, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 112:
#line 504 "imcc.y"
    { yyval.i = MK_I(interp, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 113:
#line 505 "imcc.y"
    { yyval.i = MK_I(interp, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 114:
#line 506 "imcc.y"
    { yyval.i = MK_I(interp, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 115:
#line 507 "imcc.y"
    { yyval.i = MK_I(interp, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 116:
#line 508 "imcc.y"
    { yyval.i = MK_I(interp, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 117:
#line 509 "imcc.y"
    { yyval.i = MK_I(interp, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 118:
#line 510 "imcc.y"
    { yyval.i = MK_I(interp, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 119:
#line 511 "imcc.y"
    { yyval.i = MK_I(interp, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 120:
#line 512 "imcc.y"
    { yyval.i = MK_I(interp, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 121:
#line 513 "imcc.y"
    { yyval.i = MK_I(interp, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 122:
#line 514 "imcc.y"
    { yyval.i = MK_I(interp, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 123:
#line 515 "imcc.y"
    { yyval.i = MK_I(interp, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 124:
#line 516 "imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 125:
#line 517 "imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 126:
#line 518 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 127:
#line 519 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL,1); }
    break;

  case 128:
#line 520 "imcc.y"
    { yyval.i = MK_I(interp, "defined",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 129:
#line 521 "imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 130:
#line 523 "imcc.y"
    { yyval.i = MK_I(interp, "clone",2, yyvsp[-3].sr, yyvsp[0].sr);
    }
    break;

  case 131:
#line 525 "imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          2, yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once)); }
    break;

  case 132:
#line 527 "imcc.y"
    { yyval.i = MK_I(interp, "find_global",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 133:
#line 528 "imcc.y"
    { yyval.i = MK_I(interp, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 134:
#line 529 "imcc.y"
    { expect_pasm = 1; }
    break;

  case 135:
#line 530 "imcc.y"
    { yyval.i = INS(interp, "new",0,regs,nargs,keyvec,1); }
    break;

  case 136:
#line 531 "imcc.y"
    { yyval.i = MK_I(interp, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 137:
#line 532 "imcc.y"
    { keyvec=KEY_BIT(2);
                                  yyval.i = MK_I(interp, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 138:
#line 534 "imcc.y"
    { yyval.i = MK_I(interp, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 139:
#line 538 "imcc.y"
    {yyval.i=MK_I(interp, yyvsp[-3].s,3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 140:
#line 539 "imcc.y"
    {yyval.i=MK_I(interp, inv_op(yyvsp[-3].s),
                                            3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 141:
#line 541 "imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 142:
#line 542 "imcc.y"
    {yyval.i= MK_I(interp, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 143:
#line 543 "imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 144:
#line 544 "imcc.y"
    {yyval.i= MK_I(interp, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 145:
#line 549 "imcc.y"
    { yyval.s = "eq"; }
    break;

  case 146:
#line 550 "imcc.y"
    { yyval.s = "ne"; }
    break;

  case 147:
#line 551 "imcc.y"
    { yyval.s = "gt"; }
    break;

  case 148:
#line 552 "imcc.y"
    { yyval.s = "ge"; }
    break;

  case 149:
#line 553 "imcc.y"
    { yyval.s = "lt"; }
    break;

  case 150:
#line 554 "imcc.y"
    { yyval.s = "le"; }
    break;

  case 155:
#line 565 "imcc.y"
    { yyval.sr = NULL; }
    break;

  case 156:
#line 566 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 157:
#line 569 "imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 159:
#line 573 "imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 160:
#line 574 "imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 161:
#line 579 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 162:
#line 580 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 167:
#line 591 "imcc.y"
    { nkeys=0; }
    break;

  case 168:
#line 592 "imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 169:
#line 595 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 170:
#line 596 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 174:
#line 606 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 175:
#line 607 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 176:
#line 608 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 177:
#line 609 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 178:
#line 610 "imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 179:
#line 613 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 180:
#line 614 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 181:
#line 615 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 182:
#line 618 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 183:
#line 619 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2419 "imcparser.c"

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


#line 623 "imcc.y"



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

