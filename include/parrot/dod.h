/* dod.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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

enum {
    DOD_trace_stack_FLAG = 1 << 0,
    DOD_lazy_FLAG        = 1 << 1
};

void Parrot_do_dod_run(struct Parrot_Interp *, UINTVAL flags);
void trace_system_areas(struct Parrot_Interp *);
void trace_mem_block(struct Parrot_Interp *, size_t, size_t);

void free_unused_pobjects(struct Parrot_Interp *interpreter,
                    struct Small_Object_Pool *pool);

void used_cow(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool, int cleanup);
void clear_cow(struct Parrot_Interp *interpreter,
        struct Small_Object_Pool *pool, int cleanup);

/* mark a PObj live during DOD */

void pobject_lives(struct Parrot_Interp *interpreter, PObj *buffer);

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
