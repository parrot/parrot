/* unicode.h
 *  Copyright (C) 2005-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the header for the unicode charset functions
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_CHARSET_UNICODE_H_GUARD
#define PARROT_CHARSET_UNICODE_H_GUARD

/*
 * init function
 */


/* HEADERIZER BEGIN: src/charset/unicode.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
const CHARSET * Parrot_charset_unicode_init(PARROT_INTERP)
        __attribute__nonnull__(1);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/charset/unicode.c */


#endif /* PARROT_CHARSET_UNICODE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
