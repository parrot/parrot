/* method_util.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Utilities to help in writing methods.
 *  Data Structure and Algorithms:
 *  History:
 *     Initial revision by sean 2002/08/04
 *  Notes:
 *  References:
 */

#if !defined(PARROT_METHOD_UTIL_H_GUARD)
#define PARROT_METHOD_UTIL_H_GUARD

#include "parrot/pmc.h"
#include "parrot/config.h"

void Parrot_push_argv(Interp * interp, INTVAL argc, PMC * argv[]);
INTVAL Parrot_pop_argv(Interp * interp, PMC *** argv);
void Parrot_push_proto(Interp * interp,
                       INTVAL intc, INTVAL * intv,
                       INTVAL numc, FLOATVAL * numv,
                       INTVAL strc, STRING ** strv,
                       INTVAL pmcc, PMC ** pmcv);

typedef INTVAL (*Parrot_csub_t)(Interp * , PMC * );
PMC * Parrot_new_csub(Interp * interp, Parrot_csub_t func);

struct method_rec_t {
    char * name;
    Parrot_csub_t sub;
};

void Parrot_init_stash(Interp * interp, struct method_rec_t * recp,
                       struct Stash * stash);

PMC * Parrot_find_method(Interp * interp, struct Stash * stash,
                         PMC * key);


#endif /* PARROT_METHOD_UTIL_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
