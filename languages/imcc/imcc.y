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
#include "imc.h"
#include "anyop.h"

#define YYDEBUG 1

int         yyerror(char *);
int         yylex();
extern char yytext[];
long        line;
int         expect_eol;

/*
 * Choosing instructions for Parrot is pretty easy since
 * many are polymorphic.
 */


static SymReg *regs[PARROT_MAX_ARGS];
static SymReg ** RR(int n, ...)
{
    va_list ap;
    int i = 0;

    va_start(ap, n);
    while (n--) {
	regs[i++] = va_arg(ap, SymReg *);
    }
    while (i < PARROT_MAX_ARGS)
	regs[i++] = 0;
    return regs;
}

/* intermediate macros for registers */
#define R2(r0,r1) RR(2,r0,r1)
#define R regs[0],regs[1],regs[2],regs[3]

SymReg * iMOVE(SymReg *r0, SymReg*r1) {
    int flags = IF_unary;
    R2(r0, r1);
    if (r0->set == 'P' && r1->set != 'P') {
	/* r0 needs read access because set Px, Ax calls Px's set
	 * method, instead of just clobbering it. */
	flags = IF_r0_write|IF_r0_read|IF_r1_read;
    }
    emitb(mk_instruction("set %s, %s", R, flags));
    return r0;
}

SymReg * iNOT(SymReg *r0, SymReg*r1) {
    emitb(mk_instruction("not %s, %s", r0, r1, NULL, NULL, IF_unary));
    return r0;
}

SymReg * iNEG(SymReg *r0, SymReg*r1) {
    if (r0->set != 'S' || r0->set == r1->set) {
	emitb(mk_instruction("neg %s, %s", r0, r1, NULL, NULL, IF_unary));
    }
    else {
        fprintf(stderr, "line %ld: Syntax error, neg arguments must be int, float, or PMC\n",
                line);
        exit(EX_DATAERR);
    }
    return r0;
}

SymReg * iINC(SymReg *r0) {
    emitb(mk_instruction("inc %s", r0, NULL, NULL, NULL, IF_inplace));
    return r0;
}

SymReg * iDEC(SymReg *r0) {
    emitb(mk_instruction("dec %s", r0, NULL, NULL, NULL, IF_inplace));
    return r0;
}

SymReg * iADD(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("add %s, %s, %s", r0, r1, r2, NULL, IF_binary));
    return r0;
}

SymReg * iSUB(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("sub %s, %s, %s", r0, r1, r2, NULL, IF_binary));
    return r0;
}

SymReg * iMUL(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("mul %s, %s, %s", r0, r1, r2, NULL, IF_binary));
    return r0;
}

SymReg * iPOW(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("pow %s, %s, %s", r0, r1, r2, NULL, IF_binary));
    return r0;
}
SymReg * iDIV(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("div %s, %s, %s", r0, r1, r2, NULL, IF_binary));
    return r0;
}

SymReg * iMOD(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("mod %s, %s, %s", r0, r1, r2, NULL, IF_binary));
    return r0;
}

SymReg * iSHL(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("shl %s, %s, %s", r0, r1, r2, NULL, IF_binary));
    return r0;
}

SymReg * iSHR(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("shr %s, %s, %s", r0, r1, r2, NULL, IF_binary));
    return r0;
}

SymReg * iXOR(SymReg *r0, SymReg*r1, SymReg *r2) {
    if ((r0->set == 'I' && r1->set == 'I' && r2->set == 'I')
	|| (r0->set == 'P' && r1->set == 'P' && r2->set == 'P')) {
	emitb(mk_instruction("xor %s, %s, %s", r0, r1, r2, NULL, IF_binary));
    }
    else {
        fprintf(stderr, "line %ld: Syntax error, xor arguments must be int or PMC\n",
                line);
        exit(EX_DATAERR);
    }
    return r0;
}

SymReg * iBAND(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("band %s, %s, %s", r0, r1, r2, NULL, IF_binary));
    return r0;
}

SymReg * iBOR(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("bor %s, %s, %s", r0, r1, r2, NULL, IF_binary));
    return r0;
}

SymReg * iBXOR(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("bxor %s, %s, %s", r0, r1, r2, NULL, IF_binary));
    return r0;
}

SymReg * iCONCAT(SymReg *r0, SymReg*r1, SymReg *r2) {
    if((r0->set == 'S' && r1->set == 'S' && r2->set == 'S')
       || (r0->set == 'P' && r1->set == 'P' && r2->set == 'P')) {
        emitb(mk_instruction("concat %s, %s, %s", r0, r1, r2, NULL, IF_binary));
    }
    else {
        fprintf(stderr, "line %ld: Syntax error, concat arguments must be all strings or all PMC's\n",
                line);
        exit(EX_DATAERR);
    }
    return r0;
}

SymReg * iCALL(SymReg * r0) {
    emitb(mk_instruction("bsr %s", r0, NULL, NULL, NULL, IF_r0_read));
    return r0;
}

SymReg * iBRANCH(SymReg * r0) {
    Instruction * i = emitb(mk_instruction("branch %s", r0, NULL, NULL, NULL, IF_r0_branch | IF_goto));
    i->type = ITBRANCH;
    return r0;
}

SymReg * iLABEL(SymReg * r0) {
    Instruction *i = emitb(mk_instruction("%s:", r0, NULL, NULL, NULL,
					  0)); /* IF_r0_read ? */
    i->type = ITLABEL;
    return r0;
}

SymReg * iARG(SymReg * r0) {
    emitb(mk_instruction("save %s", r0, NULL, NULL, NULL, IF_r0_read));
    return r0;
}

SymReg * iPUSH(SymReg * r0) {
    emitb(mk_instruction("save %s", r0, NULL, NULL, NULL, IF_r0_read));
    return r0;
}

SymReg * iPOP(SymReg * r0) {
    emitb(mk_instruction("restore %s", r0, NULL, NULL, NULL, IF_r0_write));
    return r0;
}

SymReg * iRESULT(SymReg * r0) {
    return iPOP(r0);
}

SymReg * iRETURN(SymReg * r0) {
    return iPUSH(r0);
}

SymReg * iSAVEALL() {
    emitb(mk_instruction("saveall", NULL, NULL, NULL, NULL, 0));
    return 0;
}

SymReg * iRESTOREALL() {
    emitb(mk_instruction("restoreall", NULL, NULL, NULL, NULL, 0));
    return 0;
}

SymReg * iPRINT(SymReg * r0) {
    emitb(mk_instruction("print %s", r0, NULL, NULL, NULL, IF_r0_read));
    return r0;
}

SymReg * iSUBROUTINE(SymReg * r0) {
    emitb(mk_instruction("%s:", r0, NULL, NULL, NULL, IF_r0_read)); /* IF_r0_read? */
    return r0;
}

SymReg * iRET() {
    emitb(mk_instruction("ret", NULL, NULL, NULL, NULL, 0));
    return 0;
}

SymReg * iINDEXFETCH(SymReg * r0, SymReg * r1, SymReg * r2) {
    if(r0->set == 'S' && r1->set == 'S' && r2->set == 'I') {
        emitb(mk_instruction("substr %s, %s, %s, 1", r0, r1, r2, NULL, IF_binary));
    }
    else if (r1->set == 'P') {
	emitb(mk_instruction("set %s, %s[%s]", r0, r1, r2, NULL, IF_binary));
	r1->score = 1000;
    }
    else {
        fprintf(stderr, "FIXME: Internal error, unsupported indexed fetch operation\n");
        exit(EX_SOFTWARE);
    }
    return r0;
}

SymReg * iINDEXSET(SymReg * r0, SymReg * r1, SymReg * r2) {
    if(r0->set == 'S' && r1->set == 'I' && r2->set == 'S') {
        /* Temporaries assigned by IMCC are of form (T.n)
            SymReg * temp = mk_symreg("(S.0)", 'S');
        */
        emitb(mk_instruction("substr %s, %s, 1, %s", r0, r1, r2, NULL, IF_binary));
    }
    else if (r0->set == 'P') {
	/* XXX: SEAN: is "read" right for setting an array?  */
	emitb(mk_instruction("set %s[%s], %s", r0, r1, r2, NULL,
			     IF_r0_write | IF_r1_read | IF_r2_read));
	r0->score = 1000;
    }
    else {
        fprintf(stderr, "FIXME: Internal error, unsupported indexed set operation\n");
        exit(EX_SOFTWARE);
    }
    return r0;
}

SymReg * iIF(int relop, SymReg * r0, SymReg * r1, SymReg * r2) {
    Instruction * i;
    char op[256];
    relop_to_op(relop, op);
    strcat(op, " %s, %s, %s");
    i = emitb(mk_instruction(op, r0, r1, r2, NULL, IF_r0_read | IF_r1_read | IF_r2_branch));
    i->type = ITBRANCH;
    return 0;
}

SymReg * iIF1(char *f, SymReg * r0, SymReg * dest)
{
    Instruction * i;
    char op[256];
    sprintf(op, "%s %%s, %%s", f);
    i = emitb(mk_instruction(op, r0, dest, 0, NULL, IF_r0_read | IF_r1_branch));
    i->type = ITBRANCH;
    return 0;
}

SymReg * iNEW(SymReg * r0, char * type) {
    char op[256];
    strcpy(op, "new %s, .");
    strcat(op, type);
    emitb(mk_instruction(op, r0, NULL, NULL, NULL, IF_r0_write ));
    free(type);
    return r0;
}

SymReg * iDEFINED(SymReg * r0, SymReg * r1) {
    if (r0->set == 'I' && r1->set == 'P') {
	emitb(mk_instruction("defined %s, %s", r0, r1, NULL, NULL,
			     IF_r0_write | IF_r1_read ));
    }
    else {
        fprintf(stderr, "line %ld: Syntax error, defined: arguments must be int, PMC\n",
                line);
	exit(EX_DATAERR);
    }
    return r0;
}

/* XXX -lt
   the address may be the target of a jump
   must we deal with this - think try/CATCH
*/

SymReg * iSET_ADDR(SymReg * r0, SymReg * r1) {
    if (r0->set == 'I') {
	emitb(mk_instruction("set_addr %s, %s", r0, r1, NULL, NULL,
			     IF_r0_write));
    }
    else {
	fprintf(stderr, "line %ld: Syntax error, set_addr destination must be int register\n", line);
	exit(EX_DATAERR);
    }
    return r0;
}

SymReg * iSET_GLOBAL(SymReg * r0, SymReg * r1) {
    if (r0->set == 'S' && r1->set == 'P') {
	emitb(mk_instruction("store_global %s, %s", r0, r1,
			     NULL, NULL, IF_r0_read | IF_r1_read));
    }
    else {
	fprintf(stderr, "line %ld: store_global arguments must be PMC, string\n",
		line);
	exit(EX_DATAERR);
    }
    return r0;
}

SymReg * iGET_GLOBAL(SymReg * r0, SymReg * r1) {
    if (r0->set == 'P' && r1->set == 'S') {
	emitb(mk_instruction("find_global %s, %s", r0, r1,
			     NULL, NULL, IF_r0_write | IF_r1_read));
    }
    else {
	fprintf(stderr, "line %ld: find_global arguments must be PMC, string\n",
		line);
	exit(EX_DATAERR);
    }
    return r0;
}

SymReg * iCLONE(SymReg * r0, SymReg * r1) {
    if (r0->set == r1->set && (r0->set == 'S' || r0->set == 'P')) {
	emitb(mk_instruction("clone %s, %s", r0, r1,
			     NULL, NULL, IF_r0_write | IF_r1_read));
    }
    else {
	fprintf(stderr, "line %ld: clone arguments must be PMCs or strings\n",
		line);
	exit(EX_DATAERR);
    }
    return r0;
}

SymReg * iEMIT(char * assembly) {
    emitb(mk_instruction(assembly, NULL, NULL, NULL, NULL, 0));
    free(assembly);
    return 0;
}

SymReg * iEND() {
    emitb(mk_instruction("end", NULL, NULL, NULL, NULL, 0));
    return 0;
}

int nargs = 0;
SymReg * args[16] = { NULL };

static void
op_fullname(char * dest, const char * name, SymReg * args[], int nargs) {
    int i;
    int key_index = -1;

    strcpy(dest, name);
    dest += strlen(name);
    if (strcmp(name, "set") == 0) {
	if (args[0]->set == 'P' && args[1]->set != 'P') {
	    key_index = 1;
	}
	else if (args[1]->set == 'P' && args[2]->set != 'P') {
	    key_index = 2;
	}
	else {
	    fprintf(stderr, "Can't figure out keyed op!\n");
	    exit(EX_SOFTWARE);
	}
    }
    for (i = 0; i < nargs; i++) {
	char set;
	if (args[i]->type == VTADDRESS)
	    set = 'I';
	else
	    set = args[i]->set;

	*dest++ = '_';
	if (key_index == i)
	    *dest++ = 'k';
	*dest++ = tolower(set);
	if (args[i]->type == VTCONST || args[i]->type == VTADDRESS)
	    *dest++ = 'c';
    }
    *dest = '\0';
}

SymReg * iANY(char * name) {
    char fullname[64];
    int i;
    int dirs = 0;
    op_t op;
    op_fullname(fullname, name, args, nargs);
    op = op_find_exact(fullname);
    if (!same_op(op, NULLOP)) {
	op_info_t * info = op_info(op);
	char format[128];
	int len;
	if (IMCC_DEBUG) {
	    fprintf(stderr, "Op %s (%d, %d)\n", name, op.lib, op.op);
	    print_op_info(stderr, info);
	}

	sprintf(format, "%s  ", name);
	for (i = 1; i < info->arg_count; i++) {
	    switch (info->dirs[i]) {
	    case PARROT_ARGDIR_IN:
		dirs |= 1 << (i - 1);
		break;

	    case PARROT_ARGDIR_OUT:
		dirs |= 1 << (4 + i - 1);
		break;

	    case PARROT_ARGDIR_INOUT:
		dirs |= 1 << (i - 1) | 1 << (4 + i - 1);
		break;

	    default:
		assert(0);
	    };
	    strcat(format, "%s, ");
	}
	if (info->jump) {
	    /* XXX: assume the jump is relative to the last arg.
	     * usually true. */
	    dirs |= 1 << (8 + nargs - 2);
	}
	len = strlen(format);
	len -= 2;
	format[len] = '\0';
	emitb(mk_instruction(format, args[0], args[1], args[2], args[3],
			     dirs));
    } else {
	fprintf(stderr, "line %ld: no op %s (%s<%d>)\n",
		line, fullname, name, nargs);
	exit(EX_SOFTWARE);
    }
    return NULL;
}

void relop_to_op(int relop, char * op) {
    switch(relop) {
        case RELOP_EQ:    strcpy(op, "eq"); return;
        case RELOP_NE:    strcpy(op, "ne"); return;
        case RELOP_GT:    strcpy(op, "gt"); return;
        case RELOP_GTE:   strcpy(op, "ge"); return;
        case RELOP_LT:    strcpy(op, "lt"); return;
        case RELOP_LTE:   strcpy(op, "le"); return;
        default:
            fprintf(stderr, "relop_to_op: Invalid relop [%d]\n", relop);
	    abort();
    }
}

%}

%union {
    int i;
    char * s;
    SymReg * sr;
}

%token <i> CALL GOTO BRANCH ARG RET PRINT IF UNLESS NEW END SAVEALL RESTOREALL
%token <i> SUB NAMESPACE CLASS ENDCLASS SYM LOCAL PARAM PUSH POP INC DEC
%token <i> SHIFT_LEFT SHIFT_RIGHT INTV FLOATV STRINGV DEFINED LOG_XOR
%token <i> RELOP_EQ RELOP_NE RELOP_GT RELOP_GTE RELOP_LT RELOP_LTE
%token <i> GLOBAL ADDR CLONE RESULT RETURN POW
%token <i> COMMA
%token <s> EMIT LABEL
%token <s> IREG NREG SREG PREG IDENTIFIER STRINGC INTC FLOATC
%type <i> type program subs sub sub_start relop
%type <s> classname opname
%type <sr> labels _labels label statements statement
%type <sr> instruction assignment if_statement labeled_inst
%type <sr> target reg const var rc string
%type <sr> vars _vars var_or_i

%start program

%%

program:
    subs emit				{ $$ = 0; }
    ;

emit:
    |   EMIT				{ iEMIT($1); }
    ;

subs:	subs sub
    |   sub
    ;

sub:	sub_start statements labels RET
        {
          $$ = 0; iRET();
	  allocate();
	  emit_flush();
	  clear_tables();
        }
    ;

sub_start: SUB IDENTIFIER
        { $$ = 0;
          iSUBROUTINE(mk_address($2));
        }
    ;

statements: statement
    |   statements statement
    ;

statement:  instruction
    ;

labels:	/* none */         { $$ = NULL; }
    |   _labels
    ;

_labels: _labels label
    |   label
    ;

label:  LABEL				{ $$ = iLABEL(mk_address($1)); }
    ;

instruction:
	labels  { expect_eol = 1; } labeled_inst '\n'  { $$ = $3; }
    ;
labeled_inst:
	assignment
    |   if_statement
    |   SYM type IDENTIFIER		{ mk_ident($3, $2); }
    |   LOCAL type IDENTIFIER		{ mk_ident($3, $2); }
    |   PARAM type IDENTIFIER		{ $$ = iPOP(mk_ident($3, $2));}
    |   PARAM reg			{ $$ = iPOP($2); }
    |   ARG var				{ $$ = iARG($2); }
    |   RESULT var			{ $$ = iRESULT($2); }
    |   RETURN var			{ $$ = iRETURN($2); }
    |   CALL IDENTIFIER			{ $$ = iCALL(mk_address($2)); }
    |   GOTO IDENTIFIER			{ $$ = iBRANCH(mk_address($2));}
    |   PUSH var			{ $$ = iPUSH($2); }
    |   POP var				{ $$ = iPOP($2); }
    |   INC var				{ $$ = iINC($2); }
    |   DEC var				{ $$ = iDEC($2); }
    |   PRINT var			{ $$ = iPRINT($2); }
    |   SAVEALL				{ iSAVEALL(); }
    |   RESTOREALL			{ iRESTOREALL(); }
    |   END				{ iEND(); }
    |  opname				{ nargs = 0;
    					  memset(args, 0, sizeof(args));
					}
       vars 				{ $$ = iANY($1); }
    ;

type:
        INTV { $$ = 'I'; }
    |   FLOATV { $$ = 'N'; }
    |   STRINGV { $$ = 'S'; }
    |   classname { $$ = 'P'; }
    ;

classname:
    IDENTIFIER
    ;

assignment:
       target '=' var			{ $$ = iMOVE($1, $3); }
    |  target '=' '!' var		{ $$ = iNOT($1, $4); }
    |  target '=' '-' var		{ $$ = iNEG($1, $4); }
    |  target '=' var '+' var		{ $$ = iADD($1, $3, $5); }
    |  target '=' var '-' var		{ $$ = iSUB($1, $3, $5); }
    |  target '=' var '*' var		{ $$ = iMUL($1, $3, $5); }
    |  target '=' var POW var		{ $$ = iPOW($1, $3, $5); }
    |  target '=' var '/' var		{ $$ = iDIV($1, $3, $5); }
    |  target '=' var '%' var		{ $$ = iMOD($1, $3, $5); }
    |  target '=' var '.' var		{ $$ = iCONCAT($1, $3, $5); }
    |  target '=' var SHIFT_LEFT var	{ $$ = iSHL($1, $3, $5); }
    |  target '=' var SHIFT_RIGHT var	{ $$ = iSHR($1, $3, $5); }
    |  target '=' var LOG_XOR var	{ $$ = iXOR($1, $3, $5); }
    |  target '=' var '&' var		{ $$ = iBAND($1, $3, $5); }
    |  target '=' var '|' var		{ $$ = iBOR($1, $3, $5); }
    |  target '=' var '~' var		{ $$ = iBXOR($1, $3, $5); }
    |  target '=' var '[' var ']'	{ $$ = iINDEXFETCH($1, $3, $5); }
    |  var '[' var ']' '=' var		{ $$ = iINDEXSET($1, $3, $6); }
    |  target '=' NEW classname		{ $$ = iNEW($1, $4); }
    |  target '=' DEFINED var		{ $$ = iDEFINED($1, $4); }
    |  target '=' CLONE var		{ $$ = iCLONE($1, $4); }
    |  target '=' ADDR IDENTIFIER	{ $$ = iSET_ADDR($1, mk_address($4)); }
    |  target '=' GLOBAL string		{ $$ = iGET_GLOBAL($1, $4); }
    |  GLOBAL string '=' var		{ $$ = iSET_GLOBAL($2, $4); }
    ;

if_statement:
       IF var relop var GOTO IDENTIFIER
				{ $$ = iIF($3, $2, $4, mk_address($6)); }
    |  IF var GOTO IDENTIFIER
		       		{ $$ = iIF1("if",$2, mk_address($4)); }
    |  UNLESS var GOTO IDENTIFIER
				{ $$ = iIF1("unless", $2, mk_address($4)); }
    ;

relop:
       RELOP_EQ				{ $$ = RELOP_EQ; }
    |  RELOP_NE				{ $$ = RELOP_NE; }
    |  RELOP_GT				{ $$ = RELOP_GT; }
    |  RELOP_GTE			{ $$ = RELOP_GTE; }
    |  RELOP_LT				{ $$ = RELOP_LT; }
    |  RELOP_LTE			{ $$ = RELOP_LTE; }
    ;

opname: IDENTIFIER
    ;

target: IDENTIFIER			{ $$ = get_sym($1); free($1); }
    |  reg
    ;

vars:   { $$ = NULL; }
    |  _vars  { $$ = $1; }
    ;

_vars: _vars COMMA var_or_i		{ args[nargs++] = $3; $$ = args[0]; }
    |  var_or_i				{ args[nargs++] = $1; $$ = $1; }
    ;

var_or_i:
       IDENTIFIER			{ $$ = mk_address($1); }
    |  rc
    ;

var:   IDENTIFIER		       { $$ = get_sym($1); free($1); }
    |  rc
    ;

rc:	reg
    |	const
    ;

reg:   IREG				{ $$ = mk_symreg($1, 'I'); }
    |  NREG				{ $$ = mk_symreg($1, 'N'); }
    |  SREG				{ $$ = mk_symreg($1, 'S'); }
    |  PREG				{ $$ = mk_symreg($1, 'P'); }
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
int IMCC_DEBUG = 0;

int main(int argc, char * argv[])
{
    char* output;
    while (argc > 1) {
	if(! strcmp (argv[1], "--debug")) {
	    IMCC_DEBUG = 1;
	    argc--;
	    argv++;
	    continue;
	}
	if(! strcmp (argv[1], "--yydebug")) {
	    yydebug = 1;
	    argc--;
	    argv++;
	    continue;
	}
	if(! strcmp (argv[1], "--verbose")) {
	    IMCC_VERBOSE = 1;
	    argc--;
	    argv++;
	    continue;
	}
	if(! strcmp (argv[1], "--life-info")) {
	    IMCC_LIFE_INFO = 1;
	    argc--;
	    argv++;
	    continue;
	}
	break;
    }

    if (argc <= 1) {
        fprintf(stderr, "No source file specified.\n" );
        exit(EX_NOINPUT);
    }

    if(!(yyin = fopen(argv[1], "r")))    {
        fprintf(stderr, "Error reading source file %s.\n", argv[1] );
        exit(EX_IOERR);
    }

    if (IMCC_DEBUG)
	fprintf(stderr, "loading libs...");

    op_load_file("../../blib/lib/libparrot" PARROT_DLL_EXTENSION);
    op_load_lib("core", PARROT_MAJOR_VERSION,
                        PARROT_MINOR_VERSION,
                        PARROT_PATCH_VERSION);
    if (IMCC_DEBUG)
	fprintf(stderr, "done\n");

    line = 1;

    if (IMCC_DEBUG)
    	fprintf(stderr, "Pass 1: Starting parse...\n");

    if (argc > 2) {
        output = argv[2];
    }
    else {
        output = "a.pasm";
    }

    freopen(output, "w", stdout);

    yyparse();

    /* Flush any pending code such as .emits */
    emit_flush();

    fclose(yyin);
    fclose(stdout);
    op_close_lib();

    if (IMCC_VERBOSE) {
	fprintf(stderr, "%ld lines compiled.\n", line);
	fprintf(stderr, "Compiling assembly module %s\n", output);
    }

    return 0;
}

int yyerror(char * s)
{
    fprintf(stderr, "last token = [%s]\n", yylval.s);
    fprintf(stderr, "(error) line %ld: %s\n", line, s );
    fprintf(stderr, "Didn't create output asm.\n" );
    exit(EX_UNAVAILABLE);
}
