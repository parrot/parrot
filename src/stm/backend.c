/*
 * $Id$
 * Copyright (C) 2006-2008, The Perl Foundation
 */

#include <parrot/parrot.h>
#include <parrot/atomic.h>

/*
=head1 NAME

src/stm/backend.c -- Software transactional memory implementation

=head1 DESCRIPTION

This file implements the non-user-visible parts of the Software
Transactional Memory implementation, including handling of all
the low-level synchronization.

=head2 Functions

=over 4

=cut

*/


#include "stm_waitlist.h"
#include "stm_internal.h"

#define STM_DEBUG 0

#if STM_DEBUG
#  define STM_TRACE(x...) Parrot_io_fprintf(interp, Parrot_io_STDERR(interp), x); \
                                   Parrot_io_fprintf(interp, Parrot_io_STDERR(interp), "\n")
#  undef fprintf
#  define STM_TRACE_SAFE(x...) fprintf(stderr, x); fprintf(stderr, "\n");
#else
static void STM_TRACE(const char *x, ...) /* HEADERIZER SKIP */
{
    UNUSED(x);
}
static void STM_TRACE_SAFE(const char *x, ...) /* HEADERIZER SKIP */
{
    UNUSED(x);
}
#endif

/* HEADERIZER HFILE: include/parrot/stm/backend.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STM_read_record * alloc_read(PARROT_INTERP, ARGMOD(STM_tx_log *log))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*log);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STM_write_record * alloc_write(PARROT_INTERP,
    ARGMOD(STM_tx_log *log))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*log);

static void do_partial_abort(PARROT_INTERP,
    ARGIN(STM_tx_log *log),
    ARGIN(STM_tx_log_sub *inner))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void do_real_abort(PARROT_INTERP,
    ARGMOD(STM_tx_log *log),
    ARGIN(STM_tx_log_sub *inner))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*log);

static int do_real_commit(PARROT_INTERP, ARGIN(STM_tx_log *log))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STM_write_record * find_write_record(PARROT_INTERP,
    Parrot_STM_PMC_handle handle,
    int overwrite_p)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC * force_sharing(PARROT_INTERP, ARGIN_NULLOK(PMC *pmc))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STM_read_record * get_read(SHIM_INTERP,
    ARGIN(STM_tx_log *log),
    int i)
        __attribute__nonnull__(2);

static int get_read_valid_depth(PARROT_INTERP, ARGIN(STM_tx_log *log))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STM_tx_log_sub * get_sublog(ARGIN(STM_tx_log *log), int i)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STM_write_record * get_write(SHIM_INTERP,
    ARGIN(STM_tx_log *log),
    int i)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static int is_aborted(ARGIN(STM_tx_log *log))
        __attribute__nonnull__(1);

PARROT_PURE_FUNCTION
static int is_version(ARGIN(const void *maybe_version))
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC * local_pmc_copy(PARROT_INTERP, ARGIN_NULLOK(PMC *original))
        __attribute__nonnull__(1);

static void mark_read_record(PARROT_INTERP, ARGMOD(STM_read_record *read))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*read);

static void mark_write_record(PARROT_INTERP,
    ARGMOD(STM_write_record *write))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*write);

static int merge_transactions(PARROT_INTERP,
    ARGMOD(STM_tx_log *log),
    ARGIN(STM_tx_log_sub *outer),
    ARGIN(STM_tx_log_sub *inner),
    int always)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*log);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static void * next_version(ARGIN(const void *old_version))
        __attribute__nonnull__(1);

static void replay_writes(PARROT_INTERP,
    ARGIN(STM_tx_log *log),
    int from,
    int to)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static int safe_to_clone(SHIM_INTERP, ARGIN(const PMC *original))
        __attribute__nonnull__(2);

static int setup_wait(PARROT_INTERP, ARGMOD(STM_tx_log *log))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*log);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static void * wait_for_version(PARROT_INTERP,
    ARGMOD(STM_tx_log *log),
    Parrot_STM_PMC_handle handle)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*log);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void Parrot_STM_destroy>

Frees all resources associated with STM in the interpreter C<interp>.

=cut

*/

void
Parrot_STM_destroy(PARROT_INTERP)
{
    STM_tx_log *log;

    if (!interp->thread_data || !interp->thread_data->stm_log)
        return;

    log = (STM_tx_log *)interp->thread_data->stm_log;
    mem_sys_free(log->writes);
    mem_sys_free(log->reads);
    Parrot_STM_waitlist_destroy_thread(interp);
    mem_sys_free(log);
    interp->thread_data->stm_log = NULL;
}


/*

=item C<Parrot_STM_PMC_handle Parrot_STM_alloc>

Creates a new handle that will wrap an STM-managed PMC. The initial value
of the PMC will be a copy of C<pmc>.

=cut

*/

Parrot_STM_PMC_handle
Parrot_STM_alloc(PARROT_INTERP, ARGIN_NULLOK(PMC *pmc))
{
    Parrot_STM_PMC_handle_data *handle;
    Small_Object_Pool *ignored;
    STM_TRACE("Parrot_STM_alloc");

    ignored = make_bufferlike_pool(interp, sizeof (Parrot_STM_PMC_handle_data));
    UNUSED(ignored);
    handle = (Parrot_STM_PMC_handle_data *)new_bufferlike_header(interp,
                sizeof (Parrot_STM_PMC_handle_data));

    PObj_external_SET(&handle->buf);
    PObj_is_shared_SET(&handle->buf);

    PARROT_ATOMIC_PTR_INIT(handle->owner_or_version);
    /* XXX */
    PARROT_ATOMIC_PTR_SET(handle->owner_or_version, UINTVAL2PTR(void *, 1));

    handle->last_version = UINTVAL2PTR(void *, 1);
    handle->value        = force_sharing(interp, pmc);

    Parrot_STM_waitlist_init(interp, &handle->change_waitlist);

    return handle;
}

/* XXX FIXME these are just to make Parrot_clone work.
 * Real solution will require knowing when we are cloning
 * and when it is a normal freeze/thaw -- or implementing
 * cloning seperately.
 */

/*

=item C<void Parrot_freeze_STM_PMC_handle>

Freezes an STM PMC by calling the "push_pmc" vtable method.

=cut

*/

void
Parrot_freeze_STM_PMC_handle(PARROT_INTERP, ARGMOD(IMAGE_IO *io),
            ARGIN(Parrot_STM_PMC_handle handle))
{
    VTABLE_push_pmc(interp, io, (PMC*) handle);
}

/*

=item C<Parrot_STM_PMC_handle Parrot_thaw_STM_PMC_handle>

Thaws an STM PMC by calling the "shift_pmc" vtable method.

=cut

*/

Parrot_STM_PMC_handle
Parrot_thaw_STM_PMC_handle(PARROT_INTERP, ARGIN(IMAGE_IO *io))
{
    Parrot_STM_PMC_handle handle = (Parrot_STM_PMC_handle) VTABLE_shift_pmc(interp, io);
    return handle;
}


/*

=item C<static STM_write_record * get_write>

Retrieves the C<i>th write from C<log>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STM_write_record *
get_write(SHIM_INTERP, ARGIN(STM_tx_log *log), int i)
{
    PARROT_ASSERT(i >= 0);
    PARROT_ASSERT(i <= log->last_write);
    return &log->writes[i];
}

/*

=item C<static STM_read_record * get_read>

Retreives the C<i>th read from C<log>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STM_read_record *
get_read(SHIM_INTERP, ARGIN(STM_tx_log *log), int i)
{
    PARROT_ASSERT(i >= 0);
    PARROT_ASSERT(i <= log->last_read);
    return &log->reads[i];
}

/* alloc_write and alloc_read zero out the records so that if a GC run
 * occurs in the middle of them -- e.g. because a debugging function
 * triggered a string allocation -- then the transaction log may be
 * marked with the value uninitialized.
 */

/*

=item C<static STM_write_record * alloc_write>

Allocates a new STM write in C<log>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STM_write_record *
alloc_write(PARROT_INTERP, ARGMOD(STM_tx_log *log))
{
    STM_write_record *write;
    const int         i = ++log->last_write;

    if (i >= log->writes_alloced) {
        log->writes_alloced *= 2;
        log->writes          = (STM_write_record *)mem_sys_realloc(log->writes,
            sizeof (*log->writes) * log->writes_alloced);
    }

    write        = get_write(interp, log, i);
    write->value = NULL;

    return write;
}

/*

=item C<static STM_read_record * alloc_read>

Allocates a new STM read in C<log>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STM_read_record *
alloc_read(PARROT_INTERP, ARGMOD(STM_tx_log *log))
{
    STM_read_record *read;
    const int i = ++log->last_read;

    if (i >= log->reads_alloced) {
        log->reads_alloced *= 2;
        log->reads          = (STM_read_record *)mem_sys_realloc(log->reads,
            sizeof (*log->reads) * log->reads_alloced);
    }

    read        = get_read(interp, log, i);
    read->value = NULL;

    return read;
}

/*

=item C<static void * next_version>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static void *
next_version(ARGIN(const void *old_version))
{
    const UINTVAL v = PTR2UINTVAL(old_version) + 2;

    return UINTVAL2PTR(void *, v);
}

/*

=item C<static int is_version>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_PURE_FUNCTION
static int
is_version(ARGIN(const void *maybe_version))
{
    const UINTVAL v = PTR2UINTVAL(maybe_version);
    return v & 1;
}

/*

=item C<static STM_tx_log_sub * get_sublog>

Retrives the C<i>th sublog from C<log>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STM_tx_log_sub *
get_sublog(ARGIN(STM_tx_log *log), int i)
{
    PARROT_ASSERT(i > 0);
    PARROT_ASSERT(i <= log->depth);
    return &log->inner[i - 1];
}

/*

=item C<static int is_aborted>

Determines whether any of the sublogs in C<log> are aborted. Checks the
status of each sublog to determine if any have a status of
C<STM_STATUS_ABORTED>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
is_aborted(ARGIN(STM_tx_log *log))
{
    int i;

    for (i = 1; i <= log->depth; ++i) {
        int status;
        STM_tx_log_sub * const sublog = get_sublog(log, i);

        PARROT_ATOMIC_INT_GET(status, sublog->status);
        if (status == STM_STATUS_ABORTED)
            return 1;
    }

    return 0;
}

/*

=item C<void Parrot_STM_start_transaction>

Start a new transaction for the interpreter C<interp>. If there is
already a transaction in progress, starts a nested transaction.

=cut

*/

void
Parrot_STM_start_transaction(PARROT_INTERP)
{
    STM_tx_log     * const log = Parrot_STM_tx_log_get(interp);
    STM_tx_log_sub *       newsub;

    ++log->depth;
    newsub = get_sublog(log, log->depth);

    PARROT_ATOMIC_INT_SET(newsub->wait_length, 0);

    newsub->first_read  = log->last_read  + 1;
    newsub->first_write = log->last_write + 1;

    if (log->depth == 1) {
        PARROT_ASSERT(newsub->first_read == 0);
        PARROT_ASSERT(newsub->first_write == 0);
    }

    PARROT_ATOMIC_INT_SET(newsub->status, STM_STATUS_ACTIVE);
    STM_TRACE("starting transaction, depth=%d", log->depth);
}

/*

=item C<static int merge_transactions>

To 'commit' an inner transaction, we merge it into the outer transaction.
In the process of doing this, we may detect that the inner transaction should
abort despite the outer transaction being safe. If C<always> is true, we
merge regardless. Otherwise, we leave the inner transactions unmerged
so we can abort.

=cut

*/

static int
merge_transactions(PARROT_INTERP, ARGMOD(STM_tx_log *log),
        ARGIN(STM_tx_log_sub *outer), ARGIN(STM_tx_log_sub *inner), int always)
{
    int i;
    int status;
    int need_abort = 0;

    PARROT_ATOMIC_INT_GET(status, inner->status);

    if (!always && status == STM_STATUS_ABORTED)
        return 0;

    for (i = inner->first_write; i <= log->last_write; ++i) {
        int successp;

        STM_write_record * const write = get_write(interp, log, i);

        if (!write->handle)
            continue;

        PARROT_ATOMIC_PTR_CAS(successp, write->handle->owner_or_version,
                              inner, outer);

        /* if the previous version came from the outer transaction,
         * invalidate the outer write record
         */
        if (write->saw_version == outer) {
            int j;

            for (j = outer->first_write; j < inner->first_write; ++j) {
                STM_write_record * const old_write = get_write(interp, log, j);

                if (old_write->handle == write->handle) {
                    old_write->handle  = NULL;
                    write->saw_version = old_write->saw_version;
                    break;
                }
            }

            PARROT_ASSERT(write->saw_version != outer);
        }

        if (!successp) {
            need_abort = 1;

            if (!always)
                break;
        }
    }

    PARROT_ATOMIC_INT_GET(status, inner->status);

    if (status == STM_STATUS_ABORTED)
        need_abort = 1;

    if (!always && need_abort) {
        /* unmerge, mark as aborted the inner transaction */
        for (i = inner->first_write; i <= log->last_write; ++i) {
            int successp;
            STM_write_record * const write = get_write(interp, log, i);

            if (!write->handle)
                continue;

            PARROT_ATOMIC_PTR_CAS(successp, write->handle->owner_or_version,
                                  outer, inner);
            /* doesn't matter if it fails */
            UNUSED(successp);
        }

        PARROT_ATOMIC_INT_SET(inner->status, STM_STATUS_ABORTED);
        return 0;
    }
    else if (need_abort) {
        /* leave as merged, abort the outer transaction since it is
         * now invalid */
        PARROT_ATOMIC_INT_SET(outer->status, STM_STATUS_ABORTED);
        return 1;
    }
    else {
        return 1;
    }
}

/*

=item C<static PMC * force_sharing>

Creates a read-only shared PMC from C<pmc> by calling the C<share_ro>
vtable method. If C<pmc> is null, returns C<PMCNULL>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC *
force_sharing(PARROT_INTERP, ARGIN_NULLOK(PMC *pmc))
{
    PMC *ret;

    if (PMC_IS_NULL(pmc))
        return PMCNULL;

    ret = VTABLE_share_ro(interp, pmc);
    PARROT_ASSERT(PObj_is_PMC_shared_TEST(ret));
    return ret;
}

/*

=item C<static int get_read_valid_depth>

Returns the depth of the innermost transactions whose reads
are all valid.

=cut

*/

static int
get_read_valid_depth(PARROT_INTERP, ARGIN(STM_tx_log *log))
{
    int i;
    int validp    = 1;
    int cur_depth = 1;

    if (log->depth == 0)
        return 0;

    while (validp && cur_depth <= log->depth) {
        int last_read;
        STM_tx_log_sub * const current = get_sublog(log, cur_depth);

        if (cur_depth == log->depth)
            last_read = log->last_read;
        else
            last_read = get_sublog(log, cur_depth + 1)->first_read - 1;

        /* XXX last_read is never used again.  Should it be in the condition for the for loop? */
        for (i = current->first_read; i <= log->last_read; ++i) {
            void *found_version;

            STM_read_record * const read = get_read(interp, log, i);

            PARROT_ATOMIC_PTR_GET(found_version,
                                  read->handle->owner_or_version);

            if (found_version != read->saw_version) {
                STM_TRACE_SAFE("verifying reads: got %p, expected %p",
                    found_version, read->saw_version);
                if (is_version(found_version)
                        || (STM_tx_log_sub*) found_version < log->inner
                        || (STM_tx_log_sub*) found_version >=
                            log->inner + STM_MAX_TX_DEPTH) {
                    validp = 0;
                    break;
                }
            }
        }

        ++cur_depth;
    }

    --cur_depth;
    return validp ? cur_depth : cur_depth - 1;
}

/*

=item C<static int do_real_commit>

Does a top-level commit. Returns true if successful.
Inner transactions are committed by merge_transaction().

=cut

*/

static int
do_real_commit(PARROT_INTERP, ARGIN(STM_tx_log *log)) {
    int i;
    int successp;
    STM_tx_log_sub *inner;

    PARROT_ASSERT(log->depth == 1);

    inner = get_sublog(log, 1);

    PARROT_ATOMIC_INT_CAS(successp, inner->status,
                          STM_STATUS_ACTIVE, STM_STATUS_COMMITTED);

    if (!successp) {
        STM_TRACE_SAFE("already aborted");
        return 0;
    }

    if (get_read_valid_depth(interp, log) == 0) {
        STM_TRACE_SAFE("reads failed to verify");
        /* read contention; can't actually commit */
        PARROT_ATOMIC_INT_SET(inner->status, STM_STATUS_ABORTED);
        return 0;
    }

    STM_TRACE_SAFE("reads verified");
    for (i = inner->first_write; i <= log->last_write; ++i) {
        int successp;
        void *new_version;

        STM_write_record * const write = get_write(interp, log, i);

        if (!write->handle)
            continue;

        new_version                 = next_version(write->saw_version);
        write->value                = force_sharing(interp, write->value);
        write->handle->last_version = new_version;

        /* actually update */
        write->handle->value        = write->value;

        PARROT_ATOMIC_PTR_CAS(successp, write->handle->owner_or_version, inner,
            new_version);
        STM_TRACE_SAFE("wrote version %p into handle %p",
                       new_version, write->handle);

        /* no one should steal our ownership when we are committed */
        PARROT_ASSERT(successp);

        Parrot_STM_waitlist_signal(interp, &write->handle->change_waitlist);
        STM_TRACE_SAFE("done waitlist_signal");
    }

    STM_TRACE_SAFE("%p: done committing", interp);

    log->last_write = -1;
    log->last_read  = -1;

    return 1;
}

/*

=item C<static void do_partial_abort>

Set the specified transaction as aborted and unreserve
all the write records of it, but don't actually reset our
transaction log.

=cut

*/

static void
do_partial_abort(PARROT_INTERP, ARGIN(STM_tx_log *log), ARGIN(STM_tx_log_sub *inner))
{
    int i;

    STM_TRACE_SAFE("partial abort");
    PARROT_ATOMIC_INT_SET(inner->status, STM_STATUS_ABORTED);

    for (i = log->last_write; i >= inner->first_write; --i) {
        int successp;
        STM_write_record * const write = get_write(interp, log, i);

        if (!write->handle)
            continue;

        /* if it's not a version, an outer transaction has the 'real
         * version' of this */
        PARROT_ATOMIC_PTR_CAS(successp, write->handle->owner_or_version, inner,
            write->saw_version);

        /* it doesn't matter if this fails */
        STM_TRACE_SAFE(
            "unreserving write record %d [saw_version=%p]; successp=%d",
            i, write->saw_version, successp);
    }
}

/*

=item C<static void do_real_abort>

Does an abort. This is also used for inner transactions.

=cut

*/

static void
do_real_abort(PARROT_INTERP, ARGMOD(STM_tx_log *log), ARGIN(STM_tx_log_sub *inner))
{
    STM_TRACE_SAFE("really aborting");
    do_partial_abort(interp, log, inner);

    log->last_read  = inner->first_read  - 1;
    log->last_write = inner->first_write - 1;
}

/*

=item C<static void replay_writes>

Replay writes of a partial_abort'd transaction.
'from' is the depth of the outermost transaction to replay.
'to' is the depth of the innermost transaction to replay.
Replays from outermost to innermost.
If replaying fails in the middle, the subtransaction in
question is re-partial-aborted.

=cut

*/

static void
replay_writes(PARROT_INTERP, ARGIN(STM_tx_log *log), int from, int to)
{
    int i;
    int validp    = 1;
    int cur_depth = from;

    while (validp && cur_depth <= to) {
        int last_write;
        STM_tx_log_sub * const current = get_sublog(log, cur_depth);

        if (cur_depth == log->depth)
            last_write = log->last_write;
        else
            last_write = get_sublog(log, cur_depth + 1)->first_write - 1;

        PARROT_ATOMIC_INT_SET(current->status, STM_STATUS_ACTIVE);

        for (i = current->first_write; i <= last_write; ++i) {
            int successp;
            STM_write_record * const write = get_write(interp, log, i);

            if (!write->handle)
                continue;

            PARROT_ATOMIC_PTR_CAS(successp, write->handle->owner_or_version,
                write->saw_version, current);

            if (!successp) {
                validp = 0;
                break;
            }
        }

        ++cur_depth;
    }

    --cur_depth;

    if (!validp)
        do_partial_abort(interp, log, get_sublog(log, cur_depth));
}

/*

=item C<int Parrot_STM_commit>

Tries to commit the currently active transaction. Returns true if the commit
succeeds. If it returns false, the transaction was aborted instead.

Throws an exception if there is no active transaction.

=cut

*/

int
Parrot_STM_commit(PARROT_INTERP)
{
    STM_tx_log     * const log = Parrot_STM_tx_log_get(interp);
    STM_tx_log_sub *cursub;
    int             successp;

    STM_TRACE("commit");

    if (log->depth == 0)
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "stm_commit without transaction\n");

    PARROT_ASSERT(log->depth > 0);

    PROFILE_TRIED_COMMIT(log);

    cursub = get_sublog(log, log->depth);

    if (log->depth > 1) {
        successp = merge_transactions(interp, log,
            get_sublog(log, log->depth - 1), cursub, 1);

        /* should always return true, since we pass 1 for the always argument */
        PARROT_ASSERT(successp);
    }
    else
        successp = do_real_commit(interp, log);

    if (!successp) {
        PROFILE_FAILED_COMMIT(log);
        do_real_abort(interp, log, cursub);
    }

    --log->depth;
    return successp;
}

/*

=item C<void Parrot_STM_abort>

Aborts the currently active transaction.

Throws an exception if there is no active transaction.

=cut

*/

void
Parrot_STM_abort(PARROT_INTERP)
{
    STM_tx_log     * const log = Parrot_STM_tx_log_get(interp);
    STM_tx_log_sub *cursub;

    STM_TRACE_SAFE("abort");

    if (log->depth == 0)
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "stm_abort without transaction\n");

    PARROT_ASSERT(log->depth > 0);

    PROFILE_ABORTED(log);

    cursub = get_sublog(log, log->depth);

    do_real_abort(interp, log, cursub);
    --log->depth;
}

/*

=item C<static int setup_wait>

RT#48260: Not yet documented!!!

=cut

*/

static int
setup_wait(PARROT_INTERP, ARGMOD(STM_tx_log *log))
{
    int need_wait = 1;
    int i;

    for (i = 0; need_wait && i <= log->last_read; ++i) {
        void *version;
        STM_read_record * const read = get_read(interp, log, i);

        Parrot_STM_waitlist_add_self(interp, &read->handle->change_waitlist);
        PARROT_ATOMIC_PTR_GET(version, read->handle->owner_or_version);

        /* the last_version check is in case a conflicting change has
         * already been committed. The transaction in progress that holds
         * a lock on the current version might abort and thus
         * never signal us -- and then be waiting for us causing a deadlock
         */
        if ((version != read->saw_version && is_version(version)) ||
            (read->handle->last_version != read->saw_version)) {
            need_wait = 0;
        }
    }

    for (i = 0; need_wait && i <= log->last_write; ++i) {
        void *version;
        STM_write_record * const write = get_write(interp, log, i);

        if (!write->handle)
            continue;

        Parrot_STM_waitlist_add_self(interp, &write->handle->change_waitlist);
        PARROT_ATOMIC_PTR_GET(version, write->handle->owner_or_version);

        /* our lock on the write record may have been revoked and then a
         * parallel change committed already.
         */
        if ((version != write->saw_version && is_version(version)) ||
            (write->handle->last_version != write->saw_version)) {
            need_wait = 0;
        }
    }

    if (!need_wait)
        Parrot_STM_waitlist_remove_all(interp);

    return need_wait;
}

/*

=item C<void Parrot_STM_wait>

Abort the currently active transaction, and then wait
for something the transaction was dependent on to change, including
any of the outer transactions becoming invalid. The caller is responsible
for verifying that any outer transaction is invalid after calling this.

(If it's not, then the retrying may never succeed.)

(Not yet implemented. Right now just aborts.)

returns true if we still need to wait, false if we're already done.
assumes transaction is _not_ yet aborted.

=cut

*/

void
Parrot_STM_wait(PARROT_INTERP)
{
    STM_tx_log *log;
    int         need_wait;

    STM_TRACE("%p: wait", interp);

    log       = Parrot_STM_tx_log_get(interp);
    need_wait = setup_wait(interp, log);

    STM_TRACE("%p: done setup_wait; need_wait=%d", interp, need_wait);

    /* abort the most inner transaction completely */
    Parrot_STM_abort(interp);

    if (need_wait) {
        /* softly abort the rest so write reservations do not
         * impede progress
         */
        if (log->depth)
            do_partial_abort(interp, log, get_sublog(log, 1));

        STM_TRACE("%p: now entering waitlist wait", interp);

        /* actually wait */
        Parrot_STM_waitlist_wait(interp);
        Parrot_STM_waitlist_remove_all(interp);

        STM_TRACE("%p: done waitlist wait", interp);

        /* replay as much of the rest as we can get away */
        if (log->depth)
            replay_writes(interp, log, 1, get_read_valid_depth(interp, log));
    }
}

/*

=item C<int Parrot_STM_validate>

Return true if the currently active transaction might commit;
false otherwise. Always returns true in the special case of no
active transaction.

=cut

*/

PARROT_WARN_UNUSED_RESULT
int
Parrot_STM_validate(PARROT_INTERP)
{
    STM_tx_log_sub *inner;
    int             status;
    STM_tx_log     * const log = Parrot_STM_tx_log_get(interp);

    if (log->depth == 0)
        return 1;

    inner = get_sublog(log, log->depth);

    STM_TRACE("validate");

    PARROT_ATOMIC_INT_GET(status, inner->status);

    /* XXX FIXME actually validate transaction */
    return status != STM_STATUS_ABORTED;
}

/*

=item C<static void mark_write_record>

RT#48260: Not yet documented!!!

=cut

*/

static void
mark_write_record(PARROT_INTERP, ARGMOD(STM_write_record *write))
{
    if (!PMC_IS_NULL(write->value))
        pobject_lives(interp, (PObj *) write->value);

    Parrot_STM_mark_pmc_handle(interp, write->handle);
}

/*

=item C<static void mark_read_record>

RT#48260: Not yet documented!!!

=cut

*/

static void
mark_read_record(PARROT_INTERP, ARGMOD(STM_read_record *read))
{
    if (!PMC_IS_NULL(read->value))
        pobject_lives(interp, (PObj *) read->value);

    Parrot_STM_mark_pmc_handle(interp, read->handle);
}

/*

=item C<void Parrot_STM_mark_transaction>

Mark items in our transaction log as living so the GC doesn't
collect them from us.

=cut

*/

void
Parrot_STM_mark_transaction(PARROT_INTERP)
{
    int         i;
    STM_tx_log *log;

    STM_TRACE("mark txlog");

    log = Parrot_STM_tx_log_get(interp);

    for (i = 0; i <= log->last_write; ++i)
        mark_write_record(interp, get_write(interp, log, i));

    for (i = 0; i <= log->last_read; ++i)
        mark_read_record(interp, get_read(interp, log, i));
}

/*

=item C<void Parrot_STM_mark_pmc_handle>

Mark items associated with the corresponding PMC handle as reachable so the GC
doesn't collect the handle or objects it refers to as reachable.

=cut

*/

void
Parrot_STM_mark_pmc_handle(PARROT_INTERP, Parrot_STM_PMC_handle handle)
{
    PMC *value;

    if (!handle)
        return;

    STM_TRACE_SAFE("mark handle %p", handle);

    /* RT#57676: XXX FIXME is this enough? What about shared status? */
    pobject_lives(interp, (PObj*) handle);

    value = handle->value;

    if (!PMC_IS_NULL(value)) {
        PARROT_ASSERT(PObj_is_PMC_shared_TEST(value));
        pobject_lives(interp, (PObj*) value);
    }
}

/*

=item C<int Parrot_STM_transaction_depth>

Return the number of active transactions in this thread.

=cut

*/

int
Parrot_STM_transaction_depth(PARROT_INTERP)
{
    const STM_tx_log * const log = Parrot_STM_tx_log_get(interp);

    return log->depth;
}

/*

=item C<static void * wait_for_version>

Wait for C<*in_what> to contain a version number instead of
an owner indication of exclusive lock. (See also Ennals's
paper 'STM should not be obstruct-free.')

This may mark us as aborted and return NULL.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static void *
wait_for_version(PARROT_INTERP, ARGMOD(STM_tx_log *log), Parrot_STM_PMC_handle handle)
{
    void                  *version;
    STM_tx_log_sub        *curlog     = NULL;
    Parrot_atomic_pointer *in_what    = &handle->owner_or_version;
    UINTVAL                wait_count = 0;
    FLOATVAL               start_wait = 0.0;

    STM_TRACE("%p: wait for version");
    for (;;) {
        unsigned        other_wait_len;
        unsigned        our_wait_len;
        unsigned        other_status;
        STM_tx_log_sub *other;

        PARROT_ATOMIC_PTR_GET(version, *in_what);
        if (is_version(version)) {
            if (wait_count)
                PARROT_ATOMIC_INT_SET(curlog->wait_length, 0);
            break;
        }

        if (FLOAT_IS_ZERO(start_wait))
            start_wait = Parrot_floatval_time();

        ++wait_count;

        /* poor man's deadlock detection:
         * wait_len = (whoever we are waiting on's wait_len) + 1
         * this means that if wait_len > num_threads, we have a deadlock
         *
         * This algorithm is borrowed from Ennals' implementation.
         * RT#57678
         * FIXME XXX look for better alternative (esp. one that'll let
         *           us do non-spinlocking?)
         * FIXME XXX race in accessing n_interpreters?
         * FIXME XXX race if other log goes away
         */
        PARROT_ASSERT(n_interpreters > 1);
        other  = (STM_tx_log_sub *)version;

        PARROT_ASSERT(other < &log->inner[0] ||
                      other > &log->inner[STM_MAX_TX_DEPTH]);

        curlog = get_sublog(log, log->depth);

        PARROT_ATOMIC_INT_GET(other_wait_len, other->wait_length);
        PARROT_ATOMIC_INT_GET(our_wait_len, curlog->wait_length);
        PARROT_ATOMIC_INT_GET(other_status, other->status);

        STM_TRACE("wait_lens: ours = %d /other = %d\n",
                our_wait_len, other_wait_len);

        if (our_wait_len < other_wait_len + 1) {
            our_wait_len = other_wait_len + 1;
            /* don't bother setting if we'll just abort ourselves */
            if (our_wait_len <= n_interpreters) {
                STM_TRACE("updating wait_len to %d\n", our_wait_len);
                PARROT_ATOMIC_INT_SET(curlog->wait_length, our_wait_len);
            }
        }

        if (our_wait_len > n_interpreters) {
            int successp;
            STM_TRACE("deadlock detected, avoiding...\n");

            /* forcibly evict the other */
            PARROT_ATOMIC_INT_CAS(successp, other->status, STM_STATUS_ACTIVE,
                STM_STATUS_ABORTED);

            if (successp)
                other_status = STM_STATUS_ABORTED;
        }

        if (other_status == STM_STATUS_ABORTED) {
            int successp;
            PARROT_ATOMIC_INT_SET(curlog->wait_length, 0);
            PARROT_ATOMIC_PTR_CAS(successp, *in_what, other,
                handle->last_version);
            UNUSED(successp);
                   continue;
        }

        /* simple heuristic, try to avoid waiting more then ten milliseconds */
        /* RT#57678 TODO implement a real contention-manager interface
           for this instead */
        if (wait_count > 2000 || Parrot_floatval_time() > start_wait + 0.01) {
            STM_TRACE("waited too long, aborting...\n");
            PARROT_ATOMIC_INT_SET(curlog->status, STM_STATUS_ABORTED);
            PARROT_ATOMIC_INT_SET(curlog->wait_length, 0);
            version = NULL;
            break;
        }

        if (interp->thread_data->state & THREAD_STATE_SUSPEND_GC_REQUESTED)
            pt_suspend_self_for_gc(interp);

        if (wait_count > 10) {
            /* we only do this when we've waited for a while so we don't make
             * expensive yield() calls when we only need to wait for a short
             * while. */
            YIELD;
        }
        /* RT#57678 XXX better spinning */
    }

    PROFILE_WAIT(log, Parrot_floatval_time() - start_wait, wait_count);

    return version;
}

/*

=item C<PMC * Parrot_STM_read>

Read the value stored in the PMC wrapped by C<handle>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_STM_read(PARROT_INTERP, Parrot_STM_PMC_handle handle)
{
    STM_write_record  *write;
    STM_read_record   *read;
    void              *check_version;
    int                i;
    STM_tx_log * const log = Parrot_STM_tx_log_get(interp);

    if (log->depth == 0) {
        /* special case outside of transaction */
        int  committedp;
        PMC *ret;

        do {
            Parrot_STM_start_transaction(interp);
            ret        = Parrot_STM_read(interp, handle);
            committedp = Parrot_STM_commit(interp);
        } while (!committedp);

        return ret;
    }

    read  = NULL;
    write = NULL;

    STM_TRACE("STM_read %p", handle);

    /* search for previous write record */
    for (i = 0; i <= log->last_write; ++i) {
        if (handle == get_write(interp, log, i)->handle)
            write = get_write(interp, log, i);
    }

    if (write) {
        STM_TRACE("found old write record");
        return write->value;
    }

    /* search for previous read record */
    for (i = 0; i <= log->last_read; ++i) {
        if (handle == get_read(interp, log, i)->handle)
            read = get_read(interp, log, i);
    }

    if (read) {
        STM_TRACE("found old read record");
        return read->value;
    }

    /* otherwise allocate a read record */
    read         = alloc_read(interp, log);
    STM_TRACE("needed new read record");

    read->handle = handle;

    /* XXX loop needed? */
    do {
        STM_TRACE("trying read");
        read->saw_version = wait_for_version(interp, log, handle);
        STM_TRACE("read: saw version %p", read->saw_version);

        read->value       = handle->value;

        PARROT_ATOMIC_PTR_GET(check_version, handle->owner_or_version);
    } while (read->saw_version != check_version && !is_aborted(log));

    STM_TRACE("version is %p", read->saw_version);

    return read->value;
}

/*

=item C<static int safe_to_clone>

Determines whether it is safe to clone the PMC C<original>. Returns C<1> if
it is safe to clone it, returns C<0> otherwise.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
safe_to_clone(SHIM_INTERP, ARGIN(const PMC *original))
{
    if (original->vtable->base_type == enum_class_Integer
        ||  original->vtable->base_type == enum_class_Float
        ||  original->vtable->base_type == enum_class_BigInt
        ||  original->vtable->base_type == enum_class_IntList)
        return 1;
    else
        return 0;
}

/*

=item C<static PMC * local_pmc_copy>

Creates a local copy of the PMC C<original>. If C<original> is C<PMCNULL>
this function returns C<PMCNULL>. If the PMC is of type C<Undef>, it creates
a new Undef PMC. Otherwise, it clones the PMC.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC *
local_pmc_copy(PARROT_INTERP, ARGIN_NULLOK(PMC *original))
{
    if (PMC_IS_NULL(original))
        return PMCNULL;

    if (original->vtable->base_type == enum_class_Undef)
        return pmc_new(interp, enum_class_Undef);

    if (safe_to_clone(interp, original))
        return VTABLE_clone(interp, original);

    return Parrot_clone(interp, original);
}

/*

=item C<static STM_write_record * find_write_record>

Find a write record corresponding to C<handle> in our log or create
one if needed.

If C<overwrite_p> is true, assume we are going to overwrite this record,
so initialize it to PMCNULL.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STM_write_record *
find_write_record(PARROT_INTERP, Parrot_STM_PMC_handle handle, int overwrite_p)
{
    /* RT#57680 FIXME check for read log or previous tx's write log */
    STM_tx_log_sub   *cursub;
    int               have_old_value = 0;
    PMC              *old_value      = NULL;
    STM_read_record  *read           = NULL;
    STM_tx_log_sub   *outersub       = NULL;
    STM_write_record *write          = NULL;
    int               i;
    STM_tx_log       *log;

    STM_TRACE("finding write record for %p", handle);

    /* RT#57680 XXX Looks like the log argument is useless */
    log      = Parrot_STM_tx_log_get(interp);
    PARROT_ASSERT(log->depth > 0);

    cursub   = get_sublog(log, log->depth);

    STM_TRACE("searching %d local; %d non-local; %d read",
                log->last_write - cursub->first_write + 1,
                cursub->first_write,
                log->last_read + 1);

    for (i = cursub->first_write; i <= log->last_write; ++i) {
        STM_TRACE("current record %d (%p), handle = %p",
            i, get_write(interp, log, i),
            get_write(interp, log, i)->handle);

        if (get_write(interp, log, i)->handle == handle)
            write = get_write(interp, log, i);
    }

    {
        int j = log->depth - 1;

        for (i = cursub->first_write - 1; i >= 0; --i) {
            STM_TRACE("outer[depth=%d] record %d (%p), handle = %p",
                j, i, get_write(interp, log, i),
                get_write(interp, log, i)->handle);

            if (get_write(interp, log, i)->handle == handle) {
                old_value      = get_write(interp, log, i)->value;
                have_old_value = 1;
                break;
            }

            while (j > 0 && get_sublog(log, j)->first_write == i)
                --j;
        }

        if (j > 0)
            outersub = get_sublog(log, j);
    }

    if (!have_old_value) {
        for (i = log->last_read; i >= 0; --i) {
            if (get_read(interp, log, i)->handle == handle) {
                read           = get_read(interp, log, i);
                old_value      = get_read(interp, log, i)->value;
                have_old_value = 1;
                break;
            }
        }
    }

    if (!write) {
        int successp;

        STM_TRACE("didn't find old write record");
        write         = alloc_write(interp, log);
        write->handle = handle;

        STM_TRACE("allocated record %d", log->last_write);

        if (have_old_value) {
            STM_TRACE("have old value");
            if (read) {
                STM_TRACE("... from a read record");
                write->saw_version = read->saw_version;
                PARROT_ATOMIC_PTR_CAS(successp, handle->owner_or_version,
                    read->saw_version, cursub);
            }
            else {
                PARROT_ASSERT(outersub);
                STM_TRACE("... from outer transaction's write record");
                PARROT_ATOMIC_PTR_GET(write->saw_version,
                                      handle->owner_or_version);
                PARROT_ATOMIC_PTR_CAS(successp, handle->owner_or_version,
                                      outersub,
                                      cursub);
            }

            if (!successp) {
                STM_TRACE("... but the old value is out-of-date");
                PARROT_ATOMIC_INT_SET(cursub->status, STM_STATUS_ABORTED);
            }

            if (overwrite_p)
                write->value = PMCNULL;
            else
                write->value = local_pmc_copy(interp, old_value);
        }
        else {
            STM_TRACE("don't have old value");
            /* avoiding creating write records when we are actually aborted
             * RT#57680 XXX in the future we will do this by throwing an
             * exception to abort the transaction
             */
            if (!is_aborted(log)) {
                do {
                    STM_TRACE("trying write");
                    write->saw_version = wait_for_version(interp, log, handle);
                    STM_TRACE("write saw version %p", write->saw_version);
                    PARROT_ATOMIC_PTR_CAS(successp, handle->owner_or_version,
                                          write->saw_version, cursub);
                } while (!successp && !is_aborted(log));
                STM_TRACE("... and acquired it");
            }
            else {
                STM_TRACE("... but already aborted anyways");
                write->saw_version = NULL;
            }

            if (overwrite_p)
                write->value = PMCNULL;
            else
                write->value = local_pmc_copy(interp, handle->value);
        }
    }

    return write;
}

/*

=item C<PMC * Parrot_STM_begin_update>

Get a editable copy of the PMC wrapped by C<handle>. The updates will be visible
to other threads after a successful commit. The PMC should not be used after
the transaction commits (and especially not be written to, as other threads may
be given it when they read the value).

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_STM_begin_update(PARROT_INTERP, Parrot_STM_PMC_handle handle)
{
    STM_write_record   *write;
    const STM_tx_log * const log = Parrot_STM_tx_log_get(interp);

    if (log->depth == 0)
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "STM_begin_update outside transaction");

    write = find_write_record(interp, handle, 0);

    return write->value;
}

/*

=item C<void Parrot_STM_write>

Write C<new_value> into the PMC wrapped by C<handle>.

=cut

*/

void
Parrot_STM_write(PARROT_INTERP, Parrot_STM_PMC_handle handle, ARGIN_NULLOK(PMC* new_value))
{
    /* XXX no transaction case */
    STM_write_record   *write;
    const STM_tx_log * const log = Parrot_STM_tx_log_get(interp);

    /* error for now */
    if (log->depth == 0)
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "STM_write outside transaction");

    write        = find_write_record(interp, handle, 1);
    write->value = new_value;
}

/*

=item C<void * Parrot_STM_extract>

Return an opaque pointer representing enough information to replay a transaction
enough to wait() for it to become valid. User access through STMLog PMC class.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void *
Parrot_STM_extract(PARROT_INTERP)
{
    STM_saved_tx_log  *saved;
    STM_tx_log_sub    *cursub;
    STM_tx_log * const log = Parrot_STM_tx_log_get(interp);

    if (log->depth == 0)
        return NULL;

    cursub = get_sublog(log, log->depth);
    saved  = (STM_saved_tx_log *)mem_sys_allocate(sizeof (*saved));

    saved->num_reads  = log->last_read - cursub->first_read + 1;
    saved->num_writes = log->last_write - cursub->first_write + 1;
    saved->reads      = (STM_read_record *)
        mem_sys_allocate(sizeof (*saved->reads) * saved->num_reads);
    saved->writes     = (STM_write_record *)
        mem_sys_allocate(sizeof (*saved->writes) * saved->num_writes);

    STRUCT_COPY_N(saved->reads,  &log->reads[cursub->first_read],   saved->num_reads);
    STRUCT_COPY_N(saved->writes, &log->writes[cursub->first_write], saved->num_writes);

    return saved;
}

/*

=item C<void Parrot_STM_replay_extracted>

Replay a transaction log extracted with C<Parrot_STM_extract>. At the moment
this is only guaranteed to work well enough to use STM_wait(). If one
attempts to use it to replay transactions to commit them, it is likely to
produce wrong results if the recorded transaction had dependencies on its outer
transactions and it is not replayed inside the same transactions it was recorded
in.

=cut

*/

void
Parrot_STM_replay_extracted(PARROT_INTERP, ARGMOD_NULLOK(void *saved_log_data))
{
    if (saved_log_data) {
        STM_saved_tx_log * const saved = (STM_saved_tx_log *)saved_log_data;
        STM_tx_log * const       log   = Parrot_STM_tx_log_get(interp);

        STM_tx_log_sub *sublog;
        int i;

        if (log->depth == 0)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "replay_extracted outside of transaction");

        sublog = get_sublog(log, log->depth);

        for (i = 0; i < saved->num_reads; ++i)
            *(alloc_read(interp, log)) = saved->reads[i];

        for (i = 0; i < saved->num_writes; ++i) {
            int successp;
            STM_write_record * const write = alloc_write(interp, log);
            *write                         = saved->writes[i];

            PARROT_ATOMIC_PTR_CAS(successp, write->handle->owner_or_version,
                                write->saw_version, sublog);

            /* failed! */
            if (!successp)
                PARROT_ATOMIC_INT_SET(sublog->status, STM_STATUS_ABORTED);
        }
    }
}

/*

=item C<void Parrot_STM_mark_extracted>

Mark GC-managed objects reachable through an extracted transaction log.

=cut

*/

void
Parrot_STM_mark_extracted(PARROT_INTERP, ARGMOD_NULLOK(void *saved_log_data))
{
    if (saved_log_data) {
        STM_saved_tx_log * const saved = (STM_saved_tx_log *)saved_log_data;
        int i;

        for (i = 0; i < saved->num_reads; ++i)
            mark_read_record(interp, &saved->reads[i]);

        for (i = 0; i < saved->num_writes; ++i)
            mark_write_record(interp, &saved->writes[i]);
    }
}

/*

=item C<void Parrot_STM_destroy_extracted>

Free memory associated with an extracted transaction log.

=cut

*/

void
Parrot_STM_destroy_extracted(SHIM_INTERP, ARGMOD_NULLOK(void *saved_log_data))
{
    if (saved_log_data) {
        STM_saved_tx_log * const saved = (STM_saved_tx_log *)saved_log_data;

        mem_sys_free(saved->reads);
        mem_sys_free(saved->writes);
        mem_sys_free(saved);
    }
}

#if STM_PROFILE

/*

=item C<void Parrot_STM_dump_profile>

Dump profiling information (num failed commits, time spent waiting
for a lock, etc.)

=cut

*/

void
Parrot_STM_dump_profile(PARROT_INTERP)
{
    STM_tx_log       *log;
    STM_profile_data *profile;
    INTVAL            i;

    Parrot_block_GC_mark(interp);

    log     = Parrot_STM_tx_log_get(interp);
    profile = &PROFILE(log);

    fprintf(stderr,
        "STM profile dump\n"
        "%ld/%ld commits needed retry\n"
        "%ld aborts\n"
        "waited for %ld/%ld\n",
        profile->failed_commits, profile->attempted_commits,
        profile->num_aborts,
        profile->num_waits,
        profile->num_waits + profile->num_non_waits);

    fprintf(stderr, "Histogram of wait times (5ms groupings):\n");

    for (i = 0; i < TIME_BUCKETS; ++i)
        fprintf(stderr, "%5ld ", profile->wait_time[i]);

    fprintf(stderr, "\nAverage time: %f\n",
        profile->total_wait_time / (double) profile->num_waits);

    fprintf(stderr,
        "Histogram of wait cycles (1 cycle groupings):\n");

    for (i = 0; i < CYCLE_BUCKETS; ++i)
        fprintf(stderr, "%5ld ", profile->wait_cycles[i]);

    fprintf(stderr, "\nAverage cycles: %f\n",
        (double) profile->total_wait_cycles / (double) profile->num_waits);

    Parrot_unblock_GC_mark(interp);
}

/*

=item C<void Parrot_STM_merge_profile>

Merges the STM profile of interpreter C<s> into the STM profile of
interpreter C<d>.

=cut

*/

void
Parrot_STM_merge_profile(ARGOUT(Interp *d), ARGOUT(Interp *s))
{
    INTVAL i;

    const STM_profile_date * const from = &PROFILE(Parrot_STM_tx_log_get(s));
    STM_profile_date * const to   = &PROFILE(Parrot_STM_tx_log_get(d));

    to->attempted_commits += from->attempted_commits;
    to->failed_commits    += from->failed_commits;
    to->num_aborts        += from->num_aborts;
    to->num_non_waits     += from->num_non_waits;
    to->num_waits         += from->num_waits;

    for (i = 0; i < CYCLE_BUCKETS; ++i)
        to->wait_cycles[i] += from->wait_cycles[i];

    for (i = 0; i < TIME_BUCKETS; ++i)
        to->wait_time[i] += from->wait_time[i];

    to->total_wait_time   += from->total_wait_time;
    to->total_wait_cycles += from->total_wait_cycles;
}

#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
