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
    Parrot_warn_c(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_floatval_time not accurate");
    return (FLOATVAL)Parrot_intval_time();
}


/*
** Parrot_sleep()
*/

void
Parrot_sleep(unsigned int seconds)
{
    Parrot_warn_c(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_sleep not implemented");
    return;
}


/*
** Parrot_setenv()
*/
void
Parrot_setenv(const char *name, const char *value)
{
    Parrot_warn_c(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_setenv not implemented");
    return;
}


/*
** Parrot_dlopen()
*/

void *
Parrot_dlopen(const char *filename)
{
    Parrot_warn_c(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_dlopen not implemented");
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
    Parrot_warn_c(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_dlsym not implemented");
    return NULL;
}


/*
** Parrot_dlclose()
*/

int
Parrot_dlclose(void *handle)
{
    Parrot_warn_c(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_dlclose not implemented");
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
