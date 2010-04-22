/* iso_8859_1.h
 *  Copyright (C) 2004-2007, Parrot Foundation.
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

/* HEADERIZER BEGIN: src/string/charset/iso-8859-1.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING * charset_cvt_iso_8859_1_to_ascii(PARROT_INTERP, ARGIN(STRING *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_charset_iso_8859_1_init(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_charset_cvt_iso_8859_1_to_ascii \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_Parrot_charset_iso_8859_1_init \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/string/charset/iso-8859-1.c */

#endif /* PARROT_CHARSET_ISO_8859_1_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
