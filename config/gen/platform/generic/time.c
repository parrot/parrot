/*
** Time stuff
*/

#include <time.h>
#include <sys/time.h>

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
    struct timeval t;
    gettimeofday(&t, NULL);
    return (FLOATVAL)t.tv_sec + ((FLOATVAL)t.tv_usec / 1000000.0);
}

/*
** Parrot_sleep()
*/

void
Parrot_sleep(unsigned int seconds)
{
    sleep(seconds);
}

/*
 * Parrot_gmtime_r()
 */

struct tm *
Parrot_gmtime_r(const time_t *t, struct tm *tm)
{
    return gmtime_r(t, tm);
}

/*
 * Parrot_localtime_r()
 */

struct tm *
Parrot_localtime_r(const time_t *t, struct tm *tm)
{
    return localtime_r(t, tm);
}

/*
 * Parrot_asctime_r()
 */

char*
Parrot_asctime_r(const struct tm *tm, char *buffer)
{
    return asctime_r(tm, buffer);
}
