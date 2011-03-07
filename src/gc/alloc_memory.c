/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/gc/memory.c - Memory allocation

=head1 DESCRIPTION

The memory (mem) API handles memory allocation,

Basically just a wrapper C<around malloc/calloc/realloc/free()> with an
setup function to initialize the memory pools.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/memory.h"

PARROT_DOES_NOT_RETURN
static void failed_allocation(unsigned int line, unsigned long size) /* HEADERIZER SKIP */
{
    fprintf(stderr, "Failed allocation of %lu bytes\n", size);
    do_panic(NULL, "Out of mem", __FILE__, line);
}

#define PANIC_OUT_OF_MEM(size) failed_allocation(__LINE__, (size))

/* HEADERIZER HFILE: include/parrot/memory.h */

/*

=item C<void * mem_sys_allocate(size_t size)>

Uses C<malloc> to allocate system memory. Panics if the system cannot
return memory.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
void *
mem_sys_allocate(size_t size)
{
    ASSERT_ARGS(mem_sys_allocate)
    void * const ptr = malloc(size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Allocated %i at %p\n", size, ptr);
#endif
    if (!ptr && size)
        PANIC_OUT_OF_MEM(size);
    return ptr;
}

/*

=item C<void * mem_sys_allocate_zeroed(size_t size)>

Uses C<calloc> to allocate system memory.  Guaranteed to succeed, Panics
otherwise.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CAN_RETURN_NULL
void *
mem_sys_allocate_zeroed(size_t size)
{
    ASSERT_ARGS(mem_sys_allocate_zeroed)
    void * const ptr = calloc(1, (size_t)size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Allocated %i at %p\n", size, ptr);
#endif
    if (!ptr && size)
        PANIC_OUT_OF_MEM(size);
    return ptr;
}

/*

=item C<void * mem_sys_realloc(void *from, size_t size)>

Resizes a chunk of memory.  Unlike C<realloc>, it can handle a
NULL pointer, in which case it calls C<calloc> to create the memory
block.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CAN_RETURN_NULL
void *
mem_sys_realloc(ARGFREE(void *from), size_t size)
{
    ASSERT_ARGS(mem_sys_realloc)
    void *ptr;
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Freed %p (realloc -- %i bytes)\n", from, size);
#endif
    if (from)
        ptr = realloc(from, size);
    else
        ptr = calloc(1, size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Allocated %i at %p\n", size, ptr);
#endif
    if (!ptr && size)
        PANIC_OUT_OF_MEM(size);
    return ptr;
}


/*

=item C<void * mem_sys_realloc_zeroed(void *from, size_t size, size_t old_size)>

Resizes a chunk of system memory and fills the newly allocated space
with zeroes. If the pointer is C<NULL> a new memory block is
allocated and zeroed instead.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CAN_RETURN_NULL
void *
mem_sys_realloc_zeroed(ARGFREE(void *from), size_t size, size_t old_size)
{
    ASSERT_ARGS(mem_sys_realloc_zeroed)
    void *ptr;
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Freed %p (realloc -- %i bytes)\n", from, size);
#endif
    ptr = from ? realloc(from, size) : malloc(size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Allocated %i at %p\n", size, ptr);
#endif
    if (!ptr && size)
        PANIC_OUT_OF_MEM(size);

    if (size > old_size)
        memset((char*)ptr + old_size, 0, size - old_size);

    return ptr;
}

/*

=item C<void mem_sys_free(void *from)>

Frees a chunk of memory back to the system.

=cut

*/

PARROT_EXPORT
void
mem_sys_free(ARGFREE(void *from))
{
    ASSERT_ARGS(mem_sys_free)
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Freed %p\n", from);
#endif
    if (from)
        free(from);
}

/*

=item C<char * mem_sys_strdup(const char *src)>

Copy a C string to a new block of memory allocated with mem_sys_allocate,
that can be later deallocated with mem_sys_free.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
char *
mem_sys_strdup(ARGIN(const char *src))
{
    ASSERT_ARGS(mem_sys_strdup)

    const size_t l = strlen(src);
    char * const result = (char *)mem_sys_allocate(l + 1);
    memcpy(result, src, l);
    result[l] = '\0';
    return result;
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
