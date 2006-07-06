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

PARROT_API PMC *Parrot_find_namespace_k(Interp *, PMC *ns_key);
PARROT_API PMC *Parrot_find_namespace_s(Interp *, STRING *ns_name);
PARROT_API PMC *Parrot_find_namespace_gen(Interp *, int hll_id, PMC *ns_key, STRING *ns_name);

PARROT_API PMC *Parrot_make_namespace_k(Interp *, PMC *ns_key);
PARROT_API PMC *Parrot_make_namespace_s(Interp *, STRING *ns_name);
PARROT_API PMC *Parrot_make_namespace_gen(Interp *, int hll_id, PMC *ns_key, STRING *ns_name);

PARROT_API PMC *Parrot_find_global_cur(Interp *,                STRING *globalname);
PARROT_API PMC *Parrot_find_global_n(Interp *, PMC    *ns,      STRING *globalname);
PARROT_API PMC *Parrot_find_global_k(Interp *, PMC    *ns_key,  STRING *globalname);
PARROT_API PMC *Parrot_find_global_s(Interp *, STRING *ns_name, STRING *globalname);

PARROT_API void Parrot_store_global_cur(Interp *,                STRING *globalname, PMC *val);
PARROT_API void Parrot_store_global_n(Interp *, PMC    *ns,      STRING *globalname, PMC *val);
PARROT_API void Parrot_store_global_k(Interp *, PMC    *ns_key,  STRING *globalname, PMC *val);
PARROT_API void Parrot_store_global_s(Interp *, STRING *ns_name, STRING *globalname, PMC *val);

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


