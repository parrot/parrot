/* global.h
 *  Copyright (C) 2004, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *      Contains accessor functions for globals
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_GLOBAL_H_GUARD)
#define PARROT_GLOBAL_H_GUARD

PARROT_API PMC *Parrot_find_global(Interp *, STRING *class, STRING *name);
PARROT_API PMC *Parrot_get_global(Interp *, STRING *class,  STRING *name, void *next);
PARROT_API PMC *Parrot_find_global_p(Interp *, PMC *ns, STRING *name);
PARROT_API PMC *Parrot_get_global_p(Interp *, PMC *ns,  STRING *name);
PARROT_API PMC *Parrot_global_namespace(Interp *, PMC *globals, STRING *ns);
PARROT_API void Parrot_store_global(Interp *, STRING *class, STRING *globalname, PMC *pmc);
PARROT_API void Parrot_store_sub_in_namespace(Interp*, PMC* sub_pmc);

PARROT_API PMC *Parrot_get_name(Interp *, STRING *name);
#endif /* PARROT_GLOBAL_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/


