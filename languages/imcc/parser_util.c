/*
 * parser_util.c
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 *
 * parser support functions
 *
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define _PARSER

#include "imc.h"
#include "parrot/method_util.h"
#include "parrot/interp_guts.h"
#include "pbc.h"
#include "parser.h"

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
        if (args[i]->type & (VTCONST|VT_CONSTP))
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
    return interpreter->op_lib->op_code(name, 0) >= 0
        || interpreter->op_lib->op_code(name, 1) >= 0;
}

/* make a instruction
 * name ... op name
 * fmt ... optional format
 * regs ... SymReg **
 * n ... # of params
 * keys ... keyvec bits
 * emit ... if true, append to instructions
 *
 * s. e.g. imc.c for usage
 */
Instruction * INS(char * name, char *fmt, SymReg **regs, int n,
	int keys, int emit) {
    nargs = n;
    keyvec = keys;
    return iANY(name, fmt, regs, emit);
}

/* imcc_eval(interp*, const char*)
 *
 * evaluate a pasm or imcc string
 *
 */
extern void* yy_scan_string(const char *);

static void *imcc_eval(Parrot_Interp interpreter, const char *s)
{
    /* imcc always compiles to interp->code->byte_code
     * save old pointer, make new
     */
    size_t code_size = interpreter->code->byte_code_size;
    void *code = interpreter->code->byte_code;
    opcode_t *pc;

    /* reset line number */
    line = 0;
    yy_scan_string(s);
    /* s. also e_pbc_open for reusing code/consts ... */
    emit_open(1, NULL);
    /* XXX this may move an existing byte_code */
    /* XXX where to put constants */
    yyparse();
    emit_close();

    pc = (opcode_t *) ((char*)interpreter->code->byte_code + code_size);
    /* XXX test */
    /* runops_slow_core(interpreter, pc);
    while (pc) {
        DO_OP(pc, interpreter);
    }
    */
    /* XXX restore old byte_code, */
    /*interpreter->code->byte_code_size = code_size; */
    interpreter->code->byte_code = code;
    return pc;
}

void *imcc_eval_pasm(Parrot_Interp interpreter, const char *s)
{
    pasm_file = 1;
    expect_pasm = 0;
    return imcc_eval(interpreter, s);
}

void *imcc_eval_pir (Parrot_Interp interpreter, const char *s)
{
    pasm_file = 0;
    expect_pasm = 0;
    return imcc_eval(interpreter, s);
}

/* tell the parrot core, which compilers we provide */
void register_compilers(Parrot_Interp interpreter)
{
    STRING *pasm = string_make(interpreter, "PASM", 4, NULL,0,NULL);
    STRING *pir = string_make(interpreter, "PIR", 3, NULL,0,NULL);
    PMC * func;
    Parrot_csub_t pa = (Parrot_csub_t) F2DPTR(imcc_eval_pasm);
    Parrot_csub_t pi = (Parrot_csub_t) F2DPTR(imcc_eval_pir);

    func = pmc_new(interpreter, enum_class_Compiler);
    Parrot_compreg(interpreter, pasm, func);
    func->vtable->set_string_keyed(interpreter, func, (PMC*)F2DPTR(pa),
          string_make(interpreter, "pIt", 3, NULL,0,NULL));

    func = pmc_new(interpreter, enum_class_Compiler);
    Parrot_compreg(interpreter, pir, func);
    func->vtable->set_string_keyed(interpreter, func, (PMC*)F2DPTR(pi),
          string_make(interpreter, "pIt", 3, NULL,0,NULL));
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
