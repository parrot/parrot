/*
** time.c
**
*/

#ifndef WIN32
#include <sys/time.h>
#endif

#include "parrot/parrot.h"


/*
** Parrot_intval_time()
*/

INTVAL Parrot_intval_time (void)
{
  return time(NULL);
}


/*
** Parrot_floatval_time()
*/

FLOATVAL Parrot_floatval_time (void)
{
#if WIN32
  SYSTEMTIME sysTime;
  FILETIME fileTime;  /* 100ns == 1 */
  LARGE_INTEGER i;

  GetSystemTime(&sysTime);
  SystemTimeToFileTime(&sysTime, &fileTime);
  /* Documented as the way to get a 64 bit from a FILETIME. */
  memcpy(&i, &fileTime, sizeof(LARGE_INTEGER));

  return (FLOATVAL)i.QuadPart / 10000000.0; /*1e7*/
#else
  struct timeval t;
  gettimeofday(&t, NULL);
  return (FLOATVAL)t.tv_sec + ((FLOATVAL)t.tv_usec / 1000000.0);
#endif
}

