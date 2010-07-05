/*
Copyright (C) 2010, Parrot Foundation.
$Id$

=head1 NAME

src/alarm.c - Implements a mechanism for alarms, setting a flag after a delay.

=cut

*/

#include "parrot/alarm_private.h"
#include "parrot/alarm.h"

/* Some per-process state */
static Parrot_alarm_queue* alarm_queue;
static volatile UINTVAL    alarm_serial;

/* This file relies on POSIX. Probably need two other versions of it:
 *  one for Windows and one for platforms with no signals or threads. */
#include <sys/time.h>
#include <signal.h>
#include <errno.h>

/* HEADERIZER HFILE: include/parrot/alarm.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void set_posix_alarm(FLOATVAL wait);
#define ASSERT_ARGS_set_posix_alarm __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*
=head1 Parrot_alarm_init()

Initialize the alarm queue. This function should only be called from the initial
pthread. Any other pthreads should make sure to mask out SIGALRM.

=cut
*/

void Parrot_alarm_callback(SHIM(int sig_number));

PARROT_EXPORT
void
Parrot_alarm_init(void)
{
    struct sigaction sa;
    sa.sa_handler = Parrot_alarm_callback;
    sa.sa_flags   = SA_RESTART;

    if(sigaction(SIGALRM, &sa, 0) == -1) {
        perror("sigaction failed in Parrot_timers_init");
        exit(EXIT_FAILURE);
    }

    alarm_serial = 1;
    alarm_queue  = NULL;
}

/*
=head1 Parrot_alarm_set(FLOATVAL when)

A helper function to set an alarm.

=cut
*/

static void
set_posix_alarm(FLOATVAL wait)
{
    const int MIL = 1000000;
    struct itimerval itmr;
    int sec, usec;

    sec  = (int) wait;
    usec = (int) ((wait - sec) * MIL);

    itmr.it_value.tv_sec     = sec;
    itmr.it_value.tv_usec    = usec;
    itmr.it_interval.tv_sec  = 0;
    itmr.it_interval.tv_usec = 0;

    if(setitimer(ITIMER_REAL, &itmr, 0) == -1) {
        perror("setitimer failed in set_posix_alarm");
        exit(EXIT_FAILURE);
    }
}


/*
=head1 Parrot_alarm_callback()

Callback for SIGALRM. When this is called, a timer should be ready to fire.

=cut
*/

void
Parrot_alarm_callback(SHIM(int sig_number))
{
    FLOATVAL now, wait;
    Parrot_alarm_queue* qp;

    /* Not atomic; only one thread ever writes this value */
    alarm_serial += 1;

    /* Find the first future item. */
    now = Parrot_floatval_time();
    while(alarm_queue != NULL && alarm_queue->when < now) {
        qp = alarm_queue->next;
        free(alarm_queue);
        alarm_queue = qp;
    }

    if(alarm_queue != NULL) {
        wait = alarm_queue->when - now;
        set_posix_alarm(wait);
    }
}

/*
=head1 Parrot_alarm_check(UINTVAL*)

Has any alarm triggered since we last checked?

Possible design improvement: Alert only the thread that
set the alarm.

=cut
*/

PARROT_EXPORT
int
Parrot_alarm_check(ARGMOD(UINTVAL* last_serial))
{
    if(*last_serial == alarm_serial) {
        return 0;
    } else {
        *last_serial = alarm_serial;
        return 1;
    }
}

/*
=head1 Parrot_alarm_set(FLOATVAL when)

Sets an alarm to trigger at time 'when'.

=cut
*/

PARROT_EXPORT
void
Parrot_alarm_set(FLOATVAL when) {
    Parrot_alarm_queue *new_alarm;
    Parrot_alarm_queue **qpp;
    FLOATVAL now;

    /* Better late than early */
    when += 0.0001;

    now = Parrot_floatval_time();

    new_alarm = (Parrot_alarm_queue*) malloc(sizeof(Parrot_alarm_queue));
    new_alarm->when = when;

    if(alarm_queue == NULL || when < alarm_queue->when) {
        new_alarm->next = alarm_queue;
        alarm_queue = new_alarm;
        set_posix_alarm(when - now);
        return;
    }

    qpp = &alarm_queue;
    while(*qpp != NULL && (*qpp)->when < when) {
        qpp = &(alarm_queue->next);
    }

    new_alarm->next = *qpp;
    *qpp = new_alarm;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
