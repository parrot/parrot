
/*  A Bison parser, made from imcc.y
 by  GNU Bison version 1.25
  */

#define YYBISON 1  /* Identify Bison output.  */

#define	CALL	258
#define	GOTO	259
#define	ARG	260
#define	PRINT	261
#define	IF	262
#define	UNLESS	263
#define	NEW	264
#define	END	265
#define	SAVEALL	266
#define	RESTOREALL	267
#define	SUB	268
#define	NAMESPACE	269
#define	ENDNAMESPACE	270
#define	CLASS	271
#define	ENDCLASS	272
#define	SYM	273
#define	LOCAL	274
#define	PARAM	275
#define	INC	276
#define	DEC	277
#define	SHIFT_LEFT	278
#define	SHIFT_RIGHT	279
#define	INTV	280
#define	FLOATV	281
#define	STRINGV	282
#define	DEFINED	283
#define	LOG_XOR	284
#define	RELOP_EQ	285
#define	RELOP_NE	286
#define	RELOP_GT	287
#define	RELOP_GTE	288
#define	RELOP_LT	289
#define	RELOP_LTE	290
#define	GLOBAL	291
#define	ADDR	292
#define	CLONE	293
#define	RESULT	294
#define	RETURN	295
#define	POW	296
#define	SHIFT_RIGHT_U	297
#define	LOG_AND	298
#define	LOG_OR	299
#define	COMMA	300
#define	ESUB	301
#define	LABEL	302
#define	EMIT	303
#define	EOM	304
#define	IREG	305
#define	NREG	306
#define	SREG	307
#define	PREG	308
#define	IDENTIFIER	309
#define	STRINGC	310
#define	INTC	311
#define	FLOATC	312
#define	REG	313
#define	MACRO	314
#define	PARROT_OP	315
#define	VAR	316

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
int         pasm_file = 0;

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
#define KEY_BIT(argnum) (1 << (argnum))

static SymReg ** RR(int n, ...)
{
    va_list ap;
    int i = 0;

    va_start(ap, n);
    while (n--) {
	regs[i++] = va_arg(ap, SymReg *);
    }
    va_end(ap);
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
        MK_I("substr %s, %s, %s, %s", R4(r0, r1,r3, r2));
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
    sprintf(fmt, "%%s, %d\t # .%s", atoi(pmc->name), type);
    r0->usage = U_NEW;
    if (!strcmp(type, "PerlArray") || !strcmp(type, "PerlHash"))
        r0->usage |= U_KEYED;
    free(type);
    regs[0] = r0;
    regs[1] = pmc;
    nargs = 2;
    return iANY("new", fmt, regs, emit);
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


static Instruction *
multi_keyed(char *name, SymReg ** regs, int nr, int emit)
{
    int i, keys, kv, n;
    char buf[16];
    static int p = 0;
    SymReg *preg[IMCC_MAX_REGS];    /* px,py,pz */
    SymReg *nreg[IMCC_MAX_REGS];
    Instruction * ins, *last;

    /* count keys in keyvec */
    kv = keyvec;
    for (i = keys = 0; i < nr; i++, kv >>= 1)
        if (kv & 1)
            keys++;
    if (keys <= 1)
        return 0;
    /* XXX what to do, if we don't emit instruction? */
    assert(emit);
    /* OP  _p_k    _p_k_p_k =>
     * set      py, p_k
     * set      pz,     p_k
     * new px, .PerlUndef
     * OP  px, py, pz
     * set _p_k_px
     */

    kv = keyvec;
    for (i = n = 0; i < nr; i++, kv >>= 1, n++) {
        if (kv & 1) {
            fataly(EX_SOFTWARE, "multi_keyed", line,"illegal key operand\n");
        }
        /* make a new P symbol */
        while (1) {
            sprintf(buf, "$P%d", ++p);
            if (get_sym(buf) == 0)
                break;
        }
        preg[n] = mk_symreg(buf, 'P');
        kv >>= 1;
        if (kv & 1) {
            /* we have a keyed operand */
            if (regs[i]->set != 'P') {
                fataly(EX_SOFTWARE, "multi_keyed", line,"not an aggregate\n");
            }
            nargs = 3;
            /* don't emit LHS yet */
            if (i == 0) {
                keyvec = 1 << 1;
                nreg[0] = regs[i];
                nreg[1] = regs[i+1];
                nreg[2] = preg[n];
                /* set p_k px */
                ins = iANY(str_dup("set"), 0, nreg, 0);
            }
            else {
                keyvec = 1 << 2;
                nreg[0] = preg[n];
                nreg[1] = regs[i];
                nreg[2] = regs[i+1];
                /* set py|z p_k */
                iANY(str_dup("set"), 0, nreg, 1);
            }
            i++;
        }
        /* non keyed */
        else {
            nargs = 2;
            keyvec = 0;
            if (i == 0) {
                nreg[0] = regs[i];
                nreg[1] = preg[n];
                /* set n, px */
                ins = iANY(str_dup("set"), 0, nreg, 0);
            }
            else {
                nreg[0] = preg[n];
                nreg[1] = regs[i];
                /* set px, n */
                iANY(str_dup("set"), 0, nreg, 1);
            }
        }
    }
    /* make a new undef */
    iNEW(preg[0], str_dup("PerlUndef"), 1);
    /* emit the operand */
    nargs = 3;
    keyvec = 0;
    iANY(name, 0, preg, 1);
    /* emit the LHS op */
    emitb(ins);
    return ins;
}

Instruction * iANY(char * name, char *fmt, SymReg **regs, int emit) {
    char fullname[64];
    int i;
    int dirs = 0;
    int op;
    Instruction * ins;

#if 1
    ins = multi_keyed(name, regs, nargs, emit);
    if (ins)
        return ins;
#endif
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
            /* XXX probably a CATCH block */
            ins->type = ITADDR | IF_r1_branch | ITBRANCH;
        }
    } else {
        fataly(EX_SOFTWARE, "iANY", line,"op not found '%s' (%s<%d>)\n",
                fullname, name, nargs);
    }
    return ins;
}


#line 441 "imcc.y"
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



#define	YYFINAL		228
#define	YYFLAG		-32768
#define	YYNTBASE	77

#define YYTRANSLATE(x) ((unsigned)(x) <= 316 ? yytranslate[x] : 119)

static const char yytranslate[] = {     0,
     2,     2,     2,     2,     2,     2,     2,     2,     2,    62,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,    64,     2,     2,     2,    70,    72,     2,     2,
     2,    68,    67,     2,    65,    71,    69,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,    76,     2,
    63,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
    74,     2,    75,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,    73,     2,    66,     2,     2,     2,     2,
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
    56,    57,    58,    59,    60,    61
};

#if YYDEBUG != 0
static const short yyprhs[] = {     0,
     0,     2,     4,     7,    11,    12,    16,    17,    19,    20,
    25,    27,    30,    33,    35,    39,    41,    43,    47,    49,
    52,    53,    56,    57,    59,    62,    64,    67,    69,    73,
    75,    77,    81,    84,    87,    91,    95,    99,   102,   105,
   108,   111,   114,   117,   120,   123,   126,   128,   130,   132,
   135,   136,   138,   140,   142,   144,   146,   150,   155,   160,
   165,   171,   177,   183,   189,   195,   201,   207,   213,   219,
   225,   231,   237,   243,   249,   255,   261,   268,   275,   280,
   285,   293,   298,   303,   308,   313,   314,   320,   325,   333,
   338,   340,   347,   352,   357,   362,   367,   369,   371,   373,
   375,   377,   379,   381,   383,   385,   387,   388,   390,   394,
   396,   398,   403,   405,   407,   409,   411,   413,   414,   417,
   419,   423,   425,   427,   429,   431,   433,   435,   437,   439,
   441,   443,   445,   447
};

static const short yyrhs[] = {    86,
     0,    79,     0,    78,    79,     0,    92,    80,    62,     0,
     0,    81,    60,    82,     0,     0,   106,     0,     0,    48,
    78,    84,    49,     0,    62,     0,    85,    62,     0,    86,
    87,     0,    87,     0,    88,    89,    46,     0,    83,     0,
    85,     0,    13,    54,    62,     0,    90,     0,    89,    90,
     0,     0,    91,    95,     0,     0,    93,     0,    93,    94,
     0,    94,     0,    94,    62,     0,    47,     0,    92,    96,
    62,     0,    99,     0,   102,     0,    18,    97,    54,     0,
    14,    54,     0,    15,    54,     0,    19,    97,    54,     0,
    19,    97,    61,     0,    20,    97,    54,     0,    20,   116,
     0,    39,   110,     0,     5,   110,     0,    40,   110,     0,
     3,    54,     0,     4,    54,     0,    21,   110,     0,    22,
   110,     0,     6,   110,     0,    11,     0,    12,     0,    10,
     0,    60,   106,     0,     0,    25,     0,    26,     0,    27,
     0,    98,     0,    54,     0,   104,    63,   110,     0,   104,
    63,    64,   110,     0,   104,    63,    65,   110,     0,   104,
    63,    66,   110,     0,   104,    63,   110,    67,   110,     0,
   104,    63,   110,    65,   110,     0,   104,    63,   110,    68,
   110,     0,   104,    63,   110,    41,   110,     0,   104,    63,
   110,    69,   110,     0,   104,    63,   110,    70,   110,     0,
   104,    63,   110,    71,   110,     0,   104,    63,   110,    23,
   110,     0,   104,    63,   110,    24,   110,     0,   104,    63,
   110,    42,   110,     0,   104,    63,   110,    43,   110,     0,
   104,    63,   110,    44,   110,     0,   104,    63,   110,    29,
   110,     0,   104,    63,   110,    72,   110,     0,   104,    63,
   110,    73,   110,     0,   104,    63,   110,    66,   110,     0,
   104,    63,   110,    74,   111,    75,     0,   110,    74,   111,
    75,    63,   110,     0,   104,    63,     9,    98,     0,   104,
    63,    28,   110,     0,   104,    63,    28,   110,    74,   111,
    75,     0,   104,    63,    38,   110,     0,   104,    63,    37,
    54,     0,   104,    63,    36,   118,     0,    36,   118,    63,
   110,     0,     0,     9,   100,   104,    45,   101,     0,    28,
   104,    45,   110,     0,    28,   104,    45,   110,    74,   111,
    75,     0,    38,   104,    45,   110,     0,    59,     0,     7,
   110,   103,   110,     4,    54,     0,     7,   110,     4,    54,
     0,     8,   110,     4,    54,     0,     7,   110,    45,    54,
     0,     8,   110,    45,    54,     0,    30,     0,    31,     0,
    32,     0,    33,     0,    34,     0,    35,     0,    61,     0,
   116,     0,    61,     0,   116,     0,     0,   107,     0,   107,
    45,   108,     0,   108,     0,   109,     0,   105,    74,   111,
    75,     0,    54,     0,   110,     0,    59,     0,    61,     0,
   115,     0,     0,   112,   113,     0,   114,     0,   113,    76,
   114,     0,   110,     0,   116,     0,   117,     0,    50,     0,
    51,     0,    52,     0,    53,     0,    58,     0,    56,     0,
    57,     0,    55,     0,    52,     0,    55,     0
};

#endif

#if YYDEBUG != 0
static const short yyrline[] = { 0,
   477,   482,   483,   486,   488,   489,   490,   493,   497,   499,
   502,   504,   507,   508,   511,   518,   519,   522,   528,   529,
   532,   533,   536,   537,   540,   541,   542,   545,   548,   551,
   553,   554,   555,   556,   557,   558,   561,   563,   564,   565,
   566,   567,   569,   571,   572,   573,   574,   575,   576,   577,
   578,   581,   583,   584,   585,   588,   592,   594,   595,   596,
   597,   598,   599,   600,   601,   602,   603,   604,   605,   606,
   607,   608,   609,   610,   611,   612,   613,   614,   615,   616,
   617,   619,   621,   623,   624,   625,   626,   627,   628,   630,
   633,   636,   639,   641,   643,   645,   650,   652,   653,   654,
   655,   656,   660,   661,   663,   664,   667,   668,   671,   672,
   675,   676,   680,   682,   683,   686,   687,   690,   691,   694,
   695,   698,   701,   702,   705,   706,   707,   708,   709,   712,
   713,   714,   717,   718
};
#endif


#if YYDEBUG != 0 || defined (YYERROR_VERBOSE)

static const char * const yytname[] = {   "$","error","$undefined.","CALL","GOTO",
"ARG","PRINT","IF","UNLESS","NEW","END","SAVEALL","RESTOREALL","SUB","NAMESPACE",
"ENDNAMESPACE","CLASS","ENDCLASS","SYM","LOCAL","PARAM","INC","DEC","SHIFT_LEFT",
"SHIFT_RIGHT","INTV","FLOATV","STRINGV","DEFINED","LOG_XOR","RELOP_EQ","RELOP_NE",
"RELOP_GT","RELOP_GTE","RELOP_LT","RELOP_LTE","GLOBAL","ADDR","CLONE","RESULT",
"RETURN","POW","SHIFT_RIGHT_U","LOG_AND","LOG_OR","COMMA","ESUB","LABEL","EMIT",
"EOM","IREG","NREG","SREG","PREG","IDENTIFIER","STRINGC","INTC","FLOATC","REG",
"MACRO","PARROT_OP","VAR","'\\n'","'='","'!'","'-'","'~'","'+'","'*'","'/'",
"'%'","'.'","'&'","'|'","'['","']'","';'","program","pasmcode","pasmline","pasm_inst",
"@1","pasm_args","emit","@2","nls","subs","sub","sub_start","statements","statement",
"@3","labels","_labels","label","instruction","labeled_inst","type","classname",
"assignment","@4","newtype","if_statement","relop","target","lhs","vars","_vars",
"_var_or_i","var_or_i","var","keylist","@5","_keylist","key","rc","reg","const",
"string", NULL
};
#endif

static const short yyr1[] = {     0,
    77,    78,    78,    79,    81,    80,    80,    82,    84,    83,
    85,    85,    86,    86,    87,    87,    87,    88,    89,    89,
    91,    90,    92,    92,    93,    93,    93,    94,    95,    96,
    96,    96,    96,    96,    96,    96,    96,    96,    96,    96,
    96,    96,    96,    96,    96,    96,    96,    96,    96,    96,
    96,    97,    97,    97,    97,    98,    99,    99,    99,    99,
    99,    99,    99,    99,    99,    99,    99,    99,    99,    99,
    99,    99,    99,    99,    99,    99,    99,    99,    99,    99,
    99,    99,    99,    99,    99,   100,    99,    99,    99,    99,
   101,   102,   102,   102,   102,   102,   103,   103,   103,   103,
   103,   103,   104,   104,   105,   105,   106,   106,   107,   107,
   108,   108,   109,   109,   109,   110,   110,   112,   111,   113,
   113,   114,   115,   115,   116,   116,   116,   116,   116,   117,
   117,   117,   118,   118
};

static const short yyr2[] = {     0,
     1,     1,     2,     3,     0,     3,     0,     1,     0,     4,
     1,     2,     2,     1,     3,     1,     1,     3,     1,     2,
     0,     2,     0,     1,     2,     1,     2,     1,     3,     1,
     1,     3,     2,     2,     3,     3,     3,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     1,     1,     1,     2,
     0,     1,     1,     1,     1,     1,     3,     4,     4,     4,
     5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
     5,     5,     5,     5,     5,     5,     6,     6,     4,     4,
     7,     4,     4,     4,     4,     0,     5,     4,     7,     4,
     1,     6,     4,     4,     4,     4,     1,     1,     1,     1,
     1,     1,     1,     1,     1,     1,     0,     1,     3,     1,
     1,     4,     1,     1,     1,     1,     1,     0,     2,     1,
     3,     1,     1,     1,     1,     1,     1,     1,     1,     1,
     1,     1,     1,     1
};

static const short yydefact[] = {     0,
     0,    23,    11,    16,    17,     1,    14,    21,     0,    28,
    23,     2,     5,    24,    26,    12,    13,    21,    19,    23,
    18,     3,     0,     0,     0,    25,    27,    15,    20,    51,
    22,    10,     4,   107,     0,     0,     0,     0,     0,     0,
    86,    49,    47,    48,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,   125,   126,   127,   128,
   132,   130,   131,   129,   107,   103,     0,    30,    31,     0,
     0,   117,   104,   124,   113,   115,   116,     6,     0,     8,
   108,   110,   111,   114,   123,    42,    43,   116,    40,   123,
    46,     0,     0,     0,    33,    34,    52,    53,    54,    56,
     0,    55,     0,     0,    38,    44,    45,   103,     0,   104,
   133,   134,     0,     0,    39,    41,    50,    29,     0,   118,
   118,     0,     0,    97,    98,    99,   100,   101,   102,     0,
     0,     0,     0,     0,    32,    35,    36,    37,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,    57,
     0,     0,     0,   109,    93,    95,     0,    94,    96,     0,
    88,    85,    90,    79,    80,    84,    83,    82,    58,    59,
    60,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,   118,     0,   122,
   119,   120,   112,     0,    91,    87,   118,   118,    68,    69,
    73,    64,    70,    71,    72,    62,    76,    61,    63,    65,
    66,    67,    74,    75,     0,     0,     0,    92,     0,     0,
    77,    78,   121,    89,    81,     0,     0,     0
};

static const short yydefgoto[] = {   226,
    11,    12,    24,    25,    78,     4,    23,     5,     6,     7,
     8,    18,    19,    20,    13,    14,    15,    31,    67,   101,
   102,    68,    94,   196,    69,   131,    70,    79,    80,    81,
    82,    83,    84,   151,   152,   191,   192,    72,    90,    74,
   113
};

static const short yypact[] = {   -11,
   -50,   -15,-32768,-32768,   -39,   -11,-32768,-32768,   -28,-32768,
   -35,-32768,   -26,   -15,   -12,-32768,-32768,     6,-32768,   -15,
-32768,-32768,     4,    -7,    -4,-32768,-32768,-32768,-32768,   155,
-32768,-32768,-32768,    73,     8,    10,   181,   181,   181,   181,
-32768,-32768,-32768,-32768,    15,    16,    34,    34,    46,   181,
   181,   -34,   -24,   -34,   181,   181,-32768,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,    73,   -16,     1,-32768,-32768,    11,
    17,-32768,    18,-32768,-32768,-32768,    28,-32768,    31,-32768,
    38,-32768,-32768,-32768,    32,-32768,-32768,-32768,-32768,-32768,
-32768,     9,     2,   -34,-32768,-32768,-32768,-32768,-32768,-32768,
    22,-32768,   -32,    53,-32768,-32768,-32768,-32768,    63,-32768,
-32768,-32768,    49,    69,-32768,-32768,-32768,-32768,    29,-32768,
-32768,    73,    61,-32768,-32768,-32768,-32768,-32768,-32768,    66,
   181,    67,    79,    90,-32768,-32768,-32768,-32768,   181,   181,
   181,    82,   181,   -24,    83,   181,   181,   181,   181,   156,
    64,   181,    65,-32768,-32768,-32768,   134,-32768,-32768,   109,
    97,-32768,-32768,-32768,    98,-32768,-32768,-32768,-32768,-32768,
-32768,   181,   181,   181,   181,   181,   181,   181,   181,   181,
   181,   181,   181,   181,   181,   181,   181,-32768,    78,-32768,
   102,-32768,-32768,   127,-32768,-32768,-32768,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,   107,   181,   181,-32768,   113,   114,
-32768,-32768,-32768,-32768,-32768,   184,   190,-32768
};

static const short yypgoto[] = {-32768,
-32768,   185,-32768,-32768,-32768,-32768,-32768,-32768,-32768,   186,
-32768,-32768,   183,-32768,   182,-32768,   189,-32768,-32768,     0,
    62,-32768,-32768,-32768,-32768,-32768,   -49,-32768,   144,-32768,
    92,-32768,   -30,  -120,-32768,-32768,     3,-32768,   -19,-32768,
    74
};


#define	YYLAST		242


static const short yytable[] = {    71,
   153,     1,   109,     9,   114,   132,    89,    91,    92,    93,
    73,    10,   123,    -9,    85,    57,    58,    59,    60,   106,
   107,   136,    16,    64,   115,   116,   108,   111,   137,   105,
   112,    10,   110,    21,   110,    -7,     2,   142,   124,   125,
   126,   127,   128,   129,   134,    85,   133,   103,   104,    27,
     3,    28,    32,   130,    33,    34,   143,  -116,    97,    98,
    99,    86,   118,    87,   144,   145,   146,   215,    95,    96,
    97,    98,    99,   119,   110,   135,   219,   220,    57,    58,
    59,    60,   122,    61,    62,    63,    64,   100,   150,    88,
   120,  -123,   147,   148,   149,    57,    58,    59,    60,   100,
   157,  -105,    85,    64,   121,  -106,   138,   139,   161,   162,
   163,   140,   165,   141,   155,   168,   169,   170,   171,   156,
   158,   190,    57,    58,    59,    60,    75,    61,    62,    63,
    64,    76,   159,    77,   160,   100,   167,   194,   189,   193,
   216,   199,   200,   201,   202,   203,   204,   205,   206,   207,
   208,   209,   210,   211,   212,   213,   214,    35,    36,    37,
    38,    39,    40,    41,    42,    43,    44,   195,    45,    46,
   197,   198,    47,    48,    49,    50,    51,   217,   172,   173,
   218,   221,    52,   227,   174,   222,   190,   224,   225,   228,
    53,    17,    54,    55,    56,    22,   175,   176,   177,   178,
    29,    30,    26,   164,    57,    58,    59,    60,   117,    61,
    62,    63,    64,   154,    65,    66,     0,   166,     0,   223,
   179,   180,   181,   182,   183,   184,   185,   186,   187,   188,
    57,    58,    59,    60,     0,    61,    62,    63,    64,     0,
     0,    88
};

static const short yycheck[] = {    30,
   121,    13,    52,    54,    54,     4,    37,    38,    39,    40,
    30,    47,     4,    49,    34,    50,    51,    52,    53,    50,
    51,    54,    62,    58,    55,    56,    61,    52,    61,    49,
    55,    47,    52,    62,    54,    62,    48,     9,    30,    31,
    32,    33,    34,    35,    94,    65,    45,    48,    49,    62,
    62,    46,    49,    45,    62,    60,    28,    74,    25,    26,
    27,    54,    62,    54,    36,    37,    38,   188,    54,    54,
    25,    26,    27,    63,    94,    54,   197,   198,    50,    51,
    52,    53,    45,    55,    56,    57,    58,    54,   119,    61,
    74,    74,    64,    65,    66,    50,    51,    52,    53,    54,
   131,    74,   122,    58,    74,    74,    54,    45,   139,   140,
   141,    63,   143,    45,    54,   146,   147,   148,   149,    54,
    54,   152,    50,    51,    52,    53,    54,    55,    56,    57,
    58,    59,    54,    61,    45,    54,    54,     4,    75,    75,
    63,   172,   173,   174,   175,   176,   177,   178,   179,   180,
   181,   182,   183,   184,   185,   186,   187,     3,     4,     5,
     6,     7,     8,     9,    10,    11,    12,    59,    14,    15,
    74,    74,    18,    19,    20,    21,    22,    76,    23,    24,
    54,    75,    28,     0,    29,   216,   217,    75,    75,     0,
    36,     6,    38,    39,    40,    11,    41,    42,    43,    44,
    18,    20,    14,   142,    50,    51,    52,    53,    65,    55,
    56,    57,    58,   122,    60,    61,    -1,   144,    -1,   217,
    65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
    50,    51,    52,    53,    -1,    55,    56,    57,    58,    -1,
    -1,    61
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
#line 478 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 4:
#line 486 "imcc.y"
{ yyval.i = 0; ;
    break;}
case 5:
#line 488 "imcc.y"
{clear_state();;
    break;}
case 6:
#line 489 "imcc.y"
{ yyval.i = iANY(yyvsp[-1].s,0,regs,1); free(yyvsp[-1].s); ;
    break;}
case 7:
#line 490 "imcc.y"
{ yyval.i = 0;;
    break;}
case 9:
#line 498 "imcc.y"
{ yyval.i = 0;;
    break;}
case 10:
#line 499 "imcc.y"
{ emit_flush(); clear_tables();yyval.i=0;;
    break;}
case 15:
#line 512 "imcc.y"
{
          yyval.i = 0; MK_I("ret", R0());
	  allocate();
	  emit_flush();
	  clear_tables();
        ;
    break;}
case 16:
#line 518 "imcc.y"
{ yyval.i=0; ;
    break;}
case 17:
#line 519 "imcc.y"
{ yyval.i=0; ;
    break;}
case 18:
#line 523 "imcc.y"
{ yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        ;
    break;}
case 21:
#line 532 "imcc.y"
{ clear_state(); ;
    break;}
case 22:
#line 533 "imcc.y"
{ yyval.i = yyvsp[0].i; ;
    break;}
case 23:
#line 536 "imcc.y"
{ yyval.i = NULL; ;
    break;}
case 28:
#line 545 "imcc.y"
{ yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); ;
    break;}
case 29:
#line 549 "imcc.y"
{ yyval.i = yyvsp[-1].i; ;
    break;}
case 32:
#line 554 "imcc.y"
{ mk_ident(yyvsp[0].s, yyvsp[-1].t); ;
    break;}
case 33:
#line 555 "imcc.y"
{ push_namespace(yyvsp[0].s); ;
    break;}
case 34:
#line 556 "imcc.y"
{ pop_namespace(yyvsp[0].s); ;
    break;}
case 35:
#line 557 "imcc.y"
{ mk_ident(yyvsp[0].s, yyvsp[-1].t); ;
    break;}
case 36:
#line 558 "imcc.y"
{ yyval.i = 0;
            warning("parser", "file %s line %d: %s already defined\n",
            sourcefile, line, yyvsp[0].sr->name); ;
    break;}
case 37:
#line 561 "imcc.y"
{ yyval.i = MK_I("restore",
		                            R1(mk_ident(yyvsp[0].s, yyvsp[-1].t)));;
    break;}
case 38:
#line 563 "imcc.y"
{ yyval.i = MK_I("restore", R1(yyvsp[0].sr)); ;
    break;}
case 39:
#line 564 "imcc.y"
{ yyval.i = MK_I("restore", R1(yyvsp[0].sr)); ;
    break;}
case 40:
#line 565 "imcc.y"
{ yyval.i = MK_I("save", R1(yyvsp[0].sr)); ;
    break;}
case 41:
#line 566 "imcc.y"
{ yyval.i = MK_I("save", R1(yyvsp[0].sr)); ;
    break;}
case 42:
#line 567 "imcc.y"
{ yyval.i = MK_I("bsr",
                                              R1(mk_address(yyvsp[0].s, U_add_once)));;
    break;}
case 43:
#line 569 "imcc.y"
{ yyval.i = MK_I("branch",
                                              R1(mk_address(yyvsp[0].s, U_add_once)));;
    break;}
case 44:
#line 571 "imcc.y"
{ yyval.i = MK_I("inc",R1(yyvsp[0].sr)); ;
    break;}
case 45:
#line 572 "imcc.y"
{ yyval.i = MK_I("dec",R1(yyvsp[0].sr)); ;
    break;}
case 46:
#line 573 "imcc.y"
{ yyval.i = MK_I("print",R1(yyvsp[0].sr)); ;
    break;}
case 47:
#line 574 "imcc.y"
{ yyval.i = MK_I("saveall" ,R0()); ;
    break;}
case 48:
#line 575 "imcc.y"
{ yyval.i = MK_I("restoreall" ,R0()); ;
    break;}
case 49:
#line 576 "imcc.y"
{ yyval.i = MK_I("end" ,R0()); ;
    break;}
case 50:
#line 577 "imcc.y"
{ yyval.i = iANY(yyvsp[-1].s,0,regs, 1); free(yyvsp[-1].s); ;
    break;}
case 51:
#line 578 "imcc.y"
{ yyval.i = 0;;
    break;}
case 52:
#line 582 "imcc.y"
{ yyval.t = 'I'; ;
    break;}
case 53:
#line 583 "imcc.y"
{ yyval.t = 'N'; ;
    break;}
case 54:
#line 584 "imcc.y"
{ yyval.t = 'S'; ;
    break;}
case 55:
#line 585 "imcc.y"
{ yyval.t = 'P'; free(yyvsp[0].s); ;
    break;}
case 57:
#line 593 "imcc.y"
{ yyval.i = MK_I("set", R2(yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 58:
#line 594 "imcc.y"
{ yyval.i = MK_I("not", R2(yyvsp[-3].sr, yyvsp[0].sr));;
    break;}
case 59:
#line 595 "imcc.y"
{ yyval.i = MK_I("neg", R2(yyvsp[-3].sr, yyvsp[0].sr));;
    break;}
case 60:
#line 596 "imcc.y"
{ yyval.i = MK_I("bnot", R2(yyvsp[-3].sr, yyvsp[0].sr));;
    break;}
case 61:
#line 597 "imcc.y"
{ yyval.i = MK_I("add", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 62:
#line 598 "imcc.y"
{ yyval.i = MK_I("sub", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 63:
#line 599 "imcc.y"
{ yyval.i = MK_I("mul", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 64:
#line 600 "imcc.y"
{ yyval.i = MK_I("pow", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 65:
#line 601 "imcc.y"
{ yyval.i = MK_I("div", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 66:
#line 602 "imcc.y"
{ yyval.i = MK_I("mod", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 67:
#line 603 "imcc.y"
{ yyval.i = MK_I("concat", R3(yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr)); ;
    break;}
case 68:
#line 604 "imcc.y"
{ yyval.i = MK_I("shl", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 69:
#line 605 "imcc.y"
{ yyval.i = MK_I("shr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 70:
#line 606 "imcc.y"
{ yyval.i = MK_I("lsr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 71:
#line 607 "imcc.y"
{ yyval.i = MK_I("and", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 72:
#line 608 "imcc.y"
{ yyval.i = MK_I("or", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 73:
#line 609 "imcc.y"
{ yyval.i = MK_I("xor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 74:
#line 610 "imcc.y"
{ yyval.i = MK_I("band", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 75:
#line 611 "imcc.y"
{ yyval.i = MK_I("bor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 76:
#line 612 "imcc.y"
{ yyval.i = MK_I("bxor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 77:
#line 613 "imcc.y"
{ yyval.i = iINDEXFETCH(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); ;
    break;}
case 78:
#line 614 "imcc.y"
{ yyval.i = iINDEXSET(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); ;
    break;}
case 79:
#line 615 "imcc.y"
{ yyval.i = iNEW(yyvsp[-3].sr, yyvsp[0].s, 1); ;
    break;}
case 80:
#line 616 "imcc.y"
{ yyval.i = MK_I("defined",R2(yyvsp[-3].sr,yyvsp[0].sr)); ;
    break;}
case 81:
#line 617 "imcc.y"
{ keyvec=KEY_BIT(2);
                                     yyval.i = MK_I("defined", R3(yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr));;
    break;}
case 82:
#line 619 "imcc.y"
{ yyval.i = MK_I("clone",R2(yyvsp[-3].sr, yyvsp[0].sr));
    ;
    break;}
case 83:
#line 621 "imcc.y"
{ yyval.i = MK_I("set_addr",
                                          R2(yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once))); ;
    break;}
case 84:
#line 623 "imcc.y"
{ yyval.i = MK_I("find_global",R2(yyvsp[-3].sr,yyvsp[0].sr)); ;
    break;}
case 85:
#line 624 "imcc.y"
{ yyval.i = MK_I("store_global",R2(yyvsp[-2].sr,yyvsp[0].sr)); ;
    break;}
case 86:
#line 625 "imcc.y"
{ expect_pasm = 1; ;
    break;}
case 87:
#line 626 "imcc.y"
{ yyval.i = iNEW(yyvsp[-2].sr, yyvsp[0].s, 1); ;
    break;}
case 88:
#line 627 "imcc.y"
{ yyval.i = MK_I("defined", R2(yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 89:
#line 628 "imcc.y"
{ keyvec=KEY_BIT(2);
                                       yyval.i = MK_I("defined", R3(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr));;
    break;}
case 90:
#line 630 "imcc.y"
{ yyval.i = MK_I("clone", R2(yyvsp[-2].sr, yyvsp[0].sr)); ;
    break;}
case 92:
#line 637 "imcc.y"
{ yyval.i=MK_I(yyvsp[-3].s,R3(yyvsp[-4].sr,yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s,U_add_once))); ;
    break;}
case 93:
#line 639 "imcc.y"
{yyval.i= MK_I("if", R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); ;
    break;}
case 94:
#line 641 "imcc.y"
{yyval.i= MK_I("unless",R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); ;
    break;}
case 95:
#line 643 "imcc.y"
{ yyval.i= MK_I("if", R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); ;
    break;}
case 96:
#line 645 "imcc.y"
{ yyval.i= MK_I("unless", R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); ;
    break;}
case 97:
#line 651 "imcc.y"
{ yyval.s = "eq"; ;
    break;}
case 98:
#line 652 "imcc.y"
{ yyval.s = "ne"; ;
    break;}
case 99:
#line 653 "imcc.y"
{ yyval.s = "gt"; ;
    break;}
case 100:
#line 654 "imcc.y"
{ yyval.s = "ge"; ;
    break;}
case 101:
#line 655 "imcc.y"
{ yyval.s = "lt"; ;
    break;}
case 102:
#line 656 "imcc.y"
{ yyval.s = "le"; ;
    break;}
case 107:
#line 667 "imcc.y"
{ yyval.sr = NULL; ;
    break;}
case 108:
#line 668 "imcc.y"
{ yyval.sr = yyvsp[0].sr; ;
    break;}
case 109:
#line 671 "imcc.y"
{ yyval.sr = regs[0]; ;
    break;}
case 111:
#line 675 "imcc.y"
{ regs[nargs++] = yyvsp[0].sr; ;
    break;}
case 112:
#line 676 "imcc.y"
{ regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; ;
    break;}
case 113:
#line 681 "imcc.y"
{ yyval.sr = mk_address(yyvsp[0].s, U_add_once); ;
    break;}
case 115:
#line 683 "imcc.y"
{ yyval.sr = macro(yyvsp[0].s); free(yyvsp[0].s); ;
    break;}
case 118:
#line 690 "imcc.y"
{ nkeys=0; ;
    break;}
case 119:
#line 691 "imcc.y"
{ yyval.sr = link_keys(nkeys, keys); ;
    break;}
case 120:
#line 694 "imcc.y"
{ keys[nkeys++] = yyvsp[0].sr; ;
    break;}
case 121:
#line 695 "imcc.y"
{ keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; ;
    break;}
case 125:
#line 705 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'I'); ;
    break;}
case 126:
#line 706 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'N'); ;
    break;}
case 127:
#line 707 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'S'); ;
    break;}
case 128:
#line 708 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'P'); ;
    break;}
case 129:
#line 709 "imcc.y"
{ yyval.sr = mk_pasm_reg(yyvsp[0].s); ;
    break;}
case 130:
#line 712 "imcc.y"
{ yyval.sr = mk_const(yyvsp[0].s, 'I'); ;
    break;}
case 131:
#line 713 "imcc.y"
{ yyval.sr = mk_const(yyvsp[0].s, 'N'); ;
    break;}
case 132:
#line 714 "imcc.y"
{ yyval.sr = mk_const(yyvsp[0].s, 'S'); ;
    break;}
case 133:
#line 717 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'S'); ;
    break;}
case 134:
#line 718 "imcc.y"
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
#line 720 "imcc.y"


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
            usage(stdout);
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
    else {
        char *ext;
        if(!(yyin = fopen(sourcefile, "r")))    {
            fatal(EX_IOERR, "main", "Error reading source file %s.\n",
                    sourcefile);
    }
        ext = strrchr(sourcefile, '.');
        if (ext && strcmp (ext, ".pasm") == 0) {
            pasm_file = 1;
        }
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
        if (strcmp (output, "-") == 0)
            fp = stdout;
        else if ((fp = fopen(output, "wb")) == 0)
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
    }
    Parrot_destroy(interpreter);
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
