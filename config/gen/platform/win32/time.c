/*
 * $Id$
 * Copyright (C) 2004-2006, Parrot Foundation.
 */

/*

=head1 NAME

config\gen\platform\win32\time.c

=head1 DESCRIPTION

Provides access to system time functions for Win32 platforms.

=head2 Functions

=over 4

=cut

*/

#include <time.h>

/*

=item C<INTVAL Parrot_intval_time(void)>

Returns the current time as an INTVAL

=cut

*/

INTVAL
Parrot_intval_time(void)
{
#if defined(_MSC_VER) && _MSC_VER >= 1400
#  ifdef _WIN64
    return (INTVAL)_time64(NULL);
#  else
    return _time32(NULL);
#  endif
#else
    return time(NULL);
#endif
}

/*

=item C<FLOATVAL Parrot_floatval_time(void)>

Returns the current time as a FLOATVAL.

=cut

*/

FLOATVAL
Parrot_floatval_time(void)
{
    SYSTEMTIME sysTime;
    /* 100 ns ticks since 1601-01-01 00:00:00 */
    FILETIME fileTime;
    LARGE_INTEGER i;

    GetSystemTime(&sysTime);
    SystemTimeToFileTime(&sysTime, &fileTime);
    /* Documented as the way to get a 64 bit from a FILETIME. */
    memcpy(&i, &fileTime, sizeof (LARGE_INTEGER));

    /* FILETIME uses 100ns steps since 1601-01-01 00:00:00 as epoch.
     * We'd like 1 second steps since 1970-01-01 00:00:00.
     * To get there, divide by 10,000,000 to get from 100ns steps to seconds.
     * Then subtract the seconds between 1601 and 1970, i.e. 11,644,473,600.
     */
    return (FLOATVAL)i.QuadPart / 10000000.0 - 11644473600.0;
}


/*

=item C<void Parrot_sleep(unsigned int seconds)>

Sleeps for C<seconds> seconds.

=cut

*/

void
Parrot_sleep(unsigned int seconds)
{
    Sleep(seconds * 1000);
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
    Sleep(microseconds / 1000);
}

/*

=item C<struct tm * Parrot_gmtime_r(const time_t *t, struct tm *tm)>

Returns a C<time_t> structure for the current Greenwich Mean Time.

=cut

*/

PARROT_EXPORT
struct tm *
Parrot_gmtime_r(const time_t *t, struct tm *tm)
{
    *tm = *gmtime(t);
    return tm;
}

/*

=item C<struct tm * Parrot_localtime_r(const time_t *t, struct tm *tm)>

Returns a C<time_t> struct for the current local time.

=cut

*/

PARROT_EXPORT
struct tm *
Parrot_localtime_r(const time_t *t, struct tm *tm)
{
    *tm = *localtime(t);
    return tm;
}

/*

=item C<char* Parrot_asctime_r(const struct tm *tm, char *buffer)>

Returns an ASCII representation of the C<struct tm>. Puts it in the
character array C<buffer>.

=cut

*/

PARROT_EXPORT
char*
Parrot_asctime_r(const struct tm *tm, char *buffer)
{
    static const char wday_name[7][4] =
        { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" };
    static const char mon_name[12][4] =
        { "Jan", "Feb", "Mar", "Apr", "May", "Jun",
          "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };

    sprintf(buffer, "%.3s %.3s%3d %.2d:%.2d:%.2d %d\n",
        wday_name[tm->tm_wday],
        mon_name[tm->tm_mon],
        tm->tm_mday,
        tm->tm_hour,
        tm->tm_min,
        tm->tm_sec,
        1900 + tm->tm_year);

    return buffer;
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
