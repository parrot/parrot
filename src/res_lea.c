/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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
Parrot_go_collect(struct Parrot_Interp *interpreter)>

Does nothing other than increment the iterpreter's C<collect_runs>
count.

=cut

*/

void
Parrot_go_collect(struct Parrot_Interp *interpreter)
{
    if (interpreter->GC_block_level) {
        return;
    }
    interpreter->collect_runs++;        /* fake it */
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
    void *p = calloc(n, size);
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
    void *n = realloc(p, size);
    if (!n)
        do_panic(NULL, "realloc: out of mem", __FILE__, __LINE__);
    return n;
}

/*

=item C<void *
Parrot_reallocate(struct Parrot_Interp *interpreter, void *from, size_t size)>

COWable objects (strings or Buffers) use an int at C<bufstart> for
refcounting in DOD. C<bufstart> is incremented by that C<int>.

=cut

*/

void *
Parrot_reallocate(struct Parrot_Interp *interpreter, void *from, size_t size)
{
    Buffer * buffer = from;
    void *p;
    size_t oldlen = buffer->buflen;
    if (!buffer->bufstart) {
        buffer->bufstart = xcalloc(1, size + sizeof(int));
        LVALUE_CAST(int *, buffer->bufstart)++;
    }
    else {
        if (!size) {    /* realloc(3) does free, if size == 0 here */
            return buffer->bufstart;    /* do nothing */
        }
        p = xrealloc((int*)buffer->bufstart - 1, size + sizeof(int));
        *(LVALUE_CAST(int *, p)++) = 0;
        if (size > buffer->buflen)
            memset((char*)p + oldlen, 0, size - oldlen);
        buffer->bufstart = p;
    }
    buffer->buflen = size;
    return buffer->bufstart;
}

/*

=item C<void *
Parrot_allocate(struct Parrot_Interp *interpreter, void *buffer, size_t size)>

Allocates and returns the required memory. C<size> is the number of
C<sizeof(int)> units of memory required.

=cut

*/

void *
Parrot_allocate(struct Parrot_Interp *interpreter, void *buffer, size_t size)
{
    Buffer * b = buffer;
    b->bufstart = xmalloc(size + sizeof(int));
    *(LVALUE_CAST(int *, b->bufstart)++) = 0;
    b->buflen = size;
    return b;
}

/*

=item C<void *
Parrot_allocate_zeroed(struct Parrot_Interp *interpreter, void *buffer,
        size_t size)>

Allocates, zeros and returns the required memory. C<size> is the number
of C<sizeof(int)> units of memory required.

=cut

*/

void *
Parrot_allocate_zeroed(struct Parrot_Interp *interpreter, void *buffer,
        size_t size)
{
    Buffer * b = buffer;
    b->bufstart = xcalloc(1, size + sizeof(int));
    *(LVALUE_CAST(int *, b->bufstart)++) = 0;  /*   *( (int*) b->bufstart ++ ) = 0 */
    b->buflen = size;
    return b;
}

/*

=item C<void *
Parrot_reallocate_string(struct Parrot_Interp *interpreter, STRING *str,
                         size_t size)>

Reallocates the string buffer in C<*str> and returns it. C<size> is the
number of C<sizeof(int)> units of memory required.


=cut

*/

void *
Parrot_reallocate_string(struct Parrot_Interp *interpreter, STRING *str,
                         size_t size)
{
    void *p;
    size_t pad;
    if (!str->bufstart)
        Parrot_allocate_string(interpreter, str, size);
    else if (size) {
        pad = STRING_ALIGNMENT - 1;
        size = ((size + pad + sizeof(int)) & ~pad);
        p = xrealloc((char *)((int*)str->bufstart - 1), size);
        str->bufstart = str->strstart = (char *)p + sizeof(int);
        /* usable size at bufstart */
        str->buflen = size - sizeof(int);
    }
    return str->strstart;
}

/*

=item C<void *
Parrot_allocate_string(struct Parrot_Interp *interpreter, STRING *str,
                       size_t size)>

Allocates the string buffer in C<*str> and returns it. C<size> is the
number of C<sizeof(int)> units of memory required.

=cut

*/

void *
Parrot_allocate_string(struct Parrot_Interp *interpreter, STRING *str,
                       size_t size)
{
    void *p;
    size_t pad;
    pad = STRING_ALIGNMENT - 1;
    size = ((size + pad + sizeof(int)) & ~pad);
    p = xcalloc(1, size);
    *(int*)p = 0;
    str->bufstart = str->strstart = (char *)p + sizeof(int);
    str->buflen = size - sizeof(int);
    return str;
}

/*

=item C<void
Parrot_initialize_memory_pools(struct Parrot_Interp *interpreter)>

Does nothing.

=cut

*/

void
Parrot_initialize_memory_pools(struct Parrot_Interp *interpreter)
{
}

/*

=item C<void
Parrot_destroy_memory_pools(Interp *interpreter)>

Does nothing.

=cut

*/

void
Parrot_destroy_memory_pools(Interp *interpreter)
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
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
