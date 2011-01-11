/*
 * Copyright (C) 2004-2010, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/generic/itimer.c

=head1 DESCRIPTION

itimer stuff

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/* HEADERIZER HFILE: none */

#ifdef PARROT_HAS_SETITIMER

/*

=item C<void start_sys_timer_ms(void *handle, int ms)>

Start a system timer with the passed value in milli seconds.

The handle is that, what new_sys_timer_ms() returned.
We could pass ITIMER_REAL in handle, but for now we ignore it
as we are just having one timer.

=cut

*/

void
start_sys_timer_ms(SHIM(void *handle), int ms)
{
    struct itimerval its;
    memset(&its, 0, sizeof (its));
    if (ms) {
        its.it_interval.tv_sec = its.it_value.tv_sec = ms/1000;
        its.it_interval.tv_usec = its.it_value.tv_usec = 1000 *(ms%1000);
    }
    setitimer(ITIMER_REAL, &its, NULL);
}

/*

=item C<void stop_sys_timer_ms(void *handle)>

Stop the given timer.

=cut

*/

void
stop_sys_timer_ms(void *handle)
{
    start_sys_timer_ms(handle, 0);
}

/*

=item C<int get_sys_timer_ms(void *handle)>

Return the programmed timer interval or 0 if none for the
given timer handle.

=cut

*/

int
get_sys_timer_ms(SHIM(void *handle))
{
    struct itimerval ots;
    getitimer(ITIMER_REAL, &ots);
    return ots.it_interval.tv_sec * 1000 + ots.it_interval.tv_usec/1000;
}

/*

=item C<void * new_sys_timer_ms(void)>

Create a new system timer with ~ms resolution.
The returned handle is passed to the other timer functions.

=cut

*/

PARROT_CAN_RETURN_NULL
void *
new_sys_timer_ms(void)
{
    return NULL;
}

#else
#endif

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
