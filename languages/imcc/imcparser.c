
/*  A Bison parser, made from imcc.y
 by  GNU Bison version 1.25
  */

#define YYBISON 1  /* Identify Bison output.  */

#define	CALL	258
#define	GOTO	259
#define	ARG	260
#define	RET	261
#define	PRINT	262
#define	IF	263
#define	UNLESS	264
#define	NEW	265
#define	END	266
#define	SAVEALL	267
#define	RESTOREALL	268
#define	SUB	269
#define	NAMESPACE	270
#define	CLASS	271
#define	ENDCLASS	272
#define	SYM	273
#define	LOCAL	274
#define	PARAM	275
#define	PUSH	276
#define	POP	277
#define	INC	278
#define	DEC	279
#define	SHIFT_LEFT	280
#define	SHIFT_RIGHT	281
#define	INTV	282
#define	FLOATV	283
#define	STRINGV	284
#define	DEFINED	285
#define	LOG_XOR	286
#define	RELOP_EQ	287
#define	RELOP_NE	288
#define	RELOP_GT	289
#define	RELOP_GTE	290
#define	RELOP_LT	291
#define	RELOP_LTE	292
#define	GLOBAL	293
#define	ADDR	294
#define	CLONE	295
#define	RESULT	296
#define	RETURN	297
#define	POW	298
#define	COMMA	299
#define	LABEL	300
#define	EMIT	301
#define	EOM	302
#define	IREG	303
#define	NREG	304
#define	SREG	305
#define	PREG	306
#define	IDENTIFIER	307
#define	STRINGC	308
#define	INTC	309
#define	FLOATC	310
#define	REG	311
#define	MACRO	312
#define	PARROT_OP	313
#define	VAR	314

#line 1 "imcc.y"

/*
 * imcc.y
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 *
 * Grammar for the parser.
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define _PARSER
#define MAIN
#include "imc.h"
#include "parrot/embed.h"
#include "pbc.h"

#define YYDEBUG 1
/* #define OPTEST */

int         yyerror(char *);
int         yylex();
extern char yytext[];
int         expect_pasm;

/*
 * Choosing instructions for Parrot is pretty easy since
 * many are polymorphic.
 */


static SymReg *regs[IMCC_MAX_REGS];
/* Bit vector saying whether argument i is a key */
static int keyvec = 0;
static int nargs = 0;
static SymReg *keys[IMCC_MAX_REGS];
static int nkeys = 0;
#define KEY_BIT(argnum) (1 << argnum)

static SymReg ** RR(int n, ...)
{
    va_list ap;
    int i = 0;

    va_start(ap, n);
    while (n--) {
	regs[i++] = va_arg(ap, SymReg *);
    }
    while (i < IMCC_MAX_REGS)
	regs[i++] = 0;
    return regs;
}

/* macros for registers */
#define R0() 		RR(nargs=0)
#define R1(r0) 		RR(nargs=1,r0)
#define R2(r0,r1) 	RR(nargs=2,r0,r1)
#define R3(r0,r1,r2) 	RR(nargs=3,r0,r1,r2)
#define R4(r0,r1,r2,r3) RR(nargs=4,r0,r1,r2,r3)

Instruction * iANY(char * name, char *fmt, SymReg **r, int emit);

/*
 * MK_I: build and emitb instruction by iANY
 *
 * fmt may contain:
 *   op %s, %s # comment
 * or just
 *   op
 *
 */
static Instruction * MK_I(char * fmt, SymReg ** r) {
    char opname[64];
    char *p, *q;
    for (p = opname, q = fmt; *q && *q != ' '; )
	*p++ = *q++;
    *p = 0;
    if (!*q)
	fmt = 0;
    else
	fmt = ++q;
#if OPDEBUG
    fprintf(stderr, "op '%s' format '%s' (%d)\n", opname, fmt?:"",nargs);
#endif
    return iANY(opname, fmt, r, 1);
}

/*
 * special instructions
 *
 * labels and such
 */


static void clear_state()
{
    nargs = 0;
    keyvec = 0;
    memset(regs, 0, sizeof(regs));
}

static Instruction * iLABEL(SymReg * r0) {
    Instruction *i = emitb(_mk_instruction("","%s:", R1(r0), 0));
    i->type = ITLABEL;
    clear_state();
    return i;
}


static Instruction * iSUBROUTINE(SymReg * r0) {
    function = r0->name;
    return iLABEL(r0); /* XXX mark label global */
}


/*
 * substr or X = P[key]
 */
static Instruction * iINDEXFETCH(SymReg * r0, SymReg * r1, SymReg * r2) {
    if(r0->set == 'S' && r1->set == 'S' && r2->set == 'I') {
        SymReg * r3 = mk_const("1", 'I');
        return MK_I("substr %s, %s, %s, 1", R4(r0, r1, r2, r3));
    }
    keyvec |= KEY_BIT(2);
    return MK_I("set %s, %s[%s]", R3(r0,r1,r2));
}

/*
 * substr or P[key] = X
        */

static Instruction * iINDEXSET(SymReg * r0, SymReg * r1, SymReg * r2) {
    if(r0->set == 'S' && r1->set == 'I' && r2->set == 'S') {
        SymReg * r3 = mk_const("1", 'I');
        MK_I("substr %s, %s, 1, %s", R4(r0, r1,r3, r2));
    }
    else if (r0->set == 'P') {
        keyvec |= KEY_BIT(1);
	MK_I("set %s[%s], %s", R3(r0,r1,r2));
    }
    else {
        fataly(EX_SOFTWARE, "iINDEXSET", line,"unsupported indexed set op\n");
    }
    return 0;
}

/* return the index of a PMC class */
static int get_pmc_num(char *pmc_type)
{
    STRING * s = string_make(interpreter, pmc_type,
            (UINTVAL) strlen(pmc_type), NULL, 0, NULL);
    PMC * key = key_new_string(interpreter, s);
    return Parrot_base_classname_hash->vtable->get_integer_keyed(
            interpreter, Parrot_base_classname_hash, key);
}

/* only .PmcType */
static SymReg * macro(char *name)
{
    SymReg * r;
    char buf[16];
    int type = get_pmc_num(name);
    sprintf(buf, "%d", type);
    r =  mk_const(str_dup(buf), 'I');
    return r;
}
/*
 * new P, .SomeThing
 */
Instruction * iNEW(SymReg * r0, char * type, int emit) {
    char fmt[256];
    SymReg *pmc = macro(type);
    /* XXX check, if type exists, but aove keyed search
     * gives 0 for non existing  PMCs */
    sprintf(fmt, "new %%s, %d\t # .%s", atoi(pmc->name), type);
    r0->usage = U_NEW;
    if (!strcmp(type, "PerlArray") || !strcmp(type, "PerlHash"))
        r0->usage |= U_KEYED;
    free(type);
    regs[0] = r0;
    regs[1] = pmc;
    nargs = 2;
    return iANY("new", fmt+4, regs, emit);
}

/* TODO get rid of nargs */
void
op_fullname(char * dest, const char * name, SymReg * args[], int nargs) {
    int i;

    strcpy(dest, name);
    dest += strlen(name);
    for (i = 0; i < nargs && args[i]; i++) {
        *dest++ = '_';
        if (args[i]->type == VTADDRESS) {
            *dest++ = 'i';
            *dest++ = 'c';
            continue;
    }
        /* if one ever wants num keys, they go with 'S' */
        if (keyvec & KEY_BIT(i)) {
            *dest++ = 'k';
            if (args[i]->set == 'S' || args[i]->set == 'N' ||
                args[i]->set == 'K') {
                *dest++ = 'c';
                continue;
    }
    }
        *dest++ = tolower(args[i]->set);
        if (args[i]->type & VTCONST)
            *dest++ = 'c';
    }
    *dest = '\0';
}

int check_op(char *fullname, char *name, SymReg *regs[])
{
    int op, nargs;
    for (nargs = 0; regs[nargs]; nargs++) ;
    op_fullname(fullname, name, regs, nargs);
    op = interpreter->op_lib->op_code(fullname, 1);
    return op;

}

int is_op(char *name)
{
    return interpreter->op_lib->op_code(name, 0) >= 0;
}

Instruction * INS(char * name, char *fmt, SymReg **regs, int n, int keys) {
    nargs = n;
    keyvec = keys;
    return iANY(name, fmt, regs, 0);
}


Instruction * iANY(char * name, char *fmt, SymReg **regs, int emit) {
    char fullname[64];
    int i;
    int dirs = 0;
    int op;
    Instruction * ins;

    op_fullname(fullname, name, regs, nargs);
    op = interpreter->op_lib->op_code(fullname, 1);
    if (op >= 0) {
        op_info_t * info = &interpreter->op_info_table[op];
	char format[128];
	int len;

        *format = '\0';
        /* info->arg_count is offset by one, first is opcode
         * build instruction format
         * set LV_in / out flags */
        for (i = 0; i < info->arg_count-1; i++) {
            switch (info->dirs[i+1]) {
                case PARROT_ARGDIR_INOUT:
                    /* inout is actually in for imcc, the PMC has to exist
                     * previously, so:
                     * goon
                     */
	    case PARROT_ARGDIR_IN:
                    dirs |= 1 << i ;
		break;

	    case PARROT_ARGDIR_OUT:
                    dirs |= 1 << (16 + i);
		break;

	    default:
		assert(0);
	    };
            if (keyvec & KEY_BIT(i)) {
                len = strlen(format);
                len -= 2;
                format[len] = '\0';
                strcat(format, "[%s], ");
	}
            else
                strcat(format, "%s, ");
	}
	len = strlen(format);
	len -= 2;
	format[len] = '\0';
        if (fmt && *fmt)
            strcpy(format, fmt);
        memset(regs + nargs, 0, sizeof(*regs) * (IMCC_MAX_REGS - nargs));
#if 1
        debug(1,"%s %s\t%s\n", name, format, fullname);
#endif
        /* make the instruction */

        ins = _mk_instruction(name, format, regs, dirs);
        if (emit)
             emitb(ins);
        ins->keys |= keyvec;
        /* fill iin oplib's info */
        ins->opnum = op;
        ins->opsize = info->arg_count;
        /* set up branch flags */
        if (info->jump) {
            if (!strcmp(name, "bsr") || !strcmp(name, "ret")) {
                /* ignore subcalls and ret
                 * because they saveall
                 */
            }
            else {
                /* XXX: assume the jump is relative and to the last arg.
                 * usually true.
                 */
                ins->type = ITBRANCH | (1 << (nargs-1));
                if (!strcmp(name, "branch"))
                    ins->type |= IF_goto;
            }
        }
        else if (!strcmp(name, "set") && nargs == 2) {
            /* set Px, Py: both PMCs have the same address */
            if (regs[0]->set == 'P' && regs[1]->set == 'P')
                ins->type |= ITALIAS;
        }
        else if (!strcmp(name, "set_addr")) {
            /* XXX propably a CATCH block */
            ins->type = ITADDR | IF_r1_branch | ITBRANCH;
        }
    } else {
        fataly(EX_SOFTWARE, "iANY", line,"op not found '%s' (%s<%d>)\n",
                fullname, name, nargs);
    }
    clear_state();
    return ins;
}


#line 341 "imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} YYSTYPE;
#include <stdio.h>

#ifndef __cplusplus
#ifndef __STDC__
#define const
#endif
#endif



#define	YYFINAL		192
#define	YYFLAG		-32768
#define	YYNTBASE	75

#define YYTRANSLATE(x) ((unsigned)(x) <= 314 ? yytranslate[x] : 113)

static const char yytranslate[] = {     0,
     2,     2,     2,     2,     2,     2,     2,     2,     2,    60,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,    62,     2,     2,     2,    67,    69,     2,     2,
     2,    65,    64,     2,    63,    68,    66,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,    74,     2,
    61,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
    72,     2,    73,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,    70,     2,    71,     2,     2,     2,     2,
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
     2,     2,     2,     2,     2,     1,     2,     3,     4,     5,
     6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
    16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
    26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
    36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
    46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
    56,    57,    58,    59
};

#if YYDEBUG != 0
static const short yyprhs[] = {     0,
     0,     2,     4,     7,    11,    14,    15,    17,    18,    23,
    25,    28,    31,    33,    37,    39,    41,    45,    47,    50,
    52,    53,    55,    58,    60,    63,    65,    69,    71,    73,
    77,    81,    85,    89,    92,    95,    98,   101,   104,   107,
   110,   113,   116,   119,   122,   124,   126,   128,   131,   132,
   134,   136,   138,   140,   142,   146,   151,   156,   162,   168,
   174,   180,   186,   192,   198,   204,   210,   216,   222,   228,
   234,   241,   248,   253,   258,   263,   268,   273,   278,   285,
   290,   295,   297,   299,   301,   303,   305,   307,   309,   311,
   313,   315,   316,   318,   322,   324,   326,   331,   333,   335,
   337,   339,   341,   342,   345,   347,   351,   353,   355,   357,
   359,   361,   363,   365,   367,   369,   371,   373,   375
};

static const short yyrhs[] = {    83,
     0,    77,     0,    76,    77,     0,    88,    78,    60,     0,
    58,    79,     0,     0,   100,     0,     0,    46,    76,    81,
    47,     0,    60,     0,    82,    60,     0,    83,    84,     0,
    84,     0,    85,    86,     6,     0,    80,     0,    82,     0,
    14,    52,    60,     0,    87,     0,    86,    87,     0,    91,
     0,     0,    89,     0,    89,    90,     0,    90,     0,    90,
    60,     0,    45,     0,    88,    92,    60,     0,    95,     0,
    96,     0,    18,    93,    52,     0,    19,    93,    52,     0,
    19,    93,    59,     0,    20,    93,    52,     0,    20,   110,
     0,    41,   104,     0,    22,   104,     0,     5,   104,     0,
    21,   104,     0,    42,   104,     0,     3,    52,     0,     4,
    52,     0,    23,   104,     0,    24,   104,     0,     7,   104,
     0,    12,     0,    13,     0,    11,     0,    58,   100,     0,
     0,    27,     0,    28,     0,    29,     0,    94,     0,    52,
     0,    98,    61,   104,     0,    98,    61,    62,   104,     0,
    98,    61,    63,   104,     0,    98,    61,   104,    64,   104,
     0,    98,    61,   104,    63,   104,     0,    98,    61,   104,
    65,   104,     0,    98,    61,   104,    43,   104,     0,    98,
    61,   104,    66,   104,     0,    98,    61,   104,    67,   104,
     0,    98,    61,   104,    68,   104,     0,    98,    61,   104,
    25,   104,     0,    98,    61,   104,    26,   104,     0,    98,
    61,   104,    31,   104,     0,    98,    61,   104,    69,   104,
     0,    98,    61,   104,    70,   104,     0,    98,    61,   104,
    71,   104,     0,    98,    61,   104,    72,   105,    73,     0,
   104,    72,   105,    73,    61,   104,     0,    98,    61,    10,
    94,     0,    98,    61,    30,   104,     0,    98,    61,    40,
   104,     0,    98,    61,    39,    52,     0,    98,    61,    38,
   112,     0,    38,   112,    61,   104,     0,     8,   104,    97,
   104,     4,    52,     0,     8,   104,     4,    52,     0,     9,
   104,     4,    52,     0,    32,     0,    33,     0,    34,     0,
    35,     0,    36,     0,    37,     0,    59,     0,   110,     0,
    59,     0,   110,     0,     0,   101,     0,   101,    44,   102,
     0,   102,     0,   103,     0,    99,    72,   105,    73,     0,
    52,     0,   104,     0,    57,     0,    59,     0,   109,     0,
     0,   106,   107,     0,   108,     0,   107,    74,   108,     0,
   104,     0,   110,     0,   111,     0,    48,     0,    49,     0,
    50,     0,    51,     0,    56,     0,    54,     0,    55,     0,
    53,     0,    50,     0,    53,     0
};

#endif

#if YYDEBUG != 0
static const short yyrline[] = { 0,
   376,   381,   382,   385,   387,   388,   391,   395,   397,   400,
   402,   405,   406,   409,   416,   417,   420,   426,   427,   430,
   433,   434,   437,   438,   439,   442,   445,   448,   450,   451,
   452,   453,   456,   458,   459,   460,   461,   462,   463,   464,
   466,   468,   469,   470,   471,   472,   473,   474,   475,   478,
   480,   481,   482,   485,   489,   491,   492,   493,   494,   495,
   496,   497,   498,   499,   500,   501,   502,   503,   504,   505,
   506,   507,   508,   509,   510,   512,   514,   515,   518,   521,
   523,   527,   529,   530,   531,   532,   533,   537,   538,   540,
   541,   544,   545,   548,   549,   552,   553,   557,   559,   560,
   563,   564,   567,   568,   571,   572,   575,   578,   579,   582,
   583,   584,   585,   586,   589,   590,   591,   594,   595
};
#endif


#if YYDEBUG != 0 || defined (YYERROR_VERBOSE)

static const char * const yytname[] = {   "$","error","$undefined.","CALL","GOTO",
"ARG","RET","PRINT","IF","UNLESS","NEW","END","SAVEALL","RESTOREALL","SUB","NAMESPACE",
"CLASS","ENDCLASS","SYM","LOCAL","PARAM","PUSH","POP","INC","DEC","SHIFT_LEFT",
"SHIFT_RIGHT","INTV","FLOATV","STRINGV","DEFINED","LOG_XOR","RELOP_EQ","RELOP_NE",
"RELOP_GT","RELOP_GTE","RELOP_LT","RELOP_LTE","GLOBAL","ADDR","CLONE","RESULT",
"RETURN","POW","COMMA","LABEL","EMIT","EOM","IREG","NREG","SREG","PREG","IDENTIFIER",
"STRINGC","INTC","FLOATC","REG","MACRO","PARROT_OP","VAR","'\\n'","'='","'!'",
"'-'","'+'","'*'","'/'","'%'","'.'","'&'","'|'","'~'","'['","']'","';'","program",
"pasmcode","pasmline","pasm_inst","pasm_args","emit","@1","nls","subs","sub",
"sub_start","statements","statement","labels","_labels","label","instruction",
"labeled_inst","type","classname","assignment","if_statement","relop","target",
"lhs","vars","_vars","_var_or_i","var_or_i","var","keylist","@2","_keylist",
"key","rc","reg","const","string", NULL
};
#endif

static const short yyr1[] = {     0,
    75,    76,    76,    77,    78,    78,    79,    81,    80,    82,
    82,    83,    83,    84,    84,    84,    85,    86,    86,    87,
    88,    88,    89,    89,    89,    90,    91,    92,    92,    92,
    92,    92,    92,    92,    92,    92,    92,    92,    92,    92,
    92,    92,    92,    92,    92,    92,    92,    92,    92,    93,
    93,    93,    93,    94,    95,    95,    95,    95,    95,    95,
    95,    95,    95,    95,    95,    95,    95,    95,    95,    95,
    95,    95,    95,    95,    95,    95,    95,    95,    96,    96,
    96,    97,    97,    97,    97,    97,    97,    98,    98,    99,
    99,   100,   100,   101,   101,   102,   102,   103,   103,   103,
   104,   104,   106,   105,   107,   107,   108,   109,   109,   110,
   110,   110,   110,   110,   111,   111,   111,   112,   112
};

static const short yyr2[] = {     0,
     1,     1,     2,     3,     2,     0,     1,     0,     4,     1,
     2,     2,     1,     3,     1,     1,     3,     1,     2,     1,
     0,     1,     2,     1,     2,     1,     3,     1,     1,     3,
     3,     3,     3,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     1,     1,     1,     2,     0,     1,
     1,     1,     1,     1,     3,     4,     4,     5,     5,     5,
     5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
     6,     6,     4,     4,     4,     4,     4,     4,     6,     4,
     4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
     1,     0,     1,     3,     1,     1,     4,     1,     1,     1,
     1,     1,     0,     2,     1,     3,     1,     1,     1,     1,
     1,     1,     1,     1,     1,     1,     1,     1,     1
};

static const short yydefact[] = {     0,
     0,    21,    10,    15,    16,     1,    13,    21,     0,    26,
    21,     2,     6,    22,    24,    11,    12,    21,    18,    49,
    20,    17,     3,     0,    92,     0,    23,    25,    14,    19,
     0,     0,     0,     0,     0,     0,    47,    45,    46,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,   110,
   111,   112,   113,   117,   115,   116,   114,    92,    88,     0,
    28,    29,     0,     0,   102,    89,   109,     9,    98,   100,
   101,     5,     0,     7,    93,    95,    96,    99,   108,     4,
    40,    41,   101,    37,   108,    44,     0,     0,    50,    51,
    52,    54,     0,    53,     0,     0,    34,    38,    36,    42,
    43,   118,   119,     0,    35,    39,    48,    27,     0,   103,
   103,     0,     0,    82,    83,    84,    85,    86,    87,     0,
     0,    30,    31,    32,    33,     0,     0,     0,     0,     0,
     0,     0,     0,    55,     0,     0,     0,    94,    80,     0,
    81,    78,    73,    74,    77,    76,    75,    56,    57,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,   103,     0,   107,   104,   105,    97,     0,    65,
    66,    67,    61,    59,    58,    60,    62,    63,    64,    68,
    69,    70,     0,     0,     0,    79,    71,    72,   106,     0,
     0,     0
};

static const short yydefgoto[] = {   190,
    11,    12,    26,    72,     4,    24,     5,     6,     7,     8,
    18,    19,    13,    14,    15,    21,    60,    93,    94,    61,
    62,   120,    63,    73,    74,    75,    76,    77,    78,   135,
   136,   166,   167,    65,    85,    67,   104
};

static const short yypact[] = {    -5,
   -45,   -23,-32768,-32768,   -27,    -5,-32768,   -23,    -4,-32768,
   -39,-32768,   -21,   -23,    -2,-32768,-32768,    -3,-32768,    27,
-32768,-32768,-32768,     5,    70,    -1,-32768,-32768,-32768,-32768,
     8,     9,   147,   147,   147,   147,-32768,-32768,-32768,    -8,
    -8,   165,   147,   147,   147,   147,     4,   147,   147,-32768,
-32768,-32768,-32768,-32768,-32768,-32768,-32768,    70,    -9,     6,
-32768,-32768,     3,     0,-32768,     1,-32768,-32768,-32768,-32768,
     2,-32768,     7,-32768,    23,-32768,-32768,-32768,    12,-32768,
-32768,-32768,-32768,-32768,-32768,-32768,    58,    66,-32768,-32768,
-32768,-32768,    19,-32768,   -48,    35,-32768,-32768,-32768,-32768,
-32768,-32768,-32768,    37,-32768,-32768,-32768,-32768,   118,-32768,
-32768,    70,    36,-32768,-32768,-32768,-32768,-32768,-32768,   147,
    44,-32768,-32768,-32768,-32768,   147,    47,   147,     4,    49,
   147,   147,   147,   119,    29,   147,    30,-32768,-32768,   100,
-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,   147,
   147,   147,   147,   147,   147,   147,   147,   147,   147,   147,
   147,   147,-32768,    46,-32768,    31,-32768,-32768,    57,-32768,
-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
-32768,-32768,    41,   147,   147,-32768,-32768,-32768,-32768,   110,
   115,-32768
};

static const short yypgoto[] = {-32768,
-32768,   106,-32768,-32768,-32768,-32768,-32768,-32768,   137,-32768,
-32768,   128,    -6,-32768,   133,-32768,-32768,   -24,    22,-32768,
-32768,-32768,-32768,-32768,    93,-32768,    40,-32768,   -20,  -110,
-32768,-32768,   -32,-32768,   -15,-32768,    25
};


#define	YYLAST		221


static const short yytable[] = {    64,
   137,    20,    29,   123,    66,    10,     9,    -8,     1,    79,
   124,    20,    84,    86,    87,    88,    95,    96,    89,    90,
    91,    10,    98,    99,   100,   101,    97,   105,   106,    31,
    32,    33,    16,    34,    35,    36,    25,    37,    38,    39,
     2,    10,    79,    92,    40,    41,    42,    43,    44,    45,
    46,    68,   183,   102,     3,    22,   103,    28,    80,    81,
    82,   113,  -101,   109,    47,   108,   112,    48,    49,   121,
   122,   110,  -108,   -90,    50,    51,    52,    53,   111,    54,
    55,    56,    57,   -91,    58,    59,   125,   139,   134,   114,
   115,   116,   117,   118,   119,   141,    79,   126,    92,   140,
   146,   164,   168,   169,   185,   142,   184,   144,   186,   191,
   147,   148,   149,   187,   192,   165,    23,    50,    51,    52,
    53,    69,    54,    55,    56,    57,    70,   127,    71,   170,
   171,   172,   173,   174,   175,   176,   177,   178,   179,   180,
   181,   182,    17,   150,   151,    30,    27,   128,   143,   152,
   107,   138,   189,   145,     0,   129,   130,   131,     0,     0,
     0,   153,     0,   188,   165,    50,    51,    52,    53,     0,
    54,    55,    56,    57,     0,     0,    83,     0,     0,   132,
   133,   154,   155,   156,   157,   158,   159,   160,   161,   162,
   163,    89,    90,    91,    50,    51,    52,    53,     0,    54,
    55,    56,    57,     0,     0,    83,     0,     0,     0,     0,
     0,     0,    50,    51,    52,    53,    92,     0,     0,     0,
    57
};

static const short yycheck[] = {    20,
   111,     8,     6,    52,    20,    45,    52,    47,    14,    25,
    59,    18,    33,    34,    35,    36,    41,    42,    27,    28,
    29,    45,    43,    44,    45,    46,    42,    48,    49,     3,
     4,     5,    60,     7,     8,     9,    58,    11,    12,    13,
    46,    45,    58,    52,    18,    19,    20,    21,    22,    23,
    24,    47,   163,    50,    60,    60,    53,    60,    60,    52,
    52,     4,    72,    61,    38,    60,    44,    41,    42,     4,
    52,    72,    72,    72,    48,    49,    50,    51,    72,    53,
    54,    55,    56,    72,    58,    59,    52,    52,   109,    32,
    33,    34,    35,    36,    37,    52,   112,    61,    52,   120,
    52,    73,    73,     4,    74,   126,    61,   128,    52,     0,
   131,   132,   133,    73,     0,   136,    11,    48,    49,    50,
    51,    52,    53,    54,    55,    56,    57,    10,    59,   150,
   151,   152,   153,   154,   155,   156,   157,   158,   159,   160,
   161,   162,     6,    25,    26,    18,    14,    30,   127,    31,
    58,   112,   185,   129,    -1,    38,    39,    40,    -1,    -1,
    -1,    43,    -1,   184,   185,    48,    49,    50,    51,    -1,
    53,    54,    55,    56,    -1,    -1,    59,    -1,    -1,    62,
    63,    63,    64,    65,    66,    67,    68,    69,    70,    71,
    72,    27,    28,    29,    48,    49,    50,    51,    -1,    53,
    54,    55,    56,    -1,    -1,    59,    -1,    -1,    -1,    -1,
    -1,    -1,    48,    49,    50,    51,    52,    -1,    -1,    -1,
    56
};
/* -*-C-*-  Note some compilers choke on comments on `#line' lines.  */
#line 3 "/usr/share/bison.simple"

/* Skeleton output parser for bison,
   Copyright (C) 1984, 1989, 1990 Free Software Foundation, Inc.

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
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.  */

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */

#ifndef alloca
#ifdef __GNUC__
#define alloca __builtin_alloca
#else /* not GNU C.  */
#if (!defined (__STDC__) && defined (sparc)) || defined (__sparc__) || defined (__sparc) || defined (__sgi)
#include <alloca.h>
#else /* not sparc */
#if defined (MSDOS) && !defined (__TURBOC__)
#include <malloc.h>
#else /* not MSDOS, or __TURBOC__ */
#if defined(_AIX)
#include <malloc.h>
 #pragma alloca
#else /* not MSDOS, __TURBOC__, or _AIX */
#ifdef __hpux
#ifdef __cplusplus
extern "C" {
void *alloca (unsigned int);
};
#else /* not __cplusplus */
void *alloca ();
#endif /* not __cplusplus */
#endif /* __hpux */
#endif /* not _AIX */
#endif /* not MSDOS, or __TURBOC__ */
#endif /* not sparc.  */
#endif /* not GNU C.  */
#endif /* alloca not defined.  */

/* This is the parser code that is written into each bison parser
  when the %semantic_parser declaration is not specified in the grammar.
  It was written by Richard Stallman by simplifying the hairy parser
  used when %semantic_parser is specified.  */

/* Note: there must be only one dollar sign in this file.
   It is replaced by the list of actions, each action
   as one case of the switch.  */

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		-2
#define YYEOF		0
#define YYACCEPT	return(0)
#define YYABORT 	return(1)
#define YYERROR		goto yyerrlab1
/* Like YYERROR except do call yyerror.
   This remains here temporarily to ease the
   transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */
#define YYFAIL		goto yyerrlab
#define YYRECOVERING()  (!!yyerrstatus)
#define YYBACKUP(token, value) \
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    { yychar = (token), yylval = (value);			\
      yychar1 = YYTRANSLATE (yychar);				\
      YYPOPSTACK;						\
      goto yybackup;						\
    }								\
  else								\
    { yyerror ("syntax error: cannot back up"); YYERROR; }	\
while (0)

#define YYTERROR	1
#define YYERRCODE	256

#ifndef YYPURE
#define YYLEX		yylex()
#endif

#ifdef YYPURE
#ifdef YYLSP_NEEDED
#ifdef YYLEX_PARAM
#define YYLEX		yylex(&yylval, &yylloc, YYLEX_PARAM)
#else
#define YYLEX		yylex(&yylval, &yylloc)
#endif
#else /* not YYLSP_NEEDED */
#ifdef YYLEX_PARAM
#define YYLEX		yylex(&yylval, YYLEX_PARAM)
#else
#define YYLEX		yylex(&yylval)
#endif
#endif /* not YYLSP_NEEDED */
#endif

/* If nonreentrant, generate the variables here */

#ifndef YYPURE

int	yychar;			/*  the lookahead symbol		*/
YYSTYPE	yylval;			/*  the semantic value of the		*/
				/*  lookahead symbol			*/

#ifdef YYLSP_NEEDED
YYLTYPE yylloc;			/*  location data for the lookahead	*/
				/*  symbol				*/
#endif

int yynerrs;			/*  number of parse errors so far       */
#endif  /* not YYPURE */

#if YYDEBUG != 0
int yydebug;			/*  nonzero means print parse trace	*/
/* Since this is uninitialized, it does not stop multiple parsers
   from coexisting.  */
#endif

/*  YYINITDEPTH indicates the initial size of the parser's stacks	*/

#ifndef	YYINITDEPTH
#define YYINITDEPTH 200
#endif

/*  YYMAXDEPTH is the maximum size the stacks can grow to
    (effective only if the built-in stack extension method is used).  */

#if YYMAXDEPTH == 0
#undef YYMAXDEPTH
#endif

#ifndef YYMAXDEPTH
#define YYMAXDEPTH 10000
#endif

#ifndef YYPARSE_RETURN_TYPE
#define YYPARSE_RETURN_TYPE int
#endif

/* Prevent warning if -Wstrict-prototypes.  */
#ifdef __GNUC__
#ifdef YYPARSE_PARAM
YYPARSE_RETURN_TYPE yyparse (void* YYPARSE_PARAM);
#else
YYPARSE_RETURN_TYPE yyparse (void);
#endif
#endif

#if __GNUC__ > 1		/* GNU C and GNU C++ define this.  */
#define __yy_memcpy(TO,FROM,COUNT)	__builtin_memcpy(TO,FROM,COUNT)
#else				/* not GNU C or C++ */
#ifndef __cplusplus

/* This is the most reliable way to avoid incompatibilities
   in available built-in functions on various systems.  */
static void
__yy_memcpy (to, from, count)
     char *to;
     char *from;
     int count;
{
  register char *f = from;
  register char *t = to;
  register int i = count;

  while (i-- > 0)
    *t++ = *f++;
}

#else /* __cplusplus */

/* This is the most reliable way to avoid incompatibilities
   in available built-in functions on various systems.  */
static void
__yy_memcpy (char *to, char *from, int count)
{
  register char *f = from;
  register char *t = to;
  register int i = count;

  while (i-- > 0)
    *t++ = *f++;
}

#endif
#endif

#line 196 "/usr/share/bison.simple"

/* The user can define YYPARSE_PARAM as the name of an argument to be passed
   into yyparse.  The argument should have type void *.
   It should actually point to an object.
   Grammar actions can access the variable by casting it
   to the proper pointer type.  */

#ifdef YYPARSE_PARAM
#ifdef __cplusplus
#define YYPARSE_PARAM_ARG void *YYPARSE_PARAM
#define YYPARSE_PARAM_DECL
#else /* not __cplusplus */
#define YYPARSE_PARAM_ARG YYPARSE_PARAM
#define YYPARSE_PARAM_DECL void *YYPARSE_PARAM;
#endif /* not __cplusplus */
#else /* not YYPARSE_PARAM */
#define YYPARSE_PARAM_ARG
#define YYPARSE_PARAM_DECL
#endif /* not YYPARSE_PARAM */

YYPARSE_RETURN_TYPE
yyparse(YYPARSE_PARAM_ARG)
     YYPARSE_PARAM_DECL
{
  register int yystate;
  register int yyn;
  register short *yyssp;
  register YYSTYPE *yyvsp;
  int yyerrstatus;	/*  number of tokens to shift before error messages enabled */
  int yychar1 = 0;		/*  lookahead token as an internal (translated) token number */

  short	yyssa[YYINITDEPTH];	/*  the state stack			*/
  YYSTYPE yyvsa[YYINITDEPTH];	/*  the semantic value stack		*/

  short *yyss = yyssa;		/*  refer to the stacks thru separate pointers */
  YYSTYPE *yyvs = yyvsa;	/*  to allow yyoverflow to reallocate them elsewhere */

#ifdef YYLSP_NEEDED
  YYLTYPE yylsa[YYINITDEPTH];	/*  the location stack			*/
  YYLTYPE *yyls = yylsa;
  YYLTYPE *yylsp;

#define YYPOPSTACK   (yyvsp--, yyssp--, yylsp--)
#else
#define YYPOPSTACK   (yyvsp--, yyssp--)
#endif

  int yystacksize = YYINITDEPTH;

#ifdef YYPURE
  int yychar;
  YYSTYPE yylval;
  int yynerrs;
#ifdef YYLSP_NEEDED
  YYLTYPE yylloc;
#endif
#endif

  YYSTYPE yyval;		/*  the variable used to return		*/
				/*  semantic values from the action	*/
				/*  routines				*/

  int yylen;

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Starting parse\n");
#endif

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss - 1;
  yyvsp = yyvs;
#ifdef YYLSP_NEEDED
  yylsp = yyls;
#endif

/* Push a new state, which is found in  yystate  .  */
/* In all cases, when you get here, the value and location stacks
   have just been pushed. so pushing a state here evens the stacks.  */
yynewstate:

  *++yyssp = yystate;

  if (yyssp >= yyss + yystacksize - 1)
    {
      /* Give user a chance to reallocate the stack */
      /* Use copies of these so that the &'s don't force the real ones into memory. */
      YYSTYPE *yyvs1 = yyvs;
      short *yyss1 = yyss;
#ifdef YYLSP_NEEDED
      YYLTYPE *yyls1 = yyls;
#endif

      /* Get the current used size of the three stacks, in elements.  */
      int size = yyssp - yyss + 1;

#ifdef yyoverflow
      /* Each stack pointer address is followed by the size of
	 the data in use in that stack, in bytes.  */
#ifdef YYLSP_NEEDED
      /* This used to be a conditional around just the two extra args,
	 but that might be undefined if yyoverflow is a macro.  */
      yyoverflow("parser stack overflow",
		 &yyss1, size * sizeof (*yyssp),
		 &yyvs1, size * sizeof (*yyvsp),
		 &yyls1, size * sizeof (*yylsp),
		 &yystacksize);
#else
      yyoverflow("parser stack overflow",
		 &yyss1, size * sizeof (*yyssp),
		 &yyvs1, size * sizeof (*yyvsp),
		 &yystacksize);
#endif

      yyss = yyss1; yyvs = yyvs1;
#ifdef YYLSP_NEEDED
      yyls = yyls1;
#endif
#else /* no yyoverflow */
      /* Extend the stack our own way.  */
      if (yystacksize >= YYMAXDEPTH)
	{
	  yyerror("parser stack overflow");
	  return 2;
	}
      yystacksize *= 2;
      if (yystacksize > YYMAXDEPTH)
	yystacksize = YYMAXDEPTH;
      yyss = (short *) alloca (yystacksize * sizeof (*yyssp));
      __yy_memcpy ((char *)yyss, (char *)yyss1, size * sizeof (*yyssp));
      yyvs = (YYSTYPE *) alloca (yystacksize * sizeof (*yyvsp));
      __yy_memcpy ((char *)yyvs, (char *)yyvs1, size * sizeof (*yyvsp));
#ifdef YYLSP_NEEDED
      yyls = (YYLTYPE *) alloca (yystacksize * sizeof (*yylsp));
      __yy_memcpy ((char *)yyls, (char *)yyls1, size * sizeof (*yylsp));
#endif
#endif /* no yyoverflow */

      yyssp = yyss + size - 1;
      yyvsp = yyvs + size - 1;
#ifdef YYLSP_NEEDED
      yylsp = yyls + size - 1;
#endif

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Stack size increased to %d\n", yystacksize);
#endif

      if (yyssp >= yyss + yystacksize - 1)
	YYABORT;
    }

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Entering state %d\n", yystate);
#endif

  goto yybackup;
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
#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Reading a token: ");
#endif
      yychar = YYLEX;
    }

  /* Convert token to internal form (in yychar1) for indexing tables with */

  if (yychar <= 0)		/* This means end of input. */
    {
      yychar1 = 0;
      yychar = YYEOF;		/* Don't call YYLEX any more */

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Now at end of input.\n");
#endif
    }
  else
    {
      yychar1 = YYTRANSLATE(yychar);

#if YYDEBUG != 0
      if (yydebug)
	{
	  fprintf (stderr, "Next token is %d (%s", yychar, yytname[yychar1]);
	  /* Give the individual parser a way to print the precise meaning
	     of a token, for further debugging info.  */
#ifdef YYPRINT
	  YYPRINT (stderr, yychar, yylval);
#endif
	  fprintf (stderr, ")\n");
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

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Shifting token %d (%s), ", yychar, yytname[yychar1]);
#endif

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  *++yyvsp = yylval;
#ifdef YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  /* count tokens shifted since error; after three, turn off error status.  */
  if (yyerrstatus) yyerrstatus--;

  yystate = yyn;
  goto yynewstate;

/* Do the default action for the current state.  */
yydefault:

  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;

/* Do a reduction.  yyn is the number of a rule to reduce with.  */
yyreduce:
  yylen = yyr2[yyn];
  if (yylen > 0)
    yyval = yyvsp[1-yylen]; /* implement default value of the action */

#if YYDEBUG != 0
  if (yydebug)
    {
      int i;

      fprintf (stderr, "Reducing via rule %d (line %d), ",
	       yyn, yyrline[yyn]);

      /* Print the symbols being reduced, and their result.  */
      for (i = yyprhs[yyn]; yyrhs[i] > 0; i++)
	fprintf (stderr, "%s ", yytname[yyrhs[i]]);
      fprintf (stderr, " -> %s\n", yytname[yyr1[yyn]]);
    }
#endif


  switch (yyn) {

case 1:
#line 377 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 4:
#line 385 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 5:
#line 387 "imcc.y"
{ yyval.i = iANY(yyvsp[-1].s,0,regs,1); free(yyvsp[-1].s); ;
    break;}
case 6:
#line 388 "imcc.y"
{ yyval.i = 0;;
    break;}
case 8:
#line 396 "imcc.y"
{ yyval.i = 0;;
    break;}
case 9:
#line 397 "imcc.y"
{ emit_flush(); clear_tables();yyval.i=0;;
    break;}
case 14:
#line 410 "imcc.y"
{
          yyval.i = 0; MK_I("ret", R0());
	  allocate();
	  emit_flush();
	  clear_tables();
        ;
    break;}
case 15:
#line 416 "imcc.y"
{ yyval.i=0; ;
    break;}
case 16:
#line 417 "imcc.y"
{ yyval.i=0; ;
    break;}
case 17:
#line 421 "imcc.y"
{ yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        ;
    break;}
case 21:
#line 433 "imcc.y"
{ yyval.i = NULL; ;
    break;}
case 26:
#line 442 "imcc.y"
{ yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); ;
    break;}
case 27:
#line 446 "imcc.y"
{ yyval.i = yyvsp[-1].i; ;
    break;}
case 30:
#line 451 "imcc.y"
{ mk_ident(yyvsp[0].s, yyvsp[-1].t); ;
    break;}
case 31:
#line 452 "imcc.y"
{ mk_ident(yyvsp[0].s, yyvsp[-1].t); ;
    break;}
case 32:
#line 453 "imcc.y"
{ yyval.i = 0;
            warning("parser", "file %s line %d: %s already defined\n",
            sourcefile, line, yyvsp[0].sr->name); ;
    break;}
case 33:
#line 456 "imcc.y"
{ yyval.i = MK_I("restore",
		                            R1(mk_ident(yyvsp[0].s, yyvsp[-1].t)));;
    break;}
case 34:
#line 458 "imcc.y"
{ yyval.i = MK_I("restore", R1(yyvsp[0].sr)); ;
    break;}
case 35:
#line 459 "imcc.y"
{ yyval.i = MK_I("restore", R1(yyvsp[0].sr)); ;
    break;}
case 36:
#line 460 "imcc.y"
{ yyval.i = MK_I("restore", R1(yyvsp[0].sr)); ;
    break;}
case 37:
#line 461 "imcc.y"
{ yyval.i = MK_I("save", R1(yyvsp[0].sr)); ;
    break;}
case 38:
#line 462 "imcc.y"
{ yyval.i = MK_I("save", R1(yyvsp[0].sr)); ;
    break;}
case 39:
#line 463 "imcc.y"
{ yyval.i = MK_I("save", R1(yyvsp[0].sr)); ;
    break;}
case 40:
#line 464 "imcc.y"
{ yyval.i = MK_I("bsr",
                                              R1(mk_address(yyvsp[0].s, U_add_once)));;
    break;}
case 41:
#line 466 "imcc.y"
{ yyval.i = MK_I("branch",
                                              R1(mk_address(yyvsp[0].s, U_add_once)));;
    break;}
case 42:
#line 468 "imcc.y"
{ yyval.i = MK_I("inc",R1(yyvsp[0].sr)); ;
    break;}
case 43:
#line 469 "imcc.y"
{ yyval.i = MK_I("dec",R1(yyvsp[0].sr)); ;
    break;}
case 44:
#line 470 "imcc.y"
{ yyval.i = MK_I("print",R1(yyvsp[0].sr)); ;
    break;}
case 45:
#line 471 "imcc.y"
{ yyval.i = MK_I("saveall" ,R0()); ;
    break;}
case 46:
#line 472 "imcc.y"
{ yyval.i = MK_I("restoreall" ,R0()); ;
    break;}
case 47:
#line 473 "imcc.y"
{ yyval.i = MK_I("end" ,R0()); ;
    break;}
case 48:
#line 474 "imcc.y"
{ yyval.i = iANY(yyvsp[-1].s,0,regs, 1); free(yyvsp[-1].s); ;
    break;}
case 49:
#line 475 "imcc.y"
{ yyval.i = 0;;
    break;}
case 50:
#line 479 "imcc.y"
{ yyval.t = 'I'; ;
    break;}
case 51:
#line 480 "imcc.y"
{ yyval.t = 'N'; ;
    break;}
case 52:
#line 481 "imcc.y"
{ yyval.t = 'S'; ;
    break;}
case 53:
#line 482 "imcc.y"
{ yyval.t = 'P'; free(yyvsp[0].s); ;
    break;}
case 55:
#line 490 "imcc.y"
{ yyval.i = MK_I("set", R2(yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 56:
#line 491 "imcc.y"
{ yyval.i = MK_I("not", R2(yyvsp[-3].sr, yyvsp[0].sr));;
    break;}
case 57:
#line 492 "imcc.y"
{ yyval.i = MK_I("neg", R2(yyvsp[-3].sr, yyvsp[0].sr));;
    break;}
case 58:
#line 493 "imcc.y"
{ yyval.i = MK_I("add", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 59:
#line 494 "imcc.y"
{ yyval.i = MK_I("sub", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 60:
#line 495 "imcc.y"
{ yyval.i = MK_I("mul", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 61:
#line 496 "imcc.y"
{ yyval.i = MK_I("pow", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 62:
#line 497 "imcc.y"
{ yyval.i = MK_I("div", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 63:
#line 498 "imcc.y"
{ yyval.i = MK_I("mod", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 64:
#line 499 "imcc.y"
{ yyval.i = MK_I("concat", R3(yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr)); ;
    break;}
case 65:
#line 500 "imcc.y"
{ yyval.i = MK_I("shl", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 66:
#line 501 "imcc.y"
{ yyval.i = MK_I("shr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 67:
#line 502 "imcc.y"
{ yyval.i = MK_I("xor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 68:
#line 503 "imcc.y"
{ yyval.i = MK_I("band", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 69:
#line 504 "imcc.y"
{ yyval.i = MK_I("bor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 70:
#line 505 "imcc.y"
{ yyval.i = MK_I("bxor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 71:
#line 506 "imcc.y"
{ yyval.i = iINDEXFETCH(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); ;
    break;}
case 72:
#line 507 "imcc.y"
{ yyval.i = iINDEXSET(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); ;
    break;}
case 73:
#line 508 "imcc.y"
{ yyval.i = iNEW(yyvsp[-3].sr, yyvsp[0].s, 1); ;
    break;}
case 74:
#line 509 "imcc.y"
{ yyval.i = MK_I("defined %s, %s",R2(yyvsp[-3].sr,yyvsp[0].sr)); ;
    break;}
case 75:
#line 510 "imcc.y"
{ yyval.i = MK_I("clone %s, %s",R2(yyvsp[-3].sr, yyvsp[0].sr));
    ;
    break;}
case 76:
#line 512 "imcc.y"
{ yyval.i = MK_I("set_addr",
                                          R2(yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once))); ;
    break;}
case 77:
#line 514 "imcc.y"
{ yyval.i = MK_I("find_global",R2(yyvsp[-3].sr,yyvsp[0].sr)); ;
    break;}
case 78:
#line 515 "imcc.y"
{ yyval.i = MK_I("store_global",R2(yyvsp[-2].sr,yyvsp[0].sr)); ;
    break;}
case 79:
#line 519 "imcc.y"
{ yyval.i=MK_I(yyvsp[-3].s,R3(yyvsp[-4].sr,yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s,U_add_once))); ;
    break;}
case 80:
#line 521 "imcc.y"
{yyval.i= MK_I("if", R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); ;
    break;}
case 81:
#line 523 "imcc.y"
{yyval.i= MK_I("unless",R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); ;
    break;}
case 82:
#line 528 "imcc.y"
{ yyval.s = "eq"; ;
    break;}
case 83:
#line 529 "imcc.y"
{ yyval.s = "ne"; ;
    break;}
case 84:
#line 530 "imcc.y"
{ yyval.s = "gt"; ;
    break;}
case 85:
#line 531 "imcc.y"
{ yyval.s = "ge"; ;
    break;}
case 86:
#line 532 "imcc.y"
{ yyval.s = "lt"; ;
    break;}
case 87:
#line 533 "imcc.y"
{ yyval.s = "le"; ;
    break;}
case 92:
#line 544 "imcc.y"
{ yyval.sr = NULL; ;
    break;}
case 93:
#line 545 "imcc.y"
{ yyval.sr = yyvsp[0].sr; ;
    break;}
case 94:
#line 548 "imcc.y"
{ yyval.sr = regs[0]; ;
    break;}
case 96:
#line 552 "imcc.y"
{ regs[nargs++] = yyvsp[0].sr; ;
    break;}
case 97:
#line 553 "imcc.y"
{ regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; ;
    break;}
case 98:
#line 558 "imcc.y"
{ yyval.sr = mk_address(yyvsp[0].s, U_add_once); ;
    break;}
case 100:
#line 560 "imcc.y"
{ yyval.sr = macro(yyvsp[0].s+1); free(yyvsp[0].s); ;
    break;}
case 103:
#line 567 "imcc.y"
{ nkeys=0; ;
    break;}
case 104:
#line 568 "imcc.y"
{ yyval.sr = link_keys(nkeys, keys); ;
    break;}
case 105:
#line 571 "imcc.y"
{ keys[nkeys++] = yyvsp[0].sr; ;
    break;}
case 106:
#line 572 "imcc.y"
{ keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; ;
    break;}
case 110:
#line 582 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'I'); ;
    break;}
case 111:
#line 583 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'N'); ;
    break;}
case 112:
#line 584 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'S'); ;
    break;}
case 113:
#line 585 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'P'); ;
    break;}
case 114:
#line 586 "imcc.y"
{ yyval.sr = mk_pasm_reg(yyvsp[0].s); ;
    break;}
case 115:
#line 589 "imcc.y"
{ yyval.sr = mk_const(yyvsp[0].s, 'I'); ;
    break;}
case 116:
#line 590 "imcc.y"
{ yyval.sr = mk_const(yyvsp[0].s, 'N'); ;
    break;}
case 117:
#line 591 "imcc.y"
{ yyval.sr = mk_const(yyvsp[0].s, 'S'); ;
    break;}
case 118:
#line 594 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'S'); ;
    break;}
case 119:
#line 595 "imcc.y"
{ yyval.sr = mk_const(yyvsp[0].s, 'S'); ;
    break;}
}
   /* the action file gets copied in in place of this dollarsign */
#line 498 "/usr/share/bison.simple"

  yyvsp -= yylen;
  yyssp -= yylen;
#ifdef YYLSP_NEEDED
  yylsp -= yylen;
#endif

#if YYDEBUG != 0
  if (yydebug)
    {
      short *ssp1 = yyss - 1;
      fprintf (stderr, "state stack now");
      while (ssp1 != yyssp)
	fprintf (stderr, " %d", *++ssp1);
      fprintf (stderr, "\n");
    }
#endif

  *++yyvsp = yyval;

#ifdef YYLSP_NEEDED
  yylsp++;
  if (yylen == 0)
    {
      yylsp->first_line = yylloc.first_line;
      yylsp->first_column = yylloc.first_column;
      yylsp->last_line = (yylsp-1)->last_line;
      yylsp->last_column = (yylsp-1)->last_column;
      yylsp->text = 0;
    }
  else
    {
      yylsp->last_line = (yylsp+yylen-1)->last_line;
      yylsp->last_column = (yylsp+yylen-1)->last_column;
    }
#endif

  /* Now "shift" the result of the reduction.
     Determine what state that goes to,
     based on the state we popped back to
     and the rule number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTBASE] + *yyssp;
  if (yystate >= 0 && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTBASE];

  goto yynewstate;

yyerrlab:   /* here on detecting error */

  if (! yyerrstatus)
    /* If not already recovering from an error, report this error.  */
    {
      ++yynerrs;

#ifdef YYERROR_VERBOSE
      yyn = yypact[yystate];

      if (yyn > YYFLAG && yyn < YYLAST)
	{
	  int size = 0;
	  char *msg;
	  int x, count;

	  count = 0;
	  /* Start X at -yyn if nec to avoid negative indexes in yycheck.  */
	  for (x = (yyn < 0 ? -yyn : 0);
	       x < (sizeof(yytname) / sizeof(char *)); x++)
	    if (yycheck[x + yyn] == x)
	      size += strlen(yytname[x]) + 15, count++;
	  msg = (char *) malloc(size + 15);
	  if (msg != 0)
	    {
	      strcpy(msg, "parse error");

	      if (count < 5)
		{
		  count = 0;
		  for (x = (yyn < 0 ? -yyn : 0);
		       x < (sizeof(yytname) / sizeof(char *)); x++)
		    if (yycheck[x + yyn] == x)
		      {
			strcat(msg, count == 0 ? ", expecting `" : " or `");
			strcat(msg, yytname[x]);
			strcat(msg, "'");
			count++;
		      }
		}
	      yyerror(msg);
	      free(msg);
	    }
	  else
	    yyerror ("parse error; also virtual memory exceeded");
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror("parse error");
    }

  goto yyerrlab1;
yyerrlab1:   /* here on error raised explicitly by an action */

  if (yyerrstatus == 3)
    {
      /* if just tried and failed to reuse lookahead token after an error, discard it.  */

      /* return failure if at end of input */
      if (yychar == YYEOF)
	YYABORT;

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Discarding token %d (%s).\n", yychar, yytname[yychar1]);
#endif

      yychar = YYEMPTY;
    }

  /* Else will try to reuse lookahead token
     after shifting the error token.  */

  yyerrstatus = 3;		/* Each real token shifted decrements this */

  goto yyerrhandle;

yyerrdefault:  /* current state does not do anything special for the error token. */

#if 0
  /* This is wrong; only states that explicitly want error tokens
     should shift them.  */
  yyn = yydefact[yystate];  /* If its default is to accept any token, ok.  Otherwise pop it.*/
  if (yyn) goto yydefault;
#endif

yyerrpop:   /* pop the current state because it cannot handle the error token */

  if (yyssp == yyss) YYABORT;
  yyvsp--;
  yystate = *--yyssp;
#ifdef YYLSP_NEEDED
  yylsp--;
#endif

#if YYDEBUG != 0
  if (yydebug)
    {
      short *ssp1 = yyss - 1;
      fprintf (stderr, "Error: state stack now");
      while (ssp1 != yyssp)
	fprintf (stderr, " %d", *++ssp1);
      fprintf (stderr, "\n");
    }
#endif

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

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Shifting error token, ");
#endif

  *++yyvsp = yylval;
#ifdef YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  yystate = yyn;
  goto yynewstate;
}
#line 597 "imcc.y"


extern FILE *yyin;
int IMCC_DEBUG;
int gc_off;
static int pbc, write_pbc;
char* output;

static void usage(FILE *fp)
{
    fprintf(fp, "imcc [-h|--help] [-V|--version] [-d|--debug] [-v|--verbose]\n");
    fprintf(fp, "\t[-y|--yydebug] [-r|--runpbc] [-t|--trace] [-o outfile] infile\n");
    exit(fp != stdout);
}


static void help()
{
    usage(stdout);
}

static void version()
{
    printf("imcc version " IMCC_VERSION "\n");
    exit(0);
}

#define setopt(flag) Parrot_setflag(interpreter, flag, (*argv)[0]+2)
#define unsetopt(flag) Parrot_setflag(interpreter, flag, 0)

/* most stolen from test_main.c */
char *
parseflags(Parrot_Interp interpreter, int *argc, char **argv[])
{
    if (*argc == 1) {
        usage(stderr);
	}

    /* skip the program name arg */
    (*argc)--;
    (*argv)++;

#ifdef HAVE_COMPUTED_GOTO
    setopt(PARROT_CGOTO_FLAG);
#endif

    while ((*argc) && (*argv)[0][0] == '-') {
        switch ((*argv)[0][1]) {
        case 'b':
            setopt(PARROT_BOUNDS_FLAG);
            break;
        case 'j':
            setopt(PARROT_JIT_FLAG);
            break;
        case 'p':
            setopt(PARROT_PROFILE_FLAG);
            break;
        case 'P':
            setopt(PARROT_PREDEREF_FLAG);
            break;
        case 'g':
            unsetopt(PARROT_CGOTO_FLAG);
            break;
        case 't':
            setopt(PARROT_TRACE_FLAG);
            break;
        case 'd':
            if (!Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG))
            setopt(PARROT_DEBUG_FLAG);
            else
            IMCC_DEBUG++;
            break;
        case 'w':
            Parrot_setwarnings(interpreter, PARROT_WARNINGS_ALL_FLAG);
            break;
        case 'G':
            gc_off = 1;
            break;
        case '.':  /* Give Windows Parrot hackers an opportunity to
                    * attach a debuggger. */
            fgetc(stdin);
            break;
        case 'h':
            usage(stdin);
            break;
        case 'V':
            version();
            break;
        case 'r':
            pbc = 1;
            break;
        case 'c':
            write_pbc = 1;
            break;
        case 'v':
	    IMCC_VERBOSE++;
            break;
        case 'y':
	    yydebug = 1;
            break;
        case 'o':
            if ((*argv)[0][2])
                output = str_dup((*argv)[0]+2);
            else {
                (*argc)--;
                output = str_dup((++(*argv))[0]);
	}
	break;

        case 'O':
	    strncpy(optimizer_opt, (*argv)[0]+2,sizeof(optimizer_opt));
	    optimizer_opt[sizeof(optimizer_opt)-1] = '\0';
            break;
        case '-':
            /* XXX long options */
            (*argc)--;
            (*argv)++;

            goto OUT;
        case '\0':             /* bare '-' means read from stdin */
            goto OUT;
        default:
            fatal(1, "main", "Invalid flag %s used\n", (*argv)[0]);
            exit(1);
    }

        (*argc)--;
        (*argv)++;
    }

  OUT:

    return (*argv)[0];
}


int main(int argc, char * argv[])
{
    int stacktop;
    struct PackFile *pf;

    interpreter = Parrot_new();
    Parrot_init(interpreter, (void*)&stacktop);
    pf = PackFile_new();
    interpreter->code = pf;
    interpreter->DOD_block_level++;

    sourcefile = parseflags(interpreter, &argc, &argv);

    /* default optimizations, s. optimizer.c */
    if (!*optimizer_opt)
	strcpy(optimizer_opt, "0");

    if (!sourcefile || !*sourcefile) {
        fatal(EX_NOINPUT, "main", "No source file specified.\n" );
    }
    else if (!strcmp(sourcefile, "-"))
       yyin = stdin;
    else
        if(!(yyin = fopen(sourcefile, "r")))    {
            fatal(EX_IOERR, "main", "Error reading source file %s.\n",
                    sourcefile);
    }

    if (!output)
        output = str_dup(pbc ? "a.pbc" : "a.pasm");

    if (IMCC_VERBOSE) {
        info(1,"Reading %s", yyin == stdin ? "stdin":sourcefile);
        if (pbc)
            info(1, ", executing");
        if (write_pbc)
            info(1, " and writing %s\n", output);
        else
            info(1,"\n");
    }
    info(1, "using optimization '%s'\n", optimizer_opt);

    line = 1;
    emit_open(write_pbc | pbc, output);

    debug(1, "Starting parse...\n");

    yyparse();
    emit_close();
    fclose(yyin);

    info(1, "%ld lines compiled.\n", line);
    if (write_pbc) {
        size_t size;
        opcode_t *packed;
        FILE *fp;

        size = PackFile_pack_size(interpreter->code);
        info(1, "packed code %d bytes\n", size);
        packed = (opcode_t*) mem_sys_allocate(size);
        if (!packed)
            fatal(1, "main", "Out of mem\n");
        PackFile_pack(interpreter->code, packed);
        if ((fp = fopen(output, "wb")) == 0)
            fatal(1, "main", "Couldn't open %s\n", output);
        if ((1 != fwrite(packed, size, 1, fp)) )
            fatal(1, "main", "Couldn't write %s\n", output);
        fclose(fp);
        info(1, "%s written.\n", output);
        free(packed);
    }
    if (pbc == 1) {
        if (!gc_off)
            interpreter->DOD_block_level--;
        info(1, "Running...\n");
        Parrot_runcode(interpreter, argc, argv);
        /* XXX no return value :-( */
        Parrot_destroy(interpreter);
    }
    free(output);

    return 0;
}

int yyerror(char * s)
{
    fprintf(stderr, "last token = [%s]\n", yylval.s);
    fprintf(stderr, "(error) line %ld: %s\n", line, s );
    fprintf(stderr, "Didn't create output asm.\n" );
    exit(EX_UNAVAILABLE);
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
