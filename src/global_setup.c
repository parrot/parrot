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
init_world(void)
{
    KEY key;
    string_init();              /* Set up the string subsystem */

    /* Call base vtable class constructor methods! */
    Parrot_Array_class_init(enum_class_Array);
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

    /* Now register the names of the PMCs */

    /* We need a hash */
    Parrot_base_classname_hash = pmc_new(NULL, enum_class_PerlHash);
    Parrot_base_classname_hash->vtable->init(NULL, Parrot_base_classname_hash);

    /* Now start filling the hash */

    /* Array */
    MAKE_KEY_STRING(key, Parrot_base_vtables[enum_class_Array].name(NULL,NULL));
    Parrot_base_classname_hash->vtable->set_integer_keyed(NULL,
                                                          Parrot_base_classname_hash, &key, enum_class_Array);

    MAKE_KEY_STRING(key, Parrot_base_vtables[enum_class_PerlUndef].name(NULL, NULL));
    Parrot_base_classname_hash->vtable->set_integer_keyed(NULL,
                                                          Parrot_base_classname_hash, &key, enum_class_PerlUndef);

    MAKE_KEY_STRING(key, Parrot_base_vtables[enum_class_PerlInt].name(NULL, NULL));
    Parrot_base_classname_hash->vtable->set_integer_keyed(NULL,
                                                          Parrot_base_classname_hash, &key, enum_class_PerlInt);

    MAKE_KEY_STRING(key, Parrot_base_vtables[enum_class_PerlNum].name(NULL, NULL));
    Parrot_base_classname_hash->vtable->set_integer_keyed(NULL,
                                                          Parrot_base_classname_hash, &key, enum_class_PerlNum);

    MAKE_KEY_STRING(key, Parrot_base_vtables[enum_class_PerlString].name(NULL, NULL));
    Parrot_base_classname_hash->vtable->set_integer_keyed(NULL,
                                                          Parrot_base_classname_hash, &key, enum_class_PerlString);

    MAKE_KEY_STRING(key, Parrot_base_vtables[enum_class_PerlArray].name(NULL, NULL));
    Parrot_base_classname_hash->vtable->set_integer_keyed(NULL,
                                                          Parrot_base_classname_hash, &key, enum_class_PerlArray);

    MAKE_KEY_STRING(key, Parrot_base_vtables[enum_class_PerlHash].name(NULL, NULL));
    Parrot_base_classname_hash->vtable->set_integer_keyed(NULL,
                                                          Parrot_base_classname_hash, &key, enum_class_PerlHash);

    MAKE_KEY_STRING(key, Parrot_base_vtables[enum_class_Pointer].name(NULL, NULL));
    Parrot_base_classname_hash->vtable->set_integer_keyed(NULL,
                                                          Parrot_base_classname_hash, &key, enum_class_Pointer);

    MAKE_KEY_STRING(key, Parrot_base_vtables[enum_class_IntQueue].name(NULL, NULL));
    Parrot_base_classname_hash->vtable->set_integer_keyed(NULL,
                                                          Parrot_base_classname_hash, &key, enum_class_IntQueue);

    MAKE_KEY_STRING(key, Parrot_base_vtables[enum_class_Sub].name(NULL, NULL));
    Parrot_base_classname_hash->vtable->set_integer_keyed(NULL,
                                                          Parrot_base_classname_hash, &key, enum_class_Sub);

    MAKE_KEY_STRING(key, Parrot_base_vtables[enum_class_Coroutine].name(NULL, NULL));
    Parrot_base_classname_hash->vtable->set_integer_keyed(NULL,
                                                          Parrot_base_classname_hash, &key, enum_class_Coroutine);

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
