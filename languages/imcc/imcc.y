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
#include "pbc.h"
#include "parser.h"

#define YYDEBUG 1
#define YYERROR_VERBOSE 1

/*
 * we use a pure parser wtih the interpreter as a parameter
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


static SymReg *keys[IMCC_MAX_REGS];
static int nkeys = 0;

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


/*
 * MK_I: build and emitb instruction by iANY
 *
 * fmt may contain:
 *   op %s, %s # comment
 * or just
 *   op
 *
 */
static
Instruction *
MK_I(struct Parrot_Interp *interpreter, const char * fmt, SymReg ** r)
{
    char opname[64];
    char *p;
    const char *q;
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
    return iANY(interpreter, opname, fmt, r, 1);
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
    Instruction *i = _mk_instruction("","%s:", R1(r0), 0);
    i->type = ITLABEL;
    if (emit)
        emitb(i);
    return i;
}

static Instruction * iLABEL(SymReg * r0) {
    Instruction *i = _mk_instruction("","%s:", R1(r0), 0);
    i->type = ITLABEL;
    i = emitb(i);
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
static Instruction *
iINDEXFETCH(struct Parrot_Interp *interp, SymReg * r0, SymReg * r1,
    SymReg * r2)
{
    if(r0->set == 'S' && r1->set == 'S' && r2->set == 'I') {
        SymReg * r3 = mk_const("1", 'I');
        return MK_I(interp, "substr %s, %s, %s, 1", R4(r0, r1, r2, r3));
    }
    keyvec |= KEY_BIT(2);
    return MK_I(interp, "set %s, %s[%s]", R3(r0,r1,r2));
}

/*
 * substr or P[key] = X
 */

static Instruction *
iINDEXSET(struct Parrot_Interp *interp, SymReg * r0, SymReg * r1, SymReg * r2)
{
    if(r0->set == 'S' && r1->set == 'I' && r2->set == 'S') {
        SymReg * r3 = mk_const("1", 'I');
        MK_I(interp, "substr %s, %s, %s, %s", R4(r0, r1,r3, r2));
    }
    else if (r0->set == 'P') {
        keyvec |= KEY_BIT(1);
	MK_I(interp, "set %s[%s], %s", R3(r0,r1,r2));
    }
    else {
        fataly(EX_SOFTWARE, "iINDEXSET", line,"unsupported indexed set op\n");
    }
    return 0;
}

/* return the index of a PMC class */
static int
get_pmc_num(struct Parrot_Interp *interpreter, char *pmc_type)
{
    STRING * s = string_make(interpreter, pmc_type,
            (UINTVAL) strlen(pmc_type), NULL, 0, NULL);
    PMC * key = key_new_string(interpreter, s);
    return interpreter->Parrot_base_classname_hash->vtable->get_integer_keyed(
            interpreter, interpreter->Parrot_base_classname_hash, key);
}

/* only .PmcType */
SymReg *
macro(struct Parrot_Interp *interp, char *name)
{
    SymReg * r;
    char buf[16];
    int type = get_pmc_num(interp, name);
    sprintf(buf, "%d", type);
    r =  mk_const(str_dup(buf), 'I');
    return r;
}

static Instruction *
multi_keyed(struct Parrot_Interp *interpreter,char *name,
SymReg ** r, int nr, int emit)
{
    int i, keyf, kv, n;
    char buf[16];
    static int p = 0;
    SymReg *preg[IMCC_MAX_REGS];    /* px,py,pz */
    SymReg *nreg[IMCC_MAX_REGS];
    Instruction * ins;

    /* count keys in keyvec */
    kv = keyvec;
    for (i = keyf = 0; i < nr; i++, kv >>= 1)
        if (kv & 1)
            keyf++;
    if (keyf <= 1)
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
            if (r[i]->set != 'P') {
                fataly(EX_SOFTWARE, "multi_keyed", line,"not an aggregate\n");
            }
            nargs = 3;
            /* don't emit LHS yet */
            if (i == 0) {
                keyvec = 1 << 1;
                nreg[0] = r[i];
                nreg[1] = r[i+1];
                nreg[2] = preg[n];
                /* set p_k px */
                ins = iANY(interpreter, str_dup("set"), 0, nreg, 0);
            }
            else {
                keyvec = 1 << 2;
                nreg[0] = preg[n];
                nreg[1] = r[i];
                nreg[2] = r[i+1];
                /* set py|z p_k */
                iANY(interpreter, str_dup("set"), 0, nreg, 1);
            }
            i++;
        }
        /* non keyed */
        else {
            nargs = 2;
            keyvec = 0;
            if (i == 0) {
                nreg[0] = r[i];
                nreg[1] = preg[n];
                /* set n, px */
                ins = iANY(interpreter, str_dup("set"), 0, nreg, 0);
            }
            else {
                nreg[0] = preg[n];
                nreg[1] = r[i];
                /* set px, n */
                iANY(interpreter, str_dup("set"), 0, nreg, 1);
            }
        }
    }
    /* make a new undef */
    iNEW(interpreter, preg[0], str_dup("PerlUndef"), 1);
    /* emit the operand */
    nargs = 3;
    keyvec = 0;
    iANY(interpreter, name, 0, preg, 1);
    /* emit the LHS op */
    emitb(ins);
    return ins;
}

Instruction *
iANY(struct Parrot_Interp *interpreter, char * name,
    const char *fmt, SymReg **r, int emit)
{
    char fullname[64];
    int i;
    int dirs = 0;
    int op;
    Instruction * ins;

#if 1
    ins = multi_keyed(interpreter, name, r, nargs, emit);
    if (ins)
        return ins;
#endif
    op_fullname(fullname, name, r, nargs);
    op = interpreter->op_lib->op_code(fullname, 1);
    if (op < 0)         /* maybe we got a fullname */
        op = interpreter->op_lib->op_code(name, 1);
    if (op >= 0) {
        op_info_t * op_info = &interpreter->op_info_table[op];
	char format[128];
	int len;

        *format = '\0';
        /* info->arg_count is offset by one, first is opcode
         * build instruction format
         * set LV_in / out flags */
        for (i = 0; i < op_info->arg_count-1; i++) {
            switch (op_info->dirs[i+1]) {
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
        memset(r + nargs, 0, sizeof(*r) * (IMCC_MAX_REGS - nargs));
#if 1
        debug(DEBUG_PARSER,"%s %s\t%s\n", name, format, fullname);
#endif
        /* make the instruction */

        ins = _mk_instruction(name, format, r, dirs);
        ins->keys |= keyvec;
        /* fill iin oplib's info */
        ins->opnum = op;
        ins->opsize = op_info->arg_count;
        /* set up branch flags */
        if (op_info->jump || !strcmp(name, "end")) {

#if 0
            if (!strcmp(name, "bsr") || !strcmp(name, "ret")) {
                /* ignore subcalls and ret
                 * because they saveall
                 */
            }
            else
#endif
            {

                /* XXX: assume the jump is relative and to the last arg.
                 * usually true.
                 */
                ins->type = ITBRANCH | (1 << (nargs-1));
                if (!strcmp(name, "branch") || !strcmp(name, "end"))
                    ins->type |= IF_goto;
            }
        }
        else if (!strcmp(name, "set") && nargs == 2) {
            /* set Px, Py: both PMCs have the same address */
            if (r[0]->set == 'P' && r[1]->set == 'P')
                ins->type |= ITALIAS;
        }
        else if (!strcmp(name, "set_addr")) {
            /* XXX probably a CATCH block */
            ins->type = ITADDR | IF_r1_branch | ITBRANCH;
        }
        if (emit)
             emitb(ins);
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
%token <t> SUB NAMESPACE ENDNAMESPACE CLASS ENDCLASS SYM LOCAL CONST PARAM
%token <t> INC DEC
%token <t> SHIFT_LEFT SHIFT_RIGHT INTV FLOATV STRINGV DEFINED LOG_XOR
%token <t> RELOP_EQ RELOP_NE RELOP_GT RELOP_GTE RELOP_LT RELOP_LTE
%token <t> GLOBAL ADDR CLONE RESULT RETURN POW SHIFT_RIGHT_U LOG_AND LOG_OR
%token <t> COMMA ESUB
%token <s> LABEL
%token <t> EMIT EOM
%token <s> IREG NREG SREG PREG IDENTIFIER STRINGC INTC FLOATC REG MACRO
%token <s> PARROT_OP
%type <t> type
%type <i> program sub sub_start emit
%type <s> classname relop
%type <i> labels _labels label statements statement
%type <i> instruction assignment if_statement labeled_inst
%type <sr> target reg const var rc string
%type <sr> key keylist _keylist newtype
%type <sr> vars _vars var_or_i _var_or_i
%type <i> pasmcode pasmline pasm_inst
%type <sr> pasm_args lhs
%token <sr> VAR

%pure_parser

%start program

%%

program:                         { open_comp_unit(); }
    statements  { $$ = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    ;


pasmcode: pasmline
    | pasmcode pasmline
    ;

pasmline: labels  pasm_inst '\n'  { $$ = 0; }
    ;
pasm_inst: {clear_state();}
       PARROT_OP pasm_args	        { $$ = iANY(interp, $2,0,regs,1); free($2); }
    | /* none */                               { $$ = 0;}

    ;
pasm_args:
    vars
    ;

emit:
      EMIT                              { open_comp_unit(); }
      pasmcode
      EOM 				{ emit_flush(interp); $$=0;}
    ;



sub:	sub_start
        statements ESUB
        {
          $$ = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
        | emit { $$=0; }
    ;

sub_start: SUB                           { open_comp_unit(); }
           IDENTIFIER '\n'
        { $$ = 0;
          iSUBROUTINE(mk_address($3, U_add_uniq_sub));
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
    ;

label:  LABEL		{ $$ = iLABEL(mk_address($1, U_add_uniq_label)); }
    ;

instruction:
	labels  labeled_inst '\n'  { $$ = $2; }
    |  sub
    ;
labeled_inst:
	assignment
    |   if_statement
    |   NAMESPACE IDENTIFIER            { push_namespace($2); }
    |   ENDNAMESPACE IDENTIFIER         { pop_namespace($2); }
    |   LOCAL { is_def=1; } type IDENTIFIER { mk_ident($4, $3);is_def=0; }
    |   CONST { is_def=1; } type IDENTIFIER '=' const
                                    { mk_const_ident($4, $3, $6);is_def=0; }
    |   PARAM { is_def=1; } type IDENTIFIER { $$ = MK_I(interp, "restore",
		                            R1(mk_ident($4, $3)));is_def=0; }
    |   PARAM reg			{ $$ = MK_I(interp, "restore", R1($2)); }
    |   RESULT var			{ $$ = MK_I(interp, "restore", R1($2)); }
    |   ARG var				{ $$ = MK_I(interp, "save", R1($2)); }
    |   RETURN var			{ $$ = MK_I(interp, "save", R1($2)); }
    |   CALL IDENTIFIER			{ $$ = MK_I(interp, "bsr",
                                              R1(mk_address($2, U_add_once)));}
    |   GOTO IDENTIFIER			{ $$ = MK_I(interp, "branch",
                                              R1(mk_address($2, U_add_once)));}
    |   INC var				{ $$ = MK_I(interp, "inc",R1($2)); }
    |   DEC var				{ $$ = MK_I(interp, "dec",R1($2)); }
    |   PRINT var			{ $$ = MK_I(interp, "print",R1($2)); }
    |   SAVEALL				{ $$ = MK_I(interp, "saveall" ,R0()); }
    |   RESTOREALL			{ $$ = MK_I(interp, "restoreall" ,R0()); }
    |   END				{ $$ = MK_I(interp, "end" ,R0()); }
    |  PARROT_OP vars                   { $$ = iANY(interp, $1,0,regs, 1); free($1); }
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
       target '=' var			{ $$ = MK_I(interp, "set", R2($1, $3)); }
    |  target '=' '!' var		{ $$ = MK_I(interp, "not", R2($1, $4));}
    |  target '=' '-' var		{ $$ = MK_I(interp, "neg", R2($1, $4));}
    |  target '=' '~' var		{ $$ = MK_I(interp, "bnot", R2($1, $4));}
    |  target '=' var '+' var		{ $$ = MK_I(interp, "add", R3($1, $3, $5)); }
    |  target '=' var '-' var		{ $$ = MK_I(interp, "sub", R3($1, $3, $5)); }
    |  target '=' var '*' var		{ $$ = MK_I(interp, "mul", R3($1, $3, $5)); }
    |  target '=' var POW var		{ $$ = MK_I(interp, "pow", R3($1, $3, $5)); }
    |  target '=' var '/' var		{ $$ = MK_I(interp, "div", R3($1, $3, $5)); }
    |  target '=' var '%' var		{ $$ = MK_I(interp, "mod", R3($1, $3, $5)); }
    |  target '=' var '.' var		{ $$ = MK_I(interp, "concat", R3($1,$3,$5)); }
    |  target '=' var SHIFT_LEFT var	{ $$ = MK_I(interp, "shl", R3($1, $3, $5)); }
    |  target '=' var SHIFT_RIGHT var	{ $$ = MK_I(interp, "shr", R3($1, $3, $5)); }
    |  target '=' var SHIFT_RIGHT_U var	{ $$ = MK_I(interp, "lsr", R3($1, $3, $5)); }
    |  target '=' var LOG_AND var	{ $$ = MK_I(interp, "and", R3($1, $3, $5)); }
    |  target '=' var LOG_OR var	{ $$ = MK_I(interp, "or", R3($1, $3, $5)); }
    |  target '=' var LOG_XOR var	{ $$ = MK_I(interp, "xor", R3($1, $3, $5)); }
    |  target '=' var '&' var		{ $$ = MK_I(interp, "band", R3($1, $3, $5)); }
    |  target '=' var '|' var		{ $$ = MK_I(interp, "bor", R3($1, $3, $5)); }
    |  target '=' var '~' var		{ $$ = MK_I(interp, "bxor", R3($1, $3, $5)); }
    |  target '=' var '[' keylist ']'   { $$ = iINDEXFETCH(interp, $1, $3, $5); }
    |  var '[' keylist ']' '=' var	{ $$ = iINDEXSET(interp, $1, $3, $6); }
    |  target '=' NEW classname		{ $$ = iNEW(interp, $1, $4, 1); }
    |  target '=' DEFINED var	        { $$ = MK_I(interp, "defined",R2($1,$4)); }
    |  target '=' DEFINED var '[' keylist ']' { keyvec=KEY_BIT(2);
                                     $$ = MK_I(interp, "defined", R3($1, $4, $6));}
    |  target '=' CLONE var		{ $$ = MK_I(interp, "clone",R2($1, $4));
    }
    |  target '=' ADDR IDENTIFIER	{ $$ = MK_I(interp, "set_addr",
                                          R2($1, mk_address($4,U_add_once))); }
    |  target '=' GLOBAL string	{ $$ = MK_I(interp, "find_global",R2($1,$4)); }
    |  GLOBAL string '=' var	{ $$ = MK_I(interp, "store_global",R2($2,$4)); }
    |  NEW                              { expect_pasm = 1; }
        target COMMA newtype            { $$ = MK_I(interp, "new", R2($3, $5)); }
    |  DEFINED target COMMA var         { $$ = MK_I(interp, "defined", R2($2, $4)); }
    |  DEFINED target COMMA var '[' keylist ']'  { keyvec=KEY_BIT(2);
                                       $$ = MK_I(interp, "defined", R3($2, $4, $6));}
    |  CLONE target COMMA var           { $$ = MK_I(interp, "clone", R2($2, $4)); }
    ;

newtype:
     MACRO                             { $$ = macro(interp, $1); free($1); }
    | const
    ;

if_statement:
       IF var relop var GOTO IDENTIFIER { $$=MK_I(interp, $3,R3($2,$4,
                                          mk_address($6,U_add_once))); }
    |  IF var GOTO IDENTIFIER           {$$= MK_I(interp, "if", R2($2,
                                          mk_address($4, U_add_once))); }
    |  UNLESS var GOTO IDENTIFIER       {$$= MK_I(interp, "unless",R2($2,
                                          mk_address($4, U_add_once))); }
    |  IF var COMMA IDENTIFIER          { $$= MK_I(interp, "if", R2($2,
                                          mk_address($4, U_add_once))); }
    |  UNLESS var COMMA IDENTIFIER      { $$= MK_I(interp, "unless", R2($2,
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
    |  PARROT_OP                        { $$ = mk_address($1, U_add_once); }
    |  var
    | MACRO                             { $$ = macro(interp, $1); free($1); }
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


int yyerror(char * s)
{
    /* fprintf(stderr, "last token = [%s]\n", yylval.s); */
    fprintf(stderr, "(error) line %d: %s\n", line, s );
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
