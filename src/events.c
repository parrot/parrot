/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/events.c - Event handling stuff

=head1 DESCRIPTION

An event_thread handles async events for all interpreters. When events
are due, they are placed in per interpreter task_queues, where they are
handled then by the C<check_event*> opcodes.

IO events and signals are catched in the io_thread, which again
dispatches these to one or all interpreters.

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

/*
 * event debugging stuff - turn it off befreo running tests
 */
#define EVENT_DEBUG 0
/*
 * not yet - need to sort out platform code and fix exceptions first
 */
#ifdef linux
#  define INSTALL_EVENT_HANDLER 1
#else
#  define INSTALL_EVENT_HANDLER 0
#endif

#if EVENT_DEBUG
#  define edebug(x) puts(x)
#else
#  define edebug(x)
#endif


/* forward defs */
static void* event_thread(void *data);
static void* io_thread(void *data);
static void* do_event(Parrot_Interp, parrot_event*, void*);
static void stop_io_thread(void);
static void schedule_signal_event(int signum);
void Parrot_schedule_broadcast_qentry(QUEUE_ENTRY* entry);

/*
 * we have exactly one global event_queue
 * TODO task prio handling
 */
static QUEUE* event_queue;
#define TASK_PRIO 10

/*
 * user accessible signals like SIGINT
 */
#ifndef SIGINT
#  define SIGINT -4711
#endif
static sig_atomic_t sig_int;

/*
 * a pipe is used to send messages to the IO thread
 */
static int pipe_fds[2];
#define PIPE_READ_FD  pipe_fds[0]
#define PIPE_WRITE_FD pipe_fds[1]
/*
 * msgs are 3 ints sized
 * buf[0] = command
 * buf[1] = fd or better a parrot_event ptr or such
 * buf[2] = NL
 */
#define MSG_SIZE (3*sizeof(int))

/*

=head2 Signal Handling

=over 4

=item C<static void sig_handler(int signum)>

Handle signal C<signum>.

TODO - Only C<SIGINT> is handled at the moment.

=cut

*/

static void
sig_handler(int signum)
{
    switch (signum) {
        case SIGINT:
            sig_int = 1;
            break;
    }
}

#if PARROT_HAS_SIGACTION
/*

=item C<static void
Parrot_sigaction(int sig, void (*handler)(int))>

Signal handlers are common to all threads, signal block masks are
specific, so we install one handler then block that signal and unblock
it in the thread, that will receive that signal.

=cut

*/

static void
Parrot_sigaction(int sig, void (*handler)(int))
{
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
}

/*
 * unblock a signal
 */
static void
Parrot_unblock_signal(int sig)
{
    sigset_t block_mask;

    sigemptyset(&block_mask);
    sigaddset(&block_mask, sig);
    sigprocmask(SIG_UNBLOCK, &block_mask, NULL);
}

#else
static void
Parrot_sigaction(int sig, void (*handler)(int))
{
}

static void
Parrot_unblock_signal(int sig)
{
}
#endif

void
Parrot_init_signals(void)
{
    /*
     * SIGFPE is architecture specific - some signal an error
     * some don't, so we have to use direct checks if we are dividing
     * by zero
     */
    Parrot_sigaction(SIGINT, sig_handler);
}

/*

=back

=head2 Initialization

=over 4

=item C<static void init_events_first(Parrot_Interp interpreter)>

Init event system for first interpreter.

=cut

*/

static void
init_events_first(Parrot_Interp interpreter)
{
    Parrot_thread    ev_handle, io_handle;

    /*
     * be sure all init is done only once
     * we could use pthread_once for that too
     */
    if (event_queue)
        PANIC("event queue already exists - missing parent_interp?");
    /*
     * we need a global mutex to protect the interpreter array
     */
    MUTEX_INIT(interpreter_array_mutex);
    /*
     * create event queue
     */
    event_queue = queue_init(TASK_PRIO);
    /*
     * we use a message pipe to send IO related stuff to the
     * IO thread
     */
    if (pipe(pipe_fds))
        internal_exception(1, "Couldn't create message pipe");
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
    THREAD_CREATE_DETACHED(io_handle, io_thread, event_queue);
}

/*

=item C<static void init_events_all(Parrot_Interp interpreter)>

Init events for all interpreters.

=cut

*/

static void
init_events_all(Parrot_Interp interpreter)
{
    /*
     * create per interpreter task queue
     */
    interpreter->task_queue = queue_init(0);
}

/*

=item C<void Parrot_init_events(Parrot_Interp interpreter)>

Initialize the event system.

=cut

*/

void
Parrot_init_events(Parrot_Interp interpreter)
{
    if (!interpreter->parent_interpreter) {
        /* add the very first interpreter to the list of interps. */
        pt_add_to_interpreters(interpreter, NULL);
        init_events_first(interpreter);
    }
    init_events_all(interpreter);
}

/*

=back

=head2 Event Handler Functions

=over 4

=item C<code>

Create queue entry and insert event into task queue.

=cut

*/

void
Parrot_schedule_event(Parrot_Interp interpreter, parrot_event* ev)
{
    QUEUE_ENTRY* entry = mem_sys_allocate(sizeof(QUEUE_ENTRY));
    entry->next = NULL;
    ev->interp = interpreter;
    entry->data = ev;
    switch (ev->type) {
        case EVENT_TYPE_TIMER:
        case EVENT_TYPE_SLEEP:
            entry->type = QUEUE_ENTRY_TYPE_TIMED_EVENT;
            insert_entry(event_queue, entry);
            break;
        case EVENT_TYPE_SIGNAL:
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
 * create and schedule a signal event
 */
static void
schedule_signal_event(int signum)
{
    parrot_event* ev = mem_sys_allocate(sizeof(parrot_event));
    ev->type = EVENT_TYPE_SIGNAL;
    ev->u.signal = signum;
    /*
     * or do directly Parrot_schedule_broadcast_qentry()
     */
    Parrot_schedule_event(NULL, ev);
}

/*

=item C<void
Parrot_new_timer_event(Parrot_Interp interpreter, PMC* timer, FLOATVAL diff,
        FLOATVAL interval, int repeat, PMC* sub, parrot_event_type_enum typ)>

Create a new timer event due at C<diff> from now, repeated at C<interval>
and running the passed C<sub>.

=cut

*/

void
Parrot_new_timer_event(Parrot_Interp interpreter, PMC* timer, FLOATVAL diff,
        FLOATVAL interval, int repeat, PMC* sub, parrot_event_type_enum typ)
{
    parrot_event* ev = mem_sys_allocate(sizeof(parrot_event));
    FLOATVAL now = Parrot_floatval_time();
    ev->type = typ;
    ev->data = timer;
    ev->u.timer_event.abs_time = now + diff;
    ev->u.timer_event.interval = interval;
    ev->u.timer_event.repeat   = repeat;
    if (repeat && !interval)
        ev->u.timer_event.interval = diff;
    ev->u.timer_event.sub = sub;
    Parrot_schedule_event(interpreter, ev);
}

/*

=item C<void
Parrot_del_timer_event(Parrot_Interp interpreter, PMC* timer)>

Deactivate the timer identified by C<timer>.

=cut

*/

void
Parrot_del_timer_event(Parrot_Interp interpreter, PMC* timer)
{
    QUEUE_ENTRY *entry;
    parrot_event* event;

    LOCK(event_queue->queue_mutex);
    for (entry = event_queue->head; entry; entry = entry->next) {
        if (entry->type == QUEUE_ENTRY_TYPE_TIMED_EVENT) {
            event = entry->data;
            if (event->interp == interpreter && event->data == timer) {
                event->u.timer_event.interval = 0.0;
                event->type = EVENT_TYPE_NONE;
                break;
            }
        }
    }
    UNLOCK(event_queue->queue_mutex);
}

/*

=item C<void Parrot_new_terminate_event(Parrot_Interp interpreter)>

Create a terminate event, interpreter will leave the run-loop when this
event arrives.

=cut

*/

void
Parrot_new_terminate_event(Parrot_Interp interpreter)
{
    parrot_event* ev = mem_sys_allocate(sizeof(parrot_event));
    ev->type = EVENT_TYPE_TERMINATE;
    ev->data = NULL;
    Parrot_schedule_event(interpreter, ev);
}

/*

=item C<void Parrot_kill_event_loop(void)>

Schedule event-loop terminate event. This shuts down the event thread.

=cut

*/

void
Parrot_kill_event_loop(void)
{
    parrot_event* ev = mem_sys_allocate(sizeof(parrot_event));
    ev->type = EVENT_TYPE_EVENT_TERMINATE;
    ev->data = NULL;
    Parrot_schedule_event(NULL, ev);
}

/*

=item C<void
Parrot_schedule_interp_qentry(Parrot_Interp interpreter, QUEUE_ENTRY* entry)>

Put a queue entry into the interpreters task queue.

=cut

*/

void
Parrot_schedule_interp_qentry(Parrot_Interp interpreter, QUEUE_ENTRY* entry)
{
    parrot_event* event;
    event = entry->data;
    if (event->type != EVENT_TYPE_SLEEP)
        enable_event_checking(interpreter);
    /*
     * do push_entry last - this signales the queue condition so the
     * interpreter might starting process that event immediately
     */
    push_entry(interpreter->task_queue, entry);
}

/*

=item C<void
Parrot_schedule_broadcast_qentry(QUEUE_ENTRY* entry)>

Broadcast an event.

=cut

*/

void
Parrot_schedule_broadcast_qentry(QUEUE_ENTRY* entry)
{
    Parrot_Interp interp;
    parrot_event* event;

    event = entry->data;
    switch (event->type) {
        case EVENT_TYPE_SIGNAL:
            edebug(("broadcast signal"));
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
             * or just send to all?
             *
             * TODO put first interpreter into interp. array immediately
             *      not only when threads are started
             */
            switch(event->u.signal) {
                case SIGINT:
                    /* for now send an exit event to the
                     * first interpreter
                     */
                    event->type = EVENT_TYPE_TERMINATE;
                    interp = interpreter_array[0];
                    Parrot_schedule_interp_qentry(interp, entry);
                    break;
                default:
                    mem_sys_free(entry);
                    mem_sys_free(event);
            }
            break;
        default:
            mem_sys_free(entry);
            mem_sys_free(event);
            internal_exception(1, "Unknown event to broadcast");
            break;
    }
}

/*

=back

=head2 IO Thread Handling

=over 4

=item C<static void*
io_thread(void *data)>

The IO thread uses select/poll to handle IO events and signals.

It waits on input from the message pipe to insert file descriptors in
the wait sets.

=cut

*/

static void*
io_thread(void *data)
{
    QUEUE* event_q = (QUEUE*) data;
    fd_set rfds, wfds;
    int n_highest;
    int running = 1;

    FD_ZERO(&rfds);
    FD_ZERO(&wfds);
    /*
     * Watch the reader end of the pipe for messages
     */
    FD_SET(PIPE_READ_FD, &rfds);
    n_highest = PIPE_READ_FD + 1;
    /*
     * all signals that we shall handle here have to be unblocked
     * in this and only in this thread
     */
    Parrot_unblock_signal(SIGINT);
    while (running) {
        int retval = select(n_highest, &rfds, &wfds, NULL, NULL);
        switch (retval) {
            case -1:
                if (errno == EINTR) {
                    edebug(("select EINTR"));
                    if (sig_int) {
                        edebug(("int arrived"));
                        sig_int = 0;
                        /*
                         * signal the event thread
                         */
                        schedule_signal_event(SIGINT);
                    }

                }
                break;
            default:
                if (retval > 0) {
                    edebug(("IO ready"));
                    if (FD_ISSET(PIPE_READ_FD, &rfds)) {
                        int buf[3];
                        /*
                         * a command arrived
                         */
                        edebug(("msg arrived"));
                        if (read(PIPE_READ_FD, buf, MSG_SIZE) != MSG_SIZE)
                            internal_exception(1,
                                    "read error from msg pipe");
                        switch (buf[0]) {
                            case 'e':
                                running = 0;
                                break;
                            /* TODO */
                            case 'r':
                                /* insert fd in buf[1] into rfds */
                            case 'w':
                                /* insert fd in buf[1] into wfds */
                            case 'R':
                                /* delete fd in buf[1] from rfds */
                            case 'W':
                                /* delete fd in buf[1] from wfds */
                                break;
                            default:
                                internal_exception(1,
                                        "unhandled msg in pipe");
                                break;
                        }

                    }
                    /* TODO check fds */
                    break;
                }
        }
    }
    edebug(("IO thread terminated"));
    close(PIPE_READ_FD);
    close(PIPE_WRITE_FD);
    return NULL;
}

/*

=item C<static void
stop_io_thread(void)>

Tell the IO thread to stop.

=cut

*/

static void
stop_io_thread(void)
{
    int buf[3];
    /*
     * tell IO thread to stop
     */
    buf[0] = 'e';
    buf[1] = -1;
    buf[2] = '\n';
    if (write(PIPE_WRITE_FD, buf, MSG_SIZE) != MSG_SIZE)
        internal_exception(1, "msg pipe write failed");
}

/*

=back

=head2 Event Handler Thread Functions

=over 4

=item C<static QUEUE_ENTRY*
dup_entry_interval(QUEUE_ENTRY* entry, FLOATVAL now)>

Duplicate timed entry and add interval to C<abs_time>.

=cut

*/

static QUEUE_ENTRY*
dup_entry_interval(QUEUE_ENTRY* entry, FLOATVAL now)
{
    parrot_event *event;
    QUEUE_ENTRY *new_entry;

    new_entry = mem_sys_allocate(sizeof(QUEUE_ENTRY));
    new_entry->next = NULL;
    new_entry->type = entry->type;
    event = new_entry->data = mem_sys_allocate(sizeof(parrot_event));
    mem_sys_memcopy(event, entry->data, sizeof(parrot_event));
    event->u.timer_event.abs_time = now + event->u.timer_event.interval;
    return new_entry;
}

/*

=item C<static int process_events(QUEUE* event_q)>

Do something, when an event arrived caller has locked the mutex returns
0 if event thread terminates.

=cut

*/

static int
process_events(QUEUE* event_q)
{
    FLOATVAL now;
    QUEUE_ENTRY *entry;
    parrot_event* event;

    while (( entry = peek_entry(event_q))) {
        /*
         * one or more entries arrived - we hold the mutex again
         * so we have to use the nonsyc_pop_entry to pop off event entries
         */
        event = NULL;
        switch (entry->type) {
            case QUEUE_ENTRY_TYPE_EVENT:
                entry = nosync_pop_entry(event_q);
                event = entry->data;
                break;
            case QUEUE_ENTRY_TYPE_TIMED_EVENT:
                event = entry->data;
                now = Parrot_floatval_time();
                /*
                 * if the timer_event isn't due yet, ignore the event
                 * (we were signalled on insert of the event)
                 * wait until we get at it again when time has elapsed
                 */
                if (now < event->u.timer_event.abs_time)
                    return 1;
                entry = nosync_pop_entry(event_q);
                /*
                 * if event is repeated dup and reinsert it
                 */
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
                internal_exception(1, "Unknown queue entry");
        }
        assert(event);
        if (event->type == EVENT_TYPE_NONE) {
            mem_sys_free(entry);
            mem_sys_free(event);
            continue;
        }
        else if (event->type == EVENT_TYPE_EVENT_TERMINATE) {
            mem_sys_free(entry);
            mem_sys_free(event);

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

static void*
event_thread(void *data)
{
    QUEUE* event_q = (QUEUE*) data;
    parrot_event* event;
    QUEUE_ENTRY *entry;
    int running = 1;

    LOCK(event_q->queue_mutex);
    /*
     * we might already have an event in the queue
     */
    if (peek_entry(event_q))
        running = process_events(event_q);
    while (running) {
        entry = peek_entry(event_q);
        if (!entry) {
            /* wait infinite until entry arrives */
            queue_wait(event_q);
        }
        else if (entry->type == QUEUE_ENTRY_TYPE_TIMED_EVENT) {
            /* do a_timedwait for entry */
            struct timespec abs_time;
            FLOATVAL when;
            event = (parrot_event* )entry->data;
            when = event->u.timer_event.abs_time;
            abs_time.tv_sec = (time_t) when;
            abs_time.tv_nsec = (when - abs_time.tv_sec) *
                (1000L*1000L*1000L);
            queue_timedwait(event_q, &abs_time);
        }
        else {
            /* we shouldn't get here probably
             */
            internal_exception(1, "Spurious event");

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
    edebug(("event thread stopped"));
    return NULL;
}

/*

=back

=head2 Sleep Handling

=over 4

=item C<static void*
wait_for_wakeup(Parrot_Interp interpreter, void *next)>

Runs in a loop until told to wake up.

=cut

*/

static void*
wait_for_wakeup(Parrot_Interp interpreter, void *next)
{
    QUEUE_ENTRY *entry;
    parrot_event* event;
    int sleeping = 1;

    while (sleeping) {
        entry = wait_for_entry(interpreter->task_queue);
        event = (parrot_event* )entry->data;
        mem_sys_free(entry);
        if (event->type == EVENT_TYPE_SLEEP && event->data == next)
            sleeping = 0;
        else if (event->type == EVENT_TYPE_TERMINATE)
            sleeping = 0;
        next = do_event(interpreter, event, next);
    }
    return next;
}

/*

=item C<void*
Parrot_sleep_on_event(Parrot_Interp interpreter, FLOATVAL t, void* next)>

Go to sleep. This is called from the C<sleep> opcode.

=cut

*/

void*
Parrot_sleep_on_event(Parrot_Interp interpreter, FLOATVAL t, void* next)
{
#if PARROT_HAS_THREADS

    /*
     * place the opcode_t* next arg in the event data, so that
     * we can identify this event in wakeup
     */
    Parrot_new_timer_event(interpreter, (PMC*) next, t,
			0, 0, NULL, EVENT_TYPE_SLEEP);
    next = wait_for_wakeup(interpreter, next);
#else
    /*
     * TODO check for nanosleep or such
     */
    Parrot_sleep((UINTVAL) t);
#endif
    return next;
}

/*

=back

=head2 Event Handling for Run-Loops

=over 4

=item C<void*
Parrot_do_check_events(Parrot_Interp interpreter, void *next)>

Explicitely C<sync> called by the check_event opcode from run loops.

=cut

*/

void*
Parrot_do_check_events(Parrot_Interp interpreter, void *next)
{
    if (peek_entry(interpreter->task_queue))
        return Parrot_do_handle_events(interpreter, 0, next);
    return next;
}

/*

=item C<static void*
do_event(Parrot_Interp interpreter, parrot_event* event, void *next)>

Run user code or such.

=cut

*/

static void*
do_event(Parrot_Interp interpreter, parrot_event* event, void *next)
{
    switch (event->type) {
        case EVENT_TYPE_TERMINATE:
            next = NULL;        /* this will terminate the run loop */
            break;
        case EVENT_TYPE_TIMER:
            /* run ops, save registers */
            Parrot_runops_fromc_save(interpreter,
                    event->u.timer_event.sub);
            break;
        case EVENT_TYPE_SLEEP:
            break;
        default:
            fprintf(stderr, "Unhandled event type %d\n", event->type);
            break;
    }
    mem_sys_free(event);
    return next;
}

/*

=item C<void *
Parrot_do_handle_events(Parrot_Interp interpreter, int restore, void *next)>

Called by the C<check_event__> opcode from run loops or from above. When
called from the C<check_events__> opcode, we have to restore the
C<op_func_table>.

=cut

*/

void *
Parrot_do_handle_events(Parrot_Interp interpreter, int restore, void *next)
{
    QUEUE_ENTRY *entry;
    parrot_event* event;

    if (restore)
        disable_event_checking(interpreter);
    if (!peek_entry(interpreter->task_queue))
        return next;
    while (peek_entry(interpreter->task_queue)) {
        entry = pop_entry(interpreter->task_queue);
        event = (parrot_event* )entry->data;
        mem_sys_free(entry);
        next = do_event(interpreter, event, next);
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
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
