/* A Bison parser, made from imcc.y
   by GNU bison 1.35.  */

#define YYBISON 1  /* Identify Bison output.  */

# define	LOW_PREC	257
# define	CALL	258
# define	GOTO	259
# define	ARG	260
# define	FLATTEN_ARG	261
# define	IF	262
# define	UNLESS	263
# define	NEW	264
# define	END	265
# define	SAVEALL	266
# define	RESTOREALL	267
# define	SUB	268
# define	NAMESPACE	269
# define	ENDNAMESPACE	270
# define	CLASS	271
# define	ENDCLASS	272
# define	SYM	273
# define	LOCAL	274
# define	CONST	275
# define	PARAM	276
# define	INC	277
# define	DEC	278
# define	GLOBAL_CONST	279
# define	SHIFT_LEFT	280
# define	SHIFT_RIGHT	281
# define	INTV	282
# define	FLOATV	283
# define	STRINGV	284
# define	DEFINED	285
# define	LOG_XOR	286
# define	RELOP_EQ	287
# define	RELOP_NE	288
# define	RELOP_GT	289
# define	RELOP_GTE	290
# define	RELOP_LT	291
# define	RELOP_LTE	292
# define	GLOBAL	293
# define	ADDR	294
# define	CLONE	295
# define	RESULT	296
# define	RETURN	297
# define	POW	298
# define	SHIFT_RIGHT_U	299
# define	LOG_AND	300
# define	LOG_OR	301
# define	COMMA	302
# define	ESUB	303
# define	PCC_BEGIN	304
# define	PCC_END	305
# define	PCC_CALL	306
# define	PCC_SUB	307
# define	PCC_BEGIN_RETURN	308
# define	PCC_END_RETURN	309
# define	PCC_BEGIN_YIELD	310
# define	PCC_END_YIELD	311
# define	PROTOTYPED	312
# define	NON_PROTOTYPED	313
# define	LABEL	314
# define	EMIT	315
# define	EOM	316
# define	IREG	317
# define	NREG	318
# define	SREG	319
# define	PREG	320
# define	IDENTIFIER	321
# define	STRINGC	322
# define	INTC	323
# define	FLOATC	324
# define	REG	325
# define	MACRO	326
# define	ENDM	327
# define	PARROT_OP	328
# define	VAR	329
# define	LINECOMMENT	330
# define	FILECOMMENT	331

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
 * substr or X = P[key]
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
 * substr or P[key] = X
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


#line 191 "imcc.y"
#ifndef YYSTYPE
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
# define YYSTYPE yystype
# define YYSTYPE_IS_TRIVIAL 1
#endif
#ifndef YYDEBUG
# define YYDEBUG 0
#endif



#define	YYFINAL		321
#define	YYFLAG		-32768
#define	YYNTBASE	93

/* YYTRANSLATE(YYLEX) -- Bison token number corresponding to YYLEX. */
#define YYTRANSLATE(x) ((unsigned)(x) <= 331 ? yytranslate[x] : 164)

/* YYTRANSLATE[YYLEX] -- Bison token number corresponding to YYLEX. */
static const char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    80,     2,     2,     2,    86,    88,     2,
       2,     2,    84,    83,     2,    81,    87,    85,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    92,
       2,    79,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    90,     2,    91,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    89,     2,    82,     2,     2,     2,
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
       2,     2,     2,     2,     2,     2,     1,     3,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78
};

#if YYDEBUG
static const short yyprhs[] =
{
       0,     0,     1,     4,     6,     8,    10,    12,    14,    17,
      19,    22,    26,    29,    31,    33,    34,    38,    41,    42,
      44,    45,    50,    53,    56,    57,    62,    63,    64,    73,
      74,    76,    80,    81,    86,    87,    99,   101,   103,   104,
     106,   112,   116,   117,   121,   124,   127,   128,   132,   135,
     136,   141,   142,   149,   150,   157,   158,   161,   165,   168,
     170,   173,   174,   177,   180,   182,   184,   186,   188,   190,
     191,   193,   196,   198,   200,   204,   206,   208,   211,   214,
     215,   220,   221,   228,   229,   236,   237,   242,   245,   248,
     251,   254,   257,   260,   263,   266,   268,   270,   272,   275,
     276,   278,   280,   282,   284,   286,   290,   295,   300,   305,
     311,   317,   323,   329,   335,   341,   347,   353,   359,   365,
     371,   377,   383,   389,   395,   401,   408,   415,   422,   427,
     432,   440,   445,   450,   455,   460,   461,   465,   470,   478,
     483,   490,   497,   502,   507,   512,   517,   519,   521,   523,
     525,   527,   529,   531,   533,   535,   537,   538,   540,   544,
     546,   548,   553,   555,   557,   559,   561,   563,   565,   566,
     569,   571,   575,   577,   579,   581,   583,   585,   587,   589,
     591,   593,   595,   597,   599
};
static const short yyrhs[] =
{
      -1,    94,    96,     0,   104,     0,   108,     0,   102,     0,
       4,     0,    95,     0,    96,    95,     0,    98,     0,    97,
      98,     0,   133,    99,     4,     0,    73,     4,     0,    78,
       0,    77,     0,     0,   100,    75,   101,     0,    54,    61,
       0,     0,   150,     0,     0,    62,   103,    97,    63,     0,
     106,   105,     0,   130,    50,     0,     0,    15,   107,    68,
       4,     0,     0,     0,    54,   109,    68,   117,     4,   110,
     111,   105,     0,     0,     4,     0,   111,   112,     4,     0,
       0,    23,   113,   142,    68,     0,     0,    51,   116,     4,
     115,   119,   118,   135,     4,   121,    52,     4,     0,    59,
       0,    60,     0,     0,   116,     0,    53,   155,    49,   155,
       4,     0,    53,   155,     4,     0,     0,   119,   120,     4,
       0,     7,   155,     0,     8,   148,     0,     0,   121,   122,
       4,     0,    43,   148,     0,     0,    21,   123,   142,    68,
       0,     0,    55,     4,   125,   128,    56,     4,     0,     0,
      57,     4,   127,   128,    58,     4,     0,     0,   128,     4,
       0,   128,   129,     4,     0,    44,   155,     0,   132,     0,
     130,   132,     0,     0,   131,   136,     0,    73,     4,     0,
     114,     0,   124,     0,   126,     0,    78,     0,    77,     0,
       0,   134,     0,   134,   135,     0,   135,     0,    61,     0,
     133,   137,     4,     0,   144,     0,   146,     0,    16,    68,
       0,    17,    68,     0,     0,    21,   138,   142,    68,     0,
       0,    22,   139,   142,    68,    79,   162,     0,     0,    26,
     140,   142,    68,    79,   162,     0,     0,    23,   141,   142,
      68,     0,    23,   161,     0,    43,   155,     0,     7,   155,
       0,    44,   155,     0,     5,   153,     0,     6,   153,     0,
      24,   155,     0,    25,   155,     0,    13,     0,    14,     0,
      12,     0,    75,   150,     0,     0,    29,     0,    30,     0,
      31,     0,   143,     0,    68,     0,   148,    79,   155,     0,
     148,    79,    80,   155,     0,   148,    79,    81,   155,     0,
     148,    79,    82,   155,     0,   148,    79,   155,    83,   155,
       0,   148,    79,   155,    81,   155,     0,   148,    79,   155,
      84,   155,     0,   148,    79,   155,    45,   155,     0,   148,
      79,   155,    85,   155,     0,   148,    79,   155,    86,   155,
       0,   148,    79,   155,    87,   155,     0,   148,    79,   155,
      27,   155,     0,   148,    79,   155,    28,   155,     0,   148,
      79,   155,    46,   155,     0,   148,    79,   155,    47,   155,
       0,   148,    79,   155,    48,   155,     0,   148,    79,   155,
      33,   155,     0,   148,    79,   155,    88,   155,     0,   148,
      79,   155,    89,   155,     0,   148,    79,   155,    82,   155,
       0,   148,    79,   155,    90,   156,    91,     0,   155,    90,
     156,    91,    79,   155,     0,   148,    79,    11,   143,    49,
     155,     0,   148,    79,    11,   143,     0,   148,    79,    32,
     155,     0,   148,    79,    32,   155,    90,   156,    91,     0,
     148,    79,    42,   155,     0,   148,    79,    41,    68,     0,
     148,    79,    40,   163,     0,    40,   163,    79,   155,     0,
       0,    11,   145,   101,     0,    32,   148,    49,   155,     0,
      32,   148,    49,   155,    90,   156,    91,     0,    42,   148,
      49,   155,     0,     9,   155,   147,   155,     6,   153,     0,
      10,   155,   147,   155,     6,   153,     0,     9,   155,     6,
     153,     0,    10,   155,     6,   153,     0,     9,   155,    49,
     153,     0,    10,   155,    49,   153,     0,    34,     0,    35,
       0,    36,     0,    37,     0,    38,     0,    39,     0,    76,
       0,   161,     0,    76,     0,   161,     0,     0,   151,     0,
     151,    49,   152,     0,   152,     0,   154,     0,   149,    90,
     156,    91,     0,    68,     0,    75,     0,   153,     0,   155,
       0,    76,     0,   160,     0,     0,   157,   158,     0,   159,
       0,   158,    92,   159,     0,   155,     0,   161,     0,   162,
       0,    64,     0,    65,     0,    66,     0,    67,     0,    72,
       0,    70,     0,    71,     0,    69,     0,    66,     0,    69,
       0
};

#endif

#if YYDEBUG
/* YYRLINE[YYN] -- source line where rule number YYN was defined. */
static const short yyrline[] =
{
       0,   239,   239,   243,   244,   245,   246,   249,   250,   254,
     255,   258,   259,   260,   261,   264,   264,   267,   273,   275,
     279,   279,   288,   292,   301,   301,   307,   307,   307,   319,
     320,   321,   324,   324,   328,   328,   357,   358,   361,   362,
     365,   369,   374,   375,   378,   379,   382,   383,   386,   387,
     387,   390,   390,   406,   406,   423,   424,   425,   428,   431,
     432,   442,   445,   447,   448,   449,   450,   451,   452,   455,
     456,   459,   460,   463,   466,   469,   471,   472,   473,   474,
     474,   475,   475,   477,   477,   479,   479,   481,   482,   483,
     484,   485,   486,   487,   488,   489,   490,   491,   492,   494,
     497,   499,   500,   501,   504,   508,   510,   511,   512,   513,
     514,   515,   516,   517,   518,   519,   520,   521,   522,   523,
     524,   525,   526,   527,   528,   529,   530,   531,   532,   533,
     534,   536,   538,   540,   541,   542,   542,   544,   545,   547,
     550,   552,   554,   555,   556,   557,   561,   563,   564,   565,
     566,   567,   571,   572,   574,   575,   578,   579,   582,   583,
     586,   587,   591,   593,   595,   597,   600,   601,   604,   604,
     608,   609,   612,   615,   616,   619,   620,   621,   622,   623,
     626,   627,   628,   631,   632
};
#endif


#if (YYDEBUG) || defined YYERROR_VERBOSE

/* YYTNAME[TOKEN_NUM] -- String name of the token TOKEN_NUM. */
static const char *const yytname[] =
{
  "$", "error", "$undefined.", "LOW_PREC", "'\\n'", "CALL", "GOTO", "ARG", 
  "FLATTEN_ARG", "IF", "UNLESS", "NEW", "END", "SAVEALL", "RESTOREALL", 
  "SUB", "NAMESPACE", "ENDNAMESPACE", "CLASS", "ENDCLASS", "SYM", "LOCAL", 
  "CONST", "PARAM", "INC", "DEC", "GLOBAL_CONST", "SHIFT_LEFT", 
  "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "DEFINED", "LOG_XOR", 
  "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", 
  "RELOP_LTE", "GLOBAL", "ADDR", "CLONE", "RESULT", "RETURN", "POW", 
  "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", "PCC_BEGIN", 
  "PCC_END", "PCC_CALL", "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN", 
  "PCC_BEGIN_YIELD", "PCC_END_YIELD", "PROTOTYPED", "NON_PROTOTYPED", 
  "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", 
  "STRINGC", "INTC", "FLOATC", "REG", "MACRO", "ENDM", "PARROT_OP", "VAR", 
  "LINECOMMENT", "FILECOMMENT", "'='", "'!'", "'-'", "'~'", "'+'", "'*'", 
  "'/'", "'%'", "'.'", "'&'", "'|'", "'['", "']'", "';'", "program", "@1", 
  "compilation_unit", "compilation_units", "pasmcode", "pasmline", 
  "pasm_inst", "@2", "pasm_args", "emit", "@3", "sub", "sub_body", 
  "sub_start", "@4", "pcc_sub", "@5", "@6", "pcc_params", "pcc_param", 
  "@7", "pcc_sub_call", "@8", "pcc_proto", "pcc_sub_proto", "pcc_call", 
  "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@9", "pcc_ret", 
  "@10", "pcc_yield", "@11", "pcc_returns", "pcc_return", "statements", 
  "helper_clear_state", "statement", "labels", "_labels", "label", 
  "instruction", "labeled_inst", "@12", "@13", "@14", "@15", "type", 
  "classname", "assignment", "@16", "if_statement", "relop", "target", 
  "lhs", "vars", "_vars", "_var_or_i", "label_op", "var_or_i", "var", 
  "keylist", "@17", "_keylist", "key", "rc", "reg", "const", "string", 0
};
#endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives. */
static const short yyr1[] =
{
       0,    94,    93,    95,    95,    95,    95,    96,    96,    97,
      97,    98,    98,    98,    98,   100,    99,    99,    99,   101,
     103,   102,   104,   105,   107,   106,   109,   110,   108,   111,
     111,   111,   113,   112,   115,   114,   116,   116,   117,   117,
     118,   118,   119,   119,   120,   120,   121,   121,   122,   123,
     122,   125,   124,   127,   126,   128,   128,   128,   129,   130,
     130,   131,   132,   132,   132,   132,   132,   132,   132,   133,
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

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN. */
static const short yyr2[] =
{
       0,     0,     2,     1,     1,     1,     1,     1,     2,     1,
       2,     3,     2,     1,     1,     0,     3,     2,     0,     1,
       0,     4,     2,     2,     0,     4,     0,     0,     8,     0,
       1,     3,     0,     4,     0,    11,     1,     1,     0,     1,
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

/* YYDEFACT[S] -- default rule to reduce with in state S when YYTABLE
   doesn't specify something else to do.  Zero means the default is an
   error. */
static const short yydefact[] =
{
       1,     0,     6,    24,    26,    20,     7,     2,     5,     3,
      61,     4,     0,     0,    69,     8,     0,     0,     0,     0,
      68,    67,    22,    64,    65,    66,    61,    69,    59,     0,
      38,    73,     0,    14,    13,    69,     9,    15,    70,    72,
      36,    37,     0,    51,    53,    63,    23,    60,    99,    62,
      25,    39,     0,    12,    21,    10,     0,     0,     0,    71,
      34,    55,    55,     0,     0,     0,     0,     0,   135,    97,
      95,    96,     0,     0,    79,    81,    85,     0,     0,    83,
       0,     0,     0,     0,     0,   175,   176,   177,   178,   182,
     180,   181,   179,   156,   152,     0,    75,    76,     0,     0,
     167,   153,   174,    27,    17,    11,   156,    42,     0,     0,
     162,   163,    91,    92,   166,    89,   173,     0,     0,   156,
      77,    78,     0,     0,     0,    87,    93,    94,     0,   152,
       0,   153,   183,   184,     0,     0,    88,    90,   166,     0,
      98,   157,   159,   164,   160,   165,   173,    74,     0,   168,
      29,    16,    19,     0,    56,     0,     0,     0,     0,     0,
     146,   147,   148,   149,   150,   151,     0,     0,     0,     0,
       0,   136,   100,   101,   102,   104,     0,   103,     0,     0,
       0,     0,     0,     0,   168,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   105,     0,     0,    30,    61,     0,
       0,     0,     0,     0,    58,    52,    57,    54,   142,   144,
       0,   143,   145,     0,    80,     0,    86,     0,   137,   134,
     139,     0,   158,   128,   129,   133,   132,   131,   106,   107,
     108,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   168,     0,   172,
     169,   170,    32,    28,     0,    44,    45,     0,     0,    43,
       0,     0,     0,     0,   168,   161,     0,   168,   116,   117,
     121,   112,   118,   119,   120,   110,   124,   109,   111,   113,
     114,   115,   122,   123,     0,     0,     0,     0,    31,    41,
       0,    46,   140,   141,    82,    84,     0,   127,     0,   125,
     126,   171,     0,     0,     0,   138,   130,    33,    40,    49,
       0,     0,     0,     0,    48,    35,    47,     0,    50,     0,
       0,     0
};

static const short yydefgoto[] =
{
     319,     1,     6,     7,    35,    36,    57,    58,   151,     8,
      14,     9,    22,    10,    12,    11,    13,   150,   198,   254,
     287,    23,   107,    42,    52,   202,   153,   203,   304,   312,
     313,    24,    61,    25,    62,   108,   157,    26,    27,    28,
      37,    38,    39,    49,    95,   122,   123,   128,   124,   176,
     177,    96,   119,    97,   167,    98,   139,   152,   141,   142,
     143,   144,   145,   195,   196,   250,   251,   100,   116,   102,
     134
};

static const short yypact[] =
{
  -32768,     3,-32768,-32768,-32768,-32768,-32768,     3,-32768,-32768,
     107,-32768,   -56,   -51,    92,-32768,   -13,    23,    27,    29,
  -32768,-32768,-32768,-32768,-32768,-32768,    69,   -23,-32768,    36,
     -13,-32768,    40,-32768,-32768,    12,-32768,     1,   -23,-32768,
  -32768,-32768,    45,-32768,-32768,-32768,-32768,-32768,   244,-32768,
  -32768,-32768,    57,-32768,-32768,-32768,    -8,    62,     8,-32768,
  -32768,-32768,-32768,   -38,   -38,   156,   156,   156,-32768,-32768,
  -32768,-32768,    18,    20,-32768,-32768,   233,   156,   156,-32768,
     207,   -40,   207,   156,   156,-32768,-32768,-32768,-32768,-32768,
  -32768,-32768,-32768,   170,   -16,    87,-32768,-32768,    17,    13,
  -32768,    21,-32768,-32768,-32768,-32768,   170,-32768,     7,     4,
  -32768,-32768,-32768,-32768,-32768,-32768,-32768,    95,   257,   170,
  -32768,-32768,    49,    49,    49,-32768,-32768,-32768,    49,-32768,
      53,-32768,-32768,-32768,    37,    58,-32768,-32768,    32,    33,
  -32768,    78,-32768,-32768,-32768,-32768,    46,-32768,    28,-32768,
     114,-32768,-32768,     6,-32768,   156,   131,   134,   139,   -38,
  -32768,-32768,-32768,-32768,-32768,-32768,   -38,   156,   -38,   -38,
     156,-32768,-32768,-32768,-32768,-32768,    99,-32768,   100,   103,
     104,   156,   156,   156,-32768,   170,   109,   156,   -40,   110,
     156,   156,   156,   156,   128,    72,   156,-32768,    -1,   156,
     207,   156,   -23,   182,-32768,-32768,-32768,-32768,-32768,-32768,
     154,-32768,-32768,   181,-32768,   129,-32768,   140,    98,-32768,
  -32768,   138,-32768,   184,   157,-32768,-32768,-32768,-32768,-32768,
  -32768,   156,   156,   156,   156,   156,   156,   156,   156,   156,
     156,   156,   156,   156,   156,   156,   156,-32768,   151,-32768,
     160,-32768,-32768,-32768,   255,-32768,-32768,    15,   260,-32768,
     -38,   -38,   112,   112,-32768,-32768,   156,-32768,-32768,-32768,
  -32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
  -32768,-32768,-32768,-32768,   186,   156,   156,    49,-32768,-32768,
     156,-32768,-32768,-32768,-32768,-32768,   187,-32768,   189,-32768,
  -32768,-32768,   213,   271,     0,-32768,-32768,-32768,-32768,-32768,
     207,   278,   281,    49,-32768,-32768,-32768,   221,-32768,   290,
     301,-32768
};

static const short yypgoto[] =
{
  -32768,-32768,   295,-32768,-32768,   268,-32768,-32768,   185,-32768,
  -32768,-32768,   119,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
  -32768,-32768,-32768,   277,-32768,-32768,-32768,-32768,-32768,-32768,
  -32768,-32768,-32768,-32768,-32768,   250,-32768,-32768,-32768,   292,
     294,-32768,   -36,-32768,-32768,-32768,-32768,-32768,-32768,  -108,
     136,-32768,-32768,-32768,   205,   -79,-32768,   231,-32768,   141,
     -54,-32768,   -42,  -180,-32768,-32768,    39,-32768,   -48,  -181,
     142
};


#define	YYLAST		330


static const short yytable[] =
{
     101,   130,    59,   135,   221,   -18,    99,     2,   154,   112,
     113,   154,    29,   199,   200,   178,   179,    30,     3,   289,
     180,   309,   252,   115,   117,   118,   132,    43,   125,   133,
     110,    44,   131,    45,   131,   126,   127,   111,    31,   186,
      50,   136,   137,   310,    53,   146,    40,    41,   155,    60,
      16,   155,   311,   104,    17,    56,    18,     4,   146,   201,
     187,   103,   158,   156,   290,     5,   105,   284,   188,   189,
     190,   146,    19,    31,  -166,    54,    20,    21,   172,   173,
     174,   294,   295,   106,   296,    32,   120,   298,   121,    33,
      34,   147,    85,    86,    87,    88,   148,    89,    90,    91,
      92,   159,   181,   149,   114,   208,   194,   183,   191,   192,
     193,  -173,   209,   204,   211,   212,   182,   175,   197,    46,
      16,   256,  -154,   184,    17,   210,    18,   185,   213,   160,
     161,   162,   163,   164,   165,   205,  -155,   146,   206,   218,
     219,   220,    19,   207,   166,   224,    20,    21,   227,   228,
     229,   230,   131,    31,   249,   231,   232,   255,    16,   257,
     260,   233,    17,   248,    18,    32,   258,   214,   215,    33,
      34,   216,   217,   234,   235,   236,   237,   175,   226,   302,
      19,    89,    90,    91,    20,    21,   259,   261,   264,   268,
     269,   270,   271,   272,   273,   274,   275,   276,   277,   278,
     279,   280,   281,   282,   283,   317,   292,   293,   262,   238,
     239,   240,   241,   242,   243,   244,   245,   246,   247,   263,
      85,    86,    87,    88,   297,    89,    90,    91,    92,   265,
     285,   314,   114,   266,    85,    86,    87,    88,   110,    89,
      90,    91,    92,   300,   249,   111,   138,   267,   303,    63,
      64,    65,   286,    66,    67,    68,    69,    70,    71,   288,
      72,    73,   131,   168,   291,    74,    75,    76,    77,    78,
      79,    85,    86,    87,    88,   308,    80,   299,   305,    92,
     306,   307,   315,   129,    81,   316,    82,    83,    84,   318,
     320,   160,   161,   162,   163,   164,   165,    85,    86,    87,
      88,   321,    15,    55,   171,    92,   169,    51,    85,    86,
      87,    88,   109,    89,    90,    91,    92,   253,    47,    93,
      94,    48,   223,   170,   140,   301,   222,     0,     0,     0,
     225
};

static const short yycheck[] =
{
      48,    80,    38,    82,   184,     4,    48,     4,     4,    63,
      64,     4,    68,     7,     8,   123,   124,    68,    15,     4,
     128,    21,    23,    65,    66,    67,    66,     4,    76,    69,
      68,     4,    80,     4,    82,    77,    78,    75,    61,    11,
       4,    83,    84,    43,     4,    93,    59,    60,    44,     4,
      51,    44,    52,    61,    55,    54,    57,    54,   106,    53,
      32,     4,    58,    56,    49,    62,     4,   247,    40,    41,
      42,   119,    73,    61,    90,    63,    77,    78,    29,    30,
      31,   262,   263,    75,   264,    73,    68,   267,    68,    77,
      78,     4,    64,    65,    66,    67,    79,    69,    70,    71,
      72,     6,    49,    90,    76,   159,   148,    49,    80,    81,
      82,    90,   166,   155,   168,   169,    79,    68,     4,    50,
      51,   200,    90,    90,    55,   167,    57,    49,   170,    34,
      35,    36,    37,    38,    39,     4,    90,   185,     4,   181,
     182,   183,    73,     4,    49,   187,    77,    78,   190,   191,
     192,   193,   200,    61,   196,    27,    28,   199,    51,   201,
       6,    33,    55,    91,    57,    73,   202,    68,    68,    77,
      78,    68,    68,    45,    46,    47,    48,    68,    68,   287,
      73,    69,    70,    71,    77,    78,     4,     6,    90,   231,
     232,   233,   234,   235,   236,   237,   238,   239,   240,   241,
     242,   243,   244,   245,   246,   313,   260,   261,    79,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    79,
      64,    65,    66,    67,   266,    69,    70,    71,    72,    91,
      79,   310,    76,    49,    64,    65,    66,    67,    68,    69,
      70,    71,    72,   285,   286,    75,    76,    90,   290,     5,
       6,     7,    92,     9,    10,    11,    12,    13,    14,     4,
      16,    17,   310,     6,     4,    21,    22,    23,    24,    25,
      26,    64,    65,    66,    67,     4,    32,    91,    91,    72,
      91,    68,     4,    76,    40,     4,    42,    43,    44,    68,
       0,    34,    35,    36,    37,    38,    39,    64,    65,    66,
      67,     0,     7,    35,   119,    72,    49,    30,    64,    65,
      66,    67,    62,    69,    70,    71,    72,   198,    26,    75,
      76,    27,   186,   118,    93,   286,   185,    -1,    -1,    -1,
     188
};
#define YYPURE 1

/* -*-C-*-  Note some compilers choke on comments on `#line' lines.  */
#line 3 "/usr/share/bison/bison.simple"

/* Skeleton output parser for bison,

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002 Free Software
   Foundation, Inc.

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

/* This is the parser code that is written into each bison parser when
   the %semantic_parser declaration is not specified in the grammar.
   It was written by Richard Stallman by simplifying the hairy parser
   used when %semantic_parser is specified.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

#if ! defined (yyoverflow) || defined (YYERROR_VERBOSE)

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
#endif /* ! defined (yyoverflow) || defined (YYERROR_VERBOSE) */


#if (! defined (yyoverflow) \
     && (! defined (__cplusplus) \
	 || (YYLTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  short yyss;
  YYSTYPE yyvs;
# if YYLSP_NEEDED
  YYLTYPE yyls;
# endif
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAX (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# if YYLSP_NEEDED
#  define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short) + sizeof (YYSTYPE) + sizeof (YYLTYPE))	\
      + 2 * YYSTACK_GAP_MAX)
# else
#  define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short) + sizeof (YYSTYPE))				\
      + YYSTACK_GAP_MAX)
# endif

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
	    (To)[yyi] = (From)[yyi];		\
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
#define YYABORT 	goto yyabortlab
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
   are run).

   When YYLLOC_DEFAULT is run, CURRENT is set the location of the
   first token.  By default, to implement support for ranges, extend
   its range to the last symbol.  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)       	\
   Current.last_line   = Rhs[N].last_line;	\
   Current.last_column = Rhs[N].last_column;
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#if YYPURE
# if YYLSP_NEEDED
#  ifdef YYLEX_PARAM
#   define YYLEX		yylex (&yylval, &yylloc, YYLEX_PARAM)
#  else
#   define YYLEX		yylex (&yylval, &yylloc)
#  endif
# else /* !YYLSP_NEEDED */
#  ifdef YYLEX_PARAM
#   define YYLEX		yylex (&yylval, YYLEX_PARAM)
#  else
#   define YYLEX		yylex (&yylval)
#  endif
# endif /* !YYLSP_NEEDED */
#else /* !YYPURE */
# define YYLEX			yylex ()
#endif /* !YYPURE */


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
/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
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

#ifdef YYERROR_VERBOSE

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
#endif

#line 315 "/usr/share/bison/bison.simple"


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

/* YY_DECL_VARIABLES -- depending whether we use a pure parser,
   variables are global, or local to YYPARSE.  */

#define YY_DECL_NON_LSP_VARIABLES			\
/* The lookahead symbol.  */				\
int yychar;						\
							\
/* The semantic value of the lookahead symbol. */	\
YYSTYPE yylval;						\
							\
/* Number of parse errors so far.  */			\
int yynerrs;

#if YYLSP_NEEDED
# define YY_DECL_VARIABLES			\
YY_DECL_NON_LSP_VARIABLES			\
						\
/* Location data for the lookahead symbol.  */	\
YYLTYPE yylloc;
#else
# define YY_DECL_VARIABLES			\
YY_DECL_NON_LSP_VARIABLES
#endif


/* If nonreentrant, generate the variables here. */

#if !YYPURE
YY_DECL_VARIABLES
#endif  /* !YYPURE */

int
yyparse (YYPARSE_PARAM_ARG)
     YYPARSE_PARAM_DECL
{
  /* If reentrant, generate the variables here. */
#if YYPURE
  YY_DECL_VARIABLES
#endif  /* !YYPURE */

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

  /* The state stack. */
  short	yyssa[YYINITDEPTH];
  short *yyss = yyssa;
  register short *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  register YYSTYPE *yyvsp;

#if YYLSP_NEEDED
  /* The location stack.  */
  YYLTYPE yylsa[YYINITDEPTH];
  YYLTYPE *yyls = yylsa;
  YYLTYPE *yylsp;
#endif

#if YYLSP_NEEDED
# define YYPOPSTACK   (yyvsp--, yyssp--, yylsp--)
#else
# define YYPOPSTACK   (yyvsp--, yyssp--)
#endif

  YYSIZE_T yystacksize = YYINITDEPTH;


  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
#if YYLSP_NEEDED
  YYLTYPE yyloc;
#endif

  /* When reducing, the number of symbols on the RHS of the reduced
     rule. */
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
#if YYLSP_NEEDED
  yylsp = yyls;
#endif
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
	   data in use in that stack, in bytes.  */
# if YYLSP_NEEDED
	YYLTYPE *yyls1 = yyls;
	/* This used to be a conditional around just the two extra args,
	   but that might be undefined if yyoverflow is a macro.  */
	yyoverflow ("parser stack overflow",
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yyls1, yysize * sizeof (*yylsp),
		    &yystacksize);
	yyls = yyls1;
# else
	yyoverflow ("parser stack overflow",
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);
# endif
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
# if YYLSP_NEEDED
	YYSTACK_RELOCATE (yyls);
# endif
# undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
#if YYLSP_NEEDED
      yylsp = yyls + yysize - 1;
#endif

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
  if (yyn == YYFLAG)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* yychar is either YYEMPTY or YYEOF
     or a valid token in external form.  */

  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  /* Convert token to internal form (in yychar1) for indexing tables with */

  if (yychar <= 0)		/* This means end of input. */
    {
      yychar1 = 0;
      yychar = YYEOF;		/* Don't call YYLEX any more */

      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yychar1 = YYTRANSLATE (yychar);

#if YYDEBUG
     /* We have to keep this `#if YYDEBUG', since we use variables
	which are defined only if `YYDEBUG' is set.  */
      if (yydebug)
	{
	  YYFPRINTF (stderr, "Next token is %d (%s",
		     yychar, yytname[yychar1]);
	  /* Give the individual parser a way to print the precise
	     meaning of a token, for further debugging info.  */
# ifdef YYPRINT
	  YYPRINT (stderr, yychar, yylval);
# endif
	  YYFPRINTF (stderr, ")\n");
	}
#endif
    }

  yyn += yychar1;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != yychar1)
    goto yydefault;

  yyn = yytable[yyn];

  /* yyn is what to do for this token type in this state.
     Negative => reduce, -yyn is rule number.
     Positive => shift, yyn is new state.
       New state is final state => don't bother to shift,
       just return success.
     0, or most negative number => error.  */

  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrlab;

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Shift the lookahead token.  */
  YYDPRINTF ((stderr, "Shifting token %d (%s), ",
	      yychar, yytname[yychar1]));

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  *++yyvsp = yylval;
#if YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

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

     Otherwise, the following line sets YYVAL to the semantic value of
     the lookahead token.  This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];

#if YYLSP_NEEDED
  /* Similarly for the default location.  Let the user run additional
     commands if for instance locations are ranges.  */
  yyloc = yylsp[1-yylen];
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
#endif

#if YYDEBUG
  /* We have to keep this `#if YYDEBUG', since we use variables which
     are defined only if `YYDEBUG' is set.  */
  if (yydebug)
    {
      int yyi;

      YYFPRINTF (stderr, "Reducing via rule %d (line %d), ",
		 yyn, yyrline[yyn]);

      /* Print the symbols being reduced, and their result.  */
      for (yyi = yyprhs[yyn]; yyrhs[yyi] > 0; yyi++)
	YYFPRINTF (stderr, "%s ", yytname[yyrhs[yyi]]);
      YYFPRINTF (stderr, " -> %s\n", yytname[yyr1[yyn]]);
    }
#endif

  switch (yyn) {

case 1:
#line 239 "imcc.y"
{ open_comp_unit(); yyval.i = 0;;
    break;}
case 2:
#line 240 "imcc.y"
{ close_comp_unit(interp); yyval.i = 0; ;
    break;}
case 6:
#line 246 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 11:
#line 258 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 12:
#line 259 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 13:
#line 260 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 14:
#line 261 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 15:
#line 264 "imcc.y"
{clear_state();;
    break;}
case 16:
#line 265 "imcc.y"
{ yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                                          free(yyvsp[-1].s); ;
    break;}
case 17:
#line 267 "imcc.y"
{
                                          char *name = str_dup(yyvsp[0].s);
                                          yyval.i = iSUBROUTINE(
                                          mk_address(yyvsp[0].s, U_add_uniq_sub));
                                          yyval.i->r[1] =  mk_pcc_sub(name, 0);
                                        ;
    break;}
case 18:
#line 273 "imcc.y"
{ yyval.i = 0;;
    break;}
case 20:
#line 280 "imcc.y"
{ open_comp_unit();
                                          function = "(emit)"; ;
    break;}
case 21:
#line 283 "imcc.y"
{ if (optimizer_level & OPT_PASM)
                                                allocate(interp);
                                          emit_flush(interp); yyval.i=0;;
    break;}
case 23:
#line 294 "imcc.y"
{
          yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        ;
    break;}
case 24:
#line 301 "imcc.y"
{ open_comp_unit(); ;
    break;}
case 25:
#line 303 "imcc.y"
{ yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        ;
    break;}
case 26:
#line 307 "imcc.y"
{ open_comp_unit(); ;
    break;}
case 27:
#line 309 "imcc.y"
{
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        ;
    break;}
case 28:
#line 316 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 29:
#line 319 "imcc.y"
{ yyval.sr = 0; ;
    break;}
case 30:
#line 320 "imcc.y"
{ yyval.sr = 0; ;
    break;}
case 31:
#line 321 "imcc.y"
{ add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);;
    break;}
case 32:
#line 324 "imcc.y"
{ is_def=1; ;
    break;}
case 33:
#line 325 "imcc.y"
{ yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; ;
    break;}
case 34:
#line 328 "imcc.y"
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
               * sub call; the sub is in r[1] of the first ins
               */
              if (instructions->r[1] && instructions->r[1]->pcc_sub)
                  instructions->r[1]->pcc_sub->calls_a_sub = 1;

           ;
    break;}
case 35:
#line 354 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 36:
#line 357 "imcc.y"
{ yyval.t = 1; ;
    break;}
case 37:
#line 358 "imcc.y"
{ yyval.t = 0; ;
    break;}
case 38:
#line 361 "imcc.y"
{ yyval.t = -1; ;
    break;}
case 40:
#line 365 "imcc.y"
{
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              ;
    break;}
case 41:
#line 369 "imcc.y"
{
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              ;
    break;}
case 42:
#line 374 "imcc.y"
{ yyval.sr = 0; ;
    break;}
case 43:
#line 375 "imcc.y"
{  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);;
    break;}
case 44:
#line 378 "imcc.y"
{ yyval.sr = yyvsp[0].sr; ;
    break;}
case 45:
#line 379 "imcc.y"
{ yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; ;
    break;}
case 46:
#line 382 "imcc.y"
{ yyval.sr = 0; ;
    break;}
case 47:
#line 383 "imcc.y"
{ if(yyvsp[-1].sr) add_pcc_result(yyvsp[-7].sr, yyvsp[-1].sr); ;
    break;}
case 48:
#line 386 "imcc.y"
{ yyval.sr = yyvsp[0].sr; ;
    break;}
case 49:
#line 387 "imcc.y"
{ is_def=1; ;
    break;}
case 50:
#line 387 "imcc.y"
{ mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; ;
    break;}
case 51:
#line 390 "imcc.y"
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
        ;
    break;}
case 52:
#line 403 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 53:
#line 406 "imcc.y"
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
        ;
    break;}
case 54:
#line 420 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 55:
#line 423 "imcc.y"
{ yyval.sr = 0; ;
    break;}
case 56:
#line 424 "imcc.y"
{ if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); ;
    break;}
case 57:
#line 425 "imcc.y"
{ if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); ;
    break;}
case 58:
#line 428 "imcc.y"
{ yyval.sr = yyvsp[0].sr; ;
    break;}
case 61:
#line 442 "imcc.y"
{ clear_state(); ;
    break;}
case 62:
#line 446 "imcc.y"
{ yyval.i = yyvsp[0].i; ;
    break;}
case 63:
#line 447 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 64:
#line 448 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 67:
#line 451 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 68:
#line 452 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 69:
#line 455 "imcc.y"
{ yyval.i = NULL; ;
    break;}
case 73:
#line 463 "imcc.y"
{ yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); ;
    break;}
case 74:
#line 467 "imcc.y"
{ yyval.i = yyvsp[-1].i; ;
    break;}
case 77:
#line 472 "imcc.y"
{ push_namespace(yyvsp[0].s); ;
    break;}
case 78:
#line 473 "imcc.y"
{ pop_namespace(yyvsp[0].s); ;
    break;}
case 79:
#line 474 "imcc.y"
{ is_def=1; ;
    break;}
case 80:
#line 474 "imcc.y"
{ mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; ;
    break;}
case 81:
#line 475 "imcc.y"
{ is_def=1; ;
    break;}
case 82:
#line 476 "imcc.y"
{ mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; ;
    break;}
case 83:
#line 477 "imcc.y"
{ is_def=1; ;
    break;}
case 84:
#line 478 "imcc.y"
{ mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; ;
    break;}
case 85:
#line 479 "imcc.y"
{ is_def=1; ;
    break;}
case 86:
#line 479 "imcc.y"
{ yyval.i = MK_I(interp, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; ;
    break;}
case 87:
#line 481 "imcc.y"
{ yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); ;
    break;}
case 88:
#line 482 "imcc.y"
{ yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); ;
    break;}
case 89:
#line 483 "imcc.y"
{ yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); ;
    break;}
case 90:
#line 484 "imcc.y"
{ yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); ;
    break;}
case 91:
#line 485 "imcc.y"
{ yyval.i = MK_I(interp, "bsr",  1, yyvsp[0].sr); ;
    break;}
case 92:
#line 486 "imcc.y"
{ yyval.i = MK_I(interp, "branch",1, yyvsp[0].sr); ;
    break;}
case 93:
#line 487 "imcc.y"
{ yyval.i = MK_I(interp, "inc",1, yyvsp[0].sr); ;
    break;}
case 94:
#line 488 "imcc.y"
{ yyval.i = MK_I(interp, "dec",1, yyvsp[0].sr); ;
    break;}
case 95:
#line 489 "imcc.y"
{ yyval.i = MK_I(interp, "saveall" ,0); ;
    break;}
case 96:
#line 490 "imcc.y"
{ yyval.i = MK_I(interp, "restoreall" ,0); ;
    break;}
case 97:
#line 491 "imcc.y"
{ yyval.i = MK_I(interp, "end" ,0); ;
    break;}
case 98:
#line 492 "imcc.y"
{ yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec, 1);
                                          free(yyvsp[-1].s); ;
    break;}
case 99:
#line 494 "imcc.y"
{ yyval.i = 0;;
    break;}
case 100:
#line 498 "imcc.y"
{ yyval.t = 'I'; ;
    break;}
case 101:
#line 499 "imcc.y"
{ yyval.t = 'N'; ;
    break;}
case 102:
#line 500 "imcc.y"
{ yyval.t = 'S'; ;
    break;}
case 103:
#line 501 "imcc.y"
{ yyval.t = 'P'; free(yyvsp[0].s); ;
    break;}
case 105:
#line 509 "imcc.y"
{ yyval.i = MK_I(interp, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 106:
#line 510 "imcc.y"
{ yyval.i = MK_I(interp, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);;
    break;}
case 107:
#line 511 "imcc.y"
{ yyval.i = MK_I(interp, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);;
    break;}
case 108:
#line 512 "imcc.y"
{ yyval.i = MK_I(interp, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);;
    break;}
case 109:
#line 513 "imcc.y"
{ yyval.i = MK_I(interp, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 110:
#line 514 "imcc.y"
{ yyval.i = MK_I(interp, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 111:
#line 515 "imcc.y"
{ yyval.i = MK_I(interp, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 112:
#line 516 "imcc.y"
{ yyval.i = MK_I(interp, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 113:
#line 517 "imcc.y"
{ yyval.i = MK_I(interp, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 114:
#line 518 "imcc.y"
{ yyval.i = MK_I(interp, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 115:
#line 519 "imcc.y"
{ yyval.i = MK_I(interp, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); ;
    break;}
case 116:
#line 520 "imcc.y"
{ yyval.i = MK_I(interp, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 117:
#line 521 "imcc.y"
{ yyval.i = MK_I(interp, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 118:
#line 522 "imcc.y"
{ yyval.i = MK_I(interp, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 119:
#line 523 "imcc.y"
{ yyval.i = MK_I(interp, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 120:
#line 524 "imcc.y"
{ yyval.i = MK_I(interp, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 121:
#line 525 "imcc.y"
{ yyval.i = MK_I(interp, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 122:
#line 526 "imcc.y"
{ yyval.i = MK_I(interp, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 123:
#line 527 "imcc.y"
{ yyval.i = MK_I(interp, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 124:
#line 528 "imcc.y"
{ yyval.i = MK_I(interp, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 125:
#line 529 "imcc.y"
{ yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); ;
    break;}
case 126:
#line 530 "imcc.y"
{ yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); ;
    break;}
case 127:
#line 531 "imcc.y"
{ yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); ;
    break;}
case 128:
#line 532 "imcc.y"
{ yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL,1); ;
    break;}
case 129:
#line 533 "imcc.y"
{ yyval.i = MK_I(interp, "defined",2, yyvsp[-3].sr,yyvsp[0].sr); ;
    break;}
case 130:
#line 534 "imcc.y"
{ keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr);;
    break;}
case 131:
#line 536 "imcc.y"
{ yyval.i = MK_I(interp, "clone",2, yyvsp[-3].sr, yyvsp[0].sr);
    ;
    break;}
case 132:
#line 538 "imcc.y"
{ yyval.i = MK_I(interp, "set_addr",
                                          2, yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once)); ;
    break;}
case 133:
#line 540 "imcc.y"
{ yyval.i = MK_I(interp, "find_global",2, yyvsp[-3].sr,yyvsp[0].sr); ;
    break;}
case 134:
#line 541 "imcc.y"
{ yyval.i = MK_I(interp, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); ;
    break;}
case 135:
#line 542 "imcc.y"
{ expect_pasm = 1; ;
    break;}
case 136:
#line 543 "imcc.y"
{ yyval.i = INS(interp, "new",0,regs,nargs,keyvec,1); ;
    break;}
case 137:
#line 544 "imcc.y"
{ yyval.i = MK_I(interp, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 138:
#line 545 "imcc.y"
{ keyvec=KEY_BIT(2);
                                  yyval.i = MK_I(interp, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr);;
    break;}
case 139:
#line 547 "imcc.y"
{ yyval.i = MK_I(interp, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 140:
#line 551 "imcc.y"
{yyval.i=MK_I(interp, yyvsp[-3].s,3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 141:
#line 552 "imcc.y"
{yyval.i=MK_I(interp, inv_op(yyvsp[-3].s),
                                            3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 142:
#line 554 "imcc.y"
{yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 143:
#line 555 "imcc.y"
{yyval.i= MK_I(interp, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 144:
#line 556 "imcc.y"
{yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 145:
#line 557 "imcc.y"
{yyval.i= MK_I(interp, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); ;
    break;}
case 146:
#line 562 "imcc.y"
{ yyval.s = "eq"; ;
    break;}
case 147:
#line 563 "imcc.y"
{ yyval.s = "ne"; ;
    break;}
case 148:
#line 564 "imcc.y"
{ yyval.s = "gt"; ;
    break;}
case 149:
#line 565 "imcc.y"
{ yyval.s = "ge"; ;
    break;}
case 150:
#line 566 "imcc.y"
{ yyval.s = "lt"; ;
    break;}
case 151:
#line 567 "imcc.y"
{ yyval.s = "le"; ;
    break;}
case 156:
#line 578 "imcc.y"
{ yyval.sr = NULL; ;
    break;}
case 157:
#line 579 "imcc.y"
{ yyval.sr = yyvsp[0].sr; ;
    break;}
case 158:
#line 582 "imcc.y"
{ yyval.sr = regs[0]; ;
    break;}
case 160:
#line 586 "imcc.y"
{ regs[nargs++] = yyvsp[0].sr; ;
    break;}
case 161:
#line 587 "imcc.y"
{ regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; ;
    break;}
case 162:
#line 592 "imcc.y"
{ yyval.sr = mk_address(yyvsp[0].s, U_add_once); ;
    break;}
case 163:
#line 593 "imcc.y"
{ yyval.sr = mk_address(yyvsp[0].s, U_add_once); ;
    break;}
case 168:
#line 604 "imcc.y"
{ nkeys=0; ;
    break;}
case 169:
#line 605 "imcc.y"
{ yyval.sr = link_keys(nkeys, keys); ;
    break;}
case 170:
#line 608 "imcc.y"
{ keys[nkeys++] = yyvsp[0].sr; ;
    break;}
case 171:
#line 609 "imcc.y"
{ keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; ;
    break;}
case 175:
#line 619 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'I'); ;
    break;}
case 176:
#line 620 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'N'); ;
    break;}
case 177:
#line 621 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'S'); ;
    break;}
case 178:
#line 622 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'P'); ;
    break;}
case 179:
#line 623 "imcc.y"
{ yyval.sr = mk_pasm_reg(yyvsp[0].s); ;
    break;}
case 180:
#line 626 "imcc.y"
{ yyval.sr = mk_const(yyvsp[0].s, 'I'); ;
    break;}
case 181:
#line 627 "imcc.y"
{ yyval.sr = mk_const(yyvsp[0].s, 'N'); ;
    break;}
case 182:
#line 628 "imcc.y"
{ yyval.sr = mk_const(yyvsp[0].s, 'S'); ;
    break;}
case 183:
#line 631 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'S'); ;
    break;}
case 184:
#line 632 "imcc.y"
{ yyval.sr = mk_const(yyvsp[0].s, 'S'); ;
    break;}
}

#line 705 "/usr/share/bison/bison.simple"


  yyvsp -= yylen;
  yyssp -= yylen;
#if YYLSP_NEEDED
  yylsp -= yylen;
#endif

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
#if YYLSP_NEEDED
  *++yylsp = yyloc;
#endif

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTBASE] + *yyssp;
  if (yystate >= 0 && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTBASE];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;

#ifdef YYERROR_VERBOSE
      yyn = yypact[yystate];

      if (yyn > YYFLAG && yyn < YYLAST)
	{
	  YYSIZE_T yysize = 0;
	  char *yymsg;
	  int yyx, yycount;

	  yycount = 0;
	  /* Start YYX at -YYN if negative to avoid negative indexes in
	     YYCHECK.  */
	  for (yyx = yyn < 0 ? -yyn : 0;
	       yyx < (int) (sizeof (yytname) / sizeof (char *)); yyx++)
	    if (yycheck[yyx + yyn] == yyx)
	      yysize += yystrlen (yytname[yyx]) + 15, yycount++;
	  yysize += yystrlen ("parse error, unexpected ") + 1;
	  yysize += yystrlen (yytname[YYTRANSLATE (yychar)]);
	  yymsg = (char *) YYSTACK_ALLOC (yysize);
	  if (yymsg != 0)
	    {
	      char *yyp = yystpcpy (yymsg, "parse error, unexpected ");
	      yyp = yystpcpy (yyp, yytname[YYTRANSLATE (yychar)]);

	      if (yycount < 5)
		{
		  yycount = 0;
		  for (yyx = yyn < 0 ? -yyn : 0;
		       yyx < (int) (sizeof (yytname) / sizeof (char *));
		       yyx++)
		    if (yycheck[yyx + yyn] == yyx)
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
#endif /* defined (YYERROR_VERBOSE) */
	yyerror ("parse error");
    }
  goto yyerrlab1;


/*--------------------------------------------------.
| yyerrlab1 -- error raised explicitly by an action |
`--------------------------------------------------*/
yyerrlab1:
  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      /* return failure if at end of input */
      if (yychar == YYEOF)
	YYABORT;
      YYDPRINTF ((stderr, "Discarding token %d (%s).\n",
		  yychar, yytname[yychar1]));
      yychar = YYEMPTY;
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */

  yyerrstatus = 3;		/* Each real token shifted decrements this */

  goto yyerrhandle;


/*-------------------------------------------------------------------.
| yyerrdefault -- current state does not do anything special for the |
| error token.                                                       |
`-------------------------------------------------------------------*/
yyerrdefault:
#if 0
  /* This is wrong; only states that explicitly want error tokens
     should shift them.  */

  /* If its default is to accept any token, ok.  Otherwise pop it.  */
  yyn = yydefact[yystate];
  if (yyn)
    goto yydefault;
#endif


/*---------------------------------------------------------------.
| yyerrpop -- pop the current state because it cannot handle the |
| error token                                                    |
`---------------------------------------------------------------*/
yyerrpop:
  if (yyssp == yyss)
    YYABORT;
  yyvsp--;
  yystate = *--yyssp;
#if YYLSP_NEEDED
  yylsp--;
#endif

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

/*--------------.
| yyerrhandle.  |
`--------------*/
yyerrhandle:
  yyn = yypact[yystate];
  if (yyn == YYFLAG)
    goto yyerrdefault;

  yyn += YYTERROR;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != YYTERROR)
    goto yyerrdefault;

  yyn = yytable[yyn];
  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrpop;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrpop;

  if (yyn == YYFINAL)
    YYACCEPT;

  YYDPRINTF ((stderr, "Shifting error token, "));

  *++yyvsp = yylval;
#if YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

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

/*---------------------------------------------.
| yyoverflowab -- parser overflow comes here.  |
`---------------------------------------------*/
yyoverflowlab:
  yyerror ("parser stack overflow");
  yyresult = 2;
  /* Fall through.  */

yyreturn:
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  return yyresult;
}
#line 636 "imcc.y"



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
