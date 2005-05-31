/* hll.h
 *  Copyright: 2005 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
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

INTVAL Parrot_register_HLL(Interp*, STRING *hll_name, STRING *hll_lib);
INTVAL Parrot_get_HLL_id(Interp*, STRING *hll_name);
void Parrot_register_HLL_type(Interp *, INTVAL hll_id,
	INTVAL core_type, INTVAL hll_type);
INTVAL Parrot_get_HLL_type(Interp *, INTVAL hll_id, INTVAL core_type);
INTVAL Parrot_get_ctx_HLL_type(Interp *, INTVAL core_type);

#endif /* PARROT_HLL_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
