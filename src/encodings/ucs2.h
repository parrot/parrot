/* ucs2.h
 *  Copyright (C) 2004, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the header for the ucs2 fixed-width encoding.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_ENCODING_UCS2_H_GUARD
#define PARROT_ENCODING_UCS2_H_GUARD

/* HEADERIZER BEGIN: src/encodings/ucs2.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
ENCODING * Parrot_encoding_ucs2_init(PARROT_INTERP)
        __attribute__nonnull__(1);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/encodings/ucs2.c */

#endif /* PARROT_ENCODING_UCS2_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
