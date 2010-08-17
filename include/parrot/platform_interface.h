/*
 * Copyright (C) 2003-2010, Parrot Foundation.
 * $Id$
 */

#ifndef PARROT_PLATFORM_INTERFACE_H_GUARD
#define PARROT_PLATFORM_INTERFACE_H_GUARD
/*
** platform_interface.h
*/
#include "parrot/config.h"
#include "parrot/interpreter.h"

/*
** I/O:
*/


/*
** Math:
*/

extern int Parrot_signbit(double x);
#if NUMVAL_SIZE == 12
int Parrot_signbit_l(long double x);
#endif

/*
** Memory:
*/

void *Parrot_memalign(size_t align, size_t size);
void *Parrot_memalign_if_possible(size_t align, size_t size);
void Parrot_free_memalign(void *);

#if !defined(PARROT_HAS_SOME_MEMALIGN)
#  define Parrot_memalign_if_possible(a, s) malloc(s)
#else
#  define Parrot_memalign_if_possible(a, s) Parrot_memalign((a), (s))
#endif

#ifdef PARROT_HAS_EXEC_PROTECT
void *mem_alloc_executable(size_t);
void mem_free_executable(void *, size_t);
void *mem_realloc_executable(void *, size_t, size_t);
#else
#  define mem_alloc_executable mem_internal_allocate
#  define mem_free_executable(a, b) mem_internal_free(a)
#  define mem_realloc_executable(a, b, c) mem_internal_realloc((a), (c))
#endif

/*
** Time
*/

void Parrot_sleep(unsigned int seconds);
void Parrot_usleep(unsigned int microseconds);
INTVAL Parrot_intval_time(void);
FLOATVAL Parrot_floatval_time(void);

PARROT_EXPORT
struct tm * Parrot_gmtime_r(const time_t *, struct tm *);

PARROT_EXPORT
struct tm * Parrot_localtime_r(const time_t *, struct tm *);

PARROT_EXPORT
char* Parrot_asctime_r(const struct tm*, char *);

/*
 * Env
 */

void Parrot_setenv(PARROT_INTERP, STRING *name, STRING *value);
void Parrot_unsetenv(PARROT_INTERP, STRING *name);
char * Parrot_getenv(PARROT_INTERP, STRING *name);

/*
** Dynamic Loading:
*/

/*
 * The second argument to Parrot_dlopen below provides portable access to
 * non-default behavior of dynamic linkers.
 *
 * All flags will be ignored on platforms for which they are inapplicable.
 */

/* &gen_from_enum(dlopenflags.pasm) */
typedef enum Parrot_dlopen_enum {
    /*
     * Activates RTLD_GLOBAL on *NIX systems, making symbols from the newly
     * loaded library visible to other libraries; this is usually needed if
     * it will load libraries itself.
     */
    Parrot_dlopen_global_FLAG   = 0x01
} Parrot_dlopen_flags;
/* &end_gen */

void *Parrot_dlopen(const char *filename, Parrot_dlopen_flags flags);
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
 * high-resolution timer support
 */

UHUGEINTVAL Parrot_hires_get_time(void);
UINTVAL     Parrot_hires_get_tick_duration(void);


struct parrot_string_t;
INTVAL Parrot_Run_OS_Command(Interp*, struct parrot_string_t *);
INTVAL Parrot_Run_OS_Command_Argv(Interp*, struct PMC *);

#endif /* PARROT_PLATFORM_INTERFACE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
