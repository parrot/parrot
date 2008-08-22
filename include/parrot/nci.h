/* nci.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     The nci API handles building native call frames
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_NCI_H_GUARD
#define PARROT_NCI_H_GUARD

#include "parrot/parrot.h"

void *build_call_func(PARROT_INTERP, SHIM(PMC *pmc_nci), NOTNULL(STRING *signature), NOTNULL(int *jitted));

#endif /* PARROT_NCI_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
