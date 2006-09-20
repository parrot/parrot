/* hll.h
 *  Copyright (C) 2005, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the api header for the hll subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_HLL_H_GUARD)
#define PARROT_HLL_H_GUARD

/* this invalid HLL type means "no HLL" when passed to the below functions */
#define PARROT_HLL_NONE -1

/* this is guaranteed always to be the internal "parrot" pseudo-HLL */
#define PARROT_HLL_PARROT 0

PARROT_API INTVAL Parrot_register_HLL(Interp*, STRING *hll_name, STRING *hll_lib);
PARROT_API INTVAL Parrot_get_HLL_id(Interp*, STRING *hll_name);
PARROT_API STRING *Parrot_get_HLL_name(Interp*, INTVAL id);

PARROT_API void Parrot_register_HLL_type(Interp *, INTVAL hll_id,
	INTVAL core_type, INTVAL hll_type);
PARROT_API INTVAL Parrot_get_HLL_type(Interp *, INTVAL hll_id, INTVAL core_type);
PARROT_API INTVAL Parrot_get_ctx_HLL_type(Interp *, INTVAL core_type);

PARROT_API PMC *Parrot_get_HLL_namespace(Interp *, int hll_id);
PARROT_API PMC *Parrot_get_ctx_HLL_namespace(Interp *);

PARROT_API void Parrot_regenerate_HLL_namespaces(Interp *);

#endif /* PARROT_HLL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
