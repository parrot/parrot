/* tsq.c
 *  Copyright: 2003, Yet Another Society
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Thread-safe and interrupt safe queues
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

/* This code implements thread-safe and interrupt safe code, with the
   following caveats:

   Only mainline code may remove entries from the queue

   Mainline code may add entries to the queue

   Interrupt code may add entries to the queue

   Interrupt code may not interrupt other interrupt code (no nested
   interrupts) 

   Interrupt code, in this case, is a C-level signal handler, AST
   callbacks, interrupt handlers, or any code that may have been
   invoked by the system while our user-level program is in an
   inconsistent state.

   Basically if you're not allowed to allocate memory or call a
   thread routine, it's interrupt code.

   Entries are *always* added at the tail of the queue, and *always*
   removed from the head of the queue

   In the case where there's a native queue management system, we'll
   use that instead, as doing this portably is profoundly nasty. And
   if an OS provides atomic queue management, who are we to disagree?
   They probably use Secret Hardware Tricks (like the VAX's queue
   management instructions, which are emulated in PAL code on the
   Alphas)

   To make this all work we *MUST* disable any and all instruction
   reordering, caching, and other compiler trickery. The code must
   execute in the order it is written in, and all queue and entry
   members must be treated as volatile and thus not cached in
   registers. Yeah, it'll make the code slower, but that beats bad
   code, and bad code at this level will likely kill things really
   badly which would be bad.


   The order of operations for interrupt code:

   * Check queue in use flag. If false, just go do it since nothing's
     using the queue. If true, 


*/

#if defined(__GNUC__)
#if defined(__OPTIMIZE__)
#error "Can't compile this with optimizations of any sort"
#endif
#endif

/* Insert an entry to the passed in queue. Callable only from within
   interrupt code */
void Parrot_ins_queue_interrupt(QUEUE *queue, QUEUE_ENTRY *entry) {
  /* entry's next pointer is always NULL */
  entry->next = NULL;

  /* Is something using us? If not, just go do this */
  if (!queue->queue_in_use) {
    /* Is there a tail entry? */
    if (queue->tail) {
      entry->next = NULL;
      queue->tail->next = entry;
      queue->tail = entry;
    } else {
      /* If no tail, then no head. Empty queue */
      queue->head = entry;
      queue->tail = entry;
    }
  } else {
    /* This is the tricky bit. The queue is in use, which means
       something is mutating it. That means the queue header or
       entries could be in an inconsistent state. We need to tread
       really carefully here */
  }
  
}



/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
