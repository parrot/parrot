#include <time.h>

/*
** Parrot_intval_time()
*/

INTVAL
Parrot_intval_time(void)
{
    return time(NULL);
}

/*
** Parrot_floatval_time()
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
    memcpy(&i, &fileTime, sizeof(LARGE_INTEGER));

    return (FLOATVAL)i.QuadPart / 10000000.0;   /*1e7 */
}


/*
** Parrot_sleep()
*/

void
Parrot_sleep(unsigned int seconds)
{
    Sleep(seconds * 1000);
}

/*
 * Parrot_gmtime_r()
 */

struct tm *
Parrot_gmtime_r(const time_t *t, struct tm *tm)
{
    *tm = *gmtime(t);
    return tm;
}

/*
 * Parrot_localtime_r()
 */

struct tm *
Parrot_localtime_r(const time_t *t, struct tm *tm)
{
    *tm = *localtime(t);
    return tm;
}

/*
 * Parrot_asctime_r()
 */

char*
Parrot_asctime_r(const struct tm *tm, char *buffer)
{
    return strcpy(buffer, asctime(tm));
}
