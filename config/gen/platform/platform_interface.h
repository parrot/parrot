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
** Math:
*/

int Parrot_signbit(double x);
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
#  define Parrot_memalign_if_possible(a, s) Parrot_memalign(a, s)
#endif

#ifdef PARROT_HAS_EXEC_PROTECT
void *mem_alloc_executable(size_t);
void mem_free_executable(void *);
void *mem_realloc_executable(void *, size_t);
#else
#  define mem_alloc_executable mem_sys_allocate
#  define mem_free_executable mem_sys_free
#  define mem_realloc_executable mem_sys_realloc
#endif

void* Parrot_memcpy_aligned(void*, void*, size_t);

#if defined(PARROT_HAS_I386_SSE)

typedef void* (*Parrot_memcpy_func_t)(void *dest, void *src, size_t);
extern Parrot_memcpy_func_t Parrot_memcpy_aligned_sse;

#  define Parrot_memcpy_aligned(d,s,l) Parrot_memcpy_aligned_sse(d,s,l)

#elif defined(PARROT_HAS_I386_MMX)

typedef void* (*Parrot_memcpy_func_t)(void *dest, void *src, size_t);
extern Parrot_memcpy_func_t Parrot_memcpy_aligned_mmx;

#  define Parrot_memcpy_aligned(d,s,l) Parrot_memcpy_aligned_mmx(d,s,l)

#else
#  define Parrot_memcpy_aligned(d,s,l) mem_sys_memcopy(d,s,l)
#endif

/*
** Time
*/

void Parrot_sleep(unsigned int seconds);
INTVAL Parrot_intval_time(void);
FLOATVAL Parrot_floatval_time(void);
struct tm * Parrot_gmtime_r(const time_t *, struct tm *);
struct tm * Parrot_localtime_r(const time_t *, struct tm *);
char* Parrot_asctime_r(const struct tm*, char *);

/*
 * Env
 */

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


struct parrot_string_t;
Interp;
INTVAL Parrot_Run_OS_Command(Interp*, struct parrot_string_t *);
void Parrot_Exec_OS_Command(Interp*, struct parrot_string_t *);

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
