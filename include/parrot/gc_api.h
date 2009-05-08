/* gc_api.h
 *  Copyright (C) 2001-2009, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Handles dead object destruction of the various headers
 *  History:
 *     Initial version by Mike Lambert on 2002.05.27
 */

#ifndef PARROT_GC_API_H_GUARD
#define PARROT_GC_API_H_GUARD

/* Set this to 1 to see if unanchored objects are found in system areas.
 * Please note: these objects might be bogus */
#define GC_VERBOSE 0

#include "parrot/gc_mark_sweep.h"
#include "parrot/parrot.h"

/*
 * we need an alignment that is the same as malloc(3) have for
 * allocating Buffer items like FLOATVAL (double)
 * This should be either a config hint or tested
 */
#ifdef MALLOC_ALIGNMENT
#  define BUFFER_ALIGNMENT MALLOC_ALIGNMENT
#else
/* or (2 * sizeof (size_t)) */
#  define BUFFER_ALIGNMENT 8
#endif

#define BUFFER_ALIGN_1 (BUFFER_ALIGNMENT - 1)
#define BUFFER_ALIGN_MASK ~BUFFER_ALIGN_1

#define WORD_ALIGN_1 (sizeof (void *) - 1)
#define WORD_ALIGN_MASK ~WORD_ALIGN_1

/* pool iteration */
typedef enum {
    POOL_PMC    = 0x01,
    POOL_BUFFER = 0x02,
    POOL_CONST  = 0x04,
    POOL_ALL    = 0x07
} pool_iter_enum;

typedef int (*pool_iter_fn)(PARROT_INTERP, struct Small_Object_Pool *, int, void*);


/* Macros for recursively blocking and unblocking GC mark */
#define Parrot_block_GC_mark(interp) \
        { \
            (interp)->arena_base->gc_mark_block_level++; \
            Parrot_shared_gc_block(interp); \
        }

#define Parrot_unblock_GC_mark(interp) \
        if ((interp)->arena_base->gc_mark_block_level) { \
            (interp)->arena_base->gc_mark_block_level--; \
            Parrot_shared_gc_unblock(interp); \
        }

/* Macros for recursively blocking and unblocking GC sweep */
#define Parrot_block_GC_sweep(interp) \
        (interp)->arena_base->gc_sweep_block_level++

#define Parrot_unblock_GC_sweep(interp) \
        if ((interp)->arena_base->gc_sweep_block_level) \
            (interp)->arena_base->gc_sweep_block_level--

/* Macros for testing if the GC mark and sweep are blocked */
#define Parrot_is_blocked_GC_mark(interp) \
        ((interp)->arena_base->gc_mark_block_level)

#define Parrot_is_blocked_GC_sweep(interp) \
        ((interp)->arena_base->gc_sweep_block_level)

#define GC_trace_stack_FLAG    (UINTVAL)(1 << 0)   /* trace system areas and stack */
#define GC_trace_normal        (UINTVAL)(1 << 0)   /* the same */
#define GC_lazy_FLAG           (UINTVAL)(1 << 1)   /* timely destruction run */
#define GC_finish_FLAG         (UINTVAL)(1 << 2)   /* on Parrot exit: mark (almost) all PMCs dead and */
                                                   /* garbage collect. */

/* HEADERIZER BEGIN: src/gc/api.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_destroy_header_pools(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_gc_add_pmc_ext(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

void Parrot_gc_add_pmc_sync(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

void Parrot_gc_free_bufferlike_header(PARROT_INTERP,
    ARGMOD(PObj *obj),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*obj);

void Parrot_gc_free_pmc_ext(PARROT_INTERP, ARGMOD(PMC *p))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*p);

void Parrot_gc_initialize(PARROT_INTERP, ARGIN(void *stacktop))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_gc_mark_and_sweep(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
void * Parrot_gc_new_bufferlike_header(PARROT_INTERP, size_t size)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_gc_new_pmc_header(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_gc_new_string_header(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

void Parrot_merge_header_pools(
    ARGMOD(Interp *dest_interp),
    ARGIN(Interp *source_interp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest_interp);

#define ASSERT_ARGS_Parrot_destroy_header_pools __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_add_pmc_ext __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pmc)
#define ASSERT_ARGS_Parrot_gc_add_pmc_sync __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pmc)
#define ASSERT_ARGS_Parrot_gc_free_bufferlike_header \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(obj)
#define ASSERT_ARGS_Parrot_gc_free_pmc_ext __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(p)
#define ASSERT_ARGS_Parrot_gc_initialize __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(stacktop)
#define ASSERT_ARGS_Parrot_gc_mark_and_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_new_bufferlike_header \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_new_pmc_header __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_new_string_header __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_merge_header_pools __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(dest_interp) \
    || PARROT_ASSERT_ARG(source_interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/api.c */

/* GC subsystem init functions */
/* HEADERIZER BEGIN: src/gc/generational_ms.c */
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
/* HEADERIZER END: src/gc/generational_ms.c */

/* HEADERIZER BEGIN: src/gc/incremental_ms.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_gc_ims_init(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_gc_ims_wb(PARROT_INTERP, ARGMOD(PMC *agg), ARGMOD(PMC *_new))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*agg)
        FUNC_MODIFIES(*_new);

#define ASSERT_ARGS_Parrot_gc_ims_init __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_ims_wb __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(agg) \
    || PARROT_ASSERT_ARG(_new)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/incremental_ms.c */

/* write barrier */
#if PARROT_GC_MS
#  define GC_WRITE_BARRIER(interp, agg, old, _new) do { } while (0)
#  define GC_WRITE_BARRIER_KEY(interp, agg, old, old_key, _new, new_key) do { } while (0)
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

#endif /* PARROT_GC_API_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
