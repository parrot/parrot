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

void
Parrot_setenv(const char *name, const char *value)
{
#ifdef PARROT_HAS_SETENV
    setenv(name, value, 1);
#else
    int name_len = strlen(name);
    int val_len = strlen(value);

    char *envs = malloc(name_len + 1 + val_len + 1);
    if (envs == NULL)
        return;

    /* Save a bit of time, by using the fact we already have the
       lengths, avoiding strcat */
    strcpy(envs, name);
    strcpy(envs + name_len, "=");
    strcpy(envs + name_len + 1, value);

    putenv(envs);

    /* The buffer is intentionally not freed! */
#endif
}

void
Parrot_unsetenv(const char *name)
{
#ifdef PARROT_HAS_UNSETENV
    unsetenv(name);
#else
    Parrot_setenv(name, "");
#endif
}

char *
Parrot_getenv(const char *name, int *free_it)
{
    *free_it = 0;
    return getenv(name);
}

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
 * itimer stuff
 */

#ifdef PARROT_HAS_SETITIMER

/*
 * Start a system timer with the passed value in milli seconds.
 *
 * The handle is that, what new_sys_timer_ms() returned.
 * We could pass ITIMER_REAL in handle, but for now we ignore it
 * as we are just having one timer.
 */

void
start_sys_timer_ms(void *handle, int ms)
{
    struct itimerval its;
    memset(&its, 0, sizeof(its));
    if (ms) {
	its.it_interval.tv_sec = its.it_value.tv_sec = ms/1000;
	its.it_interval.tv_usec = its.it_value.tv_usec = 1000 *(ms%1000);
    }
    setitimer(ITIMER_REAL, &its, NULL);
}

/* Stop the given timer. */
void
stop_sys_timer_ms(void *handle)
{
    start_sys_timer_ms(handle, 0);
}

/*
 * Return the programmed timer interval or 0 if none for the
 * given timer handle.
 */

int
get_sys_timer_ms(void *handle)
{
    struct itimerval ots;
    getitimer(ITIMER_REAL, &ots);
    return ots.it_interval.tv_sec * 1000 + ots.it_interval.tv_usec/1000;
}

/*
 * Create a new system timer with ~ms resolution.
 * The returned handle is passed to the other timer functions.
 */
void *
new_sys_timer_ms()
{
    return 0;
}

#else
#endif
/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
