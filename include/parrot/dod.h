/* dod.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Handles dead object destruction of the various headers
 *  History:
 *     Initial version by Mike Lambert on 2002.05.27
 */

#ifndef PARROT_DOD_H_GUARD
#define PARROT_DOD_H_GUARD

#include "parrot/parrot.h"

/* Macros for recursively blocking and unblocking DOD */
#define Parrot_block_DOD(interp) \
        do { \
            (interp)->arena_base->DOD_block_level++; \
            Parrot_shared_DOD_block(interp); \
        } while (0)

#define Parrot_unblock_DOD(interp) \
        if ((interp)->arena_base->DOD_block_level) { \
            (interp)->arena_base->DOD_block_level--; \
            Parrot_shared_DOD_unblock(interp); \
        }

/* Macros for recursively blocking and unblocking GC */
#define Parrot_block_GC(interp) \
        (interp)->arena_base->GC_block_level++

#define Parrot_unblock_GC(interp) \
        if ((interp)->arena_base->GC_block_level) \
            (interp)->arena_base->GC_block_level--

/* Macros for testing if the DOD and GC are blocked */
#define Parrot_is_blocked_DOD(interp) \
        ((interp)->arena_base->DOD_block_level)

#define Parrot_is_blocked_GC(interp) \
        ((interp)->arena_base->GC_block_level)

#define DOD_trace_stack_FLAG    (UINTVAL)(1 << 0)   /* trace system areads and stack */
#define DOD_trace_normal        (UINTVAL)(1 << 0)   /* the same */
#define DOD_lazy_FLAG           (UINTVAL)(1 << 1)   /* timely destruction run */
#define DOD_finish_FLAG         (UINTVAL)(1 << 2)   /* run async past sweep */
#define DOD_no_trace_volatile_roots (UINTVAL)(1 << 3)
            /* trace all but volatile root set, i.e. registers */

/* HEADERIZER BEGIN: src/gc/dod.c */

PARROT_API
void Parrot_do_dod_run( PARROT_INTERP, UINTVAL flags )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_dod_clear_live_bits( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_dod_ms_run( PARROT_INTERP, int flags )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_dod_ms_run_init( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_dod_profile_end( PARROT_INTERP, int what )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_dod_profile_start( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_dod_sweep( PARROT_INTERP, NOTNULL(Small_Object_Pool *pool) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
int Parrot_dod_trace_children( PARROT_INTERP, size_t how_many )
        __attribute__nonnull__(1);

PARROT_API
int Parrot_dod_trace_root( PARROT_INTERP, int trace_stack )
        __attribute__nonnull__(1);

PARROT_API
void pobject_lives( PARROT_INTERP, NOTNULL(PObj *obj) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void clear_cow( PARROT_INTERP, NOTNULL(Small_Object_Pool *pool), int cleanup )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void trace_mem_block( PARROT_INTERP, size_t lo_var_ptr, size_t hi_var_ptr )
        __attribute__nonnull__(1);

void used_cow( PARROT_INTERP, NOTNULL(Small_Object_Pool *pool), int cleanup )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: src/gc/dod.c */


/* HEADERIZER BEGIN: src/cpu_dep.c */

void trace_system_areas( PARROT_INTERP )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/cpu_dep.c */


#if ! DISABLE_GC_DEBUG
/* Set when walking the system stack */
extern int CONSERVATIVE_POINTER_CHASING;
#endif


/* GC subsystem init functions */
/* HEADERIZER BEGIN: src/gc/gc_gms.c */

PARROT_API
void Parrot_gc_gms_init( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
void parrot_gc_gms_pobject_lives( PARROT_INTERP, NOTNULL(PObj *obj) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void parrot_gc_gms_wb( PARROT_INTERP,
    NOTNULL(PMC *agg),
    NOTNULL(void *old),
    NOTNULL(void *new) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

void parrot_gc_gms_wb_key( PARROT_INTERP,
    NOTNULL(PMC *agg),
    NOTNULL(void *old),
    NOTNULL(void *old_key),
    NOTNULL(void *new),
    NOTNULL(void *new_key) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        __attribute__nonnull__(6);

/* HEADERIZER END: src/gc/gc_gms.c */

/* HEADERIZER BEGIN: src/gc/gc_ims.c */

PARROT_API
void Parrot_dod_ims_wb( PARROT_INTERP, NOTNULL(PMC *agg), NOTNULL(PMC *_new) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
void Parrot_gc_ims_init( PARROT_INTERP )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/gc/gc_ims.c */

/*
 * write barrier
 */
#if PARROT_GC_IMS
#  define DOD_WRITE_BARRIER(interp, agg, old, new) \
    do { \
        if (!PMC_IS_NULL(new)   && \
                PObj_live_TEST(agg) && \
                (PObj_get_FLAGS(agg) & PObj_custom_GC_FLAG) && \
                !PObj_live_TEST(new)) { \
            Parrot_dod_ims_wb(interp, agg, new); \
        } \
    } while (0)

#  define DOD_WRITE_BARRIER_KEY(interp, agg, old, old_key, new, new_key) \
          DOD_WRITE_BARRIER(interp, agg, old, new)
#endif

#if PARROT_GC_MS
#  define DOD_WRITE_BARRIER(interp, agg, old, new)
#  define DOD_WRITE_BARRIER_KEY(interp, agg, old, old_key, new, new_key)
#endif

#if PARROT_GC_GMS
#  define DOD_WRITE_BARRIER(interp, agg, old, new) do { \
    UINTVAL gen_agg, gen_new; \
    if (!(new) || PMC_IS_NULL(new)) \
        break; \
    gen_agg = PObj_to_GMSH(agg)->gen->gen_no; \
    gen_new = PObj_to_GMSH(new)->gen->gen_no; \
    if (gen_agg < gen_new) \
        parrot_gc_gms_wb(interp, agg, old, new); \
} while (0)

#  define DOD_WRITE_BARRIER_KEY(interp, agg, old, old_key, new, new_key) do { \
    UINTVAL gen_agg, gen_new, gen_key; \
    if (!(new) || PMC_IS_NULL(new)) \
        break; \
    gen_agg = PObj_to_GMSH(agg)->gen->gen_no; \
    gen_new = PObj_to_GMSH(new)->gen->gen_no; \
    gen_key = PObj_to_GMSH(new_key)->gen->gen_no; \
    if (gen_agg < gen_new || gen_agg < gen_key) \
        parrot_gc_gms_wb_key(interp, agg, old, old_key, new, new_key); \
} while (0)

#endif

#endif /* PARROT_DOD_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
