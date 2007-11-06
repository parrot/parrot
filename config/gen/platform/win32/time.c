/*
 * $Id$
 * Copyright (C) 2004-2006, The Perl Foundation.
 */

/*

=head1 NAME

config\gen\platform\win32\time.c

=head1 DESCRIPTION

TODO

=head2 Functions

=over 4

=cut

*/

#include <time.h>

/*

=item C<INTVAL Parrot_intval_time(void)>

TODO: Not yet documented!!!

=cut

*/

INTVAL
Parrot_intval_time(void)
{
#if defined(_MSC_VER) && _MSC_VER >= 1400
#  if INTVAL_SIZE <= 4
    return _time32(NULL);
#  else
    return _time64(NULL);
#  endif
#else
    return time(NULL);
#endif
}

/*

=item C<FLOATVAL Parrot_floatval_time(void)>

TODO: Not yet documented!!!

=cut

*/

FLOATVAL
Parrot_floatval_time(void)
{
    SYSTEMTIME sysTime;
    FILETIME fileTime;          /* 100ns == 1 */
    LARGE_INTEGER i;

    GetSystemTime(&sysTime);
    SystemTimeToFileTime(&sysTime, &fileTime);
    /* Documented as the way to get a 64 bit from a FILETIME. */
    memcpy(&i, &fileTime, sizeof (LARGE_INTEGER));

    return (FLOATVAL)i.QuadPart / 10000000.0;   /*1e7 */
}


/*

=item C<void Parrot_sleep(unsigned int seconds)>

TODO: Not yet documented!!!

=cut

*/

void
Parrot_sleep(unsigned int seconds)
{
    Sleep(seconds * 1000);
}

/*

=item C<struct tm * Parrot_gmtime_r(const time_t *t, struct tm *tm)>

TODO: Not yet documented!!!

=cut

*/

struct tm *
Parrot_gmtime_r(const time_t *t, struct tm *tm)
{
    *tm = *gmtime(t);
    return tm;
}

/*

=item C<struct tm * Parrot_localtime_r(const time_t *t, struct tm *tm)>

TODO: Not yet documented!!!

=cut

*/

struct tm *
Parrot_localtime_r(const time_t *t, struct tm *tm)
{
    *tm = *localtime(t);
    return tm;
}

/*

=item C<char* Parrot_asctime_r(const struct tm *tm, char *buffer)>

TODO: Not yet documented!!!

=cut

*/

char*
Parrot_asctime_r(const struct tm *tm, char *buffer)
{
    return strcpy(buffer, asctime(tm));
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
