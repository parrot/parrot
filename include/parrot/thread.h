/* thread.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the thread primitives
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_THREAD_H_GUARD)
#define PARROT_THREAD_H_GUARD

#include "parrot/parrot.h"

#ifndef PARROT_SYNC_PRIMITIVES_DEFINED

#  define LOCK(m)
#  define UNLOCK(m)
#  define COND_WAIT(c, m)
#  define COND_TIMED_WAIT(c, m, t)
#  define COND_SIGNAL(c)
#  define COND_BROADCAST(c)

#  define MUTEX_INIT(m)
#  define MUTEX_DESTROY(m)

#  define COND_INIT(c)
#  define COND_DESTROY(c)

#  define Parrot_mutex int
#  define Parrot_cond int

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
