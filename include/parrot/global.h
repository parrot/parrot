/* global.h
 *  Copyright: 2004 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
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

PMC *Parrot_find_global(Interp *, STRING *class, STRING *globalname);
PMC *Parrot_global_namespace(Interp *, PMC *globals, STRING *ns);
void Parrot_store_global(Interp *, STRING *class, STRING *globalname, PMC *pmc);

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


