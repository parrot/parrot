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
     DEFINED = 293,
     LOG_XOR = 294,
     RELOP_EQ = 295,
     RELOP_NE = 296,
     RELOP_GT = 297,
     RELOP_GTE = 298,
     RELOP_LT = 299,
     RELOP_LTE = 300,
     GLOBAL = 301,
     ADDR = 302,
     CLONE = 303,
     RESULT = 304,
     RETURN = 305,
     POW = 306,
     SHIFT_RIGHT_U = 307,
     LOG_AND = 308,
     LOG_OR = 309,
     COMMA = 310,
     ESUB = 311,
     PCC_BEGIN = 312,
     PCC_END = 313,
     PCC_CALL = 314,
     PCC_SUB = 315,
     PCC_BEGIN_RETURN = 316,
     PCC_END_RETURN = 317,
     PCC_BEGIN_YIELD = 318,
     PCC_END_YIELD = 319,
     NCI_CALL = 320,
     PROTOTYPED = 321,
     NON_PROTOTYPED = 322,
     LABEL = 323,
     EMIT = 324,
     EOM = 325,
     IREG = 326,
     NREG = 327,
     SREG = 328,
     PREG = 329,
     IDENTIFIER = 330,
     STRINGC = 331,
     INTC = 332,
     FLOATC = 333,
     REG = 334,
     MACRO = 335,
     ENDM = 336,
     PARROT_OP = 337,
     VAR = 338,
     LINECOMMENT = 339,
     FILECOMMENT = 340
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
#define DEFINED 293
#define LOG_XOR 294
#define RELOP_EQ 295
#define RELOP_NE 296
#define RELOP_GT 297
#define RELOP_GTE 298
#define RELOP_LT 299
#define RELOP_LTE 300
#define GLOBAL 301
#define ADDR 302
#define CLONE 303
#define RESULT 304
#define RETURN 305
#define POW 306
#define SHIFT_RIGHT_U 307
#define LOG_AND 308
#define LOG_OR 309
#define COMMA 310
#define ESUB 311
#define PCC_BEGIN 312
#define PCC_END 313
#define PCC_CALL 314
#define PCC_SUB 315
#define PCC_BEGIN_RETURN 316
#define PCC_END_RETURN 317
#define PCC_BEGIN_YIELD 318
#define PCC_END_YIELD 319
#define NCI_CALL 320
#define PROTOTYPED 321
#define NON_PROTOTYPED 322
#define LABEL 323
#define EMIT 324
#define EOM 325
#define IREG 326
#define NREG 327
#define SREG 328
#define PREG 329
#define IDENTIFIER 330
#define STRINGC 331
#define INTC 332
#define FLOATC 333
#define REG 334
#define MACRO 335
#define ENDM 336
#define PARROT_OP 337
#define VAR 338
#define LINECOMMENT 339
#define FILECOMMENT 340




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
    if (*r0->name != '_')
        fataly(EX_SOFTWARE, sourcefile, line,
        "illegal local label '%s'\n", r0->name);
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
#line 205 "imcc/imcc.y"
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
#line 457 "imcc/imcparser.c"
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
#line 478 "imcc/imcparser.c"

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
#define YYFINAL  19
#define YYLAST   424

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  103
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  90
/* YYNRULES -- Number of rules. */
#define YYNRULES  226
/* YYNRULES -- Number of states. */
#define YYNSTATES  392

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   340

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    88,     2,     2,     2,    94,    96,     2,
     100,   101,    92,    91,     2,    89,    95,    93,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   102,
       2,    87,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    98,     2,    99,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    97,     2,    90,     2,     2,     2,
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
      86
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,     9,    11,    13,    16,    18,
      20,    23,    25,    28,    32,    35,    37,    39,    40,    44,
      47,    48,    50,    51,    56,    57,    64,    66,    67,    69,
      72,    74,    76,    78,    83,    88,    89,    90,    99,   100,
     102,   106,   107,   112,   115,   116,   117,   126,   127,   129,
     133,   134,   139,   140,   151,   152,   155,   157,   159,   160,
     162,   168,   172,   176,   177,   181,   184,   187,   188,   192,
     195,   196,   201,   202,   209,   210,   217,   218,   221,   225,
     228,   230,   233,   234,   237,   240,   242,   244,   246,   248,
     250,   252,   253,   255,   258,   260,   262,   266,   268,   270,
     273,   276,   277,   282,   283,   290,   291,   298,   299,   304,
     307,   310,   313,   316,   319,   322,   325,   328,   330,   332,
     334,   335,   339,   342,   343,   345,   347,   349,   351,   353,
     355,   357,   359,   361,   365,   370,   375,   380,   386,   392,
     398,   404,   410,   416,   422,   428,   434,   440,   446,   452,
     458,   464,   470,   476,   483,   490,   497,   502,   507,   514,
     519,   527,   532,   537,   542,   547,   548,   552,   557,   565,
     570,   574,   575,   585,   586,   592,   593,   597,   599,   601,
     604,   608,   610,   617,   624,   629,   634,   639,   644,   646,
     648,   650,   652,   654,   656,   658,   660,   662,   664,   665,
     667,   671,   673,   675,   680,   682,   684,   686,   688,   690,
     692,   693,   696,   698,   702,   704,   706,   708,   710,   712,
     714,   716,   718,   720,   722,   724,   726
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     104,     0,    -1,   106,    -1,   114,    -1,   121,    -1,   128,
      -1,   112,    -1,    81,     4,    -1,     4,    -1,   105,    -1,
     106,   105,    -1,   108,    -1,   107,   108,    -1,   154,   109,
       4,    -1,    81,     4,    -1,    86,    -1,    85,    -1,    -1,
     110,    83,   111,    -1,    61,    69,    -1,    -1,   179,    -1,
      -1,    70,   113,   107,    71,    -1,    -1,    23,    76,   115,
       4,   116,    24,    -1,   117,    -1,    -1,   118,    -1,   117,
     118,    -1,   119,    -1,   120,    -1,     4,    -1,    25,   165,
      76,     4,    -1,    26,    76,    76,     4,    -1,    -1,    -1,
      27,   122,    76,   138,     4,   123,   124,   127,    -1,    -1,
       4,    -1,   124,   125,     4,    -1,    -1,     5,   126,   165,
      76,    -1,   151,    57,    -1,    -1,    -1,    61,   129,    76,
     138,     4,   130,   131,   127,    -1,    -1,     4,    -1,   131,
     132,     4,    -1,    -1,     5,   133,   165,    76,    -1,    -1,
      58,   137,     4,   135,   140,   139,   136,   142,    59,     4,
      -1,    -1,   156,     4,    -1,    67,    -1,    68,    -1,    -1,
     137,    -1,    60,   184,    56,   184,     4,    -1,    60,   184,
       4,    -1,    66,   184,     4,    -1,    -1,   140,   141,     4,
      -1,     9,   184,    -1,    10,   177,    -1,    -1,   142,   143,
       4,    -1,    50,   177,    -1,    -1,    29,   144,   165,    76,
      -1,    -1,    62,     4,   146,   149,    63,     4,    -1,    -1,
      64,     4,   148,   149,    65,     4,    -1,    -1,   149,     4,
      -1,   149,   150,     4,    -1,    51,   184,    -1,   153,    -1,
     151,   153,    -1,    -1,   152,   157,    -1,    81,     4,    -1,
     170,    -1,   134,    -1,   145,    -1,   147,    -1,    86,    -1,
      85,    -1,    -1,   155,    -1,   155,   156,    -1,   156,    -1,
      69,    -1,   154,   158,     4,    -1,   167,    -1,   175,    -1,
      21,    76,    -1,    22,    76,    -1,    -1,    29,   159,   165,
      76,    -1,    -1,    30,   160,   165,    76,    87,   191,    -1,
      -1,    33,   161,   165,    76,    87,   191,    -1,    -1,     5,
     162,   165,    76,    -1,     5,   190,    -1,    50,   184,    -1,
       9,   184,    -1,    51,   184,    -1,     7,   182,    -1,     8,
     182,    -1,    31,   184,    -1,    32,   184,    -1,    14,    -1,
      15,    -1,    13,    -1,    -1,    17,   163,   111,    -1,    83,
     179,    -1,    -1,    17,    -1,    18,    -1,    19,    -1,    20,
      -1,    36,    -1,    37,    -1,    38,    -1,   166,    -1,    76,
      -1,   177,    87,   184,    -1,   177,    87,    88,   184,    -1,
     177,    87,    89,   184,    -1,   177,    87,    90,   184,    -1,
     177,    87,   184,    91,   184,    -1,   177,    87,   184,    89,
     184,    -1,   177,    87,   184,    92,   184,    -1,   177,    87,
     184,    52,   184,    -1,   177,    87,   184,    93,   184,    -1,
     177,    87,   184,    94,   184,    -1,   177,    87,   184,    95,
     184,    -1,   177,    87,   184,    34,   184,    -1,   177,    87,
     184,    35,   184,    -1,   177,    87,   184,    53,   184,    -1,
     177,    87,   184,    54,   184,    -1,   177,    87,   184,    55,
     184,    -1,   177,    87,   184,    40,   184,    -1,   177,    87,
     184,    96,   184,    -1,   177,    87,   184,    97,   184,    -1,
     177,    87,   184,    90,   184,    -1,   177,    87,   184,    98,
     185,    99,    -1,   184,    98,   185,    99,    87,   184,    -1,
     177,    87,    16,   166,    56,   184,    -1,   177,    87,    16,
     166,    -1,   177,    87,   164,    76,    -1,   177,    87,   164,
      76,    56,    76,    -1,   177,    87,    39,   184,    -1,   177,
      87,    39,   184,    98,   185,    99,    -1,   177,    87,    49,
     184,    -1,   177,    87,    48,    76,    -1,   177,    87,    47,
     192,    -1,    47,   192,    87,   184,    -1,    -1,    16,   168,
     111,    -1,    39,   177,    56,   184,    -1,    39,   177,    56,
     184,    98,   185,    99,    -1,    49,   177,    56,   184,    -1,
     177,    87,   170,    -1,    -1,   169,   100,   174,   101,    87,
      76,   100,   172,   101,    -1,    -1,    76,   171,   100,   172,
     101,    -1,    -1,   172,    56,   173,    -1,   173,    -1,   184,
      -1,    10,   177,    -1,   174,    56,   177,    -1,   177,    -1,
      11,   184,   176,   184,     8,   182,    -1,    12,   184,   176,
     184,     8,   182,    -1,    11,   184,     8,   182,    -1,    12,
     184,     8,   182,    -1,    11,   184,    56,   182,    -1,    12,
     184,    56,   182,    -1,    41,    -1,    42,    -1,    43,    -1,
      44,    -1,    45,    -1,    46,    -1,    84,    -1,   190,    -1,
      84,    -1,   190,    -1,    -1,   180,    -1,   180,    56,   181,
      -1,   181,    -1,   183,    -1,   178,    98,   185,    99,    -1,
      76,    -1,    83,    -1,   182,    -1,   184,    -1,    84,    -1,
     189,    -1,    -1,   186,   187,    -1,   188,    -1,   187,   102,
     188,    -1,   184,    -1,   190,    -1,   191,    -1,    72,    -1,
      73,    -1,    74,    -1,    75,    -1,    80,    -1,    78,    -1,
      79,    -1,    77,    -1,    74,    -1,    77,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   264,   264,   268,   270,   271,   272,   273,   274,   277,
     278,   281,   282,   285,   286,   287,   288,   291,   291,   295,
     300,   303,   308,   307,   323,   321,   341,   343,   346,   348,
     351,   353,   354,   357,   372,   390,   395,   388,   405,   406,
     407,   410,   410,   414,   432,   434,   431,   444,   445,   446,
     449,   449,   453,   453,   481,   482,   485,   486,   489,   490,
     493,   497,   500,   506,   507,   510,   511,   514,   515,   518,
     519,   519,   522,   522,   539,   539,   557,   558,   559,   562,
     565,   566,   576,   579,   581,   582,   583,   584,   585,   586,
     587,   590,   591,   594,   595,   598,   601,   605,   607,   608,
     609,   610,   610,   611,   611,   613,   613,   615,   615,   617,
     618,   619,   620,   621,   622,   623,   624,   625,   626,   627,
     628,   628,   630,   632,   635,   637,   638,   639,   642,   644,
     645,   646,   649,   653,   655,   656,   657,   658,   659,   660,
     661,   662,   663,   664,   665,   666,   667,   668,   669,   670,
     671,   672,   673,   674,   675,   676,   677,   678,   680,   687,
     688,   690,   691,   693,   694,   697,   697,   699,   700,   702,
     704,   711,   710,   734,   732,   752,   753,   754,   757,   758,
     761,   763,   766,   768,   770,   771,   772,   773,   777,   779,
     780,   781,   782,   783,   786,   787,   790,   791,   794,   795,
     798,   799,   802,   803,   808,   810,   813,   815,   818,   819,
     822,   822,   826,   827,   830,   833,   834,   837,   838,   839,
     840,   841,   844,   845,   846,   849,   850
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
  "']'", "'('", "')'", "';'", "$accept", "program", "compilation_unit", 
  "compilation_units", "pasmcode", "pasmline", "pasm_inst", "@1", 
  "pasm_args", "emit", "@2", "class", "@3", "class_body", "member_decls", 
  "member_decl", "field_decl", "method_decl", "sub", "@4", "@5", 
  "sub_params", "sub_param", "@6", "sub_body", "pcc_sub", "@7", "@8", 
  "pcc_params", "pcc_param", "@9", "pcc_sub_call", "@10", "opt_label", 
  "pcc_proto", "pcc_sub_proto", "pcc_call", "pcc_args", "pcc_arg", 
  "pcc_results", "pcc_result", "@11", "pcc_ret", "@12", "pcc_yield", 
  "@13", "pcc_returns", "pcc_return", "statements", "helper_clear_state", 
  "statement", "labels", "_labels", "label", "instruction", 
  "labeled_inst", "@14", "@15", "@16", "@17", "@18", "newsub", "type", 
  "classname", "assignment", "@19", "@20", "sub_call", "@21", "arglist", 
  "arg", "targetlist", "if_statement", "relop", "target", "lhs", "vars", 
  "_vars", "_var_or_i", "label_op", "var_or_i", "var", "keylist", "@22", 
  "_keylist", "key", "rc", "reg", "const", "string", 0
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
     334,   335,   336,   337,   338,   339,   340,    61,    33,    45,
     126,    43,    42,    47,    37,    46,    38,   124,    91,    93,
      40,    41,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   103,   104,   105,   105,   105,   105,   105,   105,   106,
     106,   107,   107,   108,   108,   108,   108,   110,   109,   109,
     109,   111,   113,   112,   115,   114,   116,   116,   117,   117,
     118,   118,   118,   119,   120,   122,   123,   121,   124,   124,
     124,   126,   125,   127,   129,   130,   128,   131,   131,   131,
     133,   132,   135,   134,   136,   136,   137,   137,   138,   138,
     139,   139,   139,   140,   140,   141,   141,   142,   142,   143,
     144,   143,   146,   145,   148,   147,   149,   149,   149,   150,
     151,   151,   152,   153,   153,   153,   153,   153,   153,   153,
     153,   154,   154,   155,   155,   156,   157,   158,   158,   158,
     158,   159,   158,   160,   158,   161,   158,   162,   158,   158,
     158,   158,   158,   158,   158,   158,   158,   158,   158,   158,
     163,   158,   158,   158,   164,   164,   164,   164,   165,   165,
     165,   165,   166,   167,   167,   167,   167,   167,   167,   167,
     167,   167,   167,   167,   167,   167,   167,   167,   167,   167,
     167,   167,   167,   167,   167,   167,   167,   167,   167,   167,
     167,   167,   167,   167,   167,   168,   167,   167,   167,   167,
     167,   169,   167,   171,   170,   172,   172,   172,   173,   173,
     174,   174,   175,   175,   175,   175,   175,   175,   176,   176,
     176,   176,   176,   176,   177,   177,   178,   178,   179,   179,
     180,   180,   181,   181,   182,   182,   183,   183,   184,   184,
     186,   185,   187,   187,   188,   189,   189,   190,   190,   190,
     190,   190,   191,   191,   191,   192,   192
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     1,     1,     1,     2,     1,     1,
       2,     1,     2,     3,     2,     1,     1,     0,     3,     2,
       0,     1,     0,     4,     0,     6,     1,     0,     1,     2,
       1,     1,     1,     4,     4,     0,     0,     8,     0,     1,
       3,     0,     4,     2,     0,     0,     8,     0,     1,     3,
       0,     4,     0,    10,     0,     2,     1,     1,     0,     1,
       5,     3,     3,     0,     3,     2,     2,     0,     3,     2,
       0,     4,     0,     6,     0,     6,     0,     2,     3,     2,
       1,     2,     0,     2,     2,     1,     1,     1,     1,     1,
       1,     0,     1,     2,     1,     1,     3,     1,     1,     2,
       2,     0,     4,     0,     6,     0,     6,     0,     4,     2,
       2,     2,     2,     2,     2,     2,     2,     1,     1,     1,
       0,     3,     2,     0,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     3,     4,     4,     4,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     6,     6,     6,     4,     4,     6,     4,
       7,     4,     4,     4,     4,     0,     3,     4,     7,     4,
       3,     0,     9,     0,     5,     0,     3,     1,     1,     2,
       3,     1,     6,     6,     4,     4,     4,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     0,     1,
       3,     1,     1,     4,     1,     1,     1,     1,     1,     1,
       0,     2,     1,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       0,     8,     0,    35,    44,    22,     0,     0,     9,     2,
       6,     3,     4,     5,    24,     0,     0,    91,     7,     1,
      10,     0,    58,    58,    95,     0,    16,    15,    91,    11,
      17,    92,    94,    27,    56,    57,    59,     0,     0,    14,
      23,    12,     0,     0,     0,    93,    32,     0,     0,     0,
      26,    28,    30,    31,    36,    45,    19,    13,   198,   128,
     129,   130,   132,     0,   131,     0,    25,    29,    38,    47,
     217,   218,   219,   220,   204,   224,   222,   223,   221,   205,
     208,    18,     0,    21,   199,   201,   206,   202,   207,   209,
     215,   216,     0,     0,    39,    82,    48,    82,   210,     0,
      33,    34,    41,     0,     0,     0,   173,     0,    90,    89,
       0,    37,    86,    87,    88,    82,    91,    80,    85,    50,
      46,     0,     0,     0,   200,     0,     0,    72,    74,     0,
      84,    40,    43,    81,   123,    83,     0,    49,   203,   208,
     214,   211,   212,   215,     0,    52,    76,    76,   175,   107,
       0,     0,     0,     0,     0,   119,   117,   118,   165,   120,
       0,     0,   101,   103,     0,     0,   105,     0,     0,     0,
       0,     0,   198,   194,     0,    97,     0,    98,     0,     0,
     195,     0,     0,    42,    63,     0,     0,     0,     0,   177,
     178,     0,   109,   113,   114,   111,     0,     0,   198,   198,
      99,   100,     0,     0,   115,   116,     0,   194,     0,   195,
     225,   226,     0,     0,   110,   112,   122,    96,     0,     0,
     210,    51,   213,     0,    77,     0,     0,     0,     0,   179,
       0,   174,     0,     0,   188,   189,   190,   191,   192,   193,
       0,     0,     0,     0,     0,   166,   121,     0,     0,     0,
       0,     0,     0,     0,   181,     0,   124,   125,   126,   127,
       0,     0,     0,     0,     0,     0,     0,     0,   170,   133,
       0,     0,     0,     0,     0,    54,     0,    79,    73,    78,
      75,   176,   108,   184,   186,     0,   185,   187,     0,   102,
       0,     0,   167,   164,   169,     0,     0,   156,   159,   163,
     162,   161,   134,   135,   136,   157,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   210,     0,    65,    66,     0,     0,    67,     0,
      64,     0,     0,     0,     0,   210,   180,     0,     0,   210,
       0,   144,   145,   149,   140,   146,   147,   148,   138,   152,
     137,   139,   141,   142,   143,   150,   151,     0,     0,    61,
       0,    62,     0,    55,   182,   183,   104,   106,     0,     0,
     155,     0,   158,   153,   154,     0,    70,     0,     0,     0,
     168,   175,   160,    60,     0,    69,    53,    68,     0,     0,
     172,    71
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     7,     8,     9,    28,    29,    43,    44,    81,    10,
      17,    11,    21,    49,    50,    51,    52,    53,    12,    15,
      68,    95,   110,   125,   111,    13,    16,    69,    97,   121,
     136,   112,   184,   328,    36,    37,   275,   223,   276,   362,
     379,   384,   113,   146,   114,   147,   185,   227,   115,   116,
     117,    30,    31,    32,   135,   174,   202,   203,   206,   191,
     199,   267,    63,    64,   175,   198,   176,   118,   129,   188,
     189,   253,   177,   241,   178,    82,    83,    84,    85,    86,
      87,    88,   122,   123,   141,   142,    89,   143,    91,   212
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -215
static const short yypact[] =
{
      22,  -215,   -69,  -215,  -215,  -215,    19,    29,  -215,    22,
    -215,  -215,  -215,  -215,  -215,   -63,   -39,    58,  -215,  -215,
    -215,    53,    20,    20,  -215,    66,  -215,  -215,   -31,  -215,
      13,   -21,  -215,    18,  -215,  -215,  -215,    77,    90,  -215,
    -215,  -215,    33,   106,    32,  -215,  -215,    -5,    46,    96,
      18,  -215,  -215,  -215,  -215,  -215,  -215,  -215,   152,  -215,
    -215,  -215,  -215,    59,  -215,    76,  -215,  -215,   150,   153,
    -215,  -215,  -215,  -215,  -215,  -215,  -215,  -215,  -215,  -215,
      60,  -215,    63,  -215,   108,  -215,  -215,  -215,  -215,  -215,
      64,  -215,   166,   172,  -215,     4,  -215,   101,  -215,   152,
    -215,  -215,  -215,    20,   175,   176,  -215,   177,  -215,  -215,
     179,  -215,  -215,  -215,  -215,   310,   -21,  -215,  -215,  -215,
    -215,   200,   107,   325,  -215,    -5,   201,  -215,  -215,   115,
    -215,  -215,  -215,  -215,   257,  -215,    -5,  -215,  -215,  -215,
    -215,   105,  -215,  -215,   140,  -215,  -215,  -215,    94,    25,
     -20,   -20,   325,   325,   325,  -215,  -215,  -215,  -215,  -215,
     141,   145,  -215,  -215,   325,   325,  -215,    44,   -50,    44,
     325,   325,   152,   124,   229,  -215,   134,  -215,   151,   143,
     146,   163,   325,  -215,  -215,    10,     7,    44,   -41,  -215,
    -215,    -5,  -215,  -215,  -215,  -215,   167,   211,   152,   152,
    -215,  -215,    -5,    -5,  -215,  -215,    -5,  -215,   187,  -215,
    -215,  -215,   158,   191,  -215,  -215,  -215,  -215,    44,   275,
    -215,  -215,  -215,     9,  -215,   325,   244,   245,   246,  -215,
      94,  -215,   182,   -20,  -215,  -215,  -215,  -215,  -215,  -215,
     -20,   325,   -20,   -20,   325,  -215,  -215,   183,   185,   199,
     325,   325,   325,   -36,  -215,   204,  -215,  -215,  -215,  -215,
     325,   -50,   205,   325,   325,   325,   325,   206,  -215,   326,
     178,   325,    44,   325,   325,   -21,   247,  -215,  -215,  -215,
    -215,  -215,  -215,  -215,  -215,   268,  -215,  -215,   276,  -215,
     196,   198,   202,  -215,  -215,    44,   210,   242,   203,  -215,
    -215,  -215,  -215,  -215,  -215,   243,   325,   325,   325,   325,
     325,   325,   325,   325,   325,   325,   325,   325,   325,   325,
     325,   325,  -215,   215,  -215,  -215,    21,   299,  -215,   301,
    -215,   -20,   -20,    72,    72,  -215,  -215,   233,   325,  -215,
     234,  -215,  -215,  -215,  -215,  -215,  -215,  -215,  -215,  -215,
    -215,  -215,  -215,  -215,  -215,  -215,  -215,   212,   325,  -215,
     325,  -215,    -8,  -215,  -215,  -215,  -215,  -215,   213,   216,
    -215,   214,  -215,  -215,  -215,   311,  -215,    44,   313,   314,
    -215,    94,  -215,  -215,    -5,  -215,  -215,  -215,   -17,   249,
    -215,  -215
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -215,  -215,   312,  -215,  -215,   292,  -215,  -215,   -68,  -215,
    -215,  -215,  -215,  -215,  -215,   277,  -215,  -215,  -215,  -215,
    -215,  -215,  -215,  -215,   231,  -215,  -215,  -215,  -215,  -215,
    -215,  -215,  -215,  -215,   223,   315,  -215,  -215,  -215,  -215,
    -215,  -215,  -215,  -215,  -215,  -215,   186,  -215,  -215,  -215,
     224,   226,  -215,   -29,  -215,  -215,  -215,  -215,  -215,  -215,
    -215,  -215,  -124,    88,  -215,  -215,  -215,   125,  -215,   -35,
     126,  -215,  -215,   148,  -159,  -215,   190,  -215,   259,  -147,
    -215,  -118,  -214,  -215,  -215,   188,  -215,   -58,  -196,   110
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -216
static const short yytable[] =
{
      90,   144,    45,   193,   194,   140,   270,    14,   208,   102,
     213,   224,   181,    22,   224,   230,   179,   -20,   271,   272,
     295,   376,    46,    18,   210,   359,     1,   211,   229,    19,
     190,    59,    60,    61,   195,   196,   197,    23,    24,   230,
      40,    90,   377,    47,    48,     2,   204,   205,    24,     3,
      25,   378,   214,   215,    26,    27,    74,    33,   225,   254,
     231,   225,   103,    79,   140,   296,   104,   232,   105,   273,
      39,    62,   228,   226,    42,   274,   180,   360,   247,   248,
     106,    54,   249,     4,   390,   107,   283,    34,    35,   108,
     109,   192,     5,   284,    55,   286,   287,    70,    71,    72,
      73,   269,    56,     6,   187,    78,   119,   277,   357,   209,
      57,   209,   190,   325,    90,    58,    70,    71,    72,    73,
      66,   368,    65,   285,    78,   371,   288,    24,   207,   209,
     245,   246,   292,   293,   294,    92,   336,   366,   367,    25,
      90,    90,   298,    26,    27,   301,   302,   303,   304,    75,
      76,    77,    93,   324,    94,   326,   327,    96,  -196,   103,
     209,    98,  -197,   104,    99,   105,    70,    71,    72,    73,
     100,    75,    76,    77,    78,   233,   101,   106,   139,   127,
     128,   130,   107,   131,   364,   365,   108,   109,   341,   342,
     343,   344,   345,   346,   347,   348,   349,   350,   351,   352,
     353,   354,   355,   356,   137,   145,   138,   182,   234,   235,
     236,   237,   238,   239,   209,   148,   183,   200,   385,   242,
     370,   201,  -208,   240,    70,    71,    72,    73,    74,    75,
      76,    77,    78,   217,   218,    79,    80,   209,   219,   221,
     374,   220,   375,   250,  -215,   251,   329,   252,   278,   279,
     280,   330,   234,   235,   236,   237,   238,   239,   282,   289,
     389,   290,   149,   190,   150,   151,   152,   243,   153,   154,
     155,   156,   157,   158,   159,   291,   331,   323,   160,   161,
      62,   300,   305,   333,   332,   334,   162,   163,   164,   165,
     166,   255,   256,   257,   258,   259,   167,   337,   338,   340,
     335,   339,   358,   361,   168,   363,   169,   170,   171,   369,
     372,   373,   380,   382,   260,   383,   381,   386,   387,   209,
      41,    20,   261,   262,   263,   391,   126,    67,   120,    70,
      71,    72,    73,   186,    75,    76,    77,    78,    38,   133,
     172,   173,   134,   297,   268,   244,   388,    70,    71,    72,
      73,   106,    75,    76,    77,    78,   281,  -171,   124,   139,
     306,   307,   216,   264,   265,   266,   308,   132,   103,     0,
     222,   299,   104,     0,   105,     0,     0,     0,   309,   310,
     311,   312,     0,     0,     0,     0,   106,     0,     0,     0,
       0,   107,     0,     0,     0,   108,   109,    70,    71,    72,
      73,     0,    75,    76,    77,    78,     0,     0,     0,   139,
       0,     0,     0,     0,     0,   313,   314,   315,   316,   317,
     318,   319,   320,   321,   322
};

static const short yycheck[] =
{
      58,   125,    31,   150,   151,   123,   220,    76,   167,     5,
     169,     4,   136,    76,     4,    56,   134,     4,     9,    10,
      56,    29,     4,     4,    74,     4,     4,    77,   187,     0,
     148,    36,    37,    38,   152,   153,   154,    76,    69,    56,
      71,    99,    50,    25,    26,    23,   164,   165,    69,    27,
      81,    59,   170,   171,    85,    86,    76,     4,    51,   218,
     101,    51,    58,    83,   182,   101,    62,   191,    64,    60,
       4,    76,    65,    63,    61,    66,   134,    56,   202,   203,
      76,     4,   206,    61,   101,    81,   233,    67,    68,    85,
      86,   149,    70,   240,     4,   242,   243,    72,    73,    74,
      75,   219,    69,    81,    10,    80,     5,   225,   322,   167,
       4,   169,   230,   272,   172,    83,    72,    73,    74,    75,
      24,   335,    76,   241,    80,   339,   244,    69,    84,   187,
     198,   199,   250,   251,   252,    76,   295,   333,   334,    81,
     198,   199,   260,    85,    86,   263,   264,   265,   266,    77,
      78,    79,    76,   271,     4,   273,   274,     4,    98,    58,
     218,    98,    98,    62,    56,    64,    72,    73,    74,    75,
       4,    77,    78,    79,    80,     8,     4,    76,    84,     4,
       4,     4,    81,     4,   331,   332,    85,    86,   306,   307,
     308,   309,   310,   311,   312,   313,   314,   315,   316,   317,
     318,   319,   320,   321,     4,     4,    99,   102,    41,    42,
      43,    44,    45,    46,   272,   100,    76,    76,   377,     8,
     338,    76,    98,    56,    72,    73,    74,    75,    76,    77,
      78,    79,    80,     4,   100,    83,    84,   295,    87,    76,
     358,    98,   360,    56,    98,    87,   275,    56,     4,     4,
       4,     4,    41,    42,    43,    44,    45,    46,    76,    76,
     384,    76,     5,   381,     7,     8,     9,    56,    11,    12,
      13,    14,    15,    16,    17,    76,     8,    99,    21,    22,
      76,    76,    76,    87,     8,    87,    29,    30,    31,    32,
      33,    16,    17,    18,    19,    20,    39,    87,    56,    56,
      98,    98,    87,     4,    47,     4,    49,    50,    51,    76,
      76,    99,    99,    99,    39,     4,   100,     4,     4,   377,
      28,     9,    47,    48,    49,    76,   103,    50,    97,    72,
      73,    74,    75,   147,    77,    78,    79,    80,    23,   115,
      83,    84,   116,   255,   219,   197,   381,    72,    73,    74,
      75,    76,    77,    78,    79,    80,   230,   100,    99,    84,
      34,    35,   172,    88,    89,    90,    40,    57,    58,    -1,
     182,   261,    62,    -1,    64,    -1,    -1,    -1,    52,    53,
      54,    55,    -1,    -1,    -1,    -1,    76,    -1,    -1,    -1,
      -1,    81,    -1,    -1,    -1,    85,    86,    72,    73,    74,
      75,    -1,    77,    78,    79,    80,    -1,    -1,    -1,    84,
      -1,    -1,    -1,    -1,    -1,    89,    90,    91,    92,    93,
      94,    95,    96,    97,    98
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    23,    27,    61,    70,    81,   104,   105,   106,
     112,   114,   121,   128,    76,   122,   129,   113,     4,     0,
     105,   115,    76,    76,    69,    81,    85,    86,   107,   108,
     154,   155,   156,     4,    67,    68,   137,   138,   138,     4,
      71,   108,    61,   109,   110,   156,     4,    25,    26,   116,
     117,   118,   119,   120,     4,     4,    69,     4,    83,    36,
      37,    38,    76,   165,   166,    76,    24,   118,   123,   130,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    83,
      84,   111,   178,   179,   180,   181,   182,   183,   184,   189,
     190,   191,    76,    76,     4,   124,     4,   131,    98,    56,
       4,     4,     5,    58,    62,    64,    76,    81,    85,    86,
     125,   127,   134,   145,   147,   151,   152,   153,   170,     5,
     127,   132,   185,   186,   181,   126,   137,     4,     4,   171,
       4,     4,    57,   153,   154,   157,   133,     4,    99,    84,
     184,   187,   188,   190,   165,     4,   146,   148,   100,     5,
       7,     8,     9,    11,    12,    13,    14,    15,    16,    17,
      21,    22,    29,    30,    31,    32,    33,    39,    47,    49,
      50,    51,    83,    84,   158,   167,   169,   175,   177,   184,
     190,   165,   102,    76,   135,   149,   149,    10,   172,   173,
     184,   162,   190,   182,   182,   184,   184,   184,   168,   163,
      76,    76,   159,   160,   184,   184,   161,    84,   177,   190,
      74,    77,   192,   177,   184,   184,   179,     4,   100,    87,
      98,    76,   188,   140,     4,    51,    63,   150,    65,   177,
      56,   101,   165,     8,    41,    42,    43,    44,    45,    46,
      56,   176,     8,    56,   176,   111,   111,   165,   165,   165,
      56,    87,    56,   174,   177,    16,    17,    18,    19,    20,
      39,    47,    48,    49,    88,    89,    90,   164,   170,   184,
     185,     9,    10,    60,    66,   139,   141,   184,     4,     4,
       4,   173,    76,   182,   182,   184,   182,   182,   184,    76,
      76,    76,   184,   184,   184,    56,   101,   166,   184,   192,
      76,   184,   184,   184,   184,    76,    34,    35,    40,    52,
      53,    54,    55,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    99,   184,   177,   184,   184,   136,   156,
       4,     8,     8,    87,    87,    98,   177,    87,    56,    98,
      56,   184,   184,   184,   184,   184,   184,   184,   184,   184,
     184,   184,   184,   184,   184,   184,   184,   185,    87,     4,
      56,     4,   142,     4,   182,   182,   191,   191,   185,    76,
     184,   185,    76,    99,   184,   184,    29,    50,    59,   143,
      99,   100,    99,     4,   144,   177,     4,     4,   172,   165,
     101,    76
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
#line 265 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 3:
#line 269 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 4:
#line 270 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 5:
#line 271 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 6:
#line 272 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 7:
#line 273 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 8:
#line 274 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 285 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 286 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 287 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 288 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 17:
#line 291 "imcc/imcc.y"
    {clear_state();}
    break;

  case 18:
#line 292 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit,
                                              yyvsp[-1].s,0,regs,nargs,keyvec,1);
                                          free(yyvsp[-1].s); }
    break;

  case 19:
#line 295 "imcc/imcc.y"
    {
                                   char *name = str_dup(yyvsp[0].s);
                                   yyval.i = iSUBROUTINE(cur_unit, mk_address(yyvsp[0].s, U_add_uniq_sub));
                                   yyval.i->r[1] = mk_pcc_sub(name, 0);
                                 }
    break;

  case 20:
#line 300 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 22:
#line 308 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                                   function = "(emit)";
                                 }
    break;

  case 23:
#line 312 "imcc/imcc.y"
    { /*
                                   if (optimizer_level & OPT_PASM)
                                      imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                                   emit_flush(interp);
                                   */
                                   yyval.i=0;
                                 }
    break;

  case 24:
#line 323 "imcc/imcc.y"
    { 
           Symbol * sym = new_symbol(yyvsp[0].s);

           cur_unit = imc_open_unit(interp, IMC_CLASS);

           current_class = new_class(sym);
           sym->p = (void*)current_class;
           store_symbol(&global_sym_tab, sym);
        }
    break;

  case 25:
#line 333 "imcc/imcc.y"
    {
           /* Do nothing for now. Need to parse metadata for
            * PBC creation. */
           current_class = NULL;
           yyval.i = 0;
        }
    break;

  case 27:
#line 343 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 32:
#line 354 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 33:
#line 359 "imcc/imcc.y"
    {
           Symbol * sym = new_symbol(yyvsp[-1].s);
           if(lookup_field_symbol(current_class, yyvsp[-1].s)) {
              fataly(EX_SOFTWARE, sourcefile, line,
                 "field '%s' previously declared in class '%s'\n",
                    yyvsp[-1].s, current_class->sym->name);
           }
           sym->type = yyvsp[-2].t;
           store_field_symbol(current_class, sym);
           yyval.i = 0;
        }
    break;

  case 34:
#line 374 "imcc/imcc.y"
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

  case 35:
#line 390 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 36:
#line 395 "imcc/imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(cur_unit, mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 37:
#line 402 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 38:
#line 405 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 39:
#line 406 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 40:
#line 407 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 41:
#line 410 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 42:
#line 411 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 43:
#line 416 "imcc/imcc.y"
    {
          yyval.i = 0;
        }
    break;

  case 44:
#line 432 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 45:
#line 434 "imcc/imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(cur_unit, mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 46:
#line 441 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 47:
#line 444 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 48:
#line 445 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 49:
#line 446 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 50:
#line 449 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 51:
#line 450 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 52:
#line 453 "imcc/imcc.y"
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

  case 53:
#line 478 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 54:
#line 481 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-2].sr ->pcc_sub->label = 0; }
    break;

  case 55:
#line 482 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-4].sr ->pcc_sub->label = 1; }
    break;

  case 56:
#line 485 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 57:
#line 486 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 58:
#line 489 "imcc/imcc.y"
    { yyval.t = -1; }
    break;

  case 60:
#line 493 "imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 61:
#line 497 "imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 62:
#line 500 "imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
                  yyvsp[-4].sr ->pcc_sub->nci = 1;
              }
    break;

  case 63:
#line 506 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 64:
#line 507 "imcc/imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 65:
#line 510 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 66:
#line 511 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 67:
#line 514 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 68:
#line 515 "imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 69:
#line 518 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 70:
#line 519 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 71:
#line 519 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 72:
#line 522 "imcc/imcc.y"
    {
                Instruction *i, *ins;
                SymReg *r;
                char name[128];
                ins = cur_unit->instructions;
                if (!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
                    fataly(EX_SOFTWARE, sourcefile, line,
                        "pcc_return not inside pcc subroutine\n");
                sprintf(name, "#pcc_sub_ret_%d", line - 1);
                yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
                i = iLABEL(cur_unit, r);
                i->type = ITPCCSUB | ITLABEL;
        }
    break;

  case 73:
#line 536 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 74:
#line 539 "imcc/imcc.y"
    {
                Instruction *i, *ins;
                SymReg *r;
                char name[128];
                ins = cur_unit->instructions;
                if (!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
                    fataly(EX_SOFTWARE, sourcefile, line,
                        "pcc_yield not inside pcc subroutine\n");
                ins->r[1]->pcc_sub->calls_a_sub = 1;
                sprintf(name, "#pcc_sub_yield_%d", line - 1);
                yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
                i = iLABEL(cur_unit, r);
                i->type = ITPCCSUB | ITLABEL | ITPCCYIELD;
        }
    break;

  case 75:
#line 554 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 76:
#line 557 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 77:
#line 558 "imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 78:
#line 559 "imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 79:
#line 562 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 82:
#line 576 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 83:
#line 580 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 84:
#line 581 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 85:
#line 582 "imcc/imcc.y"
    { yyval.i = 0; current_call = NULL; }
    break;

  case 86:
#line 583 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 89:
#line 586 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 90:
#line 587 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 91:
#line 590 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 95:
#line 598 "imcc/imcc.y"
    { yyval.i = iLABEL(cur_unit, mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 96:
#line 602 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 99:
#line 608 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 100:
#line 609 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 101:
#line 610 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 102:
#line 610 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 103:
#line 611 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 104:
#line 612 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 105:
#line 613 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 106:
#line 614 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 107:
#line 615 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 108:
#line 615 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 109:
#line 617 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 110:
#line 618 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 111:
#line 619 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 112:
#line 620 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 113:
#line 621 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 114:
#line 622 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 115:
#line 623 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "inc",1, yyvsp[0].sr); }
    break;

  case 116:
#line 624 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "dec",1, yyvsp[0].sr); }
    break;

  case 117:
#line 625 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "saveall" ,0); }
    break;

  case 118:
#line 626 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restoreall" ,0); }
    break;

  case 119:
#line 627 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "end" ,0); }
    break;

  case 120:
#line 628 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 121:
#line 629 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 122:
#line 630 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 123:
#line 632 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 124:
#line 636 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 125:
#line 637 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 126:
#line 638 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 127:
#line 639 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 128:
#line 643 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 129:
#line 644 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 130:
#line 645 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 131:
#line 646 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 133:
#line 654 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 134:
#line 655 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 135:
#line 656 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 136:
#line 657 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 137:
#line 658 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 138:
#line 659 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 139:
#line 660 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 140:
#line 661 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 141:
#line 662 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 142:
#line 663 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 143:
#line 664 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 144:
#line 665 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 145:
#line 666 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 146:
#line 667 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 147:
#line 668 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 148:
#line 669 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 149:
#line 670 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 150:
#line 671 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 151:
#line 672 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 152:
#line 673 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 153:
#line 674 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 154:
#line 675 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 155:
#line 676 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 156:
#line 677 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 157:
#line 678 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                                 mk_address(yyvsp[0].s, U_add_once), NULL, 1); }
    break;

  case 158:
#line 681 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                                           * to use  instead of implicit P0
                                           */
                                          yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                                 mk_address(yyvsp[-2].s, U_add_once),
                                                 mk_address(yyvsp[0].s, U_add_once), 1); }
    break;

  case 159:
#line 687 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 160:
#line 688 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, cur_unit, "defined", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 161:
#line 690 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone",2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 162:
#line 691 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                          2, yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once)); }
    break;

  case 163:
#line 693 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 164:
#line 694 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 165:
#line 697 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 166:
#line 698 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "new",0,regs,nargs,keyvec,1); }
    break;

  case 167:
#line 699 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 168:
#line 700 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                                  yyval.i = MK_I(interp, cur_unit, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 169:
#line 702 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 170:
#line 705 "imcc/imcc.y"
    {
             add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
             current_call = NULL;
             yyval.i = 0;
          }
    break;

  case 171:
#line 711 "imcc/imcc.y"
    {
              char name[128];
              SymReg * r;
              Instruction *i;
              sprintf(name, "#pcc_sub_call_%d", line - 1);
              r = mk_pcc_sub(str_dup(name), 0);
              current_call = i = iLABEL(cur_unit, r);
              i->type = ITCALL | ITPCCSUB;
              yyval.i = i;
           }
    break;

  case 172:
#line 722 "imcc/imcc.y"
    {
              current_call->r[0]->pcc_sub->sub = mk_address(yyvsp[-3].s, U_add_once);
              current_call->r[0]->pcc_sub->prototyped = 1;
              if (cur_unit->type == IMC_PCCSUB)
                  cur_unit->instructions->r[1]->pcc_sub->calls_a_sub = 1;

              current_call = NULL;
           }
    break;

  case 173:
#line 734 "imcc/imcc.y"
    {
            char name[128];           
            SymReg * r; 
            Instruction *i;
            sprintf(name, "#pcc_sub_call_%d", line - 1);
            r = mk_pcc_sub(str_dup(name), 0);
            current_call = i = iLABEL(cur_unit, r);
            i->type = ITCALL | ITPCCSUB;
            yyval.i = i;
            current_call->r[0]->pcc_sub->sub = mk_address(yyvsp[0].s, U_add_once);
            current_call->r[0]->pcc_sub->prototyped = 1;
            if (cur_unit->type == IMC_PCCSUB)
                cur_unit->instructions->r[1]->pcc_sub->calls_a_sub = 1;
        }
    break;

  case 174:
#line 749 "imcc/imcc.y"
    {   yyval.i = yyvsp[-3].i; }
    break;

  case 175:
#line 752 "imcc/imcc.y"
    { yyval.symlist = 0; }
    break;

  case 176:
#line 753 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 177:
#line 754 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 178:
#line 757 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 179:
#line 758 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 180:
#line 762 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 181:
#line 763 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 182:
#line 767 "imcc/imcc.y"
    {yyval.i=MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 183:
#line 768 "imcc/imcc.y"
    {yyval.i=MK_I(interp, cur_unit, inv_op(yyvsp[-3].s),
                                            3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 770 "imcc/imcc.y"
    {yyval.i= MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 185:
#line 771 "imcc/imcc.y"
    {yyval.i= MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 772 "imcc/imcc.y"
    {yyval.i= MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 187:
#line 773 "imcc/imcc.y"
    {yyval.i= MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 778 "imcc/imcc.y"
    { yyval.s = "eq"; }
    break;

  case 189:
#line 779 "imcc/imcc.y"
    { yyval.s = "ne"; }
    break;

  case 190:
#line 780 "imcc/imcc.y"
    { yyval.s = "gt"; }
    break;

  case 191:
#line 781 "imcc/imcc.y"
    { yyval.s = "ge"; }
    break;

  case 192:
#line 782 "imcc/imcc.y"
    { yyval.s = "lt"; }
    break;

  case 193:
#line 783 "imcc/imcc.y"
    { yyval.s = "le"; }
    break;

  case 198:
#line 794 "imcc/imcc.y"
    { yyval.sr = NULL; }
    break;

  case 199:
#line 795 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 200:
#line 798 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 202:
#line 802 "imcc/imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 203:
#line 803 "imcc/imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 204:
#line 809 "imcc/imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 205:
#line 810 "imcc/imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 210:
#line 822 "imcc/imcc.y"
    { nkeys=0; }
    break;

  case 211:
#line 823 "imcc/imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 212:
#line 826 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 213:
#line 827 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 217:
#line 837 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 218:
#line 838 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 219:
#line 839 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 220:
#line 840 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 221:
#line 841 "imcc/imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 222:
#line 844 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 223:
#line 845 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 224:
#line 846 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 225:
#line 849 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 226:
#line 850 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/local/share/bison/yacc.c.  */
#line 2829 "imcc/imcparser.c"

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


#line 854 "imcc/imcc.y"



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

