%{
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
            /* XXX propably a CATCH block */
            ins->type = ITADDR | IF_r1_branch | ITBRANCH;
        }
    } else {
        fataly(EX_SOFTWARE, "iANY", line,"op not found '%s' (%s<%d>)\n",
                fullname, name, nargs);
    }
    return ins;
}

%}

%union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
}

%token <t> CALL GOTO ARG PRINT IF UNLESS NEW END SAVEALL RESTOREALL
%token <t> SUB NAMESPACE CLASS ENDCLASS SYM LOCAL PARAM INC DEC
%token <t> SHIFT_LEFT SHIFT_RIGHT INTV FLOATV STRINGV DEFINED LOG_XOR
%token <t> RELOP_EQ RELOP_NE RELOP_GT RELOP_GTE RELOP_LT RELOP_LTE
%token <t> GLOBAL ADDR CLONE RESULT RETURN POW SHIFT_RIGHT_U LOG_AND LOG_OR
%token <t> COMMA ESUB
%token <s> LABEL
%token <t> EMIT EOM
%token <s> IREG NREG SREG PREG IDENTIFIER STRINGC INTC FLOATC REG MACRO
%token <s> PARROT_OP
%type <t> type
%type <i> program subs sub sub_start emit
%type <s> classname relop newtype
%type <i> labels _labels label statements statement
%type <i> instruction assignment if_statement labeled_inst
%type <sr> target reg const var rc string
%type <sr> key keylist _keylist
%type <sr> vars _vars var_or_i _var_or_i
%type <i> pasmcode pasmline pasm_inst
%type <sr> pasm_args lhs
%token <sr> VAR


%start program
%expect 2

%%

program:
    subs  { $$ = 0; }
    ;


pasmcode: pasmline
    | pasmcode pasmline
    ;

pasmline: labels  pasm_inst '\n'  { $$ = 0; }
    ;
pasm_inst: {clear_state();}
       PARROT_OP pasm_args	        { $$ = iANY($2,0,regs,1); free($2); }
    | /* none */                               { $$ = 0;}

    ;
pasm_args:
    vars
    ;

emit:
      EMIT   pasmcode                    { $$ = 0;}
       EOM 				{ emit_flush(); clear_tables();$$=0;}
    ;

nls:
    '\n'
    | nls '\n'
    ;

subs:	subs sub
    |   sub
    ;

sub:	sub_start statements ESUB
        {
          $$ = 0; MK_I("ret", R0());
	  allocate();
	  emit_flush();
	  clear_tables();
        }
        | emit{ $$=0; }
        | nls { $$=0; }
    ;

sub_start: SUB IDENTIFIER '\n'
        { $$ = 0;
          iSUBROUTINE(mk_address($2, U_add_uniq_sub));
        }
    ;

statements: statement
    |   statements statement
    ;

statement:  { clear_state(); }
        instruction             { $$ = $2; }
    ;

labels:	/* none */         { $$ = NULL; }
    |   _labels
    ;

_labels: _labels label
    |   label
    | label '\n'
    ;

label:  LABEL		{ $$ = iLABEL(mk_address($1, U_add_uniq_label)); }
    ;

instruction:
	labels  labeled_inst '\n'  { $$ = $2; }
    ;
labeled_inst:
	assignment
    |   if_statement
    |   SYM type IDENTIFIER		{ mk_ident($3, $2); }
    |   LOCAL type IDENTIFIER		{ mk_ident($3, $2); }
    |   LOCAL type VAR  		{ $$ = 0;
            warning("parser", "file %s line %d: %s already defined\n",
            sourcefile, line, $3->name); }
    |   PARAM type IDENTIFIER		{ $$ = MK_I("restore",
		                            R1(mk_ident($3, $2)));}
    |   PARAM reg			{ $$ = MK_I("restore", R1($2)); }
    |   RESULT var			{ $$ = MK_I("restore", R1($2)); }
    |   ARG var				{ $$ = MK_I("save", R1($2)); }
    |   RETURN var			{ $$ = MK_I("save", R1($2)); }
    |   CALL IDENTIFIER			{ $$ = MK_I("bsr",
                                              R1(mk_address($2, U_add_once)));}
    |   GOTO IDENTIFIER			{ $$ = MK_I("branch",
                                              R1(mk_address($2, U_add_once)));}
    |   INC var				{ $$ = MK_I("inc",R1($2)); }
    |   DEC var				{ $$ = MK_I("dec",R1($2)); }
    |   PRINT var			{ $$ = MK_I("print",R1($2)); }
    |   SAVEALL				{ $$ = MK_I("saveall" ,R0()); }
    |   RESTOREALL			{ $$ = MK_I("restoreall" ,R0()); }
    |   END				{ $$ = MK_I("end" ,R0()); }
    |  PARROT_OP vars                   { $$ = iANY($1,0,regs, 1); free($1); }
    | /* none */                               { $$ = 0;}
    ;

type:
        INTV { $$ = 'I'; }
    |   FLOATV { $$ = 'N'; }
    |   STRINGV { $$ = 'S'; }
    |   classname { $$ = 'P'; free($1); }
    ;

classname:
    IDENTIFIER
    ;

assignment:
       target '=' var			{ $$ = MK_I("set", R2($1, $3)); }
    |  target '=' '!' var		{ $$ = MK_I("not", R2($1, $4));}
    |  target '=' '-' var		{ $$ = MK_I("neg", R2($1, $4));}
    |  target '=' '~' var		{ $$ = MK_I("bnot", R2($1, $4));}
    |  target '=' var '+' var		{ $$ = MK_I("add", R3($1, $3, $5)); }
    |  target '=' var '-' var		{ $$ = MK_I("sub", R3($1, $3, $5)); }
    |  target '=' var '*' var		{ $$ = MK_I("mul", R3($1, $3, $5)); }
    |  target '=' var POW var		{ $$ = MK_I("pow", R3($1, $3, $5)); }
    |  target '=' var '/' var		{ $$ = MK_I("div", R3($1, $3, $5)); }
    |  target '=' var '%' var		{ $$ = MK_I("mod", R3($1, $3, $5)); }
    |  target '=' var '.' var		{ $$ = MK_I("concat", R3($1,$3,$5)); }
    |  target '=' var SHIFT_LEFT var	{ $$ = MK_I("shl", R3($1, $3, $5)); }
    |  target '=' var SHIFT_RIGHT var	{ $$ = MK_I("shr", R3($1, $3, $5)); }
    |  target '=' var SHIFT_RIGHT_U var	{ $$ = MK_I("lsr", R3($1, $3, $5)); }
    |  target '=' var LOG_AND var	{ $$ = MK_I("and", R3($1, $3, $5)); }
    |  target '=' var LOG_OR var	{ $$ = MK_I("or", R3($1, $3, $5)); }
    |  target '=' var LOG_XOR var	{ $$ = MK_I("xor", R3($1, $3, $5)); }
    |  target '=' var '&' var		{ $$ = MK_I("band", R3($1, $3, $5)); }
    |  target '=' var '|' var		{ $$ = MK_I("bor", R3($1, $3, $5)); }
    |  target '=' var '~' var		{ $$ = MK_I("bxor", R3($1, $3, $5)); }
    |  target '=' var '[' keylist ']'   { $$ = iINDEXFETCH($1, $3, $5); }
    |  var '[' keylist ']' '=' var	{ $$ = iINDEXSET($1, $3, $6); }
    |  target '=' NEW classname		{ $$ = iNEW($1, $4, 1); }
    |  target '=' DEFINED var	{ $$ = MK_I("defined %s, %s",R2($1,$4)); }
    |  target '=' CLONE var		{ $$ = MK_I("clone %s, %s",R2($1, $4));
    }
    |  target '=' ADDR IDENTIFIER	{ $$ = MK_I("set_addr",
                                          R2($1, mk_address($4,U_add_once))); }
    |  target '=' GLOBAL string	{ $$ = MK_I("find_global",R2($1,$4)); }
    |  GLOBAL string '=' var	{ $$ = MK_I("store_global",R2($2,$4)); }
    |  NEW                      { expect_pasm = 1; }
        target COMMA newtype    { $$ = iNEW($3, $5, 1); }
    |  DEFINED target COMMA var { $$ = MK_I("defined", R2($2, $4)); }
    |  CLONE target COMMA var   { $$ = MK_I("clone", R2($2, $4)); }
    ;

newtype: MACRO                 { $$ = str_dup($1+1); free($1); }
    ;

if_statement:
       IF var relop var GOTO IDENTIFIER { $$=MK_I($3,R3($2,$4,
                                          mk_address($6,U_add_once))); }
    |  IF var GOTO IDENTIFIER           {$$= MK_I("if", R2($2,
                                          mk_address($4, U_add_once))); }
    |  UNLESS var GOTO IDENTIFIER       {$$= MK_I("unless",R2($2,
                                          mk_address($4, U_add_once))); }
    |  IF var COMMA IDENTIFIER          { $$= MK_I("if", R2($2,
                                          mk_address($4, U_add_once))); }
    |  UNLESS var COMMA IDENTIFIER      { $$= MK_I("unless", R2($2,
                                          mk_address($4, U_add_once))); }

    ;

relop:
       RELOP_EQ				{ $$ = "eq"; }
    |  RELOP_NE				{ $$ = "ne"; }
    |  RELOP_GT				{ $$ = "gt"; }
    |  RELOP_GTE			{ $$ = "ge"; }
    |  RELOP_LT				{ $$ = "lt"; }
    |  RELOP_LTE			{ $$ = "le"; }
    ;


target: VAR
    |  reg
    ;
lhs: VAR
    |  reg
    ;

vars:   { $$ = NULL; }
    |  _vars  { $$ = $1; }
    ;

_vars: _vars COMMA _var_or_i		{ $$ = regs[0]; }
    |  _var_or_i
    ;

_var_or_i: var_or_i                     { regs[nargs++] = $1; }
    | lhs '[' keylist ']'               { regs[nargs++] = $1;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = $3; $$ = $1; }
    ;
var_or_i:
       IDENTIFIER			{ $$ = mk_address($1, U_add_once); }
    |  var
    | MACRO                             { $$ = macro($1+1); free($1); }
    ;

var:   VAR
    |  rc
    ;

keylist:                                { nkeys=0; }
       _keylist                         { $$ = link_keys(nkeys, keys); }
    ;

_keylist: key                            { keys[nkeys++] = $1; }
     | _keylist ';' key                  { keys[nkeys++] = $3; $$ =  keys[0]; }
    ;

key:  var
    ;

rc:	reg
    |	const
    ;

reg:   IREG				{ $$ = mk_symreg($1, 'I'); }
    |  NREG				{ $$ = mk_symreg($1, 'N'); }
    |  SREG				{ $$ = mk_symreg($1, 'S'); }
    |  PREG				{ $$ = mk_symreg($1, 'P'); }
    |  REG                              { $$ = mk_pasm_reg($1); }
    ;

const: INTC				{ $$ = mk_const($1, 'I'); }
    |  FLOATC				{ $$ = mk_const($1, 'N'); }
    |  STRINGC				{ $$ = mk_const($1, 'S'); }
    ;

string: SREG				{ $$ = mk_symreg($1, 'S'); }
    |  STRINGC				{ $$ = mk_const($1, 'S'); }
    ;
%%

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
