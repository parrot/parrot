/* builtin.h
 *  Copyright (C) 2005, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the api header for builtins.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_BUILTIN_H_GUARD)
#define PARROT_BUILTIN_H_GUARD

#include "parrot/compiler.h"

void Parrot_init_builtins(Interp *interp);
int  Parrot_is_builtin(Interp *interp, const char *func, const char *sig)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);
PMC* Parrot_find_builtin(Interp *interp, STRING *func)
        __attribute__nonnull__(2);
const char * Parrot_builtin_get_c_namespace(Interp *interp, int bi);
int Parrot_builtin_is_class_method(Interp *interp, int bi);
int Parrot_builtin_is_void(Interp *interp, int bi);

#endif /* PARROT_BUILTIN_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

