%{
/*
 * machine.y
 *
 * Cola compiler for Parrot
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 *
 * The intermediate language compiler. Grammar for the Parrot VM target.
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h> 
#include "imc.h"

#define YYDEBUG 1


int         yyerror(char *);
int         yylex();
extern char yytext[];
long        line;

/*
 * Choosing instructions for Parrot is pretty easy since
 * many are polymorphic.
 */
SymReg * iMOVE(SymReg *r0, SymReg*r1) {
    emitb(mk_instruction("set %s, %s", r0, r1, NULL, NULL));
    return r0;
}

SymReg * iINC(SymReg *r0) {
    emitb(mk_instruction("inc %s", r0, NULL, NULL, NULL));
    return r0;
}

SymReg * iDEC(SymReg *r0) {
    emitb(mk_instruction("dec %s", r0, NULL, NULL, NULL));
    return r0;
}

SymReg * iADD(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("add %s, %s, %s", r0, r1, r2, NULL));
    return r0;
}

SymReg * iSUB(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("sub %s, %s, %s", r0, r1, r2, NULL));
    return r0;
}

SymReg * iMUL(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("mul %s, %s, %s", r0, r1, r2, NULL));
    return r0;
}

SymReg * iDIV(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("div %s, %s, %s", r0, r1, r2, NULL));
    return r0;
}

SymReg * iMOD(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("mod %s, %s, %s", r0, r1, r2, NULL));
    return r0;
}

SymReg * iSHL(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("shl %s, %s, %s", r0, r1, r2, NULL));
    return r0;
}

SymReg * iSHR(SymReg *r0, SymReg*r1, SymReg *r2) {
    emitb(mk_instruction("shr %s, %s, %s", r0, r1, r2, NULL));
    return r0;
}

SymReg * iCALL(SymReg * r0) {
    emitb(mk_instruction("bsr %s", r0, NULL, NULL, NULL));
    return r0;
}

SymReg * iBRANCH(SymReg * r0) {
    Instruction * i = emitb(mk_instruction("branch %s", r0, NULL, NULL, NULL));
    i->type = ITBRANCH;
    return r0;
}

SymReg * iLABEL(SymReg * r0) {
    emitb(mk_instruction("%s", r0, NULL, NULL, NULL));
    return r0;
}

SymReg * iARG(SymReg * r0) {
    emitb(mk_instruction("save %s", r0, NULL, NULL, NULL));
    return r0;
}

SymReg * iPUSH(SymReg * r0) {
    emitb(mk_instruction("save %s", r0, NULL, NULL, NULL));
    return r0;
}

SymReg * iPOP(SymReg * r0) {
    emitb(mk_instruction("restore %s", r0, NULL, NULL, NULL));
    return r0;
}

SymReg * iPRINT(SymReg * r0) {
    emitb(mk_instruction("print %s", r0, NULL, NULL, NULL));
    return r0;
}

SymReg * iSUBROUTINE(SymReg * r0) {
    emitb(mk_instruction("%s:", r0, NULL, NULL, NULL));
    return r0;
}

SymReg * iRET() {
    emitb(mk_instruction("ret", NULL, NULL, NULL, NULL));
    return 0;
}

SymReg * iINDEXFETCH(SymReg * r0, SymReg * r1, SymReg * r2) {
    emitb(mk_instruction("substr %s, %s, %s, 1", r0, r1, r2, NULL));
    return r0;
}

SymReg * iIF(int relop, SymReg * r0, SymReg * r1, SymReg * r2) {
    Instruction * i;
    char op[256];
    relop_to_op(relop, op);
    strcat(op, " %s, %s, %s");
    i = emitb(mk_instruction(op, r0, r1, r2, NULL));
    i->type = ITBRANCH;
    return 0;
}

SymReg * iEMIT(char * assembly) {
    fprintf(stderr, "iEMIT\n");
    emitb(mk_instruction(assembly, NULL, NULL, NULL, NULL));
    return 0;
}


%}

%union {
    int i;
    char * s;
    SymReg * sr;
}

%token <i> CALL GOTO BRANCH ARG RET PRINT IF GOTO
%token <i> SUB NAMESPACE CLASS ENDCLASS SYM LOCAL PARAM PUSH POP INC DEC
%token <i> SHIFT_LEFT SHIFT_RIGHT INT FLOAT STRING
%token <i> RELOP_EQ RELOP_NE RELOP_GT RELOP_GTE RELOP_LT RELOP_LTE
%token <s> LABEL EMIT
%token <s> IREG NREG SREG PREG IDENTIFIER STRINGC INTC FLOATC
%type <i> type program globals classes class subs sub sub_start relop
%type <sr> labels label statements statement
%type <sr> instruction assignment if_statement
%type <sr> target reg const var rc

%start program 

%%

program:
    subs emit
    { $$ = 0; }
    ;

globals:
    { $$ = 0; }
    ;

emit:
    |   EMIT
        { iEMIT($1); }
    ;

classes:
        class
        classes class
    ;

class:
        sub
        subs sub
    ;

subs:
        subs sub
    |   sub
    ;

sub:
        sub_start statements labels RET
        { SymReg ** g;
          $$ = 0; iRET();
          g = compute_graph();
          color_graph(g);
          free(g);
          emit_flush();
          clear_tables();
        }
    ;

sub_start:
        SUB IDENTIFIER
        { $$ = 0;
          iSUBROUTINE(mk_address($2));
        }
    ;

statements:
        statement
    |   statements statement
    ;

statement:
        instruction                      { $$ = $1; }
    ;

labels:
        labels label
    |   label
    ;

label:  /* Optional */
        { $$ = 0; }
    |   LABEL { $$ = iLABEL(mk_address($1)); }
    ;

instruction:
        assignment
    |   if_statement
    |   labels SYM type IDENTIFIER              { mk_ident($4, $3); }
    |   labels LOCAL type IDENTIFIER            { mk_ident($4, $3); }
    |   labels PARAM type IDENTIFIER            { $$ = iPOP(mk_ident($4, $3));}
    |   labels PARAM reg                        { $$ = iPOP($3); }
    |   labels ARG var                          { $$ = iARG($3); }
    |   labels CALL IDENTIFIER                  { $$ = iCALL(mk_address($3)); }
    |   labels GOTO IDENTIFIER                  { $$ = iBRANCH(mk_address($3));}
    |   labels PUSH var                         { $$ = iPUSH($3); }
    |   labels POP var                          { $$ = iPOP($3); }
    |   labels INC var                          { $$ = iINC($3); }
    |   labels DEC var                          { $$ = iDEC($3); }
    |   labels PRINT var                        { $$ = iPRINT($3); }
    ;

type:
        INT { $$ = 'I'; }
    |   FLOAT { $$ = 'N'; }
    |   STRING { $$ = 'S'; }
    ;

assignment:
       labels target '=' var                    { $$ = iMOVE($2, $4); }
    |  labels target '=' var '+' var            { $$ = iADD($2, $4, $6); } 
    |  labels target '=' var '-' var            { $$ = iSUB($2, $4, $6); } 
    |  labels target '=' var '*' var            { $$ = iMUL($2, $4, $6); } 
    |  labels target '=' var '/' var            { $$ = iDIV($2, $4, $6); } 
    |  labels target '=' var '%' var            { $$ = iMOD($2, $4, $6); } 
    |  labels target '=' var SHIFT_LEFT var     { $$ = iSHL($2, $4, $6); } 
    |  labels target '=' var SHIFT_RIGHT var    { $$ = iSHR($2, $4, $6); } 
    |  labels target '=' var '[' var ']'        { $$ = iINDEXFETCH($2, $4, $6); } 
    ;

if_statement:
       labels IF var relop var GOTO IDENTIFIER
       { $$ = iIF($4, $3, $5, mk_address($7)); }
    ;

relop:
       RELOP_EQ { $$ = RELOP_EQ; }
    |  RELOP_NE { $$ = RELOP_NE; }
    |  RELOP_GT { $$ = RELOP_GT; }
    |  RELOP_GTE { $$ = RELOP_GTE; }
    |  RELOP_LT { $$ = RELOP_LT; }
    |  RELOP_LTE { $$ = RELOP_LTE; }
    ;

target:
       IDENTIFIER
       { $$ = get_sym($1); }
    |  reg 
    ;

reg:
       IREG
       { $$ = mk_symreg($1, 'I'); }
    |  NREG
       { $$ = mk_symreg($1, 'N'); }
    |  SREG
       { $$ = mk_symreg($1, 'S'); }
    |  PREG
       { $$ = mk_symreg($1, 'P'); }
    ;

const:
       INTC
       { $$ = mk_const($1, 'I'); }
    |  FLOATC
       { $$ = mk_const($1, 'N'); }
    |  STRINGC
       { $$ = mk_const($1, 'S'); }
    ;
 
var:
       IDENTIFIER
       { $$ = get_sym($1); }
    |  rc
    ;

rc:
       reg
    |  const
    ;

%%

extern FILE *yyin;

int main(int argc, char * argv[])
{
    if(argc > 1) {
        if(!(yyin = fopen(argv[1], "r")))    {
            fprintf(stderr, "Error reading source file %s.\n", argv[1] );
            exit(0);
        }
    }
    else {
        fprintf(stderr, "No source file specified.\n" );
        exit(0);
    }

    line = 0;

    fprintf(stderr, "Pass 1: Starting parse...\n");
    freopen("a.pasm", "w", stdout);
    yyparse();

    /* Flush any pending code such as .emits */
    emit_flush();

    fclose(yyin);
    fclose(stdout);
    fprintf(stderr, "%ld lines compiled.\n", line);
    fprintf(stderr, "Compiling assembly module a.pasm\n");
    return 0;
}

int yyerror(char * s)
{
    fprintf(stderr, "last token = [%s]\n", yylval.s); 
    fprintf(stderr, "(error) line %ld: %s\n", line, s );
    fprintf(stderr, "Didn't create output asm.\n" );
    exit(0);
}

