/* dod.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Handles dead object destruction of the various headers
 *  History:
 *     Initial version by Mike Lambert on 2002.05.27
 */

#pragma once
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

enum {
    DOD_trace_stack_FLAG = 1 << 0,      /* trace system areads and stack */
    DOD_trace_normal     = 1 << 0,      /* the same */
    DOD_lazy_FLAG        = 1 << 1,      /* timely destruction run */
    DOD_finish_FLAG      = 1 << 2,      /* run async past sweep */
    DOD_no_trace_volatile_roots = 1 << 3  /* trace all but volatile root
                                             set, i.e. registers */
};

/* HEADERIZER BEGIN: src/gc/dod.c */

PARROT_API void Parrot_do_dod_run( Interp *interp /*NN*/, UINTVAL flags )
        __attribute__nonnull__(1);

PARROT_API void Parrot_dod_clear_live_bits( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void Parrot_dod_ms_run( Interp *interp /*NN*/, int flags )
        __attribute__nonnull__(1);

PARROT_API void Parrot_dod_ms_run_init( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void Parrot_dod_profile_end( Interp *interp /*NN*/, int what )
        __attribute__nonnull__(1);

PARROT_API void Parrot_dod_profile_start( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void Parrot_dod_sweep( Interp *interp /*NN*/,
    Small_Object_Pool *pool /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API int Parrot_dod_trace_children( Interp *interp /*NN*/,
    size_t how_many )
        __attribute__nonnull__(1);

PARROT_API int Parrot_dod_trace_root( Interp *interp /*NN*/, int trace_stack )
        __attribute__nonnull__(1);

void clear_cow( Interp *interp, Small_Object_Pool *pool /*NN*/, int cleanup )
        __attribute__nonnull__(2);

void pobject_lives( Interp *interp /*NN*/, PObj *obj /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void trace_mem_block( Interp *interp /*NN*/,
    size_t lo_var_ptr,
    size_t hi_var_ptr )
        __attribute__nonnull__(1);

void used_cow( Interp *interp, Small_Object_Pool *pool /*NN*/, int cleanup )
        __attribute__nonnull__(2);

/* HEADERIZER END: src/gc/dod.c */

/* XXX Needs to go into another header */
void trace_system_areas(Interp *interp /*NN*/);

#if ! DISABLE_GC_DEBUG
/* Set when walking the system stack */
extern int CONSERVATIVE_POINTER_CHASING;
#endif


/* GC subsystem init functions */
PARROT_API void parrot_gc_gms_pobject_lives(Interp *interp, PObj *obj);
PARROT_API void Parrot_gc_ims_init(Interp *interp);
PARROT_API void Parrot_gc_gms_init(Interp *interp);

PARROT_API void Parrot_dod_ims_wb(Interp*, PMC *, PMC *);
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

void parrot_gc_gms_wb(Interp *, PMC *agg, void *old, void *new);
void parrot_gc_gms_wb_key(Interp *, PMC *agg,
        void *old, void *old_key, void *new, void *new_key);

#endif

#endif /* PARROT_DOD_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
