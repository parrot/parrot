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
Parrot_new_vtable(Parrot_Interp *interpreter) {
  return mem_sys_allocate_zeroed(sizeof(VTABLE));
}

VTABLE *
Parrot_clone_vtable(Parrot_Interp *interpreter, VTABLE *base_vtable) {
  VTABLE *new_vtable = mem_sys_allocate(sizeof(VTABLE));
  if (new_vtable) {
    memcpy(new_vtable, base_vtable, sizeof(VTABLE));
  }
  return new_vtable;
}

void
Parrot_destroy_vtable(Parrot_Interp *interpreter, VTABLE *vtable) {
  mem_sys_free(vtable);
}
