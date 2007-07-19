/* iso_8859_1.h
 *  Copyright (C) 2004-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the header for the iso_8859-1 charset functions
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_CHARSET_ISO_8859_1_H_GUARD
#define PARROT_CHARSET_ISO_8859_1_H_GUARD

/* HEADERIZER BEGIN: src/charset/iso-8859-1.c */

PARROT_WARN_UNUSED_RESULT
STRING * charset_cvt_iso_8859_1_to_ascii( PARROT_INTERP,
    NOTNULL(STRING *src),
    NULLOK(STRING *dest) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
const CHARSET * Parrot_charset_iso_8859_1_init( PARROT_INTERP )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/charset/iso-8859-1.c */

#endif /* PARROT_CHARSET_ISO_8859_1_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
