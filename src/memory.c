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
    return ptr;
}

/*

=item C<void *
mem_sys_realloc(void *from, size_t size)>

Resize a chunk of system memory.

=cut

*/

void *
mem_sys_realloc(void *from, size_t size)
{
    void *ptr = realloc(from, size);
    if (!ptr)
        PANIC("Out of mem");
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
    interpreter->arena_base->sized_header_pools = NULL;
    interpreter->arena_base->num_sized = 0;

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
