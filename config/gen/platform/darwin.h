/*
** platform.h [darwin version]
*/

#ifdef PARROT_HAS_HEADER_PTHREAD
#  include <pthread.h>
#  define PARROT_SYNC_PRIMITIVES_DEFINED
#  define LOCK(m) pthread_mutex_lock(&m)
#  define UNLOCK(m) pthread_mutex_unlock(&m)
#  define COND_WAIT(c,m) pthread_cond_wait(&c, &m)
#  define COND_SIGNAL(c) pthread_cond_signal(&c)
#  define COND_BROADCAST(c) pthread_cond_broadcast(&c)
typedef pthread_mutex_t Parrot_mutex;
typedef pthread_cond_t Parrot_cond;
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
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
