/*
** platform.c [generic version]
*/

#include <time.h>
#include <sys/time.h>

#include "parrot/parrot.h"

#ifdef HAS_HEADER_DLFCN
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
#ifdef HAS_SETENV
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
#ifdef HAS_UNSETENV
    unsetenv(name);
#else 
    Parrot_setenv(name, "");
#endif 
}

char *
Parrot_getenv(const char *name)
{
    return getenv(name);
}

/*
** Parrot_dlopen()
*/

void *
Parrot_dlopen(const char *filename)
{
#ifdef HAS_HEADER_DLFCN
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
#ifdef HAS_HEADER_DLFCN
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
#ifdef HAS_HEADER_DLFCN
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
#ifdef HAS_HEADER_DLFCN
    return dlclose(handle);
#else
    return -1;
#endif
}

/*
 * memalign related stuff
 */

#if defined(HAS_POSIX_MEMALIGN)
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

#elif defined(HAS_MEMALIGN)

#if defined(HAS_HEADER_MALLOC)
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
#ifdef HAS_HEADER_SIGNAL
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
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
