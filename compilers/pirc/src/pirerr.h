/*
 * $Id$
 * Copyright (C) 2008-2009, Parrot Foundation.
 */

#ifndef PARROT_PIR_PIRERR_H_GUARD
#define PARROT_PIR_PIRERR_H_GUARD

#include "piryy.h"

/* HEADERIZER BEGIN: compilers/pirc/src/pirerr.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void panic(
    ARGIN(lexer_state * lexer),
    ARGIN(char const * const message),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_IGNORABLE_RESULT
int /*@alt void@*/
yypirerror(
    yyscan_t yyscanner,
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const message),
    ...)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_panic __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(lexer) \
    || PARROT_ASSERT_ARG(message)
#define ASSERT_ARGS_yypirerror __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(lexer) \
    || PARROT_ASSERT_ARG(message)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/pirc/src/pirerr.c */

#endif /* PARROT_PIR_PIRERR_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

