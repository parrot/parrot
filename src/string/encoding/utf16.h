/* utf16.h
 *  Copyright (C) 2004-2007, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the header for the utf16 variable-width encoding.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_ENCODING_UTF16_H_GUARD
#define PARROT_ENCODING_UTF16_H_GUARD

/* HEADERIZER BEGIN: src/string/encoding/utf16.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_encoding_utf16_init(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_encoding_utf16_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/string/encoding/utf16.c */

#endif /* PARROT_ENCODING_UTF16_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
