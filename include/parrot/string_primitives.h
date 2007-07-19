/* string_funcs.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the api header for the string subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_STRING_PRIMITIVES_H_GUARD
#define PARROT_STRING_PRIMITIVES_H_GUARD

#ifdef PARROT_IN_CORE

/* HEADERIZER BEGIN: src/string_primitives.c */

PARROT_API
PARROT_CONST_FUNCTION
UINTVAL Parrot_char_digit_value( SHIM_INTERP, UINTVAL character );

PARROT_API
void string_set_data_directory( PARROT_INTERP, NOTNULL(const char *dir) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
Parrot_UInt4 string_unescape_one( PARROT_INTERP,
    NOTNULL(UINTVAL *offset),
    NOTNULL(STRING *string) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

/* HEADERIZER END: src/string_primitives.c */

#endif /* PARROT_IN_CORE */
#endif /* PARROT_STRING_PRIMITIVES_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
