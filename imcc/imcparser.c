/* A Bison parser, made from languages/imcc/imcc.y, by GNU bison 1.75.  */

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
     SUB = 270,
     NAMESPACE = 271,
     ENDNAMESPACE = 272,
     CLASS = 273,
     ENDCLASS = 274,
     SYM = 275,
     LOCAL = 276,
     CONST = 277,
     INC = 278,
     DEC = 279,
     GLOBAL_CONST = 280,
     SHIFT_LEFT = 281,
     SHIFT_RIGHT = 282,
     INTV = 283,
     FLOATV = 284,
     STRINGV = 285,
     DEFINED = 286,
     LOG_XOR = 287,
     RELOP_EQ = 288,
     RELOP_NE = 289,
     RELOP_GT = 290,
     RELOP_GTE = 291,
     RELOP_LT = 292,
     RELOP_LTE = 293,
     GLOBAL = 294,
     ADDR = 295,
     CLONE = 296,
     RESULT = 297,
     RETURN = 298,
     POW = 299,
     SHIFT_RIGHT_U = 300,
     LOG_AND = 301,
     LOG_OR = 302,
     COMMA = 303,
     ESUB = 304,
     PCC_BEGIN = 305,
     PCC_END = 306,
     PCC_CALL = 307,
     PCC_SUB = 308,
     PCC_BEGIN_RETURN = 309,
     PCC_END_RETURN = 310,
     PCC_BEGIN_YIELD = 311,
     PCC_END_YIELD = 312,
     NCI_CALL = 313,
     PROTOTYPED = 314,
     NON_PROTOTYPED = 315,
     LABEL = 316,
     EMIT = 317,
     EOM = 318,
     IREG = 319,
     NREG = 320,
     SREG = 321,
     PREG = 322,
     IDENTIFIER = 323,
     STRINGC = 324,
     INTC = 325,
     FLOATC = 326,
     REG = 327,
     MACRO = 328,
     ENDM = 329,
     PARROT_OP = 330,
     VAR = 331,
     LINECOMMENT = 332,
     FILECOMMENT = 333
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
#define SUB 270
#define NAMESPACE 271
#define ENDNAMESPACE 272
#define CLASS 273
#define ENDCLASS 274
#define SYM 275
#define LOCAL 276
#define CONST 277
#define INC 278
#define DEC 279
#define GLOBAL_CONST 280
#define SHIFT_LEFT 281
#define SHIFT_RIGHT 282
#define INTV 283
#define FLOATV 284
#define STRINGV 285
#define DEFINED 286
#define LOG_XOR 287
#define RELOP_EQ 288
#define RELOP_NE 289
#define RELOP_GT 290
#define RELOP_GTE 291
#define RELOP_LT 292
#define RELOP_LTE 293
#define GLOBAL 294
#define ADDR 295
#define CLONE 296
#define RESULT 297
#define RETURN 298
#define POW 299
#define SHIFT_RIGHT_U 300
#define LOG_AND 301
#define LOG_OR 302
#define COMMA 303
#define ESUB 304
#define PCC_BEGIN 305
#define PCC_END 306
#define PCC_CALL 307
#define PCC_SUB 308
#define PCC_BEGIN_RETURN 309
#define PCC_END_RETURN 310
#define PCC_BEGIN_YIELD 311
#define PCC_END_YIELD 312
#define NCI_CALL 313
#define PROTOTYPED 314
#define NON_PROTOTYPED 315
#define LABEL 316
#define EMIT 317
#define EOM 318
#define IREG 319
#define NREG 320
#define SREG 321
#define PREG 322
#define IDENTIFIER 323
#define STRINGC 324
#define INTC 325
#define FLOATC 326
#define REG 327
#define MACRO 328
#define ENDM 329
#define PARROT_OP 330
#define VAR 331
#define LINECOMMENT 332
#define FILECOMMENT 333




/* Copy the first part of user declarations.  */
#line 1 "languages/imcc/imcc.y"

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
#line 191 "languages/imcc/imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 193 of /usr/share/bison/yacc.c.  */
#line 426 "languages/imcc/imcparser.c"
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
#line 447 "languages/imcc/imcparser.c"

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
#define YYLAST   364

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  94
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  73
/* YYNRULES -- Number of rules. */
#define YYNRULES  189
/* YYNRULES -- Number of states. */
#define YYNSTATES  327

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   333

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    81,     2,     2,     2,    87,    89,     2,
       2,     2,    85,    84,     2,    82,    88,    86,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    93,
       2,    80,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    91,     2,    92,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    90,     2,    83,     2,     2,     2,
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
      76,    77,    78,    79
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     4,     7,     9,    11,    13,    16,    18,
      20,    23,    25,    28,    32,    35,    37,    39,    40,    44,
      47,    48,    50,    51,    56,    59,    62,    63,    68,    69,
      70,    79,    80,    82,    86,    87,    92,    93,   104,   105,
     108,   110,   112,   113,   115,   121,   125,   129,   130,   134,
     137,   140,   141,   145,   148,   149,   154,   155,   162,   163,
     170,   171,   174,   178,   181,   183,   186,   187,   190,   193,
     195,   197,   199,   201,   203,   204,   206,   209,   211,   213,
     217,   219,   221,   224,   227,   228,   233,   234,   241,   242,
     249,   250,   255,   258,   261,   264,   267,   270,   273,   276,
     279,   281,   283,   285,   288,   289,   291,   293,   295,   297,
     299,   303,   308,   313,   318,   324,   330,   336,   342,   348,
     354,   360,   366,   372,   378,   384,   390,   396,   402,   408,
     414,   421,   428,   435,   440,   445,   453,   458,   463,   468,
     473,   474,   478,   483,   491,   496,   503,   510,   515,   520,
     525,   530,   532,   534,   536,   538,   540,   542,   544,   546,
     548,   550,   551,   553,   557,   559,   561,   566,   568,   570,
     572,   574,   576,   578,   579,   582,   584,   588,   590,   592,
     594,   596,   598,   600,   602,   604,   606,   608,   610,   612
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
      95,     0,    -1,    -1,    96,    98,    -1,   106,    -1,   110,
      -1,   104,    -1,    74,     4,    -1,     4,    -1,    97,    -1,
      98,    97,    -1,   100,    -1,    99,   100,    -1,   136,   101,
       4,    -1,    74,     4,    -1,    79,    -1,    78,    -1,    -1,
     102,    76,   103,    -1,    54,    62,    -1,    -1,   153,    -1,
      -1,    63,   105,    99,    64,    -1,   108,   107,    -1,   133,
      50,    -1,    -1,    16,   109,    69,     4,    -1,    -1,    -1,
      54,   111,    69,   120,     4,   112,   113,   107,    -1,    -1,
       4,    -1,   113,   114,     4,    -1,    -1,     5,   115,   145,
      69,    -1,    -1,    51,   119,     4,   117,   122,   121,   118,
     124,    52,     4,    -1,    -1,   138,     4,    -1,    60,    -1,
      61,    -1,    -1,   119,    -1,    53,   158,    49,   158,     4,
      -1,    53,   158,     4,    -1,    59,   158,     4,    -1,    -1,
     122,   123,     4,    -1,     8,   158,    -1,     9,   151,    -1,
      -1,   124,   125,     4,    -1,    43,   151,    -1,    -1,    22,
     126,   145,    69,    -1,    -1,    55,     4,   128,   131,    56,
       4,    -1,    -1,    57,     4,   130,   131,    58,     4,    -1,
      -1,   131,     4,    -1,   131,   132,     4,    -1,    44,   158,
      -1,   135,    -1,   133,   135,    -1,    -1,   134,   139,    -1,
      74,     4,    -1,   116,    -1,   127,    -1,   129,    -1,    79,
      -1,    78,    -1,    -1,   137,    -1,   137,   138,    -1,   138,
      -1,    62,    -1,   136,   140,     4,    -1,   147,    -1,   149,
      -1,    17,    69,    -1,    18,    69,    -1,    -1,    22,   141,
     145,    69,    -1,    -1,    23,   142,   145,    69,    80,   165,
      -1,    -1,    26,   143,   145,    69,    80,   165,    -1,    -1,
       5,   144,   145,    69,    -1,     5,   164,    -1,    43,   158,
      -1,     8,   158,    -1,    44,   158,    -1,     6,   156,    -1,
       7,   156,    -1,    24,   158,    -1,    25,   158,    -1,    14,
      -1,    15,    -1,    13,    -1,    76,   153,    -1,    -1,    29,
      -1,    30,    -1,    31,    -1,   146,    -1,    69,    -1,   151,
      80,   158,    -1,   151,    80,    81,   158,    -1,   151,    80,
      82,   158,    -1,   151,    80,    83,   158,    -1,   151,    80,
     158,    84,   158,    -1,   151,    80,   158,    82,   158,    -1,
     151,    80,   158,    85,   158,    -1,   151,    80,   158,    45,
     158,    -1,   151,    80,   158,    86,   158,    -1,   151,    80,
     158,    87,   158,    -1,   151,    80,   158,    88,   158,    -1,
     151,    80,   158,    27,   158,    -1,   151,    80,   158,    28,
     158,    -1,   151,    80,   158,    46,   158,    -1,   151,    80,
     158,    47,   158,    -1,   151,    80,   158,    48,   158,    -1,
     151,    80,   158,    33,   158,    -1,   151,    80,   158,    89,
     158,    -1,   151,    80,   158,    90,   158,    -1,   151,    80,
     158,    83,   158,    -1,   151,    80,   158,    91,   159,    92,
      -1,   158,    91,   159,    92,    80,   158,    -1,   151,    80,
      12,   146,    49,   158,    -1,   151,    80,    12,   146,    -1,
     151,    80,    32,   158,    -1,   151,    80,    32,   158,    91,
     159,    92,    -1,   151,    80,    42,   158,    -1,   151,    80,
      41,    69,    -1,   151,    80,    40,   166,    -1,    40,   166,
      80,   158,    -1,    -1,    12,   148,   103,    -1,    32,   151,
      49,   158,    -1,    32,   151,    49,   158,    91,   159,    92,
      -1,    42,   151,    49,   158,    -1,    10,   158,   150,   158,
       7,   156,    -1,    11,   158,   150,   158,     7,   156,    -1,
      10,   158,     7,   156,    -1,    11,   158,     7,   156,    -1,
      10,   158,    49,   156,    -1,    11,   158,    49,   156,    -1,
      34,    -1,    35,    -1,    36,    -1,    37,    -1,    38,    -1,
      39,    -1,    77,    -1,   164,    -1,    77,    -1,   164,    -1,
      -1,   154,    -1,   154,    49,   155,    -1,   155,    -1,   157,
      -1,   152,    91,   159,    92,    -1,    69,    -1,    76,    -1,
     156,    -1,   158,    -1,    77,    -1,   163,    -1,    -1,   160,
     161,    -1,   162,    -1,   161,    93,   162,    -1,   158,    -1,
     164,    -1,   165,    -1,    65,    -1,    66,    -1,    67,    -1,
      68,    -1,    73,    -1,    71,    -1,    72,    -1,    70,    -1,
      67,    -1,    70,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   242,   242,   242,   246,   247,   248,   249,   250,   253,
     254,   258,   259,   262,   263,   264,   265,   268,   268,   271,
     277,   279,   284,   283,   292,   296,   305,   305,   311,   313,
     311,   323,   324,   325,   328,   328,   332,   332,   361,   362,
     365,   366,   369,   370,   373,   377,   380,   386,   387,   390,
     391,   394,   395,   398,   399,   399,   402,   402,   418,   418,
     435,   436,   437,   440,   443,   444,   454,   457,   459,   460,
     461,   462,   463,   464,   467,   468,   471,   472,   475,   478,
     481,   483,   484,   485,   486,   486,   487,   487,   489,   489,
     491,   491,   493,   494,   495,   496,   497,   498,   499,   500,
     501,   502,   503,   504,   506,   509,   511,   512,   513,   516,
     520,   522,   523,   524,   525,   526,   527,   528,   529,   530,
     531,   532,   533,   534,   535,   536,   537,   538,   539,   540,
     541,   542,   543,   544,   545,   546,   548,   550,   552,   553,
     554,   554,   556,   557,   559,   562,   564,   566,   567,   568,
     569,   573,   575,   576,   577,   578,   579,   583,   584,   586,
     587,   590,   591,   594,   595,   598,   599,   603,   605,   607,
     609,   612,   613,   616,   616,   620,   621,   624,   627,   628,
     631,   632,   633,   634,   635,   638,   639,   640,   643,   644
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "CALL", 
  "GOTO", "ARG", "FLATTEN_ARG", "IF", "UNLESS", "NEW", "END", "SAVEALL", 
  "RESTOREALL", "SUB", "NAMESPACE", "ENDNAMESPACE", "CLASS", "ENDCLASS", 
  "SYM", "LOCAL", "CONST", "INC", "DEC", "GLOBAL_CONST", "SHIFT_LEFT", 
  "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "DEFINED", "LOG_XOR", 
  "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", 
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
  "pasm_args", "emit", "@3", "sub", "sub_body", "sub_start", "@4", 
  "pcc_sub", "@5", "@6", "pcc_params", "pcc_param", "@7", "pcc_sub_call", 
  "@8", "opt_label", "pcc_proto", "pcc_sub_proto", "pcc_call", "pcc_args", 
  "pcc_arg", "pcc_results", "pcc_result", "@9", "pcc_ret", "@10", 
  "pcc_yield", "@11", "pcc_returns", "pcc_return", "statements", 
  "helper_clear_state", "statement", "labels", "_labels", "label", 
  "instruction", "labeled_inst", "@12", "@13", "@14", "@15", "type", 
  "classname", "assignment", "@16", "if_statement", "relop", "target", 
  "lhs", "vars", "_vars", "_var_or_i", "label_op", "var_or_i", "var", 
  "keylist", "@17", "_keylist", "key", "rc", "reg", "const", "string", 0
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
      61,    33,    45,   126,    43,    42,    47,    37,    46,    38,
     124,    91,    93,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    94,    96,    95,    97,    97,    97,    97,    97,    98,
      98,    99,    99,   100,   100,   100,   100,   102,   101,   101,
     101,   103,   105,   104,   106,   107,   109,   108,   111,   112,
     110,   113,   113,   113,   115,   114,   117,   116,   118,   118,
     119,   119,   120,   120,   121,   121,   121,   122,   122,   123,
     123,   124,   124,   125,   126,   125,   128,   127,   130,   129,
     131,   131,   131,   132,   133,   133,   134,   135,   135,   135,
     135,   135,   135,   135,   136,   136,   137,   137,   138,   139,
     140,   140,   140,   140,   141,   140,   142,   140,   143,   140,
     144,   140,   140,   140,   140,   140,   140,   140,   140,   140,
     140,   140,   140,   140,   140,   145,   145,   145,   145,   146,
     147,   147,   147,   147,   147,   147,   147,   147,   147,   147,
     147,   147,   147,   147,   147,   147,   147,   147,   147,   147,
     147,   147,   147,   147,   147,   147,   147,   147,   147,   147,
     148,   147,   147,   147,   147,   149,   149,   149,   149,   149,
     149,   150,   150,   150,   150,   150,   150,   151,   151,   152,
     152,   153,   153,   154,   154,   155,   155,   156,   156,   157,
     157,   158,   158,   160,   159,   161,   161,   162,   163,   163,
     164,   164,   164,   164,   164,   165,   165,   165,   166,   166
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     2,     1,     1,     1,     2,     1,     1,
       2,     1,     2,     3,     2,     1,     1,     0,     3,     2,
       0,     1,     0,     4,     2,     2,     0,     4,     0,     0,
       8,     0,     1,     3,     0,     4,     0,    10,     0,     2,
       1,     1,     0,     1,     5,     3,     3,     0,     3,     2,
       2,     0,     3,     2,     0,     4,     0,     6,     0,     6,
       0,     2,     3,     2,     1,     2,     0,     2,     2,     1,
       1,     1,     1,     1,     0,     1,     2,     1,     1,     3,
       1,     1,     2,     2,     0,     4,     0,     6,     0,     6,
       0,     4,     2,     2,     2,     2,     2,     2,     2,     2,
       1,     1,     1,     2,     0,     1,     1,     1,     1,     1,
       3,     4,     4,     4,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       6,     6,     6,     4,     4,     7,     4,     4,     4,     4,
       0,     3,     4,     7,     4,     6,     6,     4,     4,     4,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     0,     1,     3,     1,     1,     4,     1,     1,     1,
       1,     1,     1,     0,     2,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,     0,     1,     8,    26,    28,    22,     0,     9,
       3,     6,     4,    66,     5,     0,     0,    74,     7,    10,
       0,     0,     0,     0,    73,    72,    24,    69,    70,    71,
      66,    74,    64,     0,    42,    78,     0,    16,    15,    74,
      11,    17,    75,    77,    40,    41,     0,    56,    58,    68,
      25,    65,   104,    67,    27,    43,     0,    14,    23,    12,
       0,     0,     0,    76,    36,    60,    60,    90,     0,     0,
       0,     0,     0,   140,   102,   100,   101,     0,     0,    84,
      86,     0,     0,    88,     0,     0,     0,     0,     0,   180,
     181,   182,   183,   187,   185,   186,   184,   161,   157,     0,
      80,    81,     0,     0,   172,   158,   179,    29,    19,    13,
     161,    47,     0,     0,     0,    92,   167,   168,    96,    97,
     171,    94,   178,     0,     0,   161,    82,    83,     0,     0,
      98,    99,     0,   157,     0,   158,   188,   189,     0,     0,
      93,    95,   171,     0,   103,   162,   164,   169,   165,   170,
     178,    79,     0,   173,    31,    18,    21,     0,    61,     0,
       0,     0,     0,   105,   106,   107,   109,     0,   108,     0,
     151,   152,   153,   154,   155,   156,     0,     0,     0,     0,
       0,   141,     0,     0,     0,     0,     0,     0,   173,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   110,     0,
       0,    32,    66,     0,     0,     0,     0,    38,     0,    63,
      57,    62,    59,    91,   147,   149,     0,   148,   150,     0,
      85,     0,     0,   142,   139,   144,     0,   163,   133,   134,
     138,   137,   136,   111,   112,   113,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   173,     0,   177,   174,   175,    34,    30,     0,
      49,    50,     0,     0,    51,     0,    48,     0,     0,     0,
       0,   173,   166,     0,   173,   121,   122,   126,   117,   123,
     124,   125,   115,   129,   114,   116,   118,   119,   120,   127,
     128,     0,     0,     0,     0,    33,    45,     0,    46,     0,
      39,   145,   146,    87,    89,     0,   132,     0,   130,   131,
     176,     0,     0,    54,     0,     0,     0,   143,   135,    35,
      44,     0,    53,    37,    52,     0,    55
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,     9,    10,    39,    40,    61,    62,   155,
      11,    17,    12,    26,    13,    15,    14,    16,   154,   202,
     259,   294,    27,   111,   264,    46,    56,   207,   157,   208,
     299,   316,   321,    28,    65,    29,    66,   112,   161,    30,
      31,    32,    41,    42,    43,    53,    99,   128,   129,   132,
     114,   167,   168,   100,   125,   101,   177,   102,   143,   156,
     145,   146,   147,   148,   149,   199,   200,   255,   256,   104,
     122,   106,   138
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -185
static const short yypact[] =
{
    -185,    19,     6,  -185,  -185,  -185,  -185,  -185,     9,  -185,
       6,  -185,  -185,    31,  -185,   -25,   -19,    -8,  -185,  -185,
      16,    49,    52,    85,  -185,  -185,  -185,  -185,  -185,  -185,
     171,    29,  -185,    94,    16,  -185,   112,  -185,  -185,   -41,
    -185,     7,    29,  -185,  -185,  -185,   115,  -185,  -185,  -185,
    -185,  -185,   253,  -185,  -185,  -185,   116,  -185,  -185,  -185,
      60,   119,   -14,  -185,  -185,  -185,  -185,    97,   -29,   -29,
     287,   287,   287,  -185,  -185,  -185,  -185,    61,    64,  -185,
    -185,   287,   287,  -185,    59,   -24,    59,   287,   287,  -185,
    -185,  -185,  -185,  -185,  -185,  -185,  -185,   167,    37,   125,
    -185,  -185,    55,    47,  -185,    51,  -185,  -185,  -185,  -185,
     167,  -185,     8,     5,    -2,  -185,  -185,  -185,  -185,  -185,
    -185,  -185,  -185,    58,    65,   167,  -185,  -185,    -2,    -2,
    -185,  -185,    -2,  -185,    95,  -185,  -185,  -185,    63,    98,
    -185,  -185,    62,    67,  -185,   117,  -185,  -185,  -185,  -185,
      77,  -185,   268,  -185,   142,  -185,  -185,    22,  -185,   287,
     165,   168,   173,  -185,  -185,  -185,  -185,   102,  -185,   -29,
    -185,  -185,  -185,  -185,  -185,  -185,   -29,   287,   -29,   -29,
     287,  -185,   109,   110,   111,   287,   287,   287,  -185,   167,
     114,   287,   -24,   118,   287,   287,   287,   287,   128,    89,
     287,  -185,     0,   287,    59,   287,   287,    29,   180,  -185,
    -185,  -185,  -185,  -185,  -185,  -185,   178,  -185,  -185,   179,
    -185,   108,   140,   132,  -185,  -185,   133,  -185,   159,   138,
    -185,  -185,  -185,  -185,  -185,  -185,   287,   287,   287,   287,
     287,   287,   287,   287,   287,   287,   287,   287,   287,   287,
     287,   287,  -185,   144,  -185,    96,  -185,  -185,  -185,   226,
    -185,  -185,    10,   237,  -185,   238,  -185,   -29,   -29,    13,
      13,  -185,  -185,   287,  -185,  -185,  -185,  -185,  -185,  -185,
    -185,  -185,  -185,  -185,  -185,  -185,  -185,  -185,  -185,  -185,
    -185,   156,   287,   287,    -2,  -185,  -185,   287,  -185,    -4,
    -185,  -185,  -185,  -185,  -185,   160,  -185,   161,  -185,  -185,
    -185,   185,   251,  -185,    59,   252,   265,  -185,  -185,  -185,
    -185,    -2,  -185,  -185,  -185,   188,  -185
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -185,  -185,  -185,   262,  -185,  -185,   234,  -185,  -185,   149,
    -185,  -185,  -185,    79,  -185,  -185,  -185,  -185,  -185,  -185,
    -185,  -185,  -185,  -185,  -185,   248,  -185,  -185,  -185,  -185,
    -185,  -185,  -185,  -185,  -185,  -185,  -185,   217,  -185,  -185,
    -185,   254,   255,  -185,   -40,  -185,  -185,  -185,  -185,  -185,
    -185,  -112,    99,  -185,  -185,  -185,   163,   -83,  -185,   191,
    -185,   101,   -61,  -185,   -46,  -184,  -185,  -185,    -1,  -185,
     -52,  -158,   106
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -179
static const short yytable[] =
{
     105,   134,    63,   139,   226,   257,   103,   118,   119,   158,
       4,   -20,   158,    18,   296,   115,   182,   183,   313,     3,
     184,    35,     5,    58,   121,   123,   124,   163,   164,   165,
     203,   204,   135,    36,   135,   130,   131,    37,    38,   314,
     116,   140,   141,   136,    33,   150,   137,   117,   315,   159,
      34,    20,   159,    47,    35,    21,    48,    22,   150,   297,
       6,    60,   110,   162,   160,   169,    36,   166,   291,     7,
      37,    38,   178,   150,    23,   205,    44,    45,    24,    25,
       8,   206,    20,    93,    94,    95,    21,   305,    22,    49,
     307,    35,   170,   171,   172,   173,   174,   175,    54,   170,
     171,   172,   173,   174,   175,    23,   198,   176,   214,    24,
      25,   303,   304,   209,   179,   215,    57,   217,   218,    64,
     107,   261,   108,   109,    89,    90,    91,    92,  -171,   151,
     126,   216,    96,   127,   219,   152,   133,   150,   153,   223,
     224,   225,  -178,   186,   185,   229,   201,   187,   232,   233,
     234,   235,   135,  -159,   254,   236,   237,   260,   188,   262,
     263,   238,    89,    90,    91,    92,   189,   265,  -160,   210,
      96,   213,   211,   239,   240,   241,   242,   212,   220,   221,
     222,   253,   311,   166,   266,   267,   268,   231,   269,   293,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   301,   302,   273,   325,
     243,   244,   245,   246,   247,   248,   249,   250,   251,   252,
     270,    50,    20,   271,   292,   272,    21,   306,    22,   274,
     295,   322,    89,    90,    91,    92,   116,    93,    94,    95,
      96,   298,   300,   117,   142,    23,   309,   254,   308,    24,
      25,   312,   317,   318,   319,   320,   323,   326,    67,    68,
      69,    70,   135,    71,    72,    73,    74,    75,    76,   324,
      77,    78,    19,    59,   181,    79,    80,    81,    82,    83,
     190,   258,    55,   113,    51,    84,    52,   180,   144,   228,
     227,     0,   310,    85,     0,    86,    87,    88,   230,     0,
     191,     0,     0,     0,     0,     0,     0,     0,   192,   193,
     194,     0,     0,     0,     0,     0,     0,     0,    89,    90,
      91,    92,     0,    93,    94,    95,    96,     0,     0,    97,
      98,     0,     0,    89,    90,    91,    92,     0,    93,    94,
      95,    96,     0,     0,     0,   120,     0,     0,     0,   195,
     196,   197,    89,    90,    91,    92,     0,    93,    94,    95,
      96,     0,     0,     0,   120
};

static const short yycheck[] =
{
      52,    84,    42,    86,   188,     5,    52,    68,    69,     4,
       4,     4,     4,     4,     4,    67,   128,   129,    22,     0,
     132,    62,    16,    64,    70,    71,    72,    29,    30,    31,
       8,     9,    84,    74,    86,    81,    82,    78,    79,    43,
      69,    87,    88,    67,    69,    97,    70,    76,    52,    44,
      69,    51,    44,     4,    62,    55,     4,    57,   110,    49,
      54,    54,    76,    58,    56,     7,    74,    69,   252,    63,
      78,    79,     7,   125,    74,    53,    60,    61,    78,    79,
      74,    59,    51,    70,    71,    72,    55,   271,    57,     4,
     274,    62,    34,    35,    36,    37,    38,    39,     4,    34,
      35,    36,    37,    38,    39,    74,   152,    49,   169,    78,
      79,   269,   270,   159,    49,   176,     4,   178,   179,     4,
       4,   204,    62,     4,    65,    66,    67,    68,    91,     4,
      69,   177,    73,    69,   180,    80,    77,   189,    91,   185,
     186,   187,    91,    80,    49,   191,     4,    49,   194,   195,
     196,   197,   204,    91,   200,    27,    28,   203,    91,   205,
     206,    33,    65,    66,    67,    68,    49,   207,    91,     4,
      73,    69,     4,    45,    46,    47,    48,     4,    69,    69,
      69,    92,   294,    69,     4,     7,     7,    69,    80,    93,
     236,   237,   238,   239,   240,   241,   242,   243,   244,   245,
     246,   247,   248,   249,   250,   251,   267,   268,    49,   321,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      80,    50,    51,    91,    80,    92,    55,   273,    57,    91,
       4,   314,    65,    66,    67,    68,    69,    70,    71,    72,
      73,     4,     4,    76,    77,    74,   292,   293,    92,    78,
      79,   297,    92,    92,    69,     4,     4,    69,     5,     6,
       7,     8,   314,    10,    11,    12,    13,    14,    15,     4,
      17,    18,    10,    39,   125,    22,    23,    24,    25,    26,
      12,   202,    34,    66,    30,    32,    31,   124,    97,   190,
     189,    -1,   293,    40,    -1,    42,    43,    44,   192,    -1,
      32,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    40,    41,
      42,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      67,    68,    -1,    70,    71,    72,    73,    -1,    -1,    76,
      77,    -1,    -1,    65,    66,    67,    68,    -1,    70,    71,
      72,    73,    -1,    -1,    -1,    77,    -1,    -1,    -1,    81,
      82,    83,    65,    66,    67,    68,    -1,    70,    71,    72,
      73,    -1,    -1,    -1,    77
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    95,    96,     0,     4,    16,    54,    63,    74,    97,
      98,   104,   106,   108,   110,   109,   111,   105,     4,    97,
      51,    55,    57,    74,    78,    79,   107,   116,   127,   129,
     133,   134,   135,    69,    69,    62,    74,    78,    79,    99,
     100,   136,   137,   138,    60,    61,   119,     4,     4,     4,
      50,   135,   136,   139,     4,   119,   120,     4,    64,   100,
      54,   101,   102,   138,     4,   128,   130,     5,     6,     7,
       8,    10,    11,    12,    13,    14,    15,    17,    18,    22,
      23,    24,    25,    26,    32,    40,    42,    43,    44,    65,
      66,    67,    68,    70,    71,    72,    73,    76,    77,   140,
     147,   149,   151,   158,   163,   164,   165,     4,    62,     4,
      76,   117,   131,   131,   144,   164,    69,    76,   156,   156,
      77,   158,   164,   158,   158,   148,    69,    69,   141,   142,
     158,   158,   143,    77,   151,   164,    67,    70,   166,   151,
     158,   158,    77,   152,   153,   154,   155,   156,   157,   158,
     164,     4,    80,    91,   112,   103,   153,   122,     4,    44,
      56,   132,    58,    29,    30,    31,    69,   145,   146,     7,
      34,    35,    36,    37,    38,    39,    49,   150,     7,    49,
     150,   103,   145,   145,   145,    49,    80,    49,    91,    49,
      12,    32,    40,    41,    42,    81,    82,    83,   158,   159,
     160,     4,   113,     8,     9,    53,    59,   121,   123,   158,
       4,     4,     4,    69,   156,   156,   158,   156,   156,   158,
      69,    69,    69,   158,   158,   158,   159,   155,   146,   158,
     166,    69,   158,   158,   158,   158,    27,    28,    33,    45,
      46,    47,    48,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,   158,   161,   162,     5,   107,   114,
     158,   151,   158,   158,   118,   138,     4,     7,     7,    80,
      80,    91,    92,    49,    91,   158,   158,   158,   158,   158,
     158,   158,   158,   158,   158,   158,   158,   158,   158,   158,
     158,   159,    80,    93,   115,     4,     4,    49,     4,   124,
       4,   156,   156,   165,   165,   159,   158,   159,    92,   158,
     162,   145,   158,    22,    43,    52,   125,    92,    92,    69,
       4,   126,   151,     4,     4,   145,    69
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
#line 242 "languages/imcc/imcc.y"
    { open_comp_unit(); yyval.i = 0;}
    break;

  case 3:
#line 243 "languages/imcc/imcc.y"
    { close_comp_unit(interp); yyval.i = 0; }
    break;

  case 7:
#line 249 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 8:
#line 250 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 262 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 263 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 264 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 265 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 17:
#line 268 "languages/imcc/imcc.y"
    {clear_state();}
    break;

  case 18:
#line 269 "languages/imcc/imcc.y"
    { yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                                          free(yyvsp[-1].s); }
    break;

  case 19:
#line 271 "languages/imcc/imcc.y"
    {
                                          char *name = str_dup(yyvsp[0].s);
                                          yyval.i = iSUBROUTINE(
                                          mk_address(yyvsp[0].s, U_add_uniq_sub));
                                          yyval.i->r[1] =  mk_pcc_sub(name, 0);
                                        }
    break;

  case 20:
#line 277 "languages/imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 22:
#line 284 "languages/imcc/imcc.y"
    { open_comp_unit();
                                          function = "(emit)"; }
    break;

  case 23:
#line 287 "languages/imcc/imcc.y"
    { if (optimizer_level & OPT_PASM)
                                                allocate(interp);
                                          emit_flush(interp); yyval.i=0;}
    break;

  case 25:
#line 298 "languages/imcc/imcc.y"
    {
          yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 26:
#line 305 "languages/imcc/imcc.y"
    { open_comp_unit(); }
    break;

  case 27:
#line 307 "languages/imcc/imcc.y"
    { yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        }
    break;

  case 28:
#line 311 "languages/imcc/imcc.y"
    { open_comp_unit(); }
    break;

  case 29:
#line 313 "languages/imcc/imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 30:
#line 320 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 31:
#line 323 "languages/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 32:
#line 324 "languages/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 33:
#line 325 "languages/imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 34:
#line 328 "languages/imcc/imcc.y"
    { is_def=1; }
    break;

  case 35:
#line 329 "languages/imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 36:
#line 332 "languages/imcc/imcc.y"
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

  case 37:
#line 358 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 38:
#line 361 "languages/imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-2].sr ->pcc_sub->label = 0; }
    break;

  case 39:
#line 362 "languages/imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-4].sr ->pcc_sub->label = 1; }
    break;

  case 40:
#line 365 "languages/imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 41:
#line 366 "languages/imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 42:
#line 369 "languages/imcc/imcc.y"
    { yyval.t = -1; }
    break;

  case 44:
#line 373 "languages/imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 45:
#line 377 "languages/imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 46:
#line 380 "languages/imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
                  yyvsp[-4].sr ->pcc_sub->nci = 1;
              }
    break;

  case 47:
#line 386 "languages/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 48:
#line 387 "languages/imcc/imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 49:
#line 390 "languages/imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 50:
#line 391 "languages/imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 51:
#line 394 "languages/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 52:
#line 395 "languages/imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 53:
#line 398 "languages/imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 54:
#line 399 "languages/imcc/imcc.y"
    { is_def=1; }
    break;

  case 55:
#line 399 "languages/imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 56:
#line 402 "languages/imcc/imcc.y"
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

  case 57:
#line 415 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 58:
#line 418 "languages/imcc/imcc.y"
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

  case 59:
#line 432 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 60:
#line 435 "languages/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 61:
#line 436 "languages/imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 62:
#line 437 "languages/imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 63:
#line 440 "languages/imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 66:
#line 454 "languages/imcc/imcc.y"
    { clear_state(); }
    break;

  case 67:
#line 458 "languages/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 68:
#line 459 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 69:
#line 460 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 72:
#line 463 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 73:
#line 464 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 74:
#line 467 "languages/imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 78:
#line 475 "languages/imcc/imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 79:
#line 479 "languages/imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 82:
#line 484 "languages/imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 83:
#line 485 "languages/imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 84:
#line 486 "languages/imcc/imcc.y"
    { is_def=1; }
    break;

  case 85:
#line 486 "languages/imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 86:
#line 487 "languages/imcc/imcc.y"
    { is_def=1; }
    break;

  case 87:
#line 488 "languages/imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 88:
#line 489 "languages/imcc/imcc.y"
    { is_def=1; }
    break;

  case 89:
#line 490 "languages/imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 90:
#line 491 "languages/imcc/imcc.y"
    { is_def=1; }
    break;

  case 91:
#line 491 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 92:
#line 493 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 93:
#line 494 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 94:
#line 495 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 95:
#line 496 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 96:
#line 497 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "bsr",  1, yyvsp[0].sr); }
    break;

  case 97:
#line 498 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "branch",1, yyvsp[0].sr); }
    break;

  case 98:
#line 499 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "inc",1, yyvsp[0].sr); }
    break;

  case 99:
#line 500 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "dec",1, yyvsp[0].sr); }
    break;

  case 100:
#line 501 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,0); }
    break;

  case 101:
#line 502 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,0); }
    break;

  case 102:
#line 503 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "end" ,0); }
    break;

  case 103:
#line 504 "languages/imcc/imcc.y"
    { yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 104:
#line 506 "languages/imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 105:
#line 510 "languages/imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 106:
#line 511 "languages/imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 107:
#line 512 "languages/imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 108:
#line 513 "languages/imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 110:
#line 521 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 111:
#line 522 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 112:
#line 523 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 113:
#line 524 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 114:
#line 525 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 115:
#line 526 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 116:
#line 527 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 117:
#line 528 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 118:
#line 529 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 119:
#line 530 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 120:
#line 531 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 121:
#line 532 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 122:
#line 533 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 123:
#line 534 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 124:
#line 535 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 125:
#line 536 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 126:
#line 537 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 127:
#line 538 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 128:
#line 539 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 129:
#line 540 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 130:
#line 541 "languages/imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 131:
#line 542 "languages/imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 132:
#line 543 "languages/imcc/imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 133:
#line 544 "languages/imcc/imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL,1); }
    break;

  case 134:
#line 545 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "defined",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 135:
#line 546 "languages/imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 136:
#line 548 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "clone",2, yyvsp[-3].sr, yyvsp[0].sr);
    }
    break;

  case 137:
#line 550 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          2, yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once)); }
    break;

  case 138:
#line 552 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "find_global",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 139:
#line 553 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 140:
#line 554 "languages/imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 141:
#line 555 "languages/imcc/imcc.y"
    { yyval.i = INS(interp, "new",0,regs,nargs,keyvec,1); }
    break;

  case 142:
#line 556 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 143:
#line 557 "languages/imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                                  yyval.i = MK_I(interp, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 144:
#line 559 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 145:
#line 563 "languages/imcc/imcc.y"
    {yyval.i=MK_I(interp, yyvsp[-3].s,3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 146:
#line 564 "languages/imcc/imcc.y"
    {yyval.i=MK_I(interp, inv_op(yyvsp[-3].s),
                                            3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 147:
#line 566 "languages/imcc/imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 148:
#line 567 "languages/imcc/imcc.y"
    {yyval.i= MK_I(interp, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 149:
#line 568 "languages/imcc/imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 150:
#line 569 "languages/imcc/imcc.y"
    {yyval.i= MK_I(interp, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 151:
#line 574 "languages/imcc/imcc.y"
    { yyval.s = "eq"; }
    break;

  case 152:
#line 575 "languages/imcc/imcc.y"
    { yyval.s = "ne"; }
    break;

  case 153:
#line 576 "languages/imcc/imcc.y"
    { yyval.s = "gt"; }
    break;

  case 154:
#line 577 "languages/imcc/imcc.y"
    { yyval.s = "ge"; }
    break;

  case 155:
#line 578 "languages/imcc/imcc.y"
    { yyval.s = "lt"; }
    break;

  case 156:
#line 579 "languages/imcc/imcc.y"
    { yyval.s = "le"; }
    break;

  case 161:
#line 590 "languages/imcc/imcc.y"
    { yyval.sr = NULL; }
    break;

  case 162:
#line 591 "languages/imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 163:
#line 594 "languages/imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 165:
#line 598 "languages/imcc/imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 166:
#line 599 "languages/imcc/imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 167:
#line 604 "languages/imcc/imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 168:
#line 605 "languages/imcc/imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 173:
#line 616 "languages/imcc/imcc.y"
    { nkeys=0; }
    break;

  case 174:
#line 617 "languages/imcc/imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 175:
#line 620 "languages/imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 176:
#line 621 "languages/imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 180:
#line 631 "languages/imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 181:
#line 632 "languages/imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 182:
#line 633 "languages/imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 183:
#line 634 "languages/imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 184:
#line 635 "languages/imcc/imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 185:
#line 638 "languages/imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 186:
#line 639 "languages/imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 187:
#line 640 "languages/imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 188:
#line 643 "languages/imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 189:
#line 644 "languages/imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2468 "languages/imcc/imcparser.c"

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


#line 648 "languages/imcc/imcc.y"



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

