/*
 * $Id$
 * Copyright (C) 2009, Parrot Foundation.
 */

#ifndef PARROT_PIR_PIRCAPI_H_GUARD
#define PARROT_PIR_PIRCAPI_H_GUARD

#include <stdio.h>

/* HEADERIZER BEGIN: compilers/pirc/src/pircapi.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CAN_RETURN_NULL
FILE * open_file(
    ARGIN(char const * const filename),
    ARGIN(char const * const mode))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void parse_file(PARROT_INTERP,
    int flexdebug,
    ARGIN(FILE *infile),
    ARGIN(char * const filename),
    int flags,
    int thr_id,
    unsigned macro_size,
    ARGMOD_NULLOK(char * const outputfile))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(* const outputfile);

void parse_string(PARROT_INTERP,
    ARGIN(char *pirstring),
    int flags,
    int pasminput,
    unsigned macro_size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PackFile_ByteCode * pirc_compile_file(SHIM_INTERP,
    SHIM(const char *filename),
    SHIM(STRING **error_message));

#define ASSERT_ARGS_open_file __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(filename) \
    || PARROT_ASSERT_ARG(mode)
#define ASSERT_ARGS_parse_file __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(infile) \
    || PARROT_ASSERT_ARG(filename)
#define ASSERT_ARGS_parse_string __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pirstring)
#define ASSERT_ARGS_pirc_compile_file __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/pirc/src/pircapi.c */

#endif /* PARROT_PIR_PIRCAPI_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
