/*
 * $Id$
 * Copyright (C) 2009, Parrot Foundation.
 */

#ifndef PARROT_PIR_PIROP_H_GUARD
#define PARROT_PIR_PIROP_H_GUARD

#include "pircompiler.h"

/* HEADERIZER BEGIN: compilers/pirc/src/pirop.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_IGNORABLE_RESULT
int get_opinfo(ARGIN(lexer_state * const lexer))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_get_opinfo __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(lexer)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/pirc/src/pirop.c */

#endif /* PARROT_PIR_PIROP_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
