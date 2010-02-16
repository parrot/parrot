/*
 * $Id$
 * Copyright (C) 2008-2009, Parrot Foundation.
 */

#ifndef PARROT_PIR_PIRPCC_H_GUARD
#define PARROT_PIR_PIRPCC_H_GUARD

#include "pircompunit.h"
#include "pircompiler.h"

/* HEADERIZER BEGIN: compilers/pirc/src/pirpcc.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void convert_inv_to_instr(
    ARGIN(lexer_state * const lexer),
    invocation * const inv)
        __attribute__nonnull__(1);

void emit_sub_epilogue(ARGIN(lexer_state * const lexer))
        __attribute__nonnull__(1);

void generate_getresults_instr(
    ARGIN(lexer_state * const lexer),
    target * const targetlist)
        __attribute__nonnull__(1);

void generate_parameters_instr(
    ARGIN(lexer_state * const lexer),
    unsigned num_parameters)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_convert_inv_to_instr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_emit_sub_epilogue __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_generate_getresults_instr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_generate_parameters_instr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/pirc/src/pirpcc.c */

#endif /* PARROT_PIR_PIRPCC_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

