/* thread.h
 *  Copyright: 2003 Yet Another Society
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
#define LOCK(x)
#define UNLOCK(x)
#define COND_WAIT(x, y)
#define COND_SIGNAL(x, y)
#define COND_BROADCAST(x, y)

typedef INTVAL Parrot_mutex;
typedef INTVAL Parrot_cond;
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
