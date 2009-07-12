/*
Copyright (C) 2001-2009, Parrot Foundation.
$Id:

=head1 NAME

src/gc/gc_inf.c - A demonstration of an infinite memory garbage collector

=head1 DESCRIPTION

This code implements an example of a bare-bones "infinite memory" garbage
collector. This is a learning tool only to demonstrate how to implement the
GC API in a new core. DO NOT USE THIS CORE ANYWHERE FOR ANY REASON.

Because this core never frees memory, some functionality is missing and some
tests will fail: Tests for timely destruction, tests involving IO that is
not manually flushed (the GC never calls the destroy VTABLE, so things never
get flushed/closed automatically), etc.

To enable this core, change the settings in include/parrot/settings.h. Set

 PARROT_GC_SUBSYSEM == 3

to activate this core.

=cut

*/

#include "parrot/parrot.h"
#include "gc_private.h"

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* HEADERIZER END: static */

/*

=head1 Functions

=over 4

=item C<void gc_inf_mark_and_sweep(PARROT_INTERP, UINTVAL flags)>

This function would perform a GC run, if we needed to. Luckily we have
infinite memory!

=cut

*/

static void
gc_inf_mark_and_sweep(SHIM_INTERP, UINTVAL flags)
{
}

/*

=item C<void gc_inf_add_free_object(SHIM_INTERP, Small_Object_Pool *pool,
    void *to_add)>

Manually frees a chunk of memory.

=cut

*/

static void
gc_inf_add_free_object(SHIM_INTERP, ARGMOD(Small_Object_Pool *pool),
    ARGIN(void *to_add))
{
    if (to_add)
        free(to_add);
}

/*

=item C<void *gc_inf_get_free_object(PARROT_INTERP, Small_Object_Pool *pool)>

Gets a new buffer from memory of the required size

=cut

*/

static void *
gc_inf_get_free_object(SHIM_INTERP, ARGMOD(Small_Object_Pool *pool))
{
    return calloc(pool->object_size, 1);
}

/*

=item C<void gc_inf_alloc_objects(PARROT_INTERP, Small_Object_Pool *pool)>

Allocates a new arena of objects from the system. Actually, it doesn't here.

=cut

*/

static void
gc_inf_alloc_objects(SHIM_INTERP, ARGMOD(Small_Object_Pool *pool))
{
}

/*

=item C<void gc_inf_more_traceable_objects(PARROT_INTERP, Small_Object_Pool *pool)>

Would normally try to find new traceable objects by first running a GC sweep
and then allocating a new arena from the system. Neither of these are
necessary in the infinite memory collector

=cut

*/

static void
gc_inf_more_traceable_objects(SHIM_INTERP, ARGMOD(Small_Object_Pool *pool))
{
}

/*

=item C<void gc_inf_pool_init(PARROT_INTERP, Small_Object_Pool * pool)>

Initializes the function pointers in a new pool

=cut

*/

static void
gc_inf_pool_init(SHIM_INTERP, ARGMOD(Small_Object_Pool *pool))
{
    pool->add_free_object = gc_inf_add_free_object;
    pool->get_free_object = gc_inf_get_free_object;
    pool->alloc_objects   = gc_inf_alloc_objects;
    pool->more_objects    = gc_inf_more_traceable_objects;
}

/*

=item C<void Parrot_gc_inf_init(PARROT_INTERP)>

Initializes the infinite memory collector

=cut

*/

void
Parrot_gc_inf_init(PARROT_INTERP)
{
    Arenas * const arena_base     = interp->arena_base;

    arena_base->do_gc_mark         = gc_inf_mark_and_sweep;
    arena_base->finalize_gc_system = NULL;
    arena_base->init_pool          = gc_inf_pool_init;
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
