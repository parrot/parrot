/*
Copyright (C) 2001-2008, Parrot Foundation.
$Id$

=head1 NAME

src/events.c - Event handling stuff

=head1 DESCRIPTION

An event_thread handles async events for all interpreters. When events
are due, they are placed in per interpreter task_queues, where they are
handled then by the C<check_event*> opcodes.

IO events and signals are caught in the io_thread, which again
dispatches these to one or all interpreters.

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/events.h"
#include "events.str"

typedef struct pending_io_events {
    parrot_event **events;
    size_t n;
    size_t alloced;
} pending_io_events;

/* HEADERIZER HFILE: include/parrot/events.h */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t * do_event(PARROT_INTERP,
    ARGIN(parrot_event* event),
    ARGIN_NULLOK(opcode_t *next))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static QUEUE_ENTRY* dup_entry(ARGIN(const QUEUE_ENTRY *entry))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static QUEUE_ENTRY* dup_entry_interval(
    ARGIN(QUEUE_ENTRY *entry),
    FLOATVAL now)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static void* event_thread(ARGMOD(void *data))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*data);

static void event_to_exception(PARROT_INTERP,
    ARGIN(const parrot_event* event))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void init_events_all(PARROT_INTERP)
        __attribute__nonnull__(1);

static void init_events_first(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
static void* io_thread(SHIM(void *data));

static void io_thread_ready_rd(ARGMOD(pending_io_events *ios), int ready_rd)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*ios);

static void Parrot_sigaction(int sig, ARGIN(void (*handler)(int)))
        __attribute__nonnull__(2);

static void Parrot_unblock_signal(int sig);
static int process_events(ARGMOD(QUEUE *event_q))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*event_q);

static void schedule_signal_event(int signum);
static void sig_handler(int signum);
static void stop_io_thread(void);
static void store_io_event(
    ARGMOD(pending_io_events *ios),
    ARGIN(parrot_event *ev))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*ios);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t * wait_for_wakeup(PARROT_INTERP,
    ARGIN_NULLOK(opcode_t *next))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_do_event __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(event))
#define ASSERT_ARGS_dup_entry __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(entry))
#define ASSERT_ARGS_dup_entry_interval __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(entry))
#define ASSERT_ARGS_event_thread __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(data))
#define ASSERT_ARGS_event_to_exception __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(event))
#define ASSERT_ARGS_init_events_all __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_init_events_first __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_io_thread __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_io_thread_ready_rd __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ios))
#define ASSERT_ARGS_Parrot_sigaction __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(handler))
#define ASSERT_ARGS_Parrot_unblock_signal __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_process_events __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(event_q))
#define ASSERT_ARGS_schedule_signal_event __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_sig_handler __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_stop_io_thread __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_store_io_event __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ios) \
    , PARROT_ASSERT_ARG(ev))
#define ASSERT_ARGS_wait_for_wakeup __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*
 * event debugging stuff - turn it off before running tests
 */
#define EVENT_DEBUG 0
/*
 * not yet - need to sort out platform code and fix exceptions first
 * TODO get some config for POSIX compliant
 * TODO create API for extenders like ponie - events disabled for now
 */
#if defined(linux) || defined(darwin)
#  define INSTALL_EVENT_HANDLER 0
#else
#  define INSTALL_EVENT_HANDLER 0
#endif

#if EVENT_DEBUG
#  define edebug(x) fprintf (x)
static const char *ev_names[] = {
    "EVENT_TYPE_NONE",
    "EVENT_TYPE_EVENT",
    "EVENT_TYPE_IO",
    "EVENT_TYPE_MSG",
    "EVENT_TYPE_TIMER",
    "EVENT_TYPE_CALL_BACK",
    "EVENT_TYPE_SLEEP",
    "EVENT_TYPE_TERMINATE",
    "EVENT_TYPE_EVENT_TERMINATE",
    "EVENT_TYPE_CLASS_CHANGED",
    "EVENT_TYPE_SIGNAL",
    "EVENT_TYPE_SUSPEND_FOR_GC"
};
static const char*
et(const parrot_event* const e)
{
    return ev_names[e->type];
}

#else
#  define edebug(x)
#endif


/* forward defs */

/*
 * we have exactly one global event_queue
 * TODO task prio handling
 */
static QUEUE *event_queue;
#define TASK_PRIO 10

/*
 * user accessible signals like SIGINT
 */
#ifndef SIGINT
#  define SIGINT -4711
#endif
#ifndef SIGHUP
#  define SIGHUP -4712
#endif

/*
 * XXX need a configure test
 * should be sig_atomic_t
 */
static int sig_int, sig_hup;

/*
 * a pipe is used to send messages to the IO thread
 */
static int pipe_fds[2];
#define PIPE_READ_FD  pipe_fds[0]
#define PIPE_WRITE_FD pipe_fds[1]

/*
 * a structure to communicate with the io_thread
 */
typedef struct io_thread_msg {
    INTVAL command;
    parrot_event *ev;
} io_thread_msg;


/*

=back

=head2 Signal Handling

=over 4

=item C<static void sig_handler(int signum)>

Handle signal C<signum>.

TODO - Only C<SIGHUP> is handled at the moment for testing

=cut

*/

static void
sig_handler(int signum)
{
    ASSERT_ARGS(sig_handler)
    switch (signum) {
      case SIGINT:
        sig_int = 1;
        break;
      case SIGHUP:
        sig_hup = 1;
        break;
      default:
        break;
    }
}

/*

=item C<static void Parrot_sigaction(int sig, void (*handler(int)))>

Signal handlers are common to all threads, signal block masks are
specific, so we install one handler then block that signal and unblock
it in the thread, that will receive that signal.

=cut

*/

static void
Parrot_sigaction(int sig, ARGIN(void (*handler)(int)))
{
    ASSERT_ARGS(Parrot_sigaction)
#ifdef PARROT_HAS_SIGACTION
    struct sigaction action;
    sigset_t block_mask;

    /* install handler */
    action.sa_handler = handler;
    sigemptyset(&action.sa_mask);
    action.sa_flags = 0;
    sigaction(sig, &action, NULL);

    /* block that signal */
    sigemptyset(&block_mask);
    sigaddset(&block_mask, sig);
    sigprocmask(SIG_BLOCK, &block_mask, NULL);
#else
    UNUSED(sig);
    UNUSED(handler);
#endif
}


/*

=item C<static void Parrot_unblock_signal(int sig)>

unblock a signal

=cut

*/

static void
Parrot_unblock_signal(int sig)
{
    ASSERT_ARGS(Parrot_unblock_signal)
#ifdef PARROT_HAS_SIGACTION
    sigset_t block_mask;

    sigemptyset(&block_mask);
    sigaddset(&block_mask, sig);
    sigprocmask(SIG_UNBLOCK, &block_mask, NULL);
#else
    UNUSED(sig);
#endif
}


/*

=item C<void Parrot_init_signals(void)>

Set up actions to handle signals.
Only SIGHUP handled at the moment.

=cut

*/

PARROT_EXPORT
void
Parrot_init_signals(void)
{
    ASSERT_ARGS(Parrot_init_signals)
    /*
     * SIGFPE is architecture specific - some signal an error,
     * some don't, so we have to use direct checks if we are dividing
     * by zero.
     */
    Parrot_sigaction(SIGHUP, sig_handler);
}

/*

=back

=head2 Initialization

=over 4

=item C<static void init_events_first(PARROT_INTERP)>

Init event system for first interpreter.

=cut

*/

static void
init_events_first(PARROT_INTERP)
{
    ASSERT_ARGS(init_events_first)
    Parrot_thread    ev_handle;
#ifndef WIN32
    Parrot_thread    io_handle;
#endif

    /*
     * be sure all init is done only once
     * we could use pthread_once for that too
     */
    if (event_queue)
        PANIC(interp, "event queue already exists - missing parent_interp?");
    /*
     * create event queue
     */
    event_queue = queue_init(TASK_PRIO);
    /*
     * we use a message pipe to send IO related stuff to the
     * IO thread
     */
#ifndef WIN32
    /*
     * pipes on WIN32 don't support select
     * s. p6i: "event.c - of signals and pipes"
     */
    if (pipe(pipe_fds))
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "Couldn't create message pipe");
#endif
    /*
     * now set some sig handlers before any thread is started, so
     * that all threads inherit the signal block mask
     */
#if INSTALL_EVENT_HANDLER
    Parrot_init_signals();
#endif
    /*
     * we start an event_handler thread
     */
    THREAD_CREATE_DETACHED(ev_handle, event_thread, event_queue);
    /*
     * and a signal and IO handler thread
     */
#ifndef WIN32
    THREAD_CREATE_DETACHED(io_handle, io_thread, event_queue);
#endif
}

/*

=item C<static void init_events_all(PARROT_INTERP)>

Init events for all interpreters.

=cut

*/

static void
init_events_all(PARROT_INTERP)
{
    ASSERT_ARGS(init_events_all)
    /*
     * create per interpreter task queue
     */
    interp->task_queue = queue_init(0);
}

/*

=item C<void Parrot_init_events(PARROT_INTERP)>

Initialize the event system.

=cut

*/

PARROT_EXPORT
void
Parrot_init_events(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_init_events)
    if (!interp->parent_interpreter) {
        /* add the very first interpreter to the list of interps. */
        pt_add_to_interpreters(interp, NULL);
        init_events_first(interp);
    }
    init_events_all(interp);
}

/*

=back

=head2 Event Handler Functions

=over 4

=item C<void Parrot_schedule_event(PARROT_INTERP, parrot_event* ev)>

Create queue entry and insert event into task queue.

=cut

*/

PARROT_EXPORT
void
Parrot_schedule_event(PARROT_INTERP, ARGMOD(parrot_event* ev))
{
    ASSERT_ARGS(Parrot_schedule_event)
    QUEUE_ENTRY * const entry = mem_internal_allocate_typed(QUEUE_ENTRY);
    entry->next = NULL;
    ev->interp  = interp;
    entry->data = ev;
    switch (ev->type) {
      case EVENT_TYPE_TIMER:
      case EVENT_TYPE_SLEEP:
        entry->type = QUEUE_ENTRY_TYPE_TIMED_EVENT;
        insert_entry(event_queue, entry);
        break;
      case EVENT_TYPE_CALL_BACK:
      case EVENT_TYPE_SIGNAL:
      case EVENT_TYPE_IO:
        entry->type = QUEUE_ENTRY_TYPE_EVENT;
        unshift_entry(event_queue, entry);
        break;
      default:
        entry->type = QUEUE_ENTRY_TYPE_EVENT;
        push_entry(event_queue, entry);
        break;
    }
}

/*

=item C<static void schedule_signal_event(int signum)>

create and schedule a signal event

=cut

*/

static void
schedule_signal_event(int signum)
{
    ASSERT_ARGS(schedule_signal_event)
    parrot_event* const ev    = mem_internal_allocate_typed(parrot_event);
    QUEUE_ENTRY * const entry = mem_internal_allocate_typed(QUEUE_ENTRY);

    entry->next  = NULL;
    entry->type  = QUEUE_ENTRY_TYPE_EVENT;
    ev->type     = EVENT_TYPE_SIGNAL;
    ev->u.signal = signum;
    entry->data  = ev;
    /*
     * deliver to all interpreters
     */
    Parrot_schedule_broadcast_qentry(entry);
}

/*

=item C<void Parrot_new_timer_event(PARROT_INTERP, PMC *timer, FLOATVAL diff,
FLOATVAL interval, int repeat, PMC *sub, parrot_event_type_enum typ)>

Create a new timer event due at C<diff> from now, repeated at C<interval>
and running the passed C<sub>.

=cut

*/

PARROT_EXPORT
void
Parrot_new_timer_event(PARROT_INTERP, ARGIN_NULLOK(PMC *timer), FLOATVAL diff,
        FLOATVAL interval, int repeat, ARGIN_NULLOK(PMC *sub), parrot_event_type_enum typ)
{
    ASSERT_ARGS(Parrot_new_timer_event)
    parrot_event* const ev = mem_internal_allocate_typed(parrot_event);

    const FLOATVAL now = Parrot_floatval_time();

    ev->type                   = typ;
    ev->u.timer_event.timer    = timer;
    ev->u.timer_event.abs_time = now + diff;
    ev->u.timer_event.interval = interval;
    ev->u.timer_event.repeat   = repeat;
    ev->u.timer_event.sub      = sub;

    if (repeat && FLOAT_IS_ZERO(interval))
        ev->u.timer_event.interval = diff;

    Parrot_schedule_event(interp, ev);
}

/*

=item C<void Parrot_new_cb_event(PARROT_INTERP, PMC *cbi, char *ext)>

Prepare and schedule a callback event.

=cut

*/

PARROT_EXPORT
void
Parrot_new_cb_event(PARROT_INTERP, ARGIN(PMC *cbi), ARGIN(char *ext))
{
    ASSERT_ARGS(Parrot_new_cb_event)
    parrot_event* const ev    = mem_internal_allocate_typed(parrot_event);
    QUEUE_ENTRY*  const entry = mem_internal_allocate_typed(QUEUE_ENTRY);

    entry->next = NULL;
    entry->data = ev;
    ev->interp  = interp;
    ev->type    = EVENT_TYPE_CALL_BACK;
    ev->u.call_back.cbi           = cbi;
    ev->u.call_back.external_data = ext;
    Parrot_schedule_interp_qentry(interp, entry);
}

/*

=item C<void Parrot_del_timer_event(PARROT_INTERP, const PMC *timer)>

Deactivate the timer identified by C<timer>.

=cut

*/

PARROT_EXPORT
void
Parrot_del_timer_event(PARROT_INTERP, ARGIN(const PMC *timer))
{
    ASSERT_ARGS(Parrot_del_timer_event)
    QUEUE_ENTRY *entry;

    LOCK(event_queue->queue_mutex);

    for (entry = event_queue->head; entry; entry = entry->next) {
        if (entry->type == QUEUE_ENTRY_TYPE_TIMED_EVENT) {

            parrot_event * const event = (parrot_event *)entry->data;

            if (event->interp == interp
                    && event->u.timer_event.timer == timer) {
                event->u.timer_event.interval = 0.0;
                event->type = EVENT_TYPE_NONE;
                break;
            }
        }
    }
    UNLOCK(event_queue->queue_mutex);
}

/*

=item C<void Parrot_new_terminate_event(PARROT_INTERP)>

Create a terminate event, interpreter will leave the run-loop when this
event arrives.

=cut

*/

PARROT_EXPORT
void
Parrot_new_terminate_event(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_new_terminate_event)
    parrot_event* const ev = mem_internal_allocate_typed(parrot_event);
    ev->type = EVENT_TYPE_TERMINATE;
    Parrot_schedule_event(interp, ev);
}

/*

=item C<void Parrot_new_suspend_for_gc_event(PARROT_INTERP)>

Create a suspend-for-GC event, interpreter will wait on a condition
variable for GC to finish when the event arrives.

=cut

*/

PARROT_EXPORT
void
Parrot_new_suspend_for_gc_event(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_new_suspend_for_gc_event)
    QUEUE_ENTRY *qe;
    parrot_event* const ev = mem_internal_allocate_typed(parrot_event);
    ev->type = EVENT_TYPE_SUSPEND_FOR_GC;
    qe = mem_internal_allocate_typed(QUEUE_ENTRY);
    qe->next = NULL;
    qe->data = ev;
    qe->type = QUEUE_ENTRY_TYPE_EVENT;
    /* we don't use schedule_event because we must modify its
     * task queue immediately
     */
    Parrot_schedule_interp_qentry(interp, qe);
}

/*

=item C<void Parrot_kill_event_loop(PARROT_INTERP)>

Schedule event-loop terminate event. This shuts down the event thread.

=cut

*/

PARROT_EXPORT
void
Parrot_kill_event_loop(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_kill_event_loop)
    parrot_event* const ev = mem_internal_allocate_typed(parrot_event);
    ev->type = EVENT_TYPE_EVENT_TERMINATE;
    Parrot_schedule_event(interp, ev);
}

/*

=item C<void Parrot_schedule_interp_qentry(PARROT_INTERP, struct QUEUE_ENTRY
*entry)>

Put a queue entry into the interpreters task queue and enable event
checking for the interpreter.

=cut

*/

PARROT_EXPORT
void
Parrot_schedule_interp_qentry(PARROT_INTERP, ARGIN(struct QUEUE_ENTRY *entry))
{
    ASSERT_ARGS(Parrot_schedule_interp_qentry)
    parrot_event * const event = (parrot_event *)entry->data;
    /*
     * sleep checks events when it awakes
     */
    edebug((stderr, "got entry - schedule_inter_qentry %s\n", et(event)));
    if (event->type != EVENT_TYPE_SLEEP)
        enable_event_checking(interp);
    /*
     * do push_entry last - this signales the queue condition so the
     * interpreter might starting process that event immediately
     *
     * we should better use a priority for placing the event
     * in front or at the end of the queue
     */
    switch (event->type) {
      case EVENT_TYPE_CALL_BACK:
      case EVENT_TYPE_SIGNAL:
        unshift_entry(interp->task_queue, entry);
        break;
      default:
        push_entry(interp->task_queue, entry);
        break;
    }
}

/*

=item C<void Parrot_schedule_broadcast_qentry(struct QUEUE_ENTRY *entry)>

Broadcast an event.

=cut

*/

void
Parrot_schedule_broadcast_qentry(ARGIN(struct QUEUE_ENTRY *entry))
{
    ASSERT_ARGS(Parrot_schedule_broadcast_qentry)
    parrot_event * const event = (parrot_event *)entry->data;

    switch (event->type) {
      case EVENT_TYPE_SIGNAL:
        edebug((stderr, "broadcast signal\n"));
        /*
         * we don't have special signal handlers in usercode yet
         * e.g.:
         * install handler like exception handler *and*
         * set a interpreter flag, that a handler exists
         * we then could examine that flag (after LOCKing it)
         * and dispatch the exception to all interpreters that
         * handle it
         * Finally, we send the first (main) interpreter that signal
         *
         * For now just send to all.
         *
         */
        switch (event->u.signal) {
          case SIGHUP:
          case SIGINT:
            {
                if (n_interpreters) {
                    size_t i;
                    LOCK(interpreter_array_mutex);
                    for (i = 1; i < n_interpreters; ++i) {
                        Interp *interp;
                        edebug((stderr, "deliver SIGINT to %d\n", i));
                        interp = interpreter_array[i];
                        if (interp)
                            Parrot_schedule_interp_qentry(interp,
                                        dup_entry(entry));
                    }
                    UNLOCK(interpreter_array_mutex);
                }
                Parrot_schedule_interp_qentry(interpreter_array[0], entry);
                edebug((stderr, "deliver SIGINT to 0\n"));
            }
            break;
          default:
            mem_internal_free(entry);
            mem_internal_free(event);
        }
        break;
      default:
        mem_internal_free(entry);
        mem_internal_free(event);
        exit_fatal(1, "Unknown event to broadcast");
        break;
    }
}

/*

=back

=head2 IO Thread Handling

=over 4

=cut

*/

#ifndef WIN32

/*

=item C<static void store_io_event(pending_io_events *ios, parrot_event *ev)>

Stores an event in the event stack.  Allocates memory if necessary.

=cut

*/

static void
store_io_event(ARGMOD(pending_io_events *ios), ARGIN(parrot_event *ev))
{
    ASSERT_ARGS(store_io_event)
    if (!ios->alloced) {
        ios->alloced = 16;
        ios->events  = mem_internal_allocate_n_zeroed_typed(ios->alloced, parrot_event *);
    }
    else if (ios->n >= ios->alloced) {
        ios->events  = mem_internal_realloc_n_zeroed_typed(ios->events,
                ios->alloced * 2, ios->alloced, parrot_event *);
        ios->alloced *= 2;
    }
    ios->events[ios->n++] = ev;
}

/*

=item C<static void io_thread_ready_rd(pending_io_events *ios, int ready_rd)>

Takes a list of pending i/o events and a file descriptor.
If the fd is ready to read, the event is removed from the
"pending" list and moved to the "scheduled" task queue.

=cut

*/

static void
io_thread_ready_rd(ARGMOD(pending_io_events *ios), int ready_rd)
{
    ASSERT_ARGS(io_thread_ready_rd)
    size_t i;

    for (i = 0; i < ios->n; ++i) {
        parrot_event * const ev  = ios->events[i];
        PMC          * const pio = ev->u.io_event.pio;
        const int            fd  = Parrot_io_getfd(ev->interp, pio);

        if (fd == ready_rd) {
            /* remove from event list */
            --ios->n;

            for (; i < ios->n; ++i)
                ios->events[i] = ios->events[i+1];

            Parrot_schedule_event(ev->interp, ev);
            break;
        }
    }
}

/*

=item C<static void* io_thread(void *data)>

The IO thread uses select/poll to handle IO events and signals.

It waits on input from the message pipe to insert file descriptors in
the wait sets.

=cut

*/

PARROT_CAN_RETURN_NULL
static void*
io_thread(SHIM(void *data))
{
    ASSERT_ARGS(io_thread)
    fd_set act_rfds, act_wfds;
    int n_highest, i;
    int  running = 1;
    pending_io_events ios;

    ios.n       = 0;
    ios.alloced = 0;
    ios.events  = 0;
    /* remember pending io events */

    FD_ZERO(&act_rfds);
    FD_ZERO(&act_wfds);
    /*
     * Watch the reader end of the pipe for messages
     */
    FD_SET(PIPE_READ_FD, &act_rfds);
    n_highest = PIPE_READ_FD + 1;
    /*
     * all signals that we shall handle here have to be unblocked
     * in this and only in this thread
     */
    Parrot_unblock_signal(SIGHUP);
    while (running) {
        fd_set rfds = act_rfds;
        fd_set wfds = act_wfds;
        const int retval = select(n_highest, &rfds, &wfds, NULL, NULL);

        switch (retval) {
          case -1:
            if (errno == EINTR) {
                edebug((stderr, "select EINTR\n"));
                if (sig_int) {
                    edebug((stderr, "int arrived\n"));
                    sig_int = 0;
                    /*
                     * signal the event thread
                     */
                    schedule_signal_event(SIGINT);
                }
                if (sig_hup) {
                    edebug((stderr, "int arrived\n"));
                    sig_hup = 0;
                    /*
                     * signal the event thread
                     */
                    schedule_signal_event(SIGHUP);
                }

            }
            break;
          case 0:     /* timeout - can't happen */
            break;
          default:
            edebug((stderr, "IO ready\n"));
            for (i = 0; i < n_highest; ++i) {
                if (FD_ISSET(i, &rfds)) {
                    if (i == PIPE_READ_FD) {
                        io_thread_msg buf;
                        /*
                         * a command arrived
                         */
                        edebug((stderr, "msg arrived\n"));
                        if (read(PIPE_READ_FD, &buf, sizeof (buf)) != sizeof (buf))
                            exit_fatal(1,
                                    "read error from msg pipe");
                        switch (buf.command) {
                          case IO_THR_MSG_TERMINATE:
                            running = 0;
                            break;
                          case IO_THR_MSG_ADD_SELECT_RD:
                            {
                                PMC * const pio = buf.ev->u.io_event.pio;
                                const int fd = Parrot_io_getfd(buf.ev->interp, pio);
                                if (FD_ISSET(fd, &act_rfds)) {
                                    mem_internal_free(buf.ev);
                                    break;
                                }
                                FD_SET(fd, &act_rfds);
                                if (fd >= n_highest)
                                    n_highest = fd + 1;
                                store_io_event(&ios, buf.ev);
                            }
                            break;
                          default:
                            /* TODO */
                            exit_fatal(1, "unhandled msg in pipe");
                            break;
                        }

                    }
                    else {
                        /*
                         * one of the io_event fds is ready
                         * remove from active set, as we don't
                         * want to fire again during io_handler
                         * invocation
                         */
                        FD_CLR(i, &act_rfds);
                        io_thread_ready_rd(&ios, i);
                    }
                }
            }
            /* TODO check fds */
            break;
        }
    }
    edebug((stderr, "IO thread terminated\n"));
    close(PIPE_READ_FD);
    close(PIPE_WRITE_FD);
    return NULL;
}
#endif

/*

=item C<static void stop_io_thread(void)>

Tell the IO thread to stop.

=cut

*/

static void
stop_io_thread(void)
{
    ASSERT_ARGS(stop_io_thread)
#ifndef WIN32
    io_thread_msg buf;
    /*
     * tell IO thread to stop
     */
    memset(&buf, 0, sizeof (buf));
    buf.command = IO_THR_MSG_TERMINATE;
    if (write(PIPE_WRITE_FD, &buf, sizeof (buf)) != sizeof (buf))
        exit_fatal(1, "msg pipe write failed");
#endif
}

/*

=item C<void Parrot_event_add_io_event(PARROT_INTERP, PMC *pio, PMC *sub, PMC
*data, INTVAL which)>

Create new i/o event.

=cut

*/

PARROT_EXPORT
void
Parrot_event_add_io_event(PARROT_INTERP,
        ARGIN_NULLOK(PMC *pio), ARGIN_NULLOK(PMC *sub), ARGIN_NULLOK(PMC *data), INTVAL which)
{
    ASSERT_ARGS(Parrot_event_add_io_event)
    io_thread_msg buf;
    parrot_event * const event = mem_internal_allocate_typed(parrot_event);

    event->type   = EVENT_TYPE_IO;
    event->interp = interp;
    /*
     * TODO gc_register these PMCs as long as the event system
     *      owns these 3
     *      unregister, when event is passed to interp again
     */
    event->u.io_event.pio       = pio;
    event->u.io_event.handler   = sub;
    event->u.io_event.user_data = data;

    buf.command = which;
    buf.ev      = event;
    /* XXX Why isn't this entire function inside an ifndef WIN32? */
#ifndef WIN32
    if (write(PIPE_WRITE_FD, &buf, sizeof (buf)) != sizeof (buf))
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "msg pipe write failed");
#endif
}


/*

=back

=head2 Event Handler Thread Functions

=over 4

=item C<static QUEUE_ENTRY* dup_entry(const QUEUE_ENTRY *entry)>

Duplicate queue entry.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static QUEUE_ENTRY*
dup_entry(ARGIN(const QUEUE_ENTRY *entry))
{
    ASSERT_ARGS(dup_entry)
    QUEUE_ENTRY * const new_entry = mem_internal_allocate_typed(QUEUE_ENTRY);

    new_entry->next = NULL;
    new_entry->type = entry->type;
    new_entry->data = mem_internal_allocate_typed(parrot_event);

    mem_sys_memcopy(new_entry->data, entry->data, sizeof (parrot_event));
    return new_entry;
}

/*

=item C<static QUEUE_ENTRY* dup_entry_interval(QUEUE_ENTRY *entry, FLOATVAL
now)>

Duplicate timed entry and add interval to C<abs_time>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static QUEUE_ENTRY*
dup_entry_interval(ARGIN(QUEUE_ENTRY *entry), FLOATVAL now)
{
    ASSERT_ARGS(dup_entry_interval)
    QUEUE_ENTRY  * const new_entry = dup_entry(entry);
    parrot_event * const event     = (parrot_event *)new_entry->data;

    event->u.timer_event.abs_time  = now + event->u.timer_event.interval;

    return new_entry;
}

/*

=item C<static int process_events(QUEUE *event_q)>

Do something, when an event arrived caller has locked the mutex returns
0 if event thread terminates.

=cut

*/

static int
process_events(ARGMOD(QUEUE *event_q))
{
    ASSERT_ARGS(process_events)
    FLOATVAL     now;
    QUEUE_ENTRY *entry;

    while ((entry = peek_entry(event_q)) != NULL) {
        /*
         * one or more entries arrived - we hold the mutex again
         * so we have to use the nonsyc_pop_entry to pop off event entries
         */
        parrot_event *event = NULL;

        switch (entry->type) {
          case QUEUE_ENTRY_TYPE_EVENT:
            entry = nosync_pop_entry(event_q);
            event = (parrot_event *)entry->data;
            break;

          case QUEUE_ENTRY_TYPE_TIMED_EVENT:
            event = (parrot_event *)entry->data;
            now   = Parrot_floatval_time();

            /*
             * if the timer_event isn't due yet, ignore the event
             * (we were signalled on insert of the event)
             * wait until we get at it again when time has elapsed
             */
            if (now < event->u.timer_event.abs_time)
                return 1;
            entry = nosync_pop_entry(event_q);

            /* if event is repeated dup and reinsert it */

            if (event->u.timer_event.interval) {
                if (event->u.timer_event.repeat) {
                    if (event->u.timer_event.repeat != -1)
                        event->u.timer_event.repeat--;
                    nosync_insert_entry(event_q,
                                dup_entry_interval(entry, now));
                }
            }
            break;
          default:
            exit_fatal(1, "Unknown queue entry");
        }
        PARROT_ASSERT(event);
        if (event->type == EVENT_TYPE_NONE) {
            mem_internal_free(entry);
            mem_internal_free(event);
            continue;
        }
        else if (event->type == EVENT_TYPE_EVENT_TERMINATE) {
            mem_internal_free(entry);
            mem_internal_free(event);

            return 0;
        }
        /*
         * now insert entry in interpreter task queue
         */
        if (event->interp) {
            Parrot_schedule_interp_qentry(event->interp, entry);
        }
        else {
            Parrot_schedule_broadcast_qentry(entry);
        }
    } /* while events */
    return 1;
}

/*

=item C<static void* event_thread(void *data)>

The event thread is started by the first interpreter. It handles all
events for all interpreters.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static void*
event_thread(ARGMOD(void *data))
{
    ASSERT_ARGS(event_thread)
    QUEUE * const event_q = (QUEUE *) data;
    int running = 1;

    LOCK(event_q->queue_mutex);
    /*
     * we might already have an event in the queue
     */
    if (peek_entry(event_q))
        running = process_events(event_q);
    while (running) {
        QUEUE_ENTRY * const entry = peek_entry(event_q);

        if (!entry) {
            /* wait infinite until entry arrives */
            queue_wait(event_q);
        }
        else if (entry->type == QUEUE_ENTRY_TYPE_TIMED_EVENT) {
            /* do a_timedwait for entry */
            struct timespec abs_time;
            parrot_event * const event = (parrot_event*)entry->data;
            const FLOATVAL when = event->u.timer_event.abs_time;

            abs_time.tv_sec  = (time_t) when;
            abs_time.tv_nsec = (long)((when - abs_time.tv_sec)*1000.0f)
                *1000L*1000L;
            queue_timedwait(event_q, &abs_time);
        }
        else {
            /* we shouldn't get here probably
             */
            exit_fatal(1, "Spurious event");

        }
        /*
         * one or more entries arrived - we hold the mutex again
         * so we have to use the nonsync_pop_entry to pop off event entries
         */
        running = process_events(event_q);
    } /* event loop */
    /*
     * the main interpreter is dying
     * TODO empty the queue
     */
    UNLOCK(event_q->queue_mutex);
    queue_destroy(event_q);
    stop_io_thread();
    edebug((stderr, "event thread stopped\n"));
    return NULL;
}

/*

=back

=head2 Sleep Handling

=over 4

=item C<static opcode_t * wait_for_wakeup(PARROT_INTERP, opcode_t *next)>

Sleep on the event queue condition. If an event arrives, the event
is processed. Terminate the loop if sleeping is finished.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t *
wait_for_wakeup(PARROT_INTERP, ARGIN_NULLOK(opcode_t *next))
{
    ASSERT_ARGS(wait_for_wakeup)
    QUEUE * const tq = interp->task_queue;

    interp->sleeping = 1;

    /*
     * event handler like callbacks or timers are run as normal code
     * so inside such an event handler function, another event might get
     * handled, which is good (higher priority events can interrupt
     * other event handler).  OTOH we must ensure that all state changes
     * are done in do_event and we should probably suspend nested
     * event handlers sometimes
     *
     * FIXME: the same is true for the *next param:
     *        get rid of that, instead mangle the resume flags
     *        and offset to stop the runloop
     *
     */

    while (interp->sleeping) {
        QUEUE_ENTRY  * const entry = wait_for_entry(tq);
        parrot_event * const event = (parrot_event*)entry->data;

        mem_internal_free(entry);
        edebug((stderr, "got ev %s head : %p\n", et(event), tq->head));
        next = do_event(interp, event, next);
    }

    edebug((stderr, "woke up\n"));
    return next;
}

/*

=item C<opcode_t * Parrot_sleep_on_event(PARROT_INTERP, FLOATVAL t, opcode_t
*next)>

Go to sleep. This is called from the C<sleep> opcode.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t *
Parrot_sleep_on_event(PARROT_INTERP, FLOATVAL t, ARGIN_NULLOK(opcode_t *next))
{
    ASSERT_ARGS(Parrot_sleep_on_event)
#ifdef PARROT_HAS_THREADS

    if (interp->sleeping)
        fprintf(stderr, "nested sleep might not work\n");
    /*
     * place the opcode_t* next arg in the event data, so that
     * we can identify this event in wakeup
     */
    Parrot_new_timer_event(interp, (PMC *) next, t, 0.0, 0,
        NULL, EVENT_TYPE_SLEEP);
    next = wait_for_wakeup(interp, next);
#else
    /*
     * TODO check for nanosleep or such
     */
    Parrot_sleep((UINTVAL) ceil(t));
#endif
    return next;
}

/*

=back

=head2 Event Handling for Run-Loops

=over 4

=item C<opcode_t * Parrot_do_check_events(PARROT_INTERP, opcode_t *next)>

Explicitly C<sync> called by the check_event opcode from run loops.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t *
Parrot_do_check_events(PARROT_INTERP, ARGIN_NULLOK(opcode_t *next))
{
    ASSERT_ARGS(Parrot_do_check_events)
    if (peek_entry(interp->task_queue))
        return Parrot_do_handle_events(interp, 0, next);

    return next;
}

/*

=item C<static void event_to_exception(PARROT_INTERP, const parrot_event*
event)>

Convert event to exception and throw it.

=cut

*/

static void
event_to_exception(PARROT_INTERP, ARGIN(const parrot_event* event))
{
    ASSERT_ARGS(event_to_exception)
    const int exit_code = -event->u.signal;

    switch (event->u.signal) {
      case SIGINT:
      case SIGHUP:
        /*
         * SIGINT is silent, if no exception handler is
         * installed: set severity to EXCEPT_exit
         */
        {
            STRING * const message = CONST_STRING(interp, "Caught signal.");
            PMC           *exception = Parrot_ex_build_exception(interp,
                                        EXCEPT_exit, exit_code, message);

            Parrot_ex_throw_from_c(interp, exception);
        }
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, exit_code,
                    "Caught signal.");
        break;
    }
}

/*

=item C<static opcode_t * do_event(PARROT_INTERP, parrot_event* event, opcode_t
*next)>

Run user code or such.  The C<event> argument is freed after execution.

TODO: Instrument with splint args so splint knows event gets released.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t *
do_event(PARROT_INTERP, ARGIN(parrot_event* event), ARGIN_NULLOK(opcode_t *next))
{
    ASSERT_ARGS(do_event)
    edebug((stderr, "do_event %s\n", et(event)));
    switch (event->type) {
      case EVENT_TYPE_TERMINATE:
        next = NULL;        /* this will terminate the run loop */
        break;
      case EVENT_TYPE_SIGNAL:
        interp->sleeping = 0;
        /* generate exception */
        event_to_exception(interp, event);
        /* not reached - will longjmp */
        break;
      case EVENT_TYPE_TIMER:
        /* run ops, save registers */
        Parrot_pcc_invoke_sub_from_c_args(interp,
                    event->u.timer_event.sub, "->");
        break;
      case EVENT_TYPE_CALL_BACK:
        edebug((stderr, "starting user cb\n"));
        Parrot_run_callback(interp, event->u.call_back.cbi,
                    event->u.call_back.external_data);
        break;
      case EVENT_TYPE_IO:
        edebug((stderr, "starting io handler\n"));
        Parrot_pcc_invoke_sub_from_c_args(interp,
                    event->u.io_event.handler,
                    "PP->",
                    event->u.io_event.pio,
                    event->u.io_event.user_data);
        break;
      case EVENT_TYPE_SLEEP:
        interp->sleeping = 0;
        break;
      case EVENT_TYPE_SUSPEND_FOR_GC:
        edebug((stderr, "suspend for gc\n"));
        pt_suspend_self_for_gc(interp);
        break;
      default:
        fprintf(stderr, "Unhandled event type %d\n", (int)event->type);
        break;
    }
    mem_internal_free(event);
    return next;
}

/*

=item C<opcode_t * Parrot_do_handle_events(PARROT_INTERP, int restore, opcode_t
*next)>

Called by the C<check_event__> opcode from run loops or from above. When
called from the C<check_events__> opcode, we have to restore the
C<op_func_table>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t *
Parrot_do_handle_events(PARROT_INTERP, int restore, ARGIN_NULLOK(opcode_t *next))
{
    ASSERT_ARGS(Parrot_do_handle_events)
    QUEUE * const tq = interp->task_queue;

    if (restore)
        disable_event_checking(interp);

    if (!peek_entry(tq))
        return next;

    while (peek_entry(tq)) {
        QUEUE_ENTRY  * const entry = pop_entry(tq);
        parrot_event * const event = (parrot_event*)entry->data;

        mem_internal_free(entry);
        next = do_event(interp, event, next);
    }

    return next;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/events.h> and F<docs/dev/events.pod>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
