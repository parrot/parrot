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
void buffer_lives(struct Parrot_Interp *interpreter, Buffer *buffer);

#if ! DISABLE_GC_DEBUG
/* Set when walking the system stack */
extern int CONSERVATIVE_POINTER_CHASING;
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
