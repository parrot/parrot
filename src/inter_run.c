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
    interpreter->ctx.runloop_level++;
#if ! STACKED_EXCEPTIONS
    if (!interpreter->exceptions)
#endif
    {
        new_internal_exception(interpreter);
        interpreter->exceptions->runloop_level =
            interpreter->ctx.runloop_level;
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
        e->prev = interpreter->exc_free_list;
        interpreter->exc_free_list = e;
    }
    interpreter->ctx.runloop_level--;
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

void
Parrot_runops_fromc(Parrot_Interp interpreter, PMC *sub)
{
    PMC *ret_c, *old_c;
    opcode_t offset, *dest;

    /* we need one return continuation with a NULL offset */
    REG_PMC(1) = ret_c = new_ret_continuation_pmc(interpreter, NULL);
#if GC_VERBOSE
    PObj_report_SET(ret_c);     /* s. also dod.c */
#endif
    /* invoke the sub, which places the context of the sub in the
     * interpreter, and switches code segments if needed
     */
    dest = VTABLE_invoke(interpreter, sub, NULL);
    if (dest) {
        offset = dest - interpreter->code->byte_code;
        runops(interpreter, offset);
    }
}

/*

=item C<PARROT_INLINE static regsave *
save_regs(Parrot_Interp interp, PMC* sub)>

=item C<PARROT_INLINE static void
restore_regs(Parrot_Interp interp, regsave *data)>

Save/restore all registers.

=cut

*/


#  define used_size(i, s) sizeof(reg_store)
#  define SAVE_S0_P2 \
    REG_PMC(2) = obj; \
    REG_STR(0) = meth

#  define RESTORE_S0_P2


PARROT_INLINE static regsave *
save_regs(Parrot_Interp interpreter, PMC *sub)
{
#if INDIRECT_REGS
    return NULL;
#else
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
#endif
}

void *
Parrot_save_register_frames(Parrot_Interp interpreter, PMC *sub)
{
    return save_regs(interpreter, sub);
}

PARROT_INLINE static void
restore_regs(Parrot_Interp interpreter, regsave *data)
{

#if INDIRECT_REGS
    return;
#else
    Regs_cache * rc = &interpreter->caches->regs_cache;

    Parrot_memcpy_aligned(interpreter, &data->regs, data->size);
    data->prev = rc->reg_save_top;
    rc->reg_save_top = data;
    assert(rc->reg_save_mark == data);
    rc->reg_save_mark = data->next;
#endif
}

void
Parrot_restore_register_frames(Parrot_Interp interpreter, void *data)
{
    restore_regs(interpreter, data);
}

/*

=item C<void
mark_saved_regs(Parrot_Interp interpreter)>

Mark saved register aread live during DOD

=cut

*/

void
mark_saved_regs(Parrot_Interp interpreter)
{
    regsave *p = interpreter->caches->regs_cache.reg_save_mark;
    int j;
    PObj *reg;

    for (; p; p = p->next) {
        struct PReg *pf = &p->regs.pmc_reg;
        struct SReg *sf = &p->regs.string_reg;
        for (j = 0; j < NUM_REGISTERS; j++) {
            reg = (PObj*) pf->registers[j];
            if (reg)
                pobject_lives(interpreter, reg);
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

Run a method sub from C.

=cut

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
    if (REG_INT(3) == 1) {
        /*
         * pythons functions from pie-thon always return a PMC
         */
        switch (sig_ret) {
            case 'S':
                REG_STR(5) = VTABLE_get_string(interpreter, REG_PMC(5));
                break;
            case 'I':
                REG_INT(5) = VTABLE_get_integer(interpreter, REG_PMC(5));
                break;
        }
    }
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
