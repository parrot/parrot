/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

src/thread.c - Thread handling stuff

=head1 DESCRIPTION

Threads are created by creating new C<ParrotInterpreter> objects.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/atomic.h"
#include "parrot/runcore_api.h"
#include "pmc/pmc_sub.h"
#include "pmc/pmc_parrotinterpreter.h"

/* HEADERIZER HFILE: include/parrot/thread.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static Parrot_Interp detach(UINTVAL tid);
PARROT_CAN_RETURN_NULL
static Shared_gc_info * get_pool(void);

PARROT_WARN_UNUSED_RESULT
static int is_suspended_for_gc(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
static PMC * make_local_args_copy(PARROT_INTERP,
    ARGIN(Parrot_Interp old_interp),
    ARGIN_NULLOK(PMC *args))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
static PMC * make_local_copy(PARROT_INTERP,
    ARGIN(Parrot_Interp from),
    ARGIN(PMC *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void mutex_unlock(ARGMOD(void *arg))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*arg);

static Parrot_Interp pt_check_tid(UINTVAL tid, ARGIN(const char *from))
        __attribute__nonnull__(2);

static int pt_gc_count_threads(void);
static void pt_gc_wait_for_stage(PARROT_INTERP,
    thread_gc_stage_enum from_stage,
    thread_gc_stage_enum to_stage)
        __attribute__nonnull__(1);

static void pt_gc_wakeup_check(void);
static void pt_ns_clone(PARROT_INTERP,
    ARGOUT(Parrot_Interp d),
    ARGOUT(PMC *dest_ns),
    ARGIN(Parrot_Interp s),
    ARGIN(PMC *source_ns))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(d)
        FUNC_MODIFIES(*dest_ns);

static void pt_suspend_all_for_gc(PARROT_INTERP)
        __attribute__nonnull__(1);

static void pt_suspend_one_for_gc(PARROT_INTERP)
        __attribute__nonnull__(1);

static void pt_thread_signal(ARGIN(Parrot_Interp self), PARROT_INTERP)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void pt_thread_wait(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
static void* thread_func(ARGIN_NULLOK(void *arg));

#define ASSERT_ARGS_detach __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_get_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_is_suspended_for_gc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_make_local_args_copy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(old_interp))
#define ASSERT_ARGS_make_local_copy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(from) \
    , PARROT_ASSERT_ARG(arg))
#define ASSERT_ARGS_mutex_unlock __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(arg))
#define ASSERT_ARGS_pt_check_tid __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(from))
#define ASSERT_ARGS_pt_gc_count_threads __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_pt_gc_wait_for_stage __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pt_gc_wakeup_check __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_pt_ns_clone __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(d) \
    , PARROT_ASSERT_ARG(dest_ns) \
    , PARROT_ASSERT_ARG(s) \
    , PARROT_ASSERT_ARG(source_ns))
#define ASSERT_ARGS_pt_suspend_all_for_gc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pt_suspend_one_for_gc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pt_thread_signal __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pt_thread_wait __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_thread_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#if defined THREAD_DEBUG && THREAD_DEBUG
#  define DEBUG_ONLY(x) (x)
#else
#  define DEBUG_ONLY(x)
#endif

static int running_threads;

void Parrot_really_destroy(PARROT_INTERP, int exit_code, void *arg);

/*

=item C<static PMC * make_local_copy(PARROT_INTERP, Parrot_Interp from, PMC
*arg)>

Creates a local copy of the PMC if necessary. (No copy is made if it is marked
shared.) This includes workarounds for Parrot_clone() not doing the Right Thing
with subroutines (specifically, code segments aren't preserved and it is
difficult to do so as long as Parrot_clone() depends on freezing).

=cut

*/

PARROT_CAN_RETURN_NULL
static PMC *
make_local_copy(PARROT_INTERP, ARGIN(Parrot_Interp from), ARGIN(PMC *arg))
{
    ASSERT_ARGS(make_local_copy)
    PMC            *ret_val;
    STRING * const  _sub       = interp->vtables[enum_class_Sub]->whoami;
    STRING * const  _multi_sub = interp->vtables[enum_class_MultiSub]->whoami;

    if (PMC_IS_NULL(arg)) {
        ret_val = PMCNULL;
    }
    else if (PObj_is_PMC_shared_TEST(arg)) {
        ret_val = arg;
    }
    else if (VTABLE_isa(from, arg, _multi_sub)) {
        INTVAL i = 0;
        const INTVAL n = VTABLE_elements(from, arg);
        ret_val  = Parrot_pmc_new(interp, enum_class_MultiSub);

        for (i = 0; i < n; ++i) {
            PMC *const orig = VTABLE_get_pmc_keyed_int(from, arg, i);
            PMC *const copy = make_local_copy(interp, from, orig);
            VTABLE_push_pmc(interp, ret_val, copy);
        }
    }
    else if (VTABLE_isa(from, arg, _sub)) {
        /* this is a workaround for cloning subroutines not actually
         * working as one might expect mainly because the segment is
         * not correctly copied
         */
        Parrot_Sub_attributes *ret_val_sub, *arg_sub;

        ret_val               = Parrot_clone(interp, arg);
        PMC_get_sub(interp, ret_val, ret_val_sub);
        PMC_get_sub(interp, arg,     arg_sub);
        ret_val_sub->seg = arg_sub->seg;
        /* Skip vtable overrides and methods. */
        if (ret_val_sub->vtable_index == -1
                && !(ret_val_sub->comp_flags & SUB_COMP_FLAG_METHOD)) {
            Parrot_ns_store_sub(interp, ret_val);
        }
    }
    else {
        ret_val = Parrot_clone(interp, arg);
    }
    return ret_val;
}

/*

=item C<static Shared_gc_info * get_pool(void)>

Gets the shared gc information.  For now this is global data; ideally it will
become something other than a static variable.  If everything uses this
function, it will be easier to change.

=cut

*/

PARROT_CAN_RETURN_NULL
static Shared_gc_info *
get_pool(void)
{
    ASSERT_ARGS(get_pool)
    return shared_gc_info;
}

/*

=item C<void pt_free_pool(PARROT_INTERP)>

Frees the shared GC information.  This clears any global data when joining all
threads at parent interpreter destruction.

=cut

*/

void
pt_free_pool(PARROT_INTERP)
{
    ASSERT_ARGS(pt_free_pool)
    if (shared_gc_info) {
        COND_DESTROY(shared_gc_info->gc_cond);
        PARROT_ATOMIC_INT_DESTROY(shared_gc_info->gc_block_level);
        mem_internal_free(shared_gc_info);
        shared_gc_info = NULL;
    }
}

/*

=item C<static PMC * make_local_args_copy(PARROT_INTERP, Parrot_Interp
old_interp, PMC *args)>

Make a local copy of the corresponding array of arguments.

=cut

*/

PARROT_CAN_RETURN_NULL
static PMC *
make_local_args_copy(PARROT_INTERP, ARGIN(Parrot_Interp old_interp), ARGIN_NULLOK(PMC *args))
{
    ASSERT_ARGS(make_local_args_copy)
    PMC   *ret_val;
    INTVAL old_size;
    INTVAL i;

    if (PMC_IS_NULL(args))
        return PMCNULL;

    old_size = VTABLE_get_integer(old_interp, args);

    /* XXX should this be a different type? */
    ret_val = Parrot_pmc_new(interp, enum_class_FixedPMCArray);
    VTABLE_set_integer_native(interp, ret_val, old_size);

    for (i = 0; i < old_size; ++i) {
        PMC * const copy = make_local_copy(interp, old_interp,
                VTABLE_get_pmc_keyed_int(old_interp, args, i));

        VTABLE_set_pmc_keyed_int(interp, ret_val, i, copy);
    }

    return ret_val;
}

/*

=item C<PMC * pt_shared_fixup(PARROT_INTERP, PMC *pmc)>

Modifies a PMC to be sharable. Right now, reassigns the vtable to one
owned by some master interpreter, so the PMC can be safely reused
after thread death.

In the future the PMC returned might be different than the one
passed, e.g., if we need to reallocate the PMC in a different
interpreter.

=cut

*/

PARROT_CAN_RETURN_NULL
PMC *
pt_shared_fixup(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(pt_shared_fixup)
    /* TODO this will need to change for thread pools
     * XXX should we have a separate interpreter for this?
     */
    INTVAL        type_num;
    Parrot_Interp master = interpreter_array[0];
    const int     is_ro  = pmc->vtable->flags & VTABLE_IS_READONLY_FLAG;

    /* This lock is paired with one in objects.c. It is necessary to protect
     * against the master interpreter adding classes and consequently
     * resizing its classname->type_id hashtable and/or expanding its vtable
     * array.
     * TODO investigate if a read-write lock results in substantially
     * better performance.
     */
    LOCK_INTERPRETER(master);
    type_num = pmc->vtable->base_type;

    if (type_num == enum_type_undef) {
        UNLOCK_INTERPRETER(master);
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "pt_shared_fixup: unsharable type");
    }

    pmc->vtable = master->vtables[type_num];

    UNLOCK_INTERPRETER(master);

    if (is_ro)
        pmc->vtable = pmc->vtable->ro_variant_vtable;

    PObj_is_PMC_shared_SET(pmc);

    /* make sure metadata doesn't go away unexpectedly */
    if (PMC_metadata(pmc))
        PMC_metadata(pmc) = pt_shared_fixup(interp, PMC_metadata(pmc));

    return pmc;
}

/*

=item C<static void pt_thread_signal(Parrot_Interp self, PARROT_INTERP)>

Wakes up an C<interp> which should have called pt_thread_wait().

=cut

*/

static void
pt_thread_signal(ARGIN(Parrot_Interp self), PARROT_INTERP)
{
    ASSERT_ARGS(pt_thread_signal)
    COND_SIGNAL(interp->thread_data->interp_cond);
}

/*

=item C<void pt_thread_wait_with(PARROT_INTERP, Parrot_mutex *mutex)>

Waits for this interpreter to be signalled through its condition variable,
dealing properly with GC issues. C<*mutex> is assumed locked on entry and
will be locked on exit from this function. If a GC run occurs in the middle of
this function, then a spurious wakeup may occur.

=cut

*/

void
pt_thread_wait_with(PARROT_INTERP, ARGMOD(Parrot_mutex *mutex))
{
    ASSERT_ARGS(pt_thread_wait_with)
    LOCK(interpreter_array_mutex);
    if (interp->thread_data->state & THREAD_STATE_SUSPEND_GC_REQUESTED) {
        interp->thread_data->state |= THREAD_STATE_SUSPENDED_GC;
        UNLOCK(interpreter_array_mutex);
        UNLOCK(*mutex);

        pt_suspend_self_for_gc(interp);

        LOCK(*mutex);
        /* since we unlocked the mutex something bad may have occured */
        return;
    }

    interp->thread_data->state |= THREAD_STATE_GC_WAKEUP;

    UNLOCK(interpreter_array_mutex);
    COND_WAIT(interp->thread_data->interp_cond, *mutex);
    LOCK(interpreter_array_mutex);

    interp->thread_data->state &= ~THREAD_STATE_GC_WAKEUP;

    if (interp->thread_data->state & THREAD_STATE_SUSPENDED_GC) {
        UNLOCK(*mutex);
        /* XXX loop needed? */
        do {
            UNLOCK(interpreter_array_mutex);
            /* fprintf(stderr, "%p: woken up, doing GC run\n", interp); */
            pt_suspend_self_for_gc(interp);
            LOCK(interpreter_array_mutex);
        } while (interp->thread_data->state & THREAD_STATE_SUSPENDED_GC);

        UNLOCK(interpreter_array_mutex);
        LOCK(*mutex);
    }
    else {
        UNLOCK(interpreter_array_mutex);
    }
}

/*

=item C<static void pt_thread_wait(PARROT_INTERP)>

Waits for a signal, handling GC matters correctly.  C<interpreter_array_mutex>
is assumed held. Spurious wakeups may occur.

=cut

*/

static void
pt_thread_wait(PARROT_INTERP)
{
    ASSERT_ARGS(pt_thread_wait)
    if (interp->thread_data->state & THREAD_STATE_SUSPEND_GC_REQUESTED) {
        interp->thread_data->state |= THREAD_STATE_SUSPENDED_GC;
        /* fprintf(stderr, "%p: pt_thread_wait, before sleep, doing GC run\n",
         * interp); */

        UNLOCK(interpreter_array_mutex);
        pt_suspend_self_for_gc(interp);
        LOCK(interpreter_array_mutex);

        /* while we were GCing, whatever we were waiting on might have
         * changed */
        return;
    }

    interp->thread_data->state |= THREAD_STATE_GC_WAKEUP;

    COND_WAIT(interp->thread_data->interp_cond, interpreter_array_mutex);

    interp->thread_data->state &= ~THREAD_STATE_GC_WAKEUP;

    while (interp->thread_data->state & THREAD_STATE_SUSPENDED_GC) {
        UNLOCK(interpreter_array_mutex);
        /* fprintf(stderr, "%p: woken up, doing GC run\n", interp); */
        pt_suspend_self_for_gc(interp);
        LOCK(interpreter_array_mutex);
    }
}


/*

=item C<static void* thread_func(void *arg)>

The actual thread function.

=cut

*/

PARROT_CAN_RETURN_NULL
static void*
thread_func(ARGIN_NULLOK(void *arg))
{
    ASSERT_ARGS(thread_func)
    Parrot_runloop   jump_point;
    int              lo_var_ptr;
    UINTVAL          tid;
    PMC             * volatile sub_pmc;
    PMC             *sub_arg;
    PMC * const      self    = (PMC*) arg;
    PMC             *ret_val = PMCNULL;
    Parrot_Interp    interp  =
       (Parrot_Interp)((Parrot_ParrotInterpreter_attributes *)PMC_data(self))->interp;

    Parrot_block_GC_mark(interp);
    Parrot_block_GC_sweep(interp);

    /* need to set it here because argument passing can trigger GC */
    interp->lo_var_ptr = &lo_var_ptr;
    GETATTR_ParrotInterpreter_sub(interp, self, sub_pmc);
    sub_arg            = VTABLE_get_pmc(interp, self);

    if (setjmp(jump_point.resume)) {
        /* caught exception */
        /* XXX what should we really do here */
        /* PMC *exception = Parrot_cx_peek_task(interp);
        Parrot_io_eprintf(interp,
                    "Unhandled exception in thread with tid %d "
                    "(message=%Ss, number=%d)\n",
                    interp->thread_data->tid,
                    VTABLE_get_string(interp, exception),
                    VTABLE_get_integer_keyed_str(interp, exception,
                        Parrot_str_new_constant(interp, "type"))); */
    }
    else {
        /* run normally */
        Parrot_ex_add_c_handler(interp, &jump_point);
        Parrot_unblock_GC_mark(interp);
        Parrot_unblock_GC_sweep(interp);
        Parrot_pcc_invoke_sub_from_c_args(interp, sub_pmc, "Pf->P", sub_arg, &ret_val);
    }

    /* thread is finito */
    LOCK(interpreter_array_mutex);
    DEBUG_ONLY(fprintf(stderr, "marking an thread as finished\n"));

    interp->thread_data->state |= THREAD_STATE_FINISHED;
    tid                         = interp->thread_data->tid;

    if (interp != interpreter_array[tid]) {
        UNLOCK(interpreter_array_mutex);
        PANIC(interp, "thread finished: interpreter mismatch");
    }
    if (interp->thread_data->state & THREAD_STATE_DETACHED) {
        interpreter_array[tid] = NULL;
        DEBUG_ONLY(fprintf(stderr,
            "really destroying an interpreter [exit while detached]\n"));
        Parrot_really_destroy(interp, 0, NULL);
    }
    else if (interp->thread_data->state & THREAD_STATE_JOINED) {
        pt_thread_signal(interp, interp->thread_data->joiner);
    }

    /* make sure we don't block a GC run */
    pt_gc_wakeup_check();
    PARROT_ASSERT(interp->thread_data->state & THREAD_STATE_FINISHED);

    UNLOCK(interpreter_array_mutex);

    return ret_val;
}

/*

=back

=head2 Helper functions used also for running plain interpreters

=over 4

=item C<void pt_clone_code(Parrot_Interp d, Parrot_Interp s)>

Copies/clones the packfile/code from interpreter C<s> to C<d>. All
resources are created in C<d>.

=cut

*/

void
pt_clone_code(Parrot_Interp d, Parrot_Interp s)
{
    ASSERT_ARGS(pt_clone_code)
    Parrot_block_GC_mark(d);
    Interp_flags_SET(d, PARROT_EXTERN_CODE_FLAG);
    d->code = NULL;
    Parrot_switch_to_cs(d, s->code, 1);
    Parrot_unblock_GC_mark(d);
}

/*

=item C<static void pt_ns_clone(PARROT_INTERP, Parrot_Interp d, PMC *dest_ns,
Parrot_Interp s, PMC *source_ns)>

Clones all globals from C<s> to C<d>.

=cut

*/

static void
pt_ns_clone(PARROT_INTERP, ARGOUT(Parrot_Interp d), ARGOUT(PMC *dest_ns),
            ARGIN(Parrot_Interp s), ARGIN(PMC *source_ns))
{
    ASSERT_ARGS(pt_ns_clone)
    PMC * const iter = VTABLE_get_iter(s, source_ns);
    const INTVAL n   = VTABLE_elements(s, source_ns);
    INTVAL i;

    for (i = 0; i < n; ++i) {
        /* XXX what if 'key' is a non-constant-pool string? */
        STRING * const key = VTABLE_shift_string(s, iter);
        PMC    * const val = VTABLE_get_pmc_keyed_str(s, source_ns, key);

        if (val->vtable->base_type == enum_class_NameSpace) {
            PMC *sub_ns = VTABLE_get_pmc_keyed_str(d, dest_ns, key);
            if (PMC_IS_NULL(sub_ns) || sub_ns->vtable->base_type !=
                    enum_class_NameSpace) {
                sub_ns = Parrot_pmc_new(d, enum_class_NameSpace);
                VTABLE_set_pmc_keyed_str(d, dest_ns, key, sub_ns);
            }
            pt_ns_clone(s, d, sub_ns, s, val);
        }
        else {
            PMC * const dval = VTABLE_get_pmc_keyed_str(d, dest_ns, key);

            if (PMC_IS_NULL(dval)) {
                PMC * const copy = make_local_copy(d, s, val);
                Parrot_Sub_attributes *val_sub;

                if (val->vtable->base_type == enum_class_Sub)
                    PMC_get_sub(interp, val, val_sub);

                /* Vtable overrides and methods were already cloned, so don't reclone them. */
                if (! (val->vtable->base_type == enum_class_Sub
                    && (val_sub->vtable_index != -1
                       || val_sub->comp_flags & SUB_COMP_FLAG_METHOD))) {
                    VTABLE_set_pmc_keyed_str(d, dest_ns, key, copy);
                }
            }
        }
    }
}

/*

=item C<void pt_clone_globals(Parrot_Interp d, Parrot_Interp s)>

Copies the global namespace when cloning a new interpreter.

=cut

*/

void
pt_clone_globals(Parrot_Interp d, Parrot_Interp s)
{
    ASSERT_ARGS(pt_clone_globals)
    Parrot_block_GC_mark(d);
    pt_ns_clone(s, d, d->root_namespace, s, s->root_namespace);
    Parrot_unblock_GC_mark(d);
}

/*

=item C<void pt_thread_prepare_for_run(Parrot_Interp d, Parrot_Interp s)>

Sets up a new thread to run.

=cut

*/

void
pt_thread_prepare_for_run(Parrot_Interp d, SHIM(Parrot_Interp s))
{
    ASSERT_ARGS(pt_thread_prepare_for_run)
    Parrot_setup_event_func_ptrs(d);
}

/*

=back

=head2 ParrotThread methods

=over 4

=cut

*/

/*

=item C<PMC * pt_transfer_sub(Parrot_Interp d, Parrot_Interp s, PMC *sub)>

Clones the sub so that it's suitable for the other interpreter.

=cut

*/

PARROT_CAN_RETURN_NULL
PMC *
pt_transfer_sub(ARGOUT(Parrot_Interp d), ARGIN(Parrot_Interp s), ARGIN(PMC *sub))
{
    ASSERT_ARGS(pt_transfer_sub)
#if defined THREAD_DEBUG && THREAD_DEBUG
    Parrot_io_eprintf(s, "copying over subroutine [%Ss]\n",
        Parrot_full_sub_name(s, sub));
#endif
    return make_local_copy(d, s, sub);
}

/*

=item C<PMC * pt_thread_create(PARROT_INTERP, INTVAL type, INTVAL clone_flags)>

create a pt_thread

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
pt_thread_create(PARROT_INTERP, INTVAL type, INTVAL clone_flags)
{
    ASSERT_ARGS(pt_thread_create)
    PMC    * const new_interp_pmc = pmc_new(interp, type);
    Interp * const new_interp     = (Interp *)VTABLE_get_pointer(interp, new_interp_pmc);

    clone_interpreter(new_interp, interp, clone_flags);
    pt_thread_prepare_for_run(new_interp, interp);

    return new_interp_pmc;
}

/*

=item C<int pt_thread_run(PARROT_INTERP, PMC *thread_interp_pmc, PMC *sub, PMC
*arg)>

run a pt_thread

=cut

*/

int
pt_thread_run(PARROT_INTERP, ARGMOD(PMC *thread_interp_pmc), ARGIN(PMC *sub),
        ARGIN_NULLOK(PMC *arg))
{
    ASSERT_ARGS(pt_thread_run)
    Interp * const thread_interp = (Interp *)VTABLE_get_pointer(interp, thread_interp_pmc);

    SETATTR_ParrotInterpreter_sub(interp,
                                  thread_interp_pmc, pt_transfer_sub(thread_interp, interp, sub));
    VTABLE_set_pmc(interp, thread_interp_pmc, make_local_args_copy(thread_interp, interp, arg));
    thread_interp->thread_data->state = THREAD_STATE_JOINABLE;

    THREAD_CREATE_JOINABLE(thread_interp->thread_data->thread, thread_func, thread_interp_pmc);

    /* check for pending GC */
    /*
     * can't do multi-threaded GC yet
     * XXX a quick hack to pass the few tests

    LOCK(interpreter_array_mutex);
    if (interp->thread_data->state & THREAD_STATE_SUSPEND_GC_REQUESTED)
        pt_suspend_one_for_gc(new_interp);
    UNLOCK(interpreter_array_mutex);

    */

    return thread_interp->thread_data->tid;
}

/*

=item C<int pt_thread_create_run(PARROT_INTERP, INTVAL type, INTVAL clone_flags,
PMC *sub, PMC *arg)>

create a pt_thread run

=cut

*/

int
pt_thread_create_run(PARROT_INTERP,
                     INTVAL type, INTVAL clone_flags, ARGIN(PMC *sub), ARGIN_NULLOK(PMC *arg))
{
  ASSERT_ARGS(pt_thread_create_run)
  PMC *thread_interp_pmc = pt_thread_create(interp, type, clone_flags);
  return pt_thread_run(interp, thread_interp_pmc, sub, arg);
}


/*

=item C<void pt_thread_yield(void)>

Relinquishes hold on the processor.

=cut

*/

void
pt_thread_yield(void)
{
    ASSERT_ARGS(pt_thread_yield)
    YIELD;
}

/*

=item C<static Parrot_Interp pt_check_tid(UINTVAL tid, const char *from)>

Helper function. Checks if the given thread ID is valid. The caller holds the
mutex.  Returns the interpreter for C<tid>.

=cut

*/

static Parrot_Interp
pt_check_tid(UINTVAL tid, ARGIN(const char *from))
{
    ASSERT_ARGS(pt_check_tid)
    if (tid >= n_interpreters) {
        UNLOCK(interpreter_array_mutex);
        exit_fatal(1, "%s: illegal thread tid %d", from, tid);
    }
    if (tid == 0) {
        UNLOCK(interpreter_array_mutex);
        exit_fatal(1, "%s: illegal thread tid %d (main)", from, tid);
    }
    if (!interpreter_array[tid]) {
        UNLOCK(interpreter_array_mutex);
        exit_fatal(1, "%s: illegal thread tid %d - empty", from, tid);
    }
    return interpreter_array[tid];
}

/*

=item C<static void mutex_unlock(void *arg)>

Unlocks the mutex C<*arg>.

=cut

*/

static void
mutex_unlock(ARGMOD(void *arg))
{
    ASSERT_ARGS(mutex_unlock)
    UNLOCK(*(Parrot_mutex *) arg);
}

/*

=item C<static int is_suspended_for_gc(PARROT_INTERP)>

Returns true iff C<interp> is suspended for a global GC run.  Be sure to hold
C<interpreter_array_mutex>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
is_suspended_for_gc(PARROT_INTERP)
{
    ASSERT_ARGS(is_suspended_for_gc)
    if (!interp)
        return 1;
    else if (interp->thread_data->wants_shared_gc)
        return 1;
    else if (interp->thread_data->state & THREAD_STATE_SUSPENDED_GC)
        return 1;
    else if ((interp->thread_data->state & THREAD_STATE_FINISHED) ||
               (interp->thread_data->state & THREAD_STATE_NOT_STARTED))
        return 1;
    else
        return 0;
}

/*

=item C<static int pt_gc_count_threads(void)>

Returns the number of active threads in the system (running or suspended).  Be
sure to hold C<interpreter_array_mutex>.

=cut

*/

static int
pt_gc_count_threads(void)
{
    ASSERT_ARGS(pt_gc_count_threads)
    UINTVAL i;
    int     count = 0;

    for (i = 0; i < n_interpreters; ++i) {
        Parrot_Interp cur;
        cur = interpreter_array[i];
        if (!cur)
            continue;
        if (cur->thread_data->state & (THREAD_STATE_NOT_STARTED |
                                       THREAD_STATE_FINISHED))
            continue;
        ++count;
    }
    DEBUG_ONLY(fprintf(stderr, "found %d threads\n", count));
    return count;
}

/*

=item C<static void pt_gc_wait_for_stage(PARROT_INTERP, thread_gc_stage_enum
from_stage, thread_gc_stage_enum to_stage)>

Waits until all threads have reached the desired stage.  Takes an interpreter,
starting stage and ending stage as arguments.  Updates the thread information.
Used in C<pt_gc_start_mark> and C<pt_gc_stop_mark>.

=cut

*/

static void
pt_gc_wait_for_stage(PARROT_INTERP, thread_gc_stage_enum from_stage,
            thread_gc_stage_enum to_stage)
{
    ASSERT_ARGS(pt_gc_wait_for_stage)
    Shared_gc_info * const info = shared_gc_info;
    int             thread_count;

    DEBUG_ONLY(fprintf(stderr, "%p: gc_wait_for_stage: %d->%d\n", interp, from_stage, to_stage));

    /* XXX well-timed thread death can mess this up */
    LOCK(interpreter_array_mutex);

    DEBUG_ONLY(fprintf(stderr, "%p: got lock\n", interp));
    thread_count = pt_gc_count_threads();

    PARROT_ASSERT(info->gc_stage == from_stage);
    PARROT_ASSERT(!(interp->thread_data->state & THREAD_STATE_NOT_STARTED));
    PARROT_ASSERT(!(interp->thread_data->state & THREAD_STATE_FINISHED));

    if (from_stage == 0)
        PARROT_ASSERT(interp->thread_data->state & THREAD_STATE_SUSPENDED_GC);
    else
        PARROT_ASSERT(!(interp->thread_data->state & THREAD_STATE_SUSPENDED_GC));

    ++info->num_reached;

    DEBUG_ONLY(fprintf(stderr, "%p: gc_wait_for_stage: got %d\n", interp, info->num_reached));

    if (info->num_reached == thread_count) {
        info->gc_stage    = to_stage;
        info->num_reached = 0;
        COND_BROADCAST(info->gc_cond);
    }
    else {
        do {
            COND_WAIT(info->gc_cond, interpreter_array_mutex);
        } while (info->gc_stage != to_stage);
    }
    UNLOCK(interpreter_array_mutex);
}


/*

=item C<static void pt_gc_wakeup_check(void)>

Checks if it's necessary to wake threads to perform garbage collection.  This
is called after thread death.  Be sure to hold C<interpreter_array_mutex>.

=cut

*/

static void
pt_gc_wakeup_check(void)
{
    ASSERT_ARGS(pt_gc_wakeup_check)
    Shared_gc_info * const info = shared_gc_info;
    int             thread_count;

    if (!info)
        return;

    thread_count = pt_gc_count_threads();

    if (info->num_reached == thread_count) {
        PARROT_ASSERT(info->gc_stage == THREAD_GC_STAGE_NONE);
        info->gc_stage    = THREAD_GC_STAGE_MARK;
        info->num_reached = 0;
        COND_BROADCAST(info->gc_cond);
    }
}

/*

=item C<static void pt_suspend_one_for_gc(PARROT_INTERP)>

Suspends a single interpreter for GC.  Be sure to hold
C<interpreter_array_mutex>.

=cut

*/

static void
pt_suspend_one_for_gc(PARROT_INTERP)
{
    ASSERT_ARGS(pt_suspend_one_for_gc)
    DEBUG_ONLY(fprintf(stderr, "suspend one: %p\n", interp));
    if (is_suspended_for_gc(interp)) {
        DEBUG_ONLY(fprintf(stderr, "ignoring already suspended\n"));
        return;
    }

    if (interp->thread_data->state & THREAD_STATE_GC_WAKEUP) {
        DEBUG_ONLY(fprintf(stderr, "just waking it up\n"));
        interp->thread_data->state |= THREAD_STATE_SUSPENDED_GC;
        COND_SIGNAL(interp->thread_data->interp_cond);
    }
    else {
        DEBUG_ONLY(fprintf(stderr, "queuing event\n"));
        interp->thread_data->state |= THREAD_STATE_SUSPEND_GC_REQUESTED;
        Parrot_cx_request_suspend_for_gc(interp);
    }
}

/*

=item C<static void pt_suspend_all_for_gc(PARROT_INTERP)>

Notifies all threads to perform a GC run.

=cut

*/

static void
pt_suspend_all_for_gc(PARROT_INTERP)
{
    ASSERT_ARGS(pt_suspend_all_for_gc)
    UINTVAL i;

    DEBUG_ONLY(fprintf(stderr, "suspend_all_for_gc [interp=%p]\n", interp));

    LOCK(interpreter_array_mutex);
    interp->thread_data->state |= THREAD_STATE_SUSPENDED_GC;

    if (interp->thread_data->state & THREAD_STATE_SUSPEND_GC_REQUESTED) {
        DEBUG_ONLY(fprintf(stderr, "found while suspending all\n"));
        Parrot_cx_delete_suspend_for_gc(interp);
        interp->thread_data->state &= ~THREAD_STATE_SUSPEND_GC_REQUESTED;
        UNLOCK(interpreter_array_mutex);
        return;
    }

    /* now send all the non-suspended threads to suspend for GC */
    for (i = 0; i < n_interpreters; ++i) {
        Parrot_Interp other_interp = interpreter_array[i];

        if (interp == other_interp)
            continue;

        if (is_suspended_for_gc(other_interp))
            continue;

        pt_suspend_one_for_gc(other_interp);
    }
    UNLOCK(interpreter_array_mutex);
}

/*

=item C<void pt_suspend_self_for_gc(PARROT_INTERP)>

Suspends this thread for a full GC run.

XXX FIXME -- if GC is blocked, we need to do a GC run as soon
as it becomes unblocked.

=cut

*/

void
pt_suspend_self_for_gc(PARROT_INTERP)
{
    ASSERT_ARGS(pt_suspend_self_for_gc)
    PARROT_ASSERT(interp);
    PARROT_ASSERT(!Parrot_is_blocked_GC_mark(interp));
    DEBUG_ONLY(fprintf(stderr, "%p: suspend_self_for_gc\n", interp));
    /* since we are modifying our own state, we need to lock
     * the interpreter_array_mutex.
     */
    LOCK(interpreter_array_mutex);
    DEBUG_ONLY(fprintf(stderr, "%p: got lock\n", interp));

    PARROT_ASSERT(interp->thread_data->state &
            (THREAD_STATE_SUSPEND_GC_REQUESTED | THREAD_STATE_SUSPENDED_GC));

    if (interp->thread_data->state & THREAD_STATE_SUSPEND_GC_REQUESTED) {
        DEBUG_ONLY(fprintf(stderr, "remove queued request\n"));
        while (!PMC_IS_NULL(Parrot_cx_delete_suspend_for_gc(interp))) {/*Empty body*/};
        DEBUG_ONLY(fprintf(stderr, "removed all queued requests\n"));
        interp->thread_data->state &= ~THREAD_STATE_SUSPEND_GC_REQUESTED;
    }
    if (!(interp->thread_data->state & THREAD_STATE_SUSPENDED_GC)) {
        interp->thread_data->state |= THREAD_STATE_SUSPENDED_GC;
    }
    else {
        DEBUG_ONLY(fprintf(stderr, "no need to set suspended\n"));
    }
    UNLOCK(interpreter_array_mutex);

    /* mark and sweep our world -- later callbacks will keep
     * it sync'd
     */
    Parrot_gc_mark_and_sweep(interp, GC_trace_stack_FLAG);

    PARROT_ASSERT(!(interp->thread_data->state & THREAD_STATE_SUSPENDED_GC));
}

/*

=item C<PMC* pt_thread_join(Parrot_Interp parent, UINTVAL tid)>

Joins (by waiting for) a joinable thread.

=cut

*/

PARROT_CAN_RETURN_NULL
PMC*
pt_thread_join(ARGIN(Parrot_Interp parent), UINTVAL tid)
{
    ASSERT_ARGS(pt_thread_join)
    int           state;
    Parrot_Interp interp;

    LOCK(interpreter_array_mutex);

    interp = pt_check_tid(tid, "join");

    if (interp == parent)
        do_panic(parent, "Can't join self", __FILE__, __LINE__);

    if ((!(interp->thread_data->state & (THREAD_STATE_DETACHED
            | THREAD_STATE_JOINED)) &&
         !(interp->thread_data->state & THREAD_STATE_NOT_STARTED)) ||
            interp->thread_data->state == THREAD_STATE_FINISHED) {
        void *raw_retval = NULL;
        PMC *retval;

        interp->thread_data->state |= THREAD_STATE_JOINED;

        while (!(interp->thread_data->state & THREAD_STATE_FINISHED)) {
            interp->thread_data->joiner = parent;
            pt_thread_wait(parent);
        }

        UNLOCK(interpreter_array_mutex);
        JOIN(interp->thread_data->thread, raw_retval);

        retval = (PMC *)raw_retval;
        /*
         * we need to push a cleanup handler here: if cloning
         * of the retval fails (e.g. it's a NULLPMC) this lock
         * isn't released until eternity or someone hits ^C
         *
         * TODO This is needed for all places holding a lock for
         *      non-trivial tasks
         *      -leo
         * TODO remove that and replace it with proper exception
         *      handling, so that a failing clone in the parent
         *      just stops that thread
         *      -leo
         */
        LOCK(interpreter_array_mutex);
        CLEANUP_PUSH(mutex_unlock, &interpreter_array_mutex);

        if (retval) {
            PMC *parent_ret;
            /*
             * clone the PMC into caller, if it's not a shared PMC
             * the PMC is not in the parents root set nor in the
             * stack so block GC during clone
             * XXX should probably acquire the parent's interpreter mutex
             */
            Parrot_block_GC_mark(parent);
            parent_ret = make_local_copy(parent, interp, retval);

            /* this PMC is living only in the stack of this currently
             * dying interpreter, so register it in parent's GC registry
             * XXX is this still needed?
             */
            Parrot_pmc_gc_register(parent, parent_ret);
            Parrot_unblock_GC_mark(parent);
            retval = parent_ret;
        }
        else {
            retval = PMCNULL;
        }
        interpreter_array[tid] = NULL;
        --running_threads;

        DEBUG_ONLY(fprintf(stderr, "destroying an interpreter [join]\n"));
        if (Interp_debug_TEST(parent, PARROT_THREAD_DEBUG_FLAG))
            fprintf(stderr, "running threads %d\n", running_threads);

        /* reparent it so memory pool merging works */
        interp->parent_interpreter = parent;
        Parrot_really_destroy(interp, 0, NULL);

        CLEANUP_POP(1);
        /*
         * interpreter destruction is done - unregister the return
         * value, caller gets it now
         */
        if (retval)
            Parrot_pmc_gc_unregister(parent, retval);

        return retval;
    }
    /*
     * when here thread was in wrong state
     */
    state = interp->thread_data->state;
    UNLOCK(interpreter_array_mutex);
    Parrot_ex_throw_from_c_args(interp, NULL, 1,
        "join: illegal thread state %d tid %d", state, tid);
}

/*

=item C<void pt_join_threads(PARROT_INTERP)>

Possibly waits for other running threads. This is called when destroying
C<interp>.

=cut

*/

void
pt_join_threads(PARROT_INTERP)
{
    ASSERT_ARGS(pt_join_threads)
    size_t          i;
    pt_free_pool(interp);

    /* if no threads were started - fine */
    LOCK(interpreter_array_mutex);
    if (n_interpreters <= 1) {
        n_interpreters = 0;
        UNLOCK(interpreter_array_mutex);
        return;
    }

    /* only the first interpreter waits for other threads */
    if (interp != interpreter_array[0]) {
        UNLOCK(interpreter_array_mutex);
        return;
    }

    for (i = 1; i < n_interpreters; ++i) {
        Parrot_Interp thread_interp = interpreter_array[i];
        if (thread_interp == NULL)
            continue;
        if (thread_interp->thread_data->state == THREAD_STATE_JOINABLE ||
            (thread_interp->thread_data->state & THREAD_STATE_FINISHED)) {

            void *retval = NULL;
            thread_interp->thread_data->state |= THREAD_STATE_JOINED;
            UNLOCK(interpreter_array_mutex);
            JOIN(thread_interp->thread_data->thread, retval);
            LOCK(interpreter_array_mutex);
        }
    }
    UNLOCK(interpreter_array_mutex);
    return;
}

/*

=item C<static Parrot_Interp detach(UINTVAL tid)>

Helper for detach and kill.

Returns the interpreter, if it didn't finish yet.

=cut

*/

static Parrot_Interp
detach(UINTVAL tid)
{
    ASSERT_ARGS(detach)
    Parrot_Interp interp;

    LOCK(interpreter_array_mutex);
    interp = pt_check_tid(tid, "detach");
    /*
     * if interpreter is joinable, we detach em
     */
    if (interp->thread_data->state == THREAD_STATE_JOINABLE ||
            interp->thread_data->state == THREAD_STATE_FINISHED) {
        DETACH(interp->thread_data->thread);
        interp->thread_data->state |= THREAD_STATE_DETACHED;

        if (interp->thread_data->state & THREAD_STATE_FINISHED) {
            interpreter_array[tid] = NULL;
            DEBUG_ONLY(fprintf(stderr, "destroying an interpreter [detach]\n"));
            Parrot_really_destroy(interp, 0, NULL);
            interp = NULL;
        }
    }
    UNLOCK(interpreter_array_mutex);
    return interp;
}

/*

=item C<void pt_thread_detach(UINTVAL tid)>

Detaches the thread, making it non-joinable.

=cut

*/

void
pt_thread_detach(UINTVAL tid)
{
    ASSERT_ARGS(pt_thread_detach)
    (void) detach(tid);
}

/*

=item C<void pt_thread_kill(UINTVAL tid)>

Kills the thread.

=cut

*/

void
pt_thread_kill(UINTVAL tid)
{
    ASSERT_ARGS(pt_thread_kill)
    PARROT_INTERP = detach(tid);

    /* schedule a terminate event for that interpreter */
    if (interp)
        Parrot_cx_runloop_end(interp);
}

/*

=back

=head2 Threaded interpreter book-keeping

=over 4

=item C<void pt_add_to_interpreters(PARROT_INTERP, Parrot_Interp new_interp)>

Stores the given interpreter in the array of all interpreters.  Be sure to hold
C<interpreter_array_mutex>.

=cut

*/

void
pt_add_to_interpreters(PARROT_INTERP, ARGIN_NULLOK(Parrot_Interp new_interp))
{
    ASSERT_ARGS(pt_add_to_interpreters)
    size_t i;
    DEBUG_ONLY(fprintf(stderr, "interp = %p\n", interp));

    if (!new_interp) {
        /*
         * Create an entry for the very first interpreter, event
         * handling needs it
         */
        PARROT_ASSERT(!interpreter_array);
        PARROT_ASSERT(n_interpreters == 0);

        interpreter_array    = mem_internal_allocate_typed(Interp *);
        interpreter_array[0] = interp;
        n_interpreters       = 1;

        shared_gc_info = (Shared_gc_info *)mem_internal_allocate_zeroed(sizeof (*shared_gc_info));
        COND_INIT(shared_gc_info->gc_cond);
        PARROT_ATOMIC_INT_INIT(shared_gc_info->gc_block_level);
        PARROT_ATOMIC_INT_SET(shared_gc_info->gc_block_level, 0);

        /* XXX try to defer this until later */
        PARROT_ASSERT(interp == interpreter_array[0]);
        interp->thread_data      = mem_internal_allocate_zeroed_typed(Thread_data);
        INTERPRETER_LOCK_INIT(interp);
        interp->thread_data->tid = 0;

        return;
    }


    new_interp->thread_data = mem_internal_allocate_zeroed_typed(Thread_data);
    INTERPRETER_LOCK_INIT(new_interp);
    ++running_threads;
    if (Interp_debug_TEST(interp, PARROT_THREAD_DEBUG_FLAG))
        fprintf(stderr, "running threads %d\n", running_threads);

    /* look for an empty slot */
    for (i = 0; i < n_interpreters; ++i) {
        if (interpreter_array[i] == NULL) {
            interpreter_array[i] = new_interp;
            new_interp->thread_data->tid   = i;
            new_interp->thread_data->state = THREAD_STATE_NOT_STARTED;
            return;
        }
    }

    /* need to resize */
    interpreter_array = (Interp **)mem_internal_realloc(interpreter_array,
            (n_interpreters + 1) * sizeof (Interp *));

    interpreter_array[n_interpreters] = new_interp;
    new_interp->thread_data->tid      = n_interpreters;
    new_interp->thread_data->state    = THREAD_STATE_NOT_STARTED;

    ++n_interpreters;
}

/*

=back

=head2 GC Synchronization Functions

=over 4

=item C<void pt_gc_start_mark(PARROT_INTERP)>

Record that the mark phase of GC is about to begin. In the presence of shared
PMCs, we can only run one GC run at a time.

C<flags> are the GC flags. We check if we need to collect shared objects or
not.

TODO - Have a count of shared PMCs and check it during GC.

TODO - Evaluate if a interpreter lock is cheaper when C<gc_mark_ptr> is
updated.

=cut

*/

void
pt_gc_start_mark(PARROT_INTERP)
{
    ASSERT_ARGS(pt_gc_start_mark)
    Shared_gc_info *info;
    int             block_level;

    DEBUG_ONLY(fprintf(stderr, "%p: pt_gc_start_mark\n", interp));
    /* if no other threads are running, we are safe */
    if (!running_threads)
        return;

    info = get_pool();
    PARROT_ATOMIC_INT_GET(block_level, info->gc_block_level);

    DEBUG_ONLY(fprintf(stderr, "start threaded mark\n"));
    /*
     * TODO now check, if we are the owner of a shared memory pool
     * if yes:
     * - suspend all other threads by sending them a suspend event
     *   (or put a LOCK around updating the mark pointers)
     * - return and continue the mark phase
     * - then s. comments below
     */
    LOCK(interpreter_array_mutex);
    if (interp->thread_data->state & THREAD_STATE_SUSPENDED_GC) {
        PARROT_ASSERT(!(interp->thread_data->state &
                 THREAD_STATE_SUSPEND_GC_REQUESTED));
        DEBUG_ONLY(fprintf(stderr, "already suspended...\n"));
        UNLOCK(interpreter_array_mutex);
    }
    else if (block_level) {
        /* unthreaded collection */
        DEBUG_ONLY(fprintf(stderr, "... but blocked\n"));

        /* holding the lock */
        return;
    }
    else if (interp->thread_data->state &
               THREAD_STATE_SUSPEND_GC_REQUESTED) {
        while (!PMC_IS_NULL(Parrot_cx_delete_suspend_for_gc(interp))) {/*Empty body*/};

        interp->thread_data->state &= ~THREAD_STATE_SUSPEND_GC_REQUESTED;
        interp->thread_data->state |= THREAD_STATE_SUSPENDED_GC;

        DEBUG_ONLY(fprintf(stderr, "%p: detected request\n", interp));
        UNLOCK(interpreter_array_mutex);
    }
    else {
        /* we need to stop the world */
        DEBUG_ONLY(fprintf(stderr, "stop the world\n"));
        UNLOCK(interpreter_array_mutex);

        pt_suspend_all_for_gc(interp);
    }

    DEBUG_ONLY(fprintf(stderr, "%p: wait for stage\n", interp));
    pt_gc_wait_for_stage(interp, THREAD_GC_STAGE_NONE, THREAD_GC_STAGE_MARK);

    DEBUG_ONLY(fprintf(stderr, "actually mark\n"));
    /*
     * We can't allow parallel running GCs.
     */
    LOCK(interpreter_array_mutex);
    DEBUG_ONLY(fprintf(stderr, "got marking lock\n"));
}

/*

=item C<void pt_gc_mark_root_finished(PARROT_INTERP)>

Records that GC has finished for the root set.  EXCEPTION_UNIMPLEMENTED

=cut

*/

void
pt_gc_mark_root_finished(PARROT_INTERP)
{
    ASSERT_ARGS(pt_gc_mark_root_finished)
    if (!running_threads)
        return;
    /*
     * TODO now check, if we are the owner of a shared memory pool
     * if yes:
     * - now mark all members of our pool
     * - if all shared PMCs are marked by all threads then
     *   - we can continue to free unused objects
     */
}

/*

=item C<void pt_gc_stop_mark(PARROT_INTERP)>

Records that the mark phase of GC has completed.

=cut

*/

void
pt_gc_stop_mark(PARROT_INTERP)
{
    ASSERT_ARGS(pt_gc_stop_mark)
    if (!running_threads)
        return;
    /*
     * normal operation can continue now
     *   - other threads may or not free unused objects then,
     *     depending on their resource statistics
     */
    if (!(interp->thread_data->state & THREAD_STATE_SUSPENDED_GC)) {
        UNLOCK(interpreter_array_mutex);
        return;
    }

    PARROT_ASSERT(!(interp->thread_data->state &
             THREAD_STATE_SUSPEND_GC_REQUESTED));
    interp->thread_data->state &= ~THREAD_STATE_SUSPENDED_GC;

    while (!PMC_IS_NULL(Parrot_cx_delete_suspend_for_gc(interp))) {
        /* XXX FIXME make this message never trigger */
        fprintf(stderr, "%p: extraneous suspend_gc event\n", (void *)interp);
    }

    DEBUG_ONLY(fprintf(stderr, "%p: unlock\n", interp));
    UNLOCK(interpreter_array_mutex);
    DEBUG_ONLY(fprintf(stderr, "wait to sweep\n"));

    pt_gc_wait_for_stage(interp, THREAD_GC_STAGE_MARK, THREAD_GC_STAGE_SWEEP);
}

/*

=item C<void Parrot_shared_gc_block(PARROT_INTERP)>

Blocks stop-the-world GC runs.

=cut

*/

PARROT_EXPORT
void
Parrot_shared_gc_block(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_shared_gc_block)
    Shared_gc_info * const info = get_pool();

    if (info) {
        int level;
        PARROT_ATOMIC_INT_INC(level, info->gc_block_level);
        PARROT_ASSERT(level > 0);
    }
}

/*

=item C<void Parrot_shared_gc_unblock(PARROT_INTERP)>

Unblocks stop-the-world GC runs.

=cut

*/

PARROT_EXPORT
void
Parrot_shared_gc_unblock(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_shared_gc_unblock)
    Shared_gc_info * const info = get_pool();
    if (info) {
        int level;
        PARROT_ATOMIC_INT_DEC(level, info->gc_block_level);
        PARROT_ASSERT(level >= 0);
    }
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
