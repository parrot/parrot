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

#include "parrot/parrot.h"

/* Macros for recursively blocking and unblocking DOD */
#define Parrot_block_DOD(interpreter) \
        (interpreter)->DOD_block_level++

#define Parrot_unblock_DOD(interpreter) \
        if ((interpreter)->DOD_block_level) \
            (interpreter)->DOD_block_level--

/* Macros for recursively blocking and unblocking GC */
#define Parrot_block_GC(interpreter) \
        (interpreter)->GC_block_level++

#define Parrot_unblock_GC(interpreter) \
        if ((interpreter)->GC_block_level) \
            (interpreter)->GC_block_level--

/* Macros for testing if the DOD and GC are blocked */
#define Parrot_is_blocked_DOD(interpreter) \
        ((interpreter)->DOD_block_level)

#define Parrot_is_blocked_GC(interpreter) \
        ((interpreter)->GC_block_level)

void Parrot_do_dod_run(struct Parrot_Interp *);
PMC *trace_system_stack(struct Parrot_Interp *, PMC *);

void free_unused_buffers(struct Parrot_Interp *interpreter,
                    struct Small_Object_Pool *pool, int cleanup);
void free_unused_PMCs(struct Parrot_Interp *interpreter);
void used_cow(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool, int cleanup);
void clear_cow(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool, int cleanup);

/* Functions needed for custom DOD routines */

PMC * mark_used(PMC *used_pmc, PMC *current_end_of_list);

#if ! DISABLE_GC_DEBUG
/* Set when walking the system stack */
extern int CONSERVATIVE_POINTER_CHASING;
#endif

#if DISABLE_GC_DEBUG
static void
buffer_lives(struct Parrot_Interp *interpreter, Buffer *buffer)
{
    UNUSED(interpreter);
    buffer->flags |= BUFFER_live_FLAG;
}
#else
static void
buffer_lives(struct Parrot_Interp *interpreter, Buffer *buffer)
{
    buffer->flags |= BUFFER_live_FLAG;
    if (! GC_DEBUG(interpreter)) return;

    if (buffer->flags & BUFFER_report_FLAG) {
        fprintf(stderr, "GC: buffer %p pointing to %p marked live\n",
                buffer, buffer->bufstart);
    }

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
#if ! DISABLE_GC_DEBUG
#    if ! GC_VERBOSE
        if (! CONSERVATIVE_POINTER_CHASING)
#    endif
#endif
        fprintf(stderr, "GC Warning! Live buffer %p version " INTVAL_FMT " found on free list\n", buffer, buffer->version);
    }
}
#endif

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
