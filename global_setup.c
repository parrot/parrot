/* global_setup.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *      Performs all the global setting up of things. This includes the
 *      (very few) global variables that Parrot totes around
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#define INSIDE_GLOBAL_SETUP
#include "parrot/parrot.h"

/* Needed because this might get compiled before pmcs have been built */
void Parrot_PerlUndef_class_init(void);
void Parrot_PerlInt_class_init(void);
void Parrot_PerlNum_class_init(void);
void Parrot_PerlString_class_init(void);
void Parrot_PerlArray_class_init(void);
void Parrot_PerlHash_class_init(void);
void Parrot_IntQueue_class_init(void);

void
init_world(void) {
    string_init(); /* Set up the string subsystem */
    
    /* Call base vtable class constructor methods! */
    Parrot_PerlUndef_class_init();
    Parrot_PerlInt_class_init();
    Parrot_PerlNum_class_init();
    Parrot_PerlString_class_init();
    Parrot_PerlArray_class_init();
    Parrot_PerlHash_class_init();
    Parrot_ParrotPointer_class_init();
    Parrot_IntQueue_class_init();
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
