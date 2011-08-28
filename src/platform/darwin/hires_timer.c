/*
 * Copyright (C) 2009, Parrot Foundation.
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

#include <time.h>

#define TIME_IN_NS(n) ((n).tv_sec * 1000*1000*1000 + (n).tv_nsec)

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
    struct timeval  tv;
    gettimeofday(&tv, NULL);

    ts.tv_sec = tv.tv_sec;
    ts.tv_nsec = tv.tv_usec * 1000;

    return TIME_IN_NS(ts);
}

/*

=item C<UINTVAL Parrot_hires_get_tick_duration(void)>

Return the number of ns that each time unit from Parrot_hires_get_time represents.

=cut

*/

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
