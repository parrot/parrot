/* builtin.h
 *  Copyright (C) 2005-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the API header for builtins.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_BUILTIN_H_GUARD
#define PARROT_BUILTIN_H_GUARD

#include "parrot/compiler.h"

/* HEADERIZER BEGIN: src/builtin.c */

const char * Parrot_builtin_get_c_namespace( int bi )
        __attribute__const__
        __attribute__warn_unused_result__;

int Parrot_builtin_is_class_method( int bi )
        __attribute__const__
        __attribute__warn_unused_result__;

int Parrot_builtin_is_void( int bi )
        __attribute__const__
        __attribute__warn_unused_result__;

PMC* Parrot_find_builtin( PARROT_INTERP, STRING *func /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

void Parrot_init_builtins( PARROT_INTERP )
        __attribute__nonnull__(1);

int Parrot_is_builtin( const char *func /*NN*/, const char *sig /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

/* HEADERIZER END: src/builtin.c */

#endif /* PARROT_BUILTIN_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

