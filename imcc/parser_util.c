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
 * P = new type, [init]
 * PASM like:
 *   new P, .SomeThing
 * is done in the lexer, this is a mess
 * best would be to have a flag in core.ops, where a PMC type is expected
 */
Instruction *
iNEW(struct Parrot_Interp *interpreter, SymReg * r0, char * type,
        SymReg *init, int emit)
{
    char fmt[256];
    SymReg *pmc;
    int pmc_num = Parrot_get_pmc_num(interpreter,
            *type == '.' ?type+1:type);
    sprintf(fmt, "%d", pmc_num);
    pmc = mk_const(str_dup(fmt), 'I');

    if (pmc_num == 0)
        fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", type);
    sprintf(fmt, "%%s, %d\t # .%s", pmc_num, type);
    r0->usage = U_NEW;
    if (!strcmp(type, "PerlArray") || !strcmp(type, "PerlHash"))
        r0->usage |= U_KEYED;
    free(type);
    regs[0] = r0;
    regs[1] = pmc;
    if (init) {
        regs[2] = init;
        nargs = 3;
    }
    else
        nargs = 2;
    return iANY(interpreter, "new", fmt, regs, emit);
}

/* TODO get rid of nargs */
void
op_fullname(char * dest, const char * name, SymReg * args[], int narg) {
    int i;

    strcpy(dest, name);
    dest += strlen(name);
    for (i = 0; i < narg && args[i]; i++) {
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
            else if (args[i]->set == 'P')
                continue;
        }
        *dest++ = tolower(args[i]->set);
        if (args[i]->type & (VTCONST|VT_CONSTP))
            *dest++ = 'c';
    }
    *dest = '\0';
}

int
check_op(struct Parrot_Interp *interpreter, char *fullname,
        char *name, SymReg *r[])
{
    int op, narg;
    for (narg = 0; r[narg]; narg++)
        ;
    op_fullname(fullname, name, r, narg);
    op = interpreter->op_lib->op_code(fullname, 1);
    return op;

}

int is_op(struct Parrot_Interp *interpreter, char *name)
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
Instruction *
INS(struct Parrot_Interp *interpreter, char *name, char *fmt, SymReg **r,
        int n, int keys, int emit)
{
    nargs = n;
    keyvec = keys;
    return iANY(interpreter, name, fmt, r, emit);
}

/* imcc_compile(interp*, const char*)
 *
 * compile a pasm or imcc string
 *
 * FIXME as we have separate constants, the old constants in ghash must
 *       be deleted.
 *
 */
extern void* yy_scan_string(const char *);

static void *imcc_compile(Parrot_Interp interp, const char *s)
{
    /* imcc always compiles to interp->code->byte_code
     * save old cs, make new
     */
    struct PackFile *pf_save = interp->code;
    struct PackFile *pf = PackFile_new(0);
    char *source = sourcefile;
    char name[64];
#ifdef EVAL_TEST
    opcode_t *pc;
#endif

    interp->code = pf;  /* put new packfile in place */
    sprintf(name, "EVAL_" INTVAL_FMT, ++pf_save->eval_nr);
    sourcefile = name;
    /* spit out the sourcefile */
    if (Interp_flags_TEST(interp, PARROT_DEBUG_FLAG)) {
        FILE *fp = fopen(sourcefile, "w");
        if (fp) {
            fputs(s, fp);
            fclose(fp);
        }
    }
    /* reset line number */
    line = 1;
    yy_scan_string(s);
    /* s. also e_pbc_open for reusing code/consts ... */
    emit_open(1, interp);
    /* XXX where to put constants */
    yyparse((void *) interp);
    emit_close(interp);

#ifdef EVAL_TEST
    pc = (opcode_t *) interp->code->byte_code;
    while (pc) {
        DO_OP(pc, interp);
    }
#endif
    /* restore old byte_code, */
    (void)Parrot_switch_to_cs(interp, pf_save->cur_cs);
    sourcefile = source;
    /* append new packfile to current directory */
    PackFile_add_segment(&interp->code->directory,
            &pf->directory.base);
    return pf;
}

static void *imcc_compile_pasm(Parrot_Interp interp, const char *s)
{
    int pasm = pasm_file;
    void *pf;

    pasm_file = 1;
    expect_pasm = 0;
    pf = imcc_compile(interp, s);
    pasm_file = pasm;
    return pf;
}

static void *imcc_compile_pir (Parrot_Interp interp, const char *s)
{
    int pasm = pasm_file;
    void *pf;

    pasm_file = 0;
    expect_pasm = 0;
    pf = imcc_compile(interp, s);
    pasm_file = pasm;
    return pf;
}


static void *imcc_compile_file (Parrot_Interp interp, const char *s)
{
    struct PackFile *pf_save = interp->code;
    struct PackFile *pf;
    char *source = sourcefile;
    char *ext;
    int pasm = pasm_file;
    FILE *new;
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;
#define const_cast(b) (__ptr_u.__c_ptr = (b), __ptr_u.__ptr)

    if(!(new = fopen(s, "r"))) {
        fatal(1, "imcc_compile_file", "couldn't open '%s'\n", s);
        return NULL;
    }
    pf = PackFile_new(0);
    interp->code = pf;  /* put new packfile in place */
    sourcefile = const_cast(s);
    ext = strrchr(s, '.');
    if (ext && strcmp (ext, ".pasm") == 0) {
        pasm_file = 1;
    }
    else
        pasm_file = 0;

    line = 1;
    compile_file(interp, new);

    (void)Parrot_switch_to_cs(interp, pf_save->cur_cs);
    sourcefile = source;
    pasm_file = pasm;
    fclose(new);
    return pf;
}

/* tell the parrot core, which compilers we provide */
void register_compilers(Parrot_Interp interp)
{
    STRING *pasm = string_from_cstring(interp, "PASM", 0);
    STRING *pir = string_from_cstring(interp, "PIR", 0);
    STRING *source = string_from_cstring(interp, "FILE", 0);
    Parrot_csub_t pa = (Parrot_csub_t)imcc_compile_pasm;
    Parrot_csub_t pi = (Parrot_csub_t)imcc_compile_pir;
    Parrot_csub_t ps = (Parrot_csub_t)imcc_compile_file;

    Parrot_compreg(interp, pasm, (PMC*)F2DPTR(pa));
    Parrot_compreg(interp, pir, (PMC*)F2DPTR(pi));
    Parrot_compreg(interp, source, (PMC*)F2DPTR(ps) );
}


/*
 * Try to find valid op doing the same operation
 *
 * e.g. add_n_i_n => add_n_n_i
 *      div_n_ic_n => div_n_nc_n
 *      div_n_i_n => set_n_i ; div_n_n_n
 */
int
try_find_op(Parrot_Interp interpreter, char *name, SymReg ** r, int n, int emit)
{
    char fullname[64];
    SymReg *s;
    int changed = 0;
    if (n == 3 && regs[0]->set == 'N') {
        if (r[1]->set == 'I' && r[2]->set == 'N') {
            if (!strcmp(name, "add") ||
                    !strcmp(name, "mul")
               ) {
                /*
                 * symmetric ops, swap args */
                s = r[1];
                r[1] = r[2];
                r[2] = s;
                changed = 1;
            }
            else if (r[1]->type & VTCONST) {
                /* make a number const */
                s = mk_const(str_dup(r[1]->name), 'N');
                r[1] = s;
                changed = 1;
            }
            else if (emit) {
                /* emit set_n_ix */
                SymReg *rr[IMCC_MAX_REGS];

                rr[0] = mk_temp_reg('N');
                rr[1] = r[1];
                nargs = 2;
                INS(interpreter, "set", NULL, rr, 2, 0, 1);
                nargs = 3;
                r[1] = rr[0];
                changed = 1;
            }
        }
    }
    if (changed) {
        op_fullname(fullname, name, r, n);
        return interpreter->op_lib->op_code(fullname, 1);
    }
    return -1;
}

Instruction *
multi_keyed(struct Parrot_Interp *interpreter,char *name,
SymReg ** r, int nr, int emit)
{
    int i, keyf, kv, n;
    char buf[16];
    static int p = 0;
    SymReg *preg[IMCC_MAX_REGS];    /* px,py,pz */
    SymReg *nreg[IMCC_MAX_REGS];
    Instruction *ins = 0;

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
            fataly(EX_SOFTWARE, sourcefile, line,"illegal key operand\n");
        }
        /* make a new P symbol */
        while (1) {
            sprintf(buf, "$P%d", ++p);
            if (get_sym(buf) == 0)
                break;
        }
        preg[n] = mk_symreg(str_dup(buf), 'P');
        kv >>= 1;
        if (kv & 1) {
            /* we have a keyed operand */
            if (r[i]->set != 'P') {
                fataly(EX_SOFTWARE, sourcefile, line,"not an aggregate\n");
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
    iNEW(interpreter, preg[0], str_dup("PerlUndef"), NULL, 1);
    /* emit the operand */
    nargs = 3;
    keyvec = 0;
    iANY(interpreter, name, 0, preg, 1);
    /* emit the LHS op */
    emitb(ins);
    return ins;
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
