/*
Copyright (C) 2010, Parrot Foundation.
$Id$
*/

#ifndef PARROT_ENCODING_UCS4_H_GUARD
#define PARROT_ENCODING_UCS4_H_GUARD

/* HEADERIZER BEGIN: src/string/encoding/ucs4.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_encoding_ucs4_init(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_encoding_ucs4_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/string/encoding/ucs4.c */

#endif /* PARROT_ENCODING_UCS4_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
