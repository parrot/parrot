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

INTVAL ascii_compare( Interp *interp,
    const STRING *lhs /*NN*/,
    const STRING *rhs /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

size_t ascii_compute_hash( Interp *interp,
    const STRING *source_string /*NN*/,
    size_t seed )
        __attribute__nonnull__(2)
        __attribute__pure__
        __attribute__warn_unused_result__;

INTVAL ascii_cs_index( Interp *interp,
    STRING *source_string /*NN*/,
    STRING *search_string /*NN*/,
    UINTVAL offset )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

INTVAL ascii_cs_rindex( Interp *interp,
    STRING *source_string /*NN*/,
    STRING *search_string /*NN*/,
    UINTVAL offset )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

STRING * ascii_get_graphemes( Interp *interp,
    STRING *source_string,
    UINTVAL offset,
    UINTVAL count )
        __attribute__warn_unused_result__;

STRING * ascii_get_graphemes_inplace( Interp *interp,
    STRING *source_string,
    UINTVAL offset,
    UINTVAL count,
    STRING *dest_string )
        __attribute__warn_unused_result__;

STRING * charset_cvt_ascii_to_binary( Interp *interp,
    STRING *src,
    STRING *dest );

STRING * charset_cvt_ascii_to_iso_8859_1( Interp *interp,
    STRING *src,
    STRING *dest );

INTVAL mixed_cs_index( Interp *interp,
    STRING *src /*NN*/,
    STRING *search /*NN*/,
    UINTVAL offs )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

CHARSET * Parrot_charset_ascii_init( Interp *interp );
/* HEADERIZER END: src/charset/ascii.c */

#endif /* PARROT_CHARSET_ASCII_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
