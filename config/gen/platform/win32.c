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

void
Parrot_platform_init_code(void)
{
 SetErrorMode(SEM_NOGPFAULTERRORBOX); 
}

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
Parrot_getenv(const char *name, int *free_it)
{
    DWORD size = GetEnvironmentVariable(name, NULL, 0);
    char *buffer;

    if (size == 0) {
        *free_it = 0;
        return NULL;
    } else
        *free_it = 1;
    buffer = mem_sys_allocate(size);
    GetEnvironmentVariable(name, buffer, size);

    return buffer;
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
 * Spawn a subprocess
 *
 */
INTVAL Parrot_Run_OS_Command(Parrot_Interp interpreter, STRING *command) {
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_Run_OS_Command not implemented");
    return 0;
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
