/*
 * $Id$
 * Copyright (C) 2007, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/ansi/time.c

=head1 DESCRIPTION

Time-related functions.

=head2 Functions

=over 4

=cut

*/

#include <time.h>

/*

=item C<INTVAL Parrot_intval_time(void)>

=cut

*/

INTVAL
Parrot_intval_time(void)
{
    return time(NULL);
}


/*

=item C<FLOATVAL Parrot_floatval_time(void)>

=cut

*/

FLOATVAL
Parrot_floatval_time(void)
{
    /* unable to provide this level of precision under ANSI-C, so just fall
       back to intval time for this. */
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_floatval_time not accurate");
    return (FLOATVAL)Parrot_intval_time();
}


/*

=item C<void Parrot_sleep(unsigned int seconds)>

Sleep for at least the specified number of seconds.

=cut

*/

void
Parrot_sleep(unsigned int seconds)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_sleep not implemented");
    return;
}

/*

=item C<void Parrot_usleep(unsigned int microseconds)>

Sleep for at least the specified number of microseconds (millionths of a
second).

=cut

*/

void
Parrot_usleep(unsigned int microseconds)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_usleep not implemented");
    return;
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
