/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/memory.c - Memory allocation

=head1 DESCRIPTION

The memory (mem) API handles memory allocation,

Basically just a wrapper C<around malloc/calloc/realloc/free()> with an
setup function to initialize the memory pools.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/* for PANIC */
#define interpreter NULL

/*

=item C<void *
mem_sys_allocate(size_t size)>

Uses C<malloc> to allocate system memory.

=cut

*/

void *
mem_sys_allocate(size_t size)
{
    void *ptr = malloc((size_t)size);
    if (!ptr)
        PANIC("Out of mem");
#ifdef DETAIL_MEMORY_DEBUG
    printf("Allocated %i at %p\n", size, ptr);
#endif
    return ptr;
}

void *
mem__internal_allocate(size_t size, char *file, int line)
{
    void *ptr = malloc((size_t)size);
#ifdef DETAIL_MEMORY_DEBUG
    printf("Internal malloc %i at %p (%s/%d)\n", size, ptr, file, line);
#endif
    if (!ptr)
        PANIC("Out of mem");
    return ptr;
}

/*

=item C<void *
mem_sys_allocate_zeroed(size_t size)>

Uses C<calloc> to allocate system memory.

=cut

*/

void *
mem_sys_allocate_zeroed(size_t size)
{
    void *ptr = calloc(1, (size_t)size);
    if (!ptr)
        PANIC("Out of mem");
#ifdef DETAIL_MEMORY_DEBUG
    printf("Allocated %i at %p\n", size, ptr);
#endif
    return ptr;
}

void *
mem__internal_allocate_zeroed(size_t size, char *file, int line)
{
    void *ptr = calloc(1, (size_t)size);
    if (!ptr)
        PANIC("Out of mem");
#ifdef DETAIL_MEMORY_DEBUG
    printf("Internal malloc %i at %p (%s/%d)\n", size, ptr, file, line);
#endif
    return ptr;
}

/*

=item C<void *
mem_sys_realloc(void *from, size_t size)>

Resize a chunk of system memory.

=cut

*/

void *
mem__sys_realloc(void *from, size_t size)
{
    void *ptr;
#ifdef DETAIL_MEMORY_DEBUG
    printf("Freed %p (realloc -- %i bytes)\n", from, size);
#endif
    ptr = realloc(from, size);
    if (!ptr)
         PANIC("Out of mem");
#ifdef DETAIL_MEMORY_DEBUG
    printf("Allocated %i at %p\n", size, ptr);
#endif
    return ptr;
}

void *
mem__internal_realloc(void *from, size_t size, char *file, int line)
{
    void *ptr = realloc(from, size);
    if (!ptr)
        PANIC("Out of mem");
#ifdef DETAIL_MEMORY_DEBUG
    printf("internal free of %p (realloc -- %i bytes) (%s/%d)\n", from, size, file, line);
    printf("Internal malloc %i at %p (%s/%d)\n", size, ptr, file, line);
#endif
    return ptr;
}
#undef interpreter

/*

=item C<void
mem_sys_free(void *from)>

Free a chunk of memory back to the system.

=cut

*/

void
mem_sys_free(void *from)
{
#ifdef DETAIL_MEMORY_DEBUG
    printf("Freed %p\n", from);
#endif
    free(from);
}

void
mem__internal_free(void *from, char *file, int line)
{
#ifdef DETAIL_MEMORY_DEBUG
    printf("Internal free of %p (%s/%d)\n", from, file, line);
#endif
    free(from);
}

/*

=item C<void
mem_setup_allocator(Interp *interpreter)>

Initializes the allocator.

=cut

*/

void
mem_setup_allocator(Interp *interpreter)
{
    interpreter->arena_base = mem_sys_allocate_zeroed(sizeof(struct Arenas));
    SET_NULL(interpreter->arena_base->sized_header_pools);

#if PARROT_GC_MS
    Parrot_gc_ms_init(interpreter);
#endif
#if PARROT_GC_IMS
    Parrot_gc_ims_init(interpreter);
#endif

    Parrot_initialize_memory_pools(interpreter);
    Parrot_initialize_header_pools(interpreter);

}

/*

=back

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
