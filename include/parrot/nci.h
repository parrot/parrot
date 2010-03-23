/* nci.h
 *  Copyright (C) 2001-2007, Parrot Foundation.
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

PMC *build_call_func(PARROT_INTERP, NOTNULL(STRING *signature));

void Parrot_nci_load_core_thunks(PARROT_INTERP);

void Parrot_nci_load_extra_thunks(PARROT_INTERP);

#endif /* PARROT_NCI_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
