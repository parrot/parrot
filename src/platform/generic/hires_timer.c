/*
 * Copyright (C) 2009-2011, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/generic/hires_timer.c

=head1 DESCRIPTION

High-resolution timer support

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#ifdef PARROT_HAS_HEADER_UNISTD
#  include <unistd.h>
#endif

#include <time.h>

#define TIME_IN_NS(n) ((n).tv_sec * 1000*1000*1000 + (n).tv_nsec)

#ifndef CLOCK_BEST
#  if defined(CLOCK_PROCESS_CPUTIME_ID)
#    define CLOCK_BEST CLOCK_PROCESS_CPUTIME_ID
#  elif defined(CLOCK_PROF)
#    define CLOCK_BEST CLOCK_PROF
#  else
#    define CLOCK_BEST CLOCK_REALTIME
#  endif
#endif

/* HEADERIZER HFILE: none */

/*

=item C<UHUGEINTVAL Parrot_hires_get_time(void)>

Return a high-resolution number representing how long Parrot has been running.

=cut

*/

UHUGEINTVAL
Parrot_hires_get_time(void)
{
    struct timespec ts;
    #if _POSIX_TIMERS
    clock_gettime(CLOCK_BEST, &ts);
    #else
    struct timeval  tv;
    gettimeofday(&tv, NULL);

    ts.tv_sec = tv.tv_sec;
    ts.tv_nsec = tv.tv_usec * 1000;
    #endif
    return TIME_IN_NS(ts);
}

/*

=item C<UINTVAL Parrot_hires_get_tick_duration(void)>

Return the number of ns that each time unit from Parrot_hires_get_time represents.

=cut

*/

PARROT_CONST_FUNCTION
UINTVAL
Parrot_hires_get_tick_duration(void)
{
    return (UINTVAL) 1;
}




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
