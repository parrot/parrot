/* ascii.h
 *  Copyright (C) 2004-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the header for the ascii charset functions
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_CHARSET_ASCII_H_GUARD
#define PARROT_CHARSET_ASCII_H_GUARD

/*
 * common functions for ascii-ish charsets
 */

/* HEADERIZER BEGIN: src/charset/ascii.c */

INTVAL ascii_compare( PARROT_INTERP,
    const STRING *lhs /*NN*/,
    const STRING *rhs /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

size_t ascii_compute_hash( PARROT_INTERP,
    const STRING *source_string /*NN*/,
    size_t seed )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__pure__
        __attribute__warn_unused_result__;

INTVAL ascii_cs_index( PARROT_INTERP,
    STRING *source_string /*NN*/,
    STRING *search_string /*NN*/,
    UINTVAL offset )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

INTVAL ascii_cs_rindex( PARROT_INTERP,
    STRING *source_string /*NN*/,
    STRING *search_string /*NN*/,
    UINTVAL offset )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

STRING * ascii_get_graphemes( PARROT_INTERP,
    STRING *source_string,
    UINTVAL offset,
    UINTVAL count )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

STRING * ascii_get_graphemes_inplace( PARROT_INTERP,
    STRING *source_string,
    UINTVAL offset,
    UINTVAL count,
    STRING *dest_string )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

STRING * charset_cvt_ascii_to_binary( PARROT_INTERP,
    STRING *src /*NN*/,
    STRING *dest /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

STRING * charset_cvt_ascii_to_iso_8859_1( PARROT_INTERP,
    STRING *src /*NN*/,
    STRING *dest /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

INTVAL mixed_cs_index( PARROT_INTERP,
    STRING *src /*NN*/,
    STRING *search /*NN*/,
    UINTVAL offs )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

CHARSET * Parrot_charset_ascii_init( PARROT_INTERP )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/charset/ascii.c */

#endif /* PARROT_CHARSET_ASCII_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
