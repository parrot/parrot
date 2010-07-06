/*
Copyright (C) 2010, Parrot Foundation.
$Id$

=head1 NAME

src/alarm.c - Implements a mechanism for alarms, setting a flag after a delay.

=cut

*/

#include "parrot/parrot.h"
#include "parrot/alarm.h"

/* Some per-process state */
static volatile UINTVAL  alarm_serial = 0;
static volatile UINTVAL  alarm_init   = 0;
static volatile FLOATVAL alarm_set_to = 0.0;

/* This file relies on POSIX. Probably need two other versions of it:
 *  one for Windows and one for platforms with no signals or threads. */

#include <sys/time.h>
#include <signal.h>
#include <errno.h>

/* HEADERIZER HFILE: include/parrot/alarm.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void posix_alarm_init(void);
static void posix_alarm_set(FLOATVAL wait);
#define ASSERT_ARGS_posix_alarm_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_posix_alarm_set __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=over 4

=item C<static void posix_alarm_init(void)>

Initialize the alarm queue. This function should only be called from the initial
pthread. Any other pthreads should make sure to mask out SIGALRM.

=cut

*/

void Parrot_alarm_callback(SHIM(int sig_number));

static void
posix_alarm_init(void)
{
    ASSERT_ARGS(posix_alarm_init)

    struct sigaction sa;
    sa.sa_handler = Parrot_alarm_callback;
    sa.sa_flags   = SA_RESTART;

    if (sigaction(SIGALRM, &sa, 0) == -1) {
        perror("sigaction failed in Parrot_timers_init");
        exit(EXIT_FAILURE);
    }

    alarm_init = 1;
}

/*

=item C<static void posix_alarm_set(FLOATVAL wait)>

A helper function to set an alarm.

=cut

*/

static void
posix_alarm_set(FLOATVAL wait)
{
    ASSERT_ARGS(posix_alarm_set)

    const int MIL = 1000000;
    struct itimerval itmr;
    int sec, usec;

    if (!alarm_init)
        posix_alarm_init();

    sec  = (int) wait;
    usec = (int) ((wait - sec) * MIL);

    itmr.it_value.tv_sec     = sec;
    itmr.it_value.tv_usec    = usec;
    itmr.it_interval.tv_sec  = 0;
    itmr.it_interval.tv_usec = 0;

    if (setitimer(ITIMER_REAL, &itmr, 0) == -1) {
        if (errno == EINVAL) {
            Parrot_alarm_callback(SIGALRM);
        }
        else {
            perror("setitimer failed in set_posix_alarm");
            exit(EXIT_FAILURE);
        }
    }
}


/*

=item C<void Parrot_alarm_callback(int sig_number)>

Callback for SIGALRM. When this is called, a timer should be ready to fire.

=cut

*/

void
Parrot_alarm_callback(SHIM(int sig_number))
{
    ASSERT_ARGS(Parrot_alarm_callback)

    /* Not atomic; only one thread ever writes this value */
    alarm_serial += 1;
}

/*

=item C<int Parrot_alarm_check(UINTVAL* last_serial)>

Has any alarm triggered since we last checked?

Possible design improvement: Alert only the thread that
set the alarm.

=cut

*/

PARROT_EXPORT
int
Parrot_alarm_check(ARGMOD(UINTVAL* last_serial))
{
    ASSERT_ARGS(Parrot_alarm_check)

    if (*last_serial == alarm_serial) {
        return 0;
    }
    else {
        *last_serial = alarm_serial;
        return 1;
    }
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

    FLOATVAL now = Parrot_floatval_time();

    /* Better late than early */
    when += 0.0001;

    if (alarm_set_to > now && alarm_set_to < when)
        return;

    alarm_set_to = when;
    posix_alarm_set(when - now);
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
