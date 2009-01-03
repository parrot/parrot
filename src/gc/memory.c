/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

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

/* HEADERIZER HFILE: include/parrot/memory.h */

/*

=item C<void * mem_sys_allocate>

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
    ASSERT_ARGS(mem_sys_allocate);
    void * const ptr = malloc(size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Allocated %i at %p\n", size, ptr);
#endif
    if (!ptr)
        PANIC(NULL, "Out of mem");
    return ptr;
}

/*

=item C<void * mem__internal_allocate>

Calls C<malloc> to allocate memory from the system, Panics if there is no
memory available. If C<DETAIL_MEMORY_DEBUG> macro is defined, prints
debug information to C<STDERR>.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
void *
mem__internal_allocate(size_t size, ARGIN(const char *file), int line)
{
    ASSERT_ARGS(mem__internal_allocate);
    void * const ptr = malloc((size_t)size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Internal malloc %i at %p (%s/%d)\n",
            size, ptr, file, line);
#else
    UNUSED(file);
    UNUSED(line);
#endif
    if (!ptr)
        PANIC(NULL, "Out of mem");
    return ptr;
}

/*

=item C<void * mem_sys_allocate_zeroed>

Uses C<calloc> to allocate system memory.  Guaranteed to succeed, Panics
otherwise.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
void *
mem_sys_allocate_zeroed(size_t size)
{
    ASSERT_ARGS(mem_sys_allocate_zeroed);
    void * const ptr = calloc(1, (size_t)size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Allocated %i at %p\n", size, ptr);
#endif
    if (!ptr)
        PANIC(NULL, "Out of mem");
    return ptr;
}

/*

=item C<void * mem__internal_allocate_zeroed>

Uses C<calloc> to allocate system memory.  Guaranteed to succeed, Panics
otherwise. If C<DETAIL_MEMORY_DEBUG> macro is defined, prints
debug information to C<STDERR>.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
void *
mem__internal_allocate_zeroed(size_t size, ARGIN(const char *file), int line)
{
    ASSERT_ARGS(mem__internal_allocate_zeroed);
    void * const ptr = calloc(1, (size_t)size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Internal malloc %i at %p (%s/%d)\n",
            size, ptr, file, line);
#else
    UNUSED(file);
    UNUSED(line);
#endif
    if (!ptr)
        PANIC(NULL, "Out of mem");
    return ptr;
}

/*

=item C<void * mem_sys_realloc>

Resizes a chunk of memory.  Unlike C<realloc>, it can handle a
NULL pointer, in which case it calls C<calloc> to create the memory
block.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
void *
mem_sys_realloc(ARGFREE(void *from), size_t size)
{
    ASSERT_ARGS(mem_sys_realloc);
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
    if (!ptr)
         PANIC(NULL, "Out of mem");
    return ptr;
}


/*

=item C<void * mem_sys_realloc_zeroed>

Resizes a chunk of system memory and fills the newly allocated space
with zeroes. If the pointer is C<NULL> a new memory block is
allocated and zeroed instead.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
void *
mem_sys_realloc_zeroed(ARGFREE(void *from), size_t size, size_t old_size)
{
    ASSERT_ARGS(mem_sys_realloc_zeroed);
    void *ptr;
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Freed %p (realloc -- %i bytes)\n", from, size);
#endif
    ptr = from ? realloc(from, size) : malloc(size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Allocated %i at %p\n", size, ptr);
#endif
    if (!ptr)
         PANIC(NULL, "Out of mem");

    if (size > old_size)
        memset((char*)ptr + old_size, 0, size - old_size);

    return ptr;
}

/*

=item C<void * mem__internal_realloc>

Resizes a chunk of system memory.  Unlike C<realloc>, it can handle a
NULL pointer, in which case a new memory block is allocated for the
requested size. If C<DETAIL_MEMORY_DEBUG> macro is defined, debug
information is printed to C<STDERR>.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
void *
mem__internal_realloc(ARGFREE(void *from), size_t size,
        ARGIN(const char *file), int line)
{
    ASSERT_ARGS(mem__internal_realloc);
    void * const ptr = realloc(from, size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "internal free of %p (realloc -- %i bytes) (%s/%d)\n",
            from, size, file, line);
    fprintf(stderr, "Internal malloc %i at %p (%s/%d)\n",
            size, ptr, file, line);
#else
    UNUSED(file);
    UNUSED(line);
#endif
    if (!ptr)
        PANIC(NULL, "Out of mem");
    return ptr;
}

#if 0

/*

=item C<void * mem__internal_realloc_zeroed>

Reallocates a given buffer of size C<old_size> to C<size>. If the new size
is larger then the old size, the difference is filled with zeros. Contains
debugging information, and can print filename and line number where it is
used if C<DETAIL_MEMORY_DEBUG> is defined.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
void *
mem__internal_realloc_zeroed(ARGFREE(void *from), size_t size, size_t old_size,
    ARGIN(const char *file), int line)
{
    ASSERT_ARGS(mem__internal_realloc_zeroed);
    void * const ptr = realloc(from, size);
#  ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "internal free of %p (realloc -- %i bytes) (%s/%d)\n",
            from, size, file, line);
    fprintf(stderr, "Internal malloc %i at %p (%s/%d)\n",
            size, ptr, file, line);
#  else
    UNUSED(file);
    UNUSED(line);
#  endif
    if (!ptr)
        PANIC(NULL, "Out of mem");
    if (size > old_size)
        memset((char*)ptr + old_size, 0, size - old_size);

    return ptr;
}

#endif

/*

=item C<void mem_sys_free>

Frees a chunk of memory back to the system.

=cut

*/

PARROT_EXPORT
void
mem_sys_free(ARGFREE(void *from))
{
    ASSERT_ARGS(mem_sys_free);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Freed %p\n", from);
#endif
    if (from)
        free(from);
}

/*

=item C<void mem__internal_free>

Frees a chunk of memory back to the system. If
C<DETAIL_MEMORY_DEBUG> macro is defined, prints debug information to
C<STDERR>.

=cut

*/

void
mem__internal_free(ARGFREE(void *from), ARGIN(const char *file), int line)
{
    ASSERT_ARGS(mem__internal_free);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Internal free of %p (%s/%d)\n", from, file, line);
#else
    UNUSED(file);
    UNUSED(line);
#endif
    free(from);
}

/*

=item C<void mem_setup_allocator>

Initializes the memory allocator and the garbage collection subsystem.
Calls the initialization function associated with each collector, which
is determined at compile time.

=cut

*/

void
mem_setup_allocator(PARROT_INTERP)
{
    ASSERT_ARGS(mem_setup_allocator);
    interp->arena_base = mem_allocate_zeroed_typed(Arenas);
    interp->arena_base->sized_header_pools = NULL;

#if PARROT_GC_MS
    Parrot_gc_ms_init(interp);
#endif
#if PARROT_GC_IMS
    Parrot_gc_ims_init(interp);
#endif
#if PARROT_GC_GMS
    Parrot_gc_gms_init(interp);
#endif

    Parrot_initialize_memory_pools(interp);
    Parrot_initialize_header_pools(interp);
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
