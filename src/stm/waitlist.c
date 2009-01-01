/*
 * $Id$
 * Copyright (C) 2006-2007, The Perl Foundation
 */

#include <parrot/parrot.h>
#include "stm_internal.h"
#include "stm_waitlist.h"

/*

=head1 NAME

src/stm/waitlist.c

=head1 DESCRIPTION

RT #48260: Not yet documented!!!

=head2 Functions

=over 4

=cut

*/

/* HEADERIZER HFILE: src/stm/stm_waitlist.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void add_entry(
    ARGMOD(STM_waitlist *waitlist),
    ARGIN(struct waitlist_entry *entry))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*waitlist);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static struct waitlist_entry * alloc_entry(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static struct waitlist_thread_data * get_thread(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static struct waitlist_thread_data * get_thread_noalloc(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static STM_tx_log * Parrot_STM_tx_log_alloc(PARROT_INTERP, size_t size)
        __attribute__nonnull__(1);

static int remove_first(
    ARGMOD(STM_waitlist *waitlist),
    ARGIN(struct waitlist_entry *expect_first))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*waitlist);

static void waitlist_remove(
    ARGMOD_NULLOK(STM_waitlist *waitlist),
    ARGIN(struct waitlist_entry *what))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*waitlist);

static void waitlist_remove_check(
    ARGMOD_NULLOK(STM_waitlist *waitlist),
    ARGIN(struct waitlist_entry *what))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*waitlist);

static void waitlist_signal_all(ARGMOD(STM_waitlist *list))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*list);

static void waitlist_signal_one(ARGMOD(struct waitlist_entry *who))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*who);

#define ASSERT_ARGS_add_entry assert(waitlist); \
                              assert(entry);
#define ASSERT_ARGS_alloc_entry assert(interp);
#define ASSERT_ARGS_get_thread assert(interp);
#define ASSERT_ARGS_get_thread_noalloc assert(interp);
#define ASSERT_ARGS_Parrot_STM_tx_log_alloc assert(interp);
#define ASSERT_ARGS_remove_first assert(waitlist); \
                                 assert(expect_first);
#define ASSERT_ARGS_waitlist_remove assert(what);
#define ASSERT_ARGS_waitlist_remove_check assert(what);
#define ASSERT_ARGS_waitlist_signal_all assert(list);
#define ASSERT_ARGS_waitlist_signal_one assert(who);
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#define WAITLIST_REMOVE_CHECK 0 /* if set, make sure removes really
                                 * remove -- for debugging */

/*

=item C<static struct waitlist_thread_data * get_thread>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static struct waitlist_thread_data *
get_thread(PARROT_INTERP)
{
    STM_tx_log * const txlog = Parrot_STM_tx_log_get(interp);
    ASSERT_ARGS(get_thread);

    if (!txlog->waitlist_data) {
        txlog->waitlist_data =
            (waitlist_thread_data*)mem_sys_allocate_zeroed(sizeof (*txlog->waitlist_data));
        MUTEX_INIT(txlog->waitlist_data->signal_mutex);
        txlog->waitlist_data->signal_cond = &interp->thread_data->interp_cond;
#if WAITLIST_DEBUG
        txlog->waitlist_data->interp = interp;
#endif
    }
    return txlog->waitlist_data;
}

/*

=item C<static struct waitlist_thread_data * get_thread_noalloc>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static struct waitlist_thread_data *
get_thread_noalloc(PARROT_INTERP)
{
    const STM_tx_log * const txlog = Parrot_STM_tx_log_get(interp);
    ASSERT_ARGS(get_thread_noalloc);
    return txlog->waitlist_data;
}

/*

=item C<static struct waitlist_entry * alloc_entry>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static struct waitlist_entry *
alloc_entry(PARROT_INTERP)
{
    size_t i;

    struct waitlist_thread_data * const thr = get_thread(interp);
    ASSERT_ARGS(alloc_entry);

    if (!thr->entries) {
        thr->entries = (waitlist_entry**)mem_sys_allocate_zeroed(sizeof (*thr->entries) * 4);
        thr->entry_count = 4;
    }

    if (thr->used_entries >= thr->entry_count) {
        thr->entries = (waitlist_entry**)mem_sys_realloc_zeroed(thr->entries,
            sizeof (*thr->entries) * thr->entry_count * 2,
            sizeof (*thr->entries) * thr->entry_count);
        thr->entry_count *= 2;
    }

    i = thr->used_entries++;
    if (!thr->entries[i])
        thr->entries[i] = (waitlist_entry*)mem_sys_allocate_zeroed(sizeof (**thr->entries));

    PARROT_ASSERT(thr->entries[i]->head == NULL);
    PARROT_ASSERT(thr->entries[i]->next == NULL);
    memset(thr->entries[i], 0, sizeof (*thr->entries[i]));
    thr->entries[i]->thread = thr;

    return thr->entries[i];
}

/*

=item C<static void add_entry>

RT #48260: Not yet documented!!!

=cut

*/

static void
add_entry(ARGMOD(STM_waitlist *waitlist), ARGIN(struct waitlist_entry *entry))
{
    int successp = -1;
    void *result;
    ASSERT_ARGS(add_entry);
    PARROT_ASSERT(entry->next == NULL);
    do {
        PARROT_ATOMIC_PTR_GET(result, waitlist->first);
        entry->next = (waitlist_entry *)result;
        PARROT_ASSERT(successp != -1 || entry->next != entry);
        PARROT_ASSERT(entry->next != entry);
        PARROT_ATOMIC_PTR_CAS(successp, waitlist->first, entry->next, entry);
    } while (!successp);
#if WAITLIST_DEBUG
    fprintf(stderr, "added %p(%p) to waitlist %p\n",
            entry, entry->thread->interp, waitlist);
#endif
}

/*

=item C<static int remove_first>

RT #48260: Not yet documented!!!

=cut

*/

static int
remove_first(ARGMOD(STM_waitlist *waitlist), ARGIN(struct waitlist_entry *expect_first))
{
    int successp;
    ASSERT_ARGS(remove_first);
    PARROT_ATOMIC_PTR_CAS(successp, waitlist->first, expect_first,
                        expect_first->next);
#if WAITLIST_DEBUG
    fprintf(
        stderr,
        "tried removing %p(%p) from beginning of waitlist %p, successp=%d\n",
        expect_first, expect_first->thread->interp, waitlist, successp);
#endif
    return successp;
}

/*

=item C<static void waitlist_remove>

RT #48260: Not yet documented!!!

=cut

*/

static void
waitlist_remove(ARGMOD_NULLOK(STM_waitlist *waitlist), ARGIN(struct waitlist_entry *what))
{
    struct waitlist_entry *cur;
    void *result;
    ASSERT_ARGS(waitlist_remove);

    if (!waitlist)
        return;

    LOCK(waitlist->remove_mutex);
    PARROT_ATOMIC_PTR_GET(result, waitlist->first);
    cur = (waitlist_entry *)result;

    /* if we became the first entry while we were acquiring the mutex */
    while (cur == what) {
        if (remove_first(waitlist, what)) {
            UNLOCK(waitlist->remove_mutex);
            what->head = NULL;
            what->next = NULL;
            return;
        }
        PARROT_ATOMIC_PTR_GET(result, waitlist->first);
        cur = (waitlist_entry *)result;
    }

    if (!cur) {
        /* removal occured before we acquired the lock */
        UNLOCK(waitlist->remove_mutex);
        PARROT_ASSERT(!what->head);
        return;
    }
    while (cur->next && cur->next != what) {
        PARROT_ASSERT(cur != cur->next);
        cur = cur->next;
    }

    if (cur->next == what)
        cur->next = what->next;
    else
        PARROT_ASSERT(!what->head);
    UNLOCK(waitlist->remove_mutex);

    what->next = NULL;
    what->head = NULL;
}

#if WAITLIST_REMOVE_CHECK
/* this function is here to facilitate debugging */
/*

=item C<static void waitlist_remove_check>

RT #48260: Not yet documented!!!

=cut

*/

static void
waitlist_remove_check(ARGMOD_NULLOK(STM_waitlist *waitlist), ARGIN(struct waitlist_entry *what))
{
    struct waitlist_entry *cur;
    ASSERT_ARGS(waitlist_remove_check);

    if (!waitlist)
        return;

    PARROT_ATOMIC_PTR_GET(cur, waitlist->first);
    while (cur) {
        if (cur == what)
            break;
        cur = cur->next;
    }
    PARROT_ASSERT(!cur);
}
#endif

/*

=item C<static void waitlist_signal_one>

RT #48260: Not yet documented!!!

=cut

*/

static void
waitlist_signal_one(ARGMOD(struct waitlist_entry *who))
{
    struct waitlist_thread_data *thread;
    ASSERT_ARGS(waitlist_signal_one);

    thread = who->thread;
    LOCK(thread->signal_mutex);
    thread->signaled_p = 1;
    UNLOCK(thread->signal_mutex);
    COND_SIGNAL(*thread->signal_cond);
#if WAITLIST_DEBUG
    fprintf(stderr, "signalled entry %p: %p(%p)\n",
            who, thread, thread->interp);
#endif
    who->next = NULL;
    who->head = NULL;
}

/*

=item C<static void waitlist_signal_all>

RT #48260: Not yet documented!!!

=cut

*/

static void
waitlist_signal_all(ARGMOD(STM_waitlist *list))
{
    int successp;
    struct waitlist_entry *cur;
    void *result;
    ASSERT_ARGS(waitlist_signal_all);

    /* make sure we are not interrupted by a concurrent removal */
    LOCK(list->remove_mutex);
    do {
        PARROT_ATOMIC_PTR_GET(result, list->first);
        cur = (waitlist_entry *)result;
        PARROT_ATOMIC_PTR_CAS(successp, list->first, cur, NULL);
    } while (!successp);

    if (!cur) {
        UNLOCK(list->remove_mutex);
        return;
    }

    if (!cur->next) {
        waitlist_signal_one(cur);
        UNLOCK(list->remove_mutex);
        return;
    }

    while (cur) {
        struct waitlist_entry *next;
        next = cur->next;
        waitlist_signal_one(cur);
        cur = next;
    }

    UNLOCK(list->remove_mutex);
}

/*

=item C<void Parrot_STM_waitlist_add_self>

RT #48260: Not yet documented!!!

=cut

*/

void
Parrot_STM_waitlist_add_self(PARROT_INTERP, ARGMOD(STM_waitlist *waitlist))
{
    struct waitlist_entry * const entry = alloc_entry(interp);
    ASSERT_ARGS(Parrot_STM_waitlist_add_self);

    entry->head = waitlist;

#if WAITLIST_DEBUG
    fprintf(stderr, "%p: add %p to %p\n", interp, entry, waitlist);
#endif
    add_entry(waitlist, entry);
}

/*

=item C<void Parrot_STM_waitlist_signal>

RT #48260: Not yet documented!!!

=cut

*/

void
Parrot_STM_waitlist_signal(PARROT_INTERP, ARGMOD(STM_waitlist *waitlist))
{
    ASSERT_ARGS(Parrot_STM_waitlist_signal);
#if WAITLIST_DEBUG
    fprintf(stderr, "%p: signal %p\n", interp, waitlist);
#endif
    waitlist_signal_all(waitlist);
}

/*

=item C<void Parrot_STM_waitlist_remove_all>

RT #48260: Not yet documented!!!

=cut

*/

void
Parrot_STM_waitlist_remove_all(PARROT_INTERP)
{
    struct waitlist_thread_data *thr;
    size_t i;
    ASSERT_ARGS(Parrot_STM_waitlist_remove_all);
#if WAITLIST_DEBUG
    fprintf(stderr, "%p: remove all\n", interp);
#endif
    thr = get_thread(interp);
    for (i = 0; i < thr->used_entries; ++i) {
        struct waitlist_entry * const entry = thr->entries[i];
        STM_waitlist * const list = entry->head;

        waitlist_remove(list, entry);
#if WAITLIST_REMOVE_CHECK
        waitlist_remove_check(list, entry);
#endif
#if WAITLIST_DEBUG
        fprintf(stderr, "%p: removing entry %p\n", interp, entry);
#endif
    }
    thr->used_entries = 0;
    LOCK(thr->signal_mutex);
    thr->signaled_p = 0;
    UNLOCK(thr->signal_mutex);
}

/* TODO handle events here */
/*

=item C<void Parrot_STM_waitlist_wait>

RT #48260: Not yet documented!!!

=cut

*/

void
Parrot_STM_waitlist_wait(PARROT_INTERP)
{
    struct waitlist_thread_data *thr;
    ASSERT_ARGS(Parrot_STM_waitlist_wait);
    thr = get_thread(interp);
    LOCK(thr->signal_mutex);
#if WAITLIST_DEBUG
    fprintf(stderr, "%p: got lock, waiting...\n", interp);
#endif
    while (!thr->signaled_p) {
        pt_thread_wait_with(interp, &thr->signal_mutex);
#if WAITLIST_DEBUG
        fprintf(stderr, "%p: woke up\n", interp);
#endif
    }
    UNLOCK(thr->signal_mutex);
#if WAITLIST_DEBUG
    fprintf(stderr, "%p: done waiting.\n", interp);
#endif
}

/*

=item C<void Parrot_STM_waitlist_init>

RT #48260: Not yet documented!!!

=cut

*/

void
Parrot_STM_waitlist_init(PARROT_INTERP, ARGMOD(STM_waitlist *waitlist))
{
    ASSERT_ARGS(Parrot_STM_waitlist_init);
    PARROT_ATOMIC_PTR_INIT(waitlist->first);
    PARROT_ATOMIC_PTR_SET(waitlist->first, NULL);
    MUTEX_INIT(waitlist->remove_mutex);
}

/*

=item C<void Parrot_STM_waitlist_destroy_thread>

RT #48260: Not yet documented!!!

=cut

*/

void
Parrot_STM_waitlist_destroy_thread(PARROT_INTERP)
{
    struct waitlist_thread_data *thr;
    size_t i;
    ASSERT_ARGS(Parrot_STM_waitlist_destroy_thread);

    thr = get_thread_noalloc(interp);
    if (!thr)
        return;

    for (i = 0; i < thr->used_entries; ++i) {
        if (thr->entries[i]) {
            mem_sys_free(thr->entries[i]);
        }
    }

    mem_sys_free(thr->entries);
    MUTEX_DESTROY(thr->signal_mutex);
    mem_sys_free(thr);
}

/*

=item C<static STM_tx_log * Parrot_STM_tx_log_alloc>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STM_tx_log *
Parrot_STM_tx_log_alloc(PARROT_INTERP, size_t size)
{
    int                i;
    STM_tx_log * const log       = (STM_tx_log *)mem_sys_allocate_zeroed(size);
    ASSERT_ARGS(Parrot_STM_tx_log_alloc);
    interp->thread_data->stm_log = log;

    /* initialize the various fields of the transaction log */

    for (i = 0; i < STM_MAX_TX_DEPTH; ++i) {
        PARROT_ATOMIC_INT_INIT(log->inner[i].status);
        PARROT_ATOMIC_INT_INIT(log->inner[i].wait_length);
        PARROT_ATOMIC_INT_SET(log->inner[i].status, STM_STATUS_INVALID);
        PARROT_ASSERT((PTR2UINTVAL(&log->inner[i]) & 1) == 0);
    }

    log->inner[0].first_read  =  0;
    log->inner[0].first_write =  0;

    log->writes               = (STM_write_record *)mem_sys_allocate(
        sizeof (STM_write_record) * STM_START_RECORDS);
    log->reads                = (STM_read_record *)mem_sys_allocate(
        sizeof (STM_read_record) * STM_START_RECORDS);
    log->writes_alloced       = STM_START_RECORDS;
    log->reads_alloced        = STM_START_RECORDS;

    log->last_read            = -1;
    log->last_write           = -1;
    log->depth                =  0;

    return log;
}

/*

=item C<STM_tx_log * Parrot_STM_tx_log_get>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_CANNOT_RETURN_NULL
STM_tx_log *
Parrot_STM_tx_log_get(PARROT_INTERP)
{
    STM_tx_log *log = interp->thread_data->stm_log;
    ASSERT_ARGS(Parrot_STM_tx_log_get);

    if (!log)
        log = Parrot_STM_tx_log_alloc(interp, sizeof (*log));

    PARROT_ASSERT(log->depth >= 0);
    return log;
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
