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
     FLATTEN_ARG = 261,
     IF = 262,
     UNLESS = 263,
     NEW = 264,
     END = 265,
     SAVEALL = 266,
     RESTOREALL = 267,
     SUB = 268,
     NAMESPACE = 269,
     ENDNAMESPACE = 270,
     CLASS = 271,
     ENDCLASS = 272,
     SYM = 273,
     LOCAL = 274,
     CONST = 275,
     PARAM = 276,
     INC = 277,
     DEC = 278,
     GLOBAL_CONST = 279,
     SHIFT_LEFT = 280,
     SHIFT_RIGHT = 281,
     INTV = 282,
     FLOATV = 283,
     STRINGV = 284,
     DEFINED = 285,
     LOG_XOR = 286,
     RELOP_EQ = 287,
     RELOP_NE = 288,
     RELOP_GT = 289,
     RELOP_GTE = 290,
     RELOP_LT = 291,
     RELOP_LTE = 292,
     GLOBAL = 293,
     ADDR = 294,
     CLONE = 295,
     RESULT = 296,
     RETURN = 297,
     POW = 298,
     SHIFT_RIGHT_U = 299,
     LOG_AND = 300,
     LOG_OR = 301,
     COMMA = 302,
     ESUB = 303,
     PCC_BEGIN = 304,
     PCC_END = 305,
     PCC_CALL = 306,
     PCC_SUB = 307,
     PCC_BEGIN_RETURN = 308,
     PCC_END_RETURN = 309,
     PCC_BEGIN_YIELD = 310,
     PCC_END_YIELD = 311,
     PROTOTYPED = 312,
     NON_PROTOTYPED = 313,
     LABEL = 314,
     EMIT = 315,
     EOM = 316,
     IREG = 317,
     NREG = 318,
     SREG = 319,
     PREG = 320,
     IDENTIFIER = 321,
     STRINGC = 322,
     INTC = 323,
     FLOATC = 324,
     REG = 325,
     MACRO = 326,
     ENDM = 327,
     PARROT_OP = 328,
     VAR = 329,
     LINECOMMENT = 330,
     FILECOMMENT = 331
   };
#endif
#define CALL 258
#define GOTO 259
#define ARG 260
#define FLATTEN_ARG 261
#define IF 262
#define UNLESS 263
#define NEW 264
#define END 265
#define SAVEALL 266
#define RESTOREALL 267
#define SUB 268
#define NAMESPACE 269
#define ENDNAMESPACE 270
#define CLASS 271
#define ENDCLASS 272
#define SYM 273
#define LOCAL 274
#define CONST 275
#define PARAM 276
#define INC 277
#define DEC 278
#define GLOBAL_CONST 279
#define SHIFT_LEFT 280
#define SHIFT_RIGHT 281
#define INTV 282
#define FLOATV 283
#define STRINGV 284
#define DEFINED 285
#define LOG_XOR 286
#define RELOP_EQ 287
#define RELOP_NE 288
#define RELOP_GT 289
#define RELOP_GTE 290
#define RELOP_LT 291
#define RELOP_LTE 292
#define GLOBAL 293
#define ADDR 294
#define CLONE 295
#define RESULT 296
#define RETURN 297
#define POW 298
#define SHIFT_RIGHT_U 299
#define LOG_AND 300
#define LOG_OR 301
#define COMMA 302
#define ESUB 303
#define PCC_BEGIN 304
#define PCC_END 305
#define PCC_CALL 306
#define PCC_SUB 307
#define PCC_BEGIN_RETURN 308
#define PCC_END_RETURN 309
#define PCC_BEGIN_YIELD 310
#define PCC_END_YIELD 311
#define PROTOTYPED 312
#define NON_PROTOTYPED 313
#define LABEL 314
#define EMIT 315
#define EOM 316
#define IREG 317
#define NREG 318
#define SREG 319
#define PREG 320
#define IDENTIFIER 321
#define STRINGC 322
#define INTC 323
#define FLOATC 324
#define REG 325
#define MACRO 326
#define ENDM 327
#define PARROT_OP 328
#define VAR 329
#define LINECOMMENT 330
#define FILECOMMENT 331




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
#line 422 "imcparser.c"
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
#line 443 "imcparser.c"

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
#define YYLAST   352

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  92
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  72
/* YYNRULES -- Number of rules. */
#define YYNRULES  184
/* YYNRULES -- Number of states. */
#define YYNSTATES  320

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   331

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      77,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    79,     2,     2,     2,    85,    87,     2,
       2,     2,    83,    82,     2,    80,    86,    84,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    91,
       2,    78,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    89,     2,    90,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    88,     2,    81,     2,     2,     2,
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
      75,    76
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
     107,   113,   117,   118,   122,   125,   128,   129,   133,   136,
     137,   142,   143,   150,   151,   158,   159,   162,   166,   169,
     171,   174,   175,   178,   181,   183,   185,   187,   189,   191,
     192,   194,   197,   199,   201,   205,   207,   209,   212,   215,
     216,   221,   222,   229,   230,   237,   238,   243,   246,   249,
     252,   255,   258,   261,   264,   267,   269,   271,   273,   276,
     277,   279,   281,   283,   285,   287,   291,   296,   301,   306,
     312,   318,   324,   330,   336,   342,   348,   354,   360,   366,
     372,   378,   384,   390,   396,   402,   409,   416,   423,   428,
     433,   441,   446,   451,   456,   461,   462,   466,   471,   479,
     484,   491,   498,   503,   508,   513,   518,   520,   522,   524,
     526,   528,   530,   532,   534,   536,   538,   539,   541,   545,
     547,   549,   554,   556,   558,   560,   562,   564,   566,   567,
     570,   572,   576,   578,   580,   582,   584,   586,   588,   590,
     592,   594,   596,   598,   600
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
      93,     0,    -1,    -1,    94,    96,    -1,   104,    -1,   108,
      -1,   102,    -1,    77,    -1,    95,    -1,    96,    95,    -1,
      98,    -1,    97,    98,    -1,   133,    99,    77,    -1,    71,
      77,    -1,    76,    -1,    75,    -1,    -1,   100,    73,   101,
      -1,    52,    59,    -1,    -1,   150,    -1,    -1,    60,   103,
      97,    61,    -1,   106,   105,    -1,   130,    48,    -1,    -1,
      13,   107,    66,    77,    -1,    -1,    -1,    52,   109,    66,
     117,    77,   110,   111,   105,    -1,    -1,   111,   112,    77,
      -1,    -1,    21,   113,   142,    66,    -1,    -1,    49,   116,
      77,   115,   119,   118,   135,    77,   121,    50,    77,    -1,
      57,    -1,    58,    -1,    -1,   116,    -1,    51,   155,    47,
     155,    77,    -1,    51,   155,    77,    -1,    -1,   119,   120,
      77,    -1,     5,   155,    -1,     6,   148,    -1,    -1,   121,
     122,    77,    -1,    41,   148,    -1,    -1,    19,   123,   142,
      66,    -1,    -1,    53,    77,   125,   128,    54,    77,    -1,
      -1,    55,    77,   127,   128,    56,    77,    -1,    -1,   128,
      77,    -1,   128,   129,    77,    -1,    42,   155,    -1,   131,
      -1,   130,   131,    -1,    -1,   132,   136,    -1,    71,    77,
      -1,   114,    -1,   124,    -1,   126,    -1,    76,    -1,    75,
      -1,    -1,   134,    -1,   134,   135,    -1,   135,    -1,    59,
      -1,   133,   137,    77,    -1,   144,    -1,   146,    -1,    14,
      66,    -1,    15,    66,    -1,    -1,    19,   138,   142,    66,
      -1,    -1,    20,   139,   142,    66,    78,   162,    -1,    -1,
      24,   140,   142,    66,    78,   162,    -1,    -1,    21,   141,
     142,    66,    -1,    21,   161,    -1,    41,   155,    -1,     5,
     155,    -1,    42,   155,    -1,     3,   153,    -1,     4,   153,
      -1,    22,   155,    -1,    23,   155,    -1,    11,    -1,    12,
      -1,    10,    -1,    73,   150,    -1,    -1,    27,    -1,    28,
      -1,    29,    -1,   143,    -1,    66,    -1,   148,    78,   155,
      -1,   148,    78,    79,   155,    -1,   148,    78,    80,   155,
      -1,   148,    78,    81,   155,    -1,   148,    78,   155,    82,
     155,    -1,   148,    78,   155,    80,   155,    -1,   148,    78,
     155,    83,   155,    -1,   148,    78,   155,    43,   155,    -1,
     148,    78,   155,    84,   155,    -1,   148,    78,   155,    85,
     155,    -1,   148,    78,   155,    86,   155,    -1,   148,    78,
     155,    25,   155,    -1,   148,    78,   155,    26,   155,    -1,
     148,    78,   155,    44,   155,    -1,   148,    78,   155,    45,
     155,    -1,   148,    78,   155,    46,   155,    -1,   148,    78,
     155,    31,   155,    -1,   148,    78,   155,    87,   155,    -1,
     148,    78,   155,    88,   155,    -1,   148,    78,   155,    81,
     155,    -1,   148,    78,   155,    89,   156,    90,    -1,   155,
      89,   156,    90,    78,   155,    -1,   148,    78,     9,   143,
      47,   155,    -1,   148,    78,     9,   143,    -1,   148,    78,
      30,   155,    -1,   148,    78,    30,   155,    89,   156,    90,
      -1,   148,    78,    40,   155,    -1,   148,    78,    39,    66,
      -1,   148,    78,    38,   163,    -1,    38,   163,    78,   155,
      -1,    -1,     9,   145,   101,    -1,    30,   148,    47,   155,
      -1,    30,   148,    47,   155,    89,   156,    90,    -1,    40,
     148,    47,   155,    -1,     7,   155,   147,   155,     4,   153,
      -1,     8,   155,   147,   155,     4,   153,    -1,     7,   155,
       4,   153,    -1,     8,   155,     4,   153,    -1,     7,   155,
      47,   153,    -1,     8,   155,    47,   153,    -1,    32,    -1,
      33,    -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,
      74,    -1,   161,    -1,    74,    -1,   161,    -1,    -1,   151,
      -1,   151,    47,   152,    -1,   152,    -1,   154,    -1,   149,
      89,   156,    90,    -1,    66,    -1,    73,    -1,   153,    -1,
     155,    -1,    74,    -1,   160,    -1,    -1,   157,   158,    -1,
     159,    -1,   158,    91,   159,    -1,   155,    -1,   161,    -1,
     162,    -1,    62,    -1,    63,    -1,    64,    -1,    65,    -1,
      70,    -1,    68,    -1,    69,    -1,    67,    -1,    64,    -1,
      67,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   238,   238,   238,   242,   243,   244,   245,   248,   249,
     253,   254,   257,   258,   259,   260,   263,   263,   266,   272,
     274,   279,   278,   287,   291,   300,   300,   306,   308,   306,
     318,   319,   322,   322,   326,   326,   355,   356,   359,   360,
     363,   367,   372,   373,   376,   377,   380,   381,   384,   385,
     385,   388,   388,   404,   404,   421,   422,   423,   426,   429,
     430,   433,   433,   435,   436,   437,   438,   439,   440,   443,
     444,   447,   448,   451,   454,   457,   459,   460,   461,   462,
     462,   463,   463,   465,   465,   467,   467,   469,   470,   471,
     472,   473,   474,   475,   476,   477,   478,   479,   480,   482,
     485,   487,   488,   489,   492,   496,   498,   499,   500,   501,
     502,   503,   504,   505,   506,   507,   508,   509,   510,   511,
     512,   513,   514,   515,   516,   517,   518,   519,   520,   521,
     522,   524,   526,   528,   529,   530,   530,   532,   533,   535,
     538,   540,   542,   543,   544,   545,   549,   551,   552,   553,
     554,   555,   559,   560,   562,   563,   566,   567,   570,   571,
     574,   575,   579,   581,   583,   585,   588,   589,   592,   592,
     596,   597,   600,   603,   604,   607,   608,   609,   610,   611,
     614,   615,   616,   619,   620
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "CALL", "GOTO", "ARG", "FLATTEN_ARG", "IF", 
  "UNLESS", "NEW", "END", "SAVEALL", "RESTOREALL", "SUB", "NAMESPACE", 
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
     325,   326,   327,   328,   329,   330,   331,    10,    61,    33,
      45,   126,    43,    42,    47,    37,    46,    38,   124,    91,
      93,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    92,    94,    93,    95,    95,    95,    95,    96,    96,
      97,    97,    98,    98,    98,    98,   100,    99,    99,    99,
     101,   103,   102,   104,   105,   107,   106,   109,   110,   108,
     111,   111,   113,   112,   115,   114,   116,   116,   117,   117,
     118,   118,   119,   119,   120,   120,   121,   121,   122,   123,
     122,   125,   124,   127,   126,   128,   128,   128,   129,   130,
     130,   132,   131,   131,   131,   131,   131,   131,   131,   133,
     133,   134,   134,   135,   136,   137,   137,   137,   137,   138,
     137,   139,   137,   140,   137,   141,   137,   137,   137,   137,
     137,   137,   137,   137,   137,   137,   137,   137,   137,   137,
     142,   142,   142,   142,   143,   144,   144,   144,   144,   144,
     144,   144,   144,   144,   144,   144,   144,   144,   144,   144,
     144,   144,   144,   144,   144,   144,   144,   144,   144,   144,
     144,   144,   144,   144,   144,   145,   144,   144,   144,   144,
     146,   146,   146,   146,   146,   146,   147,   147,   147,   147,
     147,   147,   148,   148,   149,   149,   150,   150,   151,   151,
     152,   152,   153,   153,   154,   154,   155,   155,   157,   156,
     158,   158,   159,   160,   160,   161,   161,   161,   161,   161,
     162,   162,   162,   163,   163
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     2,     1,     1,     1,     1,     1,     2,
       1,     2,     3,     2,     1,     1,     0,     3,     2,     0,
       1,     0,     4,     2,     2,     0,     4,     0,     0,     8,
       0,     3,     0,     4,     0,    11,     1,     1,     0,     1,
       5,     3,     0,     3,     2,     2,     0,     3,     2,     0,
       4,     0,     6,     0,     6,     0,     2,     3,     2,     1,
       2,     0,     2,     2,     1,     1,     1,     1,     1,     0,
       1,     2,     1,     1,     3,     1,     1,     2,     2,     0,
       4,     0,     6,     0,     6,     0,     4,     2,     2,     2,
       2,     2,     2,     2,     2,     1,     1,     1,     2,     0,
       1,     1,     1,     1,     1,     3,     4,     4,     4,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     6,     6,     6,     4,     4,
       7,     4,     4,     4,     4,     0,     3,     4,     7,     4,
       6,     6,     4,     4,     4,     4,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     0,     1,     3,     1,
       1,     4,     1,     1,     1,     1,     1,     1,     0,     2,
       1,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,     0,     1,    25,    27,    21,     7,     8,     3,
       6,     4,    61,     5,     0,     0,    69,     9,     0,     0,
       0,     0,    68,    67,    23,    64,    65,    66,    61,    59,
      69,     0,    38,    73,     0,    15,    14,    69,    10,    16,
      70,    72,    36,    37,     0,    51,    53,    63,    24,    60,
      99,    62,    26,    39,     0,    13,    22,    11,     0,     0,
       0,    71,    34,    55,    55,     0,     0,     0,     0,     0,
     135,    97,    95,    96,     0,     0,    79,    81,    85,     0,
       0,    83,     0,     0,     0,     0,     0,   175,   176,   177,
     178,   182,   180,   181,   179,   156,   152,     0,    75,    76,
       0,     0,   167,   153,   174,    28,    18,    12,   156,    42,
       0,     0,   162,   163,    91,    92,   166,    89,   173,     0,
       0,   156,    77,    78,     0,     0,     0,    87,    93,    94,
       0,   152,     0,   153,   183,   184,     0,     0,    88,    90,
     166,     0,    98,   157,   159,   164,   160,   165,   173,    74,
       0,   168,    30,    17,    20,     0,     0,     0,    56,     0,
       0,     0,   146,   147,   148,   149,   150,   151,     0,     0,
       0,     0,     0,   136,   100,   101,   102,   104,     0,   103,
       0,     0,     0,     0,     0,     0,   168,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   105,     0,     0,    61,
       0,     0,     0,     0,     0,    58,    52,    57,    54,   142,
     144,     0,   143,   145,     0,    80,     0,    86,     0,   137,
     134,   139,     0,   158,   128,   129,   133,   132,   131,   106,
     107,   108,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   168,     0,
     172,   169,   170,    32,    29,     0,    44,    45,     0,     0,
      43,     0,     0,     0,     0,   168,   161,     0,   168,   116,
     117,   121,   112,   118,   119,   120,   110,   124,   109,   111,
     113,   114,   115,   122,   123,     0,     0,     0,     0,    31,
       0,    41,    46,   140,   141,    82,    84,     0,   127,     0,
     125,   126,   171,     0,     0,     0,   138,   130,    33,    40,
      49,     0,     0,     0,     0,    48,    35,    47,     0,    50
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,     8,     9,    37,    38,    59,    60,   153,
      10,    16,    11,    24,    12,    14,    13,    15,   152,   199,
     255,   288,    25,   109,    44,    54,   203,   155,   204,   305,
     313,   314,    26,    63,    27,    64,   110,   159,    28,    29,
      30,    39,    40,    41,    51,    97,   124,   125,   130,   126,
     178,   179,    98,   121,    99,   169,   100,   141,   154,   143,
     144,   145,   146,   147,   197,   198,   251,   252,   102,   118,
     104,   136
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -241
static const short yypact[] =
{
    -241,    18,    -1,  -241,  -241,  -241,  -241,  -241,  -241,    -1,
    -241,  -241,   172,  -241,   -46,   -22,   -45,  -241,    20,   -42,
     -21,     7,  -241,  -241,  -241,  -241,  -241,  -241,   124,  -241,
      -2,    24,    20,  -241,    25,  -241,  -241,     4,  -241,   -27,
      -2,  -241,  -241,  -241,    28,  -241,  -241,  -241,  -241,  -241,
     230,  -241,  -241,  -241,    29,  -241,  -241,  -241,    23,    35,
      40,  -241,  -241,  -241,  -241,   -26,   -26,   265,   265,   265,
    -241,  -241,  -241,  -241,    48,    49,  -241,  -241,    26,   265,
     265,  -241,   278,     0,   278,   265,   265,  -241,  -241,  -241,
    -241,  -241,  -241,  -241,  -241,   252,    27,    41,  -241,  -241,
      43,    33,  -241,    34,  -241,  -241,  -241,  -241,   252,  -241,
     -25,   -15,  -241,  -241,  -241,  -241,  -241,  -241,  -241,   242,
     276,   252,  -241,  -241,   -20,   -20,   -20,  -241,  -241,  -241,
     -20,  -241,    83,  -241,  -241,  -241,    53,    85,  -241,  -241,
      44,    46,  -241,    89,  -241,  -241,  -241,  -241,    50,  -241,
      30,  -241,  -241,  -241,  -241,    10,   265,    63,  -241,    65,
      66,   -26,  -241,  -241,  -241,  -241,  -241,  -241,   -26,   265,
     -26,   -26,   265,  -241,  -241,  -241,  -241,  -241,    78,  -241,
      79,    84,    90,   265,   265,   265,  -241,   252,    91,   265,
       0,    93,   265,   265,   265,   265,   103,    70,   265,    32,
     265,   278,   265,    -2,    97,  -241,  -241,  -241,  -241,  -241,
    -241,   151,  -241,  -241,   162,  -241,    92,  -241,    98,    86,
    -241,  -241,    88,  -241,   133,   104,  -241,  -241,  -241,  -241,
    -241,  -241,   265,   265,   265,   265,   265,   265,   265,   265,
     265,   265,   265,   265,   265,   265,   265,   265,  -241,   118,
    -241,   106,  -241,  -241,  -241,   105,  -241,  -241,   -34,   121,
    -241,   -26,   -26,     5,     5,  -241,  -241,   265,  -241,  -241,
    -241,  -241,  -241,  -241,  -241,  -241,  -241,  -241,  -241,  -241,
    -241,  -241,  -241,  -241,  -241,   129,   265,   265,   -20,  -241,
     265,  -241,  -241,  -241,  -241,  -241,  -241,   130,  -241,   132,
    -241,  -241,  -241,   115,   146,    -8,  -241,  -241,  -241,  -241,
    -241,   278,   147,   149,   -20,  -241,  -241,  -241,   163,  -241
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -241,  -241,  -241,   219,  -241,  -241,   194,  -241,  -241,   111,
    -241,  -241,  -241,    58,  -241,  -241,  -241,  -241,  -241,  -241,
    -241,  -241,  -241,  -241,   226,  -241,  -241,  -241,  -241,  -241,
    -241,  -241,  -241,  -241,  -241,  -241,   198,  -241,  -241,   235,
    -241,   234,  -241,   -38,  -241,  -241,  -241,  -241,  -241,  -241,
    -120,    77,  -241,  -241,  -241,   153,   -81,  -241,   171,  -241,
      80,   -44,  -241,   -31,  -182,  -241,  -241,   -18,  -241,   -50,
    -240,    94
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -174
static const short yytable[] =
{
     103,   132,    61,   137,   222,   180,   181,   174,   175,   176,
     182,   310,     4,   290,    33,   200,   201,   156,     3,   101,
      31,   114,   115,   295,   296,    58,    34,   156,   127,   157,
      35,    36,   133,   311,   133,    45,   117,   119,   120,   188,
     112,   160,   312,   291,    32,   148,   177,   113,   128,   129,
     -19,     5,   158,   253,   138,   139,    46,    33,   148,     6,
     189,   202,   158,    33,   134,    56,   285,   135,   190,   191,
     192,   148,    91,    92,    93,    34,     7,    42,    43,    35,
      36,    18,   106,   297,    47,    19,   299,    20,    87,    88,
      89,    90,    87,    88,    89,    90,    94,    91,    92,    93,
      94,    52,    55,    21,   116,    62,   105,    22,    23,   193,
     194,   195,   107,   108,   122,   123,  -166,   209,   149,   196,
     257,   150,   151,  -173,   210,   205,   212,   213,   232,   233,
     183,   184,   185,  -154,   234,   186,   187,   148,   211,  -155,
     206,   214,   207,   208,   215,   216,   235,   236,   237,   238,
     217,   133,   219,   220,   221,   261,   218,   177,   225,   227,
     249,   228,   229,   230,   231,   259,   262,   250,   303,   256,
     263,   258,    48,    18,   260,   265,   264,    19,   266,    20,
     267,   308,   289,   239,   240,   241,   242,   243,   244,   245,
     246,   247,   248,   268,   318,    21,   286,   287,   292,    22,
      23,   269,   270,   271,   272,   273,   274,   275,   276,   277,
     278,   279,   280,   281,   282,   283,   284,   293,   294,   300,
     306,    18,   307,   309,   316,    19,   317,    20,    17,   319,
     315,    57,   173,    65,    66,    67,   298,    68,    69,    70,
      71,    72,    73,    21,    74,    75,   161,    22,    23,    76,
      77,    78,    79,    80,    81,   301,   250,   254,    53,   304,
      82,   133,   111,    49,    50,   224,   142,   223,    83,   302,
      84,    85,    86,   172,   162,   163,   164,   165,   166,   167,
     170,     0,     0,     0,   226,     0,     0,     0,     0,   168,
       0,     0,    87,    88,    89,    90,     0,    91,    92,    93,
      94,     0,     0,    95,    96,     0,     0,     0,   162,   163,
     164,   165,   166,   167,    87,    88,    89,    90,   112,    91,
      92,    93,    94,   171,     0,   113,   140,    87,    88,    89,
      90,     0,    91,    92,    93,    94,     0,     0,     0,   116,
      87,    88,    89,    90,     0,     0,     0,     0,    94,     0,
       0,     0,   131
};

static const short yycheck[] =
{
      50,    82,    40,    84,   186,   125,   126,    27,    28,    29,
     130,    19,    13,    47,    59,     5,     6,    42,     0,    50,
      66,    65,    66,   263,   264,    52,    71,    42,    78,    54,
      75,    76,    82,    41,    84,    77,    67,    68,    69,     9,
      66,    56,    50,    77,    66,    95,    66,    73,    79,    80,
      77,    52,    77,    21,    85,    86,    77,    59,   108,    60,
      30,    51,    77,    59,    64,    61,   248,    67,    38,    39,
      40,   121,    67,    68,    69,    71,    77,    57,    58,    75,
      76,    49,    59,   265,    77,    53,   268,    55,    62,    63,
      64,    65,    62,    63,    64,    65,    70,    67,    68,    69,
      70,    77,    77,    71,    74,    77,    77,    75,    76,    79,
      80,    81,    77,    73,    66,    66,    89,   161,    77,   150,
     201,    78,    89,    89,   168,   156,   170,   171,    25,    26,
      47,    78,    47,    89,    31,    89,    47,   187,   169,    89,
      77,   172,    77,    77,    66,    66,    43,    44,    45,    46,
      66,   201,   183,   184,   185,     4,    66,    66,   189,    66,
      90,   192,   193,   194,   195,   203,     4,   198,   288,   200,
      78,   202,    48,    49,    77,    89,    78,    53,    90,    55,
      47,    66,    77,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    89,   314,    71,    78,    91,    77,    75,
      76,   232,   233,   234,   235,   236,   237,   238,   239,   240,
     241,   242,   243,   244,   245,   246,   247,   261,   262,    90,
      90,    49,    90,    77,    77,    53,    77,    55,     9,    66,
     311,    37,   121,     3,     4,     5,   267,     7,     8,     9,
      10,    11,    12,    71,    14,    15,     4,    75,    76,    19,
      20,    21,    22,    23,    24,   286,   287,   199,    32,   290,
      30,   311,    64,    28,    30,   188,    95,   187,    38,   287,
      40,    41,    42,   120,    32,    33,    34,    35,    36,    37,
       4,    -1,    -1,    -1,   190,    -1,    -1,    -1,    -1,    47,
      -1,    -1,    62,    63,    64,    65,    -1,    67,    68,    69,
      70,    -1,    -1,    73,    74,    -1,    -1,    -1,    32,    33,
      34,    35,    36,    37,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    47,    -1,    73,    74,    62,    63,    64,
      65,    -1,    67,    68,    69,    70,    -1,    -1,    -1,    74,
      62,    63,    64,    65,    -1,    -1,    -1,    -1,    70,    -1,
      -1,    -1,    74
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    93,    94,     0,    13,    52,    60,    77,    95,    96,
     102,   104,   106,   108,   107,   109,   103,    95,    49,    53,
      55,    71,    75,    76,   105,   114,   124,   126,   130,   131,
     132,    66,    66,    59,    71,    75,    76,    97,    98,   133,
     134,   135,    57,    58,   116,    77,    77,    77,    48,   131,
     133,   136,    77,   116,   117,    77,    61,    98,    52,    99,
     100,   135,    77,   125,   127,     3,     4,     5,     7,     8,
       9,    10,    11,    12,    14,    15,    19,    20,    21,    22,
      23,    24,    30,    38,    40,    41,    42,    62,    63,    64,
      65,    67,    68,    69,    70,    73,    74,   137,   144,   146,
     148,   155,   160,   161,   162,    77,    59,    77,    73,   115,
     128,   128,    66,    73,   153,   153,    74,   155,   161,   155,
     155,   145,    66,    66,   138,   139,   141,   161,   155,   155,
     140,    74,   148,   161,    64,    67,   163,   148,   155,   155,
      74,   149,   150,   151,   152,   153,   154,   155,   161,    77,
      78,    89,   110,   101,   150,   119,    42,    54,    77,   129,
      56,     4,    32,    33,    34,    35,    36,    37,    47,   147,
       4,    47,   147,   101,    27,    28,    29,    66,   142,   143,
     142,   142,   142,    47,    78,    47,    89,    47,     9,    30,
      38,    39,    40,    79,    80,    81,   155,   156,   157,   111,
       5,     6,    51,   118,   120,   155,    77,    77,    77,   153,
     153,   155,   153,   153,   155,    66,    66,    66,    66,   155,
     155,   155,   156,   152,   143,   155,   163,    66,   155,   155,
     155,   155,    25,    26,    31,    43,    44,    45,    46,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
     155,   158,   159,    21,   105,   112,   155,   148,   155,   135,
      77,     4,     4,    78,    78,    89,    90,    47,    89,   155,
     155,   155,   155,   155,   155,   155,   155,   155,   155,   155,
     155,   155,   155,   155,   155,   156,    78,    91,   113,    77,
      47,    77,    77,   153,   153,   162,   162,   156,   155,   156,
      90,   155,   159,   142,   155,   121,    90,    90,    66,    77,
      19,    41,    50,   122,   123,   148,    77,    77,   142,    66
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
#line 377 "imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 46:
#line 380 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 47:
#line 381 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-7].sr, yyvsp[-1].sr); }
    break;

  case 48:
#line 384 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 49:
#line 385 "imcc.y"
    { is_def=1; }
    break;

  case 50:
#line 385 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 51:
#line 388 "imcc.y"
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

  case 52:
#line 401 "imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 404 "imcc.y"
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

  case 54:
#line 418 "imcc.y"
    { yyval.i = 0; }
    break;

  case 55:
#line 421 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 56:
#line 422 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 57:
#line 423 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 58:
#line 426 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 61:
#line 433 "imcc.y"
    { clear_state(); }
    break;

  case 62:
#line 434 "imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 63:
#line 435 "imcc.y"
    { yyval.i = 0; }
    break;

  case 64:
#line 436 "imcc.y"
    { yyval.i = 0; }
    break;

  case 67:
#line 439 "imcc.y"
    { yyval.i = 0; }
    break;

  case 68:
#line 440 "imcc.y"
    { yyval.i = 0; }
    break;

  case 69:
#line 443 "imcc.y"
    { yyval.i = NULL; }
    break;

  case 73:
#line 451 "imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 74:
#line 455 "imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 77:
#line 460 "imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 78:
#line 461 "imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 79:
#line 462 "imcc.y"
    { is_def=1; }
    break;

  case 80:
#line 462 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 81:
#line 463 "imcc.y"
    { is_def=1; }
    break;

  case 82:
#line 464 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 83:
#line 465 "imcc.y"
    { is_def=1; }
    break;

  case 84:
#line 466 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 85:
#line 467 "imcc.y"
    { is_def=1; }
    break;

  case 86:
#line 467 "imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 87:
#line 469 "imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 88:
#line 470 "imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 89:
#line 471 "imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 90:
#line 472 "imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 91:
#line 473 "imcc.y"
    { yyval.i = MK_I(interp, "bsr",  1, yyvsp[0].sr); }
    break;

  case 92:
#line 474 "imcc.y"
    { yyval.i = MK_I(interp, "branch",1, yyvsp[0].sr); }
    break;

  case 93:
#line 475 "imcc.y"
    { yyval.i = MK_I(interp, "inc",1, yyvsp[0].sr); }
    break;

  case 94:
#line 476 "imcc.y"
    { yyval.i = MK_I(interp, "dec",1, yyvsp[0].sr); }
    break;

  case 95:
#line 477 "imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,0); }
    break;

  case 96:
#line 478 "imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,0); }
    break;

  case 97:
#line 479 "imcc.y"
    { yyval.i = MK_I(interp, "end" ,0); }
    break;

  case 98:
#line 480 "imcc.y"
    { yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 99:
#line 482 "imcc.y"
    { yyval.i = 0;}
    break;

  case 100:
#line 486 "imcc.y"
    { yyval.t = 'I'; }
    break;

  case 101:
#line 487 "imcc.y"
    { yyval.t = 'N'; }
    break;

  case 102:
#line 488 "imcc.y"
    { yyval.t = 'S'; }
    break;

  case 103:
#line 489 "imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 105:
#line 497 "imcc.y"
    { yyval.i = MK_I(interp, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 106:
#line 498 "imcc.y"
    { yyval.i = MK_I(interp, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 107:
#line 499 "imcc.y"
    { yyval.i = MK_I(interp, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 108:
#line 500 "imcc.y"
    { yyval.i = MK_I(interp, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 109:
#line 501 "imcc.y"
    { yyval.i = MK_I(interp, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 110:
#line 502 "imcc.y"
    { yyval.i = MK_I(interp, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 111:
#line 503 "imcc.y"
    { yyval.i = MK_I(interp, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 112:
#line 504 "imcc.y"
    { yyval.i = MK_I(interp, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 113:
#line 505 "imcc.y"
    { yyval.i = MK_I(interp, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 114:
#line 506 "imcc.y"
    { yyval.i = MK_I(interp, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 115:
#line 507 "imcc.y"
    { yyval.i = MK_I(interp, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 116:
#line 508 "imcc.y"
    { yyval.i = MK_I(interp, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 117:
#line 509 "imcc.y"
    { yyval.i = MK_I(interp, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 118:
#line 510 "imcc.y"
    { yyval.i = MK_I(interp, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 119:
#line 511 "imcc.y"
    { yyval.i = MK_I(interp, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 120:
#line 512 "imcc.y"
    { yyval.i = MK_I(interp, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 121:
#line 513 "imcc.y"
    { yyval.i = MK_I(interp, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 122:
#line 514 "imcc.y"
    { yyval.i = MK_I(interp, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 123:
#line 515 "imcc.y"
    { yyval.i = MK_I(interp, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 124:
#line 516 "imcc.y"
    { yyval.i = MK_I(interp, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 125:
#line 517 "imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 126:
#line 518 "imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 127:
#line 519 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 128:
#line 520 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL,1); }
    break;

  case 129:
#line 521 "imcc.y"
    { yyval.i = MK_I(interp, "defined",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 130:
#line 522 "imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 131:
#line 524 "imcc.y"
    { yyval.i = MK_I(interp, "clone",2, yyvsp[-3].sr, yyvsp[0].sr);
    }
    break;

  case 132:
#line 526 "imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          2, yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once)); }
    break;

  case 133:
#line 528 "imcc.y"
    { yyval.i = MK_I(interp, "find_global",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 134:
#line 529 "imcc.y"
    { yyval.i = MK_I(interp, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 135:
#line 530 "imcc.y"
    { expect_pasm = 1; }
    break;

  case 136:
#line 531 "imcc.y"
    { yyval.i = INS(interp, "new",0,regs,nargs,keyvec,1); }
    break;

  case 137:
#line 532 "imcc.y"
    { yyval.i = MK_I(interp, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 138:
#line 533 "imcc.y"
    { keyvec=KEY_BIT(2);
                                  yyval.i = MK_I(interp, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 139:
#line 535 "imcc.y"
    { yyval.i = MK_I(interp, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 140:
#line 539 "imcc.y"
    {yyval.i=MK_I(interp, yyvsp[-3].s,3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 141:
#line 540 "imcc.y"
    {yyval.i=MK_I(interp, inv_op(yyvsp[-3].s),
                                            3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 142:
#line 542 "imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 143:
#line 543 "imcc.y"
    {yyval.i= MK_I(interp, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 144:
#line 544 "imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 145:
#line 545 "imcc.y"
    {yyval.i= MK_I(interp, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 146:
#line 550 "imcc.y"
    { yyval.s = "eq"; }
    break;

  case 147:
#line 551 "imcc.y"
    { yyval.s = "ne"; }
    break;

  case 148:
#line 552 "imcc.y"
    { yyval.s = "gt"; }
    break;

  case 149:
#line 553 "imcc.y"
    { yyval.s = "ge"; }
    break;

  case 150:
#line 554 "imcc.y"
    { yyval.s = "lt"; }
    break;

  case 151:
#line 555 "imcc.y"
    { yyval.s = "le"; }
    break;

  case 156:
#line 566 "imcc.y"
    { yyval.sr = NULL; }
    break;

  case 157:
#line 567 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 158:
#line 570 "imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 160:
#line 574 "imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 161:
#line 575 "imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 162:
#line 580 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 163:
#line 581 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 168:
#line 592 "imcc.y"
    { nkeys=0; }
    break;

  case 169:
#line 593 "imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 170:
#line 596 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 171:
#line 597 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 175:
#line 607 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 176:
#line 608 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 177:
#line 609 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 178:
#line 610 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 179:
#line 611 "imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 180:
#line 614 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 181:
#line 615 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 182:
#line 616 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 183:
#line 619 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 184:
#line 620 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2429 "imcparser.c"

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


#line 624 "imcc.y"



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

