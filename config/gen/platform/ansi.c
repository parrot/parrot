/*
** platform.c [ANSI-C-only version]
*/

#include <time.h>

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
    /* unable to provide this level of precision under ANSI-C, so just fall
       back to intval time for this. */
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_floatval_time not accurate");
    return (FLOATVAL)Parrot_intval_time();
}


/*
** Parrot_sleep()
*/

void
Parrot_sleep(unsigned int seconds)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_sleep not implemented");
    return;
}


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
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_dlopen not implemented");
    return NULL;
}


/*
** Parrot_dlerror()
*/

const char *
Parrot_dlerror(void)
{
    return "Parrot_dlerror not implemented";
}


/*
** Parrot_dlsym()
*/

void *
Parrot_dlsym(void *handle, const char *symbol)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_dlsym not implemented");
    return NULL;
}


/*
** Parrot_dlclose()
*/

int
Parrot_dlclose(void *handle)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_dlclose not implemented");
    return 0;
}


/*
** mem_alloc_executable() 
*/

void *
mem_alloc_executable(struct Parrot_Interp *interpreter, size_t size)
{
	return mem_sys_allocate_zeroed(size);
}


/*
** mem_realloc_executable()
*/

void *
mem_realloc_executable(struct Parrot_Interp *interpreter,
                       void* memblock, size_t size)
{
	return mem_sys_realloc(memblock, size);
}


/*
** mem_free_executable() 
*/

void
mem_free_executable(void *addr)
{
	mem_sys_free(addr);
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
