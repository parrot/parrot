/* tsq.h
 *  Copyright: 2003, Yet Another Society
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Defines the thread-safe queue system
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_TSQ_H_GUARD)
#define PARROT_TSQ_H_GUARD

#include "parrot/config.h"
#include "parrot/thread.h"


typedef struct QUEUE_ENTRY QUEUE_ENTRY;
typedef struct QUEUE QUEUE;

struct QUEUE_ENTRY {
  volatile Buffer *entry;
  volatile INTVAL type;
  volatile QUEUE_ENTRY *next;
};

struct QUEUE {
  volatile QUEUE_ENTRY *head;
  volatile QUEUE_ENTRY *tail;
  volatile INTVAL queue_in_use;
  Parrot_mutex queue_mutex;
};

void Parrot_ins_queue_interrupt(QUEUE *queue, QUEUE_ENTRY *entry);

#endif /* PARROT_TSQ_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
