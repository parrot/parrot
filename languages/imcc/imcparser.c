/* A Bison parser, made from imcc.y
   by GNU bison 1.35.  */

#define YYBISON 1  /* Identify Bison output.  */

# define	CALL	257
# define	GOTO	258
# define	ARG	259
# define	RET	260
# define	PRINT	261
# define	IF	262
# define	UNLESS	263
# define	NEW	264
# define	END	265
# define	SAVEALL	266
# define	RESTOREALL	267
# define	SUB	268
# define	NAMESPACE	269
# define	CLASS	270
# define	ENDCLASS	271
# define	SYM	272
# define	LOCAL	273
# define	PARAM	274
# define	PUSH	275
# define	POP	276
# define	INC	277
# define	DEC	278
# define	SHIFT_LEFT	279
# define	SHIFT_RIGHT	280
# define	INTV	281
# define	FLOATV	282
# define	STRINGV	283
# define	DEFINED	284
# define	LOG_XOR	285
# define	RELOP_EQ	286
# define	RELOP_NE	287
# define	RELOP_GT	288
# define	RELOP_GTE	289
# define	RELOP_LT	290
# define	RELOP_LTE	291
# define	GLOBAL	292
# define	ADDR	293
# define	CLONE	294
# define	RESULT	295
# define	RETURN	296
# define	POW	297
# define	COMMA	298
# define	LABEL	299
# define	EMIT	300
# define	EOM	301
# define	IREG	302
# define	NREG	303
# define	SREG	304
# define	PREG	305
# define	IDENTIFIER	306
# define	STRINGC	307
# define	INTC	308
# define	FLOATC	309
# define	REG	310
# define	MACRO	311
# define	PARROT_OP	312
# define	VAR	313

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
static Instruction * iNEW(SymReg * r0, char * type) {
    char fmt[256];
    SymReg *pmc = macro(type);
    /* XXX check, if type exists, but aove keyed search
     * gives 0 for non existing  PMCs */
    sprintf(fmt, "new %%s, %d\t # .%s", atoi(pmc->name), type);
    r0->usage = U_NEW;
    if (!strcmp(type, "PerlArray") || !strcmp(type, "PerlHash"))
        r0->usage |= U_KEYED;
    MK_I(fmt, R2(r0, pmc));	/* new_p_ic */
    free(type);
    return 0;
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
#if 0
#define OP_HASH_SIZE 1511
typedef struct hop {
    op_info_t * info;
    struct hop *next;
} HOP;
static HOP **hop;
static void hop_init();

static void store_op(op_info_t *info, int full) {
    HOP *p = malloc(sizeof(HOP));
    int index = hash_str(full ? info->full_name : info->name) % OP_HASH_SIZE;
    p->info = info;
    p->next = hop[index];
    hop[index] = p;
}
int get_op(const char * name, int full) {
    HOP * p;
    int index = hash_str(name) % OP_HASH_SIZE;
    if (!hop) {
        hop = calloc(OP_HASH_SIZE, sizeof(HOP*));
        hop_init();
    }
    for(p = hop[index]; p; p = p->next) {
	if(!strcmp(name, full ? p->info->full_name : p->info->name))
	    return p->info - interpreter->op_info_table;
    }
    return -1;
}
static void hop_init() {
    int i;
    op_info_t * info = interpreter->op_info_table;
    /* store full names */
    for (i = 0; i < interpreter->op_count; i++)
        store_op(info + i, 1);
    /* plus one short name */
    for (i = 0; i < interpreter->op_count; i++)
        if (get_op(info[i].name, 0) == -1)
            store_op(info + i, 0);
}
void hop_deinit()
{
    HOP *p, *next;
    int i;
    for (i = 0; i < OP_HASH_SIZE; i++)
        for(p = hop[i]; p; ) {
            next = p->next;
            free(p);
            p = next;
    }
    free(hop);
    hop = 0;
}
#endif

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
        ins = emitb(_mk_instruction(name, format, regs, dirs));
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
    return NULL;
}


#line 383 "imcc.y"
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



#define	YYFINAL		192
#define	YYFLAG		-32768
#define	YYNTBASE	75

/* YYTRANSLATE(YYLEX) -- Bison token number corresponding to YYLEX. */
#define YYTRANSLATE(x) ((unsigned)(x) <= 313 ? yytranslate[x] : 113)

/* YYTRANSLATE[YYLEX] -- Bison token number corresponding to YYLEX. */
static const char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      60,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    62,     2,     2,     2,    67,    69,     2,
       2,     2,    65,    64,     2,    63,    68,    66,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    74,
       2,    61,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    72,     2,    73,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    70,     2,    71,     2,     2,     2,
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
       2,     2,     2,     2,     2,     2,     1,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59
};

#if YYDEBUG
static const short yyprhs[] =
{
       0,     0,     2,     4,     7,    11,    14,    15,    17,    18,
      23,    25,    28,    31,    33,    37,    39,    41,    45,    47,
      50,    52,    53,    55,    58,    60,    63,    65,    69,    71,
      73,    77,    81,    85,    89,    92,    95,    98,   101,   104,
     107,   110,   113,   116,   119,   122,   124,   126,   128,   131,
     132,   134,   136,   138,   140,   142,   146,   151,   156,   162,
     168,   174,   180,   186,   192,   198,   204,   210,   216,   222,
     228,   234,   241,   248,   253,   258,   263,   268,   273,   278,
     285,   290,   295,   297,   299,   301,   303,   305,   307,   309,
     311,   313,   315,   316,   318,   322,   324,   326,   331,   333,
     335,   337,   339,   341,   342,   345,   347,   351,   353,   355,
     357,   359,   361,   363,   365,   367,   369,   371,   373,   375
};
static const short yyrhs[] =
{
      83,     0,    77,     0,    76,    77,     0,    88,    78,    60,
       0,    58,    79,     0,     0,   100,     0,     0,    46,    76,
      81,    47,     0,    60,     0,    82,    60,     0,    83,    84,
       0,    84,     0,    85,    86,     6,     0,    80,     0,    82,
       0,    14,    52,    60,     0,    87,     0,    86,    87,     0,
      91,     0,     0,    89,     0,    89,    90,     0,    90,     0,
      90,    60,     0,    45,     0,    88,    92,    60,     0,    95,
       0,    96,     0,    18,    93,    52,     0,    19,    93,    52,
       0,    19,    93,    59,     0,    20,    93,    52,     0,    20,
     110,     0,    41,   104,     0,    22,   104,     0,     5,   104,
       0,    21,   104,     0,    42,   104,     0,     3,    52,     0,
       4,    52,     0,    23,   104,     0,    24,   104,     0,     7,
     104,     0,    12,     0,    13,     0,    11,     0,    58,   100,
       0,     0,    27,     0,    28,     0,    29,     0,    94,     0,
      52,     0,    98,    61,   104,     0,    98,    61,    62,   104,
       0,    98,    61,    63,   104,     0,    98,    61,   104,    64,
     104,     0,    98,    61,   104,    63,   104,     0,    98,    61,
     104,    65,   104,     0,    98,    61,   104,    43,   104,     0,
      98,    61,   104,    66,   104,     0,    98,    61,   104,    67,
     104,     0,    98,    61,   104,    68,   104,     0,    98,    61,
     104,    25,   104,     0,    98,    61,   104,    26,   104,     0,
      98,    61,   104,    31,   104,     0,    98,    61,   104,    69,
     104,     0,    98,    61,   104,    70,   104,     0,    98,    61,
     104,    71,   104,     0,    98,    61,   104,    72,   105,    73,
       0,   104,    72,   105,    73,    61,   104,     0,    98,    61,
      10,    94,     0,    98,    61,    30,   104,     0,    98,    61,
      40,   104,     0,    98,    61,    39,    52,     0,    98,    61,
      38,   112,     0,    38,   112,    61,   104,     0,     8,   104,
      97,   104,     4,    52,     0,     8,   104,     4,    52,     0,
       9,   104,     4,    52,     0,    32,     0,    33,     0,    34,
       0,    35,     0,    36,     0,    37,     0,    59,     0,   110,
       0,    59,     0,   110,     0,     0,   101,     0,   101,    44,
     102,     0,   102,     0,   103,     0,    99,    72,   105,    73,
       0,    52,     0,   104,     0,    57,     0,    59,     0,   109,
       0,     0,   106,   107,     0,   108,     0,   107,    74,   108,
       0,   104,     0,   110,     0,   111,     0,    48,     0,    49,
       0,    50,     0,    51,     0,    56,     0,    54,     0,    55,
       0,    53,     0,    50,     0,    53,     0
};

#endif

#if YYDEBUG
/* YYRLINE[YYN] -- source line where rule number YYN was defined. */
static const short yyrline[] =
{
       0,   418,   423,   424,   427,   429,   430,   433,   437,   437,
     442,   444,   447,   448,   451,   458,   459,   462,   468,   469,
     472,   475,   476,   479,   480,   481,   484,   487,   490,   492,
     493,   494,   495,   498,   500,   501,   502,   503,   504,   505,
     506,   508,   510,   511,   512,   513,   514,   515,   516,   517,
     520,   522,   523,   524,   527,   531,   533,   534,   535,   536,
     537,   538,   539,   540,   541,   542,   543,   544,   545,   546,
     547,   548,   549,   550,   551,   552,   554,   556,   557,   560,
     563,   565,   569,   571,   572,   573,   574,   575,   579,   580,
     582,   583,   586,   587,   590,   591,   594,   595,   599,   601,
     602,   605,   606,   609,   609,   613,   614,   617,   620,   621,
     624,   625,   626,   627,   628,   631,   632,   633,   636,   637
};
#endif


#if (YYDEBUG) || defined YYERROR_VERBOSE

/* YYTNAME[TOKEN_NUM] -- String name of the token TOKEN_NUM. */
static const char *const yytname[] =
{
  "$", "error", "$undefined.", "CALL", "GOTO", "ARG", "RET", "PRINT", "IF", 
  "UNLESS", "NEW", "END", "SAVEALL", "RESTOREALL", "SUB", "NAMESPACE", 
  "CLASS", "ENDCLASS", "SYM", "LOCAL", "PARAM", "PUSH", "POP", "INC", 
  "DEC", "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", 
  "DEFINED", "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", 
  "RELOP_LT", "RELOP_LTE", "GLOBAL", "ADDR", "CLONE", "RESULT", "RETURN", 
  "POW", "COMMA", "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", 
  "IDENTIFIER", "STRINGC", "INTC", "FLOATC", "REG", "MACRO", "PARROT_OP", 
  "VAR", "'\\n'", "'='", "'!'", "'-'", "'+'", "'*'", "'/'", "'%'", "'.'", 
  "'&'", "'|'", "'~'", "'['", "']'", "';'", "program", "pasmcode", 
  "pasmline", "pasm_inst", "pasm_args", "emit", "@1", "nls", "subs", 
  "sub", "sub_start", "statements", "statement", "labels", "_labels", 
  "label", "instruction", "labeled_inst", "type", "classname", 
  "assignment", "if_statement", "relop", "target", "lhs", "vars", "_vars", 
  "_var_or_i", "var_or_i", "var", "keylist", "@2", "_keylist", "key", 
  "rc", "reg", "const", "string", 0
};
#endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives. */
static const short yyr1[] =
{
       0,    75,    76,    76,    77,    78,    78,    79,    81,    80,
      82,    82,    83,    83,    84,    84,    84,    85,    86,    86,
      87,    88,    88,    89,    89,    89,    90,    91,    92,    92,
      92,    92,    92,    92,    92,    92,    92,    92,    92,    92,
      92,    92,    92,    92,    92,    92,    92,    92,    92,    92,
      93,    93,    93,    93,    94,    95,    95,    95,    95,    95,
      95,    95,    95,    95,    95,    95,    95,    95,    95,    95,
      95,    95,    95,    95,    95,    95,    95,    95,    95,    96,
      96,    96,    97,    97,    97,    97,    97,    97,    98,    98,
      99,    99,   100,   100,   101,   101,   102,   102,   103,   103,
     103,   104,   104,   106,   105,   107,   107,   108,   109,   109,
     110,   110,   110,   110,   110,   111,   111,   111,   112,   112
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN. */
static const short yyr2[] =
{
       0,     1,     1,     2,     3,     2,     0,     1,     0,     4,
       1,     2,     2,     1,     3,     1,     1,     3,     1,     2,
       1,     0,     1,     2,     1,     2,     1,     3,     1,     1,
       3,     3,     3,     3,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     1,     1,     1,     2,     0,
       1,     1,     1,     1,     1,     3,     4,     4,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     6,     6,     4,     4,     4,     4,     4,     4,     6,
       4,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     0,     1,     3,     1,     1,     4,     1,     1,
       1,     1,     1,     0,     2,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[S] -- default rule to reduce with in state S when YYTABLE
   doesn't specify something else to do.  Zero means the default is an
   error. */
static const short yydefact[] =
{
       0,     0,    21,    10,    15,    16,     1,    13,    21,     0,
      26,    21,     2,     6,    22,    24,    11,    12,    21,    18,
      49,    20,    17,     3,     0,    92,     0,    23,    25,    14,
      19,     0,     0,     0,     0,     0,     0,    47,    45,    46,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     110,   111,   112,   113,   117,   115,   116,   114,    92,    88,
       0,    28,    29,     0,     0,   102,    89,   109,     9,    98,
     100,   101,     5,     0,     7,    93,    95,    96,    99,   108,
       4,    40,    41,   101,    37,   108,    44,     0,     0,    50,
      51,    52,    54,     0,    53,     0,     0,    34,    38,    36,
      42,    43,   118,   119,     0,    35,    39,    48,    27,     0,
     103,   103,     0,     0,    82,    83,    84,    85,    86,    87,
       0,     0,    30,    31,    32,    33,     0,     0,     0,     0,
       0,     0,     0,     0,    55,     0,     0,     0,    94,    80,
       0,    81,    78,    73,    74,    77,    76,    75,    56,    57,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   103,     0,   107,   104,   105,    97,     0,
      65,    66,    67,    61,    59,    58,    60,    62,    63,    64,
      68,    69,    70,     0,     0,     0,    79,    71,    72,   106,
       0,     0,     0
};

static const short yydefgoto[] =
{
     190,    11,    12,    26,    72,     4,    24,     5,     6,     7,
       8,    18,    19,    13,    14,    15,    21,    60,    93,    94,
      61,    62,   120,    63,    73,    74,    75,    76,    77,    78,
     135,   136,   166,   167,    65,    85,    67,   104
};

static const short yypact[] =
{
      -5,   -45,   -23,-32768,-32768,   -27,    -5,-32768,   -23,    -4,
  -32768,   -39,-32768,   -21,   -23,    -2,-32768,-32768,    -3,-32768,
      27,-32768,-32768,-32768,     5,    70,    -1,-32768,-32768,-32768,
  -32768,     8,     9,   147,   147,   147,   147,-32768,-32768,-32768,
      -8,    -8,   165,   147,   147,   147,   147,     4,   147,   147,
  -32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,    70,    -9,
       6,-32768,-32768,     3,     0,-32768,     1,-32768,-32768,-32768,
  -32768,     2,-32768,     7,-32768,    23,-32768,-32768,-32768,    12,
  -32768,-32768,-32768,-32768,-32768,-32768,-32768,    58,    66,-32768,
  -32768,-32768,-32768,    19,-32768,   -48,    35,-32768,-32768,-32768,
  -32768,-32768,-32768,-32768,    37,-32768,-32768,-32768,-32768,   118,
  -32768,-32768,    70,    36,-32768,-32768,-32768,-32768,-32768,-32768,
     147,    44,-32768,-32768,-32768,-32768,   147,    47,   147,     4,
      49,   147,   147,   147,   119,    29,   147,    30,-32768,-32768,
     100,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
     147,   147,   147,   147,   147,   147,   147,   147,   147,   147,
     147,   147,   147,-32768,    46,-32768,    31,-32768,-32768,    57,
  -32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
  -32768,-32768,-32768,    41,   147,   147,-32768,-32768,-32768,-32768,
     110,   115,-32768
};

static const short yypgoto[] =
{
  -32768,-32768,   106,-32768,-32768,-32768,-32768,-32768,-32768,   137,
  -32768,-32768,   128,    -6,-32768,   133,-32768,-32768,   -24,    22,
  -32768,-32768,-32768,-32768,-32768,    93,-32768,    40,-32768,   -20,
    -110,-32768,-32768,   -32,-32768,   -15,-32768,    25
};


#define	YYLAST		221


static const short yytable[] =
{
      64,   137,    20,    29,   123,    66,    10,     9,    -8,     1,
      79,   124,    20,    84,    86,    87,    88,    95,    96,    89,
      90,    91,    10,    98,    99,   100,   101,    97,   105,   106,
      31,    32,    33,    16,    34,    35,    36,    25,    37,    38,
      39,     2,    10,    79,    92,    40,    41,    42,    43,    44,
      45,    46,    68,   183,   102,     3,    22,   103,    28,    80,
      81,    82,   113,  -101,   109,    47,   108,   112,    48,    49,
     121,   122,   110,  -108,   -90,    50,    51,    52,    53,   111,
      54,    55,    56,    57,   -91,    58,    59,   125,   139,   134,
     114,   115,   116,   117,   118,   119,   141,    79,   126,    92,
     140,   146,   164,   168,   169,   185,   142,   184,   144,   186,
     191,   147,   148,   149,   187,   192,   165,    23,    50,    51,
      52,    53,    69,    54,    55,    56,    57,    70,   127,    71,
     170,   171,   172,   173,   174,   175,   176,   177,   178,   179,
     180,   181,   182,    17,   150,   151,    30,    27,   128,   143,
     152,   107,   138,   189,   145,     0,   129,   130,   131,     0,
       0,     0,   153,     0,   188,   165,    50,    51,    52,    53,
       0,    54,    55,    56,    57,     0,     0,    83,     0,     0,
     132,   133,   154,   155,   156,   157,   158,   159,   160,   161,
     162,   163,    89,    90,    91,    50,    51,    52,    53,     0,
      54,    55,    56,    57,     0,     0,    83,     0,     0,     0,
       0,     0,     0,    50,    51,    52,    53,    92,     0,     0,
       0,    57
};

static const short yycheck[] =
{
      20,   111,     8,     6,    52,    20,    45,    52,    47,    14,
      25,    59,    18,    33,    34,    35,    36,    41,    42,    27,
      28,    29,    45,    43,    44,    45,    46,    42,    48,    49,
       3,     4,     5,    60,     7,     8,     9,    58,    11,    12,
      13,    46,    45,    58,    52,    18,    19,    20,    21,    22,
      23,    24,    47,   163,    50,    60,    60,    53,    60,    60,
      52,    52,     4,    72,    61,    38,    60,    44,    41,    42,
       4,    52,    72,    72,    72,    48,    49,    50,    51,    72,
      53,    54,    55,    56,    72,    58,    59,    52,    52,   109,
      32,    33,    34,    35,    36,    37,    52,   112,    61,    52,
     120,    52,    73,    73,     4,    74,   126,    61,   128,    52,
       0,   131,   132,   133,    73,     0,   136,    11,    48,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    10,    59,
     150,   151,   152,   153,   154,   155,   156,   157,   158,   159,
     160,   161,   162,     6,    25,    26,    18,    14,    30,   127,
      31,    58,   112,   185,   129,    -1,    38,    39,    40,    -1,
      -1,    -1,    43,    -1,   184,   185,    48,    49,    50,    51,
      -1,    53,    54,    55,    56,    -1,    -1,    59,    -1,    -1,
      62,    63,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    27,    28,    29,    48,    49,    50,    51,    -1,
      53,    54,    55,    56,    -1,    -1,    59,    -1,    -1,    -1,
      -1,    -1,    -1,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    56
};
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
#line 419 "imcc.y"
{ yyval.i = 0; }
    break;
case 4:
#line 427 "imcc.y"
{ yyval.i = 0; }
    break;
case 5:
#line 429 "imcc.y"
{ yyval.i = iANY(yyvsp[-1].s,0,regs,1); free(yyvsp[-1].s); }
    break;
case 6:
#line 430 "imcc.y"
{ yyval.i = 0;}
    break;
case 8:
#line 438 "imcc.y"
{ yyval.i = 0;}
    break;
case 9:
#line 439 "imcc.y"
{ emit_flush(); clear_tables();yyval.i=0;}
    break;
case 14:
#line 452 "imcc.y"
{
          yyval.i = 0; MK_I("ret", R0());
	  allocate();
	  emit_flush();
	  clear_tables();
        }
    break;
case 15:
#line 458 "imcc.y"
{ yyval.i=0; }
    break;
case 16:
#line 459 "imcc.y"
{ yyval.i=0; }
    break;
case 17:
#line 463 "imcc.y"
{ yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        }
    break;
case 21:
#line 475 "imcc.y"
{ yyval.i = NULL; }
    break;
case 26:
#line 484 "imcc.y"
{ yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;
case 27:
#line 488 "imcc.y"
{ yyval.i = yyvsp[-1].i; }
    break;
case 30:
#line 493 "imcc.y"
{ mk_ident(yyvsp[0].s, yyvsp[-1].t); }
    break;
case 31:
#line 494 "imcc.y"
{ mk_ident(yyvsp[0].s, yyvsp[-1].t); }
    break;
case 32:
#line 495 "imcc.y"
{ yyval.i = 0;
            warning("parser", "file %s line %d: %s already defined\n",
            sourcefile, line, yyvsp[0].sr->name); }
    break;
case 33:
#line 498 "imcc.y"
{ yyval.i = MK_I("restore",
		                            R1(mk_ident(yyvsp[0].s, yyvsp[-1].t)));}
    break;
case 34:
#line 500 "imcc.y"
{ yyval.i = MK_I("restore", R1(yyvsp[0].sr)); }
    break;
case 35:
#line 501 "imcc.y"
{ yyval.i = MK_I("restore", R1(yyvsp[0].sr)); }
    break;
case 36:
#line 502 "imcc.y"
{ yyval.i = MK_I("restore", R1(yyvsp[0].sr)); }
    break;
case 37:
#line 503 "imcc.y"
{ yyval.i = MK_I("save", R1(yyvsp[0].sr)); }
    break;
case 38:
#line 504 "imcc.y"
{ yyval.i = MK_I("save", R1(yyvsp[0].sr)); }
    break;
case 39:
#line 505 "imcc.y"
{ yyval.i = MK_I("save", R1(yyvsp[0].sr)); }
    break;
case 40:
#line 506 "imcc.y"
{ yyval.i = MK_I("bsr",
                                              R1(mk_address(yyvsp[0].s, U_add_once)));}
    break;
case 41:
#line 508 "imcc.y"
{ yyval.i = MK_I("branch",
                                              R1(mk_address(yyvsp[0].s, U_add_once)));}
    break;
case 42:
#line 510 "imcc.y"
{ yyval.i = MK_I("inc",R1(yyvsp[0].sr)); }
    break;
case 43:
#line 511 "imcc.y"
{ yyval.i = MK_I("dec",R1(yyvsp[0].sr)); }
    break;
case 44:
#line 512 "imcc.y"
{ yyval.i = MK_I("print",R1(yyvsp[0].sr)); }
    break;
case 45:
#line 513 "imcc.y"
{ yyval.i = MK_I("saveall" ,R0()); }
    break;
case 46:
#line 514 "imcc.y"
{ yyval.i = MK_I("restoreall" ,R0()); }
    break;
case 47:
#line 515 "imcc.y"
{ yyval.i = MK_I("end" ,R0()); }
    break;
case 48:
#line 516 "imcc.y"
{ yyval.i = iANY(yyvsp[-1].s,0,regs, 1); free(yyvsp[-1].s); }
    break;
case 49:
#line 517 "imcc.y"
{ yyval.i = 0;}
    break;
case 50:
#line 521 "imcc.y"
{ yyval.t = 'I'; }
    break;
case 51:
#line 522 "imcc.y"
{ yyval.t = 'N'; }
    break;
case 52:
#line 523 "imcc.y"
{ yyval.t = 'S'; }
    break;
case 53:
#line 524 "imcc.y"
{ yyval.t = 'P'; free(yyvsp[0].s); }
    break;
case 55:
#line 532 "imcc.y"
{ yyval.i = MK_I("set", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;
case 56:
#line 533 "imcc.y"
{ yyval.i = MK_I("not", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;
case 57:
#line 534 "imcc.y"
{ yyval.i = MK_I("neg", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;
case 58:
#line 535 "imcc.y"
{ yyval.i = MK_I("add", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;
case 59:
#line 536 "imcc.y"
{ yyval.i = MK_I("sub", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;
case 60:
#line 537 "imcc.y"
{ yyval.i = MK_I("mul", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;
case 61:
#line 538 "imcc.y"
{ yyval.i = MK_I("pow", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;
case 62:
#line 539 "imcc.y"
{ yyval.i = MK_I("div", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;
case 63:
#line 540 "imcc.y"
{ yyval.i = MK_I("mod", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;
case 64:
#line 541 "imcc.y"
{ yyval.i = MK_I("concat", R3(yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr)); }
    break;
case 65:
#line 542 "imcc.y"
{ yyval.i = MK_I("shl", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;
case 66:
#line 543 "imcc.y"
{ yyval.i = MK_I("shr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;
case 67:
#line 544 "imcc.y"
{ yyval.i = MK_I("xor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;
case 68:
#line 545 "imcc.y"
{ yyval.i = MK_I("band", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;
case 69:
#line 546 "imcc.y"
{ yyval.i = MK_I("bor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;
case 70:
#line 547 "imcc.y"
{ yyval.i = MK_I("bxor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;
case 71:
#line 548 "imcc.y"
{ yyval.i = iINDEXFETCH(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;
case 72:
#line 549 "imcc.y"
{ yyval.i = iINDEXSET(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;
case 73:
#line 550 "imcc.y"
{ yyval.i = iNEW(yyvsp[-3].sr, yyvsp[0].s); }
    break;
case 74:
#line 551 "imcc.y"
{ yyval.i = MK_I("defined %s, %s",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;
case 75:
#line 552 "imcc.y"
{ yyval.i = MK_I("clone %s, %s",R2(yyvsp[-3].sr, yyvsp[0].sr));
    }
    break;
case 76:
#line 554 "imcc.y"
{ yyval.i = MK_I("set_addr",
                                          R2(yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once))); }
    break;
case 77:
#line 556 "imcc.y"
{ yyval.i = MK_I("find_global",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;
case 78:
#line 557 "imcc.y"
{ yyval.i = MK_I("store_global",R2(yyvsp[-2].sr,yyvsp[0].sr)); }
    break;
case 79:
#line 561 "imcc.y"
{ yyval.i=MK_I(yyvsp[-3].s,R3(yyvsp[-4].sr,yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s,U_add_once))); }
    break;
case 80:
#line 563 "imcc.y"
{yyval.i= MK_I("if", R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); }
    break;
case 81:
#line 565 "imcc.y"
{yyval.i= MK_I("unless",R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); }
    break;
case 82:
#line 570 "imcc.y"
{ yyval.s = "eq"; }
    break;
case 83:
#line 571 "imcc.y"
{ yyval.s = "ne"; }
    break;
case 84:
#line 572 "imcc.y"
{ yyval.s = "gt"; }
    break;
case 85:
#line 573 "imcc.y"
{ yyval.s = "ge"; }
    break;
case 86:
#line 574 "imcc.y"
{ yyval.s = "lt"; }
    break;
case 87:
#line 575 "imcc.y"
{ yyval.s = "le"; }
    break;
case 92:
#line 586 "imcc.y"
{ yyval.sr = NULL; }
    break;
case 93:
#line 587 "imcc.y"
{ yyval.sr = yyvsp[0].sr; }
    break;
case 94:
#line 590 "imcc.y"
{ yyval.sr = regs[0]; }
    break;
case 96:
#line 594 "imcc.y"
{ regs[nargs++] = yyvsp[0].sr; }
    break;
case 97:
#line 595 "imcc.y"
{ regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;
case 98:
#line 600 "imcc.y"
{ yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;
case 100:
#line 602 "imcc.y"
{ yyval.sr = macro(yyvsp[0].s+1); free(yyvsp[0].s); }
    break;
case 103:
#line 609 "imcc.y"
{ nkeys=0; }
    break;
case 104:
#line 610 "imcc.y"
{ yyval.sr = link_keys(nkeys, keys); }
    break;
case 105:
#line 613 "imcc.y"
{ keys[nkeys++] = yyvsp[0].sr; }
    break;
case 106:
#line 614 "imcc.y"
{ keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;
case 110:
#line 624 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;
case 111:
#line 625 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;
case 112:
#line 626 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;
case 113:
#line 627 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;
case 114:
#line 628 "imcc.y"
{ yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;
case 115:
#line 631 "imcc.y"
{ yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;
case 116:
#line 632 "imcc.y"
{ yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;
case 117:
#line 633 "imcc.y"
{ yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;
case 118:
#line 636 "imcc.y"
{ yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;
case 119:
#line 637 "imcc.y"
{ yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;
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
#line 639 "imcc.y"


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

#ifdef OPTEST
#define USE_HOP

#define OP_HASH_SIZE 1511
typedef struct hop {
    op_info_t * info;
    struct hop *next;
} HOP;
static HOP **hop;

static void store_op(op_info_t *info) {
    HOP *p = malloc(sizeof(HOP));
    int index = hash_str(info->full_name) % OP_HASH_SIZE;
    p->info = info;
    p->next = hop[index];
    hop[index] = p;
}
static void hop_init() {
    int i;
    op_info_t * info = interpreter->op_info_table;
    for (i = 0; i < interpreter->op_count; i++)
        store_op(info + i);
}
int get_op(const char * name) {
    HOP * p;
    int index = hash_str(name) % OP_HASH_SIZE;
    if (!hop) {
        hop = calloc(OP_HASH_SIZE, sizeof(HOP*));
        hop_init();
    }
    for(p = hop[index]; p; p = p->next) {
	if(!strcmp(name, p->info->full_name))
	    return p->info - interpreter->op_info_table;
    }
    return -1;
}
void hop_deinit()
{
    HOP *p, *next;
    int i;
    for (i = 0; i < OP_HASH_SIZE; i++)
        for(p = hop[i]; p; ) {
            next = p->next;
            free(p);
            p = next;
    }
    free(hop);
    hop = 0;
}


static void test_ops()
{
    int i,j,n = interpreter->op_count;
    op_info_t * info = interpreter->op_info_table;
    int op;

    printf("testing op_code for %d ops 10000 times\n", n);
    /* 10.000 runs for 889 ops: 8.3-8.5 s */
    for (i = 0; i < n; i++) {
        for (j = 0; j < 10000 ; j++) {
#ifdef USE_HOP
            op = get_op(info[i].full_name);
            if (op != i) {
                printf("Op %d %s not found\n", i, info[i].full_name);
                exit(1);
            }
#else
            op = interpreter->op_lib->op_code(info[i].full_name);
            if (i != op) {
                printf("Op %d %s not found\n", i, info[i].full_name);
                exit(1);
            }
#endif
        }
    }
#ifdef USE_HOP
    hop_deinit();
#endif
}

#endif

int main(int argc, char * argv[])
{
    int stacktop;
    struct PackFile *pf;

    interpreter = Parrot_new();
    Parrot_init(interpreter, (void*)&stacktop);
    pf = PackFile_new();
    interpreter->code = pf;
#ifdef OPTEST
    test_ops();
    exit(0);
#endif
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
