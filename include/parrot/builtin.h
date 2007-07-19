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

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
const char * Parrot_builtin_get_c_namespace( int bi );

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
int Parrot_builtin_is_class_method( int bi );

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
int Parrot_builtin_is_void( int bi );

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_find_builtin( PARROT_INTERP, NOTNULL(STRING *func) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_init_builtins( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
int Parrot_is_builtin( NOTNULL(const char *func), NULLOK(const char *sig) )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/builtin.c */

#endif /* PARROT_BUILTIN_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

