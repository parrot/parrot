#ifndef PLATFORM_INTERFACE_H_GUARD
#define PLATFORM_INTERFACE_H_GUARD
/*
** platform_interface.h
*/
#include "parrot/config.h"

/*
** I/O:
*/

/*
** Memory:
*/

struct Parrot_Interp;

void *Parrot_memalign(size_t align, size_t size);
void *Parrot_memalign_if_possible(size_t align, size_t size);
void Parrot_free_memalign(void *);
void *mem_alloc_executable(struct Parrot_Interp *interpreter, size_t);
void *mem_realloc_executable(void *, size_t);
void mem_free_executable(void *);

#if !defined(PARROT_HAS_MEMALIGN) && !defined(PARROT_HAS_POSIX_MEMALIGN)
#  define Parrot_memalign_if_possible(a, s) malloc(a)
#endif

/*
** Miscellaneous:
*/

void Parrot_sleep(unsigned int seconds);
INTVAL Parrot_intval_time(void);
FLOATVAL Parrot_floatval_time(void);
void Parrot_setenv(const char *name, const char *value);
void Parrot_unsetenv(const char *name);
/* free_it is set by the function to either 0 or 1; if set to 1,
   the return value of the function needs to be mem_sys_free()d after use */
char * Parrot_getenv(const char *name, int *free_it);

/*
** Dynamic Loading:
*/

void *Parrot_dlopen(const char *filename);
const char *Parrot_dlerror(void);
void *Parrot_dlsym(void *handle, const char *symbol);
int Parrot_dlclose(void *handle);

/*
 * signal handling
 */
#ifndef PARROT_HAS_HEADER_SIGNAL
#  define Parrot_set_sighandler(s, h)
#endif

/*
 * system timer
 */

#ifdef PARROT_HAS_SOME_SYS_TIMER

void * new_sys_timer_ms(void);
void start_sys_timer_ms(void *handle, int ms);
void stop_sys_timer_ms(void *handle);
int get_sys_timer_ms(void *handle);

#else

#  define new_sys_timer_ms() NULL
#  define start_sys_timer_ms(h, m)
#  define stop_sys_timer_ms(h)
#  define get_sys_timer_ms(h) 0

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
#endif
