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
#define Parrot_block_GC_mark(interp) \
        { \
            (interp)->arena_base->DOD_block_level++; \
            Parrot_shared_DOD_block(interp); \
        }

#define Parrot_unblock_GC_mark(interp) \
        if ((interp)->arena_base->DOD_block_level) { \
            (interp)->arena_base->DOD_block_level--; \
            Parrot_shared_DOD_unblock(interp); \
        }

/* Macros for recursively blocking and unblocking GC */
#define Parrot_block_GC_sweep(interp) \
        (interp)->arena_base->GC_block_level++

#define Parrot_unblock_GC_sweep(interp) \
        if ((interp)->arena_base->GC_block_level) \
            (interp)->arena_base->GC_block_level--

/* Macros for testing if the DOD and GC are blocked */
#define Parrot_is_blocked_GC_mark(interp) \
        ((interp)->arena_base->DOD_block_level)

#define Parrot_is_blocked_GC_sweep(interp) \
        ((interp)->arena_base->GC_block_level)

#define GC_trace_stack_FLAG    (UINTVAL)(1 << 0)   /* trace system areas and stack */
#define GC_trace_normal        (UINTVAL)(1 << 0)   /* the same */
#define GC_lazy_FLAG           (UINTVAL)(1 << 1)   /* timely destruction run */
#define GC_finish_FLAG         (UINTVAL)(1 << 2)   /* on Parrot exit: mark (almost) all PMCs dead and */
                                                   /* garbage collect. */

/* HEADERIZER BEGIN: src/gc/dod.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void pobject_lives(PARROT_INTERP, ARGMOD(PObj *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*obj);

void clear_cow(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool), int cleanup)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

void Parrot_do_dod_run(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

void Parrot_dod_clear_live_bits(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_dod_free_buffer(SHIM_INTERP,
    ARGMOD(Small_Object_Pool *pool),
    ARGMOD(PObj *b))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool)
        FUNC_MODIFIES(*b);

void Parrot_dod_free_buffer_malloc(SHIM_INTERP,
    SHIM(Small_Object_Pool *pool),
    ARGMOD(PObj *b))
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*b);

void Parrot_dod_free_pmc(PARROT_INTERP,
    SHIM(Small_Object_Pool *pool),
    ARGMOD(PObj *p))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*p);

void Parrot_dod_free_sysmem(SHIM_INTERP,
    SHIM(Small_Object_Pool *pool),
    ARGMOD(PObj *b))
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*b);

void Parrot_dod_ms_run(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

void Parrot_dod_ms_run_init(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_dod_profile_end(PARROT_INTERP, int what)
        __attribute__nonnull__(1);

void Parrot_dod_profile_start(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_dod_sweep(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

int Parrot_dod_trace_children(PARROT_INTERP, size_t how_many)
        __attribute__nonnull__(1);

void Parrot_dod_trace_pmc_data(PARROT_INTERP, ARGIN(PMC *p))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int Parrot_dod_trace_root(PARROT_INTERP, int trace_stack)
        __attribute__nonnull__(1);

void Parrot_free_pmc_ext(PARROT_INTERP, ARGMOD(PMC *p))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*p);

void trace_mem_block(PARROT_INTERP, size_t lo_var_ptr, size_t hi_var_ptr)
        __attribute__nonnull__(1);

void used_cow(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool), int cleanup)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

#define ASSERT_ARGS_pobject_lives __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(obj)
#define ASSERT_ARGS_clear_cow __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_Parrot_do_dod_run __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_dod_clear_live_bits __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_dod_free_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(pool) \
    || PARROT_ASSERT_ARG(b)
#define ASSERT_ARGS_Parrot_dod_free_buffer_malloc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(b)
#define ASSERT_ARGS_Parrot_dod_free_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(p)
#define ASSERT_ARGS_Parrot_dod_free_sysmem __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(b)
#define ASSERT_ARGS_Parrot_dod_ms_run __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_dod_ms_run_init __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_dod_profile_end __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_dod_profile_start __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_dod_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_Parrot_dod_trace_children __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_dod_trace_pmc_data __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(p)
#define ASSERT_ARGS_Parrot_dod_trace_root __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_free_pmc_ext __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(p)
#define ASSERT_ARGS_trace_mem_block __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_used_cow __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/dod.c */


/* HEADERIZER BEGIN: src/cpu_dep.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void trace_system_areas(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_trace_system_areas __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/cpu_dep.c */


#if ! DISABLE_GC_DEBUG
/* Set when walking the system stack */
extern int CONSERVATIVE_POINTER_CHASING;
#endif


/* GC subsystem init functions */
/* HEADERIZER BEGIN: src/gc/gc_gms.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_gc_gms_init(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void parrot_gc_gms_pobject_lives(PARROT_INTERP, ARGMOD(PObj *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*obj);

void parrot_gc_gms_wb(PARROT_INTERP,
    ARGIN(PMC *agg),
    ARGIN(void *old),
    ARGIN(void *_new))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

void parrot_gc_gms_wb_key(PARROT_INTERP,
    ARGIN(PMC *agg),
    ARGIN(void *old),
    ARGIN(void *old_key),
    ARGIN(void *_new),
    ARGIN(void *new_key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        __attribute__nonnull__(6);

#define ASSERT_ARGS_Parrot_gc_gms_init __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_parrot_gc_gms_pobject_lives __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(obj)
#define ASSERT_ARGS_parrot_gc_gms_wb __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(agg) \
    || PARROT_ASSERT_ARG(old) \
    || PARROT_ASSERT_ARG(_new)
#define ASSERT_ARGS_parrot_gc_gms_wb_key __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(agg) \
    || PARROT_ASSERT_ARG(old) \
    || PARROT_ASSERT_ARG(old_key) \
    || PARROT_ASSERT_ARG(_new) \
    || PARROT_ASSERT_ARG(new_key)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/gc_gms.c */

/* HEADERIZER BEGIN: src/gc/gc_ims.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_dod_ims_wb(PARROT_INTERP, ARGMOD(PMC *agg), ARGMOD(PMC *_new))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*agg)
        FUNC_MODIFIES(*_new);

void Parrot_gc_ims_init(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_dod_ims_wb __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(agg) \
    || PARROT_ASSERT_ARG(_new)
#define ASSERT_ARGS_Parrot_gc_ims_init __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/gc_ims.c */

/*
 * write barrier
 */
#if PARROT_GC_IMS
#  define GC_WRITE_BARRIER(interp, agg, old, _new) \
    do { \
        if (!PMC_IS_NULL(_new)   && \
                PObj_live_TEST(agg) && \
                (PObj_get_FLAGS(agg) & PObj_custom_GC_FLAG) && \
                !PObj_live_TEST(_new)) { \
            Parrot_dod_ims_wb((interp), (agg), (_new)); \
        } \
    } while (0)

#  define GC_WRITE_BARRIER_KEY(interp, agg, old, old_key, _new, new_key) \
          GC_WRITE_BARRIER((interp), (agg), (old), (_new))
#endif

#if PARROT_GC_MS
#  define GC_WRITE_BARRIER(interp, agg, old, _new)
#  define GC_WRITE_BARRIER_KEY(interp, agg, old, old_key, _new, new_key)
#endif

#if PARROT_GC_GMS
#  define GC_WRITE_BARRIER(interp, agg, old, _new) do { \
    UINTVAL gen_agg, gen_new; \
    if (!(_new) || PMC_IS_NULL(_new)) \
        break; \
    gen_agg = PObj_to_GMSH(agg)->gen->gen_no; \
    gen_new = PObj_to_GMSH(_new)->gen->gen_no; \
    if (gen_agg < gen_new) \
        parrot_gc_gms_wb((interp), (agg), (old), (_new)); \
} while (0)

#  define GC_WRITE_BARRIER_KEY(interp, agg, old, old_key, _new, new_key) do { \
    UINTVAL gen_agg, gen_new, gen_key; \
    if (!(_new) || PMC_IS_NULL(_new)) \
        break; \
    gen_agg = PObj_to_GMSH(agg)->gen->gen_no; \
    gen_new = PObj_to_GMSH(_new)->gen->gen_no; \
    gen_key = PObj_to_GMSH(new_key)->gen->gen_no; \
    if (gen_agg < gen_new || gen_agg < gen_key) \
        parrot_gc_gms_wb_key((interp), (agg), (old), (old_key), (_new), (new_key)); \
} while (0)

#endif

#endif /* PARROT_DOD_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
