/*
Copyright (C) 2010-2011, Parrot Foundation.

=head1 NAME

src/alarm.c - Implements a mechanism for alarms, setting a flag after a delay.

=cut

*/

#include "parrot/parrot.h"
#include "parrot/alarm.h"

/* Some per-process state */
static volatile UINTVAL  alarm_serial = 0;
static volatile FLOATVAL alarm_set_to = 0.0;

/* This file relies on POSIX. Probably need two other versions of it:
 *  one for Windows and one for platforms with no signals or threads. */

#ifdef _WIN32
#  include <time.h>
#else
#  include <sys/time.h>
#  include <signal.h>
#endif
#include <errno.h>

/* HEADERIZER HFILE: include/parrot/alarm.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void posix_alarm_set(FLOATVAL wait);
#define ASSERT_ARGS_posix_alarm_set __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=over 4

=item C<void Parrot_alarm_init(void)>

Initialize the alarm queue. This function should only be called from the initial
pthread. Any other pthreads should make sure to mask out SIGALRM.

=cut

*/

void
Parrot_alarm_init(void)
{
    ASSERT_ARGS(Parrot_alarm_init)
#ifdef _WIN32
    /* TODO: Implement on Windows */
#else
    struct sigaction sa;
    memset(&sa, 0, sizeof (struct sigaction));
    sa.sa_handler = Parrot_alarm_callback;
    sa.sa_flags   = SA_RESTART;

    if (sigaction(SIGALRM, &sa, 0) == -1) {
        perror("sigaction failed in Parrot_timers_init");
        exit(EXIT_FAILURE);
    }

    Parrot_alarm_unmask(NULL);
#endif
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
#ifdef _WIN32
    /* TODO: Implement on Windows */
#else
    const int MIL = 1000000;
    struct itimerval itmr;
    int sec, usec;

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
#endif
}

/*

=item C<void Parrot_alarm_mask(PARROT_INTERP)>

=item C<void Parrot_alarm_unmask(PARROT_INTERP)>

These block or unblock the signal for alarms. Any thread with signals
unblocked should avoid waiting on a lock or condition variable.

=cut

*/

void
Parrot_alarm_mask(SHIM_INTERP)
{
    ASSERT_ARGS(Parrot_alarm_mask)
#ifdef _WIN32
    /* TODO: Implement on Windows */
#else
    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGALRM);
    pthread_sigmask(SIG_BLOCK, &mask, 0);
#endif
}

void
Parrot_alarm_unmask(SHIM_INTERP)
{
    ASSERT_ARGS(Parrot_alarm_unmask)
#ifdef _WIN32
    /* TODO: Implement on Windows */
#else
    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGALRM);
    pthread_sigmask(SIG_UNBLOCK, &mask, 0);
#endif
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
#ifdef _WIN32
    /* TODO: Implement on Windows */
#else
    FLOATVAL now = Parrot_floatval_time();

    /* Better late than early */
    when += 0.0001;

    if (alarm_set_to > now && alarm_set_to < when)
        return;

    alarm_set_to = when;
    posix_alarm_set(when - now);
#endif
}

/*

=item C<void Parrot_alarm_now(void)>

Trigger an alarm wakeup.

=cut

*/

void
Parrot_alarm_now(void)
{
    ASSERT_ARGS(Parrot_alarm_now)
#ifdef _WIN32
    /* TODO: Implement on Windows */
#else
    kill(getpid(), SIGALRM);
#endif
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
