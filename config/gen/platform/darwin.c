/*
** platform.c [generic version]
*/

#include <time.h>
#include <sys/time.h>

#undef environ
#undef bool
#import <mach-o/dyld.h>

#include <pthread.h>
#define PARROT_SYNC_PRIMITIVES_DEFINED
#define LOCK(x) pthread_mutex_lock(x)
#define UNLOCK(x) pthread_mutex_unlock(x)
#define COND_WAIT(x,y) pthread_cond_wait(x, y)
#define COND_SIGNAL(x,y) pthread_cond_signal(x, y)
#define COND_BROADCAST(x,y) pthread_cond_broadcast(x, y)
typedef pthread_mutex_t Parrot_mutex;
typedef pthread_cond_t Parrot_cond;

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

#define HAS_SETENV /* XXX need a test, this is never set */
#ifdef HAS_SETENV
void
Parrot_setenv(const char *name, const char *value)
{
    setenv(name, value, 1);
}
void
Parrot_unsetenv(const char *name)
{
    unsetenv(name);
}
char *
Parrot_getenv(const char *name)
{
    return getenv(name);
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
    if (NSObjectFileImageSuccess != dyld_result) {
        switch(dyld_result) {
        case NSObjectFileImageFailure:
            fprintf(stderr, "open result was Failure (%i)\n", dyld_result);
            break;
        case NSObjectFileImageInappropriateFile:
            fprintf(stderr, "open result was InappropriateFile (%i)\n", dyld_result);
            break;
        case NSObjectFileImageArch:
            fprintf(stderr, "open result was Arch (%i)\n", dyld_result);
            break;
        case NSObjectFileImageFormat:
            fprintf(stderr, "open result was Format (%i)\n", dyld_result);
            break;
        case NSObjectFileImageAccess:
            fprintf(stderr, "open result was Access (%i)\n", dyld_result);
            break;
        default:
            fprintf(stderr, "open result was unknown (%i)\n", dyld_result);
            break;
        }
        exit(1);
    }
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
Parrot_dlsym(void *handle, const char *symbol)
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
