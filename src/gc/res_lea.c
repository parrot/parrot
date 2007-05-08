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

COWable objects (strings or Buffers) use an INTVAL at C<bufstart> for
refcounting in DOD. C<bufstart> is incremented by that C<INTVAL>.

=cut

*/

void
Parrot_reallocate(Interp *interp, Buffer *from, size_t tosize)
{
    Buffer * const buffer = from;
    const size_t oldlen = PObj_buflen(buffer);
    void *p;

    if (!PObj_bufstart(buffer)) {
        p = 1 + (INTVAL *)xcalloc(1, sizeof (INTVAL) + tosize);
    }
    else {
        if (!tosize) {    /* realloc(3) does free, if tosize == 0 here */
            return;    /* do nothing */
        }
        p = 1 + (INTVAL *)xrealloc((INTVAL *)PObj_bufstart(buffer) - 1,
                                   sizeof (INTVAL) + tosize);
        if (tosize > oldlen)
            memset(p + oldlen, 0, tosize - oldlen);
    }
    PObj_bufstart(buffer) = p;
    PObj_buflen(buffer) = tosize;
}

/*

=item C<void
Parrot_allocate(Interp *interp, Buffer *buffer, size_t size)>

Allocates and returns the required memory. C<size> is the number of
bytes of memory required.

=cut

*/

void
Parrot_allocate(Interp *interp, Buffer *buffer, size_t size)
{
    Buffer * const b = buffer;
    void * const p = xmalloc(sizeof (INTVAL) + size);

    *(INTVAL *)p = 0;
    PObj_bufstart(b) = 1 + (INTVAL *)p;
    PObj_buflen(b) = size;
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
    if (!PObj_bufstart(str))
        Parrot_allocate_string(interp, str, tosize);
    else if (tosize) {
        const size_t pad = BUFFER_ALIGNMENT - 1;
        void *p;
        tosize = ((tosize + pad + sizeof (INTVAL)) & ~pad);
        p = xrealloc((char *)((INTVAL*)PObj_bufstart(str) - 1), tosize);
        PObj_bufstart(str) = str->strstart = (char *)p + sizeof (INTVAL);
        /* usable size at bufstart */
        PObj_buflen(str) = tosize - sizeof (INTVAL);
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
    void *p;
    const size_t pad = BUFFER_ALIGNMENT - 1;

    size = ((size + pad + sizeof (INTVAL)) & ~pad);
    p = xcalloc(1, size);
    *(INTVAL*)p = 0;
    PObj_bufstart(str) = str->strstart = (char *)p + sizeof (INTVAL);
    PObj_buflen(str) = size - sizeof (INTVAL);
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
