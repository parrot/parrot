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
#line 191 "imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 193 of /usr/share/bison/yacc.c.  */
#line 426 "imcparser.c"
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
#line 447 "imcparser.c"

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
#define YYNRULES  188
/* YYNRULES -- Number of states. */
#define YYNSTATES  325

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
       0,     0,     3,     4,     7,     9,    11,    13,    15,    17,
      20,    22,    25,    29,    32,    34,    36,    37,    41,    44,
      45,    47,    48,    53,    56,    59,    60,    65,    66,    67,
      76,    77,    79,    83,    84,    89,    90,   101,   102,   105,
     107,   109,   110,   112,   118,   122,   126,   127,   131,   134,
     137,   138,   142,   145,   146,   151,   152,   159,   160,   167,
     168,   171,   175,   178,   180,   183,   184,   187,   190,   192,
     194,   196,   198,   200,   201,   203,   206,   208,   210,   214,
     216,   218,   221,   224,   225,   230,   231,   238,   239,   246,
     247,   252,   255,   258,   261,   264,   267,   270,   273,   276,
     278,   280,   282,   285,   286,   288,   290,   292,   294,   296,
     300,   305,   310,   315,   321,   327,   333,   339,   345,   351,
     357,   363,   369,   375,   381,   387,   393,   399,   405,   411,
     418,   425,   432,   437,   442,   450,   455,   460,   465,   470,
     471,   475,   480,   488,   493,   500,   507,   512,   517,   522,
     527,   529,   531,   533,   535,   537,   539,   541,   543,   545,
     547,   548,   550,   554,   556,   558,   563,   565,   567,   569,
     571,   573,   575,   576,   579,   581,   585,   587,   589,   591,
     593,   595,   597,   599,   601,   603,   605,   607,   609
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
      95,     0,    -1,    -1,    96,    98,    -1,   106,    -1,   110,
      -1,   104,    -1,     4,    -1,    97,    -1,    98,    97,    -1,
     100,    -1,    99,   100,    -1,   136,   101,     4,    -1,    74,
       4,    -1,    79,    -1,    78,    -1,    -1,   102,    76,   103,
      -1,    54,    62,    -1,    -1,   153,    -1,    -1,    63,   105,
      99,    64,    -1,   108,   107,    -1,   133,    50,    -1,    -1,
      16,   109,    69,     4,    -1,    -1,    -1,    54,   111,    69,
     120,     4,   112,   113,   107,    -1,    -1,     4,    -1,   113,
     114,     4,    -1,    -1,     5,   115,   145,    69,    -1,    -1,
      51,   119,     4,   117,   122,   121,   118,   124,    52,     4,
      -1,    -1,   138,     4,    -1,    60,    -1,    61,    -1,    -1,
     119,    -1,    53,   158,    49,   158,     4,    -1,    53,   158,
       4,    -1,    59,   158,     4,    -1,    -1,   122,   123,     4,
      -1,     8,   158,    -1,     9,   151,    -1,    -1,   124,   125,
       4,    -1,    43,   151,    -1,    -1,    22,   126,   145,    69,
      -1,    -1,    55,     4,   128,   131,    56,     4,    -1,    -1,
      57,     4,   130,   131,    58,     4,    -1,    -1,   131,     4,
      -1,   131,   132,     4,    -1,    44,   158,    -1,   135,    -1,
     133,   135,    -1,    -1,   134,   139,    -1,    74,     4,    -1,
     116,    -1,   127,    -1,   129,    -1,    79,    -1,    78,    -1,
      -1,   137,    -1,   137,   138,    -1,   138,    -1,    62,    -1,
     136,   140,     4,    -1,   147,    -1,   149,    -1,    17,    69,
      -1,    18,    69,    -1,    -1,    22,   141,   145,    69,    -1,
      -1,    23,   142,   145,    69,    80,   165,    -1,    -1,    26,
     143,   145,    69,    80,   165,    -1,    -1,     5,   144,   145,
      69,    -1,     5,   164,    -1,    43,   158,    -1,     8,   158,
      -1,    44,   158,    -1,     6,   156,    -1,     7,   156,    -1,
      24,   158,    -1,    25,   158,    -1,    14,    -1,    15,    -1,
      13,    -1,    76,   153,    -1,    -1,    29,    -1,    30,    -1,
      31,    -1,   146,    -1,    69,    -1,   151,    80,   158,    -1,
     151,    80,    81,   158,    -1,   151,    80,    82,   158,    -1,
     151,    80,    83,   158,    -1,   151,    80,   158,    84,   158,
      -1,   151,    80,   158,    82,   158,    -1,   151,    80,   158,
      85,   158,    -1,   151,    80,   158,    45,   158,    -1,   151,
      80,   158,    86,   158,    -1,   151,    80,   158,    87,   158,
      -1,   151,    80,   158,    88,   158,    -1,   151,    80,   158,
      27,   158,    -1,   151,    80,   158,    28,   158,    -1,   151,
      80,   158,    46,   158,    -1,   151,    80,   158,    47,   158,
      -1,   151,    80,   158,    48,   158,    -1,   151,    80,   158,
      33,   158,    -1,   151,    80,   158,    89,   158,    -1,   151,
      80,   158,    90,   158,    -1,   151,    80,   158,    83,   158,
      -1,   151,    80,   158,    91,   159,    92,    -1,   158,    91,
     159,    92,    80,   158,    -1,   151,    80,    12,   146,    49,
     158,    -1,   151,    80,    12,   146,    -1,   151,    80,    32,
     158,    -1,   151,    80,    32,   158,    91,   159,    92,    -1,
     151,    80,    42,   158,    -1,   151,    80,    41,    69,    -1,
     151,    80,    40,   166,    -1,    40,   166,    80,   158,    -1,
      -1,    12,   148,   103,    -1,    32,   151,    49,   158,    -1,
      32,   151,    49,   158,    91,   159,    92,    -1,    42,   151,
      49,   158,    -1,    10,   158,   150,   158,     7,   156,    -1,
      11,   158,   150,   158,     7,   156,    -1,    10,   158,     7,
     156,    -1,    11,   158,     7,   156,    -1,    10,   158,    49,
     156,    -1,    11,   158,    49,   156,    -1,    34,    -1,    35,
      -1,    36,    -1,    37,    -1,    38,    -1,    39,    -1,    77,
      -1,   164,    -1,    77,    -1,   164,    -1,    -1,   154,    -1,
     154,    49,   155,    -1,   155,    -1,   157,    -1,   152,    91,
     159,    92,    -1,    69,    -1,    76,    -1,   156,    -1,   158,
      -1,    77,    -1,   163,    -1,    -1,   160,   161,    -1,   162,
      -1,   161,    93,   162,    -1,   158,    -1,   164,    -1,   165,
      -1,    65,    -1,    66,    -1,    67,    -1,    68,    -1,    73,
      -1,    71,    -1,    72,    -1,    70,    -1,    67,    -1,    70,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   242,   242,   242,   246,   247,   248,   249,   252,   253,
     257,   258,   261,   262,   263,   264,   267,   267,   270,   276,
     278,   283,   282,   291,   295,   304,   304,   310,   312,   310,
     322,   323,   324,   327,   327,   331,   331,   360,   361,   364,
     365,   368,   369,   372,   376,   379,   385,   386,   389,   390,
     393,   394,   397,   398,   398,   401,   401,   417,   417,   434,
     435,   436,   439,   442,   443,   453,   456,   458,   459,   460,
     461,   462,   463,   466,   467,   470,   471,   474,   477,   480,
     482,   483,   484,   485,   485,   486,   486,   488,   488,   490,
     490,   492,   493,   494,   495,   496,   497,   498,   499,   500,
     501,   502,   503,   505,   508,   510,   511,   512,   515,   519,
     521,   522,   523,   524,   525,   526,   527,   528,   529,   530,
     531,   532,   533,   534,   535,   536,   537,   538,   539,   540,
     541,   542,   543,   544,   545,   547,   549,   551,   552,   553,
     553,   555,   556,   558,   561,   563,   565,   566,   567,   568,
     572,   574,   575,   576,   577,   578,   582,   583,   585,   586,
     589,   590,   593,   594,   597,   598,   602,   604,   606,   608,
     611,   612,   615,   615,   619,   620,   623,   626,   627,   630,
     631,   632,   633,   634,   637,   638,   639,   642,   643
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
       0,    94,    96,    95,    97,    97,    97,    97,    98,    98,
      99,    99,   100,   100,   100,   100,   102,   101,   101,   101,
     103,   105,   104,   106,   107,   109,   108,   111,   112,   110,
     113,   113,   113,   115,   114,   117,   116,   118,   118,   119,
     119,   120,   120,   121,   121,   121,   122,   122,   123,   123,
     124,   124,   125,   126,   125,   128,   127,   130,   129,   131,
     131,   131,   132,   133,   133,   134,   135,   135,   135,   135,
     135,   135,   135,   136,   136,   137,   137,   138,   139,   140,
     140,   140,   140,   141,   140,   142,   140,   143,   140,   144,
     140,   140,   140,   140,   140,   140,   140,   140,   140,   140,
     140,   140,   140,   140,   145,   145,   145,   145,   146,   147,
     147,   147,   147,   147,   147,   147,   147,   147,   147,   147,
     147,   147,   147,   147,   147,   147,   147,   147,   147,   147,
     147,   147,   147,   147,   147,   147,   147,   147,   147,   148,
     147,   147,   147,   147,   149,   149,   149,   149,   149,   149,
     150,   150,   150,   150,   150,   150,   151,   151,   152,   152,
     153,   153,   154,   154,   155,   155,   156,   156,   157,   157,
     158,   158,   160,   159,   161,   161,   162,   163,   163,   164,
     164,   164,   164,   164,   165,   165,   165,   166,   166
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     2,     1,     1,     1,     1,     1,     2,
       1,     2,     3,     2,     1,     1,     0,     3,     2,     0,
       1,     0,     4,     2,     2,     0,     4,     0,     0,     8,
       0,     1,     3,     0,     4,     0,    10,     0,     2,     1,
       1,     0,     1,     5,     3,     3,     0,     3,     2,     2,
       0,     3,     2,     0,     4,     0,     6,     0,     6,     0,
       2,     3,     2,     1,     2,     0,     2,     2,     1,     1,
       1,     1,     1,     0,     1,     2,     1,     1,     3,     1,
       1,     2,     2,     0,     4,     0,     6,     0,     6,     0,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     1,
       1,     1,     2,     0,     1,     1,     1,     1,     1,     3,
       4,     4,     4,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     6,
       6,     6,     4,     4,     7,     4,     4,     4,     4,     0,
       3,     4,     7,     4,     6,     6,     4,     4,     4,     4,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       0,     1,     3,     1,     1,     4,     1,     1,     1,     1,
       1,     1,     0,     2,     1,     3,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,     0,     1,     7,    25,    27,    21,     8,     3,
       6,     4,    65,     5,     0,     0,    73,     9,     0,     0,
       0,     0,    72,    71,    23,    68,    69,    70,    65,    73,
      63,     0,    41,    77,     0,    15,    14,    73,    10,    16,
      74,    76,    39,    40,     0,    55,    57,    67,    24,    64,
     103,    66,    26,    42,     0,    13,    22,    11,     0,     0,
       0,    75,    35,    59,    59,    89,     0,     0,     0,     0,
       0,   139,   101,    99,   100,     0,     0,    83,    85,     0,
       0,    87,     0,     0,     0,     0,     0,   179,   180,   181,
     182,   186,   184,   185,   183,   160,   156,     0,    79,    80,
       0,     0,   171,   157,   178,    28,    18,    12,   160,    46,
       0,     0,     0,    91,   166,   167,    95,    96,   170,    93,
     177,     0,     0,   160,    81,    82,     0,     0,    97,    98,
       0,   156,     0,   157,   187,   188,     0,     0,    92,    94,
     170,     0,   102,   161,   163,   168,   164,   169,   177,    78,
       0,   172,    30,    17,    20,     0,    60,     0,     0,     0,
       0,   104,   105,   106,   108,     0,   107,     0,   150,   151,
     152,   153,   154,   155,     0,     0,     0,     0,     0,   140,
       0,     0,     0,     0,     0,     0,   172,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   109,     0,     0,    31,
      65,     0,     0,     0,     0,    37,     0,    62,    56,    61,
      58,    90,   146,   148,     0,   147,   149,     0,    84,     0,
       0,   141,   138,   143,     0,   162,   132,   133,   137,   136,
     135,   110,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     172,     0,   176,   173,   174,    33,    29,     0,    48,    49,
       0,     0,    50,     0,    47,     0,     0,     0,     0,   172,
     165,     0,   172,   120,   121,   125,   116,   122,   123,   124,
     114,   128,   113,   115,   117,   118,   119,   126,   127,     0,
       0,     0,     0,    32,    44,     0,    45,     0,    38,   144,
     145,    86,    88,     0,   131,     0,   129,   130,   175,     0,
       0,    53,     0,     0,     0,   142,   134,    34,    43,     0,
      52,    36,    51,     0,    54
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,     8,     9,    37,    38,    59,    60,   153,
      10,    16,    11,    24,    12,    14,    13,    15,   152,   200,
     257,   292,    25,   109,   262,    44,    54,   205,   155,   206,
     297,   314,   319,    26,    63,    27,    64,   110,   159,    28,
      29,    30,    39,    40,    41,    51,    97,   126,   127,   130,
     112,   165,   166,    98,   123,    99,   175,   100,   141,   154,
     143,   144,   145,   146,   147,   197,   198,   253,   254,   102,
     120,   104,   136
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -183
static const short yypact[] =
{
    -183,    19,     6,  -183,  -183,  -183,  -183,  -183,  -183,     6,
    -183,  -183,    31,  -183,   -56,   -25,    -8,  -183,    16,    46,
      49,    52,  -183,  -183,  -183,  -183,  -183,  -183,   171,    18,
    -183,    85,    16,  -183,    87,  -183,  -183,   -41,  -183,     7,
      18,  -183,  -183,  -183,    94,  -183,  -183,  -183,  -183,  -183,
     253,  -183,  -183,  -183,   112,  -183,  -183,  -183,    57,   116,
     -14,  -183,  -183,  -183,  -183,    97,   -29,   -29,   287,   287,
     287,  -183,  -183,  -183,  -183,    53,    54,  -183,  -183,   287,
     287,  -183,    59,   -24,    59,   287,   287,  -183,  -183,  -183,
    -183,  -183,  -183,  -183,  -183,   167,    37,   125,  -183,  -183,
      50,    42,  -183,    44,  -183,  -183,  -183,  -183,   167,  -183,
       8,     5,    -2,  -183,  -183,  -183,  -183,  -183,  -183,  -183,
    -183,    58,    65,   167,  -183,  -183,    -2,    -2,  -183,  -183,
      -2,  -183,    89,  -183,  -183,  -183,    62,    95,  -183,  -183,
      55,    56,  -183,   104,  -183,  -183,  -183,  -183,    67,  -183,
     268,  -183,   139,  -183,  -183,    22,  -183,   287,   162,   164,
     165,  -183,  -183,  -183,  -183,   102,  -183,   -29,  -183,  -183,
    -183,  -183,  -183,  -183,   -29,   287,   -29,   -29,   287,  -183,
     103,   108,   109,   287,   287,   287,  -183,   167,   110,   287,
     -24,   111,   287,   287,   287,   287,   128,    91,   287,  -183,
       0,   287,    59,   287,   287,    18,   177,  -183,  -183,  -183,
    -183,  -183,  -183,  -183,   178,  -183,  -183,   179,  -183,   107,
     140,    93,  -183,  -183,    96,  -183,   159,    98,  -183,  -183,
    -183,  -183,  -183,  -183,   287,   287,   287,   287,   287,   287,
     287,   287,   287,   287,   287,   287,   287,   287,   287,   287,
    -183,   143,  -183,   131,  -183,  -183,  -183,   221,  -183,  -183,
      10,   225,  -183,   226,  -183,   -29,   -29,    13,    13,  -183,
    -183,   287,  -183,  -183,  -183,  -183,  -183,  -183,  -183,  -183,
    -183,  -183,  -183,  -183,  -183,  -183,  -183,  -183,  -183,   149,
     287,   287,    -2,  -183,  -183,   287,  -183,    -4,  -183,  -183,
    -183,  -183,  -183,   150,  -183,   156,  -183,  -183,  -183,   183,
     249,  -183,    59,   250,   251,  -183,  -183,  -183,  -183,    -2,
    -183,  -183,  -183,   187,  -183
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -183,  -183,  -183,   248,  -183,  -183,   232,  -183,  -183,   151,
    -183,  -183,  -183,    72,  -183,  -183,  -183,  -183,  -183,  -183,
    -183,  -183,  -183,  -183,  -183,   241,  -183,  -183,  -183,  -183,
    -183,  -183,  -183,  -183,  -183,  -183,  -183,   217,  -183,  -183,
    -183,   254,   255,  -183,   -38,  -183,  -183,  -183,  -183,  -183,
    -183,  -110,    99,  -183,  -183,  -183,   161,   -81,  -183,   191,
    -183,   101,   -59,  -183,   -44,  -182,  -183,  -183,    -1,  -183,
     -50,  -156,   113
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -178
static const short yytable[] =
{
     103,   132,    61,   137,   224,   255,   101,   116,   117,   156,
       4,   -19,   156,    31,   294,   113,   180,   181,   311,     3,
     182,    33,     5,    56,   119,   121,   122,   161,   162,   163,
     201,   202,   133,    34,   133,   128,   129,    35,    36,   312,
     114,   138,   139,   134,    32,   148,   135,   115,   313,   157,
      45,    18,   157,    46,    33,    19,    47,    20,   148,   295,
       6,    58,   108,   160,   158,   167,    34,   164,   289,     7,
      35,    36,   176,   148,    21,   203,    42,    43,    22,    23,
      33,   204,    18,    91,    92,    93,    19,   303,    20,    52,
     305,    55,   168,   169,   170,   171,   172,   173,    62,   168,
     169,   170,   171,   172,   173,    21,   196,   174,   212,    22,
      23,   301,   302,   207,   177,   213,   105,   215,   216,   106,
     107,   259,   124,   125,    87,    88,    89,    90,  -170,   149,
     150,   214,    94,   151,   217,  -177,   131,   148,   183,   221,
     222,   223,   184,   199,   185,   227,  -158,   186,   230,   231,
     232,   233,   133,   187,   252,   234,   235,   258,  -159,   260,
     261,   236,    87,    88,    89,    90,   208,   263,   209,   210,
      94,   211,   218,   237,   238,   239,   240,   219,   220,   164,
     229,   264,   309,   251,   269,   265,   266,   267,   270,   272,
     273,   274,   275,   276,   277,   278,   279,   280,   281,   282,
     283,   284,   285,   286,   287,   288,   299,   300,   271,   323,
     241,   242,   243,   244,   245,   246,   247,   248,   249,   250,
     268,    48,    18,   290,   291,   293,    19,   304,    20,   296,
     298,   320,    87,    88,    89,    90,   114,    91,    92,    93,
      94,   306,   315,   115,   140,    21,   307,   252,   316,    22,
      23,   310,   317,   318,   321,   322,   324,    17,    65,    66,
      67,    68,   133,    69,    70,    71,    72,    73,    74,    57,
      75,    76,   256,    53,   179,    77,    78,    79,    80,    81,
     188,   111,    49,   178,    50,    82,   142,   226,   225,     0,
     308,     0,     0,    83,     0,    84,    85,    86,     0,     0,
     189,     0,     0,   228,     0,     0,     0,     0,   190,   191,
     192,     0,     0,     0,     0,     0,     0,     0,    87,    88,
      89,    90,     0,    91,    92,    93,    94,     0,     0,    95,
      96,     0,     0,    87,    88,    89,    90,     0,    91,    92,
      93,    94,     0,     0,     0,   118,     0,     0,     0,   193,
     194,   195,    87,    88,    89,    90,     0,    91,    92,    93,
      94,     0,     0,     0,   118
};

static const short yycheck[] =
{
      50,    82,    40,    84,   186,     5,    50,    66,    67,     4,
       4,     4,     4,    69,     4,    65,   126,   127,    22,     0,
     130,    62,    16,    64,    68,    69,    70,    29,    30,    31,
       8,     9,    82,    74,    84,    79,    80,    78,    79,    43,
      69,    85,    86,    67,    69,    95,    70,    76,    52,    44,
       4,    51,    44,     4,    62,    55,     4,    57,   108,    49,
      54,    54,    76,    58,    56,     7,    74,    69,   250,    63,
      78,    79,     7,   123,    74,    53,    60,    61,    78,    79,
      62,    59,    51,    70,    71,    72,    55,   269,    57,     4,
     272,     4,    34,    35,    36,    37,    38,    39,     4,    34,
      35,    36,    37,    38,    39,    74,   150,    49,   167,    78,
      79,   267,   268,   157,    49,   174,     4,   176,   177,    62,
       4,   202,    69,    69,    65,    66,    67,    68,    91,     4,
      80,   175,    73,    91,   178,    91,    77,   187,    49,   183,
     184,   185,    80,     4,    49,   189,    91,    91,   192,   193,
     194,   195,   202,    49,   198,    27,    28,   201,    91,   203,
     204,    33,    65,    66,    67,    68,     4,   205,     4,     4,
      73,    69,    69,    45,    46,    47,    48,    69,    69,    69,
      69,     4,   292,    92,    91,     7,     7,    80,    92,    91,
     234,   235,   236,   237,   238,   239,   240,   241,   242,   243,
     244,   245,   246,   247,   248,   249,   265,   266,    49,   319,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      80,    50,    51,    80,    93,     4,    55,   271,    57,     4,
       4,   312,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    92,    92,    76,    77,    74,   290,   291,    92,    78,
      79,   295,    69,     4,     4,     4,    69,     9,     5,     6,
       7,     8,   312,    10,    11,    12,    13,    14,    15,    37,
      17,    18,   200,    32,   123,    22,    23,    24,    25,    26,
      12,    64,    28,   122,    29,    32,    95,   188,   187,    -1,
     291,    -1,    -1,    40,    -1,    42,    43,    44,    -1,    -1,
      32,    -1,    -1,   190,    -1,    -1,    -1,    -1,    40,    41,
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
       0,    95,    96,     0,     4,    16,    54,    63,    97,    98,
     104,   106,   108,   110,   109,   111,   105,    97,    51,    55,
      57,    74,    78,    79,   107,   116,   127,   129,   133,   134,
     135,    69,    69,    62,    74,    78,    79,    99,   100,   136,
     137,   138,    60,    61,   119,     4,     4,     4,    50,   135,
     136,   139,     4,   119,   120,     4,    64,   100,    54,   101,
     102,   138,     4,   128,   130,     5,     6,     7,     8,    10,
      11,    12,    13,    14,    15,    17,    18,    22,    23,    24,
      25,    26,    32,    40,    42,    43,    44,    65,    66,    67,
      68,    70,    71,    72,    73,    76,    77,   140,   147,   149,
     151,   158,   163,   164,   165,     4,    62,     4,    76,   117,
     131,   131,   144,   164,    69,    76,   156,   156,    77,   158,
     164,   158,   158,   148,    69,    69,   141,   142,   158,   158,
     143,    77,   151,   164,    67,    70,   166,   151,   158,   158,
      77,   152,   153,   154,   155,   156,   157,   158,   164,     4,
      80,    91,   112,   103,   153,   122,     4,    44,    56,   132,
      58,    29,    30,    31,    69,   145,   146,     7,    34,    35,
      36,    37,    38,    39,    49,   150,     7,    49,   150,   103,
     145,   145,   145,    49,    80,    49,    91,    49,    12,    32,
      40,    41,    42,    81,    82,    83,   158,   159,   160,     4,
     113,     8,     9,    53,    59,   121,   123,   158,     4,     4,
       4,    69,   156,   156,   158,   156,   156,   158,    69,    69,
      69,   158,   158,   158,   159,   155,   146,   158,   166,    69,
     158,   158,   158,   158,    27,    28,    33,    45,    46,    47,
      48,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,   158,   161,   162,     5,   107,   114,   158,   151,
     158,   158,   118,   138,     4,     7,     7,    80,    80,    91,
      92,    49,    91,   158,   158,   158,   158,   158,   158,   158,
     158,   158,   158,   158,   158,   158,   158,   158,   158,   159,
      80,    93,   115,     4,     4,    49,     4,   124,     4,   156,
     156,   165,   165,   159,   158,   159,    92,   158,   162,   145,
     158,    22,    43,    52,   125,    92,    92,    69,     4,   126,
     151,     4,     4,   145,    69
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
#line 242 "imcc.y"
    { open_comp_unit(); yyval.i = 0;}
    break;

  case 3:
#line 243 "imcc.y"
    { close_comp_unit(interp); yyval.i = 0; }
    break;

  case 7:
#line 249 "imcc.y"
    { yyval.i = 0; }
    break;

  case 12:
#line 261 "imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 262 "imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 263 "imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 264 "imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 267 "imcc.y"
    {clear_state();}
    break;

  case 17:
#line 268 "imcc.y"
    { yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                                          free(yyvsp[-1].s); }
    break;

  case 18:
#line 270 "imcc.y"
    {
                                          char *name = str_dup(yyvsp[0].s);
                                          yyval.i = iSUBROUTINE(
                                          mk_address(yyvsp[0].s, U_add_uniq_sub));
                                          yyval.i->r[1] =  mk_pcc_sub(name, 0);
                                        }
    break;

  case 19:
#line 276 "imcc.y"
    { yyval.i = 0;}
    break;

  case 21:
#line 283 "imcc.y"
    { open_comp_unit();
                                          function = "(emit)"; }
    break;

  case 22:
#line 286 "imcc.y"
    { if (optimizer_level & OPT_PASM)
                                                allocate(interp);
                                          emit_flush(interp); yyval.i=0;}
    break;

  case 24:
#line 297 "imcc.y"
    {
          yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 25:
#line 304 "imcc.y"
    { open_comp_unit(); }
    break;

  case 26:
#line 306 "imcc.y"
    { yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        }
    break;

  case 27:
#line 310 "imcc.y"
    { open_comp_unit(); }
    break;

  case 28:
#line 312 "imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 29:
#line 319 "imcc.y"
    { yyval.i = 0; }
    break;

  case 30:
#line 322 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 31:
#line 323 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 32:
#line 324 "imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 33:
#line 327 "imcc.y"
    { is_def=1; }
    break;

  case 34:
#line 328 "imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 35:
#line 331 "imcc.y"
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

  case 36:
#line 357 "imcc.y"
    { yyval.i = 0; }
    break;

  case 37:
#line 360 "imcc.y"
    { yyval.i = 0; }
    break;

  case 39:
#line 364 "imcc.y"
    { yyval.t = 1; }
    break;

  case 40:
#line 365 "imcc.y"
    { yyval.t = 0; }
    break;

  case 41:
#line 368 "imcc.y"
    { yyval.t = -1; }
    break;

  case 43:
#line 372 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 44:
#line 376 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 45:
#line 379 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
                  yyvsp[-4].sr ->pcc_sub->nci = 1;
              }
    break;

  case 46:
#line 385 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 47:
#line 386 "imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 48:
#line 389 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 49:
#line 390 "imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 50:
#line 393 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 51:
#line 394 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 52:
#line 397 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 53:
#line 398 "imcc.y"
    { is_def=1; }
    break;

  case 54:
#line 398 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 55:
#line 401 "imcc.y"
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

  case 56:
#line 414 "imcc.y"
    { yyval.i = 0; }
    break;

  case 57:
#line 417 "imcc.y"
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

  case 58:
#line 431 "imcc.y"
    { yyval.i = 0; }
    break;

  case 59:
#line 434 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 60:
#line 435 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 61:
#line 436 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 62:
#line 439 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 65:
#line 453 "imcc.y"
    { clear_state(); }
    break;

  case 66:
#line 457 "imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 67:
#line 458 "imcc.y"
    { yyval.i = 0; }
    break;

  case 68:
#line 459 "imcc.y"
    { yyval.i = 0; }
    break;

  case 71:
#line 462 "imcc.y"
    { yyval.i = 0; }
    break;

  case 72:
#line 463 "imcc.y"
    { yyval.i = 0; }
    break;

  case 73:
#line 466 "imcc.y"
    { yyval.i = NULL; }
    break;

  case 77:
#line 474 "imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 78:
#line 478 "imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 81:
#line 483 "imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 82:
#line 484 "imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 83:
#line 485 "imcc.y"
    { is_def=1; }
    break;

  case 84:
#line 485 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 85:
#line 486 "imcc.y"
    { is_def=1; }
    break;

  case 86:
#line 487 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 87:
#line 488 "imcc.y"
    { is_def=1; }
    break;

  case 88:
#line 489 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 89:
#line 490 "imcc.y"
    { is_def=1; }
    break;

  case 90:
#line 490 "imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 91:
#line 492 "imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 92:
#line 493 "imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 93:
#line 494 "imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 94:
#line 495 "imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 95:
#line 496 "imcc.y"
    { yyval.i = MK_I(interp, "bsr",  1, yyvsp[0].sr); }
    break;

  case 96:
#line 497 "imcc.y"
    { yyval.i = MK_I(interp, "branch",1, yyvsp[0].sr); }
    break;

  case 97:
#line 498 "imcc.y"
    { yyval.i = MK_I(interp, "inc",1, yyvsp[0].sr); }
    break;

  case 98:
#line 499 "imcc.y"
    { yyval.i = MK_I(interp, "dec",1, yyvsp[0].sr); }
    break;

  case 99:
#line 500 "imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,0); }
    break;

  case 100:
#line 501 "imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,0); }
    break;

  case 101:
#line 502 "imcc.y"
    { yyval.i = MK_I(interp, "end" ,0); }
    break;

  case 102:
#line 503 "imcc.y"
    { yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 103:
#line 505 "imcc.y"
    { yyval.i = 0;}
    break;

  case 104:
#line 509 "imcc.y"
    { yyval.t = 'I'; }
    break;

  case 105:
#line 510 "imcc.y"
    { yyval.t = 'N'; }
    break;

  case 106:
#line 511 "imcc.y"
    { yyval.t = 'S'; }
    break;

  case 107:
#line 512 "imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 109:
#line 520 "imcc.y"
    { yyval.i = MK_I(interp, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 110:
#line 521 "imcc.y"
    { yyval.i = MK_I(interp, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 111:
#line 522 "imcc.y"
    { yyval.i = MK_I(interp, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 112:
#line 523 "imcc.y"
    { yyval.i = MK_I(interp, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 113:
#line 524 "imcc.y"
    { yyval.i = MK_I(interp, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 114:
#line 525 "imcc.y"
    { yyval.i = MK_I(interp, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 115:
#line 526 "imcc.y"
    { yyval.i = MK_I(interp, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 116:
#line 527 "imcc.y"
    { yyval.i = MK_I(interp, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 117:
#line 528 "imcc.y"
    { yyval.i = MK_I(interp, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 118:
#line 529 "imcc.y"
    { yyval.i = MK_I(interp, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 119:
#line 530 "imcc.y"
    { yyval.i = MK_I(interp, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 120:
#line 531 "imcc.y"
    { yyval.i = MK_I(interp, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 121:
#line 532 "imcc.y"
    { yyval.i = MK_I(interp, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 122:
#line 533 "imcc.y"
    { yyval.i = MK_I(interp, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 123:
#line 534 "imcc.y"
    { yyval.i = MK_I(interp, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 124:
#line 535 "imcc.y"
    { yyval.i = MK_I(interp, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 125:
#line 536 "imcc.y"
    { yyval.i = MK_I(interp, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 126:
#line 537 "imcc.y"
    { yyval.i = MK_I(interp, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 127:
#line 538 "imcc.y"
    { yyval.i = MK_I(interp, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 128:
#line 539 "imcc.y"
    { yyval.i = MK_I(interp, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 129:
#line 540 "imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 130:
#line 541 "imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 131:
#line 542 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 132:
#line 543 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL,1); }
    break;

  case 133:
#line 544 "imcc.y"
    { yyval.i = MK_I(interp, "defined",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 134:
#line 545 "imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 135:
#line 547 "imcc.y"
    { yyval.i = MK_I(interp, "clone",2, yyvsp[-3].sr, yyvsp[0].sr);
    }
    break;

  case 136:
#line 549 "imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          2, yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once)); }
    break;

  case 137:
#line 551 "imcc.y"
    { yyval.i = MK_I(interp, "find_global",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 138:
#line 552 "imcc.y"
    { yyval.i = MK_I(interp, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 139:
#line 553 "imcc.y"
    { expect_pasm = 1; }
    break;

  case 140:
#line 554 "imcc.y"
    { yyval.i = INS(interp, "new",0,regs,nargs,keyvec,1); }
    break;

  case 141:
#line 555 "imcc.y"
    { yyval.i = MK_I(interp, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 142:
#line 556 "imcc.y"
    { keyvec=KEY_BIT(2);
                                  yyval.i = MK_I(interp, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 143:
#line 558 "imcc.y"
    { yyval.i = MK_I(interp, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 144:
#line 562 "imcc.y"
    {yyval.i=MK_I(interp, yyvsp[-3].s,3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 145:
#line 563 "imcc.y"
    {yyval.i=MK_I(interp, inv_op(yyvsp[-3].s),
                                            3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 146:
#line 565 "imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 147:
#line 566 "imcc.y"
    {yyval.i= MK_I(interp, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 148:
#line 567 "imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 149:
#line 568 "imcc.y"
    {yyval.i= MK_I(interp, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 150:
#line 573 "imcc.y"
    { yyval.s = "eq"; }
    break;

  case 151:
#line 574 "imcc.y"
    { yyval.s = "ne"; }
    break;

  case 152:
#line 575 "imcc.y"
    { yyval.s = "gt"; }
    break;

  case 153:
#line 576 "imcc.y"
    { yyval.s = "ge"; }
    break;

  case 154:
#line 577 "imcc.y"
    { yyval.s = "lt"; }
    break;

  case 155:
#line 578 "imcc.y"
    { yyval.s = "le"; }
    break;

  case 160:
#line 589 "imcc.y"
    { yyval.sr = NULL; }
    break;

  case 161:
#line 590 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 162:
#line 593 "imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 164:
#line 597 "imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 165:
#line 598 "imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 166:
#line 603 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 167:
#line 604 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 172:
#line 615 "imcc.y"
    { nkeys=0; }
    break;

  case 173:
#line 616 "imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 174:
#line 619 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 175:
#line 620 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 179:
#line 630 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 180:
#line 631 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 181:
#line 632 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 182:
#line 633 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 183:
#line 634 "imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 184:
#line 637 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 185:
#line 638 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 186:
#line 639 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 187:
#line 642 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 188:
#line 643 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2458 "imcparser.c"

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


#line 647 "imcc.y"



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

