#if !defined(PARROT_PLATFORM_H_GUARD)
#define PARROT_PLATFORM_H_GUARD

/*
** platform.h [generic version]
*/


/*
** I/O:
*/

#define DEFAULT_OPEN_MODE S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
#ifndef S_ISREG
#  define S_ISREG(m) ((m & S_IFMT) == S_IFREG)
#endif

/*
** Miscellaneous:
*/

#include <i386/exec.h>

#ifdef NATIVE_EXEC_ELF
#define PARROT_OPENBSD_ELF
#endif

/*
** Dynamic Loading:
*/

#define PARROT_DLOPEN_FLAGS RTLD_LAZY

/*
 * signal handling
 */

#if defined(PARROT_HAS_HEADER_SIGNAL) && defined(PARROT_HAS_HEADER_SYSTYPES)
#  include <signal.h>
#  include <sys/types.h>
#  define dumpcore() kill(0, SIGQUIT)
#endif

#ifdef PARROT_HAS_HEADER_SIGNAL
#  undef Parrot_set_sighandler
#  ifdef PARROT_HAS___SIGHANDLER_T
    typedef __sighandler_t Parrot_sighandler_t;
#  else
    typedef void (*Parrot_sighandler_t) (int);
#  endif

    Parrot_sighandler_t Parrot_set_sighandler(int s, Parrot_sighandler_t f);
#endif

#ifdef PARROT_HAS_HEADER_PTHREAD
#  include <pthread.h>
#  define PARROT_SYNC_PRIMITIVES_DEFINED
#  define LOCK(x) pthread_mutex_lock(&x)
#  define UNLOCK(x) pthread_mutex_unlock(&x)
#  define COND_WAIT(x,y) pthread_cond_wait(&x, &y)
#  define COND_SIGNAL(x,y) pthread_cond_signal(&x, &y)
#  define COND_BROADCAST(x,y) pthread_cond_broadcast(&x)
   typedef pthread_mutex_t Parrot_mutex;
   typedef pthread_cond_t Parrot_cond;
#endif

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
