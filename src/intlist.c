/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/intlists.c - Regex stack handling routines

=head1 DESCRIPTION

intlist emulation code, calls routines in F<src/list.c>.

Here is the original documentation for intlist:

The basic data structure is a variant of a doubly-linked list
of 'chunks', where a chunk is a C<Buffer> header subclass
containing the link pointers and other metadata for the chunk.
As expected from it being a C<Buffer> header, the C<.bufstart> field
points to the actual array of C<INTVAL>s. The handle used by
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
always C<<list->prev>>, so if there is a spare node, it will be at
C<<list->prev->next>>. If no spare exists, then
C<<list->prev->next==list>>.)

The first node in the list may be partly full; the intermediate
nodes are always completely full; and the last node may be
partly full. Each node has a C<.start> field, giving the offset of
the first valid element (always zero except for possibly the
first node), and a C<.end> field, giving one past the offset of
the last valid element (always equal to C<INTLIST_CHUNK_SIZE>
except for possibly the last node).

To make it concrete, let's walk through some sample operations.
To push onto the end of the list, first find the last chunk:
C<<list->prev>>. Then if C<<chunk->end < INTLIST_CHUNK_SIZE>>, there is
space to fit another element and so just stick it in. If not,
we must add a chunk to the end of the list. If there is a
spare, just link it fully into the list (forming a conventional
doubly-linked list). Otherwise, create a new chunk and link it
fully into the list. Easy enough.

To pop something off the end, first go to the end chunk
(C<<list->prev>>). Pop off an element and decrement C<.end> if the
chunk is nonempty. If it is empty, make that last chunk into
the spare (discarding the previous spare). Then go to the
previous chunk, which is guaranteed to have C<.end> set to
C<INTLIST_CHUNK_SIZE>, and return C<data[.end--]>.

The length of the list is always cached in the overall header
chunk. If an operation changes which chunk is the header (i.e.,
shift or unshift), then the length is copied to the new header.

Invariants:

There is always space in C<<list->prev>> to insert an element.

The 'list' chunk is never empty unless the entire list is
empty.

In combination, the above invariants imply that the various
operations are implemented as:

=over 4

=item C<push>

Write element, push a new chunk if necessary.

item C<pop>

Check to see if we have to back up a chunk, read element.

=item C<shift>

Read element, discard chunk and advance if necessary.

=item C<unshift>

Unshift a chunk if necessary, write element.

=back

Direct aka indexed access of intlist data:

The classic method would be to walk the C<<intlist->next>> pointers
(or optimized, the C<<->prev>> pointers if an index near the end is
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

#include <parrot/parrot.h>

/*

=item C<void
intlist_mark(Interp *i, IntList *l)>

Marks the list as live.

=cut

*/

void
intlist_mark(Interp *i, IntList *l)
{
    list_mark(i, (List *)l);
}

/*

=item C<IntList *
intlist_clone(Interp *i, IntList *list)>

Returns a clone of the list.

=cut

*/

IntList *
intlist_clone(Interp *i, IntList *list)
{
    return (IntList *)list_clone(i, (List *)list);
}

/*

=item C<IntList *
intlist_new(Interp *i)>

Returns a new list.

=cut

*/

IntList *
intlist_new(Interp *i)
{
    return (IntList *)list_new(i, enum_type_INTVAL);
}

/*

=item C<INTVAL
intlist_length(Interp *interpreter, IntList *list)>

Returns the length of the list.

=cut

*/

INTVAL
intlist_length(Interp *interpreter, IntList *list)
{
    UNUSED(interpreter);
    return ((List *)list)->length;
}

/*

=item C<void
intlist_assign(Interp *i, IntList *l, INTVAL idx, INTVAL val)>

Assigns <val> to the item at C<idx>.

=cut

*/

void
intlist_assign(Interp *i, IntList *l, INTVAL idx, INTVAL val)
{
    list_assign(i, (List *)l, idx, INTVAL2PTR(void *, val), enum_type_INTVAL);
}

/*

=item C<void
intlist_push(Interp *i, IntList *l, INTVAL val)>

Pushes C<val> on the end of the list.

=cut

*/

void
intlist_push(Interp *i, IntList *l, INTVAL val)
{
    list_push(i, (List *)l, INTVAL2PTR(void *, val), enum_type_INTVAL);
}

/*

=item C<void
intlist_unshift(Interp *i, IntList **l, INTVAL val)>

Pushes C<val> on the front of the list.

=cut

*/

void
intlist_unshift(Interp *i, IntList **l, INTVAL val)
{
    list_unshift(i, (List *)*l, INTVAL2PTR(void *, val), enum_type_INTVAL);
}

/*

=item C<INTVAL
intlist_pop(Interp *i, IntList *l)>

Popping/shifting into a sparse hole returns 0.

=cut

*/

INTVAL
intlist_pop(Interp *i, IntList *l)
{
    void *ret = list_pop(i, (List *)l, enum_type_INTVAL);
    INTVAL retval = ret == (void *)-1 ? 0 : *(INTVAL *)ret;
    return retval;
}

/*

=item C<INTVAL
intlist_shift(Interp *i, IntList **l)>

Removes and returns the first item on the list.

=cut

*/

INTVAL
intlist_shift(Interp *i, IntList **l)
{
    void *ret = list_shift(i, (List *)*l, enum_type_INTVAL);
    INTVAL retval = ret == (void *)-1 ? 0 : *(INTVAL *)ret;
    return retval;
}

/*

=item C<INTVAL
intlist_get(Interp *i, IntList *l, INTVAL idx)>

Returns the item at C<idx>.

=cut

*/

INTVAL
intlist_get(Interp *i, IntList *l, INTVAL idx)
{
    void *ret = list_get(i, (List *)l, idx, enum_type_INTVAL);
    INTVAL retval = ret == (void *)-1 ? 0 : *(INTVAL *)ret;
    return retval;
}

/*

=item C<void
intlist_dump(FILE *fp, IntList *list, int verbose)>

Prints out the list in human-readable form.

=cut

*/

void
intlist_dump(FILE *fp, IntList *list, int verbose)
{
#ifdef LIST_DEBUG
    list_dump(fp, (List *)list, verbose);
#endif
}

/*

=back

=head1 SEE ALSO

F<include/parrot/intlist.h>, F<src/list.c> and F<include/parrot/list.h>.

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
