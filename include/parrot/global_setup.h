/* global_setup.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *      Contains declarations of global data and the functions
 *      that initialize that data.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_GLOBAL_SETUP_H_GUARD)
#define PARROT_GLOBAL_SETUP_H_GUARD

#include "parrot/config.h"
#include "parrot/interpreter.h"


void init_world(Interp * interp);

#endif /* PARROT_GLOBAL_SETUP_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
