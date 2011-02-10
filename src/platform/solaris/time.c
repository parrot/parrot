/*
 * Copyright (C) 2004-2010, Parrot Foundation.
 */

/*

=head1 NAME

time.c

=head1 DESCRIPTION

Parrot time-related functions.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#include <time.h>
#include <sys/time.h>
#include <unistd.h>

/* HEADERIZER HFILE: none */

/*

=item C<INTVAL Parrot_intval_time(void)>

Parrot wrapper around standard library C<time()> function, returning an INTVAL.

=cut

*/

INTVAL
Parrot_intval_time(void)
{
    return time(NULL);
}


/*

=item C<FLOATVAL Parrot_floatval_time(void)>

Parrot wrapper around standard library C<time()> function, returning a FLOATVAL.

=cut

*/

FLOATVAL
Parrot_floatval_time(void)
{
    struct timeval t;
    gettimeofday(&t, NULL);
    return (FLOATVAL)t.tv_sec + ((FLOATVAL)t.tv_usec / 1000000.0);
}

/*

=item C<void Parrot_sleep(unsigned int seconds)>

Parrot wrapper around standard library C<sleep()> function.

=cut

*/

void
Parrot_sleep(unsigned int seconds)
{
    sleep(seconds);
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
    usleep(microseconds);
}

/*

=item C<struct tm * Parrot_gmtime_r(const time_t *t, struct tm *tm)>

Parrot wrapper around standard library C<gmtime_r()> function.

=cut

*/

PARROT_EXPORT
struct tm *
Parrot_gmtime_r(const time_t *t, struct tm *tm)
{
    return gmtime_r(t, tm);
}

/*

=item C<struct tm * Parrot_localtime_r(const time_t *t, struct tm *tm)>

Parrot wrapper around standard library C<localtime_r()> function.

=cut

*/

PARROT_EXPORT
struct tm *
Parrot_localtime_r(const time_t *t, struct tm *tm)
{
    return localtime_r(t, tm);
}

/*

=item C<char* Parrot_asctime_r(const struct tm *tm, char *buffer)>

Parrot wrapper around standard library C<asctime_r()> function.

=cut

*/

PARROT_EXPORT
char*
Parrot_asctime_r(const struct tm *tm, char *buffer)
{
    return asctime_r(tm, buffer, 26);
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
