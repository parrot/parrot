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
     LABEL = 326,
     EMIT = 327,
     EOM = 328,
     IREG = 329,
     NREG = 330,
     SREG = 331,
     PREG = 332,
     IDENTIFIER = 333,
     STRINGC = 334,
     INTC = 335,
     FLOATC = 336,
     REG = 337,
     MACRO = 338,
     ENDM = 339,
     PARROT_OP = 340,
     VAR = 341,
     LINECOMMENT = 342,
     FILECOMMENT = 343
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
#define LABEL 326
#define EMIT 327
#define EOM 328
#define IREG 329
#define NREG 330
#define SREG 331
#define PREG 332
#define IDENTIFIER 333
#define STRINGC 334
#define INTC 335
#define FLOATC 336
#define REG 337
#define MACRO 338
#define ENDM 339
#define PARROT_OP 340
#define VAR 341
#define LINECOMMENT 342
#define FILECOMMENT 343




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
/*  Allow subs to be global regardless of _ at beginning
    if (*r0->name != '_')
        fataly(EX_SOFTWARE, sourcefile, line,
        "illegal local label '%s'\n", r0->name);
*/
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
#line 202 "imcc/imcc.y"
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
#line 460 "imcc/imcparser.c"
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
#line 481 "imcc/imcparser.c"

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
#define YYFINAL  29
#define YYLAST   439

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  106
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  90
/* YYNRULES -- Number of rules. */
#define YYNRULES  230
/* YYNRULES -- Number of states. */
#define YYNSTATES  399

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   343

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    91,     2,     2,     2,    97,    99,     2,
     103,   104,    95,    94,     2,    92,    98,    96,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   105,
       2,    90,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   101,     2,   102,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   100,     2,    93,     2,     2,     2,
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
      86,    87,    88,    89
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    23,    25,    29,    35,    37,    40,    44,    47,    49,
      51,    52,    56,    59,    60,    62,    63,    68,    69,    76,
      78,    79,    81,    84,    86,    88,    90,    95,   100,   101,
     102,   111,   112,   114,   118,   119,   124,   127,   128,   129,
     138,   139,   141,   145,   146,   151,   152,   163,   164,   167,
     169,   171,   172,   174,   180,   184,   188,   189,   193,   196,
     199,   200,   204,   207,   208,   213,   214,   221,   222,   229,
     230,   233,   237,   240,   242,   245,   246,   249,   252,   254,
     256,   258,   260,   262,   264,   265,   267,   270,   272,   274,
     278,   280,   282,   285,   288,   289,   294,   295,   302,   303,
     310,   311,   316,   319,   322,   325,   328,   331,   334,   337,
     340,   342,   344,   346,   347,   351,   354,   355,   357,   359,
     361,   363,   365,   367,   369,   371,   373,   375,   377,   381,
     386,   391,   396,   402,   408,   414,   420,   426,   432,   438,
     444,   450,   456,   462,   468,   474,   480,   486,   492,   499,
     506,   513,   518,   523,   530,   535,   543,   548,   553,   558,
     563,   564,   568,   573,   581,   586,   590,   591,   601,   602,
     608,   609,   613,   615,   617,   620,   624,   626,   633,   640,
     645,   650,   655,   660,   662,   664,   666,   668,   670,   672,
     674,   676,   678,   680,   681,   683,   687,   689,   691,   696,
     698,   700,   702,   704,   706,   708,   710,   711,   714,   716,
     720,   722,   724,   726,   728,   730,   732,   734,   736,   738,
     740
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     107,     0,    -1,   108,    -1,   109,    -1,   108,   109,    -1,
     118,    -1,   110,    -1,   125,    -1,   132,    -1,   116,    -1,
      84,     4,    -1,     4,    -1,    49,   169,    79,    -1,    49,
     169,    79,    90,   194,    -1,   112,    -1,   111,   112,    -1,
     158,   113,     4,    -1,    84,     4,    -1,    89,    -1,    88,
      -1,    -1,   114,    86,   115,    -1,    64,    72,    -1,    -1,
     183,    -1,    -1,    73,   117,   111,    74,    -1,    -1,    23,
      79,   119,     4,   120,    24,    -1,   121,    -1,    -1,   122,
      -1,   121,   122,    -1,   123,    -1,   124,    -1,     4,    -1,
      25,   169,    79,     4,    -1,    26,    79,    79,     4,    -1,
      -1,    -1,    27,   126,    79,   142,     4,   127,   128,   131,
      -1,    -1,     4,    -1,   128,   129,     4,    -1,    -1,     5,
     130,   169,    79,    -1,   155,    60,    -1,    -1,    -1,    64,
     133,    79,   142,     4,   134,   135,   131,    -1,    -1,     4,
      -1,   135,   136,     4,    -1,    -1,     5,   137,   169,    79,
      -1,    -1,    61,   141,     4,   139,   144,   143,   140,   146,
      62,     4,    -1,    -1,   160,     4,    -1,    70,    -1,    71,
      -1,    -1,   141,    -1,    63,   188,    59,   188,     4,    -1,
      63,   188,     4,    -1,    69,   188,     4,    -1,    -1,   144,
     145,     4,    -1,     9,   188,    -1,    10,   181,    -1,    -1,
     146,   147,     4,    -1,    53,   181,    -1,    -1,    29,   148,
     169,    79,    -1,    -1,    65,     4,   150,   153,    66,     4,
      -1,    -1,    67,     4,   152,   153,    68,     4,    -1,    -1,
     153,     4,    -1,   153,   154,     4,    -1,    54,   188,    -1,
     157,    -1,   155,   157,    -1,    -1,   156,   161,    -1,    84,
       4,    -1,   174,    -1,   138,    -1,   149,    -1,   151,    -1,
      89,    -1,    88,    -1,    -1,   159,    -1,   159,   160,    -1,
     160,    -1,    72,    -1,   158,   162,     4,    -1,   171,    -1,
     179,    -1,    21,    79,    -1,    22,    79,    -1,    -1,    29,
     163,   169,    79,    -1,    -1,    30,   164,   169,    79,    90,
     194,    -1,    -1,    33,   165,   169,    79,    90,   194,    -1,
      -1,     5,   166,   169,    79,    -1,     5,   193,    -1,    53,
     188,    -1,     9,   188,    -1,    54,   188,    -1,     7,   186,
      -1,     8,   186,    -1,    31,   188,    -1,    32,   188,    -1,
      14,    -1,    15,    -1,    13,    -1,    -1,    17,   167,   115,
      -1,    86,   183,    -1,    -1,    17,    -1,    18,    -1,    19,
      -1,    20,    -1,    36,    -1,    37,    -1,    38,    -1,    39,
      -1,    40,    -1,   170,    -1,    79,    -1,   181,    90,   188,
      -1,   181,    90,    91,   188,    -1,   181,    90,    92,   188,
      -1,   181,    90,    93,   188,    -1,   181,    90,   188,    94,
     188,    -1,   181,    90,   188,    92,   188,    -1,   181,    90,
     188,    95,   188,    -1,   181,    90,   188,    55,   188,    -1,
     181,    90,   188,    96,   188,    -1,   181,    90,   188,    97,
     188,    -1,   181,    90,   188,    98,   188,    -1,   181,    90,
     188,    34,   188,    -1,   181,    90,   188,    35,   188,    -1,
     181,    90,   188,    56,   188,    -1,   181,    90,   188,    57,
     188,    -1,   181,    90,   188,    58,   188,    -1,   181,    90,
     188,    42,   188,    -1,   181,    90,   188,    99,   188,    -1,
     181,    90,   188,   100,   188,    -1,   181,    90,   188,    93,
     188,    -1,   181,    90,   188,   101,   189,   102,    -1,   188,
     101,   189,   102,    90,   188,    -1,   181,    90,    16,   170,
      59,   188,    -1,   181,    90,    16,   170,    -1,   181,    90,
     168,    79,    -1,   181,    90,   168,    79,    59,    79,    -1,
     181,    90,    41,   188,    -1,   181,    90,    41,   188,   101,
     189,   102,    -1,   181,    90,    52,   188,    -1,   181,    90,
      51,    79,    -1,   181,    90,    50,   195,    -1,    50,   195,
      90,   188,    -1,    -1,    16,   172,   115,    -1,    41,   181,
      59,   188,    -1,    41,   181,    59,   188,   101,   189,   102,
      -1,    52,   181,    59,   188,    -1,   181,    90,   174,    -1,
      -1,   173,   103,   178,   104,    90,    79,   103,   176,   104,
      -1,    -1,    79,   175,   103,   176,   104,    -1,    -1,   176,
      59,   177,    -1,   177,    -1,   188,    -1,    10,   181,    -1,
     178,    59,   181,    -1,   181,    -1,    11,   188,   180,   188,
       8,   186,    -1,    12,   188,   180,   188,     8,   186,    -1,
      11,   188,     8,   186,    -1,    12,   188,     8,   186,    -1,
      11,   188,    59,   186,    -1,    12,   188,    59,   186,    -1,
      43,    -1,    44,    -1,    45,    -1,    46,    -1,    47,    -1,
      48,    -1,    87,    -1,   193,    -1,    87,    -1,   193,    -1,
      -1,   184,    -1,   184,    59,   185,    -1,   185,    -1,   187,
      -1,   182,   101,   189,   102,    -1,    79,    -1,    86,    -1,
     186,    -1,   188,    -1,    87,    -1,   193,    -1,   194,    -1,
      -1,   190,   191,    -1,   192,    -1,   191,   105,   192,    -1,
     188,    -1,    75,    -1,    76,    -1,    77,    -1,    78,    -1,
      83,    -1,    81,    -1,    82,    -1,    80,    -1,    77,    -1,
      80,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   266,   266,   270,   272,   275,   277,   278,   279,   280,
     281,   282,   285,   291,   298,   300,   303,   305,   306,   307,
     310,   310,   314,   318,   321,   326,   325,   339,   337,   353,
     355,   358,   360,   363,   365,   366,   369,   383,   401,   406,
     399,   416,   418,   419,   423,   422,   427,   432,   434,   431,
     444,   446,   447,   451,   450,   457,   455,   485,   487,   490,
     492,   495,   497,   500,   506,   508,   515,   517,   520,   522,
     525,   527,   530,   533,   533,   539,   537,   559,   557,   578,
     580,   582,   586,   590,   592,   603,   607,   610,   611,   612,
     613,   614,   615,   616,   619,   621,   624,   626,   629,   636,
     641,   643,   644,   645,   646,   646,   647,   647,   649,   649,
     651,   651,   653,   654,   655,   656,   657,   658,   659,   660,
     661,   662,   663,   664,   664,   667,   670,   673,   675,   676,
     677,   680,   682,   683,   684,   685,   686,   689,   698,   700,
     701,   702,   703,   704,   705,   706,   707,   708,   709,   710,
     712,   714,   716,   718,   720,   722,   724,   726,   728,   730,
     732,   734,   736,   739,   746,   748,   751,   753,   756,   758,
     763,   762,   766,   768,   771,   774,   781,   780,   804,   802,
     822,   824,   825,   828,   831,   835,   837,   840,   843,   845,
     847,   849,   851,   855,   857,   858,   859,   860,   861,   864,
     866,   869,   871,   874,   876,   879,   881,   884,   886,   894,
     896,   899,   901,   904,   906,   907,   910,   910,   914,   916,
     920,   924,   926,   927,   928,   929,   932,   934,   935,   938,
     940
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
  "PCC_END_YIELD", "NCI_CALL", "PROTOTYPED", "NON_PROTOTYPED", "LABEL", 
  "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "STRINGC", 
  "INTC", "FLOATC", "REG", "MACRO", "ENDM", "PARROT_OP", "VAR", 
  "LINECOMMENT", "FILECOMMENT", "'='", "'!'", "'-'", "'~'", "'+'", "'*'", 
  "'/'", "'%'", "'.'", "'&'", "'|'", "'['", "']'", "'('", "')'", "';'", 
  "$accept", "program", "compilation_units", "compilation_unit", "global", 
  "pasmcode", "pasmline", "pasm_inst", "@1", "pasm_args", "emit", "@2", 
  "class", "@3", "class_body", "member_decls", "member_decl", 
  "field_decl", "method_decl", "sub", "@4", "@5", "sub_params", 
  "sub_param", "@6", "sub_body", "pcc_sub", "@7", "@8", "pcc_params", 
  "pcc_param", "@9", "pcc_sub_call", "@10", "opt_label", "pcc_proto", 
  "pcc_sub_proto", "pcc_call", "pcc_args", "pcc_arg", "pcc_results", 
  "pcc_result", "@11", "pcc_ret", "@12", "pcc_yield", "@13", 
  "pcc_returns", "pcc_return", "statements", "helper_clear_state", 
  "statement", "labels", "_labels", "label", "instruction", 
  "labeled_inst", "@14", "@15", "@16", "@17", "@18", "newsub", "type", 
  "classname", "assignment", "@19", "@20", "sub_call", "@21", "arglist", 
  "arg", "targetlist", "if_statement", "relop", "target", "lhs", "vars", 
  "_vars", "_var_or_i", "label_op", "var_or_i", "var", "keylist", "@22", 
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
      61,    33,    45,   126,    43,    42,    47,    37,    46,    38,
     124,    91,    93,    40,    41,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   106,   107,   108,   108,   109,   109,   109,   109,   109,
     109,   109,   110,   110,   111,   111,   112,   112,   112,   112,
     114,   113,   113,   113,   115,   117,   116,   119,   118,   120,
     120,   121,   121,   122,   122,   122,   123,   124,   126,   127,
     125,   128,   128,   128,   130,   129,   131,   133,   134,   132,
     135,   135,   135,   137,   136,   139,   138,   140,   140,   141,
     141,   142,   142,   143,   143,   143,   144,   144,   145,   145,
     146,   146,   147,   148,   147,   150,   149,   152,   151,   153,
     153,   153,   154,   155,   155,   156,   157,   157,   157,   157,
     157,   157,   157,   157,   158,   158,   159,   159,   160,   161,
     162,   162,   162,   162,   163,   162,   164,   162,   165,   162,
     166,   162,   162,   162,   162,   162,   162,   162,   162,   162,
     162,   162,   162,   167,   162,   162,   162,   168,   168,   168,
     168,   169,   169,   169,   169,   169,   169,   170,   171,   171,
     171,   171,   171,   171,   171,   171,   171,   171,   171,   171,
     171,   171,   171,   171,   171,   171,   171,   171,   171,   171,
     171,   171,   171,   171,   171,   171,   171,   171,   171,   171,
     172,   171,   171,   171,   171,   171,   173,   171,   175,   174,
     176,   176,   176,   177,   177,   178,   178,   179,   179,   179,
     179,   179,   179,   180,   180,   180,   180,   180,   180,   181,
     181,   182,   182,   183,   183,   184,   184,   185,   185,   186,
     186,   187,   187,   188,   188,   188,   190,   189,   191,   191,
     192,   193,   193,   193,   193,   193,   194,   194,   194,   195,
     195
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       2,     1,     3,     5,     1,     2,     3,     2,     1,     1,
       0,     3,     2,     0,     1,     0,     4,     0,     6,     1,
       0,     1,     2,     1,     1,     1,     4,     4,     0,     0,
       8,     0,     1,     3,     0,     4,     2,     0,     0,     8,
       0,     1,     3,     0,     4,     0,    10,     0,     2,     1,
       1,     0,     1,     5,     3,     3,     0,     3,     2,     2,
       0,     3,     2,     0,     4,     0,     6,     0,     6,     0,
       2,     3,     2,     1,     2,     0,     2,     2,     1,     1,
       1,     1,     1,     1,     0,     1,     2,     1,     1,     3,
       1,     1,     2,     2,     0,     4,     0,     6,     0,     6,
       0,     4,     2,     2,     2,     2,     2,     2,     2,     2,
       1,     1,     1,     0,     3,     2,     0,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     3,     4,
       4,     4,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     6,     6,
       6,     4,     4,     6,     4,     7,     4,     4,     4,     4,
       0,     3,     4,     7,     4,     3,     0,     9,     0,     5,
       0,     3,     1,     1,     2,     3,     1,     6,     6,     4,
       4,     4,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     0,     1,     3,     1,     1,     4,     1,
       1,     1,     1,     1,     1,     1,     0,     2,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       0,    11,     0,    38,     0,    47,    25,     0,     0,     2,
       3,     6,     9,     5,     7,     8,    27,     0,   131,   132,
     133,   134,   135,   137,     0,   136,     0,    94,    10,     1,
       4,     0,    61,    12,    61,    98,     0,    19,    18,    94,
      14,    20,    95,    97,    30,    59,    60,    62,     0,     0,
       0,    17,    26,    15,     0,     0,     0,    96,    35,     0,
       0,     0,    29,    31,    33,    34,    39,   228,   226,   227,
      13,    48,    22,    16,   203,     0,     0,    28,    32,    41,
      50,   221,   222,   223,   224,   209,   225,   210,   213,    21,
       0,    24,   204,   206,   211,   207,   212,   214,   215,     0,
       0,    42,    85,    51,    85,   216,     0,    36,    37,    44,
       0,     0,     0,   178,     0,    93,    92,     0,    40,    89,
      90,    91,    85,    94,    83,    88,    53,    49,     0,     0,
       0,   205,     0,     0,    75,    77,     0,    87,    43,    46,
      84,   126,    86,     0,    52,   208,   213,   220,   217,   218,
     214,     0,    55,    79,    79,   180,   110,     0,     0,     0,
       0,     0,   122,   120,   121,   170,   123,     0,     0,   104,
     106,     0,     0,   108,     0,     0,     0,     0,     0,   203,
     199,     0,   100,     0,   101,     0,     0,   200,     0,     0,
      45,    66,     0,     0,     0,     0,   182,   183,     0,   112,
     116,   117,   114,     0,     0,   203,   203,   102,   103,     0,
       0,   118,   119,     0,   199,     0,   200,   229,   230,     0,
       0,   113,   115,   125,    99,     0,     0,   216,    54,   219,
       0,    80,     0,     0,     0,     0,   184,     0,   179,     0,
       0,   193,   194,   195,   196,   197,   198,     0,     0,     0,
       0,     0,   171,   124,     0,     0,     0,     0,     0,     0,
       0,   186,     0,   127,   128,   129,   130,     0,     0,     0,
       0,     0,     0,     0,     0,   175,   138,     0,     0,     0,
       0,     0,    57,     0,    82,    76,    81,    78,   181,   111,
     189,   191,     0,   190,   192,     0,   105,     0,     0,   172,
     169,   174,     0,     0,   161,   164,   168,   167,   166,   139,
     140,   141,   162,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   216,
       0,    68,    69,     0,     0,    70,     0,    67,     0,     0,
       0,     0,   216,   185,     0,     0,   216,     0,   149,   150,
     154,   145,   151,   152,   153,   143,   157,   142,   144,   146,
     147,   148,   155,   156,     0,     0,    64,     0,    65,     0,
      58,   187,   188,   107,   109,     0,     0,   160,     0,   163,
     158,   159,     0,    73,     0,     0,     0,   173,   180,   165,
      63,     0,    72,    56,    71,     0,     0,   177,    74
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     8,     9,    10,    11,    39,    40,    55,    56,    89,
      12,    27,    13,    31,    61,    62,    63,    64,    65,    14,
      17,    79,   102,   117,   132,   118,    15,    26,    80,   104,
     128,   143,   119,   191,   335,    47,    48,   282,   230,   283,
     369,   386,   391,   120,   153,   121,   154,   192,   234,   122,
     123,   124,    41,    42,    43,   142,   181,   209,   210,   213,
     198,   206,   274,    24,    25,   182,   205,   183,   125,   136,
     195,   196,   260,   184,   248,   185,    90,    91,    92,    93,
      94,    95,    96,   129,   130,   148,   149,   150,    98,   219
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -225
static const short yypact[] =
{
      89,  -225,   -66,  -225,   -13,  -225,  -225,    13,    31,    89,
    -225,  -225,  -225,  -225,  -225,  -225,  -225,   -43,  -225,  -225,
    -225,  -225,  -225,  -225,    -1,  -225,     2,    56,  -225,  -225,
    -225,    78,   -29,    -5,   -29,  -225,    85,  -225,  -225,   161,
    -225,     8,    19,  -225,    12,  -225,  -225,  -225,    90,   -26,
      92,  -225,  -225,  -225,    27,    96,    16,  -225,  -225,   -13,
      28,    84,    12,  -225,  -225,  -225,  -225,  -225,  -225,  -225,
    -225,  -225,  -225,  -225,   333,    32,    36,  -225,  -225,   106,
     115,  -225,  -225,  -225,  -225,  -225,  -225,  -225,    26,  -225,
      30,  -225,    58,  -225,  -225,  -225,  -225,    33,  -225,   116,
     122,  -225,    25,  -225,   167,  -225,   333,  -225,  -225,  -225,
     -29,   125,   132,  -225,   133,  -225,  -225,   137,  -225,  -225,
    -225,  -225,   318,    19,  -225,  -225,  -225,  -225,   138,    41,
     246,  -225,   -13,   143,  -225,  -225,    60,  -225,  -225,  -225,
    -225,   266,  -225,   -13,  -225,  -225,  -225,  -225,    59,  -225,
    -225,    88,  -225,  -225,  -225,   113,    83,   -65,   -65,   246,
     246,   246,  -225,  -225,  -225,  -225,  -225,    95,    98,  -225,
    -225,   246,   246,  -225,   183,   -48,   183,   246,   246,   333,
      74,   176,  -225,    79,  -225,    91,    82,    97,   105,   246,
    -225,  -225,    11,     6,   183,   -41,  -225,  -225,   -13,  -225,
    -225,  -225,  -225,     3,   193,   333,   333,  -225,  -225,   -13,
     -13,  -225,  -225,   -13,  -225,   126,  -225,  -225,  -225,   102,
     140,  -225,  -225,  -225,  -225,   183,   284,  -225,  -225,  -225,
      -2,  -225,   246,   198,   199,   200,  -225,   113,  -225,   118,
     -65,  -225,  -225,  -225,  -225,  -225,  -225,   -65,   246,   -65,
     -65,   246,  -225,  -225,   128,   129,   130,   246,   246,   246,
     -25,  -225,   131,  -225,  -225,  -225,  -225,   246,   -48,   148,
     246,   246,   246,   246,   152,  -225,   338,   103,   246,   183,
     246,   246,    19,   238,  -225,  -225,  -225,  -225,  -225,  -225,
    -225,  -225,   239,  -225,  -225,   240,  -225,   163,   164,   156,
    -225,  -225,   183,   172,   205,   166,  -225,  -225,  -225,  -225,
    -225,  -225,   209,   246,   246,   246,   246,   246,   246,   246,
     246,   246,   246,   246,   246,   246,   246,   246,   246,  -225,
     179,  -225,  -225,     5,   268,  -225,   272,  -225,   -65,   -65,
     -26,   -26,  -225,  -225,   206,   246,  -225,   210,  -225,  -225,
    -225,  -225,  -225,  -225,  -225,  -225,  -225,  -225,  -225,  -225,
    -225,  -225,  -225,  -225,   182,   246,  -225,   246,  -225,   -10,
    -225,  -225,  -225,  -225,  -225,   188,   189,  -225,   203,  -225,
    -225,  -225,   287,  -225,   183,   302,   304,  -225,   113,  -225,
    -225,   -13,  -225,  -225,  -225,   -24,   230,  -225,  -225
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -225,  -225,  -225,   301,  -225,  -225,   273,  -225,  -225,  -161,
    -225,  -225,  -225,  -225,  -225,  -225,   251,  -225,  -225,  -225,
    -225,  -225,  -225,  -225,  -225,   211,  -225,  -225,  -225,  -225,
    -225,  -225,  -225,  -225,  -225,   204,   283,  -225,  -225,  -225,
    -225,  -225,  -225,  -225,  -225,  -225,  -225,   177,  -225,  -225,
    -225,   208,   214,  -225,   -38,  -225,  -225,  -225,  -225,  -225,
    -225,  -225,  -225,   -59,    76,  -225,  -225,  -225,   114,  -225,
     -49,   108,  -225,  -225,   146,  -154,  -225,   175,  -225,   245,
    -152,  -225,  -102,  -224,  -225,  -225,   168,   -73,   -47,    87
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -215
static const short yytable[] =
{
      75,    97,    70,   277,    57,   200,   201,   278,   279,   366,
     231,   240,   -23,    16,    85,   231,    58,    28,   237,   383,
     215,    87,   220,    18,    19,    20,    21,    22,   147,   217,
     109,    29,   218,    97,   302,   237,    32,    59,    60,   186,
     236,    45,    46,   384,   252,   253,   241,   242,   243,   244,
     245,   246,   385,   197,    67,    68,    69,   202,   203,   204,
     232,   280,   247,   238,   367,   232,    23,   281,   187,   211,
     212,   261,    54,   151,   235,   221,   222,   233,    33,   303,
     397,    34,    44,   199,   188,    49,   110,   147,   290,    51,
     111,    35,   112,     1,    66,   291,    71,   293,   294,    72,
      73,   216,    74,   216,   113,   364,    97,    76,    77,   114,
     101,    99,     2,   115,   116,   100,     3,   106,   375,   103,
     107,   216,   378,   194,   276,   332,   108,  -201,    35,   134,
     284,   105,    97,    97,  -202,   197,   135,   137,     4,   239,
      36,   138,   144,   145,    37,    38,   292,   152,   343,   295,
     254,   255,   216,     5,   256,   299,   300,   301,    81,    82,
      83,    84,     6,   155,   189,   305,    86,   190,   308,   309,
     310,   311,   126,     7,   207,  -213,   331,   208,   333,   334,
     224,   226,   225,   227,   228,   257,   371,   372,    81,    82,
      83,    84,   258,    67,    68,    69,    86,   289,  -214,   259,
     146,   249,   285,   286,   287,   330,   216,   296,   297,   298,
      23,   348,   349,   350,   351,   352,   353,   354,   355,   356,
     357,   358,   359,   360,   361,   362,   363,   307,   110,   216,
     392,   312,   111,    35,   112,    52,   241,   242,   243,   244,
     245,   246,   337,   377,   336,    36,   113,   338,   339,    37,
      38,   114,   250,   340,   341,   115,   116,   342,    81,    82,
      83,    84,   344,   381,   345,   382,    86,   346,   347,   365,
     214,   156,   368,   157,   158,   159,   370,   160,   161,   162,
     163,   164,   165,   166,   380,   376,   197,   167,   168,   379,
     387,   390,   388,   373,   374,   169,   170,   171,   172,   173,
     262,   263,   264,   265,   266,   389,   393,   174,   394,   398,
      30,   216,    53,    78,   133,   127,   175,    50,   176,   177,
     178,    81,    82,    83,    84,   267,    67,    68,    69,    86,
     140,   193,   396,   146,   268,   269,   270,   141,   304,   395,
     275,    81,    82,    83,    84,   288,    67,    68,    69,    86,
     251,   131,   179,   180,   223,   306,     0,   229,     0,    81,
      82,    83,    84,   113,    67,    68,    69,    86,     0,  -176,
       0,   146,   313,   314,     0,   271,   272,   273,   139,   110,
     315,     0,     0,   111,     0,   112,     0,     0,     0,     0,
       0,     0,     0,   316,   317,   318,   319,   113,     0,     0,
       0,     0,   114,     0,     0,     0,   115,   116,    81,    82,
      83,    84,    85,    67,    68,    69,    86,     0,     0,    87,
      88,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     320,   321,   322,   323,   324,   325,   326,   327,   328,   329
};

static const short yycheck[] =
{
      59,    74,    49,   227,    42,   157,   158,     9,    10,     4,
       4,     8,     4,    79,    79,     4,     4,     4,    59,    29,
     174,    86,   176,    36,    37,    38,    39,    40,   130,    77,
       5,     0,    80,   106,    59,    59,    79,    25,    26,   141,
     194,    70,    71,    53,   205,   206,    43,    44,    45,    46,
      47,    48,    62,   155,    80,    81,    82,   159,   160,   161,
      54,    63,    59,   104,    59,    54,    79,    69,   141,   171,
     172,   225,    64,   132,    68,   177,   178,    66,    79,   104,
     104,    79,     4,   156,   143,    90,    61,   189,   240,     4,
      65,    72,    67,     4,     4,   247,     4,   249,   250,    72,
       4,   174,    86,   176,    79,   329,   179,    79,    24,    84,
       4,    79,    23,    88,    89,    79,    27,    59,   342,     4,
       4,   194,   346,    10,   226,   279,     4,   101,    72,     4,
     232,   101,   205,   206,   101,   237,     4,     4,    49,   198,
      84,     4,     4,   102,    88,    89,   248,     4,   302,   251,
     209,   210,   225,    64,   213,   257,   258,   259,    75,    76,
      77,    78,    73,   103,   105,   267,    83,    79,   270,   271,
     272,   273,     5,    84,    79,   101,   278,    79,   280,   281,
       4,    90,   103,   101,    79,    59,   338,   339,    75,    76,
      77,    78,    90,    80,    81,    82,    83,    79,   101,    59,
      87,     8,     4,     4,     4,   102,   279,    79,    79,    79,
      79,   313,   314,   315,   316,   317,   318,   319,   320,   321,
     322,   323,   324,   325,   326,   327,   328,    79,    61,   302,
     384,    79,    65,    72,    67,    74,    43,    44,    45,    46,
      47,    48,     4,   345,   282,    84,    79,     8,     8,    88,
      89,    84,    59,    90,    90,    88,    89,   101,    75,    76,
      77,    78,    90,   365,    59,   367,    83,   101,    59,    90,
      87,     5,     4,     7,     8,     9,     4,    11,    12,    13,
      14,    15,    16,    17,   102,    79,   388,    21,    22,    79,
     102,     4,   103,   340,   341,    29,    30,    31,    32,    33,
      16,    17,    18,    19,    20,   102,     4,    41,     4,    79,
       9,   384,    39,    62,   110,   104,    50,    34,    52,    53,
      54,    75,    76,    77,    78,    41,    80,    81,    82,    83,
     122,   154,   391,    87,    50,    51,    52,   123,   262,   388,
     226,    75,    76,    77,    78,   237,    80,    81,    82,    83,
     204,   106,    86,    87,   179,   268,    -1,   189,    -1,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    -1,   103,
      -1,    87,    34,    35,    -1,    91,    92,    93,    60,    61,
      42,    -1,    -1,    65,    -1,    67,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    55,    56,    57,    58,    79,    -1,    -1,
      -1,    -1,    84,    -1,    -1,    -1,    88,    89,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    -1,    -1,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      92,    93,    94,    95,    96,    97,    98,    99,   100,   101
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    23,    27,    49,    64,    73,    84,   107,   108,
     109,   110,   116,   118,   125,   132,    79,   126,    36,    37,
      38,    39,    40,    79,   169,   170,   133,   117,     4,     0,
     109,   119,    79,    79,    79,    72,    84,    88,    89,   111,
     112,   158,   159,   160,     4,    70,    71,   141,   142,    90,
     142,     4,    74,   112,    64,   113,   114,   160,     4,    25,
      26,   120,   121,   122,   123,   124,     4,    80,    81,    82,
     194,     4,    72,     4,    86,   169,    79,    24,   122,   127,
     134,    75,    76,    77,    78,    79,    83,    86,    87,   115,
     182,   183,   184,   185,   186,   187,   188,   193,   194,    79,
      79,     4,   128,     4,   135,   101,    59,     4,     4,     5,
      61,    65,    67,    79,    84,    88,    89,   129,   131,   138,
     149,   151,   155,   156,   157,   174,     5,   131,   136,   189,
     190,   185,   130,   141,     4,     4,   175,     4,     4,    60,
     157,   158,   161,   137,     4,   102,    87,   188,   191,   192,
     193,   169,     4,   150,   152,   103,     5,     7,     8,     9,
      11,    12,    13,    14,    15,    16,    17,    21,    22,    29,
      30,    31,    32,    33,    41,    50,    52,    53,    54,    86,
      87,   162,   171,   173,   179,   181,   188,   193,   169,   105,
      79,   139,   153,   153,    10,   176,   177,   188,   166,   193,
     186,   186,   188,   188,   188,   172,   167,    79,    79,   163,
     164,   188,   188,   165,    87,   181,   193,    77,    80,   195,
     181,   188,   188,   183,     4,   103,    90,   101,    79,   192,
     144,     4,    54,    66,   154,    68,   181,    59,   104,   169,
       8,    43,    44,    45,    46,    47,    48,    59,   180,     8,
      59,   180,   115,   115,   169,   169,   169,    59,    90,    59,
     178,   181,    16,    17,    18,    19,    20,    41,    50,    51,
      52,    91,    92,    93,   168,   174,   188,   189,     9,    10,
      63,    69,   143,   145,   188,     4,     4,     4,   177,    79,
     186,   186,   188,   186,   186,   188,    79,    79,    79,   188,
     188,   188,    59,   104,   170,   188,   195,    79,   188,   188,
     188,   188,    79,    34,    35,    42,    55,    56,    57,    58,
      92,    93,    94,    95,    96,    97,    98,    99,   100,   101,
     102,   188,   181,   188,   188,   140,   160,     4,     8,     8,
      90,    90,   101,   181,    90,    59,   101,    59,   188,   188,
     188,   188,   188,   188,   188,   188,   188,   188,   188,   188,
     188,   188,   188,   188,   189,    90,     4,    59,     4,   146,
       4,   186,   186,   194,   194,   189,    79,   188,   189,    79,
     102,   188,   188,    29,    53,    62,   147,   102,   103,   102,
       4,   148,   181,     4,     4,   176,   169,   104,    79
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
#line 267 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 276 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 277 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 278 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 8:
#line 279 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 280 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 281 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 282 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 12:
#line 287 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 13:
#line 292 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 16:
#line 304 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 17:
#line 305 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 18:
#line 306 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 19:
#line 307 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 20:
#line 310 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 21:
#line 312 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 22:
#line 315 "imcc/imcc.y"
    { char *name = str_dup(yyvsp[0].s);
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(name, 0); }
    break;

  case 23:
#line 318 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 25:
#line 326 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; }
    break;

  case 26:
#line 329 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 27:
#line 339 "imcc/imcc.y"
    { 
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 28:
#line 346 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 30:
#line 355 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 35:
#line 366 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 36:
#line 371 "imcc/imcc.y"
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

  case 37:
#line 385 "imcc/imcc.y"
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

  case 38:
#line 401 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 39:
#line 406 "imcc/imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 40:
#line 413 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 41:
#line 417 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 42:
#line 418 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 43:
#line 419 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 44:
#line 423 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 45:
#line 424 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 46:
#line 428 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 47:
#line 432 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 48:
#line 434 "imcc/imcc.y"
    {
            char *name = str_dup(yyvsp[-2].s);
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
            i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
         }
    break;

  case 49:
#line 441 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 50:
#line 445 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 51:
#line 446 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 52:
#line 447 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 53:
#line 451 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 54:
#line 452 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 55:
#line 457 "imcc/imcc.y"
    {
            char name[128];
            SymReg * r;
            Instruction *i;

            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, line - 1);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            r->pcc_sub->prototyped = yyvsp[-1].t;
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

  case 56:
#line 482 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 57:
#line 486 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-2].sr ->pcc_sub->label = 0; }
    break;

  case 58:
#line 487 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-4].sr ->pcc_sub->label = 1; }
    break;

  case 59:
#line 491 "imcc/imcc.y"
    {  yyval.t = 1; }
    break;

  case 60:
#line 492 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 61:
#line 496 "imcc/imcc.y"
    {  yyval.t = -1; }
    break;

  case 63:
#line 502 "imcc/imcc.y"
    {
            add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
            add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
         }
    break;

  case 64:
#line 507 "imcc/imcc.y"
    {  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr); }
    break;

  case 65:
#line 509 "imcc/imcc.y"
    {
            add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
            yyvsp[-4].sr ->pcc_sub->nci = 1;
         }
    break;

  case 66:
#line 516 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 67:
#line 517 "imcc/imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 68:
#line 521 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 69:
#line 522 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 70:
#line 526 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 71:
#line 527 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 72:
#line 532 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 73:
#line 533 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 74:
#line 534 "imcc/imcc.y"
    {  mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 75:
#line 539 "imcc/imcc.y"
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

  case 76:
#line 554 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 77:
#line 559 "imcc/imcc.y"
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

  case 78:
#line 575 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 79:
#line 579 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 80:
#line 581 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 81:
#line 583 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 82:
#line 587 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 85:
#line 604 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 86:
#line 609 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 87:
#line 610 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 88:
#line 611 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 89:
#line 612 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 92:
#line 615 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 93:
#line 616 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 94:
#line 620 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 98:
#line 630 "imcc/imcc.y"
    { 
                     /* $$ = iLABEL(cur_unit, mk_address(, U_add_uniq_label)); */
                     yyval.i = iLABEL(cur_unit, mk_local_label(cur_unit, yyvsp[0].s));
                   }
    break;

  case 99:
#line 638 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 102:
#line 644 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 103:
#line 645 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 104:
#line 646 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 105:
#line 646 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 106:
#line 647 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 107:
#line 648 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 108:
#line 649 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 109:
#line 650 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 110:
#line 651 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 111:
#line 651 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 112:
#line 653 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 113:
#line 654 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 114:
#line 655 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 115:
#line 656 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 116:
#line 657 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 117:
#line 658 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 118:
#line 659 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "inc",1, yyvsp[0].sr); }
    break;

  case 119:
#line 660 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "dec",1, yyvsp[0].sr); }
    break;

  case 120:
#line 661 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "saveall" ,0); }
    break;

  case 121:
#line 662 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restoreall" ,0); }
    break;

  case 122:
#line 663 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "end" ,0); }
    break;

  case 123:
#line 664 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 124:
#line 666 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 125:
#line 668 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 126:
#line 670 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 127:
#line 674 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 128:
#line 675 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 129:
#line 676 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 130:
#line 677 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 131:
#line 681 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 132:
#line 682 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 133:
#line 683 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 134:
#line 684 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 135:
#line 685 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 136:
#line 686 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 137:
#line 691 "imcc/imcc.y"
    {
            if((pmc_type(interp, string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 138:
#line 699 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 139:
#line 700 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 140:
#line 701 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 141:
#line 702 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 142:
#line 703 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 143:
#line 704 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 144:
#line 705 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 145:
#line 706 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 146:
#line 707 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 147:
#line 708 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 148:
#line 709 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 149:
#line 711 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 150:
#line 713 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 151:
#line 715 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 152:
#line 717 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 153:
#line 719 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 154:
#line 721 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 155:
#line 723 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 156:
#line 725 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 157:
#line 727 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 158:
#line 729 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 159:
#line 731 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 160:
#line 733 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 161:
#line 735 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 162:
#line 737 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                          mk_sub_address(yyvsp[0].s), NULL, 1); }
    break;

  case 163:
#line 740 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(yyvsp[-2].s),
                                           mk_sub_address(yyvsp[0].s), 1); }
    break;

  case 164:
#line 747 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 165:
#line 749 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3,yyvsp[-6].sr,yyvsp[-3].sr,yyvsp[-1].sr); }
    break;

  case 166:
#line 752 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone",2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 167:
#line 754 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                    2, yyvsp[-3].sr, mk_label_address(cur_unit, yyvsp[0].s)); }
    break;

  case 168:
#line 757 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 169:
#line 759 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 170:
#line 763 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 171:
#line 765 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "new",0,regs,nargs,keyvec,1); }
    break;

  case 172:
#line 767 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 173:
#line 769 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 174:
#line 772 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 175:
#line 775 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 176:
#line 781 "imcc/imcc.y"
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

  case 177:
#line 792 "imcc/imcc.y"
    {
            current_call->r[0]->pcc_sub->sub = mk_sub_address(yyvsp[-3].s);
            current_call->r[0]->pcc_sub->prototyped = 0;
            if(cur_unit->type == IMC_PCCSUB)
               cur_unit->instructions->r[1]->pcc_sub->calls_a_sub = 1;

            current_call = NULL;
         }
    break;

  case 178:
#line 804 "imcc/imcc.y"
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
           current_call->r[0]->pcc_sub->prototyped = 0;
           if(cur_unit->type == IMC_PCCSUB)
              cur_unit->instructions->r[1]->pcc_sub->calls_a_sub = 1;
        }
    break;

  case 179:
#line 819 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 180:
#line 823 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 181:
#line 824 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 182:
#line 825 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 183:
#line 830 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 184:
#line 832 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 185:
#line 836 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 186:
#line 837 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 187:
#line 842 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 844 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 189:
#line 846 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 848 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 191:
#line 850 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 852 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 193:
#line 856 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 194:
#line 857 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 195:
#line 858 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 196:
#line 859 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 197:
#line 860 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 198:
#line 861 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 203:
#line 875 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 204:
#line 876 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 205:
#line 880 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 207:
#line 885 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 208:
#line 887 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 209:
#line 895 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 210:
#line 896 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 216:
#line 910 "imcc/imcc.y"
    {  nkeys=0; }
    break;

  case 217:
#line 911 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); }
    break;

  case 218:
#line 915 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 219:
#line 917 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 221:
#line 925 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 222:
#line 926 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 223:
#line 927 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 224:
#line 928 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 225:
#line 929 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 226:
#line 933 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 227:
#line 934 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 228:
#line 935 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 229:
#line 939 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 230:
#line 940 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/local/share/bison/yacc.c.  */
#line 2871 "imcc/imcparser.c"

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


#line 945 "imcc/imcc.y"



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

