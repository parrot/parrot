/* intlists.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Regex stack handling routines for Parrot
 *
 * intlist emulation code, calls routines in list.c
 *
 * here is the original docu for intlist
 *
 *  Data Structure and Algorithms:
 *
 *     The basic data structure is a variant of a doubly-linked list
 *     of 'chunks', where a chunk is a Buffer header subclass
 *     containing the link pointers and other metadata for the chunk.
 *     As expected from it being a Buffer header, the .bufstart field
 *     points to the actual array of INTVALs. The handle used by
 *     external code for one of these IntLists is just a pointer to a
 *     chunk, always called 'list' in this code.
 *
 *     For now, all of the chunks are fixed-length in size. (That
 *     could easily be changed, at the cost of another integer in each
 *     header.)
 *
 *     Notice that I said 'variant' of a doubly-linked list. That is
 *     because if you start at 'list' and follow prev pointers, you
 *     will loop through all the used nodes of the list, as usual. But
 *     if you follow next pointers instead, you might find a spare
 *     node hanging off the last node in the list (the last node is
 *     always list->prev, so if there is a spare node, it will be at
 *     list->prev->next. If no spare exists, then
 *     list->prev->next==list.)
 *
 *     The first node in the list may be partly full; the intermediate
 *     nodes are always completely full; and the last node may be
 *     partly full. Each node has a .start field, giving the offset of
 *     the first valid element (always zero except for possibly the
 *     first node), and a .end field, giving one past the offset of
 *     the last valid element (always equal to INTLIST_CHUNK_SIZE
 *     except for possibly the last node).
 *
 *     To make it concrete, let's walk through some sample operations.
 *     To push onto the end of the list, first find the last chunk:
 *     list->prev. Then if chunk->end < INTLIST_CHUNK_SIZE, there is
 *     space to fit another element and so just stick it in. If not,
 *     we must add a chunk to the end of the list. If there is a
 *     spare, just link it fully into the list (forming a conventional
 *     doubly-linked list). Otherwise, create a new chunk and link it
 *     fully into the list. Easy enough.
 *
 *     To pop something off the end, first go to the end chunk
 *     (list->prev). Pop off an element and decrement .end if the
 *     chunk is nonempty. If it is empty, make that last chunk into
 *     the spare (discarding the previous spare). Then go to the
 *     previous chunk, which is guaranteed to have .end set to
 *     INTLIST_CHUNK_SIZE, and return data[.end--].
 *
 *     The length of the list is always cached in the overall header
 *     chunk. If an operation changes which chunk is the header (i.e.,
 *     shift or unshift), then the length is copied to the new header.
 *
 *     Invariants:
 *
 *     There is always space in list->prev to insert an element.
 *
 *     The 'list' chunk is never empty unless the entire list is
 *     empty.
 *
 *     In combination, the above invariants imply that the various
 *     operations are implemented as:
 *
 *     push: write element, push a new chunk if necessary
 *     pop: check to see if we have to back up a chunk, read element
 *     shift: read element, discard chunk and advance if necessary
 *     unshift: unshift a chunk if necessary, write element
 *
 *     Direct aka indexed access of intlist data:
 *
 *     The classic method would be to walk the intlist->next pointers
 *     (or optimized, the ->prev pointers if an index near the end is
 *     requested) and locate the chunk, that holds the wanted list
 *     item.
 *     To speed things up, especially for bigger lists, there are
 *     additional fields in the 'list' (the head chunk):
 *     chunk_list  ... holds pointers to individual chunks
 *     collect_runs ... collect_runs counter, when chunk_list was
 *                     rebuilt last.
 *     n_chunks ... used length in chunk_list
 *
 *     If on any indexed access interpreter's collect_runs is
 *     different, the chunks might have been moved, so the chunk_list
 *     has to be rebuilt.
 */


/* getting data outside the array dimensions will
 * return the value NULL, which will SIGSEGV, the intlist did
 * an explicit exception, so there is not much difference.
 * Of course, a check for valid pointers could be added here.
 */

#include <parrot/parrot.h>

void
intlist_mark(Interp *i, IntList *l)
{
    list_mark(i, (List *)l);
}

IntList *
intlist_clone(Interp *i, IntList *list)
{
    return (IntList *)list_clone(i, (List *)list);
}

IntList *
intlist_new(Interp *i)
{
    return (IntList *)list_new(i, enum_type_INTVAL);
}

INTVAL
intlist_length(Interp *interpreter, IntList *list)
{
    UNUSED(interpreter);
    return ((List *)list)->length;
}

void
intlist_assign(Interp *i, IntList *l, INTVAL idx, INTVAL val)
{
    list_assign(i, (List *)l, idx, INTVAL2PTR(void *, val), enum_type_INTVAL);
}

void
intlist_push(Interp *i, IntList *l, INTVAL val)
{
    list_push(i, (List *)l, INTVAL2PTR(void *, val), enum_type_INTVAL);
}

void
intlist_unshift(Interp *i, IntList **l, INTVAL val)
{
    list_unshift(i, (List *)*l, INTVAL2PTR(void *, val), enum_type_INTVAL);
}

/* popping /shifting into a sparse hole returns 0 */

INTVAL
intlist_pop(Interp *i, IntList *l)
{
    void *ret = list_pop(i, (List *)l, enum_type_INTVAL);
    INTVAL retval = ret == (void *)-1 ? 0 : *(INTVAL *)ret;
    return retval;
}

INTVAL
intlist_shift(Interp *i, IntList **l)
{
    void *ret = list_shift(i, (List *)*l, enum_type_INTVAL);
    INTVAL retval = ret == (void *)-1 ? 0 : *(INTVAL *)ret;
    return retval;
}

INTVAL
intlist_get(Interp *i, IntList *l, INTVAL idx)
{
    void *ret = list_get(i, (List *)l, idx, enum_type_INTVAL);
    INTVAL retval = ret == (void *)-1 ? 0 : *(INTVAL *)ret;
    return retval;
}

void
intlist_dump(FILE *fp, IntList *list, int verbose)
{
#ifdef LIST_DEBUG
    list_dump(fp, (List *)list, verbose);
#endif
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
