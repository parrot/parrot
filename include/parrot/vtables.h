/* vtables.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
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

VTABLE *Parrot_new_vtable(Parrot_Interp *interpreter);
VTABLE *Parrot_clone_vtable(Parrot_Interp *interpreter, VTABLE *base_vtable);
void Parrot_destroy_vtable(Parrot_Interp *interpreter, VTABLE *vtable);

#endif
