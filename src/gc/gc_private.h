/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/gc/gc_private.h - private header file for the GC subsystem

=head1 DESCRIPTION

This is a private header file for the GC subsystem. It contains definitions
that are only for use in the GC and don't need to be included in the rest of
Parrot.
*/

#ifndef PARROT_GC_PRIVATE_H_GUARD
#define PARROT_GC_PRIVATE_H_GUARD

#include "parrot/settings.h"

#if ! DISABLE_GC_DEBUG
/* Set when walking the system stack. Defined in src/gc/system.c */
extern int CONSERVATIVE_POINTER_CHASING;
#endif

#ifdef __ia64__

#  include <ucontext.h>
extern void *flush_reg_store(void);
#  define BACKING_STORE_BASE 0x80000fff80000000

#endif

/* We're using this here to add an additional pointer to a PObj without
   having to actually add an entire pointer to every PObj-alike structure
   in Parrot. Astute observers may notice that if the PObj is comprised of
   only an INTVAL, then there are some systems where sizeof(PObj*) can be
   larger then sizeof(PObj), thus creating overflow. However PObjs are never
   used by themselves, things like PMCs and STRINGs are cast to PObj in the
   GC, so we should have plenty of space. */
typedef union GC_MS_PObj_Wrapper {
    PObj obj;
    PObj *next_ptr;
} GC_MS_PObj_Wrapper;

/* HEADERIZER BEGIN: src/gc/system.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void trace_mem_block(PARROT_INTERP, size_t lo_var_ptr, size_t hi_var_ptr)
        __attribute__nonnull__(1);

void trace_system_areas(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_trace_mem_block __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_trace_system_areas __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/system.c */

/* HEADERIZER BEGIN: src/gc/generational_ms.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_gc_gms_init(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void parrot_gc_gms_Parrot_gc_mark_PObj_alive(PARROT_INTERP,
    ARGMOD(PObj *obj))
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
#define ASSERT_ARGS_parrot_gc_gms_Parrot_gc_mark_PObj_alive \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
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

/* HEADERIZER BEGIN: src/gc/mark_sweep.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
INTVAL contained_in_pool(
    ARGIN(const Small_Object_Pool *pool),
    ARGIN(const void *ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void gc_pmc_ext_pool_init(ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*pool);

void mark_special(PARROT_INTERP, ARGIN(PMC *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Small_Object_Pool * new_small_object_pool(
    size_t object_size,
    size_t objects_per_alloc);

void Parrot_add_to_free_list(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool),
    ARGMOD(Small_Object_Arena *arena))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool)
        FUNC_MODIFIES(*arena);

void Parrot_append_arena_in_pool(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *pool),
    ARGMOD(Small_Object_Arena *new_arena),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool)
        FUNC_MODIFIES(*new_arena);

void Parrot_gc_clear_live_bits(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_gc_ms_free_pmc(PARROT_INTERP,
    SHIM(Small_Object_Pool *pool),
    ARGMOD(PObj *p))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*p);

void Parrot_gc_ms_init(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_gc_ms_run(PARROT_INTERP, UINTVAL flags)
        __attribute__nonnull__(1);

void Parrot_gc_ms_run_init(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_gc_sweep(PARROT_INTERP, ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

int Parrot_gc_trace_children(PARROT_INTERP, size_t how_many)
        __attribute__nonnull__(1);

int Parrot_gc_trace_root(PARROT_INTERP, Parrot_gc_trace_type trace)
        __attribute__nonnull__(1);

int Parrot_is_const_pmc(PARROT_INTERP, ARGIN(const PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_small_object_pool_merge(PARROT_INTERP,
    ARGMOD(Small_Object_Pool *dest),
    ARGMOD(Small_Object_Pool *source))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*dest)
        FUNC_MODIFIES(*source);

#define ASSERT_ARGS_contained_in_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(pool) \
    || PARROT_ASSERT_ARG(ptr)
#define ASSERT_ARGS_gc_pmc_ext_pool_init __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_mark_special __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(obj)
#define ASSERT_ARGS_new_small_object_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
#define ASSERT_ARGS_Parrot_add_to_free_list __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool) \
    || PARROT_ASSERT_ARG(arena)
#define ASSERT_ARGS_Parrot_append_arena_in_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool) \
    || PARROT_ASSERT_ARG(new_arena)
#define ASSERT_ARGS_Parrot_gc_clear_live_bits __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_ms_free_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(p)
#define ASSERT_ARGS_Parrot_gc_ms_init __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_ms_run __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_ms_run_init __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_Parrot_gc_trace_children __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_trace_root __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_is_const_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pmc)
#define ASSERT_ARGS_Parrot_small_object_pool_merge \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(dest) \
    || PARROT_ASSERT_ARG(source)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/mark_sweep.c */

/* HEADERIZER BEGIN: src/gc/pools.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void free_pool(ARGMOD(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*pool);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Small_Object_Pool * get_bufferlike_pool(PARROT_INTERP, size_t buffer_size)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
void * get_free_buffer(PARROT_INTERP, ARGIN(Small_Object_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
size_t get_max_buffer_address(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
size_t get_max_pmc_address(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
size_t get_min_buffer_address(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
size_t get_min_pmc_address(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
int is_buffer_ptr(PARROT_INTERP, ARGIN(const void *ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
int is_pmc_ptr(PARROT_INTERP, ARGIN(const void *ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Small_Object_Pool * new_buffer_pool(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Small_Object_Pool * new_bufferlike_pool(PARROT_INTERP,
    size_t actual_buffer_size)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Small_Object_Pool * new_pmc_pool(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Small_Object_Pool * new_string_pool(PARROT_INTERP, INTVAL constant)
        __attribute__nonnull__(1);

PARROT_IGNORABLE_RESULT
int /*@alt void@*/
Parrot_forall_header_pools(PARROT_INTERP,
    int flag,
    ARGIN_NULLOK(void *arg),
    NOTNULL(pool_iter_fn func))
        __attribute__nonnull__(1)
        __attribute__nonnull__(4);

void Parrot_initialize_header_pools(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_free_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_get_bufferlike_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_get_free_buffer __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_get_max_buffer_address __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_get_max_pmc_address __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_get_min_buffer_address __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_get_min_pmc_address __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_is_buffer_ptr __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ptr)
#define ASSERT_ARGS_is_pmc_ptr __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ptr)
#define ASSERT_ARGS_new_buffer_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_new_bufferlike_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_new_pmc_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_new_string_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_forall_header_pools __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(func)
#define ASSERT_ARGS_Parrot_initialize_header_pools \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/pools.c */

/* HEADERIZER BEGIN: src/gc/resources.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
char * aligned_mem(ARGIN(const Buffer *buffer), ARGIN(char *mem))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
size_t aligned_size(ARGIN(const Buffer *buffer), size_t len)
        __attribute__nonnull__(1);

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
size_t aligned_string_size(size_t len);

void compact_pool(PARROT_INTERP, ARGMOD(Memory_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
void * mem_allocate(PARROT_INTERP, size_t size, ARGMOD(Memory_Pool *pool))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool);

void merge_pools(ARGMOD(Memory_Pool *dest), ARGMOD(Memory_Pool *source))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest)
        FUNC_MODIFIES(*source);

void Parrot_allocate(PARROT_INTERP, ARGOUT(Buffer *buffer), size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*buffer);

void Parrot_gc_profile_end(PARROT_INTERP, int what)
        __attribute__nonnull__(1);

void Parrot_gc_profile_start(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_initialize_memory_pools(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_aligned_mem __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(buffer) \
    || PARROT_ASSERT_ARG(mem)
#define ASSERT_ARGS_aligned_size __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(buffer)
#define ASSERT_ARGS_aligned_string_size __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
#define ASSERT_ARGS_compact_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_mem_allocate __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pool)
#define ASSERT_ARGS_merge_pools __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(dest) \
    || PARROT_ASSERT_ARG(source)
#define ASSERT_ARGS_Parrot_allocate __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(buffer)
#define ASSERT_ARGS_Parrot_gc_profile_end __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_gc_profile_start __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_initialize_memory_pools \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/gc/resources.c */

#endif /* PARROT_GC_PRIVATE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
