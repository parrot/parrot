/* objects.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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
PMC *Parrot_add_parent(Parrot_Interp, PMC *, PMC *);
PMC *Parrot_remove_parent(Parrot_Interp, PMC *, PMC *);
PMC *Parrot_multi_subclass(Parrot_Interp, PMC *, STRING *);
PMC *Parrot_instantiate_object(Parrot_Interp, PMC *);
PMC *Parrot_new_method_cache(Parrot_Interp);
PMC *Parrot_find_method_with_cache(Parrot_Interp, PMC *, STRING *);

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
