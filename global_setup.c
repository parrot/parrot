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
extern void Parrot_PerlUndef_class_init(INTVAL);
extern void Parrot_PerlInt_class_init(INTVAL);
extern void Parrot_PerlNum_class_init(INTVAL);
extern void Parrot_PerlString_class_init(INTVAL);
extern void Parrot_Array_class_init(INTVAL);
extern void Parrot_Boolean_class_init(INTVAL);
extern void Parrot_PerlArray_class_init(INTVAL);
extern void Parrot_PerlHash_class_init(INTVAL);
extern void Parrot_Pointer_class_init(INTVAL);
extern void Parrot_IntQueue_class_init(INTVAL);
extern void Parrot_Sub_class_init(INTVAL);
extern void Parrot_Coroutine_class_init(INTVAL);
extern void Parrot_Continuation_class_init(INTVAL);
extern void Parrot_CSub_class_init(INTVAL);
extern void Parrot_MultiArray_class_init(INTVAL);
extern void Parrot_Key_class_init(INTVAL);

static void register_pmc(PMC* registry, int pmc_id)
{
    PMC* key;
    key = key_new_string(NULL, Parrot_base_vtables[pmc_id].name(NULL,NULL));
    registry->vtable->set_integer_keyed(NULL, registry, key, pmc_id);
}

void
init_world(void)
{
    PMC* key;
    string_init();              /* Set up the string subsystem */

    /* Call base vtable class constructor methods! */
    Parrot_Array_class_init(enum_class_Array);
    Parrot_Boolean_class_init(enum_class_Boolean);
    Parrot_PerlUndef_class_init(enum_class_PerlUndef);
    Parrot_PerlInt_class_init(enum_class_PerlInt);
    Parrot_PerlNum_class_init(enum_class_PerlNum);
    Parrot_PerlString_class_init(enum_class_PerlString);
    Parrot_PerlArray_class_init(enum_class_PerlArray);
    Parrot_PerlHash_class_init(enum_class_PerlHash);
    Parrot_Pointer_class_init(enum_class_Pointer);
    Parrot_IntQueue_class_init(enum_class_IntQueue);
    Parrot_Sub_class_init(enum_class_Sub);
    Parrot_Coroutine_class_init(enum_class_Coroutine);
    Parrot_CSub_class_init(enum_class_CSub);
    Parrot_Continuation_class_init(enum_class_Continuation);
    Parrot_MultiArray_class_init(enum_class_MultiArray);
    Parrot_Key_class_init(enum_class_Key);

    /* Now register the names of the PMCs */

    /* We need a hash */
    Parrot_base_classname_hash = pmc_new(NULL, enum_class_PerlHash);

    /* Now start filling the hash */
    register_pmc(Parrot_base_classname_hash, enum_class_Array);
    register_pmc(Parrot_base_classname_hash, enum_class_Boolean);
    register_pmc(Parrot_base_classname_hash, enum_class_PerlUndef);
    register_pmc(Parrot_base_classname_hash, enum_class_PerlInt);
    register_pmc(Parrot_base_classname_hash, enum_class_PerlNum);
    register_pmc(Parrot_base_classname_hash, enum_class_PerlString);
    register_pmc(Parrot_base_classname_hash, enum_class_PerlArray);
    register_pmc(Parrot_base_classname_hash, enum_class_PerlHash);
    register_pmc(Parrot_base_classname_hash, enum_class_Pointer);
    register_pmc(Parrot_base_classname_hash, enum_class_IntQueue);
    register_pmc(Parrot_base_classname_hash, enum_class_Sub);
    register_pmc(Parrot_base_classname_hash, enum_class_Coroutine);
    register_pmc(Parrot_base_classname_hash, enum_class_CSub);
    register_pmc(Parrot_base_classname_hash, enum_class_Continuation);
    register_pmc(Parrot_base_classname_hash, enum_class_MultiArray);
    register_pmc(Parrot_base_classname_hash, enum_class_Key);
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
