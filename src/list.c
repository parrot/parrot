/*
Copyright (C) 2010, Parrot Foundation.
$Id$

=head1 NAME

src/list.c - Implementation of double linked lists.

=head1 DESCRIPTION

This code implements double linked list of GCable objects.

=cut

*/

#include "parrot/parrot.h"
#include "parrot/list.h"

/* HEADERIZER HFILE: include/parrot/list.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=over 4

=item C<struct Linked_List* Parrot_list_new(PARROT_INTERP)>

Allocate a doubly link list

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
struct Linked_List*
Parrot_list_new(SHIM_INTERP)
{
    ASSERT_ARGS(Parrot_list_new)

    Linked_List *res = (Linked_List*)mem_sys_allocate_zeroed(sizeof (Linked_List));
    return res;
}

/*

=item C<void Parrot_list_destroy(PARROT_INTERP, Linked_List* list)>

Destroy the specified list (free up memory associated with the list)

=cut

*/

PARROT_EXPORT
void
Parrot_list_destroy(SHIM_INTERP, ARGMOD(Linked_List* list))
{
    ASSERT_ARGS(Parrot_list_destroy)

    mem_sys_free(list);
}

/*

=item C<void Parrot_list_append(PARROT_INTERP, Linked_List *list,
List_Item_Header *item)>

Append an item to the list

=cut

*/

PARROT_EXPORT
void
Parrot_list_append(SHIM_INTERP, ARGMOD(Linked_List *list), ARGMOD(List_Item_Header *item))
{
    ASSERT_ARGS(Parrot_list_append)

    item->prev = item->next = NULL;

    if (list->last) {
        item->prev = list->last;
        list->last->next = item;
    }

    list->last = item;

    if (!list->first)
        list->first = item;

    list->count++;
#ifndef NDEBUG
    item->owner = list;
#endif
}

/*

=item C<List_Item_Header* Parrot_list_remove(PARROT_INTERP, Linked_List *list,
List_Item_Header *item)>

Remove an item from the list, returning the (pointer to) item

=cut

*/

PARROT_EXPORT
List_Item_Header*
Parrot_list_remove(SHIM_INTERP, ARGMOD(Linked_List *list), ARGMOD(List_Item_Header *item))
{
    ASSERT_ARGS(Parrot_list_remove)

    List_Item_Header *next = item->next;
    List_Item_Header *prev = item->prev;

    PARROT_ASSERT(list == item->owner);

    /* First item */
    if (list->first == item)
        list->first = next;

    if (list->last == item)
        list->last = prev;

    if (prev)
        prev->next = next;
    if (next)
        next->prev = prev;

    list->count--;
    return item;
}

/*

=item C<List_Item_Header* Parrot_list_pop(PARROT_INTERP, Linked_List *list)>

Pop an item off the list - i.e. get the first item in the list and remove it.

=cut

*/

PARROT_EXPORT
List_Item_Header*
Parrot_list_pop(PARROT_INTERP, ARGIN(Linked_List *list))
{
    ASSERT_ARGS(Parrot_list_pop)

    List_Item_Header *ret = list->first;
    if (ret)
        LIST_REMOVE(list, ret);
    return ret;
}

/*

=item C<INTVAL Parrot_list_check(PARROT_INTERP, Linked_List *list)>

Check the validity of the list

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_list_check(SHIM_INTERP, ARGIN(Linked_List *list))
{
    ASSERT_ARGS(Parrot_list_check)

    List_Item_Header *tmp = list->first;
    size_t counter = 0;

    while (tmp) {
        List_Item_Header *next = tmp->next;
        PARROT_ASSERT(tmp->owner == list);
        tmp = next;
        ++counter;
        PARROT_ASSERT(counter <= list->count);
    }

    return 1;
}

/*

=item C<INTVAL Parrot_list_contains(PARROT_INTERP, Linked_List *list,
List_Item_Header *item)>

Returns True if the is in the list

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_list_contains(SHIM_INTERP, ARGIN(Linked_List *list), ARGIN(List_Item_Header *item))
{
    ASSERT_ARGS(Parrot_list_contains)

    List_Item_Header *tmp = list->first;

#ifndef NDEBUG
    if (item->owner != list)
        return 0;
#endif

    while (tmp) {
        if (tmp == item)
            return 1;
        tmp = tmp->next;
    }

    return 0;
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
