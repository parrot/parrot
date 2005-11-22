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
#define PARSER_MAIN
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
 * Some convenient vars
 */
static SymReg *cur_obj, *cur_call;
int cur_pmc_type;      /* used in mk_ident */
IMC_Unit * cur_unit;
SymReg *cur_namespace; /* ugly hack for mk_address */

/*
 * these are used for constructing one INS
 */
static SymReg *keys[IMCC_MAX_FIX_REGS]; /* TODO key overflow check */
static int nkeys, in_slice;
static int keyvec;
#define IMCC_MAX_STATIC_REGS 100
static SymReg *regs[IMCC_MAX_STATIC_REGS];
static int nargs;
static int cnr;



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
MK_I(Interp *interpreter, IMC_Unit * unit, const char * fmt, int n, ...)
{
    char opname[64];
    char *p;
    const char *q;
    va_list ap;
    SymReg *r[IMCC_MAX_FIX_REGS];
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
    for (i = 0; i < n; ++i) {
	r[i] = va_arg(ap, SymReg *);
    }
    va_end(ap);
    return INS(interpreter, unit, opname, fmt, r, n, keyvec, 1);
}

static Instruction*
mk_pmc_const(Parrot_Interp interp, IMC_Unit *unit,
        char *type, SymReg *left, char *constant)
{
    int type_enum = atoi(type);
    SymReg *rhs;
    SymReg *r[2];
    char *name;
    int len;

    if (left->type == VTADDRESS) {      /* IDENTIFIER */
        if (IMCC_INFO(interp)->state->pasm_file) {
            IMCC_fataly(interp, E_SyntaxError,
            "Ident as PMC constant",
                " %s\n", left->name);
        }
        left->type = VTIDENTIFIER;
        left->set = 'P';
    }
    r[0] = left;
    /* strip delimiters */
    len = strlen(constant);
    name = mem_sys_allocate(len);
    constant[len - 1] = '\0';
    strcpy(name, constant + 1);
    free(constant);
    switch (type_enum) {
        case enum_class_Sub:
        case enum_class_Coroutine:
            rhs = mk_const(interp, name, 'p');
            r[1] = rhs;
            rhs->pmc_type = type_enum;
            rhs->usage = U_FIXUP;
            return INS(interp, unit, "set_p_pc", "", r, 2, 0, 1);
    }
    rhs = mk_const(interp, name, 'P');
    r[1] = rhs;
    rhs->pmc_type = type_enum;
    return INS(interp, unit, "set_p_pc", "", r, 2, 0, 1);
}

static Instruction*
func_ins(Parrot_Interp interp, IMC_Unit *unit, SymReg *lhs, char *op,
           SymReg ** r, int n, int keyv, int emit)
{
    int i;
    /* shift regs up by 1 */
    for (i = n - 1; i >= 0; --i)
        r[i+1] = r[i];
    r[0] = lhs;
    /* shift keyvec */
    keyv <<= 1;
    return INS(interp, unit, op, "", r, n+1, keyv, emit);
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
}

Instruction * INS_LABEL(IMC_Unit * unit, SymReg * r0, int emit)
{

    Instruction *ins;

    ins = _mk_instruction("","%s:", 1, &r0, 0);
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

static Instruction * iSUBROUTINE(Interp *interp, IMC_Unit * unit, SymReg * r) {
    Instruction *i;
    i =  iLABEL(unit, r);
    r->type = VT_PCC_SUB;
    r->pcc_sub = calloc(1, sizeof(struct pcc_sub_t));
    cur_call = r;
    i->line = line - 1;
    add_namespace(interp, unit);
    return i;
}

/*
 * substr or X = P[key]
 */
static Instruction *
iINDEXFETCH(Interp *interp, IMC_Unit * unit, SymReg * r0, SymReg * r1,
    SymReg * r2)
{
    if(r0->set == 'S' && r1->set == 'S' && r2->set == 'I') {
        SymReg * r3 = mk_const(interp, str_dup("1"), 'I');
        return MK_I(interp, unit, "substr %s, %s, %s, 1", 4, r0, r1, r2, r3);
    }
    keyvec |= KEY_BIT(2);
    return MK_I(interp, unit, "set %s, %s[%s]", 3, r0,r1,r2);
}

/*
 * substr or P[key] = X
 */

static Instruction *
iINDEXSET(Interp *interp, IMC_Unit * unit,
          SymReg * r0, SymReg * r1, SymReg * r2)
{
    if(r0->set == 'S' && r1->set == 'I' && r2->set == 'S') {
        SymReg * r3 = mk_const(interp, str_dup("1"), 'I');
        MK_I(interp, unit, "substr %s, %s, %s, %s", 4, r0, r1,r3, r2);
    }
    else if (r0->set == 'P') {
        keyvec |= KEY_BIT(1);
	MK_I(interp, unit, "set %s[%s], %s", 3, r0,r1,r2);
    }
    else {
        IMCC_fataly(interp, E_SyntaxError,
            "unsupported indexed set op\n");
    }
    return 0;
}

static char * inv_op(char *op) {
    int n;
    return (char *) get_neg_op(op, &n);
}

Instruction *
IMCC_create_itcall_label(Interp* interpreter)
{
    char name[128];
    SymReg * r;
    Instruction *i;

    sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
    r = mk_pcc_sub(interpreter, str_dup(name), 0);
    i = iLABEL(cur_unit, r);
    cur_call = r;
    i->type = ITCALL | ITPCCSUB;
    return i;
}


static SymReg *
mk_sub_address_fromc(Interp *interp, char * name)
{
    /* name is a quoted sub name */
    SymReg *r;

    name[strlen(name) - 1] = '\0';
    r = mk_sub_address(interp, str_dup(name + 1));
    mem_sys_free(name);
    return r;
}

void
IMCC_itcall_sub(Interp* interp, SymReg* sub)
{
    cur_call->pcc_sub->sub = sub;
    if (cur_obj) {
        if (cur_obj->set != 'P')
            IMCC_fataly(interp, E_SyntaxError, "object isn't a PMC");
        cur_call->pcc_sub->object = cur_obj;
        cur_obj = NULL;
    }
    if (cur_call->pcc_sub->sub->pmc_type == enum_class_NCI)
        cur_call->pcc_sub->flags |= isNCI;
    if (cur_unit->type == IMC_PCCSUB)
        cur_unit->instructions->r[0]->pcc_sub->calls_a_sub |= 1;
}

static void
begin_return_or_yield(Interp *interp, int yield)
{
    Instruction *i, *ins;
    char name[128];
    ins = cur_unit->instructions;
    if(!ins || !ins->r[0] || ins->r[0]->type != VT_PCC_SUB)
        IMCC_fataly(interp, E_SyntaxError,
              "yield or return directive outside pcc subroutine\n");
    if(yield)
       ins->r[0]->pcc_sub->calls_a_sub = 1 | ITPCCYIELD;
    sprintf(name, yield ? "%cpcc_sub_yield_%d" : "%cpcc_sub_ret_%d", IMCC_INTERNAL_CHAR, cnr++);
    interp->imc_info->sr_return = mk_pcc_sub(interp, str_dup(name), 0);
    i = iLABEL(cur_unit, interp->imc_info->sr_return);
    i->type = yield ? ITPCCSUB | ITLABEL | ITPCCYIELD : ITPCCSUB | ITLABEL ;
    interp->imc_info->asm_state = yield ? AsmInYield : AsmInReturn;
}

static void
set_lexical(Interp *interp, SymReg *r, char *name)
{
    if (r->usage & U_LEXICAL) {
        IMCC_fataly(interp, E_SyntaxError,
            "variable '%s' is already lexical for %s",
            r->name, r->reg->name);
    }
    r->usage |= U_LEXICAL;
    r->reg = mk_const(interp, name, 'S');
}


%}

%union {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
}

/* We need precedence for a few tokens to resolve a couple of conflicts */
%nonassoc LOW_PREC
%nonassoc '\n'
%nonassoc <t> PARAM

%token <t> PRAGMA N_OPERATORS HLL HLL_MAP
%token <t> GOTO ARG IF UNLESS PNULL
%token <t> ADV_FLAT ADV_SLURPY ADV_OPTIONAL ADV_OPT_FLAG
%token <t> NEW
%token <t> NAMESPACE ENDNAMESPACE DOT_METHOD
%token <t> SUB SYM LOCAL LEXICAL CONST
%token <t> INC DEC GLOBAL_CONST
%token <t> PLUS_ASSIGN MINUS_ASSIGN MUL_ASSIGN DIV_ASSIGN CONCAT_ASSIGN
%token <t> BAND_ASSIGN BOR_ASSIGN BXOR_ASSIGN FDIV FDIV_ASSIGN MOD_ASSIGN
%token <t> SHR_ASSIGN SHL_ASSIGN SHR_U_ASSIGN
%token <t> SHIFT_LEFT SHIFT_RIGHT INTV FLOATV STRINGV PMCV OBJECTV  LOG_XOR
%token <t> RELOP_EQ RELOP_NE RELOP_GT RELOP_GTE RELOP_LT RELOP_LTE
%token <t> GLOBAL GLOBALOP ADDR RESULT RETURN YIELDT POW SHIFT_RIGHT_U LOG_AND LOG_OR
%token <t> COMMA ESUB DOTDOT
%token <t> PCC_BEGIN PCC_END PCC_CALL PCC_SUB PCC_BEGIN_RETURN PCC_END_RETURN
%token <t> PCC_BEGIN_YIELD PCC_END_YIELD NCI_CALL METH_CALL INVOCANT
%token <t> MAIN LOAD IMMEDIATE POSTCOMP METHOD ANON OUTER NEED_LEX
%token <t> MULTI
%token <s> LABEL
%token <t> EMIT EOM
%token <s> IREG NREG SREG PREG IDENTIFIER REG MACRO ENDM
%token <s> STRINGC INTC FLOATC USTRINGC
%token <s> PARROT_OP
%type <t> type ptr pragma_1 hll_def
%type <i> program
%type <i> class_namespace
%type <i> global constdef sub emit pcc_sub  pcc_ret
%type <i> compilation_units compilation_unit pmc_const pragma
%type <s> classname relop
%type <i> labels _labels label  statement sub_call
%type <i> pcc_sub_call
%type <sr> sub_param sub_params pcc_arg pcc_result pcc_args pcc_results
%type <sr> pcc_returns pcc_return pcc_call arg arglist the_sub multi_type
%type <t> argtype_list argtype paramtype_list paramtype
%type <t> pcc_return_many
%type <t> proto sub_proto sub_proto_list multi multi_types opt_comma outer
%type <i> instruction assignment if_statement labeled_inst opt_label op_assign
%type <i> func_assign
%type <i> opt_invocant
%type <sr> target targetlist reg const var string result
%type <sr> key keylist _keylist
%type <sr> vars _vars var_or_i _var_or_i label_op sub_label_op sub_label_op_c
%type <i> pasmcode pasmline pasm_inst
%type <sr> pasm_args
%type <i> var_returns
%token <sr> VAR
%type <t> begin_ret_or_yield end_ret_or_yield
%token <t> LINECOMMENT
%token <s> FILECOMMENT
%type <idlist> id_list

%nonassoc CONCAT DOT
%nonassoc  <t> POINTY

%pure_parser

%start program

/* In effort to make the grammar readable but not militaristic, please space indent
   code blocks on 10 col boundaries and keep indentation same for all code blocks
   in a rule. Indent rule tokens | and ; to 4th col and sub rules 6th col
 */

%%

program:
     compilation_units                  { $$ = 0; }
   ;

compilation_units:
     compilation_unit
   | compilation_units compilation_unit
   ;

compilation_unit:
     class_namespace  { $$ = $1; }
   | constdef      { $$ = $1; }
   | global        { $$ = $1; }
   | sub           { $$ = $1; imc_close_unit(interp, cur_unit); cur_unit = 0; }
   | pcc_sub       { $$ = $1; imc_close_unit(interp, cur_unit); cur_unit = 0; }
   | emit          { $$ = $1; imc_close_unit(interp, cur_unit); cur_unit = 0; }
   | MACRO '\n'    { $$ = 0; }
   | pragma        { $$ = 0; }
   | '\n'          { $$ = 0; }
   ;

pragma: PRAGMA pragma_1 '\n'   { $$ = 0; }
   | hll_def            '\n'   { $$ = 0; }
   ;

pragma_1:  N_OPERATORS INTC
                    { if ($2)
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
   ;

hll_def: HLL STRINGC COMMA STRINGC
         {
            STRING *hll_name, *hll_lib;
            hll_name = string_unescape_cstring(interp, $2 + 1, '"', NULL);
            hll_lib =  string_unescape_cstring(interp, $4 + 1, '"', NULL);
            IMCC_INFO(interp)->HLL_id =
                Parrot_register_HLL(interp, hll_name, hll_lib);
            $$ = 0;
         }
   | HLL_MAP INTC COMMA INTC
         {
             Parrot_register_HLL_type(interp,
                IMCC_INFO(interp)->HLL_id, atoi($2), atoi($4));
             $$ = 0;
         }
   ;

global:
     GLOBAL type IDENTIFIER
         {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            $$ = 0;
         }
   | GLOBAL type IDENTIFIER '=' const
         {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            $$ = 0;
         }
   ;

constdef:
     CONST { is_def=1; } type IDENTIFIER '=' const
                { mk_const_ident(interp, $4, $3, $6, 1);is_def=0; }
   ;

pmc_const:
     CONST { is_def=1; } INTC var_or_i '=' STRINGC
                { $$ = mk_pmc_const(interp, cur_unit, $3, $4, $6);is_def=0; }
   ;
pasmcode:
     pasmline
   | pasmcode pasmline
   ;

pasmline:
     labels  pasm_inst '\n'            { $$ = 0; }
   | MACRO '\n'                        { $$ = 0; }
   | FILECOMMENT                       { $$ = 0; }
   | LINECOMMENT                       { $$ = 0; }
   | class_namespace  { $$ = $1; }
   | pmc_const
   ;

pasm_inst:         { clear_state(); }
     PARROT_OP pasm_args
                   { $$ = INS(interp, cur_unit, $2,0,regs,nargs,keyvec,1);
                     free($2); }
   | PCC_SUB sub_proto LABEL
                   {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                     $$ = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, $3));
                     cur_call->pcc_sub->pragma = $2;
                   }
   | PNULL var
                   {  $$ =MK_I(interp, cur_unit, "null", 1, $2); }
   | LEXICAL STRINGC COMMA REG
                   {
                       SymReg *r = mk_pasm_reg(interp, $4);
                       set_lexical(interp, r, $2); $$ = 0;
                   }
   | /* none */    { $$ = 0;}
   ;

pasm_args:
     vars
   ;

emit:
     EMIT          { cur_unit = imc_open_unit(interp, IMC_PASM); }
     opt_pasmcode
     EOM           { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     $$=0; }
   ;

opt_pasmcode:
     /* empty */
  | pasmcode
  ;

class_namespace:
    NAMESPACE '[' keylist ']'
                {
                    int re_open = 0;
                    $$=0;
                    if (IMCC_INFO(interp)->state->pasm_file && cur_namespace) {
                        imc_close_unit(interp, cur_unit);
                        re_open = 1;
                    }
                    IMCC_INFO(interp)->cur_namespace = $3;
                    cur_namespace = $3;
                    if (re_open)
                        cur_unit = imc_open_unit(interp, IMC_PASM);
                }
   ;

sub:
     SUB
        {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
     sub_label_op_c
        {
          iSUBROUTINE(interp, cur_unit, $3);
        }
     sub_proto '\n' { cur_call->pcc_sub->pragma = $5; }
     sub_params
     sub_body  ESUB { $$ = 0; cur_call = NULL; }
   ;

sub_params:
     /* empty */                       { $$ = 0; } %prec LOW_PREC
   | '\n'                              { $$ = 0; }
   | sub_params sub_param '\n'         { add_pcc_param(cur_call, $2);}
   ;

sub_param:
     PARAM                             { is_def=1; }
     type IDENTIFIER  paramtype_list   { $$ = mk_ident(interp, $4, $3);
                                         is_def=0; $$->type |= $5; }
   ;

opt_comma:
     /* empty */              { $$ = 0;  }
   | COMMA
   ;


multi: MULTI '(' multi_types ')'  { $$ = 0; }
   ;

outer: OUTER '(' STRINGC ')'
                     { $$ = 0; cur_unit->outer =
                     mk_sub_address_fromc(interp, $3); }
    | OUTER '(' IDENTIFIER ')'
                     { $$ = 0; cur_unit->outer =
                     mk_const(interp, $3, 'S'); }
   ;

multi_types:
     /* empty */     { $$ = 0; }
   | multi_types COMMA multi_type { $$ = 0; add_pcc_multi(cur_call, $3); }
   | multi_type      { $$ = 0;  add_pcc_multi(cur_call, $1);}
   ;

multi_type:
     INTV             { $$ = mk_const(interp, str_dup("INTVAL"), 'S'); }
   | FLOATV           { $$ = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
   | PMCV             { $$ = mk_const(interp, str_dup("PMC"), 'S'); }
   | STRINGV          { $$ = mk_const(interp, str_dup("STRING"), 'S'); }
   | IDENTIFIER       {
                          SymReg *r;
                          if (strcmp($1, "_"))
                              r = mk_const(interp, $1, 'S');
                          else {
                              free($1),
                              r = mk_const(interp, str_dup("PMC"), 'S');
                           }
                           $$ = r;
                       }
   ;

sub_body:
     /* empty */
   |  statements
   ;

pcc_sub:
     PCC_SUB       { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
     IDENTIFIER
         {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, $3));

         }
     sub_proto '\n' { cur_call->pcc_sub->pragma = $5; }
     sub_params
     sub_body  ESUB { $$ = 0; cur_call = NULL; }
   ;

pcc_sub_call:
     PCC_BEGIN '\n'
         {
            char name[128];
            SymReg * r, *r1;
            Instruction *i;

            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
            $<sr>$ = r = mk_pcc_sub(interp, str_dup(name), 0);
            /* this mid rule action has the semantic value of the
             * sub SymReg.
             * This is used below to append args & results
             */
            i = iLABEL(cur_unit, r);
            cur_call = r;
            i->type = ITPCCSUB;
            /*
             * if we are inside a pcc_sub mark the sub as doing a
             * sub call; the sub is in r[0] of the first ins
             */
            r1 = cur_unit->instructions->r[0];
            if (r1 && r1->pcc_sub)
                r1->pcc_sub->calls_a_sub |= 1;
         }
     pcc_args
     opt_invocant
     pcc_call
     opt_label
     pcc_results
     PCC_END       { $$ = 0; cur_call = NULL; }
   ;

opt_label:
     /* empty */   { $$ = NULL;  cur_call->pcc_sub->label = 0; }
   | label '\n'    { $$ = NULL;  cur_call->pcc_sub->label = 1; }
   ;

opt_invocant:
     /* empty */   { $$ = NULL; }
   | INVOCANT var '\n'
                   { $$ = NULL;  cur_call->pcc_sub->object = $2; }
   ;

sub_proto:
     /* empty */                { $$ = 0; }
   | sub_proto_list
   ;

sub_proto_list:
     proto                           { $$ = $1; }
   | sub_proto_list opt_comma proto  { $$ = $1 | $3; }
   ;

proto:
     LOAD           {  $$ = P_LOAD; }
   | MAIN           {  $$ = P_MAIN; }
   | IMMEDIATE      {  $$ = P_IMMEDIATE; }
   | POSTCOMP       {  $$ = P_POSTCOMP; }
   | ANON           {  $$ = P_ANON; }
   | METHOD         {  $$ = P_METHOD; }
   | NEED_LEX       {  $$ = P_NEED_LEX; }
   | multi
   | outer
   ;

pcc_call:
     PCC_CALL var COMMA var '\n'
         {
            add_pcc_sub(cur_call, $2);
            add_pcc_cc(cur_call, $4);
         }
   | PCC_CALL var '\n'
         {  add_pcc_sub(cur_call, $2); }
   | NCI_CALL var '\n'
         {
            add_pcc_sub(cur_call, $2);
            cur_call->pcc_sub->flags |= isNCI;
         }
   | METH_CALL target '\n'
         {  add_pcc_sub(cur_call, $2); }
   | METH_CALL STRINGC '\n'
         {  add_pcc_sub(cur_call, mk_const(interp, $2,'S')); }
   | METH_CALL target COMMA var '\n'
         {  add_pcc_sub(cur_call, $2);
            add_pcc_cc(cur_call, $4);
         }
   | METH_CALL STRINGC COMMA var '\n'
         {  add_pcc_sub(cur_call, mk_const(interp, $2,'S'));
            add_pcc_cc(cur_call, $4);
         }
   ;


pcc_args:
     /* empty */                       {  $$ = 0; }
   | pcc_args pcc_arg '\n'             {  add_pcc_arg(cur_call, $2); }
   ;

pcc_arg:
     ARG arg                           {  $$ = $2; }
   ;


pcc_results:
     /* empty */                       {  $$ = 0; }
   | pcc_results pcc_result '\n'       {  if($2) add_pcc_result(cur_call, $2); }
   ;

pcc_result:
     RESULT target paramtype_list      {  $$ = $2; $$->type |= $3; }
   | LOCAL { is_def=1; }
             type IDENTIFIER           {  mk_ident(interp, $4, $3); is_def=0; $$=0; }
   ;

paramtype_list:
     /* empty */                       {  $$ = 0; }
   | paramtype_list paramtype        {  $$ = $1 | $2; }
   ;

paramtype:
     ADV_SLURPY                        {  $$ = VT_FLAT;   }
   | ADV_OPTIONAL                      {  $$ = VT_OPTIONAL; }
   | ADV_OPT_FLAG                      {  $$ = VT_OPT_FLAG; }
   ;


begin_ret_or_yield:
     PCC_BEGIN_RETURN { $$ = 0; }
   | PCC_BEGIN_YIELD { $$ = 1; }
   ;

end_ret_or_yield:
     PCC_END_RETURN
   | PCC_END_YIELD
   ;

pcc_ret:
    begin_ret_or_yield   '\n'
    { begin_return_or_yield(interp, $1); }
     pcc_returns
     end_ret_or_yield
         { $$ = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
   | pcc_return_many {  IMCC_INFO(interp)->asm_state = AsmDefault; $$ = 0;  }

   ;


pcc_returns:
     /* empty */   {  $$ = 0; }
   | pcc_returns '\n'
                   {  if($1) add_pcc_return(IMCC_INFO(interp)->sr_return, $1); }
   | pcc_returns pcc_return '\n'
                   {  if($2) add_pcc_return(IMCC_INFO(interp)->sr_return, $2); }
   ;

pcc_return:
     RETURN var argtype_list   {  $$ = $2; $$->type |= $3; }
   ;

pcc_return_many:
    RETURN  '('
        {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    var_returns  ')'
        {  IMCC_INFO(interp)->asm_state = AsmDefault; $$ = 0;  }
  | YIELDT  '('
        {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    var_returns  ')'
        {  IMCC_INFO(interp)->asm_state = AsmDefault; $$ = 0;  }
  ;

var_returns:
    /* empty */ { $$ = 0; }
  | arg                     {  add_pcc_return(IMCC_INFO(interp)->sr_return, $1);    }
  | var_returns COMMA arg   {  add_pcc_return(IMCC_INFO(interp)->sr_return, $3);    }
  ;


statements:
     statement
   | statements statement
   ;

/* This is ugly. Because 'instruction' can start with PARAM and in the
 * 'pcc_sub' rule, 'pcc_params' is followed by 'statement', we get a
 * shift/reduce conflict on PARAM between reducing to the dummy
 * { clear_state(); } rule and shifting the PARAM to be used as part
 * of the 'pcc_params' (which is what we want). However, yacc syntax
 * doesn't propagate precedence to the dummy rules, so we have to
 * split out the action just so that we can assign it a precedence. */

helper_clear_state:
     { clear_state(); } %prec LOW_PREC
   ;

statement:
     helper_clear_state
     instruction   {  $$ = $2; }
   | MACRO '\n'    {  $$ = 0; }
   | FILECOMMENT   {  $$ = 0; }
   | LINECOMMENT   {  $$ = 0; }
   ;

labels:
     /* none */    {  $$ = NULL; }
   |  _labels
   ;

_labels:
     _labels label
   | label
   ;

label:
     LABEL         {
                     $$ = iLABEL(cur_unit, mk_local_label(interp, $1));
                   }
   ;

instruction:
      labels labeled_inst '\n'
                   { $$ = $2; }
    ;

id_list : IDENTIFIER
         {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = $1;
            $$ = l;
         }

        | id_list COMMA IDENTIFIER
        {  IdList* l = malloc(sizeof(IdList));
           l->id = $3;
           l->next = $1;
           $$ = l;
        }
        ;

labeled_inst:
     assignment
   | if_statement
   | NAMESPACE IDENTIFIER            { push_namespace($2); }
   | ENDNAMESPACE IDENTIFIER         { pop_namespace($2); }
   | LOCAL           { is_def=1; } type id_list
     {
        IdList* l = $4;
         while(l) {
             IdList* l1;
             mk_ident(interp, l->id, $3);
             l1 = l;
             l = l->next;
             free(l1);
     }
    is_def=0; $$=0;

   }
   | LEXICAL STRINGC COMMA target
                    {
                       set_lexical(interp, $4, $2); $$ = 0;
                    }
   | CONST { is_def=1; } type IDENTIFIER '=' const
                    { mk_const_ident(interp, $4, $3, $6, 0);is_def=0; }
   | pmc_const
   | GLOBAL_CONST { is_def=1; } type IDENTIFIER '=' const
                    { mk_const_ident(interp, $4, $3, $6, 1);is_def=0; }
   | RETURN  sub_call   { $$ = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
   | GOTO label_op { $$ = MK_I(interp, cur_unit, "branch",1, $2); }
   | PARROT_OP vars
                   { $$ = INS(interp, cur_unit, $1, 0, regs, nargs, keyvec, 1);
                                          free($1); }
   | PNULL var
                   {  $$ =MK_I(interp, cur_unit, "null", 1, $2); }
   | sub_call      {  $$ = 0; cur_call = NULL; }
   | pcc_sub_call  {  $$ = 0; }
   | pcc_ret
   | /* none */                        { $$ = 0;}
   ;

type:
     INTV { $$ = 'I'; }
   | FLOATV { $$ = 'N'; }
   | STRINGV { $$ = 'S'; }
   | PMCV { $$ = 'P'; }
   | OBJECTV { $$ = 'P'; }
   | classname { $$ = 'P'; free($1); }
   ;

classname:
   IDENTIFIER
         {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, $1, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", $1);
            }
         }
   ;

assignment:
     target '=' var		{ $$ = MK_I(interp, cur_unit, "set", 2, $1, $3); }
   | target '=' '!' var	{ $$ = MK_I(interp, cur_unit, "not", 2, $1, $4);}
   | target '=' '-' var	{ $$ = MK_I(interp, cur_unit, "neg", 2, $1, $4);}
   | target '=' '~' var	{ $$ = MK_I(interp, cur_unit, "bnot", 2, $1, $4);}
   | target '=' var '+' var	{ $$ = MK_I(interp, cur_unit, "add", 3, $1, $3, $5); }
   | target '=' var '-' var	{ $$ = MK_I(interp, cur_unit, "sub", 3, $1, $3, $5); }
   | target '=' var '*' var	{ $$ = MK_I(interp, cur_unit, "mul", 3, $1, $3, $5); }
   | target '=' var POW var	{ $$ = MK_I(interp, cur_unit, "pow", 3, $1, $3, $5); }
   | target '=' var '/' var	{ $$ = MK_I(interp, cur_unit, "div", 3, $1, $3, $5); }
   | target '=' var FDIV var	{ $$ = MK_I(interp, cur_unit, "fdiv", 3, $1, $3, $5); }
   | target '=' var '%' var	{ $$ = MK_I(interp, cur_unit, "mod", 3, $1, $3, $5); }
   | target '=' var CONCAT var	{ $$ = MK_I(interp, cur_unit, "concat", 3, $1,$3,$5); }
   | target '=' var SHIFT_LEFT var
                        { $$ = MK_I(interp, cur_unit, "shl", 3, $1, $3, $5); }
   | target '=' var SHIFT_RIGHT var
                        { $$ = MK_I(interp, cur_unit, "shr", 3, $1, $3, $5); }
   | target '=' var SHIFT_RIGHT_U var
                        { $$ = MK_I(interp, cur_unit, "lsr", 3, $1, $3, $5); }
   | target '=' var LOG_AND var
                        { $$ = MK_I(interp, cur_unit, "and", 3, $1, $3, $5); }
   | target '=' var LOG_OR var
                        { $$ = MK_I(interp, cur_unit, "or", 3, $1, $3, $5); }
   | target '=' var LOG_XOR var
                        { $$ = MK_I(interp, cur_unit, "xor", 3, $1, $3, $5); }
   | target '=' var '&' var
                        { $$ = MK_I(interp, cur_unit, "band", 3, $1, $3, $5); }
   | target '=' var '|' var
                        { $$ = MK_I(interp, cur_unit, "bor", 3, $1, $3, $5); }
   | target '=' var '~' var
                        { $$ = MK_I(interp, cur_unit, "bxor", 3, $1, $3, $5); }
   | target '=' var '[' keylist ']'
                        { $$ = iINDEXFETCH(interp, cur_unit, $1, $3, $5); }
   | target '[' keylist ']' '=' var
                        { $$ = iINDEXSET(interp, cur_unit, $1, $3, $6); }
   | target '=' NEW classname COMMA var
                        { $$ = iNEW(interp, cur_unit, $1, $4, $6, 1); }
   | target '=' NEW classname '[' keylist ']'
                        { $$ = iNEW(interp, cur_unit, $1, $4, $6, 1); }
   | target '=' NEW classname
                        { $$ = iNEW(interp, cur_unit, $1, $4, NULL, 1); }
   | target '=' NEW var
                        { $$ = MK_I(interp, cur_unit, "new", 2, $1, $4); }
   | target '=' NEW var COMMA var
                        { $$ = MK_I(interp, cur_unit, "new", 3, $1, $4, $6); }
   | target '=' NEW var '[' keylist ']'
                        { $$ = MK_I(interp, cur_unit, "new", 3, $1, $4, $6); }
   | target '=' ADDR IDENTIFIER
                        { $$ = MK_I(interp, cur_unit, "set_addr",
                            2, $1, mk_label_address(interp, $4)); }
   | target '=' GLOBALOP string
                        { $$ = MK_I(interp, cur_unit, "find_global",2,$1,$4);}
   | GLOBALOP string '=' var
                        { $$ = MK_I(interp, cur_unit, "store_global",2, $2,$4); }
       /* NEW and is here because it is both PIR and PASM keywords so we
        * have to handle the token here (or badly hack the lexer). */
   | NEW target COMMA var
                        { $$ = MK_I(interp, cur_unit, "new", 2, $2, $4); }
   | NEW target COMMA var COMMA var
                        { $$ = MK_I(interp, cur_unit, "new", 3, $2, $4, $6); }
   | NEW target COMMA var '[' keylist ']'
                        { $$ = MK_I(interp, cur_unit, "new", 3, $2, $4, $6); }
     /* Subroutine call the short way */
   | target  '=' sub_call
         {
            add_pcc_result($3->r[0], $1);
            cur_call = NULL;
            $$ = 0;
         }
   |
         {
            $<i>$ = IMCC_create_itcall_label(interp);
         }
     '(' targetlist  ')' '=' the_sub '(' arglist ')'
         {
           IMCC_itcall_sub(interp, $6);
           cur_call = NULL;
         }
   | op_assign
   | func_assign
   | target '=' PNULL
                   {  $$ =MK_I(interp, cur_unit, "null", 1, $1); }
   ;

op_assign:
     target PLUS_ASSIGN var
                   { $$ = MK_I(interp, cur_unit, "add", 2, $1, $3); }
   | target MINUS_ASSIGN var
                   { $$ = MK_I(interp, cur_unit, "sub", 2, $1, $3); }
   | target MUL_ASSIGN var
                   { $$ = MK_I(interp, cur_unit, "mul", 2, $1, $3); }
   | target DIV_ASSIGN var
                   { $$ = MK_I(interp, cur_unit, "div", 2, $1, $3); }
   | target MOD_ASSIGN var
                   { $$ = MK_I(interp, cur_unit, "mod", 2, $1, $3); }
   | target FDIV_ASSIGN var
                   { $$ = MK_I(interp, cur_unit, "fdiv", 2, $1, $3); }
   | target CONCAT_ASSIGN var
                   { $$ = MK_I(interp, cur_unit, "concat", 2, $1, $3); }
   | target BAND_ASSIGN var
                   { $$ = MK_I(interp, cur_unit, "band", 2, $1, $3); }
   | target BOR_ASSIGN var
                   { $$ = MK_I(interp, cur_unit, "bor", 2, $1, $3); }
   | target BXOR_ASSIGN var
                   { $$ = MK_I(interp, cur_unit, "bxor", 2, $1, $3); }
   | target SHR_ASSIGN var
                   { $$ = MK_I(interp, cur_unit, "shr", 2, $1, $3); }
   | target SHL_ASSIGN var
                   { $$ = MK_I(interp, cur_unit, "shl", 2, $1, $3); }
   | target SHR_U_ASSIGN var
                   { $$ = MK_I(interp, cur_unit, "lsr", 2, $1, $3); }
   ;

func_assign:
   target '=' PARROT_OP pasm_args
                   { $$ = func_ins(interp, cur_unit, $1, $3,
                                   regs,nargs,keyvec,1);
                     free($3);
                   }
   ;

the_sub: IDENTIFIER  { $$ = mk_sub_address(interp, $1); }
       | STRINGC  { $$ = mk_sub_address_fromc(interp, $1); }
       | target   { $$ = $1;
                       if ($1->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
       | target ptr sub_label_op  { cur_obj = $1; $$ = $3; }
       | target ptr STRINGC    { cur_obj = $1; $$ = mk_const(interp, $3, 'S'); }
       | target ptr target     { cur_obj = $1; $$ = $3; }
   ;

ptr:    POINTY { $$=0; }
      | DOT    { $$=0; }
   ;

sub_call:
     the_sub
        {
           $$ = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, $1);
        }
     '(' arglist ')'
        {  $$ = $<i>2; }
   ;

arglist:
     /* empty */             {  $$ = 0; }
   | arglist COMMA arg       {  $$ = 0; add_pcc_arg(cur_call, $3); }
   | arg                     {  $$ = 0; add_pcc_arg(cur_call, $1); }
   ;

arg:
     var argtype_list        {  $$ = $1; $$->type |= $2; }
   ;

argtype_list:
     /* empty */             {  $$ = 0; }
   | argtype_list argtype    {  $$ = $1 | $2; }
   ;

argtype:
     ADV_FLAT                {  $$ = VT_FLAT; }
   ;

result: target paramtype_list  { $$ = $1; $$->type |= $2; }
   ;

targetlist:
     targetlist COMMA result { $$ = 0; add_pcc_result(cur_call, $3); }
   | result                  { $$ = 0; add_pcc_result(cur_call, $1); }
   ;

if_statement:
     IF var relop var GOTO label_op
                   {  $$ =MK_I(interp, cur_unit, $3, 3, $2, $4, $6); }
   | UNLESS var relop var GOTO label_op
                   {  $$ =MK_I(interp, cur_unit, inv_op($3), 3, $2,$4, $6); }
   | IF PNULL var GOTO label_op
                   {  $$ = MK_I(interp, cur_unit, "if_null", 2, $3, $5); }
   | UNLESS PNULL var GOTO label_op
                   {  $$ = MK_I(interp, cur_unit, "unless_null", 2, $3, $5); }
   | IF var GOTO label_op
                   {  $$ = MK_I(interp, cur_unit, "if", 2, $2, $4); }
   | UNLESS var GOTO label_op
                   {  $$ = MK_I(interp, cur_unit, "unless",2, $2, $4); }
   | IF var COMMA label_op
                   {  $$ = MK_I(interp, cur_unit, "if", 2, $2, $4); }
   | UNLESS var COMMA label_op
                   {  $$ = MK_I(interp, cur_unit, "unless", 2, $2, $4); }
   ;

relop:
     RELOP_EQ      {  $$ = "eq"; }
   | RELOP_NE      {  $$ = "ne"; }
   | RELOP_GT      {  $$ = "gt"; }
   | RELOP_GTE     {  $$ = "ge"; }
   | RELOP_LT      {  $$ = "lt"; }
   | RELOP_LTE     {  $$ = "le"; }
   ;

target:
     VAR
   | reg
   ;

vars:
     /* empty */   {  $$ = NULL; }
   | _vars         {  $$ = $1; }
   ;

_vars:
     _vars COMMA _var_or_i   { $$ = regs[0]; }
   | _var_or_i
   ;

_var_or_i:
     var_or_i      {  regs[nargs++] = $1; }
   | target '[' keylist ']'
                   {
                      regs[nargs++] = $1;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = $3; $$ = $1;
                   }
   ;
sub_label_op_c:
     sub_label_op
   | STRINGC       { $$ = mk_sub_address_fromc(interp, $1); }
   ;

sub_label_op:
     IDENTIFIER    { $$ = mk_sub_address(interp, $1); }
   | PARROT_OP     { $$ = mk_sub_address(interp, $1); }
   ;

label_op:
     IDENTIFIER    { $$ = mk_label_address(interp, $1); }
   | PARROT_OP     { $$ = mk_label_address(interp, $1); }
   ;

var_or_i:
     label_op
   | var
   ;

var:
     target
   | const
   ;

keylist:           {  nkeys=0; in_slice = 0; }
     _keylist      {  $$ = link_keys(interp, nkeys, keys); }
   ;

_keylist:
     key           {  keys[nkeys++] = $1; }
   | _keylist ';' key
                   {  keys[nkeys++] = $3; $$ =  keys[0]; }
   | _keylist COMMA  { in_slice = 1; }
         key         { keys[nkeys++] = $4; $$ =  keys[0]; }
   ;

key:
     var           { if (in_slice) {
                         $1->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     $$ = $1;
                   }
   | var DOTDOT var
                   { $1->type |= VT_START_SLICE;  $3->type |= VT_END_SLICE;
                     keys[nkeys++] = $1; $$ = $3; }
   | DOTDOT var    { $2->type |= VT_START_ZERO | VT_END_SLICE; $$ = $2; }
   | var DOTDOT    { $1->type |= VT_START_SLICE | VT_END_INF; $$ = $1; }
   ;

reg:
     IREG          {  $$ = mk_symreg(interp, $1, 'I'); }
   | NREG          {  $$ = mk_symreg(interp, $1, 'N'); }
   | SREG          {  $$ = mk_symreg(interp, $1, 'S'); }
   | PREG          {  $$ = mk_symreg(interp, $1, 'P'); }
   | REG           {  $$ = mk_pasm_reg(interp, $1); }
   ;

const:
     INTC          {  $$ = mk_const(interp, $1, 'I'); }
   | FLOATC        {  $$ = mk_const(interp, $1, 'N'); }
   | STRINGC       {  $$ = mk_const(interp, $1, 'S'); }
   | USTRINGC      {  $$ = mk_const(interp, $1, 'U'); }
   ;

string:
     SREG          {  $$ = mk_symreg(interp, $1, 'S'); }
   | STRINGC       {  $$ = mk_const(interp, $1, 'S'); }
   ;


/* The End */
%%


/* XXX how to get an Interp* here */
int yyerror(char * s)
{
    /* support bison 1.75, convert 'parse error to syntax error' */
    if (!memcmp(s, "parse", 5))
        IMCC_fataly(NULL, E_SyntaxError, "syntax%s", s+5);
    else
        IMCC_fataly(NULL, E_SyntaxError, s);
    /* fprintf(stderr, "last token = [%s]\n", yylval.s); */
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
