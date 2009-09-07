/*
 * $Id$
 * Copyright (C) 2009, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/generic/hires_timer.c

=head1 DESCRIPTION

High-resolution timer support

=head2 Functions

=over 4

=cut

*/

#include <time.h>

#define TIME_IN_NS(n) ((n).tv_sec * 1000*1000*1000 + (n).tv_nsec)

/*

=item C<UHUGEINTVAL Parrot_hires_get_time()>

Return a high-resolution number representing how long Parrot has been running.

=cut

*/

UHUGEINTVAL Parrot_hires_get_time()
{
    struct timespec ts;
    clock_gettime(CLOCK_BEST, &ts);
    return TIME_IN_NS(ts);
}

/*

=item C<UINTVAL Parrot_hires_get_tick_duration()>

Return the number of ns that each time unit from Parrot_hires_get_time represents.

=cut

*/

UINTVAL Parrot_hires_get_tick_duration()
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
 * vim: expandtab shiftwidth=4:
 */
