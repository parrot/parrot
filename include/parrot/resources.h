/* register.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Defines the resource allocation API
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_RESOURCES_H_GUARD)
#define PARROT_RESOURCES_H_GUARD

#include "parrot/parrot.h"

PMC *new_pmc_header(struct Parrot_Interp *);
void free_pmc(PMC *);

STRING *new_string_header(struct Parrot_Interp *);
void free_string(STRING *);

void *new_bigint_header(struct Parrot_Interp *);
void free_bigint(void);

void *new_bignum_header(struct Parrot_Interp *);
void free_bignum(void);

#endif /* PARROT_RESOURCES_H */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
