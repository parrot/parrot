/* global_setup.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *      Contains declarations of global data and the functions
 *      that initialize that data.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_GLOBAL_SETUP_H_GUARD
#define PARROT_GLOBAL_SETUP_H_GUARD

#include "parrot/config.h"
#include "parrot/interpreter.h"

/* HEADERIZER BEGIN: src/global_setup.c */

PARROT_API
void Parrot_set_config_hash_internal(
    const unsigned char* parrot_config /*NN*/,
    unsigned int parrot_config_size )
        __attribute__nonnull__(1);

void init_world( PARROT_INTERP )
        __attribute__nonnull__(1);

void parrot_global_setup_2( PARROT_INTERP )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/global_setup.c */

#endif /* PARROT_GLOBAL_SETUP_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
