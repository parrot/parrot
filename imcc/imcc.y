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
 * Symbol tables and lists
 * This won't scale to multiple namespaces, for now we just keep
 * one symbol table per compilation file.
 */
SymbolTable global_sym_tab;

/*
 * No nested classes for now.
 */
static Class * current_class;
static Instruction * current_call;
static SymReg *cur_obj;
IMC_Unit * cur_unit;
SymReg *cur_namespace; /* ugly hack for mk_address */

/*
 * these are used for constructing one INS
 */
static SymReg *keys[IMCC_MAX_REGS];
static int nkeys;
static int keyvec;
static SymReg *regs[IMCC_MAX_REGS];
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
    return i;
}

/*
 * substr or X = P[key]
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
 * substr or P[key] = X
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

static Instruction *
create_itcall_label(void)
{
    char name[128];
    SymReg * r;
    Instruction *i;

    sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
    r = mk_pcc_sub(str_dup(name), 0);
    current_call = i = iLABEL(cur_unit, r);
    i->type = ITCALL | ITPCCSUB;
    return i;
}

static void
itcall_sub(SymReg* sub)
{
   current_call->r[0]->pcc_sub->sub = sub;
   if (cur_obj) {
       if (cur_obj->set != 'P')
          fataly(1, sourcefile, line, "object isn't a PMC");
       current_call->r[0]->pcc_sub->object = cur_obj;
       cur_obj = NULL;
   }
   /* FIXME use the default settings from .pragma */
   current_call->r[0]->pcc_sub->pragma = P_PROTOTYPED;
   if(cur_unit->type == IMC_PCCSUB)
        cur_unit->instructions->r[1]->pcc_sub->calls_a_sub = 1;
}

%}

%union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
    Symbol * sym;
    SymbolList * symlist;
    SymbolTable * symtab;
}

/* We need precedence for a few tokens to resolve a couple of conflicts */
%nonassoc LOW_PREC
%nonassoc '\n'
%nonassoc <t> PARAM

%token <t> PRAGMA
%token <t> CALL GOTO ARG FLATTEN_ARG IF UNLESS END SAVEALL RESTOREALL
%token <t> NEW NEWSUB NEWCLOSURE NEWCOR NEWCONT
%token <t> NAMESPACE ENDNAMESPACE CLASS ENDCLASS FIELD DOT_METHOD
%token <t> SUB SYM LOCAL CONST
%token <t> INC DEC GLOBAL_CONST
%token <t> SHIFT_LEFT SHIFT_RIGHT INTV FLOATV STRINGV PMCV OBJECTV DEFINED LOG_XOR
%token <t> RELOP_EQ RELOP_NE RELOP_GT RELOP_GTE RELOP_LT RELOP_LTE
%token <t> GLOBAL GLOBALOP ADDR CLONE RESULT RETURN POW SHIFT_RIGHT_U LOG_AND LOG_OR
%token <t> COMMA ESUB
%token <t> PCC_BEGIN PCC_END PCC_CALL PCC_SUB PCC_BEGIN_RETURN PCC_END_RETURN
%token <t> PCC_BEGIN_YIELD PCC_END_YIELD NCI_CALL
%token <t> PROTOTYPED NON_PROTOTYPED MAIN LOAD IMMEDIATE POSTCOMP METHOD
%token <s> LABEL
%token <t> EMIT EOM
%token <s> IREG NREG SREG PREG IDENTIFIER STRINGC INTC FLOATC REG MACRO ENDM
%token <s> PARROT_OP
%type <t> type newsub ptr
%type <i> program class class_body member_decls member_decl field_decl
%type <i> method_decl class_namespace
%type <i> global constdef sub emit pcc_sub sub_body pcc_ret pcc_yield
%type <i> compilation_units compilation_unit
%type <s> classname relop
%type <i> labels _labels label statements statement sub_call
%type <i> pcc_sub_call
%type <sr> sub_param sub_params pcc_arg pcc_result pcc_args pcc_results pcc_params pcc_param
%type <sr> pcc_returns pcc_return pcc_call arg the_sub
%type <t> pcc_proto pcc_sub_proto proto
%type <i> instruction assignment if_statement labeled_inst opt_label
%type <sr> target reg const var string
%type <sr> key keylist _keylist
%type <sr> vars _vars var_or_i _var_or_i label_op
%type <i> pasmcode pasmline pasm_inst
%type <sr> pasm_args
%type <symlist> targetlist arglist
%token <sr> VAR
%token <t> LINECOMMENT
%token <s> FILECOMMENT

%nonassoc '.'
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
     class         { $$ = $1; cur_unit = 0; }
   | class_namespace  { $$ = $1; }
   | constdef      { $$ = $1; }
   | global        { $$ = $1; }
   | sub           { $$ = $1; imc_close_unit(interp, cur_unit); cur_unit = 0; }
   | pcc_sub       { $$ = $1; imc_close_unit(interp, cur_unit); cur_unit = 0; }
   | emit          { $$ = $1; imc_close_unit(interp, cur_unit); cur_unit = 0; }
   | MACRO '\n'    { $$ = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
   | '\n'          { $$ = 0; }
   ;

global:
     GLOBAL type IDENTIFIER
         {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            $$ = 0;
         }
   | GLOBAL type IDENTIFIER '=' const
         {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            $$ = 0;
         }
   ;

constdef:
     CONST { is_def=1; } type IDENTIFIER '=' const
                                    { mk_const_ident($4, $3, $6, 1);is_def=0; }
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
   ;

pasm_inst:         { clear_state(); }
     PARROT_OP pasm_args
                   { $$ = INS(interp, cur_unit, $2,0,regs,nargs,keyvec,1);
                     free($2); }
   | PCC_SUB pcc_sub_proto LABEL
                   {
                     $$ = iSUBROUTINE(cur_unit, mk_sub_label($3));
                     $$->r[1] = mk_pcc_sub(str_dup($$->r[0]->name), 0);
                     add_namespace(interp, $$->r[1]);
                     $$->r[1]->pcc_sub->pragma = $2;
                   }
   | /* none */    { $$ = 0;}
   ;

pasm_args:
     vars
   ;

emit:
     EMIT          { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; }
     pasmcode
     EOM           { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     $$=0; }
   ;

class_namespace:
    NAMESPACE '[' keylist ']'  { $$=0;
                                 IMCC_INFO(interp)->cur_namespace = $3;
                                 cur_namespace = $3;
                                 }
   ;

class:
     CLASS IDENTIFIER
                   {
                      Symbol * sym = new_symbol($2);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
     '\n' class_body ENDCLASS
                   {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      $$ = 0; }
   ;

class_body:
     member_decls
   | /* none */   { $$ = 0; }
   ;

member_decls:
     member_decl
   | member_decls member_decl
   ;

member_decl:
     field_decl
   | method_decl
   | '\n'          { $$ = 0; }
   ;

field_decl:
     FIELD type IDENTIFIER '\n'
                   {
                      Symbol * sym = new_symbol($3);
                      if(lookup_field_symbol(current_class, $3)) {
                         fataly(EX_SOFTWARE, sourcefile, line,
                            "field '%s' previously declared in class '%s'\n",
                            $3, current_class->sym->name);
                      }
                      sym->type = $2;
                      store_field_symbol(current_class, sym);
                      $$ = 0; }
   ;

method_decl:
     DOT_METHOD IDENTIFIER IDENTIFIER '\n'
        {
           Method * meth;
           Symbol * sym = new_symbol($2);
           if(lookup_method_symbol(current_class, $2)) {
              fataly(EX_SOFTWARE, sourcefile, line,
                 "method '%s' previously declared in class '%s'\n",
                    $2, current_class->sym->name);
           }
           meth = new_method(sym, new_symbol($3));
           store_method_symbol(current_class, sym);
           $$ = 0;
        }
   ;

sub:
     SUB
        {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
     IDENTIFIER pcc_sub_proto '\n'
        {
          Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label($3));
          i->r[1] = $<sr>$ = mk_pcc_sub(str_dup(i->r[0]->name), 0);
          add_namespace(interp, i->r[1]);
          i->r[1]->pcc_sub->pragma = $4;
        }
     sub_params
     sub_body { $$ = 0; }
   ;

sub_params:
     /* empty */                       { $$ = 0; } %prec LOW_PREC
   | '\n'                              { $$ = 0; }
   | sub_params sub_param '\n'         { add_pcc_param($<sr>0, $2);}
   ;

sub_param:
     PARAM                             { is_def=1; }
     type IDENTIFIER                   { $$ = mk_ident($4, $3); is_def=0; }
   ;

sub_body:
     statements ESUB                   { $$ = 0; }
   ;

pcc_sub:
     PCC_SUB       { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
     IDENTIFIER pcc_sub_proto '\n'
         {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label($3));
            i->r[1] = $<sr>$ = mk_pcc_sub(str_dup(i->r[0]->name), 0);
            add_namespace(interp, i->r[1]);
            i->r[1]->pcc_sub->pragma = $4;
         }
     pcc_params
     sub_body { $$ = 0; }
   ;

pcc_params:
     /* empty */                       { $$ = 0; } %prec LOW_PREC
   | '\n'                              { $$ = 0; }
   | pcc_params pcc_param '\n'         { add_pcc_param($<sr>0, $2);}
   ;

pcc_param:
     PARAM                             { is_def=1; }
     type IDENTIFIER                   { $$ = mk_ident($4, $3); is_def=0; }
   ;

pcc_sub_call:
     PCC_BEGIN pcc_proto '\n'
         {
            char name[128];
            SymReg * r;
            Instruction *i;

            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
            $<sr>$ = r = mk_pcc_sub(str_dup(name), 0);
            r->pcc_sub->pragma = $2;
            /* this mid rule action has the semantic value of the
             * sub SymReg.
             * This is used below to append args & results
             */
            i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB;
            /*
             * if we are inside a pcc_sub mark the sub as doing a
             * sub call; the sub is in r[1] of the first ins
             */
            if (cur_unit->instructions->r[1] && cur_unit->instructions->r[1]->pcc_sub)
                cur_unit->instructions->r[1]->pcc_sub->calls_a_sub = 1;
         }
     pcc_args
     pcc_call
     opt_label
     pcc_results
     PCC_END       { $$ = 0; }
   ;

opt_label:
     /* empty */   { $$ = NULL;  $<sr>-2 ->pcc_sub->label = 0; }
   | label '\n'    { $$ = NULL;  $<sr>-2 ->pcc_sub->label = 1; }
   ;

pcc_proto:
     PROTOTYPED     {  $$ = P_PROTOTYPED ; }
   | NON_PROTOTYPED {  $$ = P_NON_PROTOTYPED ; }
   ;

pcc_sub_proto:
     /* empty */    {  $$ = P_NONE; }
   | pcc_sub_proto COMMA proto  { $$ |= $3; }
   | proto          { $$ |= $1; }
   ;

proto: pcc_proto
   | LOAD           {  $$ = P_LOAD; }
   | MAIN           {  $$ = P_MAIN; }
   | IMMEDIATE      {  $$ = P_IMMEDIATE; }
   | POSTCOMP       {  $$ = P_POSTCOMP; }
   | METHOD         {  $$ = P_METHOD | P_NONE ; }
   ;

pcc_call:
     PCC_CALL var COMMA var '\n'
         {
            add_pcc_sub($<sr>-1, $2);
            add_pcc_cc($<sr>-1, $4);
         }
   | PCC_CALL var '\n'
         {  add_pcc_sub($<sr>-1, $2); }
   | NCI_CALL var '\n'
         {
            add_pcc_sub($<sr>-1, $2);
            $<sr>-1 ->pcc_sub->nci = 1;
         }
   ;

pcc_args:
     /* empty */                       {  $$ = 0; }
   | pcc_args pcc_arg '\n'             {  add_pcc_arg($<sr>0, $2);}
   ;

pcc_arg:
     ARG var                           {  $$ = $2; }
   | FLATTEN_ARG target                {  $2->type |= VT_FLATTEN; $$ = $2; }
   ;

pcc_results:
     /* empty */                       {  $$ = 0; }
   | pcc_results pcc_result '\n'       {  if($2) add_pcc_result($<sr>-3, $2); }
   ;

pcc_result:
     RESULT target
         {  $$ = $2; }
   | LOCAL { is_def=1; } type IDENTIFIER
         {  mk_ident($4, $3); is_def=0; $$=0; }
   ;

pcc_ret:
     PCC_BEGIN_RETURN '\n'
         {
            Instruction *i, *ins;
            SymReg *r;
            char name[128];
            ins = cur_unit->instructions;
            if(!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
               fataly(EX_SOFTWARE, sourcefile, line,
                      "pcc_return not inside pcc subroutine\n");
            sprintf(name, "%cpcc_sub_ret_%d", IMCC_INTERNAL_CHAR, cnr++);
            $<sr>$ = r = mk_pcc_sub(str_dup(name), 0);
            i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB | ITLABEL;
         }
     pcc_returns
     PCC_END_RETURN
         {  $$ = 0; }
   ;

pcc_yield:
     PCC_BEGIN_YIELD '\n'
         {
            Instruction *i, *ins;
            SymReg *r;
            char name[128];
            ins = cur_unit->instructions;
            if(!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
               fataly(EX_SOFTWARE, sourcefile, line,
                      "pcc_yield not inside pcc subroutine\n");
            ins->r[1]->pcc_sub->calls_a_sub = 1;
            sprintf(name, "%cpcc_sub_yield_%d", IMCC_INTERNAL_CHAR, cnr++);
            $<sr>$ = r = mk_pcc_sub(str_dup(name), 0);
            i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB | ITLABEL | ITPCCYIELD;
         }
     pcc_returns
     PCC_END_YIELD
         {  $$ = 0; }
   ;

pcc_returns:
     /* empty */   {  $$ = 0; }
   | pcc_returns '\n'
                   {  if($1) add_pcc_return($<sr>0, $1); }
   | pcc_returns pcc_return '\n'
                   {  if($2) add_pcc_return($<sr>0, $2); }
   ;

pcc_return:
     RETURN var    {  $$ = $2; }
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
                     /* $$ = iLABEL(cur_unit, mk_address($1, U_add_uniq_label)); */
                     $$ = iLABEL(cur_unit, mk_local_label(cur_unit, $1));
                   }
   ;

instruction:
      labels labeled_inst '\n'
                   { $$ = $2; }
    ;

labeled_inst:
     assignment
   | if_statement
   | NAMESPACE IDENTIFIER            { push_namespace($2); }
   | ENDNAMESPACE IDENTIFIER         { pop_namespace($2); }
   | LOCAL { is_def=1; } type IDENTIFIER { mk_ident($4, $3); is_def=0; }
   | CONST { is_def=1; } type IDENTIFIER '=' const
                                    { mk_const_ident($4, $3, $6, 0);is_def=0; }
   | GLOBAL_CONST { is_def=1; } type IDENTIFIER '=' const
                                    { mk_const_ident($4, $3, $6, 1);is_def=0; }
   | PARAM { is_def=1; } type IDENTIFIER { $$ = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident($4, $3));is_def=0; }
   | PARAM reg                        { $$ = MK_I(interp, cur_unit, "restore", 1, $2); }
   | RESULT var                       { $$ = MK_I(interp, cur_unit, "restore", 1, $2); }
   | ARG var                          { $$ = MK_I(interp, cur_unit, "save", 1, $2); }
   | RETURN var                       { $$ = MK_I(interp, cur_unit, "save", 1, $2); }
   | CALL label_op                    { $$ = MK_I(interp, cur_unit, "bsr",  1, $2); }
   | GOTO label_op                    { $$ = MK_I(interp, cur_unit, "branch",1, $2); }
   | INC var                          { $$ = MK_I(interp, cur_unit, "inc",1, $2); }
   | DEC var                          { $$ = MK_I(interp, cur_unit, "dec",1, $2); }
   | SAVEALL                          { $$ = MK_I(interp, cur_unit, "saveall" ,0); }
   | RESTOREALL                       { $$ = MK_I(interp, cur_unit, "restoreall" ,0); }
   | END                              { $$ = MK_I(interp, cur_unit, "end" ,0); }
   | NEWSUB                           { expect_pasm = 1; }
     pasm_args
                   { $$ = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
   | PARROT_OP vars
                   { $$ = INS(interp, cur_unit, $1, 0, regs, nargs, keyvec, 1);
                                          free($1); }
   | sub_call      {  $$ = 0; current_call = NULL; }
   | pcc_sub_call  {  $$ = 0; }
   | pcc_ret
   | pcc_yield
   | /* none */                        { $$ = 0;}
   ;

newsub:
     NEWSUB { $$ = NEWSUB; }
   | NEWCLOSURE { $$ = NEWCLOSURE; }
   | NEWCOR { $$ = NEWCOR; }
   | NEWCONT { $$ = NEWCONT; }
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
            if((pmc_type(interp, string_from_cstring(interp, $1, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", $1);
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
   | target '=' var '%' var	{ $$ = MK_I(interp, cur_unit, "mod", 3, $1, $3, $5); }
   | target '=' var '.' var	{ $$ = MK_I(interp, cur_unit, "concat", 3, $1,$3,$5); }
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
   | target '=' NEW classname
                        { $$ = iNEW(interp, cur_unit, $1, $4, NULL, 1); }
   | target '=' newsub IDENTIFIER
                        { $$ = iNEWSUB(interp, cur_unit, $1, $3,
                                          mk_sub_address($4), NULL, 1); }
   | target '=' newsub IDENTIFIER COMMA IDENTIFIER
                        { /* XXX: Fix 4arg version of newsub PASM op
                              * to use $1 instead of implicit P0
                              */
                              $$ = iNEWSUB(interp, cur_unit, NULL, $3,
                                           mk_sub_address($4),
                                           mk_sub_address($6), 1); }
   | target '=' DEFINED var
                        { $$ = MK_I(interp, cur_unit, "defined", 2, $1, $4); }
   | target '=' DEFINED var '[' keylist ']'
                        { keyvec=KEY_BIT(2);
                          $$ = MK_I(interp, cur_unit, "defined", 3,$1,$4,$6); }
   | target '=' CLONE var
                        { $$ = MK_I(interp, cur_unit, "clone",2, $1, $4); }
   | target '=' ADDR IDENTIFIER
                        { $$ = MK_I(interp, cur_unit, "set_addr",
                                    2, $1, mk_label_address(cur_unit, $4)); }
   | target '=' GLOBALOP string
                        { $$ = MK_I(interp, cur_unit, "find_global",2,$1,$4);}
   | GLOBALOP string '=' var
                        { $$ = MK_I(interp, cur_unit, "store_global",2, $2,$4); }
       /* NEW and is here because it is both PIR and PASM keywords so we
        * have to handle the token here (or badly hack the lexer). */
   | NEW
                        { expect_pasm = 1; }
     pasm_args
                        { $$ = INS(interp, cur_unit, "new",0,regs,nargs,keyvec,1); }
   | DEFINED target COMMA var
                        { $$ = MK_I(interp, cur_unit, "defined", 2, $2, $4); }
   | DEFINED target COMMA var '[' keylist ']'
                        { keyvec=KEY_BIT(2);
                          $$ = MK_I(interp, cur_unit, "defined", 3, $2, $4, $6); }
   | CLONE target COMMA var
                        { $$ = MK_I(interp, cur_unit, "clone", 2, $2, $4); }
     /* Subroutine call the short way */
   | target '=' sub_call
         {
            add_pcc_result($3->r[0], $1);
            current_call = NULL;
            $$ = 0;
         }
   |
         {
            $<i>$ = create_itcall_label();
         }
     '(' targetlist  ')' '=' the_sub '(' arglist ')'
         {
           itcall_sub($6);
           current_call = NULL;
         }
   ;

the_sub: IDENTIFIER  { $$ = mk_sub_address($1); }
       | VAR      { $$ = $1;
                       if ($1->set != 'P')
                          fataly(1, sourcefile, line, "Sub isn't a PMC");
                     }
       | target ptr IDENTIFIER { cur_obj = $1; $$ = mk_sub_address($3); }
       | target ptr STRINGC    { cur_obj = $1; $$ = mk_const($3, 'S'); }
       | target ptr target     { cur_obj = $1; $$ = $3; }
   ;

ptr:    POINTY { $$=0; }
      | '.'    { $$=0; }
   ;

sub_call:
     the_sub
        {
           $$ = create_itcall_label();
           itcall_sub($1);
        }
     '(' arglist ')'
        {  $$ = $<i>2; }
   ;

arglist:
     /* empty */             {  $$ = 0; }
   | arglist COMMA arg       {  $$ = 0; add_pcc_arg(current_call->r[0], $3); }
   | arg                     {  $$ = 0; add_pcc_arg(current_call->r[0], $1); }
   ;

arg:
     var
                   { $$ = $1; }
   | FLATTEN_ARG target
                   { $2->type |= VT_FLATTEN; $$ = $2; }
   ;

targetlist:
     targetlist COMMA target { $$ = 0; add_pcc_result(current_call->r[0], $3); }
   | target                  { $$ = 0; add_pcc_result(current_call->r[0], $1); }
   ;

if_statement:
     IF var relop var GOTO label_op
                   {  $$ =MK_I(interp, cur_unit, $3, 3, $2, $4, $6); }
   | UNLESS var relop var GOTO label_op
                   {  $$ =MK_I(interp, cur_unit, inv_op($3), 3, $2,$4, $6); }
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

label_op:
     IDENTIFIER    { $$ = mk_label_address(cur_unit, $1); }
   | PARROT_OP     { $$ = mk_label_address(cur_unit, $1); }
   ;

var_or_i:
     label_op
   | var
   ;

var:
     target
   | const
   ;

keylist:           {  nkeys=0; }
     _keylist      {  $$ = link_keys(nkeys, keys); }
   ;

_keylist:
     key           {  keys[nkeys++] = $1; }
   | _keylist ';' key
                   {  keys[nkeys++] = $3; $$ =  keys[0]; }
   ;

key:
     var
   ;

reg:
     IREG          {  $$ = mk_symreg($1, 'I'); }
   | NREG          {  $$ = mk_symreg($1, 'N'); }
   | SREG          {  $$ = mk_symreg($1, 'S'); }
   | PREG          {  $$ = mk_symreg($1, 'P'); }
   | REG           {  $$ = mk_pasm_reg($1); }
   ;

const:
     INTC          {  $$ = mk_const($1, 'I'); }
   | FLOATC        {  $$ = mk_const($1, 'N'); }
   | STRINGC       {  $$ = mk_const($1, 'S'); }
   ;

string:
     SREG          {  $$ = mk_symreg($1, 'S'); }
   | STRINGC       {  $$ = mk_const($1, 'S'); }
   ;


/* The End */
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
