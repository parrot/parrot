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

#ifdef _WIN32
#  define PIO_INVALID_HANDLE ((void *)-1)
typedef void *PIOHANDLE;
typedef HUGEINTVAL PIOOFF_T;
#else
#  define PIO_INVALID_HANDLE -1
typedef INTVAL PIOHANDLE;
typedef off_t PIOOFF_T;
#endif

PIOHANDLE Parrot_io_std_os_handle(PARROT_INTERP, INTVAL fileno);
PIOHANDLE Parrot_io_open(PARROT_INTERP, ARGIN(STRING *path), INTVAL flags);
PIOHANDLE Parrot_io_dup(PARROT_INTERP, PIOHANDLE handle);
INTVAL Parrot_io_close(PARROT_INTERP, PIOHANDLE handle);
INTVAL Parrot_io_close_piohandle(PARROT_INTERP, PIOHANDLE handle);
INTVAL Parrot_io_waitpid(PARROT_INTERP, INTVAL pid);
INTVAL Parrot_io_is_tty(PARROT_INTERP, PIOHANDLE fd);
INTVAL Parrot_io_getblksize(PIOHANDLE fd);
INTVAL Parrot_io_flush(PARROT_INTERP, PIOHANDLE os_handle);
size_t Parrot_io_read(PARROT_INTERP, PIOHANDLE os_handle, ARGMOD(char *buf), size_t len);
size_t Parrot_io_write(PARROT_INTERP, PIOHANDLE os_handle, ARGIN(const char *buf), size_t len);
PIOOFF_T Parrot_io_seek(PARROT_INTERP, PIOHANDLE os_handle, PIOOFF_T offset, INTVAL whence);
PIOOFF_T Parrot_io_tell(PARROT_INTERP, PIOHANDLE os_handle);
PIOHANDLE Parrot_io_open_pipe(PARROT_INTERP, ARGIN(STRING *command), INTVAL flags,
        ARGOUT(INTVAL *pid_out));
INTVAL Parrot_io_pipe(PARROT_INTERP, ARGMOD(PIOHANDLE *reader), ARGMOD(PIOHANDLE *writer));

/*
 * Socket
 */

PMC *Parrot_io_sockaddr_in(PARROT_INTERP, ARGIN(STRING *addr), INTVAL port);
INTVAL Parrot_io_socket(PARROT_INTERP, ARGIN(PMC *s), int fam, int type, int proto);
INTVAL Parrot_io_connect(PARROT_INTERP, ARGMOD(PMC *socket), ARGIN(PMC *r));
INTVAL Parrot_io_bind(PARROT_INTERP, ARGMOD(PMC *socket), ARGMOD(PMC *sockaddr));
INTVAL Parrot_io_listen(SHIM_INTERP, ARGMOD(PMC *socket), INTVAL sec);
PMC *Parrot_io_accept(PARROT_INTERP, ARGMOD(PMC *socket));
INTVAL Parrot_io_send(SHIM_INTERP, ARGMOD(PMC *socket), ARGMOD(STRING *s));
INTVAL Parrot_io_recv(PARROT_INTERP, ARGMOD(PMC *socket), ARGOUT(STRING **s));
INTVAL Parrot_io_poll(SHIM_INTERP, ARGMOD(PMC *socket), int which, int sec, int usec);

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
** Processes
*/

PARROT_EXPORT
INTVAL Parrot_Run_OS_Command(Interp*, STRING *);

PARROT_EXPORT
INTVAL Parrot_Run_OS_Command_Argv(Interp*, PMC *);

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
