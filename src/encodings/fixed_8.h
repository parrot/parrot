/* fixed_8.h
 *  Copyright (C) 2004-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the header for the 8-bit fixed-width encoding
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_ENCODING_FIXED_8_H_GUARD
#define PARROT_ENCODING_FIXED_8_H_GUARD

/* HEADERIZER BEGIN: src/encodings/fixed_8.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
ENCODING * Parrot_encoding_fixed_8_init(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_encoding_fixed_8_init assert(interp);
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/encodings/fixed_8.c */

#endif /* PARROT_ENCODING_FIXED_8_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
