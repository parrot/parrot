/* vtables.c
 *  Copyright: 2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Functions to build and manipulate vtables
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

VTABLE *
Parrot_new_vtable(Parrot_Interp interpreter) {
    return mem_sys_allocate_zeroed(sizeof(VTABLE));
}

VTABLE *
Parrot_clone_vtable(Parrot_Interp interpreter, VTABLE *base_vtable) {
    VTABLE *new_vtable = mem_sys_allocate(sizeof(VTABLE));
    if (new_vtable) {
        memcpy(new_vtable, base_vtable, sizeof(VTABLE));
    }
    return new_vtable;
}

void
Parrot_vtable_set_type(Parrot_Interp interpreter, VTABLE *vtable, INTVAL type) {
    vtable->base_type = type;
}

void
Parrot_vtable_set_name(Parrot_Interp interpreter, VTABLE *vtable, STRING *whoami) {
    vtable->whoami = whoami;
}

void
Parrot_vtable_set_data(Parrot_Interp interpreter, VTABLE *vtable, void *stuff) {
    vtable->data = stuff;
}

void
Parrot_destroy_vtable(Parrot_Interp interpreter, VTABLE *vtable) {
    mem_sys_free(vtable);
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
