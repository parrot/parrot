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

PARROT_API PMC *Parrot_get_namespace_keyed(     Interp *, PMC *base_ns, PMC *pmc_key);
PARROT_API PMC *Parrot_get_namespace_keyed_str( Interp *, PMC *base_ns, STRING *str_key);

PARROT_API PMC *Parrot_make_namespace_keyed(    Interp *, PMC *base_ns, PMC *pmc_key);
PARROT_API PMC *Parrot_make_namespace_keyed_str(Interp *, PMC *base_ns, STRING *str_key);

/*
 * {get,set}_global.
 *
 * Parrot_get_global allows a null namespace without throwing an exception; it
 * simply returns PMCNULL in that case.
 *
 * NOTE: At present the use of the {get,set}_global functions is mandatory due to the
 *       wacky namespace typing of the default Parrot namespace.  Eventually it will be
 *       safe to just use the standard hash interface (if desired).
 */

PARROT_API PMC *Parrot_get_global(Interp *, PMC *ns, STRING *globname);
PARROT_API void Parrot_set_global(Interp *, PMC *ns, STRING *globname, PMC *val);



/*
 * OLD API FOLLOWS.
 * The below functions may be deprecated soon.
 */

PARROT_API PMC *Parrot_find_global_cur(Interp *,                STRING *globalname);
PARROT_API PMC *Parrot_find_global_n(Interp *, PMC    *ns,      STRING *globalname);
PARROT_API PMC *Parrot_find_global_k(Interp *, PMC    *pmc_key, STRING *globalname);
PARROT_API PMC *Parrot_find_global_s(Interp *, STRING *str_key, STRING *globalname);

PARROT_API void Parrot_store_global_cur(Interp *,                STRING *globalname, PMC *val);
PARROT_API void Parrot_store_global_n(Interp *, PMC    *ns,      STRING *globalname, PMC *val);
PARROT_API void Parrot_store_global_k(Interp *, PMC    *pmc_key, STRING *globalname, PMC *val);
PARROT_API void Parrot_store_global_s(Interp *, STRING *str_key, STRING *globalname, PMC *val);

/* helpers for opcode implementation */

PARROT_API PMC *Parrot_find_global_op(Interp *, PMC *ns, STRING *globalname, void *next);
PARROT_API PMC *Parrot_find_name_op(Interp *, STRING *name, void *next);

/* TODO - review the rest - Chip */
PARROT_API void Parrot_store_sub_in_namespace(Interp *, PMC *sub_pmc);

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


