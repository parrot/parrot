/*
 * $Id$
 * Copyright (C) 2004-2006, The Perl Foundation.
 */

/*

=head1 NAME

time.c

=head1 DESCRIPTION

Time stuff

=head2 Functions

=over 4

=cut

*/

#include <time.h>
#include <sys/time.h>

/*

=item C<INTVAL
Parrot_intval_time(void)>

TODO: Not yet documented!!!

=cut

*/

INTVAL
Parrot_intval_time(void)
{
    return time(NULL);
}


/*

=item C<FLOATVAL
Parrot_floatval_time(void)>

TODO: Not yet documented!!!

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

=item C<void
Parrot_sleep(unsigned int seconds)>

TODO: Not yet documented!!!

=cut

*/

void
Parrot_sleep(unsigned int seconds)
{
    sleep(seconds);
}

/*

=item C<struct tm *
Parrot_gmtime_r(const time_t *t, struct tm *tm)>

TODO: Not yet documented!!!

=cut

*/

struct tm *
Parrot_gmtime_r(const time_t *t, struct tm *tm)
{
    return gmtime_r(t, tm);
}

/*

=item C<struct tm *
Parrot_localtime_r(const time_t *t, struct tm *tm)>

TODO: Not yet documented!!!

=cut

*/

struct tm *
Parrot_localtime_r(const time_t *t, struct tm *tm)
{
    return localtime_r(t, tm);
}

/*

=item C<char*
Parrot_asctime_r(const struct tm *tm, char *buffer)>

TODO: Not yet documented!!!

=cut

*/

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
 * vim: expandtab shiftwidth=4:
 */
