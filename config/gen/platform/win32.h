/*
** platform.h [win32 version]
*/


/*
** I/O:
*/

#define DEFAULT_OPEN_MODE 0

#ifndef S_ISREG
#   define S_ISREG(m) ((m & S_IFMT) == S_IFREG)
#endif

/* These disable certain Level 4 Warnings */
#pragma warning( disable: 4100 )        /* disables 'unreferenced formal parameter' warnings */
#pragma warning( disable: 4115 )        /* disables 'named type definition in parentheses' warnings triggered in VC98 include files */

/*
** Miscellaneous:
*/

void Parrot_sleep(unsigned int seconds);
INTVAL Parrot_intval_time(void);
FLOATVAL Parrot_floatval_time(void);
void Parrot_setenv(const char *name, const char *value);


/*
** Dynamic Loading:
*/

void *Parrot_dlopen(const char *filename);
const char *Parrot_dlerror(void);
void *Parrot_dlsym(void *handle, const char *symbol);
int Parrot_dlclose(void *handle);


#include <windows.h>

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
