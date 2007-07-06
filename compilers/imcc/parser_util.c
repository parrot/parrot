/*
 * parser_util.c
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 * Copyright (C) 2002-2007, The Perl Foundation.
 *
 * parser support functions
 *
 * $Id$
 *
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define _PARSER

#include "imc.h"
#include "parrot/dynext.h"
#include "parrot/embed.h"
#include "parrot/builtin.h"
#include "pbc.h"
#include "parser.h"
#include "optimizer.h"

/* HEADERIZER HFILE: compilers/imcc/imc.h */

/* HEADERIZER BEGIN: static */

static int change_op( Interp *interp /*NN*/,
    IMC_Unit *unit,
    SymReg **r /*NN*/,
    int num,
    int emit )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

static void * imcc_compile_file( Interp *interp /*NN*/,
    const char *fullname /*NN*/,
    STRING **error_message /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static int is_infix( const char *name /*NN*/, int n, SymReg **r /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

static Instruction * maybe_builtin( Interp *interp /*NN*/,
    IMC_Unit *unit,
    const char *name /*NN*/,
    SymReg **r,
    int n )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static const char * to_infix( Interp *interp /*NN*/,
    const char *name /*NN*/,
    SymReg **r /*NN*/,
    int *n /*NN*/,
    int mmd_op )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__warn_unused_result__;

static const char * try_rev_cmp( Interp *interp,
    IMC_Unit * unit,
    const char *name,
    SymReg ** r );

static Instruction * var_arg_ins( Interp *interp /*NN*/,
    IMC_Unit * unit,
    const char *name /*NN*/,
    SymReg **r /*NN*/,
    int n,
    int emit )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__warn_unused_result__;

/* HEADERIZER END: static */

/*
 * FIXME:
 *
 * used in -D20 to print files with the output of every PIR compilation
 * this can't be attached to the interpreter or packfile because it has to be
 * absolutely global to prevent the files from being overwritten.
 *
 * This is not thread safe as is. A mutex needs to be added.
 *
 * See RT#40010 for more discussion.
 */
static INTVAL eval_nr = 0;

/*
 * P = new type, [init]
 * PASM like:
 *   new P, .SomeThing
 * is done in the lexer, this is a mess
 * best would be to have a flag in core.ops, where a PMC type is expected
 */
Instruction *
iNEW(Interp *interp, IMC_Unit *unit, SymReg *r0,
        char *type, SymReg *init, int emit)
{
    char fmt[256];
    SymReg *regs[3];
    SymReg *pmc;
    int nargs;
    const int pmc_num = pmc_type(interp,
            string_from_cstring(interp, *type == '.' ?type+1:type, 0));

    sprintf(fmt, "%d", pmc_num);
    pmc = mk_const(interp, str_dup(fmt), 'I');

    if (pmc_num <= 0)
        IMCC_fataly(interp, E_SyntaxError,
                "Unknown PMC type '%s'\n", type);
    sprintf(fmt, "%%s, %d\t # .%s", pmc_num, type);
    r0->usage |= U_NEW;
    if (!strcmp(type, "Hash"))
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
    return INS(interp, unit, "new", fmt, regs, nargs,0, emit);
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
op_fullname(char *dest /*NN*/, const char *name /*NN*/, SymReg * args[],
        int narg, int keyvec)
{
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
            if (args[i]->set=='S' || args[i]->set=='N' || args[i]->set=='K') {
                *dest++ = 'c';
                continue;
            }
            else if (args[i]->set == 'P')
                continue;
        }
        if (args[i]->set == 'K')
            *dest++ = 'p';
        else
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

/*
 * Return opcode value for op name
 */
int
check_op(Interp *interp /*NN*/, char *fullname /*NN*/,
        const char *name, SymReg *r[], int narg, int keyvec)
{
    int op;

    op_fullname(fullname, name, r, narg, keyvec);
    op = interp->op_lib->op_code(fullname, 1);
    return op;
}

static Instruction *
maybe_builtin(Interp *interp /*NN*/, SHIM(IMC_Unit *unit), const char *name /*NN*/,
        SymReg **r, int n)
{
    Instruction *ins;
    char sig[16];
    int i, bi, is_class_meth;
    SymReg *sub, *meth, *rr[10];
    int first_arg, is_void;

    assert(n < 15);
    for (i = 0; i < n; ++i) {
        sig[i] = r[i]->set;
        rr[i] = r[i];
    }
    sig[i] = '\0';
    bi = Parrot_is_builtin(name, sig);
    if (bi < 0)
        return NULL;
    /*
     * create a method see imcc.y target = sub_call
     * cos Px, Py  => Px = Py.cos()
     */
    is_class_meth = Parrot_builtin_is_class_method(bi);
    is_void = Parrot_builtin_is_void(bi);
    meth = mk_sub_address(interp, str_dup(name)); /* XXX Memory leak on name! */
    if (is_class_meth) {    /* ParrotIO.open() */
        const char * const ns = Parrot_builtin_get_c_namespace(bi);
        SymReg * const ns_sym = mk_const(interp, str_dup(ns), 'S');

        ins = IMCC_create_itcall_label(interp);
        sub = ins->r[0];
        IMCC_itcall_sub(interp, meth);
        sub->pcc_sub->object = ns_sym;

        first_arg = 1;
    }
    else {    /* method y = x."cos"() */
        ins = IMCC_create_itcall_label(interp);
        sub = ins->r[0];
        IMCC_itcall_sub(interp, meth);
        sub->pcc_sub->object = rr[is_void ? 0 : 1];
        first_arg = 2;
    }
    sub->pcc_sub->flags |= isNCI;
    if (is_void)
        first_arg--;
    for (i = first_arg; i < n; ++i) {
        add_pcc_arg(sub, rr[i]);
    }
    if (!is_void)
        add_pcc_result(sub, rr[0]);
    return ins;
}

/*
 * Is instruction a parrot opcode?
 */
int
is_op(Interp *interp /*NN*/, const char *name)
{
    int (*op_lookup)(const char *, int full) =
        interp->op_lib->op_code;
    return op_lookup(name, 0) >= 0
        || op_lookup(name, 1) >= 0
        || ((name[0] == 'n' && name[1] == '_')
                && (op_lookup(name + 2, 0) >= 0
                   || op_lookup(name + 2, 1) >= 0))
        || Parrot_is_builtin(name, NULL) >= 0;
}

/* sub x, y, z  => infix .MMD_SUBTRACT, x, y, z */
static const char *
to_infix(Interp *interp /*NN*/, const char *name /*NN*/, SymReg **r /*NN*/,
        int *n /*NN*/, int mmd_op)
    /* WARN_UNUSED */
{
    SymReg *mmd;
    int is_n;

    assert(*n >= 2);
    is_n = (IMCC_INFO(interp)->state->pragmas & PR_N_OPERATORS) ||
        (name[0] == 'n' && name[1] == '_') ||
        (mmd_op == MMD_LOR || mmd_op == MMD_LAND || mmd_op == MMD_LXOR);
    if (*n == 3 && r[0] == r[1] && !is_n) {       /* cvt to inplace */
        char buf[10];
        sprintf(buf, "%d", mmd_op + 1);  /* XXX */
        mmd = mk_const(interp, str_dup(buf), 'I');
    }
    else {
        char buf[10];
        int i;
        for (i = *n; i > 0; --i)
            r[i] = r[i - 1];
        sprintf(buf, "%d", *n == 2 ? (mmd_op + 1) : mmd_op);  /* XXX */
        mmd = mk_const(interp, str_dup(buf), 'I');
        (*n)++;
    }
    r[0] = mmd;
    if (is_n && *n == 4)
        return "n_infix";
    else
        return "infix";
}

static int
is_infix(const char *name /*NN*/, int n, SymReg **r /*NN*/)
    /* WARN_UNUSED */
{
    if (n < 2 || r[0]->set != 'P')
        return -1;
    /* TODO use a generic Parrot interface function,
     *      which handles user infix extensions too
     */
    if (strcmp(name, "add") == 0)
        return MMD_ADD;
    if (strcmp(name, "sub") == 0)
        return MMD_SUBTRACT;
    if (strcmp(name, "mul") == 0)
        return MMD_MULTIPLY;
    if (strcmp(name, "div") == 0)
        return MMD_DIVIDE;
    if (strcmp(name, "fdiv") == 0)
        return MMD_FLOOR_DIVIDE;
    if (strcmp(name, "mod") == 0)
        return MMD_MOD;
    if (strcmp(name, "cmod") == 0)
        return MMD_CMOD;
    if (strcmp(name, "pow") == 0)
        return MMD_POW;

    if (strcmp(name, "bor") == 0)
        return MMD_BOR;
    if (strcmp(name, "band") == 0)
        return MMD_BAND;
    if (strcmp(name, "bxor") == 0)
        return MMD_BXOR;
    if (strcmp(name, "bors") == 0)
        return MMD_SOR;
    if (strcmp(name, "bands") == 0)
        return MMD_SAND;
    if (strcmp(name, "bxors") == 0)
        return MMD_SXOR;

    if (strcmp(name, "shl") == 0)
        return MMD_BSL;
    if (strcmp(name, "shr") == 0)
        return MMD_BSR;
    if (strcmp(name, "lsr") == 0)
        return MMD_LSR;

    if (strcmp(name, "concat") == 0)
        return MMD_CONCAT;
    if (strcmp(name, "repeat") == 0)
        return MMD_REPEAT;

    if (strcmp(name, "or") == 0)
        return MMD_LOR;
    if (strcmp(name, "and") == 0)
        return MMD_LAND;
    if (strcmp(name, "xor") == 0)
        return MMD_LXOR;
    /* now try n_<op> */
    if (name[0] == 'n' && name[1] == '_')
        return is_infix(name + 2, n, r);
    return -1;
}

static Instruction *
var_arg_ins(Interp *interp /*NN*/, IMC_Unit * unit, const char *name /*NN*/,
        SymReg **r /*NN*/, int n, int emit)
    /* WARN_UNUSED */
{
    int op;
    Instruction *ins;
    int dirs;
    char fullname[64];

    r[0] = mk_const(interp, str_dup(r[0]->name), 'P');
    r[0]->pmc_type = enum_class_FixedIntegerArray;
    dirs = 1;           /* in constant */
    op_fullname(fullname, name, r, 1, 0);
    op = interp->op_lib->op_code(fullname, 1);
    assert(op >= 0);

    ins = _mk_instruction(name, "", n, r, dirs);
    ins->opnum = op;
    ins->opsize = n + 1;

    if (emit)
        emitb(interp, unit, ins);
    return ins;
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
INS(Interp *interp /*NN*/, IMC_Unit * unit, const char *name /*NN*/,
        const char *fmt, SymReg **r, int n, int keyvec, int emit)
{
    char fullname[64];
    int i;
    int dirs = 0;
    int op;
    Instruction * ins;
    op_info_t * op_info;
    char format[128], buf[10];
    int len;

    if ((strcmp(name, "set_args") == 0) ||
        (strcmp(name, "get_results") == 0) ||
        (strcmp(name, "get_params") == 0) ||
        (strcmp(name, "set_returns") == 0)) {
        return var_arg_ins(interp, unit, name, r, n, emit);
    }
    if ((op = is_infix(name, n, r)) >= 0) {
        /* sub x, y, z  => infix .MMD_SUBTRACT, x, y, z */
        name = to_infix(interp, name, r, &n, op);
    }
    else if ((IMCC_INFO(interp)->state->pragmas & PR_N_OPERATORS) &&
            ((strcmp(name, "abs") == 0) ||
             (strcmp(name, "neg") == 0) ||
             (strcmp(name, "not") == 0) ||
             (strcmp(name, "bnot") == 0) ||
             (strcmp(name, "bnots") == 0))) {
        strcpy(buf, "n_");
        strcat(buf, name);
        name = buf;
    }


#if 0
    ins = multi_keyed(interp, unit, name, r, n, keyvec, emit);
    if (ins)
        return ins;
#endif
    op_fullname(fullname, name, r, n, keyvec);
    op = interp->op_lib->op_code(fullname, 1);
    if (op < 0)         /* maybe we got a fullname */
        op = interp->op_lib->op_code(name, 1);
    if (op < 0) {         /* still wrong, try reverse compare */
        const char * const n_name = try_rev_cmp(interp, unit, name, r);
        if (n_name) {
            DECL_CONST_CAST;
            name = const_cast(n_name);
            op_fullname(fullname, name, r, n, keyvec);
            op = interp->op_lib->op_code(fullname, 1);
        }
    }
    if (op < 0)         /* still wrong, try to find an existing op */
        op = try_find_op(interp, unit, name, r, n, keyvec, emit);
    if (op < 0) {
        int ok;
        /* check mixed constants */
        ins = IMCC_subst_constants_umix(interp, unit, name, r, n + 1);
        if (ins)
            goto found_ins;
        /* and finally multiple constants */
        ins = IMCC_subst_constants(interp, unit, name, r, n + 1, &ok);
        if (ok) {
            if (ins)
                goto found_ins;
            else
                return NULL;
        }
    }
    else
        strcpy(fullname, name);
    if (op < 0 && emit) {
        ins = maybe_builtin(interp, unit, name, r, n);
        if (ins)
            return ins;
    }
    if (op < 0) {
        IMCC_fataly(interp, E_SyntaxError,
                    "The opcode '%s' (%s<%d>) was not found. "
                    "Check the type and number of the arguments",
                    fullname, name, n);
    }
    op_info = &interp->op_info_table[op];

    *format = '\0';
    /* info->op_count is args + 1
     * build instruction format
     * set LV_in / out flags */
    if (n != op_info->op_count-1)
        IMCC_fataly(interp, E_SyntaxError,
                "arg count mismatch: op #%d '%s' needs %d given %d",
                op, fullname, op_info->op_count-1, n);
    for (i = 0; i < n; i++) {
        switch (op_info->dirs[i]) {
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
        else if (r[i]->set == 'K')
            strcat(format, "[%s], ");
        else
            strcat(format, "%s, ");
    }
    len = strlen(format);
    if (len >= 2)
        len -= 2;
    format[len] = '\0';
    if (fmt && *fmt) {
        strncpy(format, fmt, sizeof(format) - 1);
        format[sizeof(format) - 1] = '\0';
    }
#if 1
    IMCC_debug(interp, DEBUG_PARSER,"%s %s\t%s\n", name, format, fullname);
#endif
    /* make the instruction */

    ins = _mk_instruction(name, format, n, r, dirs);
    ins->keys |= keyvec;
    /* fill in oplib's info */
    ins->opnum = op;
    ins->opsize = n + 1;
    /* mark end as absolute branch */
    if (!strcmp(name, "end") || !strcmp(name, "ret")) {
        ins->type |= ITBRANCH | IF_goto;
    }
    else if (!strcmp(name, "warningson")) {
        /* emit a debug seg, if this op is seen */
        PARROT_WARNINGS_on(interp, PARROT_WARNINGS_ALL_FLAG);
    }
    else if (!strcmp(name, "yield")) {
        IMCC_INFO(interp)->cur_unit->instructions->r[0]->pcc_sub->calls_a_sub |= 1 |ITPCCYIELD;
    }
    else if (!strncmp(name, "invoke", 6) ||
            !strncmp(name, "callmethod", 10)) {
        if (IMCC_INFO(interp)->cur_unit->type & IMC_PCCSUB)
            IMCC_INFO(interp)->cur_unit->instructions->r[0]->pcc_sub->calls_a_sub |= 1;
    }
    /* set up branch flags */
    /*
     * mark registers that are labels
     */
    for (i = 0; i < op_info->op_count-1; i++) {
        if (op_info->labels[i])
            ins->type |= ITBRANCH | (1 << i);
        else {
            if (r[i]->type == VTADDRESS)
                IMCC_fataly(interp, E_SyntaxError,
                        "undefined identifier '%s'\n", r[i]->name);
        }
    }
    if (op_info->jump && op_info->jump != PARROT_JUMP_ENEXT) {
        ins->type |= ITBRANCH;
        /* TODO use opnum constants */
        if (!strcmp(name, "branch") ||
            !strcmp(name, "tailcall") ||
            !strcmp(name, "returncc"))
            ins->type |= IF_goto;
        else if (!strcmp(fullname, "jump_i") ||
                !strcmp(fullname, "jsr_i") ||
                !strcmp(fullname, "branch_i") ||
                !strcmp(fullname, "bsr_i"))
            IMCC_INFO(interp)->dont_optimize = 1;
    }
    else if (!strcmp(name, "set") && n == 2) {
        /* set Px, Py: both PMCs have the same address */
        if (r[0]->set == r[1]->set &&
                (r[1]->type & VTREGISTER))
            ins->type |= ITALIAS;
    }
    else if (!strcmp(name, "compile"))
        ++IMCC_INFO(interp)->has_compile;
found_ins:
    if (emit)
        emitb(interp, unit, ins);
    return ins;
}

/* PMC *imcc_compile(interp*, const char*)
 *
 * compile a pasm or imcc string
 *
 * FIXME as we have separate constants, the old constants in ghash must
 *       be deleted.
 *
 */
extern void* yy_scan_string(const char *);

PARROT_API
int
do_yylex_init(Interp* interp, yyscan_t* yyscanner /*NN*/)
{
    const int retval = yylex_init(yyscanner);
    /* This way we can get the interpreter via yyscanner */
    if (!retval)
        yyset_extra(interp, *yyscanner);

    return retval;
}

PMC *
imcc_compile(Interp *interp /*NN*/, const char *s /*NN*/, int pasm_file,
             STRING **error_message /*NN*/)
{
    /* imcc always compiles to interp->code
     * save old cs, make new
     */
    char name[64];
    PackFile_ByteCode *old_cs, *new_cs;
    PMC *sub=NULL;
    struct _imc_info_t *imc_info = NULL;
    struct parser_state_t *next;
    DECL_CONST_CAST;
    INTVAL regs_used[4] = {3,3,3,3};
    void *yyscanner;

    do_yylex_init( interp, &yyscanner );

    /*
     * we create not yet anchored PMCs - e.g. Subs: turn off DOD
     */
    Parrot_block_DOD(interp);
    if (IMCC_INFO(interp)->last_unit) {
        /* got a reentrant compile */
        imc_info = mem_sys_allocate_zeroed(sizeof (imc_info_t));
        imc_info->ghash = IMCC_INFO(interp)->ghash;
        imc_info->prev = IMCC_INFO(interp);
        IMCC_INFO(interp) = imc_info;
    }

    sprintf(name, "EVAL_" INTVAL_FMT, ++eval_nr);
    new_cs = PF_create_default_segs(interp, name, 0);
    old_cs = Parrot_switch_to_cs(interp, new_cs, 0);
    IMCC_INFO(interp)->cur_namespace = NULL;
    /* spit out the sourcefile */
    if (Interp_debug_TEST(interp, PARROT_EVAL_DEBUG_FLAG)) {
        FILE * const fp = fopen(name, "w");
        if (fp) {
            fputs(s, fp);
            fclose(fp);
        }
    }
    IMCC_push_parser_state(interp);
    next = IMCC_INFO(interp)->state->next;
    if (imc_info)
        IMCC_INFO(interp)->state->next = NULL;
    IMCC_INFO(interp)->state->pasm_file = pasm_file;
    IMCC_INFO(interp)->state->file = name;
    IMCC_INFO(interp)->expect_pasm = 0;
    Parrot_push_context(interp, regs_used);

    compile_string(interp, const_cast(s), yyscanner);

    Parrot_pop_context(interp);
    /*
     * compile_string NULLifies frames->next, so that yywrap
     * doesn't try to continue compiling the previous buffer
     * This OTOH prevents pop_parser-state ->
     *
     * set next here and pop
     */
    IMCC_INFO(interp)->state->next = next;
    IMCC_pop_parser_state(interp, yyscanner);

    if (!IMCC_INFO(interp)->error_code) {
        Parrot_sub *sub_data;

        sub = pmc_new(interp, enum_class_Eval);
        PackFile_fixup_subs(interp, PBC_MAIN, sub);
        if (old_cs) {
            /* restore old byte_code, */
            (void)Parrot_switch_to_cs(interp, old_cs, 0);
        }

        /*
         * create sub PMC
         *
         * TODO if a sub was denoted :main return that instead
         */
        sub_data = PMC_sub(sub);
        sub_data->seg = new_cs;
        sub_data->start_offs = 0;
        sub_data->end_offs = new_cs->base.size;
        sub_data->name = string_from_cstring(interp, name, 0);
    }
    else {
        *error_message = IMCC_INFO(interp)->error_message;
    }

    if (imc_info) {
        IMCC_INFO(interp) = imc_info->prev;
        mem_sys_free(imc_info);
        imc_info = IMCC_INFO(interp);
        IMCC_INFO(interp)->cur_unit = imc_info->last_unit;
        IMCC_INFO(interp)->cur_namespace = imc_info->cur_namespace;
    }
    else
        imc_cleanup(interp, yyscanner);
    Parrot_unblock_DOD(interp);

    yylex_destroy( yyscanner );
    return sub;
}

/*
 * Note: This function is provided for backward compatibility. This
 * function can go away in future.
 */
PMC *
imcc_compile_pasm(Interp *interp /*NN*/, const char *s /*NN*/)
{
    STRING *error_message;
    return imcc_compile(interp, s, 1, &error_message);
}

/*
 * Note: This function is provided for backward compatibility. This
 * function can go away in future.
 */
PMC *
imcc_compile_pir(Interp *interp /*NN*/, const char *s /*NN*/)
{
    STRING *error_message;
    return imcc_compile(interp, s, 0, &error_message);
}

PMC *
IMCC_compile_pir_s(Interp *interp /*NN*/, const char *s /*NN*/,
                   STRING **error_message /*NN*/)
{
    return imcc_compile(interp, s, 0, error_message);
}

PMC *
IMCC_compile_pasm_s(Interp *interp /*NN*/, const char *s /*NN*/,
                    STRING **error_message /*NN*/)
{
    return imcc_compile(interp, s, 1, error_message);
}

PMC *
imcc_compile_pasm_ex(Interp *interp /*NN*/, const char *s /*NN*/)
{
    STRING *error_message;

    PMC * const sub = imcc_compile(interp, s, 1, &error_message);
    if (sub == NULL ) {
        char * const error_str = string_to_cstring(interp, error_message);
        real_exception(interp, NULL, E_Exception, error_str);
        string_cstring_free(error_str);
    }
    return sub;
}

PMC *
imcc_compile_pir_ex(Interp *interp /*NN*/, const char *s /*NN*/)
{
    STRING *error_message;

    PMC * const sub = imcc_compile(interp, s, 0, &error_message);
    if (sub == NULL) {
        char * const  error_str = string_to_cstring(interp, error_message);
        real_exception(interp, NULL, E_Exception, error_str);
        string_cstring_free(error_str);
    }
    return sub;
}

/*
 * Compile a file by filename (can be either PASM or IMCC code)
 */
static void *
imcc_compile_file(Interp *interp /*NN*/, const char *fullname /*NN*/,
                   STRING **error_message /*NN*/)
{
    PackFile_ByteCode * const cs_save = interp->code;
    PackFile_ByteCode *cs=NULL;
    const char *ext;
    FILE *fp;
    struct _imc_info_t *imc_info = NULL;
    STRING *fs;
    /* need at least 3 regs for compilation of constant math e.g.
     * add_i_ic_ic - see also IMCC_subst_constants()
     */
    INTVAL regs_used[4] = {3,3,3,3};

    if (IMCC_INFO(interp)->last_unit) {
        /* got a reentrant compile */
        imc_info = mem_sys_allocate_zeroed(sizeof (imc_info_t));
        imc_info->ghash = IMCC_INFO(interp)->ghash;
        imc_info->prev = IMCC_INFO(interp);
        IMCC_INFO(interp) = imc_info;
    }

    fs = string_make(interp, fullname, strlen(fullname), NULL, 0);
    if (Parrot_stat_info_intval(interp, fs, STAT_ISDIR)) {
        real_exception(interp, NULL, E_IOError,
                "imcc_compile_file: '%s' is a directory\n", fullname);
        return NULL;
    }

    if (!(fp = fopen(fullname, "r"))) {
        IMCC_fatal(interp, E_IOError,
                "imcc_compile_file: couldn't open '%s'\n", fullname);
        return NULL;
    }

#if IMC_TRACE
    fprintf(stderr, "parser_util.c: imcc_compile_file '%s'\n", fullname);
#endif

    IMCC_INFO(interp)->cur_namespace = NULL;
    interp->code = NULL;

    IMCC_push_parser_state(interp);
    IMCC_INFO(interp)->state->file = fullname;
    ext = strrchr(fullname, '.');
    IMCC_INFO(interp)->line = 1;
    /*
     * the string_compare() called from pmc_type() triggers DOD
     * which can destroy packfiles under construction
     */
    Parrot_block_DOD(interp);
    Parrot_push_context(interp, regs_used);

    if (ext && strcmp(ext, ".pasm") == 0) {
        void *yyscanner;
        do_yylex_init( interp, &yyscanner );


        IMCC_INFO(interp)->state->pasm_file = 1;
        /* see imcc.l */
        compile_file(interp, fp, yyscanner);

        yylex_destroy( yyscanner );
    }
    else {
        void *yyscanner;
        do_yylex_init( interp, &yyscanner );

        IMCC_INFO(interp)->state->pasm_file = 0;
        compile_file(interp, fp, yyscanner);

        yylex_destroy( yyscanner );
    }
    Parrot_unblock_DOD(interp);
    Parrot_pop_context(interp);

    imc_cleanup(interp, NULL);
    fclose(fp);

    if (!IMCC_INFO(interp)->error_code)
        cs = interp->code;
    else
        *error_message = IMCC_INFO(interp)->error_message;

    if (cs_save)
        (void)Parrot_switch_to_cs(interp, cs_save, 0);

    if (imc_info) {
        IMCC_INFO(interp) = imc_info->prev;
        mem_sys_free(imc_info);
    }
    return cs;
}

/*
 * Note: This function is provided for backward compatibility. This
 * function can go away in future.
 */
void *
IMCC_compile_file(Interp *interp /*NN*/, const char *s /*NN*/)
{
    STRING *error_message;
    return imcc_compile_file(interp, s, &error_message);
}

void *
IMCC_compile_file_s(Interp *interp /*NN*/, const char *s /*NN*/,
                   STRING **error_message /*NN*/)
{
    return imcc_compile_file(interp, s , error_message);
}

/* Register additional compilers with the interpreter */
void
register_compilers(Interp *interp /*NN*/)
{
    Parrot_compreg(interp, const_string(interp, "PASM"), imcc_compile_pasm_ex);
    Parrot_compreg(interp, const_string(interp, "PIR"), imcc_compile_pir_ex);
    /* It looks like this isn't used anywhere yet */
    /* TODO: return a Eval PMc, instead of a packfile */
    /* Parrot_compreg(interp,
                      const_string(interp, "FILE"),
                      imcc_compile_file ); */
}

static int
change_op(Interp *interp /*NN*/, IMC_Unit *unit, SymReg **r /*NN*/, int num, int emit)
    /* WARN_UNUSED */
{
    int changed = 0;

    if (r[num]->type & (VTCONST|VT_CONSTP)) {
        /* make a number const */
        SymReg *c = r[num];
        SymReg *s;
        if (c->type & VT_CONSTP)
            c = c->reg;
        s = mk_const(interp, str_dup(c->name), 'N');
        r[num] = s;
        changed = 1;
    }
    else
        if (emit) {
            /* emit
            *   set $N0, Iy
            *   op  Nx, $N0
            * or
            *   op  Nx, ..., $N0
            */
            SymReg *rr[2];

            rr[0] = mk_temp_reg(interp, 'N');
            rr[1] = r[num];
            INS(interp, unit, "set", NULL, rr, 2, 0, 1);
            r[num] = rr[0];
            changed = 1;
            /* need to allocate the temp - run reg_alloc */
            IMCC_INFO(interp)->optimizer_level |= OPT_PASM;
        }
    return changed;
}

/*
 * Try to find valid op doing the same operation
 *
 * e.g. add_n_i_n => add_n_n_i
 *      div_n_ic_n => div_n_nc_n
 *      div_n_i_n => set_n_i ; div_n_n_n
 *      ge_n_ic_ic => ge_n_nc_ic
 *      acos_n_i   => acos_n_n
 */
int
try_find_op(Interp *interp /*NN*/, IMC_Unit * unit, const char *name /*NN*/,
        SymReg ** r, int n, int keyvec, int emit)
    /* WARN_UNUSED */
{
    char fullname[64];
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
    if (n == 3 && r[0]->set == 'N') {
        if (r[1]->set == 'I') {
            const SymReg * const r1 = r[1];
            changed |= change_op(interp, unit, r, 1, emit);
            /* op Nx, Iy, Iy: reuse generated temp Nz */
            if (r[2]->set == 'I' && r[2]->type != VTADDRESS &&
                    r[2] == r1)
                r[2] = r[1];
        }
        if (r[2]->set == 'I' && r[2]->type != VTADDRESS) {
            changed |= change_op(interp, unit, r, 2, emit);
        }
    }
    /*
     * handle eq_i_n_ic
     */
    else if (n == 3 && r[1]->set == 'N' && r[0]->set == 'I' &&
            r[2]->type == VTADDRESS) {
        changed |= change_op(interp, unit, r, 0, emit);
    }
    else if (n == 2 && r[0]->set == 'N' && r[1]->set == 'I') {
        /*
         * transcendentals  e.g. acos N, I
         */
        if (strcmp(name, "fact"))
            changed = change_op(interp, unit, r, 1, emit);
    }
    if (changed) {
        op_fullname(fullname, name, r, n, keyvec);
        return interp->op_lib->op_code(fullname, 1);
    }
    return -1;
}

static const char *
try_rev_cmp(SHIM_INTERP, SHIM(IMC_Unit * unit), const char *name,
        SymReg ** r)
{
    static struct br_pairs {
        const char *op;
        const char *nop;
        int to_swap;
    } br_pairs[] = {
        { "gt", "lt", 0 },
        { "ge", "le", 0 },
        { "isgt", "islt", 1 },
        { "isge", "isle", 1 },
    };
    unsigned int i;

    for (i = 0; i < N_ELEMENTS(br_pairs); i++) {
        if (strcmp(name, br_pairs[i].op) == 0) {
            const int to_swap =  br_pairs[i].to_swap;
            SymReg *t;

            if (r[to_swap + 1]->set == 'P')
                return NULL;
            t = r[to_swap];
            r[to_swap] = r[to_swap + 1];
            r[to_swap + 1] = t;
            return br_pairs[i].nop;
        }
    }
    return NULL;
}

Instruction *
multi_keyed(Interp *interp, IMC_Unit * unit, char *name,
            SymReg ** r, int nr, int keyvec, int emit)
{
    int i, keyf, kv, n;
    char buf[16];
    static int p = 0;
    SymReg *preg[3];    /* px,py,pz */
    SymReg *nreg[3];
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
    UNUSED(emit);
    /* OP  _p_k    _p_k_p_k =>
     * set      py, p_k
     * set      pz,     p_k
     * new px, .Undef
     * OP  px, py, pz
     * set _p_k_px
     */

    kv = keyvec;
    for (i = n = 0; i < nr; i++, kv >>= 1, n++) {
        if (kv & 1) {
            IMCC_fataly(interp, E_SyntaxError,
                "illegal key operand\n");
        }
        /* make a new P symbol */
        while (1) {
            sprintf(buf, "$P%d", ++p);
            if (get_sym(interp, buf) == 0)
                break;
        }
        preg[n] = mk_symreg(interp, str_dup(buf), 'P');
        kv >>= 1;
        if (kv & 1) {
            /* we have a keyed operand */
            if (r[i]->set != 'P') {
                IMCC_fataly(interp, E_SyntaxError,
                    "not an aggregate\n");
            }
            /* don't emit LHS yet */
            if (i == 0) {
                nreg[0] = r[i];
                nreg[1] = r[i+1];
                nreg[2] = preg[n];
                /* set p_k px */
                ins = INS(interp, unit, str_dup("set"),
                          0, nreg, 3,KEY_BIT(1),0);
            }
            else {
                nreg[0] = preg[n];
                nreg[1] = r[i];
                nreg[2] = r[i+1];
                /* set py|z p_k */
                INS(interp, unit, str_dup("set"),
                    0, nreg, 3, KEY_BIT(2), 1);
            }
            i++;
        }
        /* non keyed */
        else {
            if (i == 0) {
                nreg[0] = r[i];
                nreg[1] = preg[n];
                /* set n, px */
                ins = INS(interp, unit, str_dup("set"),
                          0, nreg, 2, 0, 0);
            }
            else {
                nreg[0] = preg[n];
                nreg[1] = r[i];
                /* set px, n */
                INS(interp, unit, str_dup("set"),
                    0, nreg, 2, 0, 1);
            }
        }
    }
    /* make a new undef */
    iNEW(interp, unit, preg[0], str_dup("Undef"), NULL, 1);
    /* emit the operand */
    INS(interp, unit, name, 0, preg, 3, 0, 1);
    /* emit the LHS op */
    emitb(interp, unit, ins);
    return ins;
}

int
imcc_fprintf(Interp *interp /*NN*/, FILE *fd /*NN*/, const char *fmt /*NN*/, ...)
{
    va_list ap;
    int len;

    va_start(ap, fmt);
    len = imcc_vfprintf(interp, fd, fmt, ap);
    va_end(ap);
    return len;
}

int
imcc_vfprintf(Interp *interp /*NN*/, FILE *fd /*NN*/, const char *format /*NN*/, va_list ap)
{
    int len;
    const char *cp;
    const char *fmt;
    char buf[128];

    for (len = 0, fmt = format ; ; ) {
        int ch, n;

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
                {
                const int _int = va_arg(ap, int);
                memcpy(buf, cp, n = (fmt - cp));
                buf[n] = '\0';
                len += fprintf(fd, buf, _int);
                }
                break;
            case 'e':
            case 'E':
            case 'f':
            case 'F':
            case 'g':
            case 'G':
                {
                const double _double = va_arg(ap, double);
                memcpy(buf, cp, n = (fmt - cp));
                buf[n] = '\0';
                len += fprintf(fd, buf, _double);
                }
                break;
            case 's':
                {
                const char * const _string = va_arg(ap, char *);
                memcpy(buf, cp, n = (fmt - cp));
                assert(n<128);
                buf[n] = '\0';
                len += fprintf(fd, buf, _string);
                }
                break;
            /* this is the reason for the whole mess */
            case 'I':
                {
                Instruction * const _ins = va_arg(ap, Instruction *);
                len += fprintf(fd, "%s ", _ins->op);
                len += ins_print(interp, fd, _ins);
                }
                break;
        }
    }
    return len;
}

/*
 * Utility functions
 */

char *
str_dup(const char *old /*NN*/)
    /* MALLOC, WARN_UNUSED */
{
    const size_t bytes = strlen(old) + 1;
    char * const copy = mem_sys_allocate(bytes);
    memcpy(copy, old, bytes);
#ifdef MEMDEBUG
    debug(interp, 1,"line %d str_dup %s [%x]\n", line, old, copy);
#endif
    return copy;
}

char *
str_cat(const char *s1 /*NN*/, const char *s2 /*NN*/)
{
    const size_t len1 = strlen(s1);
    const size_t len2 = strlen(s2);

    char * const s3 = mem_sys_allocate(len1 + len2 + 1);
    memcpy(s3, s1, len1);
    memcpy(s3+len1, s2, len2+1);

    return s3;
}


PARROT_API
void
imcc_init(Interp *interp /*NN*/)
{
    IMCC_INFO(interp) = mem_sys_allocate_zeroed(sizeof (imc_info_t));
    /* register PASM and PIR compilers to parrot core */
    register_compilers(interp);
}

PARROT_API
void
imcc_destroy(Interp *interp /*NN*/)
{
    Hash * const macros = IMCC_INFO(interp)->macros;

    if (macros)
        parrot_chash_destroy(interp, macros);

    mem_sys_free(IMCC_INFO(interp));
    IMCC_INFO(interp) = NULL;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
