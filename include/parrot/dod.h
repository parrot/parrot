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
        (interpreter)->arena_base->DOD_block_level++

#define Parrot_unblock_DOD(interpreter) \
        if ((interpreter)->arena_base->DOD_block_level) \
            (interpreter)->arena_base->DOD_block_level--

/* Macros for recursively blocking and unblocking GC */
#define Parrot_block_GC(interpreter) \
        (interpreter)->arena_base->GC_block_level++

#define Parrot_unblock_GC(interpreter) \
        if ((interpreter)->arena_base->GC_block_level) \
            (interpreter)->arena_base->GC_block_level--

/* Macros for testing if the DOD and GC are blocked */
#define Parrot_is_blocked_DOD(interpreter) \
        ((interpreter)->arena_base->DOD_block_level)

#define Parrot_is_blocked_GC(interpreter) \
        ((interpreter)->arena_base->GC_block_level)

enum {
    DOD_trace_stack_FLAG = 1 << 0,      /* trace system areads and stack */
    DOD_trace_normal     = 1 << 0,      /* the same */
    DOD_lazy_FLAG        = 1 << 1,      /* timely destruction run */
    DOD_finish_FLAG      = 1 << 2,      /* run async past sweep */
    DOD_no_trace_volatile_roots = 1 << 3  /* trace all but volatile root
                                             set, i.e. registers */
};

void Parrot_do_dod_run(Interp *, UINTVAL flags);
void trace_system_areas(Interp *);
void trace_mem_block(Interp *, size_t, size_t);

void free_unused_pobjects(Interp *interpreter,
                    struct Small_Object_Pool *pool);

void used_cow(Interp *interpreter,
        struct Small_Object_Pool *pool, int cleanup);
void clear_cow(Interp *interpreter,
        struct Small_Object_Pool *pool, int cleanup);

/* mark a PObj live during DOD */

void pobject_lives(Interp *interpreter, PObj *buffer);

#if ! DISABLE_GC_DEBUG
/* Set when walking the system stack */
extern int CONSERVATIVE_POINTER_CHASING;
#endif

int Parrot_dod_trace_root(Interp *, int trace_stack);
int Parrot_dod_trace_children(Interp *, size_t how_many);
void Parrot_dod_sweep(Interp *, struct Small_Object_Pool *pool);
void Parrot_dod_ms_run_init(Interp *interpreter);
void Parrot_dod_clear_live_bits(Interp*);

/* GC subsystem init functions */
void Parrot_gc_ms_init(Interp* interpreter);
void Parrot_gc_ims_init(Interp* interpreter);
/* do_dod_run function for MS */
void Parrot_dod_ms_run(Interp *interpreter, int flags);

void Parrot_dod_ims_wb(Interp*, PMC *, PMC *);
/*
 * write barrier
 */
#if PARROT_GC_IMS
#  define DOD_WRITE_BARRIER(interp, agg, old, new) \
    do { \
        if (    !PMC_IS_NULL(new)   && \
                PObj_live_TEST(agg) && \
                (PObj_get_FLAGS(agg) & PObj_custom_GC_FLAG) && \
                !PObj_live_TEST(new)) { \
            Parrot_dod_ims_wb(interp, agg, new); \
        } \
    } while (0)

#endif

#if PARROT_GC_MS
#  define DOD_WRITE_BARRIER(interp, agg, old, new)
#endif

#endif /* PARROT_DOD_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
