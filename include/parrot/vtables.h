/* vtables.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Vtable manipulation code. Not to be confused with vtable.h
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_VTABLES_H_GUARD)
#define PARROT_VTABLES_H_GUARD

PARROT_API VTABLE *Parrot_new_vtable(Interp*);
PARROT_API VTABLE *Parrot_clone_vtable(Interp*, const VTABLE *base_vtable);
PARROT_API void Parrot_destroy_vtable(Interp*, VTABLE *vtable);

void parrot_alloc_vtables(Interp *);
void parrot_realloc_vtables(Interp *);
void parrot_free_vtables(Interp *);

#endif /* PARROT_VTABLES_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
