/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id$

=head1 NAME

src/gc/gc_inf.c - A demonstration of an infinite memory garbage collector

=head1 DESCRIPTION

This code implements an example of a bare-bones "infinite memory" garbage
collector. This is a learning tool only to demonstrate how to implement the
GC API in a new core. DO NOT USE THIS CORE ANYWHERE FOR ANY REASON.

Because this core never frees memory, some functionality is missing and some
tests will fail: Tests for timely destruction, tests involving IO that is
not manually flushed (the GC never calls the destroy VTABLE, so things never
get flushed/closed automatically), etc. This is by design and should not be
considered a "bug" or an "error". It is just a fact of life for such a
minimalist core.

To enable this core, change the settings in include/parrot/settings.h. Set

 PARROT_GC_SUBSYSEM == 3

to activate this core.

=cut

*/

#include "parrot/parrot.h"
#include "gc_private.h"

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void gc_inf_add_free_object(SHIM_INTERP,
    ARGMOD(Fixed_Size_Pool *pool),
    ARGIN(void *to_add))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pool);

static void gc_inf_alloc_objects(SHIM_INTERP, ARGMOD(Fixed_Size_Pool *pool))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

PARROT_CANNOT_RETURN_NULL
static void * gc_inf_get_free_object(SHIM_INTERP,
    ARGMOD(Fixed_Size_Pool *pool))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

static void gc_inf_mark_and_sweep(SHIM_INTERP, UINTVAL flags);
static void gc_inf_more_traceable_objects(SHIM_INTERP,
    ARGMOD(Fixed_Size_Pool *pool))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

static void gc_inf_pool_init(SHIM_INTERP, ARGMOD(Fixed_Size_Pool *pool))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pool);

#define ASSERT_ARGS_gc_inf_add_free_object __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool) \
    , PARROT_ASSERT_ARG(to_add))
#define ASSERT_ARGS_gc_inf_alloc_objects __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_gc_inf_get_free_object __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_gc_inf_mark_and_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_more_traceable_objects __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
#define ASSERT_ARGS_gc_inf_pool_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pool))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=head1 Functions

=over 4

=item C<static void gc_inf_mark_and_sweep(PARROT_INTERP, UINTVAL flags)>

This function would perform a GC run, if we needed to. Luckily we have
infinite memory!

This function is called from the GC API function C<Parrot_gc_mark_and_sweep>.

Flags can be a combination of these values:

  GC_finish_FLAG
  GC_lazy_FLAG
  GC_trace_stack_FLAG

=cut

*/

static void
gc_inf_mark_and_sweep(SHIM_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(gc_inf_mark_and_sweep)
    UNUSED(flags);
}

/*

=item C<static void gc_inf_add_free_object(PARROT_INTERP, Fixed_Size_Pool *pool,
void *to_add)>

Manually frees a chunk of memory. Normally this would return the memory
to the free list of the pool, but in this case we just return it to the
OS.

This function is called from places like C<Parrot_gc_free_pmc_header> and
related manual freeing functions. Some cores will also use it internally to
add items to the freelist from a freshly allocated arena.

=cut

*/

static void
gc_inf_add_free_object(SHIM_INTERP, ARGMOD(Fixed_Size_Pool *pool),
    ARGIN(void *to_add))
{
    ASSERT_ARGS(gc_inf_add_free_object)
    if (to_add)
        free(to_add);
}

/*

=item C<static void * gc_inf_get_free_object(PARROT_INTERP, Fixed_Size_Pool
*pool)>

Gets a new object from the pool. Each pool specifies an object size in
C<pool->object_size> so we can use that number to make the allocation. For
GCs that manage their own memory through the use of arenas or similar
structures, we can use this basic algorithm here:

 1) Check if we have any items on the free list and allocate one from there
    if so.
 2) Do a GC run to try and free up new items, and allocate a newly freed
    item if one becomes available
 3) Allocate a new arena from the OS and allocate a new item from there.

This function is called from GC API functions like
C<Parrot_Gc_get_new_pmc_header>

=cut

*/

PARROT_CANNOT_RETURN_NULL
static void *
gc_inf_get_free_object(SHIM_INTERP, ARGMOD(Fixed_Size_Pool *pool))
{
    ASSERT_ARGS(gc_inf_get_free_object)
    return calloc(pool->object_size, 1);
}

/*

=item C<static void gc_inf_alloc_objects(PARROT_INTERP, Fixed_Size_Pool *pool)>

Allocates a new arena of objects from the system. This function is only
really used internally by the core, the API functions don't need to call
it directly. However, this function is necessary because we may have
different behaviors for certain pools, so we can't allocate for all of them
in the same way. We will need to have a new "alloc_objects" function
for each special case pool.

=cut

*/

static void
gc_inf_alloc_objects(SHIM_INTERP, ARGMOD(Fixed_Size_Pool *pool))
{
    ASSERT_ARGS(gc_inf_alloc_objects)
    UNUSED(pool);
}

/*

=item C<static void gc_inf_more_traceable_objects(PARROT_INTERP, Fixed_Size_Pool
*pool)>

Would normally try to find new traceable objects by first running a GC sweep
and then allocating a new arena from the system. Neither of these are
necessary in the infinite memory collector.

This function is only used internally to the core, and is not called directly
from the GC API. Different pools may have special requirements so multiple
"more_traceable_objects" functions may need to be written and used.

=cut

*/

static void
gc_inf_more_traceable_objects(SHIM_INTERP, ARGMOD(Fixed_Size_Pool *pool))
{
    ASSERT_ARGS(gc_inf_more_traceable_objects)
    UNUSED(pool);
}

/*

=item C<static void gc_inf_pool_init(PARROT_INTERP, Fixed_Size_Pool *pool)>

Initializes the function pointers in a new pool. When a new pool is created
we assign several function pointers to it for managing memory in the pool.
In this way we can treat different pools differently if they have special
management needs. In general all PObj-like pools are treated the same.

This function is mostly called from the function C<initialize_fixed_size_pools>
in F<src/gc/mark_sweep.c> at Parrot startup.

=cut

*/

static void
gc_inf_pool_init(SHIM_INTERP, ARGMOD(Fixed_Size_Pool *pool))
{
    ASSERT_ARGS(gc_inf_pool_init)
    pool->add_free_object = gc_inf_add_free_object;
    pool->get_free_object = gc_inf_get_free_object;
    pool->alloc_objects   = gc_inf_alloc_objects;
    pool->more_objects    = gc_inf_more_traceable_objects;
}

/*

=item C<void Parrot_gc_inf_init(PARROT_INTERP)>

Initializes the infinite memory collector. Installs the necessary function
pointers into the Memory_Pools structure. The two most important are the
C<mark_and_sweep> and C<pool_init> functions. C<finalize_gc_system> function
will be called at Parrot exit and will shut down the GC system if things
need to be flushed/closed/deactivated/freed/etc. It can be set to NULL if no
finalization is necessary.

=cut

*/

void
Parrot_gc_inf_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_gc_inf_init)

    interp->gc_sys->do_gc_mark         = gc_inf_mark_and_sweep;
    interp->gc_sys->finalize_gc_system = NULL;
    interp->gc_sys->init_pool          = gc_inf_pool_init;
}


/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
