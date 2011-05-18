/*
 * Copyright (C) 2009, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/win32/hires_timer.c

=head1 DESCRIPTION

High-resolution timer support for win32

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#include <windows.h>

/* HEADERIZER HFILE: none */

/*

=item C<UHUGEINTVAL Parrot_hires_get_time(void)>

Return a high-resolution number representing how long Parrot has been running.

=cut

*/

UHUGEINTVAL
Parrot_hires_get_time(void)
{
    LARGE_INTEGER ticks;
    QueryPerformanceCounter(&ticks);
    return (UHUGEINTVAL) ticks.QuadPart;
}

/*

=item C<UINTVAL Parrot_hires_get_tick_duration(void)>

Return the number of nanoseconds that each time unit from Parrot_hires_get_time represents.

=cut

*/

UINTVAL
Parrot_hires_get_tick_duration(void)
{
    LARGE_INTEGER ticks;
    /* QueryPerformanceCounter returns ticks per second, so divide 1 billion by
     * that to find the length of each tick */
    QueryPerformanceFrequency(&ticks);
    return (UINTVAL) (1000*1000*1000 / ticks.QuadPart);
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
