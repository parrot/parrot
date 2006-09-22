#if !defined(PARROT_STM_WAITLIST_H_GAURD)
#define PARROT_STM_WAITLIST_H_GAURD

#include <parrot/atomic.h>

#define WAITLIST_DEBUG 0

struct waitlist_entry {
    /* next entry in the waitlist */
    struct waitlist_entry *next;
    /* the thread that will need to be signaled to wake it up */
    struct waitlist_thread_data *thread;
    /* the head of this waitlist */
    struct waitlist_head *head;
};

struct waitlist_head {
    Parrot_atomic_pointer first;
    Parrot_mutex remove_mutex;
};

struct waitlist_thread_data {
    /* this mutex must be locked before setting signaled_p to true */
    Parrot_mutex signal_mutex;

    /* this condition variable is signalled after setting signaled_p
     * to true.
     */
    Parrot_cond *signal_cond;

    /* this is set to true if this thread has been signaled; should
     * remain false otherwise.
     */
    int signaled_p;

    /* pointers to all the waitlist entries */
    struct waitlist_entry **entries;
    size_t entry_count;
    size_t used_entries;
#if WAITLIST_DEBUG
    Interp *interp;
#endif
};

typedef struct waitlist_head STM_waitlist;

/* marks waitlist-associated data structures */
void Parrot_STM_waitlist_init(Parrot_Interp, STM_waitlist *waitlist);
void Parrot_STM_waitlist_add_self(Parrot_Interp, STM_waitlist *waitlist);
void Parrot_STM_waitlist_signal(Parrot_Interp, STM_waitlist *waitlist);
void Parrot_STM_waitlist_remove_all(Parrot_Interp);
void Parrot_STM_waitlist_wait(Parrot_Interp);
void Parrot_STM_waitlist_destroy_thread(Parrot_Interp);

#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
