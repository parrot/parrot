/* global_setup.h
 *  Copyright: (When this is determined...it will go here)
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

/* Needed because this might get compiled before pmcs have been built */
void Parrot_PerlUndef_class_init(INTVAL);
void Parrot_PerlInt_class_init(INTVAL);
void Parrot_PerlNum_class_init(INTVAL);
void Parrot_PerlString_class_init(INTVAL);
void Parrot_PerlArray_class_init(INTVAL);
void Parrot_PerlHash_class_init(INTVAL);
void Parrot_ParrotPointer_class_init(INTVAL);
void Parrot_IntQueue_class_init(INTVAL);

void
init_world(void);

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
