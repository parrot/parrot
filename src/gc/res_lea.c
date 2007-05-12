/*
Copyright (C) 2001-2006, The Perl Foundation.
$Id$

=head1 NAME

src/res_lea.c - Resource allocation using malloc

=head1 DESCRIPTION

This file provides alternative implementations of memory allocation
function found in F<src/resources.c>. It is used if F<Configure.pl> is
passed the C<--gc=malloc> or C<--gc=malloc-trace> options.

The "lea" in the file name refers to Doug Lea, who wrote malloc
implementation found in F<src/malloc.c>.

=head2 Functions

=over 4

=cut

*/

#include <assert.h>
#include "parrot/parrot.h"

/*

=item C<void
Parrot_go_collect(Interp *interp)>

Does nothing other than increment the interpreter's C<collect_runs>
count.

=cut

*/

void
Parrot_go_collect(Interp *interp)
{
    if (interp->arena_base->GC_block_level) {
        return;
    }
    interp->arena_base->collect_runs++;        /* fake it */
}

/*

=item C<static PARROT_INLINE void*
xmalloc(size_t size)>

Obtains the memory from C<malloc()> and returns it. Panics if there is
no memory available.

=cut

*/

static PARROT_INLINE void*
xmalloc(size_t size)
{
    void *p = malloc(size);
    if (!p)
        do_panic(NULL, "malloc: out of mem", __FILE__, __LINE__);
    return p;
}

/*

=item C<static PARROT_INLINE void*
xcalloc(size_t n, size_t size)>

Obtains the memory from C<calloc()> and returns it. Panics if there is
no memory available.

=cut

*/

static PARROT_INLINE void*
xcalloc(size_t n, size_t size)
{
    void * const p = calloc(n, size);
    if (!p)
        do_panic(NULL, "calloc: out of mem", __FILE__, __LINE__);
    return p;
}

/*

=item C<static PARROT_INLINE void*
xrealloc(void *p, size_t size)>

Reallocates the memory with C<realloc()> and returns it. Panics if there
is no memory available.

=cut

*/

static PARROT_INLINE void*
xrealloc(void *p, size_t size)
{
    void * const n = realloc(p, size);
    if (!n)
        do_panic(NULL, "realloc: out of mem", __FILE__, __LINE__);
    return n;
}

/*

=item C<void
Parrot_reallocate(Interp *interp, Buffer *from, size_t tosize)>

COWable objects (strings or Buffers) use an INTVAL before C<bufstart> for
refcounting in DOD.

=cut

*/

void
Parrot_reallocate(Interp *interp, Buffer *buffer, size_t tosize)
{
    const size_t oldlen = PObj_buflen(buffer);
    Buffer_alloc_unit *p;

    if (!PObj_bufstart(buffer)) {
        Parrot_allocate_aligned(interp, buffer, tosize);
        /* The previous version zeroed the memory here, but I'm not
           sure why. */
        memset(PObj_bufstart(buffer), 0, tosize);
    }
    else {
        if (!tosize) {    /* realloc(3) does free, if tosize == 0 here */
            return;    /* do nothing */
        }
        p = (Buffer_alloc_unit *) xrealloc(PObj_bufallocstart(buffer),
                                           Buffer_alloc_offset + tosize);
        if (tosize > oldlen)
            memset((char *)p->buffer + oldlen, 0, tosize - oldlen);
        PObj_bufstart(buffer) = p->buffer;
        PObj_buflen(buffer) = tosize;
    }
}


/*

=item C<void
Parrot_allocate(Interp *interp, Buffer *buffer, size_t size)>

Allocate buffer memory for the given Buffer pointer. The C<size>
has to be a multiple of the word size.
C<PObj_buflen> will be set to exactly the given C<size>.
See the comments and diagram in resources.c.

This was never called anyway, so it isn't implemented here.

=item C<void
Parrot_allocate_aligned(Interp *interp, Buffer *buffer, size_t size)>

Like above, except the address of the buffer is guaranteed to be
suitably aligned for holding anything contained in UnionVal
(such as FLOATVAL).

=cut

*/

void
Parrot_allocate_aligned(Interp *interp, Buffer *buffer, size_t size)
{
    Buffer_alloc_unit *p;
    p = (Buffer_alloc_unit *) xmalloc(Buffer_alloc_offset + size);
    p->ref_count = 0;
    PObj_bufstart(buffer) = p->buffer;
    PObj_buflen(buffer) = size;
}

/*

=item C<void
Parrot_reallocate_string(Interp *interp, STRING *str, size_t tosize)>

Reallocates the string buffer in C<*str> and returns it. C<tosize> is the
number of bytes memory required.

=cut

*/

void
Parrot_reallocate_string(Interp *interp, STRING *str, size_t tosize)
{
    const size_t oldlen = PObj_buflen(str);
    Buffer_alloc_unit *p;

    if (!PObj_bufstart(str)) {
        Parrot_allocate_string(interp, str, tosize);
    }
    else if (tosize) {
        p = (Buffer_alloc_unit *) xrealloc(PObj_bufallocstart(str),
                                           Buffer_alloc_offset + tosize);
        PObj_bufstart(str) = str->strstart = (char *) p->buffer;
        PObj_buflen(str) = tosize;
    }
}

/*

=item C<void
Parrot_allocate_string(Interp *interp, STRING *str, size_t size)>

Allocates the string buffer in C<*str> and returns it. C<size> is the
number bytes of memory required.

=cut

*/

void
Parrot_allocate_string(Interp *interp, STRING *str, size_t size)
{
    Buffer_alloc_unit *p;
    p = (Buffer_alloc_unit *) xcalloc(Buffer_alloc_offset + size, 1);
    p->ref_count = 0;
    PObj_bufstart(str) = str->strstart = (char *) p->buffer;
    PObj_buflen(str) = size;
}

/*

=item C<void
Parrot_initialize_memory_pools(Interp *interp)>

Does nothing.

=cut

*/

void
Parrot_initialize_memory_pools(Interp *interp)
{
}

/*

=item C<void
Parrot_merge_memory_pools(Interp *dest, Interp *source)>

Does nothing.

=cut

*/
void
Parrot_merge_memory_pools(Interp *dest, Interp *source)
{
}

/*

=item C<void
Parrot_destroy_memory_pools(Interp *interp)>

Does nothing.

=cut

*/

void
Parrot_destroy_memory_pools(Interp *interp)
{
}

/*

=back

=head1 SEE ALSO

F<config/auto/gc.pl>, F<src/malloc.c>, F<include/parrot/resources.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
