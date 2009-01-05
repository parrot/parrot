/*
Copyright (C) 2001-2008, The Perl Foundation.
$Id$

=head1 NAME

src/intlists.c - Regex stack handling routines

=head1 DESCRIPTION

intlist emulation code, calls routines in F<src/list.c>.

Here is the original documentation for intlist:

The basic data structure is a variant of a doubly-linked list
of 'chunks', where a chunk is a C<Buffer> header subclass
containing the link pointers and other metadata for the chunk.
As expected from it being a C<Buffer> header, the C<PObj_bufstart>
field points to the actual array of C<INTVAL>s. The handle used by
external code for one of these IntLists is just a pointer to a
chunk, always called 'list' in this code.

For now, all of the chunks are fixed-length in size. (That
could easily be changed, at the cost of another integer in each
header.)

Notice that I said 'variant' of a doubly-linked list. That is
because if you start at 'list' and follow prev pointers, you
will loop through all the used nodes of the list, as usual. But
if you follow next pointers instead, you might find a spare
node hanging off the last node in the list (the last node is
always C<< list->prev >>, so if there is a spare node, it will be at
C<< list->prev->next >>. If no spare exists, then
C<< list->prev->next==list >>.)

The first node in the list may be partly full; the intermediate
nodes are always completely full; and the last node may be
partly full. Each node has a C<.start> field, giving the offset of
the first valid element (always zero except for possibly the
first node), and a C<.end> field, giving one past the offset of
the last valid element (always equal to C<INTLIST_CHUNK_SIZE>
except for possibly the last node).

To make it concrete, let's walk through some sample operations.
To push onto the end of the list, first find the last chunk:
C<< list->prev >>. Then if C<< chunk->end < INTLIST_CHUNK_SIZE >>, there is
space to fit another element and so just stick it in. If not,
we must add a chunk to the end of the list. If there is a
spare, just link it fully into the list (forming a conventional
doubly-linked list). Otherwise, create a new chunk and link it
fully into the list. Easy enough.

To pop something off the end, first go to the end chunk
(C<< list->prev >>). Pop off an element and decrement C<.end> if the
chunk is nonempty. If it is empty, make that last chunk into
the spare (discarding the previous spare). Then go to the
previous chunk, which is guaranteed to have C<.end> set to
C<INTLIST_CHUNK_SIZE>, and return C<data[.end--]>.

The length of the list is always cached in the overall header
chunk. If an operation changes which chunk is the header (i.e.,
shift or unshift), then the length is copied to the new header.

Invariants:

There is always space in C<< list->prev >> to insert an element.

The 'list' chunk is never empty unless the entire list is
empty.

In combination, the above invariants imply that the various
operations are implemented as:

=over 4

=item C<push>

Write element, push a new chunk if necessary.

=item C<pop>

Check to see if we have to back up a chunk, read element.

=item C<shift>

Read element, discard chunk and advance if necessary.

=item C<unshift>

Unshift a chunk if necessary, write element.

=back

Direct aka indexed access of intlist data:

The classic method would be to walk the C<< intlist->next >> pointers
(or optimized, the C<< ->prev >> pointers if an index near the end is
requested) and locate the chunk, that holds the wanted list
item.

To speed things up, especially for bigger lists, there are
additional fields in the 'list' (the head chunk):

=over 4

=item C<chunk_list>

Holds pointers to individual chunks.

=item C<collect_runs>

C<collect_runs> counter, when C<chunk_list> was rebuilt last.

=item C<n_chunks>

Used length in C<chunk_list>

=back

If on any indexed access interpreter's collect_runs is
different, the chunks might have been moved, so the chunk_list
has to be rebuilt.

Getting data outside the array dimensions will
return the value C<NULL>, which will C<SIGSEGV>, the intlist did
an explicit exception, so there is not much difference.
Of course, a check for valid pointers could be added here.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/* HEADERIZER HFILE: include/parrot/intlist.h */

/*

=item C<void intlist_mark>

Marks the list as live.

=cut

*/

void
intlist_mark(PARROT_INTERP, ARGMOD(IntList *l))
{
    ASSERT_ARGS(intlist_mark)
    list_mark(interp, (List *)l);
}

/*

=item C<IntList * intlist_clone>

Returns a clone of the list.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
IntList *
intlist_clone(PARROT_INTERP, ARGIN(const IntList *list))
{
    ASSERT_ARGS(intlist_clone)
    return (IntList *)list_clone(interp, (const List *)list);
}

/*

=item C<IntList * intlist_new>

Returns a new list.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
IntList *
intlist_new(PARROT_INTERP)
{
    ASSERT_ARGS(intlist_new)
    return (IntList *)list_new(interp, enum_type_INTVAL);
}

/*

=item C<INTVAL intlist_length>

Returns the length of the list.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
INTVAL
intlist_length(SHIM_INTERP, ARGIN(const IntList *list))
{
    ASSERT_ARGS(intlist_length)
    return ((const List *)list)->length;
}

/*

=item C<void intlist_assign>

Assigns <val> to the item at C<idx>.

=cut

*/

void
intlist_assign(PARROT_INTERP, ARGMOD(IntList *l), INTVAL idx, INTVAL val)
{
    ASSERT_ARGS(intlist_assign)
    list_assign(interp, (List *)l, idx, INTVAL2PTR(void *, val), enum_type_INTVAL);
}

/*

=item C<void intlist_push>

Pushes C<val> on the end of the list.

=cut

*/

void
intlist_push(PARROT_INTERP, ARGMOD(IntList *l), INTVAL val)
{
    ASSERT_ARGS(intlist_push)
    list_push(interp, (List *)l, INTVAL2PTR(void *, val), enum_type_INTVAL);
}

/*

=item C<void intlist_unshift>

Pushes C<val> on the front of the list.

=cut

*/

void
intlist_unshift(PARROT_INTERP, ARGMOD(IntList **l), INTVAL val)
{
    ASSERT_ARGS(intlist_unshift)
    list_unshift(interp, (List *)*l, INTVAL2PTR(void *, val), enum_type_INTVAL);
}

/*

=item C<INTVAL intlist_pop>

Popping/shifting into a sparse hole returns 0.

=cut

*/

INTVAL
intlist_pop(PARROT_INTERP, ARGMOD(IntList *l))
{
    ASSERT_ARGS(intlist_pop)
    void * const ret = list_pop(interp, (List *)l, enum_type_INTVAL);
    const INTVAL retval = ret == (void *)-1 ? 0 : *(INTVAL *)ret;
    return retval;
}

/*

=item C<INTVAL intlist_shift>

Removes and returns the first item on the list.

=cut

*/

INTVAL
intlist_shift(PARROT_INTERP, ARGMOD(IntList **l))
{
    ASSERT_ARGS(intlist_shift)
    void * const ret = list_shift(interp, (List *)*l, enum_type_INTVAL);
    const INTVAL retval = ret == (void *)-1 ? 0 : *(INTVAL *)ret;
    return retval;
}

/*

=item C<INTVAL intlist_get>

Returns the item at C<idx>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
intlist_get(PARROT_INTERP, ARGMOD(IntList *list), INTVAL idx)
{
    ASSERT_ARGS(intlist_get)
    void * const ret = list_get(interp, (List *)list, idx, enum_type_INTVAL);
    if (ret)
        return *(INTVAL *)ret;

    return (INTVAL)0;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/intlist.h>, F<src/list.c> and F<include/parrot/list.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
