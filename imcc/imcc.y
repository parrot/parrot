%{
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

%}

%union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
}

%token <t> CALL GOTO ARG IF UNLESS NEW END SAVEALL RESTOREALL
%token <t> SUB NAMESPACE ENDNAMESPACE CLASS ENDCLASS SYM LOCAL CONST PARAM
%token <t> INC DEC GLOBAL_CONST
%token <t> SHIFT_LEFT SHIFT_RIGHT INTV FLOATV STRINGV DEFINED LOG_XOR
%token <t> RELOP_EQ RELOP_NE RELOP_GT RELOP_GTE RELOP_LT RELOP_LTE
%token <t> GLOBAL ADDR CLONE RESULT RETURN POW SHIFT_RIGHT_U LOG_AND LOG_OR
%token <t> COMMA ESUB
%token <t> PCC_BEGIN PCC_END PCC_CALL PCC_SUB PCC_BEGIN_RETURN PCC_END_RETURN
%token <t> PCC_BEGIN_YIELD PCC_END_YIELD
%token <t> PROTOTYPED NON_PROTOTYPED
%token <s> LABEL
%token <t> EMIT EOM
%token <s> IREG NREG SREG PREG IDENTIFIER STRINGC INTC FLOATC REG MACRO ENDM
%token <s> PARROT_OP
%type <t> type
%type <i> program sub sub_start emit pcc_sub sub_body pcc_ret pcc_yield
%type <i> compilation_units compilation_unit
%type <s> classname relop
%type <i> labels _labels label statements statement
%type <i> pcc_sub_call
%type <sr> pcc_arg pcc_result pcc_args pcc_results pcc_params pcc_param
%type <sr> pcc_returns pcc_return pcc_call
%type <t> pcc_proto pcc_sub_proto
%type <i> instruction assignment if_statement labeled_inst
%type <sr> target reg const var rc string
%type <sr> key keylist _keylist
%type <sr> vars _vars var_or_i _var_or_i label_op
%type <i> pasmcode pasmline pasm_inst
%type <sr> pasm_args lhs
%token <sr> VAR
%token <t> LINECOMMENT
%token <s> FILECOMMENT
%expect 1 /* s/r between empty PARAM and $default in sub_body -> statemen */

%pure_parser

%start program

%%

program:                         { open_comp_unit(); $$ = 0;}
    compilation_units            { close_comp_unit(interp); $$ = 0; }
    ;

compilation_unit:    sub
        | pcc_sub
        | emit
        | '\n'  { $$ = 0; }
    ;

compilation_units: compilation_unit
    | compilation_units compilation_unit
    ;


pasmcode: pasmline
    | pasmcode pasmline
    ;

pasmline: labels  pasm_inst '\n'  { $$ = 0; }
    | MACRO '\n'                  { $$ = 0; }
    | FILECOMMENT                 { $$ = 0; }
    | LINECOMMENT                 { $$ = 0; }
    ;

pasm_inst: {clear_state();}
       PARROT_OP pasm_args	 { $$ = INS(interp, $2,0,regs,nargs,keyvec,1);
                                          free($2); }
    | PCC_SUB LABEL              {
                                          char *name = str_dup($2);
                                          $$ = iSUBROUTINE(
                                          mk_address($2, U_add_uniq_sub));
                                          $$->r[1] =  mk_pcc_sub(name, 0);
                                        }
    | /* none */                        { $$ = 0;}
    ;
pasm_args:
    vars
    ;

emit:
      EMIT                              { open_comp_unit();
                                          function = "(emit)"; }
      pasmcode
      EOM 				{ if (optimizer_level & OPT_PASM)
                                                allocate(interp);
                                          emit_flush(interp); $$=0;}
    ;

sub:	sub_start
        sub_body
    ;

sub_body:
        statements ESUB
        {
          $$ = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
     ;

sub_start: SUB                           { open_comp_unit(); }
           IDENTIFIER '\n'
        { $$ = 0;
          iSUBROUTINE(mk_address($3, U_add_uniq_sub));
        }
    ;
pcc_sub: PCC_SUB   { open_comp_unit(); }
       IDENTIFIER pcc_sub_proto '\n'
        {
          char *name = str_dup($3);
          Instruction *i = iSUBROUTINE(mk_address($3, U_add_uniq_sub));
          i->r[1] = $<sr>$ = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = $4;
        }
       pcc_params
       sub_body { $$ = 0; }
    ;

pcc_params: /* empty */                   { $$ = 0; }
    | pcc_params pcc_param '\n'           { add_pcc_param($<sr>0, $2);}
    ;

pcc_param: PARAM         { is_def=1; }
         type IDENTIFIER { $$ = mk_ident($4, $3); is_def=0; }
    ;

pcc_sub_call: PCC_BEGIN pcc_proto '\n' {
              char name[128];
              SymReg * r;
              Instruction *i;

              sprintf(name, "#pcc_sub_call_%d", line - 1);
              $<sr>$ = r = mk_pcc_sub(str_dup(name), 0);
              r->pcc_sub->prototyped = $2;
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

           }
           pcc_args
           pcc_call
           label '\n'
           pcc_results
           PCC_END  '\n' { $$ = 0; }
    ;

pcc_proto: PROTOTYPED           { $$ = 1; }
         | NON_PROTOTYPED       { $$ = 0; }
    ;

pcc_sub_proto: /* empty */      { $$ = -1; }
         | pcc_proto
    ;

pcc_call: PCC_CALL var COMMA var '\n' {
                  add_pcc_sub($<sr>-1, $2);
                  add_pcc_cc($<sr>-1, $4);
              }
       | PCC_CALL var '\n' {
                  add_pcc_sub($<sr>-1, $2);
              }
     ;

pcc_args: /* empty */                   { $$ = 0; }
    | pcc_args pcc_arg '\n'             {  add_pcc_arg($<sr>0, $2);}
    ;

pcc_arg: ARG var                        { $$ = $2; }
    ;

pcc_results: /* empty */                { $$ = 0; }
    | pcc_results pcc_result '\n'       { if($2) add_pcc_result($<sr>-4, $2); }
    ;

pcc_result: RESULT var                  { $$ = $2; }
    |   LOCAL { is_def=1; } type IDENTIFIER { mk_ident($4, $3);is_def=0; $$=0; }
    ;

pcc_ret: PCC_BEGIN_RETURN '\n' {
                Instruction *i, *ins = instructions;
                SymReg *r;
                char name[128];
                if (!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
                    fataly(EX_SOFTWARE, sourcefile, line,
                        "pcc_return not inside pcc subroutine\n");
                sprintf(name, "#pcc_sub_ret_%d", line - 1);
                $<sr>$ = r = mk_pcc_sub(str_dup(name), 0);
                i = iLABEL(r);
                i->type = ITPCCSUB | ITLABEL;
        }
        pcc_returns
        PCC_END_RETURN '\n'             { $$ = 0; }
    ;

pcc_yield: PCC_BEGIN_YIELD '\n' {
                Instruction *i, *ins = instructions;
                SymReg *r;
                char name[128];
                if (!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
                    fataly(EX_SOFTWARE, sourcefile, line,
                        "pcc_yield not inside pcc subroutine\n");
                ins->r[1]->pcc_sub->calls_a_sub = 1;
                sprintf(name, "#pcc_sub_yield_%d", line - 1);
                $<sr>$ = r = mk_pcc_sub(str_dup(name), 0);
                i = iLABEL(r);
                i->type = ITPCCSUB | ITLABEL | ITPCCYIELD;
        }
        pcc_returns
        PCC_END_YIELD '\n'             { $$ = 0; }
    ;

pcc_returns: /* empty */                { $$ = 0; }
    |       pcc_returns '\n'            { if($1) add_pcc_return($<sr>0, $1); }
    | pcc_returns pcc_return '\n'       { if($2) add_pcc_return($<sr>0, $2); }
    ;

pcc_return: RETURN var                  { $$ = $2; }
    ;

statements: statement
    |   statements statement
    ;

statement:  { clear_state(); }
        instruction                   { $$ = $2; }
        | MACRO '\n'                  { $$ = 0; }
        | pcc_sub_call                { $$ = 0; }
        | pcc_ret
        | pcc_yield
        | FILECOMMENT                 { $$ = 0; }
        | LINECOMMENT                 { $$ = 0; }
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
    ;
labeled_inst:
	assignment
    |   if_statement
    |   NAMESPACE IDENTIFIER            { push_namespace($2); }
    |   ENDNAMESPACE IDENTIFIER         { pop_namespace($2); }
    |   LOCAL { is_def=1; } type IDENTIFIER { mk_ident($4, $3);is_def=0; }
    |   CONST { is_def=1; } type IDENTIFIER '=' const
                                    { mk_const_ident($4, $3, $6, 0);is_def=0; }
    |   GLOBAL_CONST { is_def=1; } type IDENTIFIER '=' const
                                    { mk_const_ident($4, $3, $6, 1);is_def=0; }
    |   PARAM { is_def=1; } type IDENTIFIER { $$ = MK_I(interp, "restore",
		                            1, mk_ident($4, $3));is_def=0; }
    |   PARAM reg			{ $$ = MK_I(interp, "restore", 1, $2); }
    |   RESULT var			{ $$ = MK_I(interp, "restore", 1, $2); }
    |   ARG var				{ $$ = MK_I(interp, "save", 1, $2); }
    |   RETURN var			{ $$ = MK_I(interp, "save", 1, $2); }
    |   CALL label_op			{ $$ = MK_I(interp, "bsr",  1, $2); }
    |   GOTO label_op			{ $$ = MK_I(interp, "branch",1, $2); }
    |   INC var				{ $$ = MK_I(interp, "inc",1, $2); }
    |   DEC var				{ $$ = MK_I(interp, "dec",1, $2); }
    |   SAVEALL				{ $$ = MK_I(interp, "saveall" ,0); }
    |   RESTOREALL			{ $$ = MK_I(interp, "restoreall" ,0); }
    |   END				{ $$ = MK_I(interp, "end" ,0); }
    |  PARROT_OP vars           { $$ = INS(interp, $1,0,regs,nargs,keyvec, 1);
                                          free($1); }
    | /* none */                        { $$ = 0;}
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
       target '=' var			{ $$ = MK_I(interp, "set", 2, $1, $3); }
    |  target '=' '!' var		{ $$ = MK_I(interp, "not", 2, $1, $4);}
    |  target '=' '-' var		{ $$ = MK_I(interp, "neg", 2, $1, $4);}
    |  target '=' '~' var		{ $$ = MK_I(interp, "bnot", 2, $1, $4);}
    |  target '=' var '+' var		{ $$ = MK_I(interp, "add", 3, $1, $3, $5); }
    |  target '=' var '-' var		{ $$ = MK_I(interp, "sub", 3, $1, $3, $5); }
    |  target '=' var '*' var		{ $$ = MK_I(interp, "mul", 3, $1, $3, $5); }
    |  target '=' var POW var		{ $$ = MK_I(interp, "pow", 3, $1, $3, $5); }
    |  target '=' var '/' var		{ $$ = MK_I(interp, "div", 3, $1, $3, $5); }
    |  target '=' var '%' var		{ $$ = MK_I(interp, "mod", 3, $1, $3, $5); }
    |  target '=' var '.' var		{ $$ = MK_I(interp, "concat", 3, $1,$3,$5); }
    |  target '=' var SHIFT_LEFT var	{ $$ = MK_I(interp, "shl", 3, $1, $3, $5); }
    |  target '=' var SHIFT_RIGHT var	{ $$ = MK_I(interp, "shr", 3, $1, $3, $5); }
    |  target '=' var SHIFT_RIGHT_U var	{ $$ = MK_I(interp, "lsr", 3, $1, $3, $5); }
    |  target '=' var LOG_AND var	{ $$ = MK_I(interp, "and", 3, $1, $3, $5); }
    |  target '=' var LOG_OR var	{ $$ = MK_I(interp, "or", 3, $1, $3, $5); }
    |  target '=' var LOG_XOR var	{ $$ = MK_I(interp, "xor", 3, $1, $3, $5); }
    |  target '=' var '&' var		{ $$ = MK_I(interp, "band", 3, $1, $3, $5); }
    |  target '=' var '|' var		{ $$ = MK_I(interp, "bor", 3, $1, $3, $5); }
    |  target '=' var '~' var		{ $$ = MK_I(interp, "bxor", 3, $1, $3, $5); }
    |  target '=' var '[' keylist ']'   { $$ = iINDEXFETCH(interp, $1, $3, $5); }
    |  var '[' keylist ']' '=' var	{ $$ = iINDEXSET(interp, $1, $3, $6); }
    |  target '=' NEW classname COMMA var { $$ = iNEW(interp, $1, $4, $6, 1); }
    |  target '=' NEW classname		{ $$ = iNEW(interp, $1, $4, NULL,1); }
    |  target '=' DEFINED var	        { $$ = MK_I(interp, "defined",2, $1,$4); }
    |  target '=' DEFINED var '[' keylist ']' { keyvec=KEY_BIT(2);
                                     $$ = MK_I(interp, "defined", 3, $1, $4, $6);}
    |  target '=' CLONE var		{ $$ = MK_I(interp, "clone",2, $1, $4);
    }
    |  target '=' ADDR IDENTIFIER	{ $$ = MK_I(interp, "set_addr",
                                          2, $1, mk_address($4,U_add_once)); }
    |  target '=' GLOBAL string	{ $$ = MK_I(interp, "find_global",2, $1,$4); }
    |  GLOBAL string '=' var	{ $$ = MK_I(interp, "store_global",2, $2,$4); }
    |  NEW                              { expect_pasm = 1; }
          pasm_args	    { $$ = INS(interp, "new",0,regs,nargs,keyvec,1); }
    |  DEFINED target COMMA var   { $$ = MK_I(interp, "defined", 2, $2, $4); }
    |  DEFINED target COMMA var '[' keylist ']'  { keyvec=KEY_BIT(2);
                                  $$ = MK_I(interp, "defined", 3, $2, $4, $6);}
    |  CLONE target COMMA var     { $$ = MK_I(interp, "clone", 2, $2, $4); }
    ;

if_statement:
       IF var relop var GOTO label_op {$$=MK_I(interp, $3,3, $2,$4, $6); }
    |  UNLESS var relop var GOTO label_op {$$=MK_I(interp, inv_op($3),
                                            3, $2,$4, $6); }
    |  IF var GOTO label_op           {$$= MK_I(interp, "if", 2, $2, $4); }
    |  UNLESS var GOTO label_op       {$$= MK_I(interp, "unless",2, $2, $4); }
    |  IF var COMMA label_op          {$$= MK_I(interp, "if", 2, $2, $4); }
    |  UNLESS var COMMA label_op      {$$= MK_I(interp, "unless", 2, $2, $4); }

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
lhs: VAR        /* duplicated because of reduce conflict */
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
label_op:
       IDENTIFIER			{ $$ = mk_address($1, U_add_once); }
    |  PARROT_OP                        { $$ = mk_address($1, U_add_once); }
    ;
var_or_i:
      label_op
    |  var
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
