/*
** platform.h [darwin version]
*/

#ifdef PARROT_HAS_HEADER_PTHREAD
#  include "parrot/thr_pthread.h"
#endif



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
#  define dumpcore() raise(SIGQUIT)
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


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
