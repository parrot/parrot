/*
Copyright (C) 2001-2008, Parrot Foundation.
$Id$

=head1 NAME

src/gc/res_lea.c - Resource allocation using malloc

=head1 DESCRIPTION

This file provides alternative implementations of memory allocation
function found in F<src/resources.c>. It is used if F<Configure.pl> is
passed the C<--gc=malloc> or C<--gc=malloc-trace> options.

The "lea" in the file name refers to Doug Lea, who wrote malloc
implementation found in F<src/malloc.c>.

As of May 14, 2007, it doesn't work (and hasn't worked for some
time.)  The problem appears to be related to strings, but actually
could be somewhere else.  This allocator does not support any of
Parrot's Copy-on-Write schemes.  Nor does the string allocator
handle "external" strings.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/*

=item C<void Parrot_gc_compact_memory_pool(PARROT_INTERP)>

Does nothing other than increment the interpreter's C<gc_collect_runs>
count.

=cut

*/

void
Parrot_gc_compact_memory_pool(PARROT_INTERP)
{
    ASSERT_ARGS(parrot_go_collect)
    if (interp->arena_base->gc_sweep_block_level) {
        return;
    }
    interp->arena_base->gc_collect_runs++;        /* fake it */
}

/*

=item C<static PARROT_INLINE void* xmalloc(size_t size)>

Obtains the memory from C<malloc()> and returns it. Panics if there is
no memory available.

=cut

*/

static PARROT_INLINE void*
xmalloc(size_t size)
{
    ASSERT_ARGS(xmalloc)
    void *p = malloc(size);
    if (!p)
        do_panic(NULL, "malloc: out of mem", __FILE__, __LINE__);
    return p;
}

/*

=item C<static PARROT_INLINE void* xcalloc(size_t n, size_t size)>

Obtains the memory from C<calloc()> and returns it. Panics if there is
no memory available.

=cut

*/

static PARROT_INLINE void*
xcalloc(size_t n, size_t size)
{
    ASSERT_ARGS(xcalloc)
    void * const p = calloc(n, size);
    if (!p)
        do_panic(NULL, "calloc: out of mem", __FILE__, __LINE__);
    return p;
}

/*

=item C<static PARROT_INLINE void* xrealloc(void *p, size_t size)>

Reallocates the memory with C<realloc()> and returns it. Panics if there
is no memory available.

=cut

*/

static PARROT_INLINE void*
xrealloc(void *p, size_t size)
{
    ASSERT_ARGS(xrealloc)
    void * const n = realloc(p, size);
    if (!n)
        do_panic(NULL, "realloc: out of mem", __FILE__, __LINE__);
    return n;
}

/*

=item C<void Parrot_gc_reallocate_buffer_storage(PARROT_INTERP, Buffer *buffer, size_t newsize)>

COWable objects (strings or Buffers) use an INTVAL before C<bufstart> for
refcounting in GC.

=cut

*/

void
Parrot_gc_reallocate_buffer_storage(PARROT_INTERP, Buffer *buffer, size_t newsize)
{
    ASSERT_ARGS(parrot_reallocate)
    const size_t oldlen = PObj_buflen(buffer);
    Buffer_alloc_unit *p;

    if (!PObj_bufstart(buffer)) {
        Parrot_gc_allocate_buffer_storage_aligned(interp, buffer, newsize);
        /* The previous version zeroed the memory here, but I'm not
           sure why. */
        memset(PObj_bufstart(buffer), 0, newsize);
    }
    else {
        if (!newsize) {    /* realloc(3) does free, if newsize == 0 here */
            return;    /* do nothing */
        }
        p = (Buffer_alloc_unit *) xrealloc(PObj_bufallocstart(buffer),
                                           Buffer_alloc_offset + newsize);
        if (newsize > oldlen)
            memset((char *)p->buffer + oldlen, 0, newsize - oldlen);
        PObj_bufstart(buffer) = p->buffer;
        PObj_buflen(buffer) = newsize;
    }
}


/*

=item C<void Parrot_gc_allocate_buffer_storage_aligned(PARROT_INTERP,
Buffer *buffer, size_t size)>

Allocate buffer memory for the given Buffer pointer. The C<size>
has to be a multiple of the word size.
C<PObj_buflen> will be set to exactly the given C<size>.
See the comments and diagram in resources.c.

This was never called anyway, so it isn't implemented here.

=item C<void Parrot_gc_allocate_buffer_storage_aligned(PARROT_INTERP, Buffer *buffer,
size_t size)>

Like above, except the address of the buffer is guaranteed to be
suitably aligned for holding anything contained in UnionVal
(such as FLOATVAL).

=cut

*/

void
Parrot_gc_allocate_buffer_storage_aligned(PARROT_INTERP, Buffer *buffer, size_t size)
{
    ASSERT_ARGS(parrot_allocate_aligned)
    Buffer_alloc_unit *p;
    p = (Buffer_alloc_unit *) xmalloc(Buffer_alloc_offset + size);
    p->ref_count = 0;
    PObj_bufstart(buffer) = p->buffer;
    PObj_buflen(buffer) = size;
}

/*

=item C<void Parrot_gc_reallocate_string_storage(PARROT_INTERP, STRING *str, size_t newsize)>

Reallocates the string buffer in C<*str> and returns it. C<newsize> is the
number of bytes memory required.

=cut

*/

void
Parrot_gc_reallocate_string_storage(PARROT_INTERP, STRING *str, size_t newsize)
{
    ASSERT_ARGS(parrot_reallocate_string)
    Buffer_alloc_unit *p;

    if (!PObj_bufstart(str)) {
        Parrot_gc_allocate_string_storage(interp, str, newsize);
    }
    else if (newsize) {
        p = (Buffer_alloc_unit *) xrealloc(PObj_bufallocstart(str),
                                           Buffer_alloc_offset + newsize);
        PObj_bufstart(str) = str->strstart = (char *) p->buffer;
        PObj_buflen(str) = newsize;
    }
}

/*

=item C<void Parrot_gc_allocate_string_storage(PARROT_INTERP, STRING *str, size_t size)>

Allocates the string buffer in C<*str> and returns it. C<size> is the
number bytes of memory required.

=cut

*/

void
Parrot_gc_allocate_string_storage(PARROT_INTERP, STRING *str, size_t size)
{
    ASSERT_ARGS(Parrot_gc_allocate_string_storage)
    Buffer_alloc_unit *p;
    p = (Buffer_alloc_unit *) xcalloc(Buffer_alloc_offset + size, 1);
    p->ref_count = 0;
    PObj_bufstart(str) = str->strstart = (char *) p->buffer;
    PObj_buflen(str) = size;
}

/*

=item C<void initialize_memory_pools(PARROT_INTERP)>

Does nothing.

=cut

*/

void
initialize_memory_pools(PARROT_INTERP)
{
    ASSERT_ARGS(parrot_initialize_memory_pools)
}

/*

=item C<void Parrot_gc_merge_memory_pools(Interp *dest, Interp *source)>

Does nothing.

=cut

*/
void
Parrot_gc_merge_memory_pools(Interp *dest, Interp *source)
{
    ASSERT_ARGS(parrot_merge_memory_pools)
}

/*

=item C<void Parrot_gc_destroy_memory_pools(PARROT_INTERP)>

Does nothing.

=cut

*/

void
Parrot_gc_destroy_memory_pools(PARROT_INTERP)
{
    ASSERT_ARGS(parrot_destroy_memory_pools)
}

/*

=back

=head1 SEE ALSO

F<config/auto/gc.pl>, F<src/malloc.c>

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
