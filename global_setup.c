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

void
init_world(void) {
    string_init(); /* Set up the string subsystem */
    
    /* Call base vtable class constructor methods! */
    Parrot_Array_class_init(enum_class_Array);
    Parrot_PerlUndef_class_init(enum_class_PerlUndef);
    Parrot_PerlInt_class_init(enum_class_PerlInt);
    Parrot_PerlNum_class_init(enum_class_PerlNum);
    Parrot_PerlString_class_init(enum_class_PerlString);
    Parrot_PerlArray_class_init(enum_class_PerlArray);
    Parrot_PerlHash_class_init(enum_class_PerlHash);
    Parrot_ParrotPointer_class_init(enum_class_ParrotPointer);
    Parrot_IntQueue_class_init(enum_class_IntQueue);
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
