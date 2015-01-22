/*
Copyright (C) 2010-2015, Parrot Foundation.

=head1 NAME

src/alarm.c - Portable alarm, setting a flag after a delay.

=head1 DESCRIPTION

This program implements a mechanism for alarms, setting a flag after a delay.

=cut

*/

#include "parrot/parrot.h"
#include "parrot/alarm.h"
#include "parrot/thread.h"

/* Some per-process state */
static volatile UINTVAL  alarm_serial = 0;
static volatile FLOATVAL alarm_set_to = 0.0;
static volatile FLOATVAL current_alarm = 0.0;

/* HEADERIZER HFILE: include/parrot/alarm.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CAN_RETURN_NULL
static void* Parrot_alarm_runloop(void *arg);

#define ASSERT_ARGS_Parrot_alarm_runloop __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=over 4

=item C<void Parrot_alarm_init(void)>

Initialize the alarm queue. This function should only be called from the initial
pthread. Any other pthreads should make sure to mask out SIGALRM.

=cut

*/

static Parrot_mutex alarm_lock;
static Parrot_cond sleep_cond;

void
Parrot_alarm_init(void)
{
    ASSERT_ARGS(Parrot_alarm_init)
    Parrot_thread thread;
    MUTEX_INIT(alarm_lock);
    COND_INIT(sleep_cond);
    THREAD_CREATE_JOINABLE(thread, Parrot_alarm_runloop, NULL);
}

/*

=item C<static void* Parrot_alarm_runloop(void *arg)>

The thread function handling alarms.

The argument C<arg> is currently ignored.

=cut

*/

PARROT_CAN_RETURN_NULL
static void*
Parrot_alarm_runloop(SHIM(void *arg))
{
    ASSERT_ARGS(Parrot_alarm_runloop)

    while (1) {
        int rc = 0;
        INTVAL notify = 0;

        LOCK(alarm_lock);

        /* First, check if we have any outstanding alarms, and wait for those. */
        if (alarm_set_to > 0) {
            struct timespec ts;
            ts.tv_sec = (time_t)alarm_set_to;
            ts.tv_nsec = (long)((alarm_set_to - ts.tv_sec) * 1000000000.0f);
            current_alarm = alarm_set_to;
            alarm_set_to = 0;
            rc = 0;
            while (alarm_set_to == 0 && rc == 0)
                COND_TIMED_WAIT(sleep_cond, alarm_lock, &ts, rc);
        }
        else {
            /* no alarms set, just wait for new alarms */
            while (alarm_set_to == 0)
                COND_WAIT(sleep_cond, alarm_lock);
        }

        /* Check if we need to notify threads. We need to notify threads if
           an alarm time has passed, or if there has been a timeout error in
           waiting for alarms. */
        if (alarm_set_to > 0 && alarm_set_to <= Parrot_floatval_time()) {
            /* New alarm is already in the past. Don't bother waiting, notify
               immediately */
            notify = 1;
            alarm_set_to = 0;
        }
        else {
            /* notify on timeout but not on setting new alarm */
            notify = (rc != 0);
        }

        if (notify)
            current_alarm = 0;

        UNLOCK(alarm_lock);

        /* If we need to notify, do that here. Otherwise, back to the top of
           the loop*/
        if (notify) {
            /* possible racy write with read in Parrot_alarm_check */
            LOCK(alarm_lock);
            alarm_serial += 1;
            UNLOCK(alarm_lock);
            Parrot_thread_notify_threads(NULL);
        }
    }

    return NULL;
}

/*

=item C<int Parrot_alarm_check(UINTVAL* last_serial)>

Determine if any alarms have passed since last checked.

Possible design improvement: Alert only the thread that
set the alarm.

=cut

*/

PARROT_EXPORT
int
Parrot_alarm_check(ARGMOD(UINTVAL* last_serial))
{
    ASSERT_ARGS(Parrot_alarm_check)

#ifdef PARROT_HAS_THREADS
    if (*last_serial == alarm_serial)
        return 0;
    *last_serial = alarm_serial;
    return 1;
#else
    return (alarm_set_to <= Parrot_floatval_time());
#endif
}

/*

=item C<void Parrot_alarm_set(FLOATVAL when)>

Sets an alarm to trigger at time 'when'.

=cut

*/

PARROT_EXPORT
void
Parrot_alarm_set(FLOATVAL when)
{
    ASSERT_ARGS(Parrot_alarm_set)

    LOCK(alarm_lock);
    {
        if (current_alarm > 0 && current_alarm <= when) {
            /* there's already an active alarm for an earlier point in time */
            UNLOCK(alarm_lock);
            return;
        }

        alarm_set_to = when;
        COND_SIGNAL(sleep_cond);
    }
    UNLOCK(alarm_lock);
}

/*

=item C<void Parrot_alarm_wait_for_next_alarm(PARROT_INTERP)>

Sleep till the next alarm expires. This is a fallback function which is only
used if we try to sleep the interp without threads support. If we have
threading enabled, this function will not be used and the normal threads-based
mechanism will be used instead.

=cut

*/

PARROT_EXPORT
void
Parrot_alarm_wait_for_next_alarm(SHIM_INTERP)
{
    ASSERT_ARGS(Parrot_alarm_wait_for_next_alarm)
    const FLOATVAL now_time  = Parrot_floatval_time();
    const FLOATVAL time = alarm_set_to - now_time;

    if (time > 0)
        Parrot_usleep(time * 1000000);
}

/*

=back

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
