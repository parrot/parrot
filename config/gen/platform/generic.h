/*
** platform.h [generic version]
*/


/*
** I/O:
*/

#define DEFAULT_OPEN_MODE S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
#ifndef S_ISREG
#   define S_ISREG(m) ((m & S_IFMT) == S_IFREG)
#endif

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

#define PARROT_DLOPEN_FLAGS RTLD_LAZY

void *Parrot_dlopen(const char *filename);
const char *Parrot_dlerror(void);
void *Parrot_dlsym(void *handle, const char *symbol);
int Parrot_dlclose(void *handle);

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
