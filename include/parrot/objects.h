/* objects.h
 *  Copyright: 2003, Yet Another Society
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Parrot class and object header stuff
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_OBJECTS_H_GUARD) 
#define PARROT_OBJECTS_H_GUARD

#include "parrot/parrot.h"

PMC *Parrot_single_subclass(Parrot_Interp, PMC *, STRING *);
PMC *Parrot_new_class(Parrot_Interp, STRING *);

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
