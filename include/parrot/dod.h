/* dod.h 
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Handles dead object destruction of the various headers
 *  Data Structure and Algorithms:
 *     
 *  History:
 *     Initial version by Mike Lambert on 2002.05.27
 *  Notes:
 *  References:
 */
 
#if !defined(PARROT_DOD_H_GUARD)
#define PARROT_DOD_H_GUARD

#include <assert.h>
#include "parrot/parrot.h"

void Parrot_do_dod_run(struct Parrot_Interp *);
PMC *trace_system_stack(struct Parrot_Interp *, PMC *);

/* Functions needed for custom DOD routines */

PMC * mark_used(PMC *used_pmc, PMC *current_end_of_list);

#if GC_DEBUG
/* Set when walking the system stack */
extern int CONSERVATIVE_POINTER_CHASING; 
#endif

static void
buffer_lives(Buffer *buffer)
{
#if GC_DEBUG

    if (buffer->flags & BUFFER_on_free_list_FLAG) {
        /* If a live buffer is found on the free list, warn. Note that
         * this does NOT necessarily indicate the presence of a bug,
         * because the stack is not zeroed out when a new stack frame
         * is pushed, so old data on the stack might correctly point
         * to a dead buffer. If the conservative_pointer_chasing flag
         * is not set, this is not a possible explanation and the bug
         * is real.
         *
         * If it *is* a bug, you may want to read the notes in
         * get_free_buffer() in headers.c for tips on debugging using
         * gdb with this pointer and version number. */
#if ! GC_VERBOSE
        if (! CONSERVATIVE_POINTER_CHASING)
#endif
        fprintf(stderr, "GC Warning! Live buffer %p version " INTVAL_FMT " found on free list\n", buffer, buffer->version);

        assert(CONSERVATIVE_POINTER_CHASING);
    }
#endif    
    buffer->flags |= BUFFER_live_FLAG;
}


#endif /* PARROT_DOD_H */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
