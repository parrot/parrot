/*
Copyright (C) 2001-2006, The Perl Foundation.
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
#include <assert.h>

#define THREAD_DEBUG 0

#if THREAD_DEBUG 
#define TRACE_THREAD(x...) \
    do { \
        fprintf(stderr, x); \
        fprintf(stderr, "\n"); \
    } while (0);
#else
static void TRACE_THREAD(const char *x, ...) {}
#endif

static int running_threads;

void Parrot_really_destroy(Interp *interpreter, int exit_code, void *arg);

struct _Shared_gc_info {
    thread_gc_stage_enum gc_stage;
    Parrot_cond gc_cond;
    int num_reached;

    Parrot_atomic_integer gc_block_level;
};

/*

=item C<static PMC*
make_local_copy(Parrot_Interp interpreter, Parrot_Interp from, PMC *original)>

Create a local copy of the PMC if necessary. (No copy is made if it
is marked shared.) This includes workarounds for Parrot_clone() not
doing the Right Thign with subroutines (specifically, code segments
aren't preserved and it is difficult to do so so long as 
Parrot_clone() depends on freezing).

=cut

*/

static PMC *
make_local_copy(Parrot_Interp interpreter, Parrot_Interp from, PMC *arg)
{
    PMC *ret_val;
    STRING *const _sub = interpreter->vtables[enum_class_Sub]->whoami;
    STRING *const _multi_sub = interpreter->vtables[enum_class_MultiSub]->whoami;
    if (PMC_IS_NULL(arg)) {
        ret_val = PMCNULL;
    } else if (PObj_is_PMC_shared_TEST(arg)) { 
        ret_val = arg;
    } else if (VTABLE_isa(from, arg, _multi_sub)) {
        INTVAL i = 0;
        INTVAL n = VTABLE_elements(from, arg);
        ret_val = pmc_new(interpreter, enum_class_MultiSub);
        for (i = 0; i < n; ++i) {
            PMC *const orig = VTABLE_get_pmc_keyed_int(from, arg, i);
            PMC *const copy = make_local_copy(interpreter, from, orig);
            VTABLE_push_pmc(interpreter, ret_val, copy);
        }
    } else if (VTABLE_isa(from, arg, _sub)) {
        /* this is a workaround for cloning subroutines not actually 
         * working as one might expect mainly because the segment is
         * not correctly copied
         */
        ret_val = Parrot_clone(interpreter, arg);
        PMC_sub(ret_val)->seg = PMC_sub(arg)->seg;
        Parrot_store_sub_in_namespace(interpreter, ret_val);
    } else {
        ret_val = Parrot_clone(interpreter, arg);
    }
    return ret_val;
}


static Shared_gc_info *get_pool(Parrot_Interp interpreter) {
    return shared_gc_info;
}


/*
=item C<static PMC *
make_local_args_copy(Parrot_Interp interpreter, PMC *args)>

Make a local copy of the corresponding array of arguments.

=cut
*/

static PMC *
make_local_args_copy(Parrot_Interp interpreter, Parrot_Interp old_interp, PMC *args)
{
    PMC *ret_val;
    INTVAL old_size;
    INTVAL i;

    if (PMC_IS_NULL(args)) {
        return PMCNULL;
    }

    old_size = VTABLE_get_integer(old_interp, args);
    
    /* XXX should this be a different type? */
    ret_val = pmc_new(interpreter, enum_class_FixedPMCArray);
    VTABLE_set_integer_native(interpreter, ret_val, old_size);
    
    for (i = 0; i < old_size; ++i) {
        PMC *copy;
        PMC *orig;

        orig = VTABLE_get_pmc_keyed_int(old_interp, args, i);

        copy = make_local_copy(interpreter, old_interp, 
                VTABLE_get_pmc_keyed_int(old_interp, args, i));

        VTABLE_set_pmc_keyed_int(interpreter, ret_val, i, copy); 
    }
    return ret_val;
}

/*

=item C<PMC *
pt_shared_fixup(Parrot_Interp interpreter, PMC *pmc)>

Fixup a PMC to be sharable. Right now, reassigns the vtable to one
owned by some master interpreter, so the PMC can be safely reused
after thread death.

In the future the PMC returned might be different than the one
passed, e.g., if we need to reallocate the PMC in a different
interpreter.

=cut

*/
PMC *pt_shared_fixup(Parrot_Interp interpreter, PMC *pmc) {
    if (PObj_is_object_TEST(pmc)) {
        Parrot_Interp master = interpreter_array[0];
        INTVAL type_num;
        PMC *vtable_cache;

        /* keep the original vtable from going away... */
        vtable_cache = ((PMC**) PMC_data(pmc->vtable->class))[PCD_OBJECT_VTABLE];
        assert(vtable_cache->vtable->base_type == enum_class_VtableCache);
        add_pmc_sync(interpreter, vtable_cache);
        PObj_is_PMC_shared_SET(vtable_cache);
        
        /* don't want the referenced class disappearing on us */
        LOCK_INTERPRETER(master);
        type_num = pmc->vtable->base_type;
        SET_CLASS((SLOTTYPE*) PMC_data(pmc), pmc, master->vtables[type_num]->class);
        UNLOCK_INTERPRETER(master);
    } else {
        /* TODO this will need to change for thread pools
         * XXX should we have a seperate interpreter for this?
         */
        Parrot_Interp master = interpreter_array[0];
        INTVAL type_num;
        int is_ro;

        is_ro = pmc->vtable->flags & VTABLE_IS_READONLY_FLAG;

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
            internal_exception(1, "pt_shared_fixup: unsharable type");
            return PMCNULL;
        }
        pmc->vtable = master->vtables[type_num];
        UNLOCK_INTERPRETER(master);
        if (is_ro)
            pmc->vtable = pmc->vtable->ro_variant_vtable;
    } 

    add_pmc_sync(interpreter, pmc);

    PObj_is_PMC_shared_SET(pmc);

    if (PMC_metadata(pmc))
        /* make sure metadata doesn't go away unexpectedly */
        PMC_metadata(pmc) = pt_shared_fixup(interpreter, PMC_metadata(pmc));

    return pmc;
}

/*

=item C<static void
pt_thread_signal(Parrot_Interp self, Parrot_Interp interp)>

Wakeup a C<interp> which should have called pt_thread_wait().

=cut

*/

static void
pt_thread_signal(Parrot_Interp self, Parrot_Interp interp) {
    COND_SIGNAL(interp->thread_data->interp_cond);
}

/*

=item C<void
pt_thread_wait_with(Parrot_Interp interp, Parrot_mutex *mutex)>

Wait for this interpreter to be signalled through its condition variable,
dealing properly with GC issues. C<*mutex> is assumed locked on entry and
will be locked on exit from this function. If a GC run occurs in the middle of
this function, then a spurious wakeup may occur.

=cut

*/

void
pt_thread_wait_with(Parrot_Interp interp, Parrot_mutex *mutex) {
    LOCK(interpreter_array_mutex);
    if (interp->thread_data->state & THREAD_STATE_SUSPEND_GC_REQUESTED) {
        interp->thread_data->state |= THREAD_STATE_SUSPENDED_GC;
        /* fprintf(stderr, "%p: pt_thread_wait, before sleep, doing GC run\n",
         *  interp); */
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
    } else {
        UNLOCK(interpreter_array_mutex);
    }
}

/*

=item C<static void
pt_thread_wait(Parrot_Interp interp)>

Wait for us to be signalled. GC matters are handled correctly.
C<interpreter_array_mutex> is assumed held. Spurious wakeups
may occur.

=cut

*/

static void
pt_thread_wait(Parrot_Interp interp) {
    if (interp->thread_data->state & THREAD_STATE_SUSPEND_GC_REQUESTED) {
        interp->thread_data->state |= THREAD_STATE_SUSPENDED_GC;
        /* fprintf(stderr, "%p: pt_thread_wait, before sleep, doing GC run\n",
         * interp); */
        UNLOCK(interpreter_array_mutex);
        pt_suspend_self_for_gc(interp);
        LOCK(interpreter_array_mutex);
        /* while we were GCing, whatever we were waiting on might have changed */
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

=item C<static void*
thread_func(void *arg)>

The actual thread function.

=cut

*/

static void pt_gc_wakeup_check(Interp *);

static void*
thread_func(void *arg)
{
    PMC * const self = (PMC*) arg;
    UINTVAL tid;
    PMC *ret_val = NULL;
    PMC *sub;
    PMC *sub_arg;
    Parrot_exception exp;
    int lo_var_ptr;

    Parrot_Interp interpreter = PMC_data(self);
    Parrot_block_DOD(interpreter);
    Parrot_block_GC(interpreter);
    /* need to set it here because argument passing can trigger GC */
    interpreter->lo_var_ptr = &lo_var_ptr;
    sub = PMC_struct_val(self);
    sub_arg = PMC_pmc_val(self);

    if (setjmp(exp.destination)) {
        Parrot_exception *except;
        /* caught exception */
        ret_val = PMCNULL;
        except = interpreter->exceptions;
        /* XXX what should we really do here */
        PIO_eprintf(interpreter,
            "Unhandled exception in thread with tid %d (message=%Ss, number=%d)\n",
            interpreter->thread_data->tid,
            except->msg,
            except->error);
    } else {
        /* run normally */
        push_new_c_exception_handler(interpreter, &exp);
        Parrot_unblock_DOD(interpreter);
        Parrot_unblock_GC(interpreter);
        ret_val = Parrot_runops_fromc_args(interpreter, sub, "PF", sub_arg);
    }
    /*
     * thread is finito
     */
    LOCK(interpreter_array_mutex);
    TRACE_THREAD("marking an thread as finished");
    interpreter->thread_data->state |= THREAD_STATE_FINISHED;
    tid = interpreter->thread_data->tid;
    if (interpreter != interpreter_array[tid]) {
        UNLOCK(interpreter_array_mutex);
        PANIC("thread finished: interpreter mismatch");
    }
    if (interpreter->thread_data->state & THREAD_STATE_DETACHED) {
        interpreter_array[tid] = NULL;
        TRACE_THREAD("really destroying an interpreter [exit while detached]");
        Parrot_really_destroy(interpreter, 0, NULL);
    } else if (interpreter->thread_data->state & THREAD_STATE_JOINED) {
        pt_thread_signal(interpreter, interpreter->thread_data->joiner);
    }

    /* make sure we don't block a GC run */
    pt_gc_wakeup_check(interpreter);
    assert(interpreter->thread_data->state & THREAD_STATE_FINISHED);

    UNLOCK(interpreter_array_mutex);

    return ret_val;
}


/*

=back

=head2 Helper functions used also for running plain interpreters

=over 4

=item C<void
pt_clone_code(Parrot_Interp d, Parrot_Interp s)>

Copy/clone the packfile/code from interpreter C<s> to C<d>. All
resources are created in C<d>.

=cut

*/

void
pt_clone_code(Parrot_Interp d, Parrot_Interp s)
{
    Parrot_block_DOD(d);
    Interp_flags_SET(d, PARROT_EXTERN_CODE_FLAG);
    d->code = NULL;
    Parrot_switch_to_cs(d, s->code, 1);
    Parrot_unblock_DOD(d);
}

/*

=item C<void
pt_clone_globals(Parrot_Interp d, Parrot_Interp s)>

Clone all globals from C<s> to C<d>.

=cut

*/

static void
pt_ns_clone(Parrot_Interp d, PMC *dest_ns, Parrot_Interp s, PMC *source_ns) {
    PMC * const iter = VTABLE_get_iter(s, source_ns);
    const INTVAL n = VTABLE_elements(s, source_ns);
    INTVAL i;
    for (i = 0; i < n; ++i) {
        /* XXX what if 'key' is a non-constant-pool string? */
        STRING * const key = VTABLE_shift_string(s, iter);
        PMC *val;
        val = VTABLE_get_pmc_keyed_str(s, source_ns, key);
        if (val->vtable->base_type == enum_class_NameSpace) {
            PMC *sub_ns;
            sub_ns = VTABLE_get_pmc_keyed_str(d, dest_ns, key);
            if (PMC_IS_NULL(sub_ns) || sub_ns->vtable->base_type !=
                    enum_class_NameSpace) {
                sub_ns = pmc_new(d, enum_class_NameSpace);
                VTABLE_set_pmc_keyed_str(d, dest_ns, key, sub_ns);
            }
            pt_ns_clone(d, sub_ns, s, val);
        } else {
            PMC *dval;
            dval = VTABLE_get_pmc_keyed_str(d, dest_ns, key);
            if (PMC_IS_NULL(dval)) {
                PMC *copy;
                copy = make_local_copy(d, s, val);
                VTABLE_set_pmc_keyed_str(d, dest_ns, key, copy);
            }
        }
    }
}

void
pt_clone_globals(Parrot_Interp d, Parrot_Interp s)
{
    Parrot_block_DOD(d);
    pt_ns_clone(d, d->root_namespace, s, s->root_namespace);
    Parrot_unblock_DOD(d);
}

/*

=item C<void
pt_thread_prepare_for_run(Parrot_Interp d, Parrot_Interp s)>

Setup code, and TODO ...

=cut

*/
void
pt_thread_prepare_for_run(Parrot_Interp d, Parrot_Interp s)
{
    Parrot_setup_event_func_ptrs(d);
}

/*

=back

=head2 ParrotThread methods

=over 4

=item C<int
pt_thread_run(Parrot_Interp interp, PMC* dest_interp, PMC* sub, PMC *arg)>

Run the C<*sub> PMC in a separate thread using interpreter in
C<*dest_interp>.

C<arg> should be an array of arguments for the subroutine.

=cut

*/
static void
pt_suspend_one_for_gc(Parrot_Interp interp);

/* create a clone of the sub suitable for the other interpreter;
 */
PMC *
pt_transfer_sub(Parrot_Interp d, Parrot_Interp s, PMC *sub) {
#if THREAD_DEBUG
    PIO_eprintf(s, "copying over subroutine [%Ss]\n",
        Parrot_full_sub_name(s, sub));
#endif
    return make_local_copy(d, s, sub);
}

int
pt_thread_run(Parrot_Interp interp, PMC* dest_interp, PMC* sub, PMC *arg)
{
    PMC *old_dest_interp;
    PMC *parent;
    Parrot_Interp interpreter = PMC_data(dest_interp);

    Parrot_block_GC(interpreter);
    Parrot_block_DOD(interpreter);
    Parrot_block_GC(interp);
    Parrot_block_DOD(interp);

    /* make a copy of the ParrotThread PMC so we can use it
     * to hold parameters to the new thread without it being
     * garbage collected or otherwise changed by the parent thread.
     * Also so the new thread's getinterp doesn't return an object
     * owned by the wrong interpreter -- which would be very bad
     * if the parent is destroyed before the child.
     * XXX FIXME move this elsewhere? at least the set_pmc_keyed_int
     */
    old_dest_interp = dest_interp;
    dest_interp = pmc_new_noinit(interpreter, enum_class_ParrotThread);
    PMC_data(old_dest_interp) = NULL; /* so it's not accidentally deleted */
    PMC_data(dest_interp) = interpreter;
    VTABLE_set_pmc_keyed_int(interpreter, interpreter->iglobals,
        (INTVAL) IGLOBALS_INTERPRETER, dest_interp);

    parent = VTABLE_get_pmc_keyed_int(interp, interp->iglobals,
                IGLOBALS_INTERPRETER);

    /*
     * TODO check if thread flags are consistent
     */
    if (interp->flags & PARROT_THR_COPY_INTERP)
        clone_interpreter(interpreter, PMC_data(parent), PARROT_CLONE_DEFAULT);
    /*
     * TODO thread pools
     */

    pt_thread_prepare_for_run(interpreter, interp);

    PMC_struct_val(dest_interp) = pt_transfer_sub(interpreter, interp, sub);
    PMC_pmc_val(dest_interp) = make_local_args_copy(interpreter, interp, arg);

    /*
     * set regs according to pdd03
     */
    interpreter->current_object = dest_interp;
    /*
     * create a joinable thread
     */
    interpreter->thread_data->state = THREAD_STATE_JOINABLE;

    Parrot_unblock_GC(interpreter);
    Parrot_unblock_DOD(interpreter);
    Parrot_unblock_GC(interp);
    Parrot_unblock_DOD(interp);

    THREAD_CREATE_JOINABLE(interpreter->thread_data->thread,
            thread_func, dest_interp);

    /* check for pending GC */
    LOCK(interpreter_array_mutex);
    if (interp->thread_data->state & THREAD_STATE_SUSPEND_GC_REQUESTED) {
        pt_suspend_one_for_gc(interpreter);
    }
    UNLOCK(interpreter_array_mutex);
    return 0;
}

/*

=item C<int
pt_thread_run_1(Parrot_Interp interp, PMC* dest_interp, PMC* sub, PMC *arg)>

Runs a type 1 thread. Nothing is shared, both interpreters are free
running without any communication.

=cut

*/

int
pt_thread_run_1(Parrot_Interp interp, PMC* dest_interp, PMC* sub, PMC *arg)
{
    interp->flags |= PARROT_THR_TYPE_1;
    return pt_thread_run(interp, dest_interp, sub, arg);
}

/*

=item C<int
pt_thread_run_2(Parrot_Interp interp, PMC* dest_interp, PMC* sub, PMC *arg)>

Runs a type 2 thread. No shared variables, threads are communicating by
sending messages.

=cut

*/

int
pt_thread_run_2(Parrot_Interp interp, PMC* dest_interp, PMC* sub, PMC *arg)
{
    interp->flags |= PARROT_THR_TYPE_2;
    return pt_thread_run(interp, dest_interp, sub, arg);
}

/*

=item C<int
pt_thread_run_3(Parrot_Interp interp, PMC* dest_interp, PMC* sub, PMC *arg)>

Run a type 3 thread. Threads may have shared variables and are managed
in a thread pool.

=cut

*/

int
pt_thread_run_3(Parrot_Interp interp, PMC* dest_interp, PMC* sub, PMC *arg)
{
    interp->flags |= PARROT_THR_TYPE_3;
    return pt_thread_run(interp, dest_interp, sub, arg);
}

/*

=item C<void
pt_thread_yield(void)>

Relinquishes hold on the processor.

=cut

*/

void
pt_thread_yield(void)
{
    YIELD;
}

/*

=item C<static Parrot_Interp
pt_check_tid(UINTVAL tid, const char *from)>

Helper function. Check if C<tid> is valid. The caller holds the mutex.
Returns the interpreter for C<tid>.

=cut

*/

static Parrot_Interp
pt_check_tid(UINTVAL tid, const char *from)
{
    if (tid >= n_interpreters) {
        UNLOCK(interpreter_array_mutex);
        internal_exception(1, "%s: illegal thread tid %d", from, tid);
    }
    if (tid == 0) {
        UNLOCK(interpreter_array_mutex);
        internal_exception(1, "%s: llegal thread tid %d (main)", from, tid);
    }
    if (!interpreter_array[tid]) {
        UNLOCK(interpreter_array_mutex);
        internal_exception(1, "%s: illegal thread tid %d - empty", from, tid);
    }
    return interpreter_array[tid];
}


/*

=item C<static void
mutex_unlock(void *arg)>

Unlocks the mutex C<*arg>.

=cut

*/

static void
mutex_unlock(void *arg)
{
    UNLOCK(*(Parrot_mutex*) arg);
}

/*

=item C<static int
is_suspended_for_gc(Parrot_Interp interp)>

Returns true iff C<interp> is suspended so a global GC can
be performed. interpreter_array_mutex must be held.

=cut

*/

static int
is_suspended_for_gc(Parrot_Interp interp) {
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

/* XXX should this function be in a different file? */
static void *
remove_queued_suspend_gc(Parrot_Interp interpreter) {
    QUEUE *queue = interpreter->task_queue;
    parrot_event *ev = NULL;
    QUEUE_ENTRY *cur;
    QUEUE_ENTRY *prev = NULL;

    queue_lock(queue);
    cur = queue->head;
    while (cur) {
        ev = cur->data;
        if (ev->type == EVENT_TYPE_SUSPEND_FOR_GC) {
            break;
        }
        prev = cur;
        cur = cur->next;
    }
    if (cur) {
        if (prev)
            prev->next = cur->next;
        else
            queue->head = cur->next;

        if (cur == queue->tail)
            queue->tail = prev;

        if (cur == queue->head)
            queue->head = cur->next;

        mem_sys_free(ev);
        mem_sys_free(cur);
        TRACE_THREAD("%p: remove_queued_suspend_gc: got one", interpreter);
    }
    queue_unlock(queue);
    return cur;
}

/* interpreter_array_mutex must be held */
static int
pt_gc_count_threads(Parrot_Interp interp) {
    int count = 0;
    UINTVAL i;
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
    TRACE_THREAD("found %d threads", count);
    return count;
}

static void
pt_gc_wait_for_stage(Parrot_Interp interp, thread_gc_stage_enum from_stage,
            thread_gc_stage_enum to_stage) {
    Shared_gc_info *info = shared_gc_info;
    int thread_count;
    TRACE_THREAD("%p: gc_wait_for_stage: %d->%d", interp, from_stage, to_stage);
   
    /* XXX well-timed thread death can mess this up */
    LOCK(interpreter_array_mutex);
    TRACE_THREAD("%p: got lock", interp);
    thread_count = pt_gc_count_threads(interp);
    assert(info->gc_stage == from_stage);
    assert(!(interp->thread_data->state & THREAD_STATE_NOT_STARTED));
    assert(!(interp->thread_data->state & THREAD_STATE_FINISHED));
    if (from_stage == 0)
        assert(interp->thread_data->state & THREAD_STATE_SUSPENDED_GC);
    else
        assert(!(interp->thread_data->state & THREAD_STATE_SUSPENDED_GC));
    ++info->num_reached;
    TRACE_THREAD("%p: gc_wait_for_stage: got %d", interp, info->num_reached);
    if (info->num_reached == thread_count) {
        info->gc_stage = to_stage;
        info->num_reached = 0;
        COND_BROADCAST(info->gc_cond);
    } else {
        do {
            COND_WAIT(info->gc_cond, interpreter_array_mutex);
        } while (info->gc_stage != to_stage);
    }
    UNLOCK(interpreter_array_mutex);
}

/* Check if we need to wakeup threads to perform garbage collection.
 * This is called after thread death.
 * interpreter_array_mutex is assumed held.
 */
static void
pt_gc_wakeup_check(Parrot_Interp interp) {
    Shared_gc_info *info = shared_gc_info;
    int thread_count;

    thread_count = pt_gc_count_threads(interp);
    if (info->num_reached == thread_count) {
        assert(info->gc_stage == THREAD_GC_STAGE_NONE);
        info->gc_stage = THREAD_GC_STAGE_MARK;
        info->num_reached = 0;
        COND_BROADCAST(info->gc_cond);
    }
}

/*

=item C<static void
pt_suspend_one_for_gc(Parrot_Interp interp)>

Suspend a single interpreter for GC. C<interpreter_array_mutex>
assumed held.

=cut

*/

static void
pt_suspend_one_for_gc(Parrot_Interp interp) {
    TRACE_THREAD("suspend one: %p", interp);
    if (is_suspended_for_gc(interp)) {
        TRACE_THREAD("ignoring already suspended");
        return;
    }

    if (interp->thread_data->state & THREAD_STATE_GC_WAKEUP) {
        TRACE_THREAD("just waking it up");
        interp->thread_data->state |= THREAD_STATE_SUSPENDED_GC;
        COND_SIGNAL(interp->thread_data->interp_cond);
    } else {
        TRACE_THREAD("queuing event");
        interp->thread_data->state |= THREAD_STATE_SUSPEND_GC_REQUESTED;
        Parrot_new_suspend_for_gc_event(interp);
    }
}

/*

=item C<static int 
pt_suspend_all_for_gc(Parrot_Interp interp)>

Get all threads to perform a GC run.
=cut

*/

static void 
pt_suspend_all_for_gc(Parrot_Interp interp)
{
    int all_suspended;
    UINTVAL i;

    TRACE_THREAD("suspend_all_for_gc [interp=%p]", interp);

    LOCK(interpreter_array_mutex);
    interp->thread_data->state |= THREAD_STATE_SUSPENDED_GC;

    if (interp->thread_data->state & THREAD_STATE_SUSPEND_GC_REQUESTED) {
        TRACE_THREAD("found while suspending all\n");
        remove_queued_suspend_gc(interp);
        interp->thread_data->state &= ~THREAD_STATE_SUSPEND_GC_REQUESTED;
        UNLOCK(interpreter_array_mutex);
        return;
    }

#if 0
    for (i = 0; i < n_interpreters; ++i) {
        Parrot_Interp other_interp;
        other_interp = interpreter_array[i];
        if (!other_interp) {
            continue;
        }
        if (is_suspended_for_gc(other_interp) &&
                    other_interp != interp && 
                    (other_interp->thread_data->state & THREAD_STATE_SUSPENDED_GC)) {
            int successp;
            /* this means that someone else already got this far,
             * so we have a suspend event in our queue to ignore
             */
            /* XXX still reachable? */
            TRACE_THREAD("apparently someone else is doing it [%p]", other_interp);
            fprintf(stderr, "??? found later (%p)\n", other_interp);
            successp = remove_queued_suspend_gc(interp);
            assert(successp);
            UNLOCK(interpreter_array_mutex);
            return;
        }
    }
#endif

    /* now send all the non-suspended threads to suspend for GC */
    for (i = 0; i < n_interpreters; ++i) {
        Parrot_Interp other_interp;
        other_interp = interpreter_array[i];
        if (interp == other_interp) {
            continue;
        }

        pt_suspend_one_for_gc(other_interp);
    } 
    UNLOCK(interpreter_array_mutex);
}

/*

=item C<void
pt_suspend_self_for_gc(Parrot_Interp interp)>

Suspend this thread for a full GC run.

XXX FIXME -- if GC is blocked, we need to do a GC run as soon
as it becomes unblocked.

=cut
*/

void
pt_suspend_self_for_gc(Parrot_Interp interp)
{
    assert(interp);
    assert(!interp->arena_base->DOD_block_level);
    TRACE_THREAD("%p: suspend_self_for_gc", interp);
    /* since we are modifying our own state, we need to lock
     * the interpreter_array_mutex.
     */
    LOCK(interpreter_array_mutex);
    TRACE_THREAD("%p: got lock", interp);
    assert(interp->thread_data->state & 
            (THREAD_STATE_SUSPEND_GC_REQUESTED | THREAD_STATE_SUSPENDED_GC));
    if (interp->thread_data->state & THREAD_STATE_SUSPEND_GC_REQUESTED) {
        TRACE_THREAD("remove queued request");
        while (remove_queued_suspend_gc(interp));
        interp->thread_data->state &= ~THREAD_STATE_SUSPEND_GC_REQUESTED;
    }
    if (!(interp->thread_data->state & THREAD_STATE_SUSPENDED_GC)) {
        interp->thread_data->state |= THREAD_STATE_SUSPENDED_GC;
    } else {
        TRACE_THREAD("no need to set suspended\n");
    }
    UNLOCK(interpreter_array_mutex);

    /* mark and sweep our world -- latter callbacks will keep
     * it sync'd
     */
    Parrot_dod_ms_run(interp, DOD_trace_stack_FLAG);

    assert(!(interp->thread_data->state & THREAD_STATE_SUSPENDED_GC));
}
/*

=item C<PMC*
pt_thread_join(Parrot_Interp parent, UINTVAL tid)>

Join (wait for) a joinable thread.

=cut

*/

PMC*
pt_thread_join(Parrot_Interp parent, UINTVAL tid)
{
    int state;
    Parrot_Interp interpreter;

    LOCK(interpreter_array_mutex);
    interpreter = pt_check_tid(tid, "join");
    if (interpreter == parent)
        do_panic(parent, "Can't join self", __FILE__, __LINE__);
    if ((!(interpreter->thread_data->state & (THREAD_STATE_DETACHED 
            | THREAD_STATE_JOINED)) &&
         !(interpreter->thread_data->state & THREAD_STATE_NOT_STARTED)) ||
            interpreter->thread_data->state == THREAD_STATE_FINISHED) {
        void *raw_retval = NULL;
        PMC *retval;
        interpreter->thread_data->state |= THREAD_STATE_JOINED;
        while (!(interpreter->thread_data->state & THREAD_STATE_FINISHED)) {
            interpreter->thread_data->joiner = parent;
            pt_thread_wait(parent);
        }
        UNLOCK(interpreter_array_mutex);
        JOIN(interpreter->thread_data->thread, raw_retval);
        retval = raw_retval;
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
             * clone the PMC into caller, if its not a shared PMC
             * the PMC is not in the parents root set nor in the
             * stack so block DOD during clone
             * XXX should probably acquire the parent's interpreter mutex
             */
            Parrot_block_DOD(parent);
            parent_ret = make_local_copy(parent, interpreter, retval);
            /* this PMC is living only in the stack of this currently
             * dying interpreter, so register it in parents DOD registry
             * XXX is this still needed?
             */
            dod_register_pmc(parent, parent_ret);
            Parrot_unblock_DOD(parent);
            retval = parent_ret;
        } else {
            retval = PMCNULL;
        }
        interpreter_array[tid] = NULL;
        running_threads--;
        TRACE_THREAD("destroying an interpreter [join]");
        if (Interp_debug_TEST(parent, PARROT_THREAD_DEBUG_FLAG))
            fprintf(stderr, "running threads %d\n", running_threads);
        
        /* reparent it so memory pool merging works */
        interpreter->parent_interpreter = parent;
        Parrot_really_destroy(interpreter, 0, NULL);
        CLEANUP_POP(1);
        /*
         * interpreter destruction is done - unregister the return
         * value, caller gets it now
         */
        if (retval)
            dod_unregister_pmc(parent, retval);
        return retval;
    }
    /*
     * when here thread was in wrong state
     */
    state = interpreter->thread_data->state;
    UNLOCK(interpreter_array_mutex);
    internal_exception(1, "join: illegal thread state %d tid %d",
            state, tid);
    return NULL;
}

/*

=item C<void
pt_join_threads(Parrot_Interp interpreter)>

Possibly wait for other running threads. This is called when destroying
C<interpreter>.

=cut

*/

void
pt_join_threads(Parrot_Interp interpreter)
{
    size_t i;

    /*
     * if no threads where started - fine
     */
    LOCK(interpreter_array_mutex);
    if (n_interpreters <= 1) {
        UNLOCK(interpreter_array_mutex);
        return;
    }
    /*
     * only the first interpreter waits for other threads
     */
    if (interpreter != interpreter_array[0]) {
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

=item C<static Parrot_Interp
detach(UINTVAL tid)>

Helper for detach and kill.

Returns the interpreter, if it didn't finish yet.

=cut

*/

static Parrot_Interp
detach(UINTVAL tid)
{
    Parrot_Interp interpreter;

    LOCK(interpreter_array_mutex);
    interpreter = pt_check_tid(tid, "detach");
    /*
     * if interpreter is joinable, we detach em
     */
    if (interpreter->thread_data->state == THREAD_STATE_JOINABLE ||
            interpreter->thread_data->state == THREAD_STATE_FINISHED) {
        DETACH(interpreter->thread_data->thread);
        interpreter->thread_data->state |= THREAD_STATE_DETACHED;
        if (interpreter->thread_data->state & THREAD_STATE_FINISHED) {
            interpreter_array[tid] = NULL;
            TRACE_THREAD("destroying an interpreter [detach]");
            Parrot_really_destroy(interpreter, 0, NULL);
            interpreter = NULL;
        }
    }
    UNLOCK(interpreter_array_mutex);
    return interpreter;
}

/*

=item C<void
pt_thread_detach(UINTVAL tid)>

Detaches (make non-joinable) the thread.

=cut

*/

void
pt_thread_detach(UINTVAL tid)
{
    (void) detach(tid);
}

/*

=item C<void
pt_thread_kill(UINTVAL tid)>

Kills the thread.

=cut

*/

void
pt_thread_kill(UINTVAL tid)
{
    Parrot_Interp interpreter = detach(tid);

    if (interpreter) {
        /*
         * schedule a terminate event for that interpreter
         */
        Parrot_new_terminate_event(interpreter);
    }
}

/*

=back

=head2 Threaded interpreter book-keeping

=over 4

=item C<void
pt_add_to_interpreters(Parrot_Interp interpreter, Parrot_Interp new_interp)>

All threaded interpreters are stored in an array. Assumes that caller
holds LOCK.

=cut

*/

void
pt_add_to_interpreters(Parrot_Interp interpreter, Parrot_Interp new_interp)
{
    size_t i;
    TRACE_THREAD("interp = %p", interpreter);

    if (!new_interp) {
        /*
         * Create an entry for the very first interpreter, event
         * handling needs it
         */
        assert(!interpreter_array);
        assert(n_interpreters == 0);

        interpreter_array = mem_sys_allocate(sizeof(Interp*));
        interpreter_array[0] = interpreter;
        n_interpreters = 1;

        shared_gc_info = mem_sys_allocate_zeroed(sizeof(*shared_gc_info));
        COND_INIT(shared_gc_info->gc_cond);
        PARROT_ATOMIC_INT_INIT(shared_gc_info->gc_block_level);
        PARROT_ATOMIC_INT_SET(shared_gc_info->gc_block_level, 0);
        
        /* XXX try to defer this until later */
        assert(interpreter == interpreter_array[0]);
        interpreter->thread_data =
            mem_sys_allocate_zeroed(sizeof(Thread_data));
        INTERPRETER_LOCK_INIT(interpreter);
        interpreter->thread_data->tid = 0;

        return;
    }
    
    
    new_interp->thread_data = mem_sys_allocate_zeroed(sizeof(Thread_data));
    INTERPRETER_LOCK_INIT(new_interp);
    running_threads++;
    if (Interp_debug_TEST(interpreter, PARROT_THREAD_DEBUG_FLAG))
        fprintf(stderr, "running threads %d\n", running_threads);
    /*
     * look for an empty slot
     */
    for (i = 0; i < n_interpreters; ++i) {
        if (interpreter_array[i] == NULL) {
            interpreter_array[i] = new_interp;
            new_interp->thread_data->tid = i;
            new_interp->thread_data->state = THREAD_STATE_NOT_STARTED;
            return;
        }
    }
    /*
     * need to resize
     */
    interpreter_array = mem_sys_realloc(interpreter_array,
            (n_interpreters + 1) * sizeof(Interp*));
    interpreter_array[n_interpreters] = new_interp;
    new_interp->thread_data->tid = n_interpreters;
    new_interp->thread_data->state = THREAD_STATE_NOT_STARTED;
    ++n_interpreters;
}

/*

=back

=head2 DOD Synchronization Functions

=over 4

=item C<void
pt_DOD_start_mark(Parrot_Interp interpreter)>

DOD is gonna start the mark phase. In the presence of shared PMCs, we
can only run one DOD run at a time because
C<< PMC->next_for_GC >> may be changed.

C<flags> are the DOD flags. We check if we need to collect shared objects
or not.

TODO - Have a count of shared PMCs and check it during DOD.

TODO - Evaluate, if a interpreter lock is cheaper, when C<dod_mark_ptr>
is updated.

=cut

*/

void
pt_DOD_start_mark(Parrot_Interp interpreter)
{
    Shared_gc_info *info;
    int block_level;

    TRACE_THREAD("%p: pt_DOD_start_mark", interpreter);
    /* if no other threads are running, we are safe */
    if (!running_threads)
        return;

    info = get_pool(interpreter);
    PARROT_ATOMIC_INT_GET(block_level, info->gc_block_level);

    TRACE_THREAD("start threaded mark");
    /*
     * TODO now check, if we are the owner of a shared memory pool
     * if yes:
     * - suspend all other threads by sending them a suspend event
     *   (or put a LOCK around updating the mark pointers)
     * - return and continue the mark phase
     * - then s. comments below
     */
    LOCK(interpreter_array_mutex);
    if (interpreter->thread_data->state & THREAD_STATE_SUSPENDED_GC) {
        assert(!(interpreter->thread_data->state & THREAD_STATE_SUSPEND_GC_REQUESTED));
        TRACE_THREAD("already suspended...");
        UNLOCK(interpreter_array_mutex);
    } else if (block_level) {
        /* unthreaded collection */
        TRACE_THREAD("... but blocked");
        return; /* holding the lock */
    } else if (interpreter->thread_data->state & THREAD_STATE_SUSPEND_GC_REQUESTED) {
        while (remove_queued_suspend_gc(interpreter));
        interpreter->thread_data->state &= ~THREAD_STATE_SUSPEND_GC_REQUESTED;
        interpreter->thread_data->state |= THREAD_STATE_SUSPENDED_GC;
        TRACE_THREAD("%p: detected request", interpreter);
        UNLOCK(interpreter_array_mutex);
    } else { 
        /* we need to stop the world */
        TRACE_THREAD("stop the world");
        UNLOCK(interpreter_array_mutex);
        pt_suspend_all_for_gc(interpreter);
    }
    
    TRACE_THREAD("%p: wait for stage", interpreter);
    pt_gc_wait_for_stage(interpreter, THREAD_GC_STAGE_NONE,
        THREAD_GC_STAGE_MARK);

    TRACE_THREAD("actually mark");
    /*
     * we can't allow parallel running DODs both would mess with shared PMCs
     * next_for_GC pointers
     */
    LOCK(interpreter_array_mutex);
    TRACE_THREAD("got marking lock");
}

/*

=item C<void
pt_DOD_mark_root_finished(Parrot_Interp interpreter)>

DOD is finished for the root set.

=cut

*/

void
pt_DOD_mark_root_finished(Parrot_Interp interpreter)
{
    if (!running_threads)
        return;
    /*
     * TODO now check, if we are the owner of a shared memory pool
     * if yes:
     * - now run DOD_mark on all members of our pool
     * - if all shared PMCs are marked by all threads then
     *   - we can continue to free unused objects
     */
}

/*

=item C<void
pt_DOD_stop_mark(Parrot_Interp interpreter)>

DOD's mark phase is done.

=cut

*/

void
pt_DOD_stop_mark(Parrot_Interp interpreter)
{
    if (!running_threads)
        return;
    /*
     * normal operation can continue now
     *   - other threads may or not free unused objects then,
     *     depending on their resource statistics
     */
    if (!(interpreter->thread_data->state & THREAD_STATE_SUSPENDED_GC)) {
        UNLOCK(interpreter_array_mutex);
        return;
    }
    assert(!(interpreter->thread_data->state & THREAD_STATE_SUSPEND_GC_REQUESTED));
    interpreter->thread_data->state &= ~THREAD_STATE_SUSPENDED_GC;
    while (remove_queued_suspend_gc(interpreter)) {
        /* XXX FIXME make this message never trigger */
        fprintf(stderr, "%p: extraneous suspend_gc event\n", interpreter);
    }
    TRACE_THREAD("%p: unlock", interpreter);
    UNLOCK(interpreter_array_mutex);
    TRACE_THREAD("wait to sweep");
    pt_gc_wait_for_stage(interpreter, THREAD_GC_STAGE_MARK, THREAD_GC_STAGE_SWEEP);

}

/*

=item C<void
Parrot_shared_DOD_block(Parrot_Interp interpreter)>

Block stop-the-world DOD runs.

=cut

*/

void
Parrot_shared_DOD_block(Parrot_Interp interpreter) {
    Shared_gc_info *info;
    int level;

    info = get_pool(interpreter);
    if (info) {
        PARROT_ATOMIC_INT_INC(level, info->gc_block_level);
        assert(level > 0);
    }
}

/*

=item C<void
Parrot_shared_DOD_unblock(Parrot_Interp interpreter)>

Unblock stop-the-world DOD runs.

=cut

*/

void Parrot_shared_DOD_unblock(Parrot_Interp interpreter) {
    Shared_gc_info *info;
    int level;

    info = get_pool(interpreter);
    if (info) {
        PARROT_ATOMIC_INT_DEC(level, info->gc_block_level);
        assert(level >= 0);
    }
}

/*

=back

=head1 HISTORY

2003.12.18 leo initial rev

=head1 SEE ALSO

F<src/pmc/parrotinterpreter.pmc>, F<docs/dev/events.pod>.

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
