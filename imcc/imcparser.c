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
#line 204 "imcc/imcc.y"
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
#line 456 "imcc/imcparser.c"
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
#line 477 "imcc/imcparser.c"

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
#define YYLAST   385

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  101
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  84
/* YYNRULES -- Number of rules. */
#define YYNRULES  213
/* YYNRULES -- Number of states. */
#define YYNSTATES  367

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
       2,     2,    92,    91,     2,    89,    95,    93,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   100,
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
     250,   251,   253,   256,   258,   260,   264,   266,   268,   271,
     274,   275,   280,   281,   288,   289,   296,   297,   302,   305,
     308,   311,   314,   317,   320,   323,   326,   328,   330,   332,
     333,   337,   340,   341,   343,   345,   347,   349,   351,   353,
     355,   357,   359,   363,   368,   373,   378,   384,   390,   396,
     402,   408,   414,   420,   426,   432,   438,   444,   450,   456,
     462,   468,   474,   481,   488,   495,   500,   505,   512,   517,
     525,   530,   535,   540,   545,   546,   550,   555,   563,   568,
     575,   582,   587,   592,   597,   602,   604,   606,   608,   610,
     612,   614,   616,   618,   620,   622,   623,   625,   629,   631,
     633,   638,   640,   642,   644,   646,   648,   650,   651,   654,
     656,   660,   662,   664,   666,   668,   670,   672,   674,   676,
     678,   680,   682,   684
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     102,     0,    -1,   104,    -1,   112,    -1,   119,    -1,   126,
      -1,   110,    -1,    81,     4,    -1,     4,    -1,   103,    -1,
     104,   103,    -1,   106,    -1,   105,   106,    -1,   152,   107,
       4,    -1,    81,     4,    -1,    86,    -1,    85,    -1,    -1,
     108,    83,   109,    -1,    61,    69,    -1,    -1,   171,    -1,
      -1,    70,   111,   105,    71,    -1,    -1,    23,    76,   113,
       4,   114,    24,    -1,   115,    -1,    -1,   116,    -1,   115,
     116,    -1,   117,    -1,   118,    -1,     4,    -1,    25,   163,
      76,     4,    -1,    26,    76,    76,     4,    -1,    -1,    -1,
      27,   120,    76,   136,     4,   121,   122,   125,    -1,    -1,
       4,    -1,   122,   123,     4,    -1,    -1,     5,   124,   163,
      76,    -1,   149,    57,    -1,    -1,    -1,    61,   127,    76,
     136,     4,   128,   129,   125,    -1,    -1,     4,    -1,   129,
     130,     4,    -1,    -1,     5,   131,   163,    76,    -1,    -1,
      58,   135,     4,   133,   138,   137,   134,   140,    59,     4,
      -1,    -1,   154,     4,    -1,    67,    -1,    68,    -1,    -1,
     135,    -1,    60,   176,    56,   176,     4,    -1,    60,   176,
       4,    -1,    66,   176,     4,    -1,    -1,   138,   139,     4,
      -1,     9,   176,    -1,    10,   169,    -1,    -1,   140,   141,
       4,    -1,    50,   169,    -1,    -1,    29,   142,   163,    76,
      -1,    -1,    62,     4,   144,   147,    63,     4,    -1,    -1,
      64,     4,   146,   147,    65,     4,    -1,    -1,   147,     4,
      -1,   147,   148,     4,    -1,    51,   176,    -1,   151,    -1,
     149,   151,    -1,    -1,   150,   155,    -1,    81,     4,    -1,
     132,    -1,   143,    -1,   145,    -1,    86,    -1,    85,    -1,
      -1,   153,    -1,   153,   154,    -1,   154,    -1,    69,    -1,
     152,   156,     4,    -1,   165,    -1,   167,    -1,    21,    76,
      -1,    22,    76,    -1,    -1,    29,   157,   163,    76,    -1,
      -1,    30,   158,   163,    76,    87,   183,    -1,    -1,    33,
     159,   163,    76,    87,   183,    -1,    -1,     5,   160,   163,
      76,    -1,     5,   182,    -1,    50,   176,    -1,     9,   176,
      -1,    51,   176,    -1,     7,   174,    -1,     8,   174,    -1,
      31,   176,    -1,    32,   176,    -1,    14,    -1,    15,    -1,
      13,    -1,    -1,    17,   161,   109,    -1,    83,   171,    -1,
      -1,    17,    -1,    18,    -1,    19,    -1,    20,    -1,    36,
      -1,    37,    -1,    38,    -1,   164,    -1,    76,    -1,   169,
      87,   176,    -1,   169,    87,    88,   176,    -1,   169,    87,
      89,   176,    -1,   169,    87,    90,   176,    -1,   169,    87,
     176,    91,   176,    -1,   169,    87,   176,    89,   176,    -1,
     169,    87,   176,    92,   176,    -1,   169,    87,   176,    52,
     176,    -1,   169,    87,   176,    93,   176,    -1,   169,    87,
     176,    94,   176,    -1,   169,    87,   176,    95,   176,    -1,
     169,    87,   176,    34,   176,    -1,   169,    87,   176,    35,
     176,    -1,   169,    87,   176,    53,   176,    -1,   169,    87,
     176,    54,   176,    -1,   169,    87,   176,    55,   176,    -1,
     169,    87,   176,    40,   176,    -1,   169,    87,   176,    96,
     176,    -1,   169,    87,   176,    97,   176,    -1,   169,    87,
     176,    90,   176,    -1,   169,    87,   176,    98,   177,    99,
      -1,   176,    98,   177,    99,    87,   176,    -1,   169,    87,
      16,   164,    56,   176,    -1,   169,    87,    16,   164,    -1,
     169,    87,   162,    76,    -1,   169,    87,   162,    76,    56,
      76,    -1,   169,    87,    39,   176,    -1,   169,    87,    39,
     176,    98,   177,    99,    -1,   169,    87,    49,   176,    -1,
     169,    87,    48,    76,    -1,   169,    87,    47,   184,    -1,
      47,   184,    87,   176,    -1,    -1,    16,   166,   109,    -1,
      39,   169,    56,   176,    -1,    39,   169,    56,   176,    98,
     177,    99,    -1,    49,   169,    56,   176,    -1,    11,   176,
     168,   176,     8,   174,    -1,    12,   176,   168,   176,     8,
     174,    -1,    11,   176,     8,   174,    -1,    12,   176,     8,
     174,    -1,    11,   176,    56,   174,    -1,    12,   176,    56,
     174,    -1,    41,    -1,    42,    -1,    43,    -1,    44,    -1,
      45,    -1,    46,    -1,    84,    -1,   182,    -1,    84,    -1,
     182,    -1,    -1,   172,    -1,   172,    56,   173,    -1,   173,
      -1,   175,    -1,   170,    98,   177,    99,    -1,    76,    -1,
      83,    -1,   174,    -1,   176,    -1,    84,    -1,   181,    -1,
      -1,   178,   179,    -1,   180,    -1,   179,   100,   180,    -1,
     176,    -1,   182,    -1,   183,    -1,    72,    -1,    73,    -1,
      74,    -1,    75,    -1,    80,    -1,    78,    -1,    79,    -1,
      77,    -1,    74,    -1,    77,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   262,   262,   266,   268,   269,   270,   271,   272,   275,
     276,   279,   280,   283,   284,   285,   286,   289,   289,   293,
     298,   301,   306,   305,   321,   319,   339,   341,   344,   346,
     349,   351,   352,   355,   370,   388,   393,   386,   403,   404,
     405,   408,   408,   412,   430,   432,   429,   442,   443,   444,
     447,   447,   451,   451,   479,   480,   483,   484,   487,   488,
     491,   495,   498,   504,   505,   508,   509,   512,   513,   516,
     517,   517,   520,   520,   537,   537,   555,   556,   557,   560,
     563,   564,   574,   577,   579,   580,   581,   582,   583,   584,
     587,   588,   591,   592,   595,   598,   602,   604,   605,   606,
     607,   607,   608,   608,   610,   610,   612,   612,   614,   615,
     616,   617,   618,   619,   620,   621,   622,   623,   624,   625,
     625,   627,   629,   632,   634,   635,   636,   639,   641,   642,
     643,   646,   650,   652,   653,   654,   655,   656,   657,   658,
     659,   660,   661,   662,   663,   664,   665,   666,   667,   668,
     669,   670,   671,   672,   673,   674,   675,   677,   684,   685,
     687,   688,   690,   691,   694,   694,   696,   697,   699,   702,
     704,   706,   707,   708,   709,   713,   715,   716,   717,   718,
     719,   723,   724,   726,   727,   730,   731,   734,   735,   738,
     739,   743,   745,   747,   749,   752,   753,   756,   756,   760,
     761,   764,   767,   768,   771,   772,   773,   774,   775,   778,
     779,   780,   783,   784
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
  "']'", "';'", "$accept", "program", "compilation_unit", 
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
  "classname", "assignment", "@19", "if_statement", "relop", "target", 
  "lhs", "vars", "_vars", "_var_or_i", "label_op", "var_or_i", "var", 
  "keylist", "@20", "_keylist", "key", "rc", "reg", "const", "string", 0
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
      59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   101,   102,   103,   103,   103,   103,   103,   103,   104,
     104,   105,   105,   106,   106,   106,   106,   108,   107,   107,
     107,   109,   111,   110,   113,   112,   114,   114,   115,   115,
     116,   116,   116,   117,   118,   120,   121,   119,   122,   122,
     122,   124,   123,   125,   127,   128,   126,   129,   129,   129,
     131,   130,   133,   132,   134,   134,   135,   135,   136,   136,
     137,   137,   137,   138,   138,   139,   139,   140,   140,   141,
     142,   141,   144,   143,   146,   145,   147,   147,   147,   148,
     149,   149,   150,   151,   151,   151,   151,   151,   151,   151,
     152,   152,   153,   153,   154,   155,   156,   156,   156,   156,
     157,   156,   158,   156,   159,   156,   160,   156,   156,   156,
     156,   156,   156,   156,   156,   156,   156,   156,   156,   161,
     156,   156,   156,   162,   162,   162,   162,   163,   163,   163,
     163,   164,   165,   165,   165,   165,   165,   165,   165,   165,
     165,   165,   165,   165,   165,   165,   165,   165,   165,   165,
     165,   165,   165,   165,   165,   165,   165,   165,   165,   165,
     165,   165,   165,   165,   166,   165,   165,   165,   165,   167,
     167,   167,   167,   167,   167,   168,   168,   168,   168,   168,
     168,   169,   169,   170,   170,   171,   171,   172,   172,   173,
     173,   174,   174,   175,   175,   176,   176,   178,   177,   179,
     179,   180,   181,   181,   182,   182,   182,   182,   182,   183,
     183,   183,   184,   184
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
       0,     1,     2,     1,     1,     3,     1,     1,     2,     2,
       0,     4,     0,     6,     0,     6,     0,     4,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     1,     1,     0,
       3,     2,     0,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     3,     4,     4,     4,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     6,     6,     6,     4,     4,     6,     4,     7,
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
       0,     8,     0,    35,    44,    22,     0,     0,     9,     2,
       6,     3,     4,     5,    24,     0,     0,    90,     7,     1,
      10,     0,    58,    58,    94,     0,    16,    15,    90,    11,
      17,    91,    93,    27,    56,    57,    59,     0,     0,    14,
      23,    12,     0,     0,     0,    92,    32,     0,     0,     0,
      26,    28,    30,    31,    36,    45,    19,    13,   185,   127,
     128,   129,   131,     0,   130,     0,    25,    29,    38,    47,
     204,   205,   206,   207,   191,   211,   209,   210,   208,   192,
     195,    18,     0,    21,   186,   188,   193,   189,   194,   196,
     202,   203,     0,     0,    39,    82,    48,    82,   197,     0,
      33,    34,    41,     0,     0,     0,     0,    89,    88,     0,
      37,    85,    86,    87,    82,    90,    80,    50,    46,     0,
       0,     0,   187,     0,     0,    72,    74,    84,    40,    43,
      81,   122,    83,     0,    49,   190,   195,   201,   198,   199,
     202,     0,    52,    76,    76,   106,     0,     0,     0,     0,
       0,   118,   116,   117,   164,   119,     0,     0,   100,   102,
       0,     0,   104,     0,     0,     0,     0,     0,   185,   181,
       0,    96,    97,     0,     0,   182,     0,     0,    42,    63,
       0,     0,     0,   108,   112,   113,   110,     0,     0,   185,
     185,    98,    99,     0,     0,   114,   115,     0,   181,     0,
     182,   212,   213,     0,     0,   109,   111,   121,    95,     0,
     197,    51,   200,     0,    77,     0,     0,     0,     0,     0,
       0,   175,   176,   177,   178,   179,   180,     0,     0,     0,
       0,     0,   165,   120,     0,     0,     0,     0,     0,     0,
       0,   123,   124,   125,   126,     0,     0,     0,     0,     0,
       0,     0,     0,   132,     0,     0,     0,     0,     0,    54,
       0,    79,    73,    78,    75,   107,   171,   173,     0,   172,
     174,     0,   101,     0,     0,   166,   163,   168,   155,   158,
     162,   161,   160,   133,   134,   135,   156,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   197,     0,    65,    66,     0,     0,    67,
       0,    64,     0,     0,     0,     0,   197,     0,   197,     0,
     143,   144,   148,   139,   145,   146,   147,   137,   151,   136,
     138,   140,   141,   142,   149,   150,     0,     0,    61,     0,
      62,     0,    55,   169,   170,   103,   105,     0,   154,     0,
     157,   152,   153,     0,    70,     0,     0,     0,   167,   159,
      60,     0,    69,    53,    68,     0,    71
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     7,     8,     9,    28,    29,    43,    44,    81,    10,
      17,    11,    21,    49,    50,    51,    52,    53,    12,    15,
      68,    95,   109,   123,   110,    13,    16,    69,    97,   119,
     133,   111,   179,   309,    36,    37,   259,   213,   260,   341,
     357,   361,   112,   143,   113,   144,   180,   217,   114,   115,
     116,    30,    31,    32,   132,   170,   193,   194,   197,   182,
     190,   252,    63,    64,   171,   189,   172,   228,   173,    82,
      83,    84,    85,    86,    87,    88,   120,   121,   138,   139,
      89,   140,    91,   203
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -238
static const short yypact[] =
{
      20,  -238,   -66,  -238,  -238,  -238,    18,    42,  -238,    20,
    -238,  -238,  -238,  -238,  -238,   -26,   -20,   167,  -238,  -238,
    -238,    55,   -19,   -19,  -238,    60,  -238,  -238,   223,  -238,
       8,    -3,  -238,    11,  -238,  -238,  -238,    75,    79,  -238,
    -238,  -238,    17,    85,    21,  -238,  -238,   -18,    15,    68,
      11,  -238,  -238,  -238,  -238,  -238,  -238,  -238,   275,  -238,
    -238,  -238,  -238,    19,  -238,    27,  -238,  -238,   108,   115,
    -238,  -238,  -238,  -238,  -238,  -238,  -238,  -238,  -238,  -238,
      16,  -238,    23,  -238,    64,  -238,  -238,  -238,  -238,  -238,
      28,  -238,   121,   123,  -238,    -1,  -238,    12,  -238,   275,
    -238,  -238,  -238,   -19,   124,   125,   133,  -238,  -238,   134,
    -238,  -238,  -238,  -238,   180,    -3,  -238,  -238,  -238,   135,
      51,   288,  -238,   -18,   137,  -238,  -238,  -238,  -238,  -238,
    -238,   196,  -238,   -18,  -238,  -238,  -238,  -238,    57,  -238,
    -238,    82,  -238,  -238,  -238,    88,   -62,   -62,   288,   288,
     288,  -238,  -238,  -238,  -238,  -238,    89,    91,  -238,  -238,
     288,   288,  -238,   301,   -47,   301,   288,   288,   275,    66,
     165,  -238,  -238,    83,    73,    90,   113,   288,  -238,  -238,
       4,     3,   -18,  -238,  -238,  -238,  -238,   103,   110,   275,
     275,  -238,  -238,   -18,   -18,  -238,  -238,   -18,  -238,   138,
    -238,  -238,  -238,   106,   140,  -238,  -238,  -238,  -238,   238,
    -238,  -238,  -238,    22,  -238,   288,   186,   193,   195,   130,
     -62,  -238,  -238,  -238,  -238,  -238,  -238,   -62,   288,   -62,
     -62,   288,  -238,  -238,   139,   143,   144,   288,   288,   288,
     145,  -238,  -238,  -238,  -238,   288,   -47,   147,   288,   288,
     288,   288,   155,   248,   101,   288,   301,   288,   288,    -3,
     210,  -238,  -238,  -238,  -238,  -238,  -238,  -238,   208,  -238,
    -238,   224,  -238,   146,   153,   136,  -238,  -238,   185,   151,
    -238,  -238,  -238,  -238,  -238,  -238,   194,   288,   288,   288,
     288,   288,   288,   288,   288,   288,   288,   288,   288,   288,
     288,   288,   288,  -238,   164,  -238,  -238,     9,   255,  -238,
     256,  -238,   -62,   -62,   -39,   -39,  -238,   288,  -238,   187,
    -238,  -238,  -238,  -238,  -238,  -238,  -238,  -238,  -238,  -238,
    -238,  -238,  -238,  -238,  -238,  -238,   163,   288,  -238,   288,
    -238,    -6,  -238,  -238,  -238,  -238,  -238,   168,  -238,   173,
    -238,  -238,  -238,   260,  -238,   301,   274,   277,  -238,  -238,
    -238,   -18,  -238,  -238,  -238,   213,  -238
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -238,  -238,   281,  -238,  -238,   263,  -238,  -238,  -161,  -238,
    -238,  -238,  -238,  -238,  -238,   234,  -238,  -238,  -238,  -238,
    -238,  -238,  -238,  -238,   198,  -238,  -238,  -238,  -238,  -238,
    -238,  -238,  -238,  -238,   190,   273,  -238,  -238,  -238,  -238,
    -238,  -238,  -238,  -238,  -238,  -238,   154,  -238,  -238,  -238,
     191,   184,  -238,   -29,  -238,  -238,  -238,  -238,  -238,  -238,
    -238,  -238,  -122,    67,  -238,  -238,  -238,   118,  -160,  -238,
     152,  -238,   215,  -121,  -238,  -115,  -201,  -238,  -238,   142,
    -238,   -58,  -237,    77
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -203
static const short yytable[] =
{
      90,   141,    45,   199,   102,   204,   137,   214,   214,   254,
      14,   176,   -20,   338,    74,    46,   174,   117,    59,    60,
      61,    79,    18,   354,     1,   184,   185,   201,   232,   233,
     202,   255,   256,   186,   187,   188,    47,    48,    75,    76,
      77,    90,    19,     2,   355,   195,   196,     3,    34,    35,
      22,   205,   206,   356,   215,   215,    23,   103,    62,    33,
     219,   104,   137,   105,    39,   339,    24,   216,   218,    42,
     103,   234,   235,   175,   104,   236,   105,   345,   346,    54,
     106,     4,   257,    55,   107,   108,    56,   183,   258,    57,
       5,    65,    66,   106,   253,    92,   306,   107,   108,   266,
     261,     6,   336,    93,    58,   200,   267,   200,   269,   270,
      90,   220,    94,   268,  -183,   347,   271,   349,   229,    96,
      99,    98,   275,   276,   277,   100,  -184,   101,   125,   126,
     279,    90,    90,   282,   283,   284,   285,   127,   128,   134,
     305,   142,   307,   308,   221,   222,   223,   224,   225,   226,
     135,   221,   222,   223,   224,   225,   226,   177,   178,   227,
      70,    71,    72,    73,  -195,   191,   230,   192,    78,   208,
     209,   210,   320,   321,   322,   323,   324,   325,   326,   327,
     328,   329,   330,   331,   332,   333,   334,   335,  -202,   211,
     262,   343,   344,   238,   237,   362,   239,   263,   200,   264,
     304,   145,   348,   146,   147,   148,   265,   149,   150,   151,
     152,   153,   154,   155,   311,   272,   312,   156,   157,   273,
     274,    62,   352,   281,   353,   158,   159,   160,   161,   162,
     310,   286,   313,   314,   316,   163,    24,   129,   103,   365,
     315,   317,   104,   164,   105,   165,   166,   167,    25,   318,
     319,   337,    26,    27,   240,   241,   242,   243,   244,   340,
     342,   106,   351,   350,   360,   107,   108,   358,    70,    71,
      72,    73,   359,    75,    76,    77,    78,   245,   363,   168,
     169,   364,   287,   288,    67,   246,   247,   248,   289,   366,
      20,    41,    24,   124,    40,   118,    38,   200,   181,   131,
     290,   291,   292,   293,    25,   130,   231,   278,    26,    27,
      70,    71,    72,    73,   122,    75,    76,    77,    78,   212,
     207,     0,   136,   280,     0,     0,   249,   250,   251,     0,
       0,     0,     0,     0,     0,     0,     0,   294,   295,   296,
     297,   298,   299,   300,   301,   302,   303,    70,    71,    72,
      73,    74,    75,    76,    77,    78,     0,     0,    79,    80,
      70,    71,    72,    73,     0,    75,    76,    77,    78,     0,
       0,     0,   136,    70,    71,    72,    73,     0,     0,     0,
       0,    78,     0,     0,     0,   198
};

static const short yycheck[] =
{
      58,   123,    31,   163,     5,   165,   121,     4,     4,   210,
      76,   133,     4,     4,    76,     4,   131,     5,    36,    37,
      38,    83,     4,    29,     4,   146,   147,    74,   189,   190,
      77,     9,    10,   148,   149,   150,    25,    26,    77,    78,
      79,    99,     0,    23,    50,   160,   161,    27,    67,    68,
      76,   166,   167,    59,    51,    51,    76,    58,    76,     4,
     182,    62,   177,    64,     4,    56,    69,    63,    65,    61,
      58,   193,   194,   131,    62,   197,    64,   314,   315,     4,
      81,    61,    60,     4,    85,    86,    69,   145,    66,     4,
      70,    76,    24,    81,   209,    76,   256,    85,    86,   220,
     215,    81,   303,    76,    83,   163,   227,   165,   229,   230,
     168,     8,     4,   228,    98,   316,   231,   318,     8,     4,
      56,    98,   237,   238,   239,     4,    98,     4,     4,     4,
     245,   189,   190,   248,   249,   250,   251,     4,     4,     4,
     255,     4,   257,   258,    41,    42,    43,    44,    45,    46,
      99,    41,    42,    43,    44,    45,    46,   100,    76,    56,
      72,    73,    74,    75,    98,    76,    56,    76,    80,     4,
      87,    98,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,    98,    76,
       4,   312,   313,    87,    56,   355,    56,     4,   256,     4,
      99,     5,   317,     7,     8,     9,    76,    11,    12,    13,
      14,    15,    16,    17,     4,    76,     8,    21,    22,    76,
      76,    76,   337,    76,   339,    29,    30,    31,    32,    33,
     259,    76,     8,    87,    98,    39,    69,    57,    58,   361,
      87,    56,    62,    47,    64,    49,    50,    51,    81,    98,
      56,    87,    85,    86,    16,    17,    18,    19,    20,     4,
       4,    81,    99,    76,     4,    85,    86,    99,    72,    73,
      74,    75,    99,    77,    78,    79,    80,    39,     4,    83,
      84,     4,    34,    35,    50,    47,    48,    49,    40,    76,
       9,    28,    69,   103,    71,    97,    23,   355,   144,   115,
      52,    53,    54,    55,    81,   114,   188,   240,    85,    86,
      72,    73,    74,    75,    99,    77,    78,    79,    80,   177,
     168,    -1,    84,   246,    -1,    -1,    88,    89,    90,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    89,    90,    91,
      92,    93,    94,    95,    96,    97,    98,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    -1,    -1,    83,    84,
      72,    73,    74,    75,    -1,    77,    78,    79,    80,    -1,
      -1,    -1,    84,    72,    73,    74,    75,    -1,    -1,    -1,
      -1,    80,    -1,    -1,    -1,    84
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    23,    27,    61,    70,    81,   102,   103,   104,
     110,   112,   119,   126,    76,   120,   127,   111,     4,     0,
     103,   113,    76,    76,    69,    81,    85,    86,   105,   106,
     152,   153,   154,     4,    67,    68,   135,   136,   136,     4,
      71,   106,    61,   107,   108,   154,     4,    25,    26,   114,
     115,   116,   117,   118,     4,     4,    69,     4,    83,    36,
      37,    38,    76,   163,   164,    76,    24,   116,   121,   128,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    83,
      84,   109,   170,   171,   172,   173,   174,   175,   176,   181,
     182,   183,    76,    76,     4,   122,     4,   129,    98,    56,
       4,     4,     5,    58,    62,    64,    81,    85,    86,   123,
     125,   132,   143,   145,   149,   150,   151,     5,   125,   130,
     177,   178,   173,   124,   135,     4,     4,     4,     4,    57,
     151,   152,   155,   131,     4,    99,    84,   176,   179,   180,
     182,   163,     4,   144,   146,     5,     7,     8,     9,    11,
      12,    13,    14,    15,    16,    17,    21,    22,    29,    30,
      31,    32,    33,    39,    47,    49,    50,    51,    83,    84,
     156,   165,   167,   169,   176,   182,   163,   100,    76,   133,
     147,   147,   160,   182,   174,   174,   176,   176,   176,   166,
     161,    76,    76,   157,   158,   176,   176,   159,    84,   169,
     182,    74,    77,   184,   169,   176,   176,   171,     4,    87,
      98,    76,   180,   138,     4,    51,    63,   148,    65,   163,
       8,    41,    42,    43,    44,    45,    46,    56,   168,     8,
      56,   168,   109,   109,   163,   163,   163,    56,    87,    56,
      16,    17,    18,    19,    20,    39,    47,    48,    49,    88,
      89,    90,   162,   176,   177,     9,    10,    60,    66,   137,
     139,   176,     4,     4,     4,    76,   174,   174,   176,   174,
     174,   176,    76,    76,    76,   176,   176,   176,   164,   176,
     184,    76,   176,   176,   176,   176,    76,    34,    35,    40,
      52,    53,    54,    55,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   176,   169,   176,   176,   134,
     154,     4,     8,     8,    87,    87,    98,    56,    98,    56,
     176,   176,   176,   176,   176,   176,   176,   176,   176,   176,
     176,   176,   176,   176,   176,   176,   177,    87,     4,    56,
       4,   140,     4,   174,   174,   183,   183,   177,   176,   177,
      76,    99,   176,   176,    29,    50,    59,   141,    99,    99,
       4,   142,   169,     4,     4,   163,    76
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
#line 263 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 3:
#line 267 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 4:
#line 268 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 5:
#line 269 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 6:
#line 270 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 7:
#line 271 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 8:
#line 272 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 283 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 284 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 285 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 286 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 17:
#line 289 "imcc/imcc.y"
    {clear_state();}
    break;

  case 18:
#line 290 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit,
                                              yyvsp[-1].s,0,regs,nargs,keyvec,1);
                                          free(yyvsp[-1].s); }
    break;

  case 19:
#line 293 "imcc/imcc.y"
    {
                                   char *name = str_dup(yyvsp[0].s);
                                   yyval.i = iSUBROUTINE(cur_unit, mk_address(yyvsp[0].s, U_add_uniq_sub));
                                   yyval.i->r[1] = mk_pcc_sub(name, 0);
                                 }
    break;

  case 20:
#line 298 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 22:
#line 306 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                                   function = "(emit)";
                                 }
    break;

  case 23:
#line 310 "imcc/imcc.y"
    { /*
                                   if (optimizer_level & OPT_PASM)
                                      imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                                   emit_flush(interp);
                                   */
                                   yyval.i=0;
                                 }
    break;

  case 24:
#line 321 "imcc/imcc.y"
    { 
           Symbol * sym = new_symbol(yyvsp[0].s);

           cur_unit = imc_open_unit(interp, IMC_CLASS);

           current_class = new_class(sym);
           sym->p = (void*)current_class;
           store_symbol(&global_sym_tab, sym);
        }
    break;

  case 25:
#line 331 "imcc/imcc.y"
    {
           /* Do nothing for now. Need to parse metadata for
            * PBC creation. */
           current_class = NULL;
           yyval.i = 0;
        }
    break;

  case 27:
#line 341 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 32:
#line 352 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 33:
#line 357 "imcc/imcc.y"
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
#line 372 "imcc/imcc.y"
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
#line 388 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 36:
#line 393 "imcc/imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(cur_unit, mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 37:
#line 400 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 38:
#line 403 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 39:
#line 404 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 40:
#line 405 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 41:
#line 408 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 42:
#line 409 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 43:
#line 414 "imcc/imcc.y"
    {
          yyval.i = 0;
        }
    break;

  case 44:
#line 430 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 45:
#line 432 "imcc/imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(cur_unit, mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 46:
#line 439 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 47:
#line 442 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 48:
#line 443 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 49:
#line 444 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 50:
#line 447 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 51:
#line 448 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 52:
#line 451 "imcc/imcc.y"
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
#line 476 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 54:
#line 479 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-2].sr ->pcc_sub->label = 0; }
    break;

  case 55:
#line 480 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-4].sr ->pcc_sub->label = 1; }
    break;

  case 56:
#line 483 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 57:
#line 484 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 58:
#line 487 "imcc/imcc.y"
    { yyval.t = -1; }
    break;

  case 60:
#line 491 "imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 61:
#line 495 "imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 62:
#line 498 "imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
                  yyvsp[-4].sr ->pcc_sub->nci = 1;
              }
    break;

  case 63:
#line 504 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 64:
#line 505 "imcc/imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 65:
#line 508 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 66:
#line 509 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 67:
#line 512 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 68:
#line 513 "imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 69:
#line 516 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 70:
#line 517 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 71:
#line 517 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 72:
#line 520 "imcc/imcc.y"
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
#line 534 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 74:
#line 537 "imcc/imcc.y"
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
#line 552 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 76:
#line 555 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 77:
#line 556 "imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 78:
#line 557 "imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 79:
#line 560 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 82:
#line 574 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 83:
#line 578 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 84:
#line 579 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 85:
#line 580 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 88:
#line 583 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 89:
#line 584 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 90:
#line 587 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 94:
#line 595 "imcc/imcc.y"
    { yyval.i = iLABEL(cur_unit, mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 95:
#line 599 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 98:
#line 605 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 99:
#line 606 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 100:
#line 607 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 101:
#line 607 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 102:
#line 608 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 103:
#line 609 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 104:
#line 610 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 105:
#line 611 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 106:
#line 612 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 107:
#line 612 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 108:
#line 614 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 109:
#line 615 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 110:
#line 616 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 111:
#line 617 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 112:
#line 618 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 113:
#line 619 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 114:
#line 620 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "inc",1, yyvsp[0].sr); }
    break;

  case 115:
#line 621 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "dec",1, yyvsp[0].sr); }
    break;

  case 116:
#line 622 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "saveall" ,0); }
    break;

  case 117:
#line 623 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restoreall" ,0); }
    break;

  case 118:
#line 624 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "end" ,0); }
    break;

  case 119:
#line 625 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 120:
#line 626 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 121:
#line 627 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 122:
#line 629 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 123:
#line 633 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 124:
#line 634 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 125:
#line 635 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 126:
#line 636 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 127:
#line 640 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 128:
#line 641 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 129:
#line 642 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 130:
#line 643 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 132:
#line 651 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 133:
#line 652 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 134:
#line 653 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 135:
#line 654 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 136:
#line 655 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 137:
#line 656 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 138:
#line 657 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 139:
#line 658 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 140:
#line 659 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 141:
#line 660 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 142:
#line 661 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 143:
#line 662 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 144:
#line 663 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 145:
#line 664 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 146:
#line 665 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 147:
#line 666 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 148:
#line 667 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 149:
#line 668 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 150:
#line 669 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 151:
#line 670 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 152:
#line 671 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 153:
#line 672 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 154:
#line 673 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 155:
#line 674 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 156:
#line 675 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                                 mk_address(yyvsp[0].s, U_add_once), NULL, 1); }
    break;

  case 157:
#line 678 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                                           * to use  instead of implicit P0
                                           */
                                          yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                                 mk_address(yyvsp[-2].s, U_add_once),
                                                 mk_address(yyvsp[0].s, U_add_once), 1); }
    break;

  case 158:
#line 684 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 159:
#line 685 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, cur_unit, "defined", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 160:
#line 687 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone",2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 161:
#line 688 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                          2, yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once)); }
    break;

  case 162:
#line 690 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 163:
#line 691 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 164:
#line 694 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 165:
#line 695 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "new",0,regs,nargs,keyvec,1); }
    break;

  case 166:
#line 696 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 167:
#line 697 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                                  yyval.i = MK_I(interp, cur_unit, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 168:
#line 699 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 169:
#line 703 "imcc/imcc.y"
    {yyval.i=MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 170:
#line 704 "imcc/imcc.y"
    {yyval.i=MK_I(interp, cur_unit, inv_op(yyvsp[-3].s),
                                            3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 171:
#line 706 "imcc/imcc.y"
    {yyval.i= MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 172:
#line 707 "imcc/imcc.y"
    {yyval.i= MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 173:
#line 708 "imcc/imcc.y"
    {yyval.i= MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 174:
#line 709 "imcc/imcc.y"
    {yyval.i= MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 175:
#line 714 "imcc/imcc.y"
    { yyval.s = "eq"; }
    break;

  case 176:
#line 715 "imcc/imcc.y"
    { yyval.s = "ne"; }
    break;

  case 177:
#line 716 "imcc/imcc.y"
    { yyval.s = "gt"; }
    break;

  case 178:
#line 717 "imcc/imcc.y"
    { yyval.s = "ge"; }
    break;

  case 179:
#line 718 "imcc/imcc.y"
    { yyval.s = "lt"; }
    break;

  case 180:
#line 719 "imcc/imcc.y"
    { yyval.s = "le"; }
    break;

  case 185:
#line 730 "imcc/imcc.y"
    { yyval.sr = NULL; }
    break;

  case 186:
#line 731 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 187:
#line 734 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 189:
#line 738 "imcc/imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 190:
#line 739 "imcc/imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 191:
#line 744 "imcc/imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 192:
#line 745 "imcc/imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 197:
#line 756 "imcc/imcc.y"
    { nkeys=0; }
    break;

  case 198:
#line 757 "imcc/imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 199:
#line 760 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 200:
#line 761 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 204:
#line 771 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 205:
#line 772 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 206:
#line 773 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 207:
#line 774 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 208:
#line 775 "imcc/imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 209:
#line 778 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 210:
#line 779 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 211:
#line 780 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 212:
#line 783 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 213:
#line 784 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/local/share/bison/yacc.c.  */
#line 2704 "imcc/imcparser.c"

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


#line 788 "imcc/imcc.y"



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

