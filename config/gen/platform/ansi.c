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
    fprintf(stderr, "[ANSI] Parrot_floatval_time not accurate!\n");
    return (FLOATVAL)Parrot_intval_time();
}


/*
** Parrot_sleep()
*/

void
Parrot_sleep(unsigned int seconds)
{
    fprintf(stderr, "[ANSI] Parrot_sleep not implemented!\n");
    return;
}


/*
** Parrot_setenv()
*/
void
Parrot_setenv(const char *name, const char *value)
{
    fprintf(stderr, "[ANSI] Parrot_setenv not implemented!\n");
    return;
}


/*
** Parrot_dlopen()
*/

void *
Parrot_dlopen(const char *filename)
{
    fprintf(stderr, "[ANSI] Parrot_dlopen not implemented!\n");
    return NULL;
}


/*
** Parrot_dlerror()
*/

const char *
Parrot_dlerror(void)
{
    return "[ANSI] Parrot_dlerror not implemented!\n";
}


/*
** Parrot_dlsym()
*/

void *
Parrot_dlsym(void *handle, const char *symbol)
{
    fprintf(stderr, "[ANSI] Parrot_dlsym not implemented!\n");
    return NULL;
}


/*
** Parrot_dlclose()
*/

int
Parrot_dlclose(void *handle)
{
    fprintf(stderr, "[ANSI] Parrot_dlclose not implemented!\n");
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
