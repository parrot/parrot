/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/inter_run.c - Parrot Interpreter - Run Ops and Methods

=head1 DESCRIPTION

Various functions that call the run loop.

=head2 Functions

=over 4

=cut

*/


#include <assert.h>
#include "parrot/parrot.h"

/*

=item C<void
runops(Interp *interpreter, size_t offset)>

Run parrot ops. Set exception handler and/or resume after exception.

=cut

*/

#define STACKED_EXCEPTIONS 1

void
runops(Interp *interpreter, size_t offset)
{
    /*
     * having stacked exceptions for each runlevel didn't work always
     * (after a longjmp the interpreter was totally messed up)
     *
     * But these are necessary to catch exceptions in reentered
     * run loops, e.g. if a delegate methods throws an exception
     */
#if ! STACKED_EXCEPTIONS
    if (!interpreter->exceptions)
#endif
    {
        new_internal_exception(interpreter);
        if (setjmp(interpreter->exceptions->destination)) {
            /* an exception was thrown */
            offset = handle_exception(interpreter);
        }
    }
    if (interpreter->profile &&
            Interp_flags_TEST(interpreter, PARROT_PROFILE_FLAG)) {
        RunProfile *profile = interpreter->profile;
        if (profile->cur_op == PARROT_PROF_EXCEPTION) {
            profile->data[PARROT_PROF_EXCEPTION].time +=
                Parrot_floatval_time() - profile->starttime;
        }
    }
    runops_int(interpreter, offset);
    /*
     * pop off exception and put it onto the free list
     * s. above
     */
    if (STACKED_EXCEPTIONS) {
        Parrot_exception *e = interpreter->exceptions;
        interpreter->exceptions = e->prev;
        interpreter->exc_free_list = e;
    }
    /*
     * not yet - this needs classifying of exceptions and handlers
     * so that only an exit handler does catch this exception
     */
#if 0
    do_exception(interpreter, EXCEPT_exit, 0);
#endif
}

/*

=item C<void
Parrot_runops_fromc(Parrot_Interp interpreter, PMC *sub)>

Runs the Parrot ops, called from C code. The function arguments are
already setup according to Parrot calling conventions, the C<sub> argument
is an invocable C<Sub> PMC.

=cut

*/

#define DO_DOD_REGISTER 0
void
Parrot_runops_fromc(Parrot_Interp interpreter, PMC *sub)
{
    PMC *ret_c, *old_c;
    opcode_t offset, *dest;

    /*
     * the caller doesn't know, that a subroutine is called
     * so P1 isn't copied up to the upper half of the register
     * frames and isn't stored with savetop - it's totally unachored
     *
     * we have to dod_register the caller's return continuation
     * to prevent it from sudden death
     */
    old_c = REG_PMC(1);
#if DO_DOD_REGISTER
    /* XXX it should be visible on the stack here */
    dod_register_pmc(interpreter, old_c);
#endif
    /* we need one return continuation with a NULL offset */
    REG_PMC(1) = ret_c = new_ret_continuation_pmc(interpreter, NULL);
#if GC_VERBOSE
    PObj_report_SET(ret_c);     /* s. also dod.c */
#endif
    /*
     * also be sure that this continuation isn't destroyed
     */
#if DO_DOD_REGISTER
    dod_register_pmc(interpreter, ret_c);
#endif
    /* invoke the sub, which places the context of the sub in the
     * interpreter, and switches code segments if needed
     */
    dest = VTABLE_invoke(interpreter, sub, NULL);
    if (dest) {
        offset = dest - interpreter->code->byte_code;
        runops(interpreter, offset);
    }
    REG_PMC(1) = old_c;
#if DO_DOD_REGISTER
    dod_unregister_pmc(interpreter, ret_c);
    dod_unregister_pmc(interpreter, old_c);
#endif
}

/*

=item C<PARROT_INLINE static regsave *
save_regs(Parrot_Interp interp, PMC* sub)>

=item C<PARROT_INLINE static void
restore_regs(Parrot_Interp interp, regsave *data)>

Save/restore all registers.

=cut

*/

/*
 * calculate size to store with save_regs
 *
 * this checks the opcodes in the sub an the reg usage
 * XXX don't do it here - the compiler has all the info
 * TODO attach that information in the metadata of the sub
 * XXX consider e.g. invoke (calling another sub)
 */
#define SAVE_ALL_REGS 1

#if SAVE_ALL_REGS

#  define used_size(i, s) sizeof(reg_store)
#  define SAVE_S0_P2 \
    REG_PMC(2) = obj; \
    REG_STR(0) = meth

#  define RESTORE_S0_P2

#else

#  define SAVE_S0_P2 \
    PMC * p2 = REG_PMC(2); \
    STRING *s0 = REG_STR(0); \
    REG_PMC(2) = obj; \
    REG_STR(0) = meth

#  define RESTORE_S0_P2 \
    REG_PMC(2) = p2; \
    REG_STR(0) = s0

#if defined(PARROT_HAS_I386_SSE) || defined(PARROT_HAS_I386_SSE2)
#  define MIN_SIZE_ALIGN 0x1f
#else
#  define MIN_SIZE_ALIGN 0x0f
#endif
static size_t
used_size(Parrot_Interp interpreter, PMC *sub)
{
    struct Parrot_Sub *s = PMC_sub(sub);
    op_info_t *op_info;
    opcode_t *start, *end, op, arg;
    int i, n;
    size_t size, offs;

    if (s->use_reg_offs)
        return s->use_reg_offs;
    start = PMC_struct_val(sub);
    end = s->end;
    if (!end || start == end)
        return sizeof(reg_store);
    size = 0;
    while (start < end) {
        op = *start;
        op_info = &interpreter->op_info_table[op];
        n = op_info->arg_count;
        /* printf("# %s\n", op_info->full_name); */
        for (i = 1; i < n; ++i) {
            if (!(op_info->dirs[i] & PARROT_ARGDIR_OUT))
                continue;
            arg = start[i];
            switch (op_info->types[i]) {
                case PARROT_ARG_I:
                    offs = offsetof(Interp, int_reg.registers[arg]) +
                        sizeof(INTVAL);
                    break;
                case PARROT_ARG_P:
                    offs = offsetof(Interp, pmc_reg.registers[arg]) +
                        sizeof(PMC *);
                    break;
                case PARROT_ARG_S:
                    offs = offsetof(Interp, string_reg.registers[arg]) +
                        sizeof(STRING *);
                    break;
                case PARROT_ARG_N:
                    offs = offsetof(Interp, num_reg.registers[arg]) +
                        sizeof(FLOATVAL);
                    break;
            }
            if (offs > size)
                size = offs;
        }
        start += n;
    }

    /* always preserve PCC vars */
    if (size < 5 * sizeof(INTVAL))
        size = 5 * sizeof(INTVAL);
    /* round up for memcpy_aligned */
    size = (size + MIN_SIZE_ALIGN) & ~MIN_SIZE_ALIGN;
    s->use_reg_offs = size;
    return size;
}

#endif

PARROT_INLINE static regsave *
save_regs(Parrot_Interp interpreter, PMC *sub)
{
    regsave *save;
    size_t size = used_size(interpreter, sub);
    Regs_cache * rc = &interpreter->caches->regs_cache;

    if (rc->reg_save_top) {
        save = rc->reg_save_top;
        rc->reg_save_top = save->prev;
    }
    else {
        save = mem_sys_allocate(sizeof(regsave));
        save->prev = NULL;
    }
    save->next = rc->reg_save_mark;
    rc->reg_save_mark = save;
    save->size = size;
    Parrot_memcpy_aligned(&save->regs, interpreter, size);
    return save;
}

void *
Parrot_save_register_frames(Parrot_Interp interpreter, PMC *sub)
{
    return save_regs(interpreter, sub);
}

PARROT_INLINE static void
restore_regs(Parrot_Interp interpreter, regsave *data)
{

    Regs_cache * rc = &interpreter->caches->regs_cache;

    Parrot_memcpy_aligned(interpreter, &data->regs, data->size);
    data->prev = rc->reg_save_top;
    rc->reg_save_top = data;
    assert(rc->reg_save_mark == data);
    rc->reg_save_mark = data->next;
}

void
Parrot_restore_register_frames(Parrot_Interp interpreter, void *data)
{
    restore_regs(interpreter, data);
}

/*

=item C<void
mark_saved_regs(Parrot_Interp interpreter)

Mark saved register aread live during DOD

=cut

*/

void
mark_saved_regs(Parrot_Interp interpreter)
{
    regsave *p = interpreter->caches->regs_cache.reg_save_mark;
    int j;
    PObj *reg;
    size_t offs;

    for (; p; p = p->next) {
        struct PReg *pf = &p->regs.pmc_reg;
        struct SReg *sf = &p->regs.string_reg;
        for (j = 0; j < NUM_REGISTERS; j++) {
            offs = offsetof(Interp, pmc_reg.registers[j]);
            if (offs >= p->size)
                break;
            reg = (PObj*) pf->registers[j];
            if (reg)
                pobject_lives(interpreter, reg);
            offs = offsetof(Interp, string_reg.registers[j]);
            if (offs >= p->size)
                break;
            reg = (PObj*) sf->registers[j];
            if (reg)
                pobject_lives(interpreter, reg);
        }
    }
}

/*

=item C<void
Parrot_runops_fromc_save(Parrot_Interp, PMC *sub)>

Like above but preserve registers.

=item C<void
Parrot_run_meth_fromc_save(Parrot_Interp, PMC *sub, PMC *obj, STRING *meth)>
=cut

Run a method sub from C.

*/

void
Parrot_runops_fromc_save(Parrot_Interp interpreter, PMC *sub)
{
    regsave *data = save_regs(interpreter, sub);
    /*
     * TODO install exception handler in _save variants
     *      so that we can restore the registers
     */
    Parrot_runops_fromc(interpreter, sub);
    restore_regs(interpreter, data);
}

void
Parrot_run_meth_fromc_save(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth)
{
    regsave *data = save_regs(interpreter, sub);
    SAVE_S0_P2;
    REG_INT(0) = 0;     /* non-prototyped */
    REG_INT(3) = 0;     /* no args */
    Parrot_runops_fromc(interpreter, sub);
    RESTORE_S0_P2;

    restore_regs(interpreter, data);
}

/*

=item C<void *
Parrot_runops_fromc_args(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)>

=item C<void *
Parrot_runops_fromc_args_save(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)>

=item C<INTVAL
Parrot_runops_fromc_args_save_reti(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)>

=item C<FLOATVAL
Parrot_runops_fromc_args_save_retf(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)>

=item C<void *
Parrot_runops_fromc_arglist_save(Parrot_Interp interpreter, PMC *sub,
        const char *sig, va_list args)>

=item C<void *
Parrot_run_meth_fromc_args_save(Parrot_Interp interpreter, PMC *sub,
        PMC* obj, STRING* meth, const char *sig, ...)>

=item C<INTVAL
Parrot_run_meth_fromc_args_save_reti(Parrot_Interp interpreter, PMC *sub,
        PMC* obj, STRING* meth, const char *sig, ...)>

=item C<FLOATVAL
Parrot_run_meth_fromc_args_save_retf(Parrot_Interp interpreter, PMC *sub,
        PMC* obj, STRING* meth, const char *sig, ...)>

Run parrot ops, called from C code, function arguments are passed as
C<va_args> according to signature the C<sub> argument is an invocable
C<Sub> PMC. The C<_save> variants preserve registers.

Signatures are similar to NCI:

    v ... void return
    I ... INTVAL (not Interpreter)
    N ... NUMVAL
    S ... STRING*
    P ... PMC*

=cut

*/

static void* set_retval(Parrot_Interp interpreter, int seg_ret);

static void
runops_args(Parrot_Interp interpreter, PMC *sub, const char* sig, va_list ap)
{
    /* *sig is retval like in NCI */
    int ret;
    int next[4];
    int i;

    for (i = 0; i < 4; i++)
        next[i] = 5;

    REG_INT(0) = 1;     /* kind of a prototyped call */
    REG_INT(1) = 0;     /* # of I params */
    REG_INT(2) = 0;     /* # of S params */
    REG_INT(3) = 0;     /* # of P params */
    REG_INT(4) = 0;     /* # of N params */

    ret = *sig++;

    while (*sig) {
        switch (*sig++) {
            case 'v':       /* void func, no params */
                break;
            case 'I':       /* REG_INT */
                REG_INT(next[0]++) = va_arg(ap, INTVAL);
                ++REG_INT(1);
                break;
            case 'S':       /* REG_STR */
                REG_STR(next[1]++) = va_arg(ap, STRING*);
                ++REG_INT(2);
                break;
            case 'P':       /* REG_PMC */
                REG_PMC(next[2]++) = va_arg(ap, PMC*);
                ++REG_INT(3);
                break;
            case 'N':       /* REG_NUM */
                REG_NUM(next[3]++) = va_arg(ap, FLOATVAL);
                ++REG_INT(4);
                break;
            default:
                internal_exception(1,
                        "unhandle signature '%c' in Parrot_runops_fromc_args",
                        sig[-1]);
        }
    }

    Parrot_runops_fromc(interpreter, sub);
}

static void*
set_retval(Parrot_Interp interpreter, int sig_ret)
{
    void *retval;
    retval = NULL;
    /*
     * XXX should we trust the signature or the registers set
     *     by the subroutine or both if possible, i.e. extract
     *     e.g. an INTVAL from a returned PMC?
     */
    REG_INT(0) = 1;     /* prototyped */
    REG_INT(1) = 0;     /* I */
    REG_INT(2) = 0;     /* S */
    REG_INT(3) = 0;     /* P */
    REG_INT(4) = 0;     /* N */
    switch (sig_ret) {
        case 'v': break;
        case 'I': retval = (void* )&REG_INT(5); REG_INT(1) = 1; break;
        case 'S': retval = (void* ) REG_STR(5); REG_INT(2) = 1; break;
        case 'P': retval = (void* ) REG_PMC(5); REG_INT(3) = 1; break;
        case 'N': retval = (void* )&REG_NUM(5); REG_INT(4) = 1; break;
        default:
            internal_exception(1,
                    "unhandle signature '%c' in Parrot_runops_fromc_args",
                    sig_ret);
    }
    return retval;
}

void *
Parrot_runops_fromc_args(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)
{
    va_list args;
    void *ret;

    va_start(args, sig);
    runops_args(interpreter, sub, sig, args);
    va_end(args);
    return set_retval(interpreter, *sig);
}

/*
 * generic return pointer or void
 */
void *
Parrot_runops_fromc_args_save(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)
{
    regsave *data = save_regs(interpreter, sub);
    va_list args;
    void *ret;

    va_start(args, sig);
    runops_args(interpreter, sub, sig, args);
    va_end(args);
    ret = set_retval(interpreter, *sig);
    restore_regs(interpreter, data);
    return ret;
}

INTVAL
Parrot_runops_fromc_args_save_reti(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)
{
    regsave *data = save_regs(interpreter, sub);
    va_list args;
    void *ret;
    INTVAL ri;

    va_start(args, sig);
    runops_args(interpreter, sub, sig, args);
    va_end(args);
    ret = set_retval(interpreter, *sig);
    ri = *(INTVAL*) ret;
    restore_regs(interpreter, data);
    return ri;
}

FLOATVAL
Parrot_runops_fromc_args_save_retf(Parrot_Interp interpreter, PMC *sub,
        const char *sig, ...)
{
    regsave *data = save_regs(interpreter, sub);
    va_list args;
    void *ret;
    FLOATVAL rf;

    va_start(args, sig);
    runops_args(interpreter, sub, sig, args);
    va_end(args);
    ret = set_retval(interpreter, *sig);
    rf = *(FLOATVAL*) ret;
    restore_regs(interpreter, data);
    return rf;
}

void*
Parrot_run_meth_fromc_args_save(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, ...)
{
    regsave *data = save_regs(interpreter, sub);
    va_list args;
    void *ret;
    SAVE_S0_P2;

    va_start(args, sig);
    runops_args(interpreter, sub, sig, args);
    va_end(args);
    ret = set_retval(interpreter, *sig);
    restore_regs(interpreter, data);
    RESTORE_S0_P2;
    return ret;
}

INTVAL
Parrot_run_meth_fromc_args_save_reti(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, ...)
{
    regsave *data = save_regs(interpreter, sub);
    va_list args;
    void *ret;
    INTVAL ri;
    SAVE_S0_P2;

    va_start(args, sig);
    runops_args(interpreter, sub, sig, args);
    va_end(args);
    ret = set_retval(interpreter, *sig);
    ri = *(INTVAL*) ret;
    restore_regs(interpreter, data);
    RESTORE_S0_P2;
    return ri;
}

FLOATVAL
Parrot_run_meth_fromc_args_save_retf(Parrot_Interp interpreter,
        PMC *sub, PMC *obj, STRING *meth, const char *sig, ...)
{
    regsave *data = save_regs(interpreter, sub);
    va_list args;
    void *ret;
    FLOATVAL rf;
    SAVE_S0_P2;

    va_start(args, sig);
    runops_args(interpreter, sub, sig, args);
    va_end(args);
    ret = set_retval(interpreter, *sig);
    rf = *(FLOATVAL*) ret;
    restore_regs(interpreter, data);
    RESTORE_S0_P2;
    return rf;
}

void *
Parrot_runops_fromc_arglist_save(Parrot_Interp interpreter, PMC *sub,
        const char *sig, va_list args)
{
    regsave *data = save_regs(interpreter, sub);
    void *ret;

    runops_args(interpreter, sub, sig, args);
    ret = set_retval(interpreter, *sig);
    restore_regs(interpreter, data);
    return ret;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/interpreter.h>, F<src/interpreter.c>.

=cut

*/
/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
