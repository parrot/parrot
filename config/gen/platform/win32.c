/*
** platform.c [win32 version]
**
*/

#include <time.h>
#include <windows.h>
#include "parrot/parrot.h"

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
** Parrot_setenv()
*/

void
Parrot_setenv(const char *name, const char *value)
{
    SetEnvironmentVariable(name, value);
}


char *
Parrot_getenv(const char *name)
{
    return getenv(name);
}
void
Parrot_unsetenv(const char *name)
{
    SetEnvironmentVariable(name, NULL);
}
/*
** Parrot_dlopen()
*/

void *
Parrot_dlopen(const char *filename)
{
    return LoadLibrary(filename);
}


/*
** Parrot_dlerror()
*/

const char *
Parrot_dlerror(void)
{
    return NULL;
}


/*
** Parrot_dlsym()
*/

void *
Parrot_dlsym(void *handle, const char *symbol)
{
    return (void *)(ptrcast_t)GetProcAddress(handle, symbol);
}


/*
** Parrot_dlclose()
*/

int
Parrot_dlclose(void *handle)
{
    return FreeLibrary(handle)? 0: 1;
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
