/*
 * POSIX threading stuff
 */

#ifdef PARROT_HAS_HEADER_PTHREAD
#  include "parrot/thr_pthread.h"
#endif

#ifdef PARROT_HAS_HEADER_UNISTD
#  include <unistd.h>
#  ifdef _POSIX_PRIORITY_SCHEDULING
#    define YIELD sched_yield()
#  endif
#endif
