/*
** platform.c [generic version]
*/

#include <time.h>
#include <sys/time.h>

#include "parrot/parrot.h"

#ifdef PARROT_HAS_HEADER_DLFCN
#  include <dlfcn.h>
#endif

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
#ifdef PARROT_HAS_HEADER_DLFCN
    return dlopen(filename, PARROT_DLOPEN_FLAGS);
#else
    return 0;
#endif
}


/*
** Parrot_dlerror()
*/

const char *
Parrot_dlerror(void)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    return dlerror();
#else
    return 0;
#endif
}


/*
** Parrot_dlsym()
*/

void *
Parrot_dlsym(void *handle, const char *symbol)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    return dlsym(handle, symbol);
#else
    return 0;
#endif
}


/*
** Parrot_dlclose()
*/

int
Parrot_dlclose(void *handle)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    return dlclose(handle);
#else
    return -1;
#endif
}

/*
 * memalign related stuff
 */

#if defined(PARROT_HAS_POSIX_MEMALIGN)
#include <stdlib.h>

void *
Parrot_memalign(size_t align, size_t size)
{
    void *p;
    int i = posix_memalign(&p, align, size);
    return i == 0 ? p : NULL;
}

void *
Parrot_memalign_if_possible(size_t align, size_t size)
{
    void *p;
    int i = posix_memalign(&p, align, size);
    return i == 0 ? p : NULL;
}

#elif defined(PARROT_HAS_MEMALIGN)

#if defined(PARROT_HAS_HEADER_MALLOC)
#include <malloc.h>
#else
#include <stdlib.h>
#endif

void *
Parrot_memalign(size_t align, size_t size)
{
    return memalign(align, size);
}

void *
Parrot_memalign_if_possible(size_t align, size_t size)
{
    return memalign(align, size);
}

#endif

void
Parrot_free_memalign(void *p)
{
    free(p);
}


/*
 * signal handling
 */
#ifdef PARROT_HAS_HEADER_SIGNAL
#include <signal.h>
/*
 * for now use signal based functions
 */

Parrot_sighandler_t
Parrot_set_sighandler(int signum, Parrot_sighandler_t handler)
{
    return signal(signum, handler);
}
#endif

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

#ifdef PARROT_HAS_EXEC_PROTECT
/*
 * Allocate executable memory
 * Round up to page size because the whole page will be marked as
 *   executable
 */
void *
mem_alloc_executable(size_t size)
{
    void *p;
    size_t pagesize = sysconf(_SC_PAGESIZE);
    size = (size + pagesize - 1) & ~(pagesize-1);
    if (posix_memalign(&p, pagesize, size))
        return NULL;
    mprotect(p, size, PROT_READ|PROT_WRITE|PROT_EXEC);
    return p;
}

void
mem_free_executable(void *p)
{
    free(p);
}

/*
 * Reallocate executable memory
 * Round up to page size because the whole page will be marked as
 *   executable
 * The intermediate temp is required because we don't know the old size
 */
void *
mem_realloc_executable(void* old, size_t newsize)
{
    void *temp;
    void *new;
    size_t pagesize = sysconf(_SC_PAGESIZE);
    size_t roundup;
    temp = realloc(old, newsize);
    if (temp == NULL)
        return NULL;
    free(old);
    roundup = (newsize + pagesize - 1) & ~(pagesize-1);
    if (posix_memalign(&new, pagesize, roundup))
        new = NULL;
    if (new) {
        mprotect(new, roundup, PROT_READ|PROT_WRITE|PROT_EXEC);
        memcpy(new, temp, newsize);
    }
    free(temp);
    return new;
}
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
