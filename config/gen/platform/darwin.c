/*
** platform.c [generic version]
*/

#include <time.h>
#include <sys/time.h>

#undef environ
#undef bool
#import <mach-o/dyld.h>

#include "parrot/parrot.h"

#define PARROT_DLOPEN_FLAGS RTLD_LAZY

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
** Parrot_setenv()
*/

#ifdef HAS_SETENV
void
Parrot_setenv(const char *name, const char *value)
{
    setenv(name, value, 1);
}
#else
/* putenv-based version might go here, but see perl5's util.c for
   warnings and workarounds.
*/
#endif

/*
** Parrot_dlopen()
*/

void *
Parrot_dlopen(const char *filename)
{
    int dyld_result;
    NSObjectFileImage ofile;
    NSModule handle = NULL;

    dyld_result = NSCreateObjectFileImageFromFile(filename, &ofile);
    handle = NSLinkModule(ofile, filename, TRUE);
    NSDestroyObjectFileImage(ofile);

    return handle;

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
Parrot_dlsym(void *handle, char *symbol)
{
    void *addr;

    if (NSIsSymbolNameDefined(symbol))
        addr = NSAddressOfSymbol(NSLookupAndBindSymbol(symbol));
    else
        addr = NULL;

    return addr;

}


/*
** Parrot_dlclose()
*/

int
Parrot_dlclose(void *handle)
{
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
