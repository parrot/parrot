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
#include "parrot/dynext.h"
#include "pbc.h"
#include "parser.h"

/*
 * FIXME create an official interface
 *       this is needed for the debugger pdb and called from imcc/main.c
 */
void imcc_init(Parrot_Interp interpreter);

/*
 * P = new type, [init]
 * PASM like:
 *   new P, .SomeThing
 * is done in the lexer, this is a mess
 * best would be to have a flag in core.ops, where a PMC type is expected
 */
Instruction *
iNEW(struct Parrot_Interp *interpreter, IMC_Unit * unit, SymReg * r0,
        char * type, SymReg *init, int emit)
{
    char fmt[256];
    SymReg *regs[IMCC_MAX_REGS];
    SymReg *pmc;
    int i, nargs;
    int pmc_num = pmc_type(interpreter,
            string_from_cstring(interpreter, *type == '.' ?type+1:type, 0));

    sprintf(fmt, "%d", pmc_num);
    pmc = mk_const(str_dup(fmt), 'I');

    if (pmc_num <= 0)
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
    i = nargs;
    while (i < IMCC_MAX_REGS)
	regs[i++] = NULL;
    return INS(interpreter, unit, "new", fmt, regs, nargs,0, emit);
}

/*
 * Variation of iNEW() specific for subs/closures/etc. and the newsub opcode
 * Allows IMCC to take advantage of the newsub opcode which is much more
 * efficient than new/set_addr combination. This makes PIR orthogonal
 * between new and newsub.
 *
 *  Example:
 *   P0 = newsub _func            ::=   newsub, P0, .Sub, _func
 *   P0 = newclosure _clos        ::=   newsub, P0, .Closure, _clos
 *   P0 = newsub _func, _ret      ::=   newsub, .Sub, .RetContinuation, _func, _ret
 *   P0 = newclosure _clos, _ret  ::=   newsub, .Closure, .RetContinuation, _clos, _ret
 *
 * XXX: Currently the 3 arg version of newsub ignores the Px target on the assign.
 *      Fix the PASM opcode.
 */

Instruction *
iNEWSUB(struct Parrot_Interp *interpreter, IMC_Unit * unit, SymReg * r0,
        int type, SymReg *subinit, SymReg *retinit, int emit)
{
    char fmt[256];
    SymReg *regs[IMCC_MAX_REGS];
    SymReg *subpmc, *retpmc;
    int i, nargs;
    int pmc_num;
    const char * classnm = NULL;
    switch(type) {
       case NEWSUB: classnm = "Sub"; break;
       case NEWCLOSURE: classnm = "Closure"; break;
       case NEWCOR: classnm = "Coroutine"; break;
       case NEWCONT: classnm = "Continuation"; break;
       default:
          fataly(1, sourcefile, line,
             "iNEWSUB: unimplemented classtype '%d'\n", type);
    }

    pmc_num = pmc_type(interpreter,
            string_from_cstring(interpreter, classnm, 0));

    sprintf(fmt, "%d", pmc_num);
    subpmc = mk_const(str_dup(fmt), 'I');

    if (pmc_num <= 0)
        fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", classnm);
    sprintf(fmt, "%%s, %d\t # .%s", pmc_num, classnm);

    /* 1st form:   px = newsub _foo */
    if (!retinit) {
        r0->usage = U_NEW;
        regs[0] = r0;
        regs[1] = subpmc;
        if (subinit) {
            regs[2] = subinit;
            nargs = 3;
        }
        else
            nargs = 2;
    }
    /* 2nd form:   px = newsub _foo, _retcont
     *
     * XXX: Currently px is ignored, this op sets P0/P1 implicitly
     */
    else {
        if (!subinit) { /* sanity check */
            fataly(1, sourcefile, line, "iNEWSUB: NULL $0 for newsub\n");
        }

        /* The return continuation */
        pmc_num = pmc_type(interpreter,
                string_from_cstring(interpreter, "RetContinuation", 0));

        sprintf(fmt, "%d", pmc_num);
        retpmc = mk_const(str_dup(fmt), 'I');

        regs[0] = subpmc;
        regs[1] = retpmc;
        regs[2] = subinit;
        regs[3] = retinit;
        nargs = 4;
    }

    i = nargs;
    while (i < IMCC_MAX_REGS)
	regs[i++] = NULL;
    return INS(interpreter, unit, "newsub", NULL, regs, nargs, 0, emit);
}


/*
 * Lookup the full opcode given the short name
 *   set I0, 5  -> set_i_ic
 *   set I0, I1 -> set_i_i
 *
 * Obviously the registers must be examined before returning
 * the correct opcode.
 *
 * NOTE: All this nasty IMC_TRACE is for tracking down equally
 * nasty bugs, so if you don't like the looks of it, stay
 * out, but please don't remove it. :) -Mel
 */
void
op_fullname(char * dest, const char * name, SymReg * args[],
        int narg, int keyvec) {
    int i;
#if IMC_TRACE_HIGH
    char * full = dest;
    PIO_eprintf(NULL, "op %s", name);
#endif
    strcpy(dest, name);
    dest += strlen(name);
    for (i = 0; i < narg && args[i]; i++) {
        *dest++ = '_';
        if (args[i]->type == VTADDRESS) {
#if IMC_TRACE_HIGH
        PIO_eprintf(NULL, " (address)%s", args[i]->name);
#endif
            *dest++ = 'i';
            *dest++ = 'c';
            continue;
        }
        /* if one ever wants num keys, they go with 'S' */
        if (keyvec & KEY_BIT(i)) {
#if IMC_TRACE_HIGH
        PIO_eprintf(NULL, " (key)%s", args[i]->name);
#endif
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
        if (args[i]->type & (VTCONST|VT_CONSTP)) {
#if IMC_TRACE_HIGH
            PIO_eprintf(NULL, " (%cc)%s", tolower(args[i]->set), args[i]->name);
#endif
            *dest++ = 'c';
        }
#if IMC_TRACE_HIGH
        else
            PIO_eprintf(NULL, " (%c)%s", tolower(args[i]->set), args[i]->name);
#endif
    }
    *dest = '\0';
#if IMC_TRACE_HIGH
    PIO_eprintf(NULL, " -> %s\n", full);
#endif
}

int
get_keyvec(Parrot_Interp interpreter, int op)
{
    int i, k;
    op_info_t * op_info = &interpreter->op_info_table[op];
    for (i = k = 0; i < op_info->arg_count - 1; i++)
        if (op_info->types[i+1] == PARROT_ARG_K ||
            op_info->types[i+1] == PARROT_ARG_KC ||
            op_info->types[i+1] == PARROT_ARG_KI ||
            op_info->types[i+1] == PARROT_ARG_KIC)
            k |= KEY_BIT(i);
    return k;
}

/*
 * Return opcode value for op name
 */
int
check_op(struct Parrot_Interp *interpreter, char *fullname,
        char *name, SymReg *r[], int narg, int keyvec)
{
    int op;

    op_fullname(fullname, name, r, narg, keyvec);
    op = interpreter->op_lib->op_code(fullname, 1);
    return op;
}

/*
 * Is instruction a parrot opcode?
 */
int
is_op(struct Parrot_Interp *interpreter, char *name)
{
    return interpreter->op_lib->op_code(name, 0) >= 0
        || interpreter->op_lib->op_code(name, 1) >= 0;
}

/* make a instruction
 * name ... op name
 * fmt ... optional format
 * regs ... SymReg **
 * n ... # of params
 * keyvec ... s. KEY_BIT()
 * emit ... if true, append to instructions
 *
 * s. e.g. imc.c for usage
 */
Instruction *
INS(struct Parrot_Interp *interpreter, IMC_Unit * unit, char *name,
        const char *fmt, SymReg **r, int n, int keyvec, int emit)
{
    char fullname[64];
    int i;
    int dirs = 0;
    int op;
    Instruction * ins;

#if 1
    ins = multi_keyed(interpreter, unit, name, r, n, keyvec, emit);
    if (ins)
        return ins;
#endif
    op_fullname(fullname, name, r, n, keyvec);
    op = interpreter->op_lib->op_code(fullname, 1);
    if (op < 0)         /* maybe we got a fullname */
        op = interpreter->op_lib->op_code(name, 1);
    if (op < 0)         /* still wrong, try to find an existing op */
        op = try_find_op(interpreter, unit, name, r, n, keyvec, emit);
    if (op >= 0) {
        op_info_t * op_info = &interpreter->op_info_table[op];
	char format[128];
	int len;

        *format = '\0';
        /* info->arg_count is offset by one, first is opcode
         * build instruction format
         * set LV_in / out flags */
        if (n != op_info->arg_count-1)
            fataly(EX_SOFTWARE, sourcefile, line,
                "arg count mismatch: op #%d '%s' needs %d given %d",
                op, fullname, op_info->arg_count-1, n);
        for (i = 0; i < op_info->arg_count-1; i++) {
            switch (op_info->dirs[i+1]) {
                case PARROT_ARGDIR_INOUT:
                    dirs |= 1 << (16 + i);
                    /* go on */
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
	if (len >= 2)
	    len -= 2;
	format[len] = '\0';
        if (fmt && *fmt)
            strcpy(format, fmt);
        memset(r + n, 0, sizeof(*r) * (IMCC_MAX_REGS - n));
#if 1
        debug(interpreter, DEBUG_PARSER,"%s %s\t%s\n", name, format, fullname);
#endif
        /* make the instruction */

        ins = _mk_instruction(name, format, r, dirs);
        ins->keys |= keyvec;
        /* fill iin oplib's info */
        ins->opnum = op;
        ins->opsize = op_info->arg_count;
        /* mark end as absolute branch */
        if (!strcmp(name, "end")) {
            ins->type |= ITBRANCH | IF_goto;
        }
        else if (!strcmp(name, "warningson")) {
            /* emit a debug seg, if this op is seen */
            PARROT_WARNINGS_on(interpreter, PARROT_WARNINGS_ALL_FLAG);
        }
        else if (!strcmp(name, "loadlib")) {
            SymReg *r1 = r[1];   /* lib name */
            STRING *lib = string_from_cstring(interpreter, r1->name + 1,
                strlen(r1->name) - 2);
            Parrot_load_lib(interpreter, lib, NULL);
        }
        /* set up branch flags */
        if (op_info->jump) {

            /* XXX: assume the jump is relative and to the last arg.
             * usually true - but not for ops, that throw an exception
             *
             * TODO mark labels in the ops files
             */
            if (op_info->jump & PARROT_JUMP_RESTART)
                ins->type = ITBRANCH;
            else if (n && (r[n-1]->set == 'I' || r[n-1]->type == VTADDRESS)
                    && strcmp(name, "find_lex")
                    && strcmp(name, "sleep")
                    )
                ins->type = ITBRANCH | (1 << (n-1));
            else
                ins->type = ITBRANCH;
            if (!strcmp(name, "branch"))
                ins->type |= IF_goto;
            if (!strcmp(fullname, "jump_i") ||
                    !strcmp(fullname, "jsr_i") ||
                    !strcmp(fullname, "branch_i") ||
                    !strcmp(fullname, "bsr_i"))
                dont_optimize = 1;
        }
        else if (!strcmp(name, "set") && n == 2) {
            /* set Px, Py: both PMCs have the same address */
            if (r[0]->set == 'P' && r[1]->set == 'P')
                ins->type |= ITALIAS;
        }
        else if (!strcmp(name, "set_addr")) {
            /* mark this as branch, because it needs fixup */
            ins->type = ITADDR | IF_r1_branch | ITBRANCH;
        }
        else if (!strcmp(name, "newsub")) {
            if (ins->opsize == 4)
                ins->type = ITADDR | IF_r2_branch | ITBRANCH;
            else
                ins->type = ITADDR | IF_r2_branch | IF_r3_branch | ITBRANCH;
        }
        else if (!strcmp(name, "compile"))
            ++has_compile;

        if (emit)
             emitb(unit, ins);
    } else {
        fataly(EX_SOFTWARE, sourcefile, line,"op not found '%s' (%s<%d>)\n",
                fullname, name, n);
    }
    return ins;
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
extern SymReg *cur_namespace; /* s. imcc.y */

static void *
imcc_compile(Parrot_Interp interp, const char *s)
{
    /* imcc always compiles to interp->code->byte_code
     * save old cs, make new
     */
    struct PackFile *pf_save = interp->code;
    struct PackFile *pf = PackFile_new(0);
    const char *source = sourcefile;
    char name[64];
#ifdef EVAL_TEST
    opcode_t *pc;
#endif

    cur_namespace = NULL;
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
    imc_compile_all_units(interp);
    emit_close(interp);

#ifdef EVAL_TEST
    pc = (opcode_t *) interp->code->byte_code;
    while (pc) {
        DO_OP(pc, interp);
    }
#endif
    PackFile_fixup_subs(interp);
    /* restore old byte_code, */
    (void)Parrot_switch_to_cs(interp, pf_save->cur_cs, 0);
    sourcefile = source;
    /* append new packfile to current directory */
    PackFile_add_segment(&interp->code->directory,
            &pf->directory.base);
    return pf;
}

static void *
imcc_compile_pasm(Parrot_Interp interp, const char *s)
{
    int pasm = pasm_file;
    void *pf;

    pasm_file = 1;
    expect_pasm = 0;
    pf = imcc_compile(interp, s);
    imc_cleanup(interp);
    pasm_file = pasm;
    return pf;
}

static void *
imcc_compile_pir (Parrot_Interp interp, const char *s)
{
    int pasm = pasm_file;
    void *pf;

    pasm_file = 0;
    expect_pasm = 0;
    pf = imcc_compile(interp, s);
    imc_cleanup(interp);
    pasm_file = pasm;
    return pf;
}


/*
 * Compile a file by filename (can be either PASM or IMCC code)
 */
static void *
imcc_compile_file (Parrot_Interp interp, const char *s)
{
    struct PackFile *pf_save = interp->code;
    struct PackFile *pf;
    const char *source = sourcefile;
    char *ext;
    int pasm = pasm_file;
    FILE *new;
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;
#define const_cast(b) (__ptr_u.__c_ptr = (b), __ptr_u.__ptr)

    if (!(new = fopen(s, "r"))) {
        fatal(1, "imcc_compile_file", "couldn't open '%s'\n", s);
        return NULL;
    }

#if IMC_TRACE
    fprintf(stderr, "parser_util.c: imcc_compile_file '%s'\n", s);
#endif

    cur_namespace = NULL;
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

    /* see imcc.l */
    compile_file(interp, new);
    imc_cleanup(interp);

    (void)Parrot_switch_to_cs(interp, pf_save->cur_cs, 0);
    sourcefile = source;
    pasm_file = pasm;
    fclose(new);
    return pf;
}

/* Register additional compilers with the interpreter */
void
register_compilers(Parrot_Interp interp)
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
 *      ge_n_ic_ic => ge_n_nc_ic
 */
int
try_find_op(Parrot_Interp interpreter, IMC_Unit * unit, char *name,
        SymReg ** r, int n, int keyvec, int emit)
{
    char fullname[64];
    SymReg *s;
    int changed = 0;
    /*
     * eq_str, eq_num => eq
     * ...
     */
    if (n == 3 && r[2]->type == VTADDRESS) {
        if (!strcmp(name, "eq_str") ||
                !strcmp(name, "eq_num")) {
            name = "eq";
            changed = 1;
        }
        else if (!strcmp(name, "ne_str") ||
                !strcmp(name, "ne_num")) {
            name = "ne";
            changed = 1;
        }
        else if (!strcmp(name, "le_str") ||
                !strcmp(name, "le_num")) {
            name = "le";
            changed = 1;
        }
        else if (!strcmp(name, "lt_str") ||
                !strcmp(name, "lt_num")) {
            name = "lt";
            changed = 1;
        }
        else if (!strcmp(name, "ge_str") ||
                !strcmp(name, "ge_num")) {
            name = "ge";
            changed = 1;
        }
        else if (!strcmp(name, "gt_str") ||
                !strcmp(name, "gt_num")) {
            name = "gt";
            changed = 1;
        }
    }
    else if (n == 3 &&
            (!strcmp(name, "cmp_str") ||
            !strcmp(name, "cmp_num"))) {
        name = "cmp";
        changed = 1;
    }
    /*
     * TODO handle eq_i_n_ic too
     */
    if (n == 3 && r[0]->set == 'N') {
        if (r[1]->set == 'I' && (r[2]->set == 'N' ||
                    (r[2]->type == VTADDRESS))) {
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
                INS(interpreter, unit, "set", NULL, rr, 2, 0, 1);
                r[1] = rr[0];
                changed = 1;
            }
        }
    }
    if (changed) {
        op_fullname(fullname, name, r, n, keyvec);
        return interpreter->op_lib->op_code(fullname, 1);
    }
    return -1;
}

Instruction *
multi_keyed(struct Parrot_Interp *interpreter, IMC_Unit * unit, char *name,
            SymReg ** r, int nr, int keyvec, int emit)
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
            /* don't emit LHS yet */
            if (i == 0) {
                nreg[0] = r[i];
                nreg[1] = r[i+1];
                nreg[2] = preg[n];
                /* set p_k px */
                ins = INS(interpreter, unit, str_dup("set"), 0, nreg, 3,KEY_BIT(1),0);
            }
            else {
                nreg[0] = preg[n];
                nreg[1] = r[i];
                nreg[2] = r[i+1];
                /* set py|z p_k */
                INS(interpreter, unit, str_dup("set"), 0, nreg, 3, KEY_BIT(2), 1);
            }
            i++;
        }
        /* non keyed */
        else {
            if (i == 0) {
                nreg[0] = r[i];
                nreg[1] = preg[n];
                /* set n, px */
                ins = INS(interpreter, unit, str_dup("set"), 0, nreg, 2, 0, 0);
            }
            else {
                nreg[0] = preg[n];
                nreg[1] = r[i];
                /* set px, n */
                INS(interpreter, unit, str_dup("set"), 0, nreg, 2, 0, 1);
            }
        }
    }
    /* make a new undef */
    iNEW(interpreter, unit, preg[0], str_dup("PerlUndef"), NULL, 1);
    /* emit the operand */
    INS(interpreter, unit, name, 0, preg, 3, 0, 1);
    /* emit the LHS op */
    emitb(unit, ins);
    return ins;
}

int
imcc_fprintf(FILE *fd, const char *fmt, ...)
{
    va_list ap;
    int len;

    va_start(ap, fmt);
    len = imcc_vfprintf(fd, fmt, ap);
    va_end(ap);
    return len;
}

int
imcc_vfprintf(FILE *fd, const char *format, va_list ap) {
    int len;
    const char *cp;
    const char *fmt;
    int ch, n;
    int _int;
    double _double;
    Instruction  *_ins;
    char *_string;
    char buf[128];

    for (len = 0, fmt = format ; ; ) {
        for (n = 0, cp = fmt; (ch = *fmt) && ch != '%'; fmt++)
            n++;
        /* print prev string */
        if (n) {
            fwrite(cp, 1, n, fd);
            len += n;
            continue;
        }
        /* finished? */
        if (!ch)
            break;
        /* ok, we got at format spec */
        ch = *++fmt;      /* % */
        if (ch == '%') {    /* print it */
            fwrite(fmt, 1, 1, fd);
            len += 1;
            ++fmt;
            continue;
        }
        /* look for end of format spec */
        for ( ; ch && strchr("diouxXeEfFgGcspI", ch) == NULL; ch = *++fmt)
            ;
        if (!ch) {
            /* no fatal here, else we get recursion */
            fprintf(stderr, "illegal format at %s\n", cp);
            exit(1);
        }
        /* ok, we have a valid format char */
        ++fmt;
        switch (ch) {
            case 'd':
            case 'i':
            case 'o':
            case 'u':
            case 'x':
            case 'X':
            case 'p':
            case 'c':
                _int = va_arg(ap, int);
                memcpy(buf, cp, n = (fmt - cp));
                buf[n] = '\0';
                len += fprintf(fd, buf, _int);
                break;
            case 'e':
            case 'E':
            case 'f':
            case 'F':
            case 'g':
            case 'G':
                _double = va_arg(ap, double);
                memcpy(buf, cp, n = (fmt - cp));
                buf[n] = '\0';
                len += fprintf(fd, buf, _double);
                break;
            case 's':
                _string = va_arg(ap, char *);
                memcpy(buf, cp, n = (fmt - cp));
                assert(n<128);
                buf[n] = '\0';
                len += fprintf(fd, buf, _string);
                break;
            /* this is the reason for the whole mess */
            case 'I':
                _ins = va_arg(ap, Instruction *);
                len += fprintf(fd, "%s ", _ins->op);
                len += ins_print(fd, _ins);
                break;
        }
    }
    return len;
}

/*
 * Utility functions
 */

char *
str_dup(const char * old)
{
    char * copy = (char *)malloc(strlen(old) + 1);
    if (copy == NULL) {
        fatal(1, "str_dup", "Out of mem\n");
    }
    strcpy(copy, old);
#ifdef MEMDEBUG
    debug(interpreter, 1,"line %d str_dup %s [%x]\n", line, old, copy);
#endif
    return copy;
}

char *
str_cat(const char * s1, const char * s2)
{
    int len = strlen(s1) + strlen(s2) + 1;
    char * s3 = malloc(len);
    if (s3 == NULL) {
        fatal(1, "str_cat", "Out of mem\n");
    }
    strcpy(s3, s1);
    strcat(s3, s2);
    return s3;
}


void
imcc_init(Parrot_Interp interpreter)
{
    interpreter->imc_info = mem_sys_allocate_zeroed(sizeof(imc_info_t));
    /* register PASM and PIR compilers to parrot core */
    register_compilers(interpreter);
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
