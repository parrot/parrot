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
UINTVAL Parrot_char_digit_value( Interp *interp, UINTVAL character );

PARROT_API
void string_fill_from_buffer( PARROT_INTERP,
    const void *buffer /*NN*/,
    UINTVAL len,
    const char *encoding_name,
    STRING *s /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void string_set_data_directory( PARROT_INTERP, const char *dir )
        __attribute__nonnull__(1);

PARROT_API
Parrot_UInt4 string_unescape_one( PARROT_INTERP,
    UINTVAL *offset /*NN*/,
    STRING *string )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: src/string_primitives.c */

#endif /* PARROT_IN_CORE */
#endif /* PARROT_STRING_PRIMITIVES_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
