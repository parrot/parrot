/*
 * Copyright (C) 2003-2010, Parrot Foundation.
 */

#ifndef PARROT_PLATFORM_INTERFACE_H_GUARD
#define PARROT_PLATFORM_INTERFACE_H_GUARD
/*
** platform_interface.h
*/
#include "parrot/config.h"
#include "parrot/interpreter.h"

#include <math.h>

#if PARROT_HAS_HEADER_LIMITS
#  include <limits.h>
#endif

#ifdef _MSC_VER

#  ifndef LLONG_MAX
#    define LLONG_MAX _I64_MAX
#  endif
#  ifndef LLONG_MIN
#    define LLONG_MIN _I64_MIN
#  endif

#  if _MSC_VER >= 1400
#    define strdup _strdup
#  endif

/* These disable certain Level 4 Warnings */
#  pragma warning(disable: 4100) /* disables 'unreferenced formal parameter'
                                  * warnings */
#  pragma warning(disable: 4115) /* disables 'named type definition in
                                  * parentheses' warnings triggered in VC98
                                  * include files */
#  pragma warning(disable: 4505) /* disables 'unreferenced local function has
                                  * been removed' warnings in header files */

#endif /* _MSC_VER */

/*
 * init
 */

void Parrot_platform_init_code(void);

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

/*
** Process ID
*/

PARROT_EXPORT
UINTVAL Parrot_getpid(void);

/*
** Time
*/

PARROT_EXPORT
void Parrot_sleep(unsigned int seconds);

PARROT_EXPORT
void Parrot_usleep(unsigned int microseconds);

PARROT_EXPORT
INTVAL Parrot_intval_time(void);

PARROT_EXPORT
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

PARROT_EXPORT
void Parrot_setenv(PARROT_INTERP, STRING *name, STRING *value);

PARROT_EXPORT
void Parrot_unsetenv(PARROT_INTERP, STRING *name);

PARROT_EXPORT
STRING * Parrot_getenv(PARROT_INTERP, STRING *name);

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
 * encoding
 */
void Parrot_init_platform_encoding(PARROT_INTERP);
size_t Parrot_str_platform_strlen(PARROT_INTERP, const char *s);

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

PARROT_EXPORT
UHUGEINTVAL Parrot_hires_get_time(void);

PARROT_EXPORT
UINTVAL     Parrot_hires_get_tick_duration(void);


struct parrot_string_t;

PARROT_EXPORT
INTVAL Parrot_Run_OS_Command(Interp*, struct parrot_string_t *);

PARROT_EXPORT
INTVAL Parrot_Run_OS_Command_Argv(Interp*, struct PMC *);

/*
 * user information
 */

PARROT_EXPORT
UINTVAL Parrot_get_user_id(void);

/*
 * system memory
 */

PARROT_EXPORT
size_t Parrot_sysmem_amount(Interp*);

#endif /* PARROT_PLATFORM_INTERFACE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
